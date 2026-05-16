/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
#include "HdrCodecNdkSample.h"

#include <arpa/inet.h>
#include <chrono>
#include <cstring>
#include <memory>
#include <sys/time.h>
#include <utility>

#include <multimedia/player_framework/native_avcodec_base.h>

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;

int64_t GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = static_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

void VdecFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    cout << "Format Changed" << endl;
}

void VdecInputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    HDRCodecNdkSample* sample = static_cast<HDRCodecNdkSample*>(userData);
    VSignal* signal = sample->decSignal;
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

void VdecOutputDataReady(OH_AVCodec* codec,
                         uint32_t index,
                         OH_AVMemory* data,
                         OH_AVCodecBufferAttr* attr,
                         void* userData)
{
    HDRCodecNdkSample* sample = static_cast<HDRCodecNdkSample*>(userData);
    OH_VideoDecoder_RenderOutputData(codec, index);
    if (attr->flags & AVCODEC_BUFFER_FLAGS_EOS) {
        OH_VideoEncoder_NotifyEndOfStream(sample->venc_);
    } else {
        sample->frameCountDec++;
    }
}

void VdecError(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    HDRCodecNdkSample* sample = static_cast<HDRCodecNdkSample*>(userData);
    sample->errorCount++;
    cout << "Error errorCode=" << errorCode << endl;
}

static void VencError(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    HDRCodecNdkSample* sample = static_cast<HDRCodecNdkSample*>(userData);
    sample->errorCount++;
    cout << "Error errorCode=" << errorCode << endl;
}

static void VencFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    cout << "Format Changed" << endl;
}

static void VencInputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    (void)codec;
    (void)index;
    (void)data;
    (void)userData;
}

static void VencOutputDataReady(OH_AVCodec* codec,
                                uint32_t index,
                                OH_AVMemory* data,
                                OH_AVCodecBufferAttr* attr,
                                void* userData)
{
    HDRCodecNdkSample* sample = static_cast<HDRCodecNdkSample*>(userData);
    OH_VideoEncoder_FreeOutputData(codec, index);
    if (attr->flags & AVCODEC_BUFFER_FLAGS_EOS) {
        sample->isRunning_.store(false);
        sample->cv_.notify_all();
    } else {
        sample->frameCountEnc++;
    }
}

static void clearIntqueue(std::queue<uint32_t>& q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}

static int32_t SendData(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, HDRCodecNdkSample* sample)
{
    uint32_t bufferSize = 0;
    int32_t result = 0;
    OH_AVCodecBufferAttr attr;
    (void)sample->inFile_->read(reinterpret_cast<char*>(&bufferSize), sizeof(uint32_t));
    if (sample->inFile_->eof()) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        return 1;
    }
    if (sample->isFirstFrame_) {
        attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
        sample->isFirstFrame_ = false;
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    }
    int32_t size = OH_AVMemory_GetSize(data);
    uint8_t* avBuffer = OH_AVMemory_GetAddr(data);
    if (avBuffer == nullptr) {
        return 0;
    }
    uint8_t* fileBuffer = new uint8_t[bufferSize];
    if (fileBuffer == nullptr) {
        cout << "Fatal: no memory" << endl;
        return 0;
    }

    (void)sample->inFile_->read(reinterpret_cast<char*>(fileBuffer), bufferSize);
    if (static_cast<int32_t>(bufferSize) > size) {
        delete[] fileBuffer;
        cout << "Fatal: buffer too small" << endl;
        return 0;
    }
    std::copy(fileBuffer, fileBuffer + bufferSize, avBuffer);
    delete[] fileBuffer;
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize;
    attr.offset = 0;
    result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed,error:" << result << endl;
    }
    return 0;
}

static int32_t RepeatCallStartFlush(HDRCodecNdkSample* sample)
{
    int32_t ret = 0;
    sample->REPEAT_START_FLUSH_BEFORE_EOS--;
    ret = OH_VideoEncoder_Flush(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Flush(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    sample->FlushBuffer();
    ret = OH_VideoEncoder_Start(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Start(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    return 0;
}

static int32_t RepeatCallStartStop(HDRCodecNdkSample* sample)
{
    int32_t ret = 0;
    sample->REPEAT_START_STOP_BEFORE_EOS--;
    ret = OH_VideoDecoder_Stop(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoEncoder_Stop(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    sample->FlushBuffer();
    ret = OH_VideoEncoder_Start(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Start(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    return 0;
}

static int32_t RepeatCallStartFlushStop(HDRCodecNdkSample* sample)
{
    int32_t ret = 0;
    sample->REPEAT_START_FLUSH_STOP_BEFORE_EOS--;
    ret = OH_VideoEncoder_Flush(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Flush(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Stop(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoEncoder_Stop(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    sample->FlushBuffer();
    ret = OH_VideoEncoder_Start(sample->venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Start(sample->vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    return 0;
}

static int32_t ResetAndClearBuffers(OH_AVCodec* vdec, OH_AVCodec* venc, VSignal* decSignal)
{
    int32_t ret = OH_VideoDecoder_Reset(vdec);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoEncoder_Reset(venc);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    {
        unique_lock<mutex> decInLock(decSignal->inMutex_);
        clearIntqueue(decSignal->inIdxQueue_);
        std::queue<OH_AVMemory*> empty;
        swap(empty, decSignal->inBufferQueue_);
        decSignal->inCond_.notify_all();
    }
    return 0;
}
} // anonymous namespace

HDRCodecNdkSample::~HDRCodecNdkSample()
{
    Release();
}

int32_t HDRCodecNdkSample::CreateCodec()
{
    decSignal = new VSignal();
    if (decSignal == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (vdec_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (venc_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

void HDRCodecNdkSample::FlushBuffer()
{
    unique_lock<mutex> decInLock(decSignal->inMutex_);
    clearIntqueue(decSignal->inIdxQueue_);
    std::queue<OH_AVMemory*> empty;
    swap(empty, decSignal->inBufferQueue_);
    decSignal->inCond_.notify_all();
    if (inFile_ != nullptr) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
    }
    isFirstFrame_ = true;
    decInLock.unlock();
}

int32_t HDRCodecNdkSample::RepeatCall()
{
    if (REPEAT_START_FLUSH_BEFORE_EOS > 0) {
        return RepeatCallStartFlush(this);
    }
    if (REPEAT_START_STOP_BEFORE_EOS > 0) {
        return RepeatCallStartStop(this);
    }
    if (REPEAT_START_FLUSH_STOP_BEFORE_EOS > 0) {
        return RepeatCallStartFlushStop(this);
    }
    return 0;
}

void HDRCodecNdkSample::InputFunc()
{
    while (isRunning_.load()) {
        int32_t ret = RepeatCall();
        if (ret != 0) {
            cout << "repeat call failed, errcode " << ret << endl;
            errorCount++;
            isRunning_.store(false);
            cv_.notify_all();
            break;
        }
        uint32_t index;
        unique_lock<mutex> lock(decSignal->inMutex_);
        decSignal->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return decSignal->inIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            break;
        }
        index = decSignal->inIdxQueue_.front();
        auto buffer = decSignal->inBufferQueue_.front();
        decSignal->inIdxQueue_.pop();
        decSignal->inBufferQueue_.pop();
        lock.unlock();
        if (SendData(vdec_, index, buffer, this) == 1)
            break;
    }
}

int32_t HDRCodecNdkSample::Configure()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, DEFAULT_PROFILE);
    ret = OH_VideoEncoder_Configure(venc_, format);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    ret = OH_VideoEncoder_GetSurface(venc_, &window);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    ret = OH_VideoDecoder_SetSurface(vdec_, window);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    encCb_.onError = VencError;
    encCb_.onStreamChanged = VencFormatChanged;
    encCb_.onNeedInputData = VencInputDataReady;
    encCb_.onNeedOutputData = VencOutputDataReady;
    ret = OH_VideoEncoder_SetCallback(venc_, encCb_, this);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    decCb_.onError = VdecError;
    decCb_.onStreamChanged = VdecFormatChanged;
    decCb_.onNeedInputData = VdecInputDataReady;
    decCb_.onNeedOutputData = VdecOutputDataReady;
    ret = OH_VideoDecoder_SetCallback(vdec_, decCb_, this);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t HDRCodecNdkSample::ReConfigure()
{
    int32_t ret = ResetAndClearBuffers(vdec_, venc_, decSignal);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ret = OH_VideoDecoder_Configure(vdec_, format);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, DEFAULT_PROFILE);
    ret = OH_VideoEncoder_Configure(venc_, format);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    OH_AVFormat_Destroy(format);
    ret = OH_VideoEncoder_GetSurface(venc_, &window);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_SetSurface(vdec_, window);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    encCb_.onError = VencError;
    encCb_.onStreamChanged = VencFormatChanged;
    encCb_.onNeedInputData = VencInputDataReady;
    encCb_.onNeedOutputData = VencOutputDataReady;
    ret = OH_VideoEncoder_SetCallback(venc_, encCb_, this);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    decCb_.onError = VdecError;
    decCb_.onStreamChanged = VdecFormatChanged;
    decCb_.onNeedInputData = VdecInputDataReady;
    decCb_.onNeedOutputData = VdecOutputDataReady;
    ret = OH_VideoDecoder_SetCallback(vdec_, decCb_, this);
    return ret;
}

int32_t HDRCodecNdkSample::Start()
{
    int32_t ret = 0;
    inFile_ = make_shared<ifstream>();
    inFile_->open(INP_DIR.c_str(), ios::in | ios::binary);
    if (!inFile_->is_open()) {
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    isFirstFrame_ = true;
    isRunning_.store(true);
    ret = OH_VideoEncoder_Start(venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    inputLoop_ = make_unique<thread>(&HDRCodecNdkSample::InputFunc, this);
    if (inputLoop_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    return 0;
}

void HDRCodecNdkSample::StopInloop()
{
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        unique_lock<mutex> lock(decSignal->inMutex_);
        clearIntqueue(decSignal->inIdxQueue_);
        isRunning_.store(false);
        decSignal->inCond_.notify_all();
        lock.unlock();
        inputLoop_->join();
        inputLoop_.reset();
    }
}

void HDRCodecNdkSample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void HDRCodecNdkSample::WaitForEos()
{
    unique_lock<mutex> lock(mtx);
    bool eosSeen = cv_.wait_for(lock, std::chrono::seconds(6), [this]() { return !(isRunning_.load()); });
    timedOut = !eosSeen;
    isRunning_.store(false);
    lock.unlock();
    StopInloop();
    if (vdec_ != nullptr) {
        OH_VideoDecoder_Stop(vdec_);
    }
    if (venc_ != nullptr) {
        OH_VideoEncoder_Stop(venc_);
    }
    ReleaseInFile();
}

int32_t HDRCodecNdkSample::Release()
{
    if (vdec_ != nullptr) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
    if (venc_ != nullptr) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (decSignal != nullptr) {
        delete decSignal;
        decSignal = nullptr;
    }
    return 0;
}
