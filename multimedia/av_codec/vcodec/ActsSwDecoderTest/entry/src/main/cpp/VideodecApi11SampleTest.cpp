/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "include/VideodecApi11SampleTest.h"
#include <arpa/inet.h>
#include <native_window/external_window.h>
#include <sys/time.h>
#include <unistd.h>
#include <utility>
#include "include/Sha512StubTest.h"
using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t MICRO_IN_SECOND = 1000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr int32_t MIN_OUT_FRAMES_BEFORE_INPUT_STREAM_CMD = 2;
constexpr uint32_t MILLION = 1000000;
constexpr int32_t THREE = 3;
constexpr int32_t TEN = 10;
constexpr int32_t EIGHT = 8;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t TWENTY_FOUR = 24;
constexpr uint8_t H264_NALU_TYPE = 0x1f;
constexpr uint8_t SPS = 7;
constexpr uint8_t PPS = 8;
constexpr int32_t START_CODE_SIZE = 4;
constexpr uint8_t START_CODE[START_CODE_SIZE] = { 0, 0, 0, 1 };
constexpr uint32_t RES_CHANGE_TIME = 4;
constexpr uint32_t CROP_INFO_SIZE = 2;
constexpr uint32_t CROP_INFO[RES_CHANGE_TIME][CROP_INFO_SIZE] = { { 621, 1103 },
                                                                  { 1079, 1919 },
                                                                  { 719, 1279 },
                                                                  { 855, 1919 } };

constexpr int32_t CROP_BOTTOM = 0;
constexpr int32_t CROP_RIGHT = 1;
constexpr int32_t DEFAULT_ANGLE = 90;
// PushData: 0=需重试, 1=本帧已推送, 3=已送 EOS/结束输入循环
constexpr int32_t K_PUSH_DATA_RETRY = 0;
constexpr int32_t K_PUSH_DATA_OK = 1;
constexpr int32_t K_PUSH_DATA_EOS = 3;
constexpr uint32_t K_USLEEP_RETRY_DELAY_US = 500;

SHA512_CTX g_c;
unsigned char g_md[SHA512_DIGEST_LENGTH];
VDecAPI11Sample* g_decSample = nullptr;

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

VDecAPI11Sample::~VDecAPI11Sample()
{
    for (int i = 0; i < maxSurfNum; i++) {
        if (nativeWindow[i]) {
            OH_NativeWindow_DestroyNativeWindow(nativeWindow[i]);
            nativeWindow[i] = nullptr;
        }
        if (cNativeImage[i]) {
            OH_NativeImage_Destroy(&cNativeImage[i]);
            cNativeImage[i] = nullptr;
        }
    }
    Stop();
    Release();
}

void VdecAPI11Error(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

void VdecAPI11FormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
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

void VdecAPI11InputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    if (g_decSample->inputCallbackFlush && g_decSample->outCount >= MIN_OUT_FRAMES_BEFORE_INPUT_STREAM_CMD) {
        OH_VideoDecoder_Flush(codec);
        cout << "OH_VideoDecoder_Flush end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    if (g_decSample->inputCallbackStop && g_decSample->outCount >= MIN_OUT_FRAMES_BEFORE_INPUT_STREAM_CMD) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    VDecAPI11Signal* signal = static_cast<VDecAPI11Signal*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push_back(index);
    signal->inBufferQueue_.push_back(data);
    signal->inCond_.notify_all();
}

void VdecAPI11OutputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    if (g_decSample->outputCallbackFlush && g_decSample->outCount >= MIN_OUT_FRAMES_BEFORE_INPUT_STREAM_CMD) {
        OH_VideoDecoder_Flush(codec);
        cout << "OH_VideoDecoder_Flush end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    if (g_decSample->outputCallbackStop && g_decSample->outCount >= MIN_OUT_FRAMES_BEFORE_INPUT_STREAM_CMD) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
        return;
    }
    VDecAPI11Signal* signal = static_cast<VDecAPI11Signal*>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

void VDecAPI11Sample::FlushBuffer()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    signal_->inIdxQueue_.clear();
    signal_->inBufferQueue_.clear();
    signal_->inCond_.notify_all();
    inLock.unlock();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
    outLock.unlock();
}

bool VDecAPI11Sample::MdCompare(unsigned char buffer[], int len, const char* source[])
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
        if (OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]) != AV_ERR_INVALID_STATE) {
            errCount++;
        }
    }
    OH_AVFormat* format = OH_AVFormat_Create();
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

void VDecAPI11Sample::CreateSurface()
{
    constexpr uint32_t kSurfaceSlots = sizeof(nativeWindow) / sizeof(nativeWindow[0]);
    for (uint32_t i = 0; i < kSurfaceSlots; i++) {
        if (nativeWindow[i]) {
            OH_NativeWindow_DestroyNativeWindow(nativeWindow[i]);
            nativeWindow[i] = nullptr;
        }
        if (cNativeImage[i]) {
            OH_NativeImage_Destroy(&cNativeImage[i]);
            cNativeImage[i] = nullptr;
        }
    }

    cNativeImage[0] = OH_ConsumerSurface_Create();
    if (cNativeImage[0] != nullptr) {
        nativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    }

    if (autoSwitchSurface && maxSurfNum > 1) {
        cNativeImage[1] = OH_ConsumerSurface_Create();
        if (cNativeImage[1] != nullptr) {
            nativeWindow[1] = OH_NativeImage_AcquireNativeWindow(cNativeImage[1]);
        }
    }
}

int32_t VDecAPI11Sample::RunVideoDecSurface(string codeName)
{
    sfOutput = true;
    int err = AV_ERR_OK;
    CreateSurface();
    if (!nativeWindow[0]) {
        cout << "Surface unavailable, skip surface test (no NativeWindow)" << endl;
        return AV_ERR_SURFACE_UNAVAILABLE_SKIP;
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
    err = OH_VideoDecoder_SetSurface(vdec_, nativeWindow[0]);
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
    return OH_VideoDecoder_RegisterCallback(vdec_, cb_, static_cast<void*>(signal_));
}

void VDecAPI11Sample::ReleaseInFile()
{
    if (inFile_ != nullptr) {
        if (inFile_->is_open()) {
            inFile_->close();
        }
        inFile_.reset();
        inFile_ = nullptr;
    }
}

void VDecAPI11Sample::StopInloop()
{
    if (inputLoop_ == nullptr || !inputLoop_->joinable()) {
        return;
    }
    if (signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inIdxQueue_.clear();
        signal_->inBufferQueue_.clear();
        isRunning_.store(false);
        signal_->inCond_.notify_all();
        lock.unlock();
    } else {
        isRunning_.store(false);
    }
    inputLoop_->join();
    inputLoop_.reset();
}

int32_t VDecAPI11Sample::CreateVideoDecoder(string codeName)
{
    vdec_ = OH_VideoDecoder_CreateByName(codeName.c_str());
    g_decSample = this;
    return vdec_ == nullptr ? AV_ERR_UNKNOWN : AV_ERR_OK;
}

int32_t VDecAPI11Sample::PrepareStartDecoderOpenInputFile()
{
    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        return AV_ERR_UNKNOWN;
    }
    if (access(inpDir, R_OK) != 0) {
        cout << "input file not readable or missing: " << inpDir << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        return AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP;
    }
    inFile_->open(inpDir, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << inpDir << endl;
        isRunning_.store(false);
        (void)OH_VideoDecoder_Stop(vdec_);
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_INPUT_FILE_UNAVAILABLE_SKIP;
    }
    return AV_ERR_OK;
}

int32_t VDecAPI11Sample::PrepareStartDecoderPipeline()
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
    return PrepareStartDecoderOpenInputFile();
}

int32_t VDecAPI11Sample::StartVideoDecoder()
{
    int32_t prep = PrepareStartDecoderPipeline();
    if (prep != AV_ERR_OK) {
        return prep;
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
    int32_t prep = PrepareStartDecoderPipeline();
    if (prep != AV_ERR_OK) {
        return prep;
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
void VDecAPI11Sample::WaitForEOS()
{
    if (!afterEosDestoryCodec && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecAPI11Sample::InputFuncTestApplyRepeatControls()
{
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
}

bool VDecAPI11Sample::InputFuncTest_FinishIterationAfterPush(int ret, uint32_t index, OH_AVBuffer* buffer, bool& flag)
{
    if (ret == K_PUSH_DATA_EOS) {
        inputPushRetryCount_ = 0;
        flag = false;
        return false;
    }
    if (ret == K_PUSH_DATA_RETRY) {
        inputPushRetryCount_++;
        constexpr uint32_t kMaxInputPushRetry = 500U;
        if (inputPushRetryCount_ > kMaxInputPushRetry) {
            cout << "Input push retry exceeded (no valid NALU or input anomaly), force EOS" << endl;
            errCount++;
            SetEOS(index, buffer);
            inputPushRetryCount_ = 0;
            flag = false;
            return false;
        }
        unique_lock<mutex> relock(signal_->inMutex_);
        signal_->inIdxQueue_.push_front(index);
        signal_->inBufferQueue_.push_front(buffer);
        relock.unlock();
        usleep(K_USLEEP_RETRY_DELAY_US);
        return true;
    }
    inputPushRetryCount_ = 0;
    return false;
}

void VDecAPI11Sample::InputFuncTest()
{
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        InputFuncTestApplyRepeatControls();
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
        signal_->inIdxQueue_.pop_front();
        signal_->inBufferQueue_.pop_front();
        lock.unlock();

        int ret = PushData(index, buffer);
        if (InputFuncTest_FinishIterationAfterPush(ret, index, buffer, flag)) {
            continue;
        }
        if (!flag) {
            break;
        }

        if (sleepOnFPS) {
            usleep(MICRO_IN_SECOND / static_cast<int32_t>(defaultFrameRate));
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
        OH_AVBuffer* buffer = OH_VideoDecoder_GetInputBuffer(vdec_, index);
        if (buffer == nullptr) {
            cout << "OH_VideoDecoder_GetInputBuffer fail" << endl;
            errCount = errCount + 1;
            continue;
        }
        int ret = PushData(index, buffer);
        if (ret == K_PUSH_DATA_EOS) {
            flag = false;
            break;
        }
        if (ret == K_PUSH_DATA_RETRY) {
            int last = K_PUSH_DATA_RETRY;
            constexpr uint32_t kMaxSyncInputPushRetry = 500U;
            for (uint32_t syncRetry = 0; syncRetry < kMaxSyncInputPushRetry && last == K_PUSH_DATA_RETRY; syncRetry++) {
                usleep(K_USLEEP_RETRY_DELAY_US);
                last = PushData(index, buffer);
            }
            if (last == K_PUSH_DATA_EOS) {
                flag = false;
                break;
            }
            if (last == K_PUSH_DATA_RETRY) {
                cout << "Sync input push retry exceeded (no valid NALU or input anomaly), inpDir=" << inpDir << endl;
                errCount++;
                SetEOS(index, buffer);
                flag = false;
                break;
            }
        }

        if (sleepOnFPS) {
            usleep(MICRO_IN_SECOND / static_cast<int32_t>(defaultFrameRate));
        }
    }
}

int32_t VDecAPI11Sample::PushData(uint32_t index, OH_AVBuffer* buffer)
{
    OH_AVCodecBufferAttr attr;
    if (beforeEosInput && frameCount_ > TEN) {
        SetEOS(index, buffer);
        return K_PUSH_DATA_EOS;
    }
    if (beforeEosInputInput && frameCount_ > TEN) {
        SecureMemset(&attr, sizeof(OH_AVCodecBufferAttr), 0, sizeof(OH_AVCodecBufferAttr));
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        beforeEosInputInput = false;
    }
    char ch[START_CODE_SIZE] = {};
    (void)inFile_->read(ch, START_CODE_SIZE);
    if (repeatRun && inFile_->eof()) {
        static uint32_t repeatCount = 0;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        cout << "repeat run " << repeatCount << endl;
        repeatCount++;
        return K_PUSH_DATA_RETRY;
    }
    if (inFile_->eof()) {
        SetEOS(index, buffer);
        return K_PUSH_DATA_EOS;
    }
    constexpr uint32_t kLengthByteIndex2 = 2U;
    constexpr uint32_t kLengthByteIndex3 = 3U;
    uint32_t bufferSize = (static_cast<uint32_t>(ch[0] & 0xFF) << TWENTY_FOUR) |
                          (static_cast<uint32_t>(ch[1] & 0xFF) << SIXTEEN) |
                          (static_cast<uint32_t>(ch[kLengthByteIndex2] & 0xFF) << EIGHT) |
                          static_cast<uint32_t>(ch[kLengthByteIndex3] & 0xFF);
    if (useHDRSource) {
        bufferSize = (static_cast<uint32_t>(ch[kLengthByteIndex3] & 0xFF) << TWENTY_FOUR) |
                     (static_cast<uint32_t>(ch[kLengthByteIndex2] & 0xFF) << SIXTEEN) |
                     (static_cast<uint32_t>(ch[1] & 0xFF) << EIGHT) | static_cast<uint32_t>(ch[0] & 0xFF);
    }
    if (bufferSize >= ((defaultWidth * defaultHeight * THREE) >> 1)) {
        cout << "read bufferSize abnormal. buffersize = " << bufferSize << endl;
        return K_PUSH_DATA_EOS;
    }
    return static_cast<int32_t>(SendData(bufferSize, index, buffer));
}

int32_t VDecAPI11Sample::CheckAndReturnBufferSize(OH_AVBuffer* buffer)
{
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    if (maxInputSize > 0 && (size > maxInputSize)) {
        errCount++;
    }
    return size;
}

uint32_t VDecAPI11Sample::SendData(uint32_t bufferSize, uint32_t index, OH_AVBuffer* buffer)
{
    OH_AVCodecBufferAttr attr;
    uint8_t* fileBuffer = new uint8_t[bufferSize + START_CODE_SIZE];
    if (fileBuffer == nullptr) {
        delete[] fileBuffer;
        return K_PUSH_DATA_RETRY;
    }
    if (SecureMemcpy(fileBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != EOK) {
        cout << "Fatal: memory copy failed" << endl;
    }
    (void)inFile_->read(reinterpret_cast<char*>(fileBuffer) + START_CODE_SIZE, bufferSize);
    if ((fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == SPS ||
        (fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == PPS) {
        attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    }
    int32_t size = CheckAndReturnBufferSize(buffer);
    if (size < static_cast<int32_t>(bufferSize + START_CODE_SIZE)) {
        delete[] fileBuffer;
        return K_PUSH_DATA_RETRY;
    }
    uint8_t* avBuffer = OH_AVBuffer_GetAddr(buffer);
    if (avBuffer == nullptr) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        return K_PUSH_DATA_RETRY;
    }
    if (SecureMemcpy(avBuffer, size, fileBuffer, bufferSize + START_CODE_SIZE) != EOK) {
        delete[] fileBuffer;
        return K_PUSH_DATA_RETRY;
    }
    int64_t startPts = GetSystemTimeUs();
    attr.pts = startPts;
    attr.size = bufferSize + START_CODE_SIZE;
    attr.offset = 0;
    if (isRunning_.load()) {
        OH_AVBuffer_SetBufferAttr(buffer, &attr);
        OH_VideoDecoder_PushInputBuffer(vdec_, index) == AV_ERR_OK ? (0) : (errCount++);
        frameCount_ = frameCount_ + 1;
        outCount = outCount + 1;
        if (autoSwitchSurface && (frameCount_ % static_cast<int32_t>(defaultFrameRate) == 0)) {
            switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
            OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]) == AV_ERR_OK ? (0) : (errCount++);
        }
    }
    delete[] fileBuffer;
    return K_PUSH_DATA_OK;
}

void VDecAPI11Sample::CheckOutputDescription()
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
        if (OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]) != AV_ERR_OK) {
            errCount++;
        }
        OH_AVFormat* format = OH_AVFormat_Create();
        int32_t angle = DEFAULT_ANGLE * reinterpret_cast<int32_t>(switchSurfaceFlag);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, angle);
        OH_VideoDecoder_SetParameter(vdec_, format);
        OH_AVFormat_Destroy(format);
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
        SHA512_Final(g_md, &g_c);
        OpensslCleanse(&g_c, sizeof(g_c));
        MdCompare(g_md, SHA512_DIGEST_LENGTH, fileSourcesha256);
        return -1;
    }
    if (attr.flags == AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        cout << "enc AVCODEC_BUFFER_FLAGS_CODEC_DATA" << attr.pts << endl;
        return 0;
    }
    outFrameCount = outFrameCount + 1;
    return 0;
}

void VDecAPI11Sample::FinishOutputFuncTestOnEos(uint32_t index,
                                                OH_AVBuffer* buffer,
                                                OH_AVCodecBufferAttr& attr,
                                                bool& runFlag)
{
    (void)buffer;
    (void)CheckAttrFlag(attr);
    if (!sfOutput) {
        (void)OH_VideoDecoder_FreeOutputBuffer(vdec_, index);
    } else if (rsAtTime) {
        constexpr int32_t usTimeNum = 1000;
        constexpr int32_t msTimeNum = 1000000;
        if (renderTimestampNs == 0) {
            renderTimestampNs = GetSystemTimeUs() * usTimeNum;
        }
        renderTimestampNs = renderTimestampNs + (usTimeNum / static_cast<int32_t>(defaultFrameRate) * msTimeNum);
        (void)OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, renderTimestampNs);
    } else {
        (void)OH_VideoDecoder_RenderOutputBuffer(vdec_, index);
    }
    runFlag = false;
}

bool VDecAPI11Sample::OutputFuncTest_WaitAndPop(OH_AVCodecBufferAttr& attr, uint32_t& index, OH_AVBuffer*& buffer)
{
    if (!isRunning_.load()) {
        return false;
    }
    unique_lock<mutex> lock(signal_->outMutex_);
    signal_->outCond_.wait(lock, [this]() {
        if (!isRunning_.load()) {
            return true;
        }
        return signal_->outIdxQueue_.size() > 0;
    });
    if (!isRunning_.load()) {
        return false;
    }
    index = signal_->outIdxQueue_.front();
    buffer = signal_->outBufferQueue_.front();
    signal_->outBufferQueue_.pop();
    signal_->outIdxQueue_.pop();
    if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
        errCount = errCount + 1;
    }
    lock.unlock();
    return true;
}

void VDecAPI11Sample::OutputFuncTest()
{
    FILE* outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    SHA512_Init(&g_c);
    bool flag = true;
    while (flag) {
        OH_AVCodecBufferAttr attr;
        uint32_t index = 0;
        OH_AVBuffer* buffer = nullptr;
        if (!OutputFuncTest_WaitAndPop(attr, index, buffer)) {
            flag = false;
            break;
        }
        if (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            FinishOutputFuncTestOnEos(index, buffer, attr, flag);
            break;
        }
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
    FILE* outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    SHA512_Init(&g_c);
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
        OH_AVBuffer* buffer = OH_VideoDecoder_GetOutputBuffer(vdec_, index);
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
        if (!sfOutput) {
            (void)OH_VideoDecoder_FreeOutputBuffer(vdec_, index);
        } else if (rsAtTime) {
            constexpr int32_t usTimeNum = 1000;
            constexpr int32_t msTimeNum = 1000000;
            if (renderTimestampNs == 0) {
                renderTimestampNs = GetSystemTimeUs() * usTimeNum;
            }
            renderTimestampNs = renderTimestampNs + (usTimeNum / static_cast<int32_t>(defaultFrameRate) * msTimeNum);
            (void)OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, renderTimestampNs);
        } else {
            (void)OH_VideoDecoder_RenderOutputBuffer(vdec_, index);
        }
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

void VDecAPI11Sample::ProcessOutputData(OH_AVBuffer* buffer, uint32_t index, int32_t size)
{
    if (!sfOutput) {
        if (size >= ((defaultWidth * defaultHeight * THREE) >> 1)) {
            uint8_t* cropBuffer = new uint8_t[size];
            if (SecureMemcpy(cropBuffer, size, OH_AVBuffer_GetAddr(buffer), defaultWidth * defaultHeight) != EOK) {
                cout << "Fatal: memory copy failed Y" << endl;
            }
            // copy UV
            uint32_t uvSize = size - defaultWidth * defaultHeight;
            if (SecureMemcpy(cropBuffer + defaultWidth * defaultHeight,
                             uvSize,
                             OH_AVBuffer_GetAddr(buffer) + defaultWidth * defaultHeight,
                             uvSize) != EOK) {
                cout << "Fatal: memory copy failed UV" << endl;
            }
            SHA512_Update(&g_c, cropBuffer, size);
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
    signal_->inIdxQueue_.pop_front();
    signal_->inBufferQueue_.pop_front();
    lock.unlock();
    return OH_VideoDecoder_PushInputBuffer(vdec_, index);
}

void VDecAPI11Sample::SetEOS(uint32_t index, OH_AVBuffer* buffer)
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
    signal_->inIdxQueue_.clear();
    signal_->inBufferQueue_.clear();
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
    StopInloop();
    StopOutloop();
    ReleaseInFile();
    int ret = 0;
    if (vdec_ != nullptr) {
        (void)OH_VideoDecoder_Stop(vdec_);
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
    if (vdec_ == nullptr) {
        return 0;
    }
    return OH_VideoDecoder_Stop(vdec_);
}

int32_t VDecAPI11Sample::Start()
{
    isRunning_.store(true);
    return OH_VideoDecoder_Start(vdec_);
}

void VDecAPI11Sample::StopOutloop()
{
    if (outputLoop_ == nullptr || !outputLoop_->joinable()) {
        return;
    }
    if (signal_ != nullptr) {
        unique_lock<mutex> lock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        isRunning_.store(false);
        signal_->outCond_.notify_all();
        lock.unlock();
    } else {
        isRunning_.store(false);
    }
    outputLoop_->join();
    outputLoop_.reset();
}

int32_t VDecAPI11Sample::SetParameter(OH_AVFormat* format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecAPI11Sample::SwitchSurface()
{
    int32_t ret = OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]);
    switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
    cout << "manual switch surf " << switchSurfaceFlag << endl;
    return ret;
}

int32_t VDecAPI11Sample::RepeatCallSetSurface()
{
    for (int i = 0; i < repeatCallTime; i++) {
        switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
        int32_t ret = OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]);
        if (ret != AV_ERR_OK && ret != AV_ERR_OPERATE_NOT_PERMIT && ret != AV_ERR_INVALID_STATE) {
            return AV_ERR_OPERATE_NOT_PERMIT;
        }
    }
    return AV_ERR_OK;
}

int32_t VDecAPI11Sample::DecodeSetSurface()
{
    CreateSurface();
    return OH_VideoDecoder_SetSurface(vdec_, nativeWindow[0]);
}