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
#include <arpa/inet.h>
#include <sys/time.h>
#include <sys/timeb.h>
#include <utility>
#include <vector>
#include <string>
#include <sstream>
#include <random>
#include "openssl/crypto.h"
#include "openssl/sha.h"
#include "videodec_api11_sample.h"
#include "nlohmann/json.hpp"
using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
using namespace nlohmann;
namespace {
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
constexpr uint32_t MILLION = 1000000;
constexpr uint8_t START_CODE[START_CODE_SIZE] = {0, 0, 0, 1};
constexpr uint8_t SPS = 7;
constexpr uint8_t PPS = 8;
constexpr int32_t RES_CHANGE_TIME = 4;
constexpr int32_t CROP_INFO_SIZE = 2;
constexpr int32_t CROP_INFO[RES_CHANGE_TIME][CROP_INFO_SIZE] = {{621, 1103},
    {1079, 1919}, {719, 1279}, {855, 1919}};
constexpr int32_t CROP_BOTTOM = 0;
constexpr int32_t CROP_RIGHT = 1;
constexpr int32_t DEFAULT_ANGLE = 90;
constexpr int32_t SYS_MAX_INPUT_SIZE = 1024 * 1024 * 24;
constexpr int32_t MIN_RANGE = 64;
constexpr int32_t MAX_RANGE = 1920;
constexpr int32_t MIN_FRANGE = 1;
constexpr int32_t MAX_FRANGE = 30;
constexpr int32_t EVEN_NUMBER = 2;
SHA512_CTX g_c;
uint8_t g_md[SHA512_DIGEST_LENGTH];
VDecAPI11Sample *dec_sample = nullptr;

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

class ConsumerListenerBuffer : public IBufferConsumerListener {
public:
    ConsumerListenerBuffer(sptr<Surface> cs, std::string_view name) : cs(cs) {};
    ~ConsumerListenerBuffer() {}
    void OnBufferAvailable() override
    {
        sptr<SurfaceBuffer> buffer;
        int32_t flushFence;
        cs->AcquireBuffer(buffer, flushFence, timestamp, damage);
        cs->ReleaseBuffer(buffer, -1);
    }

private:
    int64_t timestamp = 0;
    Rect damage = {};
    sptr<Surface> cs {nullptr};
};

VDecAPI11Sample::~VDecAPI11Sample()
{
    for (int i = 0; i < MAX_SURF_NUM; i++) {
        if (nativeWindow[i]) {
            OH_NativeWindow_DestroyNativeWindow(nativeWindow[i]);
            nativeWindow[i] = nullptr;
        }
    }
    Stop();
    Release();
}

void VdecAPI11Error(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
}

void VdecAPI11FormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
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
    dec_sample->DEFAULT_WIDTH = currentWidth;
    dec_sample->DEFAULT_HEIGHT = currentHeight;
    dec_sample->stride_ = stride;
    dec_sample->sliceHeight_ = sliceHeight;
    dec_sample->picWidth_ = picWidth;
    dec_sample->picHeight_ = picHeight;
    if (dec_sample->isResChangeStream) {
        static int32_t resCount = 0;
        int32_t cropBottom = 0;
        int32_t cropRight = 0;
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
        if (cropBottom != CROP_INFO[resCount][CROP_BOTTOM] || cropRight != CROP_INFO[resCount][CROP_RIGHT]) {
            dec_sample->errCount++;
        }
        if (stride <= 0 || sliceHeight <= 0) {
            dec_sample->errCount++;
        }
        resCount++;
    }
}

void VdecAPI11InputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    if (dec_sample->isFlushing_) {
        return;
    }
    if (dec_sample->inputCallbackFlush && dec_sample->outCount > 1) {
        dec_sample->Flush();
        cout << "OH_VideoDecoder_Flush end" << endl;
        dec_sample->isRunning_.store(false);
        dec_sample->signal_->inCond_.notify_all();
        dec_sample->signal_->outCond_.notify_all();
        return;
    }
    if (dec_sample->inputCallbackStop && dec_sample->outCount > 1) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        dec_sample->isRunning_.store(false);
        dec_sample->signal_->inCond_.notify_all();
        dec_sample->signal_->outCond_.notify_all();
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
    if (dec_sample->isFlushing_) {
        return;
    }
    if (dec_sample->outputCallbackFlush && dec_sample->outCount > 1) {
        dec_sample->Flush();
        cout << "OH_VideoDecoder_Flush end" << endl;
        dec_sample->isRunning_.store(false);
        dec_sample->signal_->inCond_.notify_all();
        dec_sample->signal_->outCond_.notify_all();
        return;
    }
    if (dec_sample->outputCallbackStop && dec_sample->outCount > 1) {
        OH_VideoDecoder_Stop(codec);
        cout << "OH_VideoDecoder_Stop end" << endl;
        dec_sample->isRunning_.store(false);
        dec_sample->signal_->inCond_.notify_all();
        dec_sample->signal_->outCond_.notify_all();
        return;
    }
    VDecAPI11Signal *signal = static_cast<VDecAPI11Signal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

void VDecAPI11Sample::Flush_buffer()
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

std::vector<uint8_t> VDecAPI11Sample::LoadHashFile()
{
    std::ifstream f("/data/test/media/hash_val.json", ios::in);
    std::vector<uint8_t> ret;
    if (f) {
        json data = json::parse(f);
        filesystem::path filePath = INP_DIR;
        std::string pixFmt = defualtPixelFormat == AV_PIXEL_FORMAT_NV12 ? "nv12" : "nv21";
        std::string fileName = filePath.filename();
        std::string hashValue = data[fileName.c_str()][pixFmt];
        std::stringstream ss(hashValue);
        std::string item;
        while (getline(ss, item, ',')) {
            if (!item.empty()) {
                ret.push_back(stol(item, nullptr, SIXTEEN));
            }
        }
    }
    return ret;
}

static void DumpHashValue(std::vector<uint8_t> &srcHashVal, uint8_t outputHashVal[])
{
    printf("--------------output hash value----------------\n");
    for (int i = 1; i < SHA512_DIGEST_LENGTH + 1; i++) {
        printf("%02x,", outputHashVal[i - 1]);
        if (i % SIXTEEN == 0) {
            printf("\n");
        }
    }
    printf("--------------standard hash value----------------\n");
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
        cout << "get hash value failed, size" << srcHashVal.size() << endl;
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

int32_t HighRand()
{
    std::mt19937 rng(std::random_device{}());
    std::uniform_int_distribution<> dis(MIN_RANGE, MAX_RANGE);
    int hRand = dis(rng);
    if (hRand % EVEN_NUMBER != 0) {
        hRand = hRand + 1;
    }
    cout << "hRand is =  " << hRand << endl;
    return hRand;
}

int32_t FrameRand()
{
    std::mt19937 rng(std::random_device{}());
    std::uniform_int_distribution<> dis(MIN_FRANGE, MAX_FRANGE);
    int fRand = dis(rng);
    if (fRand % EVEN_NUMBER != 0) {
        fRand = fRand + 1;
    }
    cout << "fRand is =  " << fRand << endl;
    return fRand;
}

int32_t WidthRand()
{
    std::mt19937 rng(std::random_device{}());
    std::uniform_int_distribution<> dis(MIN_RANGE, MAX_RANGE);
    int wRand = dis(rng);
    if (wRand % EVEN_NUMBER != 0) {
        wRand = wRand + 1;
    }
    cout << "wRand is =  " << wRand << endl;
    return wRand;
}

int64_t VDecAPI11Sample::GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = (int64_t)now.tv_sec * NANOS_IN_SECOND + now.tv_nsec;
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
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    if (maxInputSize != 0) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, maxInputSize);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, defualtPixelFormat);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    if (useHDRSource) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, DEFAULT_PROFILE);
    }
    if (NV21_FLAG) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV21);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, enbleSyncMode);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN, enbleBlankFrame);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

void VDecAPI11Sample::CreateSurface()
{
    cs[0] = Surface::CreateSurfaceAsConsumer();
    sptr<IBufferConsumerListener> listener = new ConsumerListenerBuffer(cs[0], OUT_DIR);
    cs[0]->RegisterConsumerListener(listener);
    auto p = cs[0]->GetProducer();
    ps[0] = Surface::CreateSurfaceAsProducer(p);
    nativeWindow[0] = CreateNativeWindowFromSurface(&ps[0]);
    if (autoSwitchSurface) {
        cs[1] = Surface::CreateSurfaceAsConsumer();
        sptr<IBufferConsumerListener> listener2 = new ConsumerListenerBuffer(cs[1], OUT_DIR2);
        cs[1]->RegisterConsumerListener(listener2);
        auto p2 = cs[1]->GetProducer();
        ps[1] = Surface::CreateSurfaceAsProducer(p2);
        nativeWindow[1] = CreateNativeWindowFromSurface(&ps[1]);
    }
}

int32_t VDecAPI11Sample::RunVideoDec_Surface(string codeName)
{
    SF_OUTPUT = true;
    int err = AV_ERR_OK;
    CreateSurface();
    if (!nativeWindow[0]) {
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
    SF_OUTPUT = false;
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
    dec_sample = this;
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
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << INP_DIR << endl;
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
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        cout << "failed open file " << INP_DIR << endl;
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
    if (PREPARE_FLAG) {
        int res = OH_VideoDecoder_Prepare(vdec_);
        if (res != AV_ERR_OK) {
            cout << "Failed to start codec, prepare failed! " << res << endl;
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
    if (enbleSyncMode == 0) {
        ret = StartDecoder();
    } else {
        ret = StartSyncDecoder();
    }
    return ret;
}

void VDecAPI11Sample::testAPI()
{
    cs[0] = Surface::CreateSurfaceAsConsumer();
    sptr<IBufferConsumerListener> listener = new ConsumerListenerBuffer(cs[0], OUT_DIR);
    cs[0]->RegisterConsumerListener(listener);
    auto p = cs[0]->GetProducer();
    ps[0] = Surface::CreateSurfaceAsProducer(p);
    nativeWindow[0] = CreateNativeWindowFromSurface(&ps[0]);
    OH_VideoDecoder_SetSurface(vdec_, nativeWindow[0]);

    OH_VideoDecoder_Prepare(vdec_);
    OH_VideoDecoder_Start(vdec_);

    OH_AVFormat *format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
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
    if (!AFTER_EOS_DESTORY_CODEC && inputLoop_ && inputLoop_->joinable()) {
        inputLoop_->join();
    }

    if (outputLoop_ && outputLoop_->joinable()) {
        outputLoop_->join();
    }
}

void VDecAPI11Sample::InFuncTest()
{
    if (REPEAT_START_FLUSH_BEFORE_EOS > 0) {
        REPEAT_START_FLUSH_BEFORE_EOS--;
        OH_VideoDecoder_Flush(vdec_);
        Flush_buffer();
        OH_VideoDecoder_Start(vdec_);
    }
    if (REPEAT_START_STOP_BEFORE_EOS > 0) {
        REPEAT_START_STOP_BEFORE_EOS--;
        OH_VideoDecoder_Stop(vdec_);
        Flush_buffer();
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        OH_VideoDecoder_Start(vdec_);
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
            usleep(MICRO_IN_SECOND / (int32_t)DEFAULT_FRAME_RATE);
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
        if (!inFile_->eof()) {
            int ret = PushData(index, buffer);
            if (ret == 1) {
                flag = false;
                break;
            }
        }
        if (sleepOnFPS) {
            usleep(MICRO_IN_SECOND / (int32_t)DEFAULT_FRAME_RATE);
        }
    }
}

int32_t VDecAPI11Sample::PushData(uint32_t index, OH_AVBuffer *buffer)
{
    OH_AVCodecBufferAttr attr;
    if (BEFORE_EOS_INPUT && frameCount_ > TEN) {
        SetEOS(index, buffer);
        return 1;
    }
    if (BEFORE_EOS_INPUT_INPUT && frameCount_ > TEN) {
        memset_s(&attr, sizeof(OH_AVCodecBufferAttr), 0, sizeof(OH_AVCodecBufferAttr));
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        BEFORE_EOS_INPUT_INPUT = false;
    }
    char ch[4] = {};
    (void)inFile_->read(ch, START_CODE_SIZE);
    if (repeatRun && inFile_->eof()) {
        static uint32_t repeat_count = 0;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        cout << "repeat run " << repeat_count << endl;
        repeat_count++;
        return 0;
    }
    if (inFile_->eof()) {
        SetEOS(index, buffer);
        return 1;
    }
    uint32_t bufferSize = (uint32_t)(((ch[3] & 0xFF)) | ((ch[2] & 0xFF) << EIGHT) | ((ch[1] & 0xFF) << SIXTEEN) |
                                     ((ch[0] & 0xFF) << TWENTY_FOUR));
    if (useHDRSource) {
        uint32_t zero = 0;
        uint32_t one = 1;
        uint32_t two = 2;
        uint32_t three = 3;
        bufferSize = (uint32_t)(((ch[zero] & 0xFF)) | ((ch[one] & 0xFF) << EIGHT) | ((ch[two] & 0xFF) << SIXTEEN) |
                                     ((ch[three] & 0xFF) << TWENTY_FOUR));
    }
    if (bufferSize >= DEFAULT_WIDTH * DEFAULT_HEIGHT * THREE >> 1) {
        cout << "read bufferSize abnormal. buffersize = " << bufferSize << endl;
        return 1;
    }
    return SendData(bufferSize, index, buffer);
}

int32_t VDecAPI11Sample::CheckAndReturnBufferSize(OH_AVBuffer *buffer)
{
    int32_t size = OH_AVBuffer_GetCapacity(buffer);
    if ((maxInputSize < 0) && (size < 0)) {
        errCount++;
    } else if ((maxInputSize > 0) && (size > SYS_MAX_INPUT_SIZE)) {
        errCount++;
    }
    return size;
}

uint32_t VDecAPI11Sample::SendData(uint32_t bufferSize, uint32_t index, OH_AVBuffer *buffer)
{
    OH_AVCodecBufferAttr attr;
    uint8_t *fileBuffer = new uint8_t[bufferSize + START_CODE_SIZE];
    if (fileBuffer == nullptr) {
        delete[] fileBuffer;
        return 0;
    }
    if (memcpy_s(fileBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != EOK) {
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
    uint8_t *avBuffer = OH_AVBuffer_GetAddr(buffer);
    if (avBuffer == nullptr) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        return 0;
    }
    if (memcpy_s(avBuffer, size, fileBuffer, bufferSize + START_CODE_SIZE) != EOK) {
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
        if (autoSwitchSurface && (frameCount_ % (int32_t)DEFAULT_FRAME_RATE == 0)) {
            switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
            OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]) == AV_ERR_OK ? (0) : (errCount++);
        }
    }
    delete[] fileBuffer;
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
        if (cropTop != expectCropTop || cropLeft != expectCropLeft) {
            std::cout << "cropTop:" << cropTop << " cropBottom:" << cropBottom << " cropLeft:" << cropLeft <<std::endl;
            errCount++;
        }
        if (stride <= 0 || sliceHeight <= 0) {
            std::cout << "cropRight:" << cropRight << std::endl;
            std::cout << "stride:" << stride << " sliceHeight:" << sliceHeight << std::endl;
            errCount++;
        }
        if (picWidth != DEFAULT_WIDTH || picHeight != DEFAULT_HEIGHT) {
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
        OH_AVFormat *format = OH_AVFormat_Create();
        int32_t angle = DEFAULT_ANGLE * reinterpret_cast<int32_t>(switchSurfaceFlag);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, angle);
        OH_VideoDecoder_SetParameter(vdec_, format);
        OH_AVFormat_Destroy(format);
    }
}

int32_t VDecAPI11Sample::CheckAttrFlag(OH_AVCodecBufferAttr attr)
{
    if (IS_FIRST_FRAME) {
        GetStride();
        IS_FIRST_FRAME = false;
    }
    if (needCheckOutputDesc) {
        CheckOutputDescription();
        needCheckOutputDesc = false;
    }

    if (attr.flags == AVCODEC_BUFFER_FLAGS_EOS) {
        cout << "AVCODEC_BUFFER_FLAGS_EOS" << endl;
        AutoSwitchSurface();
        SHA512_Final(g_md, &g_c);
        OPENSSL_cleanse(&g_c, sizeof(g_c));
        if (!SF_OUTPUT) {
            if (!MdCompare(g_md)) {
                errCount++;
            }
        }
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
    OH_AVFormat *format = OH_VideoDecoder_GetOutputDescription(vdec_);
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
    dec_sample->DEFAULT_WIDTH = currentWidth;
    dec_sample->DEFAULT_HEIGHT = currentHeight;
    dec_sample->stride_ = stride;
    dec_sample->sliceHeight_ = sliceHeight;
    dec_sample->picWidth_ = picWidth;
    dec_sample->picHeight_ = picHeight;
    OH_AVFormat_Destroy(format);
}

void VDecAPI11Sample::OutputFuncTest()
{
    FILE *outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(OUT_DIR, "wb");
    }
    SHA512_Init(&g_c);
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
        OH_AVBuffer *buffer = signal_->outBufferQueue_.front();
        signal_->outBufferQueue_.pop();
        signal_->outIdxQueue_.pop();
        if (OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
            errCount = errCount + 1;
        }
        if (CheckAttrFlag(attr) == -1) {
            flag = false;
            break;
        }
        ProcessOutputData(buffer, index);
        if (outFile != nullptr) {
            fwrite(OH_AVBuffer_GetAddr(buffer), 1, attr.size, outFile);
        }
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
    FILE *outFile = nullptr;
    if (outputYuvFlag) {
        outFile = fopen(OUT_DIR, "wb");
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
        ProcessOutputData(buffer, index);
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

void VDecAPI11Sample::ProcessOutputData(OH_AVBuffer *buffer, uint32_t index)
{
    if (!SF_OUTPUT) {
        uint8_t *bufferAddr = OH_AVBuffer_GetAddr(buffer);
        uint32_t cropSize = (picWidth_ * picHeight_ * THREE) >> 1;
        uint8_t *cropBuffer = new uint8_t[cropSize];
        uint8_t *copyPos = cropBuffer;
        //copy y
        for (int32_t i = 0; i < picHeight_; i++) {
            memcpy_s(copyPos, picWidth_, bufferAddr, picWidth_);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        bufferAddr += (sliceHeight_ - picHeight_) * stride_;
        //copy uv
        for (int32_t i = 0; i < picHeight_ >> 1; i++) {
            memcpy_s(copyPos, picWidth_, bufferAddr, picWidth_);
            bufferAddr += stride_;
            copyPos += picWidth_;
        }
        SHA512_Update(&g_c, cropBuffer, cropSize);
        delete[] cropBuffer;
        if (OH_VideoDecoder_FreeOutputBuffer(vdec_, index) != AV_ERR_OK) {
            cout << "Fatal: ReleaseOutputBuffer fail" << endl;
            errCount = errCount + 1;
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
            renderTimestampNs = GetSystemTimeUs() / usTimeNum;
        }
        renderTimestampNs = renderTimestampNs + (usTimeNum / DEFAULT_FRAME_RATE * msTimeNum);
        OH_AVErrCode code = OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, index, renderTimestampNs);
        if (code != AV_ERR_OK) {
            cout << "Fatal: RenderOutputBufferAtTime fail" << endl;
            errCount = code;
        }
    }
}

int32_t VDecAPI11Sample::state_EOS()
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
    isFlushing_.store(true);
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

int32_t VDecAPI11Sample::SetParameter(OH_AVFormat *format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecAPI11Sample::SwitchSurface()
{
    int32_t ret = OH_VideoDecoder_SetSurface(vdec_, nativeWindow[switchSurfaceFlag]);
    switchSurfaceFlag = (switchSurfaceFlag == 1) ? 0 : 1;
    cout << "manual switch surf "<< switchSurfaceFlag << endl;
    return ret;
}

int32_t VDecAPI11Sample::RepeatCallSetSurface()
{
    for (int i = 0; i < REPEAT_CALL_TIME; i++) {
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