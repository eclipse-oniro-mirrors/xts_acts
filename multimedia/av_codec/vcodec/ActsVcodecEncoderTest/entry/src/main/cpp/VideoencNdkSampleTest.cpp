/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <arpa/inet.h>
#include <sys/time.h>
#include <utility>
#include <random>
#include "videoenc_sample.h"
#include <native_buffer/native_buffer.h>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "VcodecEncoderTest"

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t FRAME_INTERVAL = 16666;
constexpr uint32_t MAX_PIXEL_FMT = 5;
constexpr uint8_t RGBA_SIZE = 4;
constexpr uint32_t IDR_FRAME_INTERVAL = 10;
constexpr uint32_t TEST_FRAME_COUNT = 25;
constexpr uint32_t DOUBLE = 2;
// sptr<Surface> cs = nullptr;  // Surface API not available in current SDK
// sptr<Surface> ps = nullptr;  // Surface API not available in current SDK
VEncNdkSample *enc_sample = nullptr;

void clearIntqueue(std::queue<uint32_t> &q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}

void clearBufferqueue(std::queue<OH_AVCodecBufferAttr> &q)
{
    std::queue<OH_AVCodecBufferAttr> empty;
    swap(empty, q);
}
} // namespace

VEncNdkSample::~VEncNdkSample()
{
    if (SURF_INPUT && nativeWindow) {
        OH_NativeWindow_DestroyNativeWindow(nativeWindow);
        nativeWindow = nullptr;
    }
    Release();
}

static void VencError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

static void VencFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    cout << "Format Changed" << endl;
}

static void VencInputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    if (enc_sample->isFlushing_) {
        return;
    }
    if (enc_sample->inputCallbackFlush) {
        enc_sample->Flush();
        cout << "OH_VideoEncoder_Flush end" << endl;
        enc_sample->isRunning_.store(false);
        enc_sample->signal_->inCond_.notify_all();
        enc_sample->signal_->outCond_.notify_all();
        return;
    }
    if (enc_sample->inputCallbackStop) {
        OH_VideoEncoder_Stop(codec);
        cout << "OH_VideoEncoder_Stop end" << endl;
        enc_sample->isRunning_.store(false);
        enc_sample->signal_->inCond_.notify_all();
        enc_sample->signal_->outCond_.notify_all();
        return;
    }
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void VencOutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                                void *userData)
{
    if (enc_sample->isFlushing_) {
        return;
    }
    if (enc_sample->outputCallbackFlush) {
        enc_sample->Flush();
        cout << "OH_VideoEncoder_Flush end" << endl;
        enc_sample->isRunning_.store(false);
        enc_sample->signal_->inCond_.notify_all();
        enc_sample->signal_->outCond_.notify_all();
        return;
    }
    if (enc_sample->outputCallbackStop) {
        OH_VideoEncoder_Stop(codec);
        cout << "OH_VideoEncoder_Stop end" << endl;
        enc_sample->isRunning_.store(false);
        enc_sample->signal_->inCond_.notify_all();
        enc_sample->signal_->outCond_.notify_all();
        return;
    }
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}
int64_t VEncNdkSample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = (int64_t)now.tv_sec * NANOS_IN_SECOND + now.tv_nsec;

    return nanoTime / NANOS_IN_MICRO;
}

int32_t VEncNdkSample::ConfigureVideoEncoder()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 1);
    if (DEFAULT_BITRATE_MODE == CQ) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, DEFAULT_BITRATE_MODE);
    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncNdkSample::ConfigureVideoEncoder_Temporal(int32_t temporal_gop_size)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIX_FMT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, DEFAULT_KEY_FRAME_INTERVAL);

    if (TEMPORAL_CONFIG) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, temporal_gop_size);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE,
            ADJACENT_REFERENCE);
    }
    if (TEMPORAL_ENABLE) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
    }
    if (TEMPORAL_JUMP_MODE) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, JUMP_REFERENCE);
    }
    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncNdkSample::ConfigureVideoEncoder_fuzz(int32_t data)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, data);
    DEFAULT_WIDTH = data;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, data);
    DEFAULT_HEIGHT = data;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, data % MAX_PIXEL_FMT);
    double frameRate = data;
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, frameRate);

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, data);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, data);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, data);

    int ret = OH_VideoEncoder_Configure(venc_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VEncNdkSample::SetVideoEncoderCallback()
{
    signal_ = new VEncSignal();
    if (signal_ == nullptr) {
        cout << "Failed to new VEncSignal" << endl;
        return AV_ERR_UNKNOWN;
    }

    cb_.onError = VencError;
    cb_.onStreamChanged = VencFormatChanged;
    cb_.onNeedInputData = VencInputDataReady;
    cb_.onNeedOutputData = VencOutputDataReady;
    return OH_VideoEncoder_SetCallback(venc_, cb_, static_cast<void *>(signal_));
}

int32_t VEncNdkSample::state_EOS()
{
    if (signal_ == nullptr) {
        return AV_ERR_INVALID_STATE;
    }
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [this]() { return signal_->inIdxQueue_.size() > 0; });
    uint32_t index = signal_->inIdxQueue_.front();
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    lock.unlock();
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return OH_VideoEncoder_PushInputData(venc_, index, attr);
}
void VEncNdkSample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void VEncNdkSample::StopInloop()
{
    if (inputLoop_ != nullptr && inputLoop_->joinable() && signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->inMutex_);
        clearIntqueue(signal_->inIdxQueue_);
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        lock.unlock();

        inputLoop_->join();
        inputLoop_ = nullptr;
    }
}

void VEncNdkSample::testApi()
{
    OH_VideoEncoder_GetSurface(venc_, &nativeWindow);
    OH_VideoEncoder_Prepare(venc_);
    OH_VideoEncoder_GetInputDescription(venc_);
    OH_VideoEncoder_Start(venc_);
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_REQUEST_I_FRAME, 1);
    OH_VideoEncoder_SetParameter(venc_, format);
    OH_VideoEncoder_NotifyEndOfStream(venc_);
    OH_VideoEncoder_GetOutputDescription(venc_);
    OH_AVFormat_Destroy(format);
    OH_VideoEncoder_Flush(venc_);
    bool isValid = false;
    OH_VideoEncoder_IsValid(venc_, &isValid);
    OH_VideoEncoder_Stop(venc_);
    OH_VideoEncoder_Reset(venc_);
}

int32_t VEncNdkSample::CreateSurface()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::CreateSurface: START");
    int32_t ret = 0;
    ret = OH_VideoEncoder_GetSurface(venc_, &nativeWindow);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::CreateSurface: OH_VideoEncoder_GetSurface failed: %{public}d", ret);
        cout << "OH_VideoEncoder_GetSurface fail" << endl;
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::CreateSurface: GetSurface success");
    ret = AV_ERR_OK;
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::CreateSurface: SET_FORMAT failed: %{public}d", ret);
        cout << "NativeWindowHandleOpt SET_FORMAT fail" << endl;
        return ret;
    }
    OH_LOG_INFO(LOG_APP,
        "VEncNdkSample::CreateSurface: Setting buffer geometry %{public}dx%{public}d",
        DEFAULT_WIDTH, DEFAULT_HEIGHT);
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, DEFAULT_WIDTH, DEFAULT_HEIGHT);
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::CreateSurface: SET_BUFFER_GEOMETRY failed: %{public}d", ret);
        cout << "NativeWindowHandleOpt SET_BUFFER_GEOMETRY fail" << endl;
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::CreateSurface: SUCCESS");
    return AV_ERR_OK;
}

void VEncNdkSample::GetStride()
{
    OH_AVFormat *format = OH_VideoEncoder_GetInputDescription(venc_);
    int32_t inputStride = 0;
    OH_AVFormat_GetIntValue(format, "stride", &inputStride);
    stride_ = inputStride;
    OH_AVFormat_Destroy(format);
}

int32_t VEncNdkSample::OpenFile()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::OpenFile: START");
    if (fuzzMode) {
        OH_LOG_INFO(LOG_APP, "VEncNdkSample::OpenFile: fuzzMode enabled, skipping file open");
        return AV_ERR_OK;
    }
    int32_t ret = AV_ERR_OK;
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::OpenFile: Creating ifstream");
    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::OpenFile: Failed to create ifstream");
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        return AV_ERR_UNKNOWN;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::OpenFile: Opening file: %{public}s", INP_DIR);
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::OpenFile: File open FAILED: %{public}s", INP_DIR);
        cout << "file open fail" << endl;
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::OpenFile: File opened successfully");
    return ret;
}

int32_t VEncNdkSample::CreateEncoderThreads()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: File opened, creating input thread...");
    if (SURF_INPUT) {
        inputLoop_ = make_unique<thread>(&VEncNdkSample::InputFuncSurface, this);
    } else {
        inputLoop_ = make_unique<thread>(&VEncNdkSample::InputFunc, this);
    }
    if (inputLoop_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::StartVideoEncoder: Failed to create input thread");
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Input thread created, creating output thread...");
    outputLoop_ = make_unique<thread>(&VEncNdkSample::OutputFunc, this);
    if (outputLoop_ == nullptr) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::StartVideoEncoder: Failed to create output thread");
        isRunning_.store(false);
        (void)OH_VideoEncoder_Stop(venc_);
        ReleaseInFile();
        StopInloop();
        Release();
        return AV_ERR_UNKNOWN;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Both threads created successfully");
    return AV_ERR_OK;
}

int32_t VEncNdkSample::StartVideoEncoder()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: START, SURF_INPUT=%{public}d", SURF_INPUT);
    isRunning_.store(true);
    int32_t ret = 0;
    if (SURF_INPUT) {
        OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Creating surface...");
        ret = CreateSurface();
        if (ret != AV_ERR_OK) {
            OH_LOG_ERROR(LOG_APP, "VEncNdkSample::StartVideoEncoder: CreateSurface failed: %{public}d", ret);
            return ret;
        }
        OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Surface created successfully");
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Starting encoder...");
    ret = OH_VideoEncoder_Start(venc_);
    GetStride();
    if (ret != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::StartVideoEncoder: OH_VideoEncoder_Start failed: %{public}d", ret);
        cout << "Failed to start codec" << endl;
        isRunning_.store(false);
        if (signal_ != nullptr) {
            signal_->inCond_.notify_all();
            signal_->outCond_.notify_all();
        }
        return ret;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::StartVideoEncoder: Encoder started, opening file...");
    if (OpenFile() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::StartVideoEncoder: OpenFile FAILED, returning AV_ERR_UNKNOWN");
        return AV_ERR_UNKNOWN;
    }
    return CreateEncoderThreads();
}

int32_t VEncNdkSample::CreateVideoEncoder(const char *codecName)
{
    venc_ = OH_VideoEncoder_CreateByName(codecName);
    enc_sample = this;
    static std::random_device rd;
    static std::mt19937 gen(rd());
    static std::uniform_int_distribution<uint32_t> dis(0, TEST_FRAME_COUNT - 1);
    randomEos = dis(gen);
    return venc_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

void VEncNdkSample::WaitForEOS()
{
    if (inputLoop_)
        inputLoop_->join();
    if (outputLoop_)
        outputLoop_->join();
    inputLoop_ = nullptr;
    outputLoop_ = nullptr;
}

uint32_t VEncNdkSample::ReturnZeroIfEOS(uint32_t expectedSize)
{
    if (inFile_->gcount() != (expectedSize)) {
        cout << "no more data" << endl;
        return 0;
    }
    return 1;
}

uint32_t VEncNdkSample::ReadOneFrameYUV420SP(uint8_t *dst)
{
    uint8_t *start = dst;
    // copy Y - use DEFAULT_WIDTH for compact layout, not stride_
    for (uint32_t i = 0; i < DEFAULT_HEIGHT; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH))
            return 0;
        dst += DEFAULT_WIDTH;  // Use DEFAULT_WIDTH, not stride_
    }
    // copy UV - use DEFAULT_WIDTH for compact layout, not stride_
    for (uint32_t i = 0; i < DEFAULT_HEIGHT / SAMPLE_RATIO; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH);
        if (!ReturnZeroIfEOS(DEFAULT_WIDTH))
            return 0;
        dst += DEFAULT_WIDTH;  // Use DEFAULT_WIDTH, not stride_
    }
    return dst - start;
}

void VEncNdkSample::ReadOneFrameRGBA8888(uint8_t *dst)
{
    for (uint32_t i = 0; i < DEFAULT_HEIGHT; i++) {
        inFile_->read(reinterpret_cast<char *>(dst), DEFAULT_WIDTH * RGBA_SIZE);
        dst += DEFAULT_WIDTH * RGBA_SIZE;  // Use DEFAULT_WIDTH * RGBA_SIZE, not stride_
    }
}

uint32_t VEncNdkSample::FlushSurf(OHNativeWindowBuffer *ohNativeWindowBuffer, OH_NativeBuffer *nativeBuffer)
{
    struct Region region;
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0;
    rect->y = 0;
    rect->w = DEFAULT_WIDTH;
    rect->h = DEFAULT_HEIGHT;
    region.rects = rect;
    
    if (nativeBuffer != nullptr) {
        OH_LOG_INFO(LOG_APP, "VEncNdkSample::FlushSurf: Unmapping nativeBuffer");
        int32_t err = OH_NativeBuffer_Unmap(nativeBuffer);
        if (err != 0) {
            OH_LOG_ERROR(LOG_APP, "VEncNdkSample::FlushSurf: OH_NativeBuffer_Unmap failed: %{public}d", err);
            cout << "OH_NativeBuffer_Unmap failed" << endl;
            delete rect;
            return 1;
        }
        OH_LOG_INFO(LOG_APP, "VEncNdkSample::FlushSurf: Unmap success");
    }
    
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::FlushSurf: Flushing buffer");
    int32_t err = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, ohNativeWindowBuffer, -1, region);
    delete rect;
    if (err != 0) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::FlushSurf: FlushBuffer failed: %{public}d", err);
        cout << "FlushBuffer failed" << endl;
        return 1;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::FlushSurf: Success");
    return 0;
}

int32_t VEncNdkSample::RequestWindowBuffer(OHNativeWindowBuffer *&ohNativeWindowBuffer)
{
    if (nativeWindow == nullptr) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::InputFuncSurface: nativeWindow is nullptr, exiting");
        cout << "nativeWindow == nullptr" << endl;
        return -1;
    }
    int fenceFd = -1;
    int32_t err = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &ohNativeWindowBuffer, &fenceFd);
    if (err != 0) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::InputFuncSurface: RequestBuffer failed, GSError=%{public}d", err);
        cout << "RequestBuffer failed, GSError=" << err << endl;
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::InputFuncSurface: RequestBuffer success, fenceFd=%{public}d", fenceFd);
    if (fenceFd > 0) {
        close(fenceFd);
    }
    return 0;
}

int32_t VEncNdkSample::GetBufferAddress(OHNativeWindowBuffer *ohNativeWindowBuffer,
    OH_NativeBuffer *&nativeBuffer, void *&virAddr, int &stride)
{
    BufferHandle *bufferHandle = OH_NativeWindow_GetBufferHandleFromNative(ohNativeWindowBuffer);
    if (bufferHandle == nullptr) {
        OH_LOG_ERROR(LOG_APP, "VEncNdkSample::InputFuncSurface: GetBufferHandleFromNative failed");
        cout << "GetBufferHandleFromNative failed" << endl;
        isRunning_.store(false);
        return -1;
    }
    stride = bufferHandle->stride;
    virAddr = bufferHandle->virAddr;
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::InputFuncSurface: stride=%{public}d, virAddr=%{public}p", stride, virAddr);
    if (virAddr == nullptr) {
        OH_LOG_INFO(LOG_APP,
            "VEncNdkSample::InputFuncSurface: virAddr is nullptr, using OH_NativeBuffer_Map");
        int32_t convertRet = OH_NativeBuffer_FromNativeWindowBuffer(ohNativeWindowBuffer, &nativeBuffer);
        if (convertRet != 0 || nativeBuffer == nullptr) {
            OH_LOG_ERROR(LOG_APP,
                "VEncNdkSample::InputFuncSurface: OH_NativeBuffer_FromNativeWindowBuffer failed: %{public}d",
                convertRet);
            cout << "OH_NativeBuffer_FromNativeWindowBuffer failed" << endl;
            isRunning_.store(false);
            return -1;
        }
        int32_t ret = OH_NativeBuffer_Map(nativeBuffer, &virAddr);
        if (ret != 0 || virAddr == nullptr) {
            OH_LOG_ERROR(LOG_APP,
                "VEncNdkSample::InputFuncSurface: OH_NativeBuffer_Map failed: %{public}d", ret);
            cout << "OH_NativeBuffer_Map failed" << endl;
            isRunning_.store(false);
            return -1;
        }
        OH_LOG_INFO(LOG_APP,
            "VEncNdkSample::InputFuncSurface: OH_NativeBuffer_Map success, virAddr=%{public}p", virAddr);
    }
    return 0;
}

int32_t VEncNdkSample::InitSurfaceBuffer(OHNativeWindowBuffer *&ohNativeWindowBuffer,
    OH_NativeBuffer *&nativeBuffer, uint8_t *&dst, int &stride)
{
    if (RequestWindowBuffer(ohNativeWindowBuffer) != 0) {
        return -1;
    }
    void *virAddr = nullptr;
    if (GetBufferAddress(ohNativeWindowBuffer, nativeBuffer, virAddr, stride) != 0) {
        return -1;
    }
    dst = (uint8_t *)virAddr;
    if (dst == nullptr || stride < static_cast<int>(DEFAULT_WIDTH)) {
        OH_LOG_ERROR(LOG_APP,
            "VEncNdkSample::InputFuncSurface: invalid dst=%{public}p or stride=%{public}d", dst, stride);
        cout << "invalid va or stride=" << stride << endl;
        isRunning_.store(false);
        return -1;
    }
    stride_ = stride;
    return 0;
}

int32_t VEncNdkSample::ProcessSurfaceFrame(uint8_t *dst, OHNativeWindowBuffer *ohNativeWindowBuffer,
    OH_NativeBuffer *nativeBuffer)
{
    if (!ReadOneFrameYUV420SP(dst)) {
        int32_t err = OH_VideoEncoder_NotifyEndOfStream(venc_);
        if (err != 0) {
            cout << "OH_VideoEncoder_NotifyEndOfStream failed" << endl;
        }
        return -1;
    }
    if (FlushSurf(ohNativeWindowBuffer, nativeBuffer)) {
        return -1;
    }
    return 0;
}

void VEncNdkSample::InputFuncSurface()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::InputFuncSurface: Thread started");
    while (!false) {
        if (outputCallbackFlush || outputCallbackStop) {
            OH_LOG_INFO(LOG_APP, "VEncNdkSample::InputFuncSurface: outputCallback triggered, notifying EOS");
            OH_VideoEncoder_NotifyEndOfStream(venc_);
            break;
        }
        OHNativeWindowBuffer *ohNativeWindowBuffer = nullptr;
        OH_NativeBuffer *nativeBuffer = nullptr;
        uint8_t *dst = nullptr;
        int stride = 0;
        if (InitSurfaceBuffer(ohNativeWindowBuffer, nativeBuffer, dst, stride) != 0) {
            break;
        }
        OH_LOG_INFO(LOG_APP,
            "VEncNdkSample::InputFuncSurface: Buffer ready, dst=%{public}p, stride=%{public}d", dst, stride);
        if (ProcessSurfaceFrame(dst, ohNativeWindowBuffer, nativeBuffer) != 0) {
            break;
        }
        usleep(FRAME_INTERVAL);
    }
}

void VEncNdkSample::Flush_buffer()
{
    if (signal_ == nullptr) {
        return;
    }
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVMemory *> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

void VEncNdkSample::RepeatStartBeforeEOS()
{
    if (REPEAT_START_FLUSH_BEFORE_EOS > 0) {
        REPEAT_START_FLUSH_BEFORE_EOS--;
        OH_VideoEncoder_Flush(venc_);
        Flush_buffer();
        OH_VideoEncoder_Start(venc_);
    }

    if (REPEAT_START_STOP_BEFORE_EOS > 0) {
        REPEAT_START_STOP_BEFORE_EOS--;
        OH_VideoEncoder_Stop(venc_);
        Flush_buffer();
        OH_VideoEncoder_Start(venc_);
    }
}

bool VEncNdkSample::RandomEOS(uint32_t index)
{
    if (enable_random_eos && randomEos == frameCount) {
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        OH_VideoEncoder_PushInputData(venc_, index, attr);
        cout << "random eos" << endl;
        frameCount++;
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inIdxQueue_.pop();
        signal_->inBufferQueue_.pop();
        return true;
    }
    return false;
}

void VEncNdkSample::AutoSwitchParam()
{
    int64_t currentBitrate = DEFAULT_BITRATE;
    double currentFrameRate = DEFAULT_FRAME_RATE;
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetBitrate) {
            currentBitrate = DEFAULT_BITRATE >> 1;
            cout<<"switch bitrate "<< currentBitrate;
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, currentBitrate);
            SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        }
        if (needResetFrameRate) {
            currentFrameRate = DEFAULT_FRAME_RATE * DOUBLE;
            cout<< "switch framerate" << currentFrameRate << endl;
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, currentFrameRate);
            SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        }
        OH_AVFormat_Destroy(format);
    }
    if (frameCount == switchParamsTimeSec * (int32_t)DEFAULT_FRAME_RATE * DOUBLE) {
        OH_AVFormat *format = OH_AVFormat_Create();
        if (needResetBitrate) {
            currentBitrate = DEFAULT_BITRATE << 1;
            cout<<"switch bitrate "<< currentBitrate;
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, currentBitrate);
        }
        if (needResetFrameRate) {
            currentFrameRate = DEFAULT_FRAME_RATE / DOUBLE;
            cout<< "switch framerate" << currentFrameRate << endl;
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, currentFrameRate);
            SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        }
        SetParameter(format) == AV_ERR_OK ? (0) : (errCount++);
        OH_AVFormat_Destroy(format);
    }
}

void VEncNdkSample::SetEOS(uint32_t index)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int32_t res = OH_VideoEncoder_PushInputData(venc_, index, attr);
    cout << "OH_VideoEncoder_PushInputData    EOS   res: " << res << endl;
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
}

void VEncNdkSample::SetForceIDR()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_REQUEST_I_FRAME, 1);
    OH_VideoEncoder_SetParameter(venc_, format);
    OH_AVFormat_Destroy(format);
}

int32_t VEncNdkSample::PushData(OH_AVMemory *buffer, uint32_t index, int32_t &result)
{
    int32_t res = -2;
    OH_AVCodecBufferAttr attr;
    uint8_t *fileBuffer = OH_AVMemory_GetAddr(buffer);
    if (fileBuffer == nullptr) {
        cout << "Fatal: no memory" << endl;
        return -1;
    }
    int32_t size = OH_AVMemory_GetSize(buffer);
    if (DEFAULT_PIX_FMT == AV_PIXEL_FORMAT_RGBA) {
        if (size < DEFAULT_HEIGHT * stride_) {
            return -1;
        }
        ReadOneFrameRGBA8888(fileBuffer);
        attr.size = stride_ * DEFAULT_HEIGHT;
    } else {
        if (size < (DEFAULT_HEIGHT * stride_ + (DEFAULT_HEIGHT * stride_ / DOUBLE))) {
            return -1;
        }
        attr.size = ReadOneFrameYUV420SP(fileBuffer);
    }
    if (repeatRun && inFile_->eof()) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        encode_count++;
        cout << "repeat"<< "   encode_count:" << encode_count << endl;
        return -1;
    }
    if (inFile_->eof()) {
        SetEOS(index);
        return 0;
    }
    attr.pts = GetSystemTimeUs();
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (enableForceIDR && (frameCount % IDR_FRAME_INTERVAL == 0)) {
        SetForceIDR();
    }
    result = OH_VideoEncoder_PushInputData(venc_, index, attr);
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    return res;
}

int32_t VEncNdkSample::CheckResult(bool isRandomEosSuccess, int32_t pushResult)
{
    if (isRandomEosSuccess) {
        if (pushResult == 0) {
            errCount = errCount + 1;
            cout << "push input after eos should be failed!  pushResult:" << pushResult << endl;
        }
        return -1;
    } else if (pushResult != 0) {
        errCount = errCount + 1;
        cout << "push input data failed, error:" << pushResult << endl;
        return -1;
    }
    return 0;
}

void VEncNdkSample::InputDataNormal(bool &runningFlag, uint32_t index, OH_AVMemory *buffer)
{
    if (!inFile_->eof()) {
        bool isRandomEosSuccess = RandomEOS(index);
        if (isRandomEosSuccess) {
            runningFlag = false;
            return;
        }
        int32_t pushResult = 0;
        int32_t ret = PushData(buffer, index, pushResult);
        if (ret == 0) {
            runningFlag = false;
            return;
        } else if (ret == -1) {
            return;
        }
        if (CheckResult(isRandomEosSuccess, pushResult) == -1) {
            runningFlag = false;
            isRunning_.store(false);
            signal_->inCond_.notify_all();
            signal_->outCond_.notify_all();
            return;
        }
        frameCount++;
        if (enableAutoSwitchParam) {
            AutoSwitchParam();
        }
    }
}

void VEncNdkSample::InputDataFuzz(bool &runningFlag, uint32_t index)
{
    frameCount++;
    if (frameCount == DEFAULT_FUZZ_TIME) {
        SetEOS(index);
        runningFlag = false;
        return;
    }
    OH_AVCodecBufferAttr attr;
    attr.pts = GetSystemTimeUs();
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    OH_VideoEncoder_PushInputData(venc_, index, attr);
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
}

void VEncNdkSample::InputFunc()
{
    errCount = 0;
    bool runningFlag = true;
    while (runningFlag) {
        if (!isRunning_.load()) {
            break;
        }
        RepeatStartBeforeEOS();
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->inIdxQueue_.size() > 0 && !isFlushing_.load();
        });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->inIdxQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        lock.unlock();
        unique_lock<mutex> flushlock(signal_->flushMutex_);
        if (isFlushing_) {
            continue;
        }
        if (fuzzMode == false) {
            InputDataNormal(runningFlag, index, buffer);
        } else {
            InputDataFuzz(runningFlag, index);
        }
        flushlock.unlock();
        if (sleepOnFPS) {
            usleep(FRAME_INTERVAL);
        }
    }
}

int32_t VEncNdkSample::CheckAttrFlag(OH_AVCodecBufferAttr attr)
{
    if (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        cout << "attr.flags == AVCODEC_BUFFER_FLAGS_EOS" << endl;
        unique_lock<mutex> inLock(signal_->inMutex_);
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        signal_->outCond_.notify_all();
        inLock.unlock();
        return -1;
    }
    if (attr.flags == AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        cout << "enc AVCODEC_BUFFER_FLAGS_CODEC_DATA" << attr.pts << endl;
    }
    outCount = outCount + 1;
    return 0;
}

void VEncNdkSample::OutputFuncFail()
{
    cout << "errCount > 0" << endl;
    unique_lock<mutex> inLock(signal_->inMutex_);
    isRunning_.store(false);
    signal_->inCond_.notify_all();
    signal_->outCond_.notify_all();
    inLock.unlock();
    (void)Stop();
    Release();
}

void VEncNdkSample::OutputFunc()
{
    OH_LOG_INFO(LOG_APP, "VEncNdkSample::OutputFunc: Thread started");
    FILE *outFile = fopen(OUT_DIR, "wb");

    while (!false) {
        if (!isRunning_.load()) {
            break;
        }
        OH_AVCodecBufferAttr attr;
        uint32_t index;
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->outIdxQueue_.size() > 0 && !isFlushing_.load();
        });
        if (!isRunning_.load()) {
            break;
        }
        index = signal_->outIdxQueue_.front();
        attr = signal_->attrQueue_.front();
        OH_AVMemory *buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        signal_->attrQueue_.pop();
        lock.unlock();
        if (CheckAttrFlag(attr) == -1) {
            break;
        }
        int size = attr.size;
        if (outFile == nullptr) {
            cout << "dump data fail" << endl;
        } else {
            fwrite(OH_AVMemory_GetAddr(buffer), 1, size, outFile);
        }

        if (OH_VideoEncoder_FreeOutputData(venc_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
        if (errCount > 0) {
            OutputFuncFail();
            break;
        }
    }
    if (outFile) {
        (void)fclose(outFile);
    }
}

int32_t VEncNdkSample::Flush()
{
    if (signal_ == nullptr) {
        return OH_VideoEncoder_Flush(venc_);
    }
    isFlushing_.store(true);
    unique_lock<mutex> flushLock(signal_->flushMutex_);
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
    int32_t ret = OH_VideoEncoder_Flush(venc_);
    isFlushing_.store(false);
    flushLock.unlock();
    return ret;
}

int32_t VEncNdkSample::Reset()
{
    isRunning_.store(false);
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoEncoder_Reset(venc_);
}

int32_t VEncNdkSample::Release()
{
    int ret = OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    return ret;
}

int32_t VEncNdkSample::Stop()
{
    StopInloop();
    if (signal_ != nullptr) {
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
    }
    ReleaseInFile();
    return OH_VideoEncoder_Stop(venc_);
}

int32_t VEncNdkSample::Start()
{
    return OH_VideoEncoder_Start(venc_);
}

void VEncNdkSample::StopOutloop()
{
    if (outputLoop_ != nullptr && outputLoop_->joinable() && signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        signal_->outCond_.notify_all();
        lock.unlock();
    }
}

int32_t VEncNdkSample::SetParameter(OH_AVFormat *format)
{
    if (venc_) {
        return OH_VideoEncoder_SetParameter(venc_, format);
    }
    return AV_ERR_UNKNOWN;
}