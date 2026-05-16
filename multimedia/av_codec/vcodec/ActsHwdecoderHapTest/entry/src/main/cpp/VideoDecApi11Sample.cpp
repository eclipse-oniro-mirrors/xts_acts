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
#include "include/VideoDecApi11Sample.h"
#include <arpa/inet.h>
#include <filesystem>
#include <sstream>
#include <string>
#include <sys/time.h>
#include <utility>
#include <vector>
#include "include/CommonTool.h"
#include "include/JsonWrapper.h"

#include <CryptoArchitectureKit/crypto_common.h>
#include <CryptoArchitectureKit/crypto_digest.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr uint32_t REPEAT_CALL_TIME = 10;
constexpr uint32_t MAX_SURF_NUM = 2;
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t MICRO_IN_SECOND = 1000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
constexpr int32_t TWO = 2;
constexpr int32_t THREE = 3;
constexpr int32_t EIGHT = 8;
constexpr int32_t TEN = 10;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t TWENTY_FOUR = 24;
constexpr int32_t HEX_BASE = 16;
constexpr uint8_t H264_NALU_TYPE = 0x1f;
constexpr uint32_t START_CODE_SIZE = 4;
constexpr uint32_t MILLION = 1000000;
constexpr uint32_t HUNDRED = 100;
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
constexpr int32_t DEFAULT_ANGLE = 90;
constexpr auto BUFFER_USAGE_VIDEO_DECODER = (1ULL << 15);
int32_t g_strideSurface = 0;
int32_t g_sliceSurface = 0;
bool g_yuvSurface = false;
OH_CryptoDigest* g_ctx;
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

class ConsumerListenerBuffer {
public:
    ConsumerListenerBuffer(OH_NativeImage* img, std::string_view name) : image_(img)
    {
        listener_.onFrameAvailable = &ConsumerListenerBuffer::OnFrameAvailableStatic;
        listener_.context = this;

        OH_NativeImage_SetOnFrameAvailableListener(image_, listener_);

        outFile_ = std::make_unique<std::ofstream>();
        outFile_->open(name.data(), std::ios::out | std::ios::binary);
    }
    ~ConsumerListenerBuffer()
    {
        OH_NativeImage_UnsetOnFrameAvailableListener(image_);
        if (outFile_ != nullptr) {
            outFile_->close();
        }
    }

private:
    static void OnFrameAvailableStatic(void* ctx)
    {
        auto* self = static_cast<ConsumerListenerBuffer*>(ctx);
        self->OnFrameAvailable();
    }

    void OnFrameAvailable()
    {
        OHNativeWindowBuffer* buffer;
        int32_t flushFence;
        OH_NativeImage_AcquireNativeWindowBuffer(image_, &buffer, &flushFence);
        if (buffer == nullptr) {
            cout << "surface is nullptr" << endl;
            return;
        } else {
            int32_t frameSize = (g_strideSurface * g_sliceSurface * THREE) >> 1;
            BufferHandle* handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
            if (g_yuvSurface && outFile_ != nullptr && frameSize <= handle->size) {
                outFile_->write(reinterpret_cast<char*>(handle->virAddr), frameSize);
            }
        }
        OH_NativeImage_ReleaseNativeWindowBuffer(image_, buffer, -1);
    }

private:
    OH_NativeImage* image_;
    OH_OnFrameAvailableListener listener_;
    int64_t timestamp = 0;
    Region::Rect damage = {};
    std::unique_ptr<std::ofstream> outFile_;
};

class VDecAPI11Sample::Impl {
public:
    ConsumerListenerBuffer* consumerListenerBuffer[2] = {};
};

VDecAPI11Sample::VDecAPI11Sample() : signal_(nullptr)
{
    this->pImpl = new Impl();
}

VDecAPI11Sample::~VDecAPI11Sample()
{
    for (int i = 0; i < MAX_SURF_NUM; i++) {
        if (pImpl->consumerListenerBuffer[i]) {
            delete pImpl->consumerListenerBuffer[i];
            pImpl->consumerListenerBuffer[i] = nullptr;
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
    g_yuvSurface = false;
    abnormalIndexValue = false;
    delete this->pImpl;
    Stop();
    Release();
}

void VdecAPI11Error(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    if (g_decSample == nullptr) {
        return;
    }
    if ((errorCode == AV_ERR_VIDEO_UNSUPPORTED_COLOR_SPACE_CONVERSION) || (errorCode == AV_ERR_UNSUPPORT)) {
        g_decSample->isRunning_.store(false);
        g_decSample->signal_->inCond_.notify_all();
        g_decSample->signal_->outCond_.notify_all();
    }
    cout << "Error errorCode=" << errorCode << endl;
}

void VdecAPI11FormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    if (g_decSample == nullptr) {
        return;
    }
    int32_t currentWidth = 0;
    int32_t currentHeight = 0;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    int32_t picWidth = 0;
    int32_t picHeight = 0;
    int currentFormat = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &currentWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &currentHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &stride);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &picWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &picHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_NATIVE_BUFFER_FORMAT, &currentFormat);
    std::cout << "currentFormat:" << currentFormat << std::endl;
    g_decSample->defaultWidth = currentWidth;
    g_decSample->defaultHeight = currentHeight;
    g_decSample->stride_ = stride;
    g_decSample->sliceHeight_ = sliceHeight;
    g_decSample->picWidth_ = picWidth;
    g_decSample->picHeight_ = picHeight;
    g_decSample->onStreamChangedKey = currentFormat;
    g_strideSurface = stride;
    g_sliceSurface = sliceHeight;
    if (g_decSample->isResChangeStream) {
        static int32_t resCount = 0;
        int32_t cropBottom = 0;
        int32_t cropRight = 0;
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
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
    if (g_decSample == nullptr) {
        return;
    }
    if (g_decSample->isFlushing_) {
        return;
    }
    if (g_decSample->inputCallbackFlush && g_decSample->outCount > 1) {
        g_decSample->Flush();
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
    VDecAPI11Signal* signal = static_cast<VDecAPI11Signal*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

void VdecAPI11OutputDataReady(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    if (g_decSample == nullptr) {
        return;
    }
    if (g_decSample->isFlushing_) {
        return;
    }
    if (g_decSample->outputCallbackFlush && g_decSample->outCount > 1) {
        g_decSample->Flush();
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
    VDecAPI11Signal* signal = static_cast<VDecAPI11Signal*>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

void VDecAPI11Sample::FlushBuffer()
{
    unique_lock<mutex> inLock(signal_->inMutex_);
    clearIntqueue(signal_->inIdxQueue_);
    std::queue<OH_AVBuffer*> empty;
    swap(empty, signal_->inBufferQueue_);
    signal_->inCond_.notify_all();
    unique_lock<mutex> outLock(signal_->outMutex_);
    clearIntqueue(signal_->outIdxQueue_);
    clearBufferqueue(signal_->attrQueue_);
    signal_->outCond_.notify_all();
}

std::vector<uint8_t> VDecAPI11Sample::LoadHashFile()
{
    std::vector<uint8_t> ret;

    JsonWrapper jsonData;
    if (!jsonData.LoadFromFile("/data/storage/el2/base/files/hash_val.json")) {
        return ret;
    }
    std::__fs::filesystem::path filePath = inpDir;
    std::string pixFmt =
        isChecklowLatency ? "nv12_lowlatency" : (defaultPixelFormat == AV_PIXEL_FORMAT_NV12 ? "nv12" : "nv21");
    std::string fileName = filePath.filename().string();
    std::string hashValue = jsonData.GetString(fileName, pixFmt);

    std::stringstream ss(hashValue);
    std::string item;
    while (std::getline(ss, item, ',')) {
        if (!item.empty()) {
            ret.push_back(static_cast<uint8_t>(std::stoul(item, nullptr, HEX_BASE)));
        }
    }
    return ret;
}

static void DumpHashValue(std::vector<uint8_t>& srcHashVal, uint8_t outputHashVal[])
{
    printf("-----------output hash value-----------\n");
    for (int i = 1; i < SHA512_DIGEST_LENGTH + 1; i++) {
        printf("%02x,", outputHashVal[i - 1]);
        if (i % SIXTEEN == 0) {
            printf("\n");
        }
    }
    printf("-----------standard hash value-----------\n");
    for (int i = 1; i < SHA512_DIGEST_LENGTH + 1; i++) {
        printf("%02x,", srcHashVal[i - 1]);
        if (i % SIXTEEN == 0) {
            printf("\n");
        }
    }
}

bool VDecAPI11Sample::MdCompare(uint8_t source[])
{
    std::vector<uint8_t> srcHashVal = LoadHashFile();
    DumpHashValue(srcHashVal, source);
    if (srcHashVal.size() != SHA512_DIGEST_LENGTH) {
        cout << "get hash value failed, size " << srcHashVal.size() << endl;
        return false;
    }
    for (int32_t i = 0; i < SHA512_DIGEST_LENGTH; i++) {
        if (source[i] != srcHashVal[i]) {
            cout << "decoded hash value mismatch" << endl;
            return false;
        }
    }
    return true;
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
    if (autoSwitchSurface && enableSyncMode == 0) {
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
    if (maxInputSize > 0) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, maxInputSize);
    }
    originalWidth = defaultWidth;
    originalHeight = defaultHeight;
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, defaultWidth);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, defaultHeight);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, defaultPixelFormat);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, defaultFrameRate);
    if (setTransform) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_TRANSFORM_TYPE, defaultTransform);
        cout << "config transform: " << defaultTransform << endl;
    }
    if (useHDRSource) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, defaultProfile);
    } else {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, defaultProfile);
    }

    if (transferFlag) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, OH_COLORSPACE_BT709_LIMIT);
    }
    if (nv21Flag) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21);
    }
    if (enableVRR) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_ENABLE_VRR, 1);
    }
    if (enableLowLatency) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENABLE_LOW_LATENCY, lowLatency);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, enableSyncMode);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN, enbleBlankFrame);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

void VDecAPI11Sample::CreateSurface()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    if (cNativeImage[0] == nullptr) {
        cout << "Create the surface consummer fail" << endl;
        return;
    }
    auto result = OH_ConsumerSurface_SetDefaultUsage(
        cNativeImage[0], NATIVEBUFFER_USAGE_MEM_DMA | BUFFER_USAGE_VIDEO_DECODER | NATIVEBUFFER_USAGE_CPU_READ);
    if (result == 0) {
        cout << "set consumer usage succ" << endl;
    } else {
        cout << "set consumer usage failed" << endl;
    }
    pImpl->consumerListenerBuffer[0] = new ConsumerListenerBuffer(cNativeImage[0], outDir);
    pNativeWindow[0] = OH_NativeImage_AcquireNativeWindow(cNativeImage[0]);
    if (autoSwitchSurface) {
        cNativeImage[1] = OH_ConsumerSurface_Create();
        pImpl->consumerListenerBuffer[1] = new ConsumerListenerBuffer(cNativeImage[1], outDir2);
        pNativeWindow[1] = OH_NativeImage_AcquireNativeWindow(cNativeImage[1]);
    }
}

int32_t VDecAPI11Sample::RunVideoDecSurface(string codeName)
{
    sfOutput = true;
    int err = AV_ERR_OK;
    CreateSurface();
    if (!pNativeWindow[0]) {
        OHPrintf("Failed to create surface");
        return AV_ERR_UNKNOWN;
    }

    err = CreateVideoDecoder(codeName);
    if (err != AV_ERR_OK) {
        OHPrintf("Failed to create video decoder");
        return err;
    }

    err = SetVideoDecoderCallback();
    if (err != AV_ERR_OK) {
        OHPrintf("Failed to setCallback");
        Release();
        return err;
    }

    err = ConfigureVideoDecoder();
    if (err != AV_ERR_OK) {
        OHPrintf("Failed to configure video decoder");
        Release();
        return err;
    }

    err = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[0]);
    if (err != AV_ERR_OK) {
        OHPrintf("Failed to set surface");
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
        cout << "Failed to create video decoder" << err << endl;
        return err;
    }

    err = ConfigureVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to configure video decoder" << err << endl;
        Release();
        return err;
    }

    err = SetVideoDecoderCallback();
    if (err != AV_ERR_OK) {
        cout << "Failed to setCallback" << err << endl;
        Release();
        return err;
    }

    err = StartVideoDecoder();
    if (err != AV_ERR_OK) {
        cout << "Failed to start video decoder" << err << endl;
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

int32_t VDecAPI11Sample::StartDecoder()
{
    isRunning_.store(true);
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

int32_t VDecAPI11Sample::StartSyncDecoder()
{
    isRunning_.store(true);
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

int32_t VDecAPI11Sample::StartVideoDecoder()
{
    isRunning_.store(true);
    if (prepareFlag) {
        int res = OH_VideoDecoder_Prepare(vdec_);
        if (res != AV_ERR_OK) {
            cout << "Failed to start codec, prepare failed!  " << res << endl;
            isRunning_.store(false);
            ReleaseInFile();
            Release();
            return res;
        }
    }
    int ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        isRunning_.store(false);
        ReleaseInFile();
        Release();
        return ret;
    }
    if (enableSyncMode == 0) {
        ret = StartDecoder();
    } else {
        ret = StartSyncDecoder();
    }
    return ret;
}

void VDecAPI11Sample::TestApi()
{
    cNativeImage[0] = OH_ConsumerSurface_Create();
    pImpl->consumerListenerBuffer[0] = new ConsumerListenerBuffer(cNativeImage[0], outDir);
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

void VDecAPI11Sample::WaitForEOS()
{
    if (!afterEosDestroyCodec && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecAPI11Sample::InFuncTest()
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
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        OH_VideoDecoder_Start(vdec_);
    }
}

void VDecAPI11Sample::SyncInputFunc()
{
    if (outputYuvSurface) {
        g_yuvSurface = true;
    }
    bool flag = true;
    uint32_t lastIndex = 0;
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
        if (frameCount_ == 0 && getInputBufferIndexRepeat) {
            lastIndex = index;
        } else if (frameCount_ == 1 && getInputBufferIndexRepeat) {
            cout << "getInputBufferIndexRepeat lastIndex: " << lastIndex << "index: " << index << endl;
            if (OH_VideoDecoder_GetInputBuffer(vdec_, lastIndex) == nullptr) {
                cout << "getInputBufferIndexRepeat OH_VideoDecoder_GetInputBuffer nullptr" << endl;
                abnormalIndexValue = true;
            }
            break;
        }
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

void VDecAPI11Sample::InputFuncTest()
{
    if (outputYuvSurface) {
        g_yuvSurface = true;
    }
    bool flag = true;
    while (flag) {
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        InFuncTest();
        uint32_t index;
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() {
            if (!isRunning_.load()) {
                return true;
            }
            return signal_->inIdxQueue_.size() > 0 && !isFlushing_.load();
        });
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        index = signal_->inIdxQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();

        signal_->inIdxQueue_.pop();
        signal_->inBufferQueue_.pop();
        if (!inFile_->eof()) {
            int ret = PushData(index, buffer);
            if (ret == 1) {
                flag = false;
                break;
            }
        }
        lock.unlock();
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
        static uint32_t repeatCount = 0;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        cout << "repeat run " << repeatCount << endl;
        repeatCount++;
        return 0;
    }
    if (inFile_->eof()) {
        SetEOS(index, buffer);
        return 1;
    }
    uint32_t bufferSize = static_cast<uint32_t>(
        (((ch[3] & 0xFF)) | ((ch[2] & 0xFF) << EIGHT) | ((ch[1] & 0xFF) << SIXTEEN) | ((ch[0] & 0xFF) << TWENTY_FOUR)));
    if (useHDRSource) {
        uint32_t zero = 0;
        uint32_t one = 1;
        uint32_t two = 2;
        uint32_t three = 3;
        bufferSize = static_cast<uint32_t>((((ch[zero] & 0xFF)) | ((ch[one] & 0xFF) << EIGHT) |
                                            ((ch[two] & 0xFF) << SIXTEEN) | ((ch[three] & 0xFF) << TWENTY_FOUR)));
    }
    if (bufferSize >= ((defaultWidth * defaultHeight * THREE) >> 1)) {
        cout << "read bufferSize abnormal. buffersize = " << bufferSize << endl;
    }
    return SendData(bufferSize, index, buffer);
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
        return 0;
    }
    if (SafeMemcpy(fileBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != SUCCESS_CODE) {
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
    if (size < bufferSize + START_CODE_SIZE) {
        delete[] fileBuffer;
        return 0;
    }
    uint8_t* avBuffer = OH_AVBuffer_GetAddr(buffer);
    if (avBuffer == nullptr) {
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
    return 0;
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
        if (OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]) != AV_ERR_OK) {
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
    if (isFirstFrame) {
        GetStride();
        isFirstFrame = false;
    }
    if (needCheckOutputDesc) {
        CheckOutputDescription();
        needCheckOutputDesc = false;
    }
    if (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        cout << "AVCODEC_BUFFER_FLAGS_EOS" << endl;
        AutoSwitchSurface();
        Crypto_DataBlob out = { .data = nullptr, .len = 0 };
        OH_CryptoDigest_Final(g_ctx, &out);
        OH_DigestCrypto_Destroy(g_ctx);
        if (!sfOutput && !noCaleHash) {
            if (!MdCompare(out.data)) {
                errCount++;
            }
        }
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

void VDecAPI11Sample::GetStride()
{
    OH_AVFormat* format = OH_VideoDecoder_GetOutputDescription(vdec_);
    if (format == nullptr) {
        return;
    }
    int32_t currentWidth = 0;
    int32_t currentHeight = 0;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    int32_t picWidth = 0;
    int32_t picHeight = 0;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &currentWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &currentHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &stride);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &picWidth);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &picHeight);
    g_decSample->defaultWidth = currentWidth;
    g_decSample->defaultHeight = currentHeight;
    g_decSample->stride_ = stride;
    g_decSample->sliceHeight_ = sliceHeight;
    g_decSample->picWidth_ = picWidth;
    g_decSample->picHeight_ = picHeight;
    OH_AVFormat_Destroy(format);
}

void VDecAPI11Sample::OutputFuncTest()
{
    FILE* outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    OH_CryptoDigest_Create("SHA512", &g_ctx);
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
            return signal_->outIdxQueue_.size() > 0 && !isFlushing_.load();
        });
        if (!isRunning_.load()) {
            flag = false;
            break;
        }
        uint32_t index = signal_->outIdxQueue_.front();
        OH_AVBuffer* buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
            errCount = errCount + 1;
        }
        if (CheckAttrFlag(attr) == -1) {
            flag = false;
            break;
        }
        if (outFile != nullptr) {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, attr.size, outFile);
        }
        ProcessOutputData(buffer, index);
        lock.unlock();
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
    uint32_t outFrames = 0;
    FILE* outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(outDir, "wb");
    }
    OH_CryptoDigest_Create("SHA512", &g_ctx);
    uint32_t lastIndex = 0;
    while (isRunning_.load()) {
        OH_AVCodecBufferAttr attr;
        uint32_t index = 0;
        int32_t ret = OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, syncOutputWaitTime);
        if (ret == AV_ERR_STREAM_CHANGED) {
            GetStride();
            cout << "stream changed" << ret << endl;
            changeCount++;
            continue;
        }
        if (ret != AV_ERR_OK) {
            continue;
        }
        OH_AVBuffer* buffer = OH_VideoDecoder_GetOutputBuffer(vdec_, index);
        if (buffer == nullptr) {
            cout << "OH_VideoDecoder_GetOutputBuffer fail" << endl;
            errCount = errCount + 1;
            continue;
        }
        if (SyncOutputFuncEos(lastIndex, outFrames, index, buffer, attr)) {
            isRunning_.store(false);
            break;
        }
        if (outFile != nullptr) {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, attr.size, outFile);
        }
        ProcessOutputData(buffer, index);
        outFrames = outFrames + 1;
        if (errCount > 0) {
            isRunning_.store(false);
            break;
        }
    }
    if (outFile) {
        (void)fclose(outFile);
    }
}

int32_t VDecAPI11Sample::SyncOutputFuncEos(uint32_t& lastIndex,
                                           uint32_t& outFrames,
                                           uint32_t& index,
                                           OH_AVBuffer* buffer,
                                           OH_AVCodecBufferAttr& attr)
{
    if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
        errCount = errCount + 1;
    }
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
    if (getOutputBufferIndexNoExisted) {
        buffer = OH_VideoDecoder_GetOutputBuffer(vdec_, index + HUNDRED);
        if (buffer == nullptr) {
            abnormalIndexValue = true;
        }
    }
    if (outFrames == 0 && getOutputBufferIndexRepeated) {
        lastIndex = index;
    } else if (outFrames == 1 && getOutputBufferIndexRepeated) {
        buffer = OH_VideoDecoder_GetOutputBuffer(vdec_, lastIndex);
        if (buffer == nullptr) {
            abnormalIndexValue = true;
        }
    }
    return AV_ERR_OK;
}

void VDecAPI11Sample::CopyFrom8BitYuv(OH_AVBuffer* buffer, uint32_t index)
{
    uint8_t* bufferAddr = OH_AVBuffer_GetAddr(buffer);
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    uint32_t cropSize = (picWidth_ * picHeight_ * THREE) >> 1;
    uint8_t* cropBuffer = new uint8_t[cropSize];
    uint8_t* copyPos = cropBuffer;
    if (size >= cropSize) {
        // copy y
        for (int32_t i = 0; i < picHeight_; i++) {
            SafeMemcpy(copyPos, picWidth_, bufferAddr, picWidth_);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        bufferAddr += (sliceHeight_ - picHeight_) * stride_;
        // copy uv
        for (int32_t i = 0; i < picHeight_ >> 1; i++) {
            SafeMemcpy(copyPos, picWidth_, bufferAddr, picWidth_);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        Crypto_DataBlob in = { data : cropBuffer, len : cropSize };
        OH_CryptoDigest_Update(g_ctx, &in);
        delete[] cropBuffer;
    }
    if (OH_VideoDecoder_FreeOutputBuffer(vdec_, index) != AV_ERR_OK) {
        cout << "Fatal: ReleaseOutputBuffer fail" << endl;
        errCount = errCount + 1;
    }
}

void VDecAPI11Sample::CopyFrom10BitYuv(OH_AVBuffer* buffer, uint32_t index)
{
    uint8_t* bufferAddr = OH_AVBuffer_GetAddr(buffer);
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    uint32_t cropSize = (picWidth_ * TWO * picHeight_ * THREE) >> 1;
    uint16_t* cropBuffer = new uint16_t[cropSize];
    uint16_t* copyPos = cropBuffer;
    if (size >= cropSize) {
        // copy y
        for (int32_t i = 0; i < picHeight_; i++) {
            SafeMemcpy(copyPos, picWidth_ * TWO, bufferAddr, picWidth_ * TWO);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        bufferAddr += (sliceHeight_ - picHeight_) * stride_;
        // copy uv
        for (int32_t i = 0; i < picHeight_ >> 1; i++) {
            SafeMemcpy(copyPos, picWidth_ * TWO, bufferAddr, picWidth_ * TWO);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        Crypto_DataBlob in;
        in.data = reinterpret_cast<uint8_t*>(cropBuffer);
        in.len = cropSize;
        OH_CryptoDigest_Update(g_ctx, &in);
        delete[] cropBuffer;
    }
    if (OH_VideoDecoder_FreeOutputBuffer(vdec_, index) != AV_ERR_OK) {
        cout << "Fatal: ReleaseOutputBuffer fail" << endl;
        errCount = errCount + 1;
    }
}

void VDecAPI11Sample::ProcessOutputData(OH_AVBuffer* buffer, uint32_t index)
{
    GetVideoSupportedPixelFormats();
    GetFormatKey();
    if (!sfOutput) {
        GetStride();
        if (is8bitYuv) {
            CopyFrom8BitYuv(buffer, index);
        } else {
            CopyFrom10BitYuv(buffer, index);
        }
    } else {
        if (rsAtTime) {
            RenderOutAtTime(index);
        } else {
            if (OH_VideoDecoder_RenderOutputBuffer(vdec_, index) != AV_ERR_OK) {
                cout << "Fatal: RenderOutputBuffer fail" << endl;
                errCount = errCount + 1;
            }
        }
    }
}

void VDecAPI11Sample::RenderOutAtTime(uint32_t index)
{
    if (isAPI) {
        OH_AVErrCode code = OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, -100000000);
        if (code != AV_ERR_OK) {
            cout << "Fatal: RenderOutputBufferAtTime fail" << endl;
            errCount = code;
        }
    } else {
        int32_t usTimeNum = 1000;
        int32_t msTimeNum = 1000000;
        if (renderTimestampNs == 0) {
            renderTimestampNs = GetSystemTimeUs() * usTimeNum;
        }
        renderTimestampNs = renderTimestampNs + (usTimeNum / defaultFrameRate * msTimeNum);
        OH_AVErrCode code = OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, renderTimestampNs);
        if (code != AV_ERR_OK) {
            cout << "Fatal: RenderOutputBufferAtTime fail" << endl;
            errCount = code;
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
    isFlushing_.store(true);
    if (enableSyncMode == 0) {
        unique_lock<mutex> inLock(signal_->inMutex_);
        clearIntqueue(signal_->inIdxQueue_);
        signal_->inCond_.notify_all();
        inLock.unlock();
        unique_lock<mutex> outLock(signal_->outMutex_);
        clearIntqueue(signal_->outIdxQueue_);
        clearBufferqueue(signal_->attrQueue_);
        signal_->outCond_.notify_all();
        outLock.unlock();
    }
    isRunning_.store(false);
    int32_t ret = OH_VideoDecoder_Flush(vdec_);
    isFlushing_.store(false);
    return ret;
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

int32_t VDecAPI11Sample::Prepare()
{
    return OH_VideoDecoder_Prepare(vdec_);
}

int32_t VDecAPI11Sample::Start()
{
    isRunning_.store(true);
    return OH_VideoDecoder_Start(vdec_);
}

int32_t VDecAPI11Sample::QueryInputBuffer(uint32_t index, int64_t timeoutUs)
{
    return OH_VideoDecoder_QueryInputBuffer(vdec_, &index, timeoutUs);
}

OH_AVBuffer* VDecAPI11Sample::GetInputBuffer(uint32_t index)
{
    return OH_VideoDecoder_GetInputBuffer(vdec_, index);
}

int32_t VDecAPI11Sample::QueryOutputBuffer(uint32_t index, int64_t timeoutUs)
{
    return OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, timeoutUs);
}

OH_AVBuffer* VDecAPI11Sample::GetOutputBuffer(uint32_t index)
{
    return OH_VideoDecoder_GetOutputBuffer(vdec_, index);
}

int32_t VDecAPI11Sample::PushInputBuffer(uint32_t index)
{
    return OH_VideoDecoder_PushInputBuffer(vdec_, index);
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

int32_t VDecAPI11Sample::SetParameter(OH_AVFormat* format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecAPI11Sample::SwitchSurface()
{
    int32_t ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
    switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
    cout << "manual switch surf " << switchSurfaceFlag << endl;
    return ret;
}

int32_t VDecAPI11Sample::RepeatCallSetSurface()
{
    for (int i = 0; i < REPEAT_CALL_TIME; i++) {
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

int32_t VDecAPI11Sample::OpenFile()
{
    inFile_ = make_unique<ifstream>();
    if (inFile_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    inFile_->open(inpDir, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << inpDir << endl;
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

void VDecAPI11Sample::GetVideoSupportedPixelFormats()
{
    if (!isGetVideoSupportedPixelFormats || isGetVideoSupportedPixelFormatsNum != 0) {
        return;
    }
    OH_AVCapability* capability = OH_AVCodec_GetCapability(avcodecMimeType, isEncoder);
    OH_AVCapability_GetVideoSupportedNativeBufferFormats(capability, &pixlFormats, &pixlFormatNum);
    std::cout << "pixlFormats:" << *pixlFormats << "pixlFormatNum:" << pixlFormatNum << std::endl;
    isGetVideoSupportedPixelFormatsNum++;
}

void VDecAPI11Sample::GetFormatKey()
{
    if (!isGetFormatKey || isGetFormatKeyNum != 0) {
        return;
    }
    OH_AVFormat* format = OH_AVFormat_Create();
    OH_VideoDecoder_Configure(vdec_, format);
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_NATIVE_BUFFER_FORMAT, &firstCallBackKey);
    OH_AVFormat_Destroy(format);
    std::cout << "firstCallBackKey:" << firstCallBackKey << std::endl;
    isGetFormatKeyNum++;
}

int32_t VDecAPI11Sample::SetConfigTransform()
{
    int32_t ret = ConfigureVideoDecoder();
    if (ret != AV_ERR_OK) {
        cout << "config failed" << endl;
        return ret;
    }

    ret = OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
    if (ret != AV_ERR_OK) {
        cout << "Failed to set surface" << endl;
        return ret;
    }
    ret = OH_VideoDecoder_Prepare(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec, prepare failed!  " << ret << endl;
        Release();
        return ret;
    }
    ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        cout << "Failed to start codec" << endl;
        Release();
        return ret;
    }
    return AV_ERR_OK;
}

int32_t VDecAPI11Sample::SetParameterTransform()
{
    int32_t ret = SetConfigTransform();
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = SetParameter();
    if (ret != AV_ERR_OK) {
        cout << "set parameter failed" << endl;
        return ret;
    }
    return ret;
}

int32_t VDecAPI11Sample::SetSurface()
{
    return OH_VideoDecoder_SetSurface(vdec_, pNativeWindow[switchSurfaceFlag]);
}

int32_t VDecAPI11Sample::SetParameter()
{
    OH_AVFormat* format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_TRANSFORM_TYPE, defaultTransform);
    cout << "set parameter transform: " << defaultTransform << endl;
    int32_t ret = OH_VideoDecoder_SetParameter(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

int32_t VDecAPI11Sample::GetSurfaceTransform(int32_t surfaceFlag)
{
    int32_t transform = -1;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(pNativeWindow[surfaceFlag], GET_TRANSFORM, &transform);
    if (ret != AV_ERR_OK) {
        cout << "get transform failed, ret = " << ret << endl;
        return ret;
    }
    cout << "get  " << surfaceFlag << "  surface transform: " << transform << endl;
    return transform;
}