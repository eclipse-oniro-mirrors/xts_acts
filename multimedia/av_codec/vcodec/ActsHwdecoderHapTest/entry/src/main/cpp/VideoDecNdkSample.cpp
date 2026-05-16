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
#include "include/VideoDecNdkSample.h"
#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_digest.h>
#include <arpa/inet.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <sys/time.h>
#include <utility>
#include "include/CommonTool.h"

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr uint32_t REPEAT_CALL_TIME = 10;
constexpr uint32_t MAX_SURF_NUM = 2;
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t MICRO_IN_SECOND = 1000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr int32_t THREE = 3;
constexpr int32_t EIGHT = 8;
constexpr int32_t TEN = 10;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t TWENTY_FOUR = 24;
constexpr uint8_t H264_NALU_TYPE = 0x1f;
constexpr uint32_t START_CODE_SIZE = 4;
constexpr uint8_t START_CODE[START_CODE_SIZE] = { 0, 0, 0, 1 };
constexpr uint8_t SPS = 7;
constexpr uint8_t PPS = 8;
constexpr int32_t RES_CHANGE_TIME = 4;
constexpr int32_t CROP_INFO_SIZE = 2;
constexpr int32_t CROP_INFO[RES_CHANGE_TIME][CROP_INFO_SIZE] = { { 621, 1103 },
                                                                 { 1079, 1919 },
                                                                 { 719, 1279 },
                                                                 { 855, 1919 } };

constexpr int32_t CROP_BOTTOM = 0;
constexpr int32_t CROP_RIGHT = 1;

OH_CryptoDigest* g_ctx;
VDecNdkSample* g_decSample = nullptr;

void clearIntqueue(std::queue<uint32_t>& q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}

void clearBufferqueue(std::queue<OH_AVCodecBufferAttr>& q)
{
    std::queue<OH_AVCodecBufferAttr> empty;
    swap(empty, q);
}
} // namespace

class TestConsumerListener {
public:
    TestConsumerListener(OH_NativeImage* img, std::string_view name) : image_(img)
    {
        listener_.onFrameAvailable = &TestConsumerListener::OnFrameAvailableStatic;
        listener_.context = this;

        OH_NativeImage_SetOnFrameAvailableListener(image_, listener_);
    }
    ~TestConsumerListener()
    {
        OH_NativeImage_UnsetOnFrameAvailableListener(image_);
    }

private:
    static void OnFrameAvailableStatic(void* ctx)
    {
        auto* self = static_cast<TestConsumerListener*>(ctx);
        self->OnFrameAvailable();
    }

    void OnFrameAvailable()
    {
        OHNativeWindowBuffer* buffer;
        int32_t flushFence;
        OH_NativeImage_AcquireNativeWindowBuffer(image_, &buffer, &flushFence);
        OH_NativeImage_ReleaseNativeWindowBuffer(image_, buffer, -1);
    }

private:
    OH_NativeImage* image_;
    OH_OnFrameAvailableListener listener_;
    int64_t timestamp = 0;
    Region::Rect damage = {};
};

class VDecNdkSample::Impl {
public:
    TestConsumerListener* testConsumerListener[2] = {};
};

VDecNdkSample::VDecNdkSample()
{
    this->pImpl = new Impl();
}

VDecNdkSample::~VDecNdkSample()
{
    for (int i = 0; i < MAX_SURF_NUM; i++) {
        if (pImpl->testConsumerListener[i]) {
            delete pImpl->testConsumerListener[i];
            pImpl->testConsumerListener[i] = nullptr;
        }
        if (cNativeImage[i]) {
            OH_NativeImage_Destroy(&cNativeImage[i]);
            cNativeImage[i] = nullptr;
        }
        if (pNativeWindow[i]) {
            OH_NativeWindow_DestroyNativeWindow(pNativeWindow[i]);
            pNativeWindow[i] = nullptr;
        }
    }
    delete this->pImpl;
    Stop();
    Release();
}

void VdecError(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

void VdecFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
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

void VdecInputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
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
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
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
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

void VDecNdkSample::FlushBuffer()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVMemory*> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

bool VDecNdkSample::MdCompare(unsigned char buffer[], int len, const char* source[])
{
    bool result = true;
    for (int i = 0; i < len; i++) {
    }
    return result;
}

int64_t VDecNdkSample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = static_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;
    return nanoTime / NANOS_IN_MICRO;
}

int32_t VDecNdkSample::ConfigureVideoDecoder()
{
    if (autoSwitchSurface) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        if (OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) != AV_ERR_INVALID_STATE) {
            errCount++;
        }
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, defaultWidth);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, defaultHeight);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, defaultFrameRate);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENABLE_LOW_LATENCY, 1);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

void VDecNdkSample::CreateSurface()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    pImpl->testConsumerListener[0] = new TestConsumerListener(cNativeImage[0], outDir);
    pNativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    if (autoSwitchSurface) {
        cNativeImage[1] = OH_ConsumerSurface_Create();
        pImpl->testConsumerListener[1] = new TestConsumerListener(cNativeImage[1], outDir2);
        pNativeWindow[1] = OH_NativeImage_AcquireNativeWindow(cNativeImage[1]);
    }
}

int32_t VDecNdkSample::RunVideoDecSurface(string codeName)
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

int32_t VDecNdkSample::RunVideoDec(string codeName)
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

int32_t VDecNdkSample::SetVideoDecoderCallback()
{
    signal_ = new VDecSignal();
    if (signal_ == nullptr) {
        cout << "Failed to new VDecSignal" << endl;
        return AV_ERR_UNKNOWN;
    }

    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    return OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void*>(signal_));
}

void VDecNdkSample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void VDecNdkSample::StopInloop()
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

int32_t VDecNdkSample::CreateVideoDecoder(string codeName)
{
    vdec_ = OH_VideoDecoder_CreateByName(codeName.c_str());
    g_decSample = this;
    return vdec_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

int32_t VDecNdkSample::StartVideoDecoder()
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

    inputLoop_ = make_unique<thread>(&VDecNdkSample::InputFuncTest, this);
    if (inputLoop_ == nullptr) {
        cout << "Failed to create input loop" << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        ReleaseInFile();
        return AV_ERR_UNKNOWN;
    }
    outputLoop_ = make_unique<thread>(&VDecNdkSample::OutputFuncTest, this);
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

void VDecNdkSample::TestApi()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    pImpl->testConsumerListener[0] = new TestConsumerListener(cNativeImage[0], outDir);
    pNativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[0]);

    OH_VideoDecoder_Prepare(vdec_);
    OH_VideoDecoder_Start(vdec_);

    OH_AVFormat* format = OH_AVFormat_Create();
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

void VDecNdkSample::WaitForEOS()
{
    if (!afterEosDestroyCodec && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecNdkSample::InputFuncTest()
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
        if (!inFile_->eof()) {
            int ret = PushData(index, buffer);
            if (ret == 1) {
                flag = false;
                break;
            }
        }
        if (sleepOnFPS) {
            usleep(MICRO_IN_SECOND / static_cast<int32_t>(defaultFrameRate));
        }
    }
}

int32_t VDecNdkSample::PushData(uint32_t index, OH_AVMemory* buffer)
{
    static uint32_t repeatCount = 0;
    OH_AVCodecBufferAttr attr;
    if (beforeEosInput && frameCount_ > TEN) {
        SetEOS(index);
        return 1;
    }
    if (beforeEosInputInput && frameCount_ > TEN) {
        SafeMemcpy(&attr, sizeof(OH_AVCodecBufferAttr), 0, sizeof(OH_AVCodecBufferAttr));
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        beforeEosInputInput = false;
    }
    char ch[4] = {};
    (void)inFile_->read(ch, START_CODE_SIZE);
    if (repeatRun && inFile_->eof()) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        cout << "repeat run " << repeatCount << endl;
        repeatCount++;
        return 0;
    }
    if (inFile_->eof()) {
        SetEOS(index);
        return 1;
    }
    uint32_t bufferSize = static_cast<uint32_t>(((ch[3] & 0xFF)) | ((ch[2] & 0xFF) << EIGHT) |
                                                ((ch[1] & 0xFF) << SIXTEEN) | ((ch[0] & 0xFF) << TWENTY_FOUR));
    if (bufferSize >= ((defaultWidth * defaultHeight * THREE) >> 1)) {
        cout << "read bufferSize abnormal. buffersize = " << bufferSize << endl;
        return 1;
    }

    return SendData(bufferSize, index, buffer);
}

uint32_t VDecNdkSample::SendData(uint32_t bufferSize, uint32_t index, OH_AVMemory* buffer)
{
    OH_AVCodecBufferAttr attr;
    uint8_t* fileBuffer = new uint8_t[bufferSize + START_CODE_SIZE];
    if (fileBuffer == nullptr) {
        delete[] fileBuffer;
        return 0;
    }
    if (SafeMemcpy(fileBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != SUCCESS_CODE) {
        cout << "Fatal: memory copy failed" << endl;
    }
    (void)inFile_->read((char*)fileBuffer + START_CODE_SIZE, bufferSize);
    if ((fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == SPS ||
        (fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == PPS) {
        attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    }
    int32_t size = OH_AVMemory_GetSize(buffer);
    if (size < bufferSize + START_CODE_SIZE) {
        delete[] fileBuffer;
        return 0;
    }
    uint8_t* avBuffer = OH_AVMemory_GetAddr(buffer);
    if (avBuffer == nullptr) {
        cout << "avBuffer == nullptr" << endl;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        return 0;
    }
    if (SafeMemcpy(avBuffer, size, fileBuffer, bufferSize + START_CODE_SIZE) != SUCCESS_CODE) {
        delete[] fileBuffer;
        return 0;
    }
    int64_t startPts = GetSystemTimeUs();
    attr.pts = startPts;
    attr.size = bufferSize + START_CODE_SIZE;
    attr.offset = 0;
    if (isRunning_.load()) {
        OH_VideoDecoder_PushInputData(vdec_, index, attr) == AV_ERR_OK ? (0) : (errCount++);
        frameCount_ = frameCount_ + 1;
        outCount = outCount + 1;
        if (autoSwitchSurface && (frameCount_ % static_cast<int32_t>(defaultFrameRate) == 0)) {
            switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
            OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) == AV_ERR_OK ? (0) : (errCount++);
        }
    }
    delete[] fileBuffer;
    return 0;
}

void VDecNdkSample::CheckOutputDescription()
{
    OH_AVFormat* newFormat = OH_VideoDecoder_GetOutputDescription(vdec_);
    if (newFormat != nullptr) {
        int32_t cropTop = 0;
        int32_t cropBottom = 0;
        int32_t cropLeft = 0;
        int32_t cropRight = 0;
        int32_t stride = 0;
        int32_t sliceHeight = 0;
        int32_t picWidth = 0;
        int32_t picHeight = 0;
        int32_t qpAverage = 0;
        double mse = 1.0;
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_TOP, &cropTop);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_LEFT, &cropLeft);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_STRIDE, &stride);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_PIC_WIDTH, &picWidth);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_PIC_HEIGHT, &picHeight);
        OH_AVFormat_GetIntValue(newFormat, OH_MD_KEY_VIDEO_ENCODER_QP_AVERAGE, &qpAverage);
        OH_AVFormat_GetDoubleValue(newFormat, OH_MD_KEY_VIDEO_ENCODER_MSE, &mse);

        if (cropTop != expectCropTop || cropBottom != expectCropBottom || cropLeft != expectCropLeft) {
            errCount++;
        }
        if (cropRight != expectCropRight || stride <= 0 || sliceHeight <= 0) {
            errCount++;
        }
    } else {
        errCount++;
    }
    OH_AVFormat_Destroy(newFormat);
}

void VDecNdkSample::AutoSwitchSurface()
{
    if (autoSwitchSurface) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        if (OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) != AV_ERR_OK) {
            errCount++;
        }
    }
}

void VDecNdkSample::OutputFuncTest()
{
    OH_CryptoDigest_Create("SHA512", &g_ctx);
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        OH_AVCodecBufferAttr attr;
        uint32_t index;
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
        index = signal_->outIdxQueue_.front();
        attr = signal_->attrQueue_.front();
        OH_AVMemory* buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        signal_->attrQueue_.pop();
        lock.unlock();
        if (needCheckOutputDesc) {
            CheckOutputDescription();
            needCheckOutputDesc = false;
        }
        if (attr.flags == AVCODEC_BUFFER_FLAGS_EOS) {
            AutoSwitchSurface();
            Crypto_DataBlob out = { .data = nullptr, .len = 0 };
            OH_CryptoDigest_Final(g_ctx, &out);
            OH_DigestCrypto_Destroy(g_ctx);
            MdCompare(out.data, SHA512_DIGEST_LENGTH, fileSourceSha256);
            OH_Crypto_FreeDataBlob(&out);
            flag = false;
            break;
        }
        ProcessOutputData(buffer, index);
        if (errCount > 0) {
            flag = false;
            break;
        }
    }
}

void VDecNdkSample::ProcessOutputData(OH_AVMemory* buffer, uint32_t index)
{
    if (!sfOutput) {
        uint32_t size = OH_AVMemory_GetSize(buffer);
        if (size >= ((defaultWidth * defaultHeight * THREE) >> 1)) {
            uint8_t* cropBuffer = new uint8_t[size];
            if (SafeMemcpy(cropBuffer, size, OH_AVMemory_GetAddr(buffer), defaultWidth * defaultHeight) !=
                SUCCESS_CODE) {
                cout << "Fatal: memory copy failed Y" << endl;
            }
            // copy UV
            uint32_t uvSize = size - defaultWidth * defaultHeight;
            if (SafeMemcpy(cropBuffer + defaultWidth * defaultHeight,
                           uvSize,
                           OH_AVMemory_GetAddr(buffer) + defaultWidth * defaultHeight,
                           uvSize) != SUCCESS_CODE) {
                cout << "Fatal: memory copy failed UV" << endl;
            }
            Crypto_DataBlob in = { data : cropBuffer, len : size };
            OH_CryptoDigest_Update(g_ctx, &in);
            delete[] cropBuffer;
        }
        if (OH_VideoDecoder_FreeOutputData(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
    } else {
        if (OH_VideoDecoder_RenderOutputData(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: RenderOutputBuffer fail" << endl;
            errCount = errCount + 1;
        }
    }
}

int32_t VDecNdkSample::StateEos()
{
    uint32_t index;
    unique_lock<mutex> lock(signal_->inMutex_);
    signal_->inCond_.wait(lock, [this]() { return signal_->inIdxQueue_.size() > 0; });
    index = signal_->inIdxQueue_.front();
    signal_->inIdxQueue_.pop();
    signal_->inBufferQueue_.pop();
    lock.unlock();
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return OH_VideoDecoder_PushInputData(vdec_, index, attr);
}

void VDecNdkSample::SetEOS(uint32_t index)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int32_t res = OH_VideoDecoder_PushInputData(vdec_, index, attr);
    cout << "OH_VideoDecoder_PushInputData    EOS   res: " << res << endl;
}

int32_t VDecNdkSample::Flush()
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

int32_t VDecNdkSample::Reset()
{
    isRunning_.store(false);
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoDecoder_Reset(vdec_);
}

int32_t VDecNdkSample::Release()
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

int32_t VDecNdkSample::Stop()
{
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    return OH_VideoDecoder_Stop(vdec_);
}

int32_t VDecNdkSample::Start()
{
    isRunning_.store(true);
    return OH_VideoDecoder_Start(vdec_);
}

void VDecNdkSample::StopOutloop()
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

int32_t VDecNdkSample::SetParameter(OH_AVFormat* format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecNdkSample::SwitchSurface()
{
    int32_t ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
    switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
    cout << "manual switch surf " << switchSurfaceFlag << endl;
    return ret;
}

int32_t VDecNdkSample::RepeatCallSetSurface()
{
    int32_t ret = AV_ERR_OK;
    for (int i = 0; i < REPEAT_CALL_TIME; i++) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
        if (ret != AV_ERR_OK && ret != AV_ERR_OPERATE_NOT_PERMIT && ret != AV_ERR_INVALID_STATE) {
            return AV_ERR_OPERATE_NOT_PERMIT;
        }
    }
    return AV_ERR_OK;
}