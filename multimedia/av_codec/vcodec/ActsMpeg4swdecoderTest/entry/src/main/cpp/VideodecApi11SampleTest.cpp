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
#include <iostream>
#include <cstring>
#include <arpa/inet.h>
#include <sys/time.h>
#include <unistd.h>
#include <utility>
#include <CryptoArchitectureKit/crypto_digest.h>
#include <include/VideodecApi11SampleTest.h>
#include <native_drawing/drawing_surface.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_types.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
#define SHA512_DIGEST_LENGTH 64

namespace {
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int SUCCESS_CODE = 0;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t MICRO_IN_SECOND = 1000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr uint32_t START_CODE_SIZE = 4;
constexpr uint32_t MILLION = 1000000;
constexpr uint8_t MPEG4_FRAME_HEAD[] = {0x00, 0x00, 0x01, 0xb6};
constexpr uint8_t MPEG4_SEQUENCE_HEAD[] = {0x00, 0x00, 0x01, 0xb0};
constexpr uint32_t PREREAD_BUFFER_SIZE = 0.1 * 1024 * 1024;
constexpr uint32_t THREE = 3;
constexpr uint32_t TEN = 10;
constexpr int32_t RES_CHANGE_TIME = 4;
constexpr int32_t CROP_INFO_SIZE = 2;
constexpr uint32_t MAX_WIDTH = 4000;
constexpr uint32_t MAX_HEIGHT = 3000;
constexpr uint32_t MAX_NALU_SIZE = MAX_WIDTH * MAX_HEIGHT << 1;
constexpr int32_t CROP_INFO[RES_CHANGE_TIME][CROP_INFO_SIZE] = {{621, 1103}, {1079, 1919}, {719, 1279}, {855, 1919}};

constexpr int32_t CROP_BOTTOM = 0;
constexpr int32_t CROP_RIGHT = 1;
constexpr int32_t DEFAULT_ANGLE = 90;
constexpr int32_t DEFAULT_FRAME_RATE = 30;
OH_CryptoDigest *g_c;
VDecAPI11Sample *g_decSample = nullptr;

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

class IBufferConsumerListener {
public:
    virtual ~IBufferConsumerListener() = default;
    virtual void OnBufferAvailable() = 0;
};

class ConsumerListenerBuffer {
public:
    ConsumerListenerBuffer(OH_NativeImage *image, std::string_view name) : image(image)
    {
        listener_.onFrameAvailable = &ConsumerListenerBuffer::OnFrameAvailableStatic;
        listener_.context = this;

        OH_NativeImage_SetOnFrameAvailableListener(image, listener_);
    };
    ~ConsumerListenerBuffer() { OH_NativeImage_UnsetOnFrameAvailableListener(image); }

private:
    static void OnFrameAvailableStatic(void *ctx)
    {
        auto *self = static_cast<ConsumerListenerBuffer *>(ctx);
        self->OnFrameAvailable();
    }

    void OnFrameAvailable()
    {
        OHNativeWindowBuffer *buffer;
        int32_t flushFence;
        OH_NativeImage_AcquireNativeWindowBuffer(image, &buffer, &flushFence);
        OH_NativeImage_ReleaseNativeWindowBuffer(image, buffer, -1);
    }

private:
    OH_OnFrameAvailableListener listener_;
    int64_t timestamp = 0;
    OH_Drawing_Rect *damage = {};
    OH_NativeImage *image{nullptr};
};

class VDecAPI11Sample::Impl {
public:
    ConsumerListenerBuffer *consumerListenerBuffer[2] = {};
};

VDecAPI11Sample::VDecAPI11Sample()
{
    this->impl = new Impl();  // 初始化 impl
}

VDecAPI11Sample::~VDecAPI11Sample()
{
    Stop();
    Release();
    for (int i = 0; i < maxSurfNum; i++) {
        if (impl->consumerListenerBuffer[i]) {
            delete impl->consumerListenerBuffer[i];
            impl->consumerListenerBuffer[i] = nullptr;
        }
        if (pNativeWindow[i]) {
            OH_NativeWindow_DestroyNativeWindow(pNativeWindow[i]);
            pNativeWindow[i] = nullptr;
        }
        if (cNativeImage[i]) {
            OH_NativeImage_Destroy(&cNativeImage[i]);
            cNativeImage[i] = nullptr;
        }
    }
    if (impl) {
        delete impl;
        impl = nullptr;
    }
}

void VdecAPI11Error(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

void VdecAPI11FormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    int32_t currentWidth = 0;
    int32_t currentHeight = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &currentWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &currentHeight);
    g_decSample->defaultWidth = currentWidth;
    g_decSample->defaultHeight = currentHeight;
    if (g_decSample->isResChangeStream) {
        static int32_t resCount = 0;
        int32_t cropBottom = 0;
        int32_t cropRight = 0;
        int32_t stride = 0;
        int32_t sliceHeight = 0;
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &stride);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight);
        if (cropBottom != CROP_INFO[resCount][CROP_BOTTOM] || cropRight != CROP_INFO[resCount][CROP_RIGHT]) {
            g_decSample->errCount++;
        }
        if (stride <= 0 || sliceHeight <= 0) {
            g_decSample->errCount++;
        }
        resCount++;
    }
}

void VdecAPI11InputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    if (g_decSample->inputCallbackFlush && g_decSample->outCount > 1) {
        OH_VideoDecoder_Flush(codec);
        cout << "OH_VideoDecoder_Flush end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    if (g_decSample->inputCallbackStop && g_decSample->outCount > 1) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    VDecAPI11Signal *signal = static_cast<VDecAPI11Signal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

void VdecAPI11OutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    if (g_decSample->outputCallbackFlush && g_decSample->outCount > 1) {
        OH_VideoDecoder_Flush(codec);
        cout << "OH_VideoDecoder_Flush end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    if (g_decSample->outputCallbackStop && g_decSample->outCount > 1) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    VDecAPI11Signal *signal = static_cast<VDecAPI11Signal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

void VDecAPI11Sample::FlushBuffer()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVBuffer *> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

bool VDecAPI11Sample::MdCompare(unsigned char buffer[], int len, const char *source[])
{
    bool result = true;
    for (int i = 0; i < len; i++) {
    }
    return result;
}

int64_t VDecAPI11Sample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = static_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

int32_t VDecAPI11Sample::ConfigureVideoDecoder()
{
    if (autoSwitchSurface) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        if (OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) != AV_ERR_INVALID_STATE) {
            errCount++;
        }
    }
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    if (maxInputSize > 0) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, maxInputSize);
    }
    originalWidth = defaultWidth;
    originalHeight = defaultHeight;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, defaultWidth);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, defaultHeight);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, defualtPixelFormat);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, defaultFrameRate);
    if (useHDRSource) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, DEFAULT_PROFILE);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, enbleSyncMode);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN, enbleBlankFrame);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

extern "C" {
NativeWindow *CreateNativeWindowFromSurface(void *surface);
}


void VDecAPI11Sample::CreateSurface()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    impl->consumerListenerBuffer[0] = new ConsumerListenerBuffer(cNativeImage[0], outDir);
    pNativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    if (autoSwitchSurface) {
        cNativeImage[1] = OH_ConsumerSurface_Create();
        impl->consumerListenerBuffer[1] = new ConsumerListenerBuffer(cNativeImage[1], outDiR2);
        pNativeWindow[1] = OH_NativeImage_AcquireNativeWindow(cNativeImage[1]);
    }
}

int32_t VDecAPI11Sample::RunVideoDecSurface(string codeName)
{
    sfOutput = true;
    int err = AV_ERR_OK;
    CreateSurface();
    if (!pNativeWindow[0]) {
        cout << "Failed to create surface" << endl;
        return AV_ERR_UNKNOWN;
    }
    err = CreateVideoDecoder(codeName);
    if (err != AV_ERR_OK) {
        cout << "Failed to create video decoder" << endl;
        return err;
    }
    err = SetVideoDecoderCallback();
    if (err != AV_ERR_OK) {
        cout << "Failed to setCallback" << endl;
        Release();
        return err;
    }
    err = ConfigureVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to configure video decoder" << endl;
        Release();
        return err;
    }
    err = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[0]);
    if (err != AV_ERR_OK) {
        cout << "Failed to set surface" << endl;
        return err;
    }
    err = StartVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to start video decoder" << endl;
        Release();
        return err;
    }
    return err;
}

int32_t VDecAPI11Sample::RunVideoDec(string codeName)
{
    sfOutput = false;
    int err = CreateVideoDecoder(codeName);
    if (err != AV_ERR_OK) {
        cout << "Failed to create video decoder" << endl;
        return err;
    }

    err = ConfigureVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to configure video decoder" << endl;
        Release();
        return err;
    }

    err = SetVideoDecoderCallback();
    if (err != AV_ERR_OK) {
        cout << "Failed to setCallback" << endl;
        Release();
        return err;
    }

    err = StartVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to start video decoder" << endl;
        Release();
        return err;
    }
    return err;
}

int32_t VDecAPI11Sample::SetVideoDecoderCallback()
{
    signal_ = new VDecAPI11Signal();
    if (signal_ == nullptr) {
        cout << "Failed to new VDecAPI11Signal" << endl;
        return AV_ERR_UNKNOWN;
    }

    cb_.onError = VdecAPI11Error;
    cb_.onStreamChanged = VdecAPI11FormatChanged;
    cb_.onNeedInputBuffer = VdecAPI11InputDataReady;
    cb_.onNewOutputBuffer = VdecAPI11OutputDataReady;
    return OH_VideoDecoder_RegisterCallback(vdec_, cb_, static_cast<void *>(signal_));
}

void VDecAPI11Sample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
        mpegUnit_.reset();
        mpegUnit_ = nullptr;
        prereadBuffer_.reset();
        prereadBuffer_ = nullptr;
    }
}

void VDecAPI11Sample::StopInloop()
{
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        clearIntqueue(signal_->inIdxQueue_);
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        lock.unlock();

        inputLoop_->join();
        inputLoop_.reset();
    }
}

int32_t VDecAPI11Sample::CreateVideoDecoder(string codeName)
{
    vdec_ = OH_VideoDecoder_CreateByName(codeName.c_str());
    g_decSample = this;
    return vdec_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

int32_t VDecAPI11Sample::StartVideoDecoder()
{
    isRunning_.store(true);
    int ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        isRunning_.store(false);
        ReleaseInFile();
        Release();
        return ret;
    }
    inFile_ = make_unique<ifstream>();
    prereadBuffer_ = std::make_unique<uint8_t[]>(PREREAD_BUFFER_SIZE + START_CODE_SIZE);
    mpegUnit_ = std::make_unique<std::vector<uint8_t>>(MAX_WIDTH * MAX_HEIGHT << 1);
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        return AV_ERR_UNKNOWN;
    }
    inFile_->open(inpDir, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << inpDir << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    inputLoop_ = make_unique<thread>(&VDecAPI11Sample::InputFuncTest, this);
    if (inputLoop_ == nullptr) {
        cout << "Failed to create input loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    outputLoop_ = make_unique<thread>(&VDecAPI11Sample::OutputFuncTest, this);
    if (outputLoop_ == nullptr) {
        cout << "Failed to create output loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        StopInloop();
        Release();
        return AV_ERR_UNKNOWN;
    }

    return AV_ERR_OK;
}

int32_t VDecAPI11Sample::StartSyncVideoDecoder()
{
    isRunning_.store(true);
    int ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        isRunning_.store(false);
        ReleaseInFile();
        Release();
        return ret;
    }
    inFile_ = make_unique<ifstream>();
    prereadBuffer_ = std::make_unique<uint8_t[]>(PREREAD_BUFFER_SIZE + START_CODE_SIZE);
    mpegUnit_ = std::make_unique<std::vector<uint8_t>>(MAX_WIDTH * MAX_HEIGHT << 1);
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        return AV_ERR_UNKNOWN;
    }
    inFile_->open(inpDir, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << inpDir << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    signal_ = new VDecAPI11Signal();
    inputLoop_ = make_unique<thread>(&VDecAPI11Sample::SyncInputFunc, this);
    if (inputLoop_ == nullptr) {
        cout << "Failed to create input loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    outputLoop_ = make_unique<thread>(&VDecAPI11Sample::SyncOutputFunc, this);
    if (outputLoop_ == nullptr) {
        cout << "Failed to create output loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        StopInloop();
        Release();
        return AV_ERR_UNKNOWN;
    }

    return AV_ERR_OK;
}

void VDecAPI11Sample::TestApi()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    impl->consumerListenerBuffer[0] = new ConsumerListenerBuffer(cNativeImage[0], outDir);
    pNativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[0]);
    OH_VideoDecoder_Prepare(vdec_);
    OH_VideoDecoder_Start(vdec_);
    OH_AVFormat *format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, defaultWidth);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, defaultHeight);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, defaultFrameRate);
    OH_VideoDecoder_SetParameter(vdec_, format);
    OH_AVFormat_Destroy(format);
    OH_VideoDecoder_GetOutputDescription(vdec_);
    OH_VideoDecoder_Flush(vdec_);
    OH_VideoDecoder_Stop(vdec_);
    OH_VideoDecoder_Reset(vdec_);
    bool isvalid = false;
    OH_VideoDecoder_IsValid(vdec_, &isvalid);
}

void VDecAPI11Sample::WaitForEOS()
{
    if (!afterEosDestoryCodec && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecAPI11Sample::InputFuncTest()
{
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        if (repeatStartFlushBeforeEos > 0) {
            repeatStartFlushBeforeEos--;
            OH_VideoDecoder_Flush(vdec_);
            FlushBuffer();
            OH_VideoDecoder_Start(vdec_);
        }
        if (repeatStartStopBeforeEos > 0) {
            repeatStartStopBeforeEos--;
            OH_VideoDecoder_Stop(vdec_);
            FlushBuffer();
            OH_VideoDecoder_Start(vdec_);
        }
        uint32_t index;
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->inIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        index = signal_->inIdxQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();

        signal_->inIdxQueue_.pop();
        signal_->inBufferQueue_.pop();
        lock.unlock();
        int ret = PushData(index, buffer);
        if (ret == 1) {
            flag = false;
            break;
        }
        if (sleepOnFPS) {
            usleep(MICRO_IN_SECOND / static_cast<int32_t>(DEFAULT_FRAME_RATE));
        }
    }
}

void VDecAPI11Sample::SyncInputFunc()
{
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        uint32_t index;
        if (OH_VideoDecoder_QueryInputBuffer(vdec_, &index, syncInputWaitTime) != AV_ERR_OK) {
            continue;
        }
        OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(vdec_, index);
        if (buffer == nullptr) {
            cout << "OH_VideoDecoder_GetInputBuffer fail" << endl;
            errCount = errCount + 1;
            continue;
        }
        int ret = PushData(index, buffer);
        if (ret == 1) {
            flag = false;
            break;
        }
        if (sleepOnFPS) {
            usleep(static_cast<useconds_t>(MICRO_IN_SECOND / DEFAULT_FRAME_RATE));
        }
    }
}

void VDecAPI11Sample::PtrStep(uint32_t &bufferSize, unsigned char **pBuffer, uint32_t size)
{
    pPrereadBuffer_ += size;
    bufferSize += size;
    *pBuffer += size;
}

void VDecAPI11Sample::PtrStepExtraRead(uint32_t &bufferSize, unsigned char **pBuffer)
{
    bufferSize -= START_CODE_SIZE;
    *pBuffer -= START_CODE_SIZE;
    pPrereadBuffer_ = 0;
}

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) {
        return ERROR_CODE_NEGATIVE_ONE;
    }
    if (len == 0) {
        return SUCCESS_CODE; // 空操作直接返回成功
    }
    if (len > dstSize) {
        return ERROR_CODE_NEGATIVE_TWO;
    }
    // 处理重叠情况的安全复制
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) {
        return SUCCESS_CODE; // 源和目标相同，无需复制
    }
    // 判断是否有重叠以及重叠类型
    if (dstPtr < srcPtr) {
        // 正向复制：目标在源前面，或者不重叠
        for (size_t i = 0; i < len; ++i) {
            dstPtr[i] = srcPtr[i];
        }
    } else if (dstPtr > srcPtr) {
        // 反向复制：目标在源后面，有重叠
        for (size_t i = len; i > 0; --i) {
            dstPtr[i - 1] = srcPtr[i - 1];
        }
    }
    return SUCCESS_CODE;
}

void VDecAPI11Sample::GetBufferSize()
{
    auto pBuffer = mpegUnit_->data();
    uint32_t bufferSize = 0;
    mpegUnit_->resize(MAX_NALU_SIZE);
    do {
        auto framePos = std::search(prereadBuffer_.get() + pPrereadBuffer_ + START_CODE_SIZE,
        prereadBuffer_.get() + prereadBufferSize_,
        std::begin(MPEG4_FRAME_HEAD), std::end(MPEG4_FRAME_HEAD));
        uint32_t frameSize = std::distance(prereadBuffer_.get() + pPrereadBuffer_, framePos);
        auto seqPos = std::search(prereadBuffer_.get() + pPrereadBuffer_,
        prereadBuffer_.get() + pPrereadBuffer_ + frameSize,
        std::begin(MPEG4_SEQUENCE_HEAD), std::end(MPEG4_SEQUENCE_HEAD));
        uint32_t seqSize = std::distance(prereadBuffer_.get() + pPrereadBuffer_, seqPos);
        
        uint32_t copySize;
        if (seqSize == 0) {
            auto nextFramePos = std::search(prereadBuffer_.get() + pPrereadBuffer_ + frameSize + START_CODE_SIZE,
            prereadBuffer_.get() + prereadBufferSize_,
            std::begin(MPEG4_FRAME_HEAD), std::end(MPEG4_FRAME_HEAD));
            copySize = std::distance(prereadBuffer_.get() + pPrereadBuffer_, nextFramePos);
        } else if (frameSize > seqSize) {
            copySize = seqSize;
        } else {
            copySize = frameSize;
        }
        if (SafeMemcpy(pBuffer, copySize, prereadBuffer_.get() + pPrereadBuffer_, copySize) != SUCCESS_CODE) {
            return;
        }
        PtrStep(bufferSize, &pBuffer, copySize);
        if (!((pPrereadBuffer_ == prereadBufferSize_) && !inFile_->eof())) {
            break;
        }
        inFile_->read(reinterpret_cast<char *>(prereadBuffer_.get() + START_CODE_SIZE), PREREAD_BUFFER_SIZE);
        prereadBufferSize_ = inFile_->gcount() + START_CODE_SIZE;
        pPrereadBuffer_ = START_CODE_SIZE;
        
        if (SafeMemcpy(prereadBuffer_.get(), START_CODE_SIZE, pBuffer - START_CODE_SIZE, START_CODE_SIZE) !=
            SUCCESS_CODE) {
            return;
        }
        PtrStepExtraRead(bufferSize, &pBuffer);
    } while (pPrereadBuffer_ != prereadBufferSize_);
    mpegUnit_->resize(bufferSize);
}

int32_t VDecAPI11Sample::PushData(uint32_t index, OH_AVBuffer *buffer)
{
    uint32_t bufferSize = 0;
    OH_AVCodecBufferAttr attr;
    if (beforeEosInput && frameCount_ > TEN) {
        SetEOS(index, buffer);
        return 1;
    }
    if (beforeEosInputInput && frameCount_ > TEN) {
        SafeMemcpy(&attr, sizeof(OH_AVCodecBufferAttr), 0, sizeof(OH_AVCodecBufferAttr));
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        beforeEosInputInput = false;
    }
    if (inFile_->tellg() == 0) {
        inFile_->read(reinterpret_cast<char *>(prereadBuffer_.get() + START_CODE_SIZE), PREREAD_BUFFER_SIZE);
        prereadBufferSize_ = inFile_->gcount() + START_CODE_SIZE;
        pPrereadBuffer_ = START_CODE_SIZE;
    }
    if (inFile_->eof() && finishLastPush) {
        SetEOS(index, buffer);
        mpegUnit_->resize(0);
        return 1;
    }
    GetBufferSize();
    bufferSize = mpegUnit_->size();
    if ((bufferSize >= ((defaultWidth * defaultHeight) * THREE)) >> 1) {
        cout << "read bufferSize abnormal. buffersize = " << bufferSize << endl;
        return 1;
    }
    return SendData(bufferSize, index, buffer);
}

int32_t VDecAPI11Sample::CheckAndReturnBufferSize(OH_AVBuffer *buffer)
{
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    if (maxInputSize > 0 && (size > maxInputSize)) {
        errCount++;
    }
    return size;
}

void VDecAPI11Sample::SetAttr(OH_AVCodecBufferAttr &attr, int64_t startPts, uint32_t bufferSize)
{
    attr.pts = startPts;
    attr.size = bufferSize;
    attr.offset = 0;
}

void VDecAPI11Sample::SetRepeat()
{
    inFile_->clear();
    inFile_->seekg(0, ios::beg);
    finishLastPush = false;
    cout << "repeat" << endl;
}

uint32_t VDecAPI11Sample::SendData(uint32_t bufferSize, uint32_t index, OH_AVBuffer *buffer)
{
    OH_AVCodecBufferAttr attr;
    uint8_t *fileBuffer = nullptr;
    if (bufferSize > 0) {
        fileBuffer = new uint8_t[bufferSize];
    } else {
        delete[] fileBuffer;
        return 0;
    }
    if (pPrereadBuffer_ == prereadBufferSize_ && inFile_->eof()) {
        finishLastPush = true;
    }
    if (SafeMemcpy(fileBuffer, bufferSize, mpegUnit_->data(), bufferSize) != SUCCESS_CODE) {
        cout << "Fatal: memory copy failed" << endl;
    }
    int32_t size = CheckAndReturnBufferSize(buffer);
    if (size < bufferSize) {
        delete[] fileBuffer;
        return 0;
    }
    uint8_t *avBuffer = OH_AVBuffer_GetAddr(buffer);
    if (avBuffer == nullptr) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        return 0;
    }
    if (SafeMemcpy(avBuffer, size, fileBuffer, bufferSize) != SUCCESS_CODE) {
        delete[] fileBuffer;
        return 0;
    }
    int64_t startPts = GetSystemTimeUs();
    SetAttr(attr, startPts, bufferSize);
    if (isRunning_.load()) {
        OH_AVBuffer_SetBufferAttr(buffer, &attr);
        OH_VideoDecoder_PushInputBuffer(vdec_, index) == AV_ERR_OK ? (0) : (errCount++);
        frameCount_ = frameCount_ + 1;
        outCount = outCount + 1;
        if (autoSwitchSurface && (frameCount_ % static_cast<int32_t>(defaultFrameRate) == 0)) {
            switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
            OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) == AV_ERR_OK ? (0) : (errCount++);
        }
    }
    delete[] fileBuffer;
    if (inFile_->eof() && finishLastPush && repeatRun) {
        SetRepeat();
    }
    return 0;
}

void VDecAPI11Sample::CheckOutputDescription()
{
    OH_AVFormat *newFormat = OH_VideoDecoder_GetOutputDescription(vdec_);
    if (newFormat != nullptr) {
        int32_t cropTop = 0;
        int32_t cropBottom = 0;
        int32_t cropLeft = 0;
        int32_t cropRight = 0;
        int32_t stride = 0;
        int32_t sliceHeight = 0;
        int32_t picWidth = 0;
        int32_t picHeight = 0;
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_TOP, &cropTop);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_LEFT, &cropLeft);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_STRIDE, &stride);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_PIC_WIDTH, &picWidth);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_PIC_HEIGHT, &picHeight);
        if (cropTop != expectCropTop || cropBottom != expectCropBottom || cropLeft != expectCropLeft) {
            std::cout << "cropTop:" << cropTop << " cropBottom:" << cropBottom << " cropLeft:" << cropLeft << std::endl;
            errCount++;
        }
        if (cropRight != expectCropRight || stride <= 0 || sliceHeight <= 0) {
            std::cout << "cropRight:" << cropRight << std::endl;
            std::cout << "stride:" << stride << " sliceHeight:" << sliceHeight << std::endl;
            errCount++;
        }
        if (picWidth != originalWidth || picHeight != originalHeight) {
            std::cout << "picWidth:" << picWidth << " picHeight:" << picHeight << std::endl;
            errCount++;
        }
    } else {
        errCount++;
    }
    OH_AVFormat_Destroy(newFormat);
}

void VDecAPI11Sample::AutoSwitchSurface()
{
    if (autoSwitchSurface) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        if (OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) != AV_ERR_OK) {
            errCount++;
        }
        OH_AVFormat *format = OH_AVFormat_Create();
        int32_t angle = DEFAULT_ANGLE * reinterpret_cast<int32_t>(switchSurfaceFlag);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, angle);
        OH_VideoDecoder_SetParameter(vdec_, format);
        OH_AVFormat_Destroy(format);
    }
}
void SecureMemzero(void *ptr, size_t len)
{
    volatile unsigned char *p = (volatile unsigned char *)ptr;
    while (len--) {
        *p++ = 0;
    }
}

int32_t VDecAPI11Sample::CheckAttrFlag(OH_AVCodecBufferAttr attr)
{
    if (needCheckOutputDesc) {
        CheckOutputDescription();
        needCheckOutputDesc = false;
    }
    if (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        cout << "AVCODEC_BUFFER_FLAGS_EOS" << endl;
        AutoSwitchSurface();
        Crypto_DataBlob out = {.data = nullptr, .len = 0};
        OH_CryptoDigest_Final(g_c, &out);
        OH_DigestCrypto_Destroy(g_c);
        MdCompare(out.data, SHA512_DIGEST_LENGTH, fileSourcesha256);
        OH_Crypto_FreeDataBlob(&out);
        return -1;
    }
    if (attr.flags == AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        cout << "enc AVCODEC_BUFFER_FLAGS_CODEC_DATA" << attr.pts << endl;
        return 0;
    }
    outFrameCount = outFrameCount + 1;
    return 0;
}

void VDecAPI11Sample::OutputFuncTest()
{
    FILE *outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    OH_CryptoDigest_Create("SHA512", &g_c);
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        OH_AVCodecBufferAttr attr;
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->outIdxQueue_.size() > 0;
        });
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        uint32_t index = signal_->outIdxQueue_.front();
        OH_AVBuffer *buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
            errCount = errCount + 1;
        }
        lock.unlock();
        if (CheckAttrFlag(attr) == -1) {
            flag = false;
            break;
        }
        ProcessOutputData(buffer, index, attr.size);
        if (outFile != nullptr) {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, attr.size, outFile);
        }
        if (errCount > 0) {
            flag = false;
            break;
        }
    }
    if (outFile) {
        (void)fclose(outFile);
    }
}

void VDecAPI11Sample::SyncOutputFunc()
{
    FILE *outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    OH_CryptoDigest_Create("SHA512", &g_c);
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        OH_AVCodecBufferAttr attr;
        uint32_t index = 0;
        if (OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, syncOutputWaitTime) != AV_ERR_OK) {
            continue;
        }
        OH_AVBuffer *buffer = OH_VideoDecoder_GetOutputBuffer(vdec_, index);
        if (buffer == nullptr) {
            cout << "OH_VideoDecoder_GetOutputBuffer fail" << endl;
            errCount = errCount + 1;
            continue;
        }
        if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
            errCount = errCount + 1;
        }
        if (SyncOutputFuncEos(attr, index) != AV_ERR_OK) {
            flag = false;
            break;
        }
        ProcessOutputData(buffer, index, attr.size);
        if (outFile != nullptr) {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, attr.size, outFile);
        }
        if (errCount > 0) {
            flag = false;
            break;
        }
    }
    if (outFile) {
        (void)fclose(outFile);
    }
}

int32_t VDecAPI11Sample::SyncOutputFuncEos(OH_AVCodecBufferAttr attr, uint32_t index)
{
    if (CheckAttrFlag(attr) == -1) {
        if (queryInputBufferEOS) {
            OH_VideoDecoder_QueryInputBuffer(vdec_, &index, 0);
            OH_VideoDecoder_QueryInputBuffer(vdec_, &index, MILLION);
            OH_VideoDecoder_QueryInputBuffer(vdec_, &index, -1);
        }
        if (queryOutputBufferEOS) {
            OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, 0);
            OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, MILLION);
            OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, -1);
        }
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}


void VDecAPI11Sample::ProcessOutputData(OH_AVBuffer *buffer, uint32_t index, int32_t size)
{
    if (!sfOutput) {
        if ((size >= ((defaultWidth * defaultHeight) * THREE)) >> 1) {
            uint8_t *cropBuffer = new uint8_t[size];
            if (SafeMemcpy(cropBuffer, size, OH_AVBuffer_GetAddr(buffer), defaultWidth * defaultHeight) !=
                SUCCESS_CODE) {
                cout << "Fatal: memory copy failed Y" << endl;
            }
            // copy UV
            uint32_t uvSize = size - defaultWidth * defaultHeight;
            if (SafeMemcpy(cropBuffer + defaultWidth * defaultHeight, uvSize,
                OH_AVBuffer_GetAddr(buffer) + defaultWidth * defaultHeight, uvSize) != SUCCESS_CODE) {
                cout << "Fatal: memory copy failed UV" << endl;
            }
            Crypto_DataBlob blob;
            blob.data = cropBuffer;
            blob.len = size;
            OH_CryptoDigest_Update(g_c, &blob);
            delete[] cropBuffer;
        }
        if (OH_VideoDecoder_FreeOutputBuffer(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
    } else {
        if (rsAtTime) {
            int32_t usTimeNum = 1000;
            int32_t msTimeNum = 1000000;
            if (renderTimestampNs == 0) {
                renderTimestampNs = GetSystemTimeUs() * usTimeNum;
            }
            renderTimestampNs = renderTimestampNs + (usTimeNum / defaultFrameRate * msTimeNum);
            if (OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, renderTimestampNs) != AV_ERR_OK) {
                cout << "Fatal: RenderOutputBufferAtTime fail" << endl;
                errCount = errCount + 1;
            }
        } else {
            if (OH_VideoDecoder_RenderOutputBuffer(vdec_, index) != AV_ERR_OK) {
                cout << "Fatal: RenderOutputBuffer fail" << endl;
                errCount = errCount + 1;
            }
        }
    }
}

int32_t VDecAPI11Sample::StateEos()
{
    uint32_t index;
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [this]() { return signal_->inIdxQueue_.size() > 0; });
    index = signal_->inIdxQueue_.front();
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    lock.unlock();
    return OH_VideoDecoder_PushInputBuffer(vdec_, index);
}

void VDecAPI11Sample::SetEOS(uint32_t index, OH_AVBuffer *buffer)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    OH_AVBuffer_SetBufferAttr(buffer, &attr);
    int32_t res = OH_VideoDecoder_PushInputBuffer(vdec_, index);
    cout << "OH_VideoDecoder_PushInputBuffer    EOS   res: " << res << endl;
}

int32_t VDecAPI11Sample::Flush()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
    isRunning_.store(false);
    return OH_VideoDecoder_Flush(vdec_);
}

int32_t VDecAPI11Sample::Reset()
{
    isRunning_.store(false);
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoDecoder_Reset(vdec_);
}

int32_t VDecAPI11Sample::Release()
{
    int ret = 0;
    if (vdec_ != nullptr) {
        ret = OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }

    if (signal_ != nullptr) {
        delete signal_;
        signal_ = nullptr;
    }
    return ret;
}

int32_t VDecAPI11Sample::Stop()
{
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoDecoder_Stop(vdec_);
}

int32_t VDecAPI11Sample::Start()
{
    isRunning_.store(true);
    return OH_VideoDecoder_Start(vdec_);
}

void VDecAPI11Sample::StopOutloop()
{
    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        isRunning_.store(false);
        signal_->outCond_.notify_all();
        lock.unlock();
        outputLoop_->join();
        outputLoop_.reset();
    }
}

int32_t VDecAPI11Sample::SetParameter(OH_AVFormat *format) { return OH_VideoDecoder_SetParameter(vdec_, format); }

int32_t VDecAPI11Sample::SwitchSurface()
{
    int32_t ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
    switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
    cout << "manual switch surf " << switchSurfaceFlag << endl;
    return ret;
}

int32_t VDecAPI11Sample::RepeatCallSetSurface()
{
    for (int i = 0; i < repeatCallTime; i++) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        int32_t ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
        if (ret != AV_ERR_OK && ret != AV_ERR_OPERATE_NOT_PERMIT && ret != AV_ERR_INVALID_STATE) {
            return AV_ERR_OPERATE_NOT_PERMIT;
        }
    }
    return AV_ERR_OK;
}

int32_t VDecAPI11Sample::DecodeSetSurface()
{
    CreateSurface();
    return OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[0]);
}