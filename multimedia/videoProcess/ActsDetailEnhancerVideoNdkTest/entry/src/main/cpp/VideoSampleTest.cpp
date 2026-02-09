/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/VideoSampleTest.h"
#include "include/OhosCommonTest.h"
#include <chrono>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <multimedia/video_processing_engine/video_processing_types.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <unistd.h>

using namespace OHOS;
using namespace std;
using std::mutex;

namespace {
constexpr std::chrono::seconds STOP_TIMEOUT(10);
const int INPUT_FRAME_NUMBER = 10;
const int QUEUE_BUFFER_SIZE = 5;
} // namespace

void OnFrameAvailable(void* context)
{
    auto* obj = static_cast<VideoSample*>(context);
    obj->OnBufferAvailable();
}

static void OnError(OH_VideoProcessing* videoProcessor, VideoProcessing_ErrorCode error, void* userData)
{
    VideoSample* sample = reinterpret_cast<VideoSample*>(userData);
    sample->UpdateErrorCount();
}

static void OnState(OH_VideoProcessing* videoProcessor, VideoProcessing_State state, void* userData)
{
    VideoSample* sample = reinterpret_cast<VideoSample*>(userData);
    if (state == VIDEO_PROCESSING_STATE_STOPPED) {
        sample->NotifyCv();
    }
}

static void OnNewOutputBufferCall(OH_VideoProcessing* videoProcessor, uint32_t index, void* userData)
{
    VideoSample* sample = reinterpret_cast<VideoSample*>(userData);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_RenderOutputBuffer(videoProcessor, index);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        sample->UpdateErrorCount();
    }
}

VideoSample::VideoSample() {}

VideoSample::~VideoSample()
{
    if (callback_ || callbackImpl_) {
        OH_VideoProcessingCallback_Destroy(callback_);
        callback_ = nullptr;
    }
    if (rect_) {
        delete rect_;
        rect_ = nullptr;
    }
    OH_VideoProcessing_Destroy(videoProcessor_);
    if (customImage_) {
        for (; !inputBufferAvilQue_.empty(); inputBufferAvilQue_.pop()) {
            OH_NativeImage_ReleaseNativeWindowBuffer(customImage_, inputBufferAvilQue_.front(), -1);
        }
        OH_NativeImage_UnsetOnFrameAvailableListener(customImage_);
    }
    customImage_ = nullptr;
    OH_VideoProcessing_DeinitializeEnvironment();
}

int32_t VideoSample::InitVideoSample(VideoProcessParam param)
{
    OH_VideoProcessing_InitializeEnvironment();
    param_ = param;
    OH_VideoProcessing_Create(&videoProcessor_, VIDEO_PROCESSING_TYPE_DETAIL_ENHANCER);
    customImage_ = OH_ConsumerSurface_Create();
    outWindow_ = OH_NativeImage_AcquireNativeWindow(customImage_);
    OH_OnFrameAvailableListener listener;
    listener.onFrameAvailable = &OnFrameAvailable;
    listener.context = this;
    OH_NativeImage_SetOnFrameAvailableListener(customImage_, listener);

    (void)OH_NativeWindow_NativeWindowHandleOpt(outWindow_, SET_BUFFER_GEOMETRY, param_.outWidth, param_.outHeight);
    (void)OH_NativeWindow_NativeWindowHandleOpt(outWindow_,
                                                SET_USAGE,
                                                NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE |
                                                    NATIVEBUFFER_USAGE_MEM_DMA | NATIVEBUFFER_USAGE_HW_RENDER);
    (void)OH_NativeWindow_NativeWindowHandleOpt(outWindow_, SET_FORMAT, param_.outFmt);
    OH_VideoProcessing_SetSurface(videoProcessor_, outWindow_);
    OH_VideoProcessing_GetSurface(videoProcessor_, &inWindow_);
    SetInputWindowParam();
    OH_VideoProcessingCallback_Create(&callback_);
    OH_VideoProcessingCallback_BindOnError(callback_, OnError);
    OH_VideoProcessingCallback_BindOnState(callback_, OnState);
    OH_VideoProcessingCallback_BindOnNewOutputBuffer(callback_, OnNewOutputBufferCall);
    OH_VideoProcessing_RegisterCallback(videoProcessor_, callback_, this);
    OH_AVFormat* parameter = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(parameter, VIDEO_DETAIL_ENHANCER_PARAMETER_KEY_QUALITY_LEVEL, qualityLevel_);
    OH_VideoProcessing_SetParameter(videoProcessor_, parameter);
    return VIDEO_PROCESSING_SUCCESS;
}

void VideoSample::SetInputWindowParam()
{
    (void)OH_NativeWindow_NativeWindowHandleOpt(inWindow_, SET_BUFFER_GEOMETRY, param_.inWidth, param_.inHeight);
    (void)OH_NativeWindow_NativeWindowHandleOpt(inWindow_,
                                                SET_USAGE,
                                                NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE |
                                                    NATIVEBUFFER_USAGE_MEM_DMA | NATIVEBUFFER_USAGE_HW_RENDER);
    (void)OH_NativeWindow_NativeWindowHandleOpt(inWindow_, SET_FORMAT, param_.inFmt);

    rect_ = new Region::Rect();
    rect_->x = 0;
    rect_->y = 0;
    rect_->w = param_.inWidth;
    rect_->h = param_.inHeight;
    region_.rects = rect_;
}

int32_t VideoSample::InputFunc()
{
    for (int i = 0; i < INPUT_FRAME_NUMBER; i++) {
        int fenceFd = -1;
        OHNativeWindowBuffer* ohNativeWindowBuffer;
        OH_NativeWindow_NativeWindowRequestBuffer(inWindow_, &ohNativeWindowBuffer, &fenceFd);
        if (fenceFd > 0) {
            close(fenceFd);
        }
        OH_NativeBuffer* nativeBuffer = nullptr;
        OH_NativeBuffer_FromNativeWindowBuffer(ohNativeWindowBuffer, &nativeBuffer);
        OH_NativeWindow_NativeWindowFlushBuffer(inWindow_, ohNativeWindowBuffer, -1, region_);
    }
    return 0;
}

int32_t VideoSample::StartProcess()
{
    OH_VideoProcessing_Start(videoProcessor_);
    inputLoop_ = make_unique<thread>(&VideoSample::InputFunc, this);
    return VIDEO_PROCESSING_SUCCESS;
}

int32_t VideoSample::WaitAndStopSample()
{
    inputLoop_->join();
    int32_t ret = OH_VideoProcessing_Stop(videoProcessor_);
    unique_lock<mutex> lock(mutex_);
    if (cv_.wait_for(lock, STOP_TIMEOUT) == std::cv_status::timeout) {
        std::cout << "waiting stop state timeout" << std::endl;
    }
    return ret;
}

void VideoSample::OnBufferAvailable()
{
    OHPrintf("debug,OnBufferAvailable");
    unique_lock<mutex> lock(mutexListener_);
    OHNativeWindowBuffer* buffer;
    int32_t fence = -1;
    OH_NativeImage_AcquireNativeWindowBuffer(customImage_, &buffer, &fence);
    inputBufferAvilQue_.push(buffer);
    lock.unlock();
}

void VideoSample::UpdateErrorCount()
{
    errCount_++;
}

void VideoSample::SetQualityLevel(VideoDetailEnhancer_QualityLevel level)
{
    qualityLevel_ = level;
}

void VideoSample::SetImplLoader(bool isImpl)
{
    isImpl_ = isImpl;
}

void VideoSample::NotifyCv()
{
    cv_.notify_all();
}