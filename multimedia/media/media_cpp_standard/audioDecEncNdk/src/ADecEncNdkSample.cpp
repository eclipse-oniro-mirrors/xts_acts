/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

#include "ADecEncNdkSample.h"
#include "native_avmemory.h"
#include "native_averrors.h"
#include "native_avcodec_base.h"

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;

namespace {
    constexpr uint32_t SAMPLE_DURATION_US = 23000;
    constexpr uint32_t STOPNUM = 10000;

    void AdecAsyncError(OH_AVCodec *codec, int32_t errorCode, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        cout << "DEC Error errorCode=" << errorCode << endl;
        acodecSignal_->errorNum_ += 1;
    }

    void AdecAsyncStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
    {
        cout << "DEC Format Changed" << endl;
    }

    void AdecAsyncNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
        if (acodecSignal_->isFlushing_.load()) {
            return;
        }
        acodecSignal_->inQueueDec_.push(index);
        acodecSignal_->inBufferQueueDec_.push(data);
        acodecSignal_->inCondDec_.notify_all();
    }

    void AdecAsyncNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data,
                                OH_AVCodecBufferAttr *attr, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        unique_lock<mutex> lock(acodecSignal_->inMutexEnc_);
        if (acodecSignal_->isFlushing_.load()) {
            cout << "DEC OutputAvailable: isFlushing_.load() is true, return" << endl;
            return;
        }
        acodecSignal_->outQueueDec_.push(index);
        acodecSignal_->sizeQueueDec_.push(attr->size);
        acodecSignal_->flagQueueDec_.push(attr->flags);
        acodecSignal_->outBufferQueueDec_.push(data);
        acodecSignal_->inCondEnc_.notify_all();
    }

    void AencAsyncError(OH_AVCodec *codec, int32_t errorCode, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        cout << "ENC Error errorCode=" << errorCode << endl;
        acodecSignal_->errorNum_ += 1;
    }

    void AencAsyncStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
    {
        cout << "ENC Format Changed" << endl;
    }

    void AencAsyncNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        unique_lock<mutex> lock(acodecSignal_->inMutexEnc_);
        if (acodecSignal_->isFlushing_.load()) {
            return;
        }
        acodecSignal_->inQueueEnc_.push(index);
        acodecSignal_->inBufferQueueEnc_.push(data);
        acodecSignal_->inCondEnc_.notify_all();
    }

    void AencAsyncNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data,
                                OH_AVCodecBufferAttr *attr, void *userData)
    {
        ADecEncSignal* acodecSignal_ = static_cast<ADecEncSignal *>(userData);
        unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
        if (acodecSignal_->isFlushing_.load()) {
            return;
        }
        acodecSignal_->outQueueEnc_.push(index);
        acodecSignal_->sizeQueueEnc_.push(attr->size);
        acodecSignal_->flagQueueEnc_.push(attr->flags);
        acodecSignal_->outBufferQueueEnc_.push(data);
        acodecSignal_->outCondEnc_.notify_all();
    }

    void clearIntqueue (std::queue<uint32_t>& q)
    {
        std::queue<uint32_t> empty;
        swap(empty, q);
    }

    void clearBufferqueue (std::queue<OH_AVMemory *>& q)
    {
        std::queue<OH_AVMemory *> empty;
        swap(empty, q);
    }
}

ADecEncNdkSample::~ADecEncNdkSample()
{
    OH_AudioDecoder_Destroy(adec_);
    OH_AudioEncoder_Destroy(aenc_);
    delete acodecSignal_;
    acodecSignal_ = nullptr;
}

struct OH_AVCodec* ADecEncNdkSample::CreateAudioDecoderByMime(std::string mimetype)
{
    if (mimetype == "audio/mp4a-latm") {
        adec_ = OH_AudioDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    } else {
        adec_ = OH_AudioDecoder_CreateByMime(mimetype.c_str());
    }
    NDK_CHECK_AND_RETURN_RET_LOG(adec_ != nullptr, nullptr, "Fatal: OH_AudioDecoder_CreateByMime");

    acodecSignal_ = new ADecEncSignal();
    NDK_CHECK_AND_RETURN_RET_LOG(acodecSignal_ != nullptr, nullptr, "Fatal: No Memory");

    cbDec_.onError = AdecAsyncError;
    cbDec_.onStreamChanged = AdecAsyncStreamChanged;
    cbDec_.onNeedInputData = AdecAsyncNeedInputData;
    cbDec_.onNeedOutputData = AdecAsyncNewOutputData;
    int32_t ret = OH_AudioDecoder_SetCallback(adec_, cbDec_, static_cast<void *>(acodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_AudioDecoder_SetCallback");
    return adec_;
}

struct OH_AVCodec* ADecEncNdkSample::CreateAudioDecoderByName(std::string name)
{
    adec_ = OH_AudioDecoder_CreateByName(name.c_str());
    NDK_CHECK_AND_RETURN_RET_LOG(adec_ != nullptr, nullptr, "Fatal: OH_AudioDecoder_CreateByName");

    acodecSignal_ = new ADecEncSignal();
    NDK_CHECK_AND_RETURN_RET_LOG(acodecSignal_ != nullptr, nullptr, "Fatal: No Memory");

    cbDec_.onError = AdecAsyncError;
    cbDec_.onStreamChanged = AdecAsyncStreamChanged;
    cbDec_.onNeedInputData = AdecAsyncNeedInputData;
    cbDec_.onNeedOutputData = AdecAsyncNewOutputData;
    int32_t ret = OH_AudioDecoder_SetCallback(adec_, cbDec_, static_cast<void *>(acodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_AudioDecoder_SetCallback");
    return adec_;
}

int32_t ADecEncNdkSample::ConfigureDec(struct OH_AVFormat *format)
{
    return OH_AudioDecoder_Configure(adec_, format);
}

int32_t ADecEncNdkSample::SetParameterDec(struct OH_AVFormat *format)
{
    return OH_AudioDecoder_SetParameter(adec_, format);
}

int32_t ADecEncNdkSample::PrepareDec()
{
    return OH_AudioDecoder_Prepare(adec_);
}

int32_t ADecEncNdkSample::StartDec()
{
    cout << "Enter start dec" << endl;
    isDecRunning_.store(true);
    if (testFile_ == nullptr) {
        testFile_ = std::make_unique<std::ifstream>();
        NDK_CHECK_AND_RETURN_RET_LOG(testFile_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
        testFile_->open(INP_FILE, std::ios::in | std::ios::binary);
    }
    if (inputLoopDec_ == nullptr) {
        inputLoopDec_ = make_unique<thread>(&ADecEncNdkSample::InputFuncDec, this);
        NDK_CHECK_AND_RETURN_RET_LOG(inputLoopDec_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    cout << "Exit start dec" << endl;
    return OH_AudioDecoder_Start(adec_);
}

void ADecEncNdkSample::ResetDecParam()
{
    isDecInputEOS = false;
    isDecOutputEOS = false;
    decInCnt_ = 0;
    decOutCnt_ = 0;
    acodecSignal_->isFlushing_.store(true);
    unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
    clearIntqueue(acodecSignal_->inQueueDec_);
    clearBufferqueue(acodecSignal_->inBufferQueueDec_);
    acodecSignal_->inCondDec_.notify_all();
    lock.unlock();
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueDec_);
    clearIntqueue(acodecSignal_->sizeQueueDec_);
    clearIntqueue(acodecSignal_->flagQueueDec_);
    clearBufferqueue(acodecSignal_->outBufferQueueDec_);
    acodecSignal_->inCondEnc_.notify_all();
    lock2.unlock();
    acodecSignal_->isFlushing_.store(false);
    isDecRunning_.store(true);
}

void ADecEncNdkSample::ResetEncParam()
{
    isEncInputEOS = false;
    isEncOutputEOS = false;
    encInCnt_ = 0;
    encOutCnt_ = 0;
    acodecSignal_->isFlushing_.store(true);
    unique_lock<mutex> lock(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->inQueueEnc_);
    clearBufferqueue(acodecSignal_->inBufferQueueEnc_);
    acodecSignal_->inCondEnc_.notify_all();
    lock.unlock();
    unique_lock<mutex> lock2(acodecSignal_->outMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueEnc_);
    clearIntqueue(acodecSignal_->sizeQueueEnc_);
    clearIntqueue(acodecSignal_->flagQueueEnc_);
    clearBufferqueue(acodecSignal_->outBufferQueueEnc_);
    acodecSignal_->outCondEnc_.notify_all();
    lock2.unlock();
    acodecSignal_->isFlushing_.store(false);
    isEncRunning_.store(true);
}

int32_t ADecEncNdkSample::StopDec()
{
    cout << "ENTER DEC STOP" << endl;
    unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioDecoder_Stop(adec_);
    unique_lock<mutex> lockIn(acodecSignal_->inMutexDec_);
    clearIntqueue(acodecSignal_->inQueueDec_);
    clearBufferqueue(acodecSignal_->inBufferQueueDec_);
    acodecSignal_->inCondDec_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueDec_);
    clearIntqueue(acodecSignal_->sizeQueueDec_);
    clearIntqueue(acodecSignal_->flagQueueDec_);
    clearBufferqueue(acodecSignal_->outBufferQueueDec_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "EXIT DEC STOP" << endl;
    return ret;
}

int32_t ADecEncNdkSample::FlushDec()
{
    cout << "ENTER DEC FLUSH" << endl;
    unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioDecoder_Flush(adec_);
    unique_lock<mutex> lockIn(acodecSignal_->inMutexDec_);
    clearIntqueue(acodecSignal_->inQueueDec_);
    clearBufferqueue(acodecSignal_->inBufferQueueDec_);
    acodecSignal_->inCondDec_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueDec_);
    clearIntqueue(acodecSignal_->sizeQueueDec_);
    clearIntqueue(acodecSignal_->flagQueueDec_);
    clearBufferqueue(acodecSignal_->outBufferQueueDec_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "EXIT DEC FLUSH" << endl;
    return ret;
}

int32_t ADecEncNdkSample::ResetDec()
{
    cout << "enter Reset DEC" << endl;
    unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioDecoder_Reset(adec_);
    unique_lock<mutex> lockIn(acodecSignal_->inMutexDec_);
    clearIntqueue(acodecSignal_->inQueueDec_);
    clearBufferqueue(acodecSignal_->inBufferQueueDec_);
    acodecSignal_->inCondDec_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueDec_);
    clearIntqueue(acodecSignal_->sizeQueueDec_);
    clearIntqueue(acodecSignal_->flagQueueDec_);
    clearBufferqueue(acodecSignal_->outBufferQueueDec_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "exit Reset DEC" << endl;
    return ret;
}

int32_t ADecEncNdkSample::ReleaseDec()
{
    cout << "enter Release DEC" << endl;
    isDecRunning_.store(false);
    isEncRunning_.store(false);
    cout << "isDecRunning_ set false" << endl;
    if (inputLoopDec_ != nullptr && inputLoopDec_->joinable()) {
        unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
        acodecSignal_->inQueueDec_.push(STOPNUM);
        acodecSignal_->inCondDec_.notify_all();
        lock.unlock();
        inputLoopDec_->join();
        inputLoopDec_.reset();
    }
    OH_AudioDecoder_Destroy(adec_);
    cout << "exit Release DEC" << endl;
    return AV_ERR_OK;
}

void ADecEncNdkSample::PopInqueueDec()
{
    if (acodecSignal_ == nullptr) {
        return;
    }
    acodecSignal_->inQueueDec_.pop();
    acodecSignal_->inBufferQueueDec_.pop();
}

int32_t ADecEncNdkSample::PushInbufferDec(uint32_t index, uint32_t bufferSize)
{
    struct OH_AVCodecBufferAttr attr;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (decInCnt_ == ES_LENGTH) {
        cout << "DEC input: set EOS" << endl;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.pts = 0;
        attr.size = 0;
        isDecInputEOS = true;
    } else {
        attr.pts = timeStampDec_;
        attr.size = bufferSize;
    }
    return OH_AudioDecoder_PushInputData(adec_, index, attr);
}

void ADecEncNdkSample::InputFuncDec()
{
    while (true) {
        if (!isDecRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(acodecSignal_->inMutexDec_);
        acodecSignal_->inCondDec_.wait(lock, [this]() {return acodecSignal_->inQueueDec_.size() > 0; });
        if (!isDecRunning_.load()) {
            break;
        }
        uint32_t index = acodecSignal_->inQueueDec_.front();
        OH_AVMemory *buffer = reinterpret_cast<OH_AVMemory *>(acodecSignal_->inBufferQueueDec_.front());
        if (acodecSignal_->isFlushing_.load() || isDecInputEOS || buffer == nullptr) {
            PopInqueueDec();
            continue;
        }
        NDK_CHECK_AND_RETURN_LOG(testFile_ != nullptr && testFile_->is_open(), "Fatal: open file fail");
        uint32_t bufferSize = 0;
        if (decInCnt_ < ES_LENGTH) {
            bufferSize = ES[decInCnt_];
            char *fileBuffer = (char *)malloc(sizeof(char) * bufferSize + 1);
            NDK_CHECK_AND_RETURN_LOG(fileBuffer != nullptr, "Fatal: malloc fail");
            (void)testFile_->read(fileBuffer, bufferSize);
            if (testFile_->eof()) {
                free(fileBuffer);
                break;
            }
            if (memcpy_s(OH_AVMemory_GetAddr(buffer), OH_AVMemory_GetSize(buffer),
                fileBuffer, bufferSize) != EOK) {
                free(fileBuffer);
                PopInqueueDec();
                break;
            }
            free(fileBuffer);
        }
        if (PushInbufferDec(index, bufferSize) != AV_ERR_OK) {
            cout << "Fatal: OH_AudioDecoder_PushInputData fail" << endl;
            acodecSignal_->errorNum_ += 1;
        } else {
            decInCnt_++;
        }
        timeStampDec_ += SAMPLE_DURATION_US;
        PopInqueueDec();
    }
}

struct OH_AVCodec* ADecEncNdkSample::CreateAudioEncoderByMime(std::string mimetype)
{
    if (mimetype == "audio/mp4a-latm") {
        aenc_ = OH_AudioEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    } else {
        aenc_ = OH_AudioEncoder_CreateByMime(mimetype.c_str());
    }
    NDK_CHECK_AND_RETURN_RET_LOG(aenc_ != nullptr, nullptr, "Fatal: OH_AudioEncoder_CreateByMime");
    cbEnc_.onError = AencAsyncError;
    cbEnc_.onStreamChanged = AencAsyncStreamChanged;
    cbEnc_.onNeedInputData = AencAsyncNeedInputData;
    cbEnc_.onNeedOutputData = AencAsyncNewOutputData;
    int32_t ret = OH_AudioEncoder_SetCallback(aenc_, cbEnc_, static_cast<void *>(acodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_AudioEncoder_SetCallback");
    return aenc_;
}

struct OH_AVCodec* ADecEncNdkSample::CreateAudioEncoderByName(std::string name)
{
    aenc_ = OH_AudioEncoder_CreateByName(name.c_str());
    NDK_CHECK_AND_RETURN_RET_LOG(aenc_ != nullptr, nullptr, "Fatal: OH_AudioEncoder_CreateByName");
    cbEnc_.onError = AencAsyncError;
    cbEnc_.onStreamChanged = AencAsyncStreamChanged;
    cbEnc_.onNeedInputData = AencAsyncNeedInputData;
    cbEnc_.onNeedOutputData = AencAsyncNewOutputData;
    int32_t ret = OH_AudioEncoder_SetCallback(aenc_, cbEnc_, static_cast<void *>(acodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_AudioEncoder_SetCallback");
    return aenc_;
}

int32_t ADecEncNdkSample::ConfigureEnc(struct OH_AVFormat *format)
{
    return OH_AudioEncoder_Configure(aenc_, format);
}

int32_t ADecEncNdkSample::SetParameterEnc(struct OH_AVFormat *format)
{
    return OH_AudioEncoder_SetParameter(aenc_, format);
}

int32_t ADecEncNdkSample::PrepareEnc()
{
    return OH_AudioEncoder_Prepare(aenc_);
}

int32_t ADecEncNdkSample::StartEnc()
{
    isEncRunning_.store(true);
    if (inputLoopEnc_ == nullptr) {
        inputLoopEnc_ = make_unique<thread>(&ADecEncNdkSample::InputFuncEnc, this);
        NDK_CHECK_AND_RETURN_RET_LOG(inputLoopEnc_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    if (outputLoopEnc_ == nullptr) {
        outputLoopEnc_ = make_unique<thread>(&ADecEncNdkSample::OutputFuncEnc, this);
        NDK_CHECK_AND_RETURN_RET_LOG(outputLoopEnc_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    return OH_AudioEncoder_Start(aenc_);
}

int32_t ADecEncNdkSample::StopEnc()
{
    cout << "ENTER ENC STOP" << endl;
    unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioEncoder_Stop(aenc_);
    unique_lock<mutex> lockIn(acodecSignal_->outMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueEnc_);
    clearIntqueue(acodecSignal_->sizeQueueEnc_);
    clearIntqueue(acodecSignal_->flagQueueEnc_);
    clearBufferqueue(acodecSignal_->outBufferQueueEnc_);
    acodecSignal_->outCondEnc_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->inQueueEnc_);
    clearBufferqueue(acodecSignal_->inBufferQueueEnc_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "EXIT ENC STOP" << endl;
    return ret;
}

int32_t ADecEncNdkSample::FlushEnc()
{
    cout << "ENTER ENC FLUSH" << endl;
    unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioEncoder_Flush(aenc_);
    unique_lock<mutex> lockIn(acodecSignal_->outMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueEnc_);
    clearIntqueue(acodecSignal_->sizeQueueEnc_);
    clearIntqueue(acodecSignal_->flagQueueEnc_);
    clearBufferqueue(acodecSignal_->outBufferQueueEnc_);
    acodecSignal_->outCondEnc_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->inQueueEnc_);
    clearBufferqueue(acodecSignal_->inBufferQueueEnc_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "EXIT ENC FLUSH" << endl;
    return ret;
}

int32_t ADecEncNdkSample::ResetEnc()
{
    cout << "enter Reset ENC" << endl;
    unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
    unique_lock<mutex> lock2(acodecSignal_->inMutexEnc_);
    acodecSignal_->isFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret = OH_AudioEncoder_Reset(aenc_);
    unique_lock<mutex> lockIn(acodecSignal_->outMutexEnc_);
    clearIntqueue(acodecSignal_->outQueueEnc_);
    clearIntqueue(acodecSignal_->sizeQueueEnc_);
    clearIntqueue(acodecSignal_->flagQueueEnc_);
    clearBufferqueue(acodecSignal_->outBufferQueueEnc_);
    acodecSignal_->outCondEnc_.notify_all();
    unique_lock<mutex> lockOut(acodecSignal_->inMutexEnc_);
    clearIntqueue(acodecSignal_->inQueueEnc_);
    clearBufferqueue(acodecSignal_->inBufferQueueEnc_);
    acodecSignal_->inCondEnc_.notify_all();
    acodecSignal_->isFlushing_.store(false);
    lockIn.unlock();
    lockOut.unlock();
    cout << "exit Reset ENC" << endl;
    return ret;
}

int32_t ADecEncNdkSample::ReleaseEnc()
{
    cout << "enter Release ENC" << endl;
    isEncRunning_.store(false);
    cout << "set isEncRunning_ false success" << endl;
    if (inputLoopEnc_ != nullptr && inputLoopEnc_->joinable()) {
        cout << "enter inputLoopEnc_ set function " << endl;
        unique_lock<mutex> lock(acodecSignal_->inMutexEnc_);
        acodecSignal_->outQueueDec_.push(STOPNUM);
        acodecSignal_->inQueueEnc_.push(STOPNUM);
        acodecSignal_->inCondEnc_.notify_all();
        lock.unlock();
        inputLoopEnc_->join();
        inputLoopEnc_.reset();
    }
    cout << "set inputLoopEnc_ release success" << endl;
    if (outputLoopEnc_ != nullptr && outputLoopEnc_->joinable()) {
        unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
        acodecSignal_->outQueueEnc_.push(STOPNUM);
        acodecSignal_->outCondEnc_.notify_all();
        lock.unlock();
        outputLoopEnc_->join();
        outputLoopEnc_.reset();
    }
    OH_AudioEncoder_Destroy(aenc_);
    cout << "exit RELEASE ENC" << endl;
    return AV_ERR_OK;
}

void ADecEncNdkSample::PopOutqueueDec()
{
    if (acodecSignal_ == nullptr) {
        return;
    }
    acodecSignal_->outQueueDec_.pop();
    acodecSignal_->sizeQueueDec_.pop();
    acodecSignal_->flagQueueDec_.pop();
    acodecSignal_->outBufferQueueDec_.pop();
}

void ADecEncNdkSample::PopInqueueEnc()
{
    if (acodecSignal_ == nullptr) {
        return;
    }
    acodecSignal_->inQueueEnc_.pop();
    acodecSignal_->inBufferQueueEnc_.pop();
}

int32_t ADecEncNdkSample::PushInbufferEnc()
{
    uint32_t indexEnc = acodecSignal_->inQueueEnc_.front();
    OH_AVMemory *bufferEnc = reinterpret_cast<OH_AVMemory *>(acodecSignal_->inBufferQueueEnc_.front());
    if (bufferEnc == nullptr) {
        cout << "Fatal: GetEncInputBuffer fail" << endl;
        return AV_ERR_NO_MEMORY;
    }
    uint32_t indexDec = acodecSignal_->outQueueDec_.front();
    OH_AVMemory *bufferDec = acodecSignal_->outBufferQueueDec_.front();
    uint32_t sizeDecOut = acodecSignal_->sizeQueueDec_.front();
    uint32_t flagDecOut = acodecSignal_->flagQueueDec_.front();

    struct OH_AVCodecBufferAttr attr;
    attr.offset = 0;
    attr.size = sizeDecOut;
    attr.pts = timeStampEnc_;
    attr.flags = 0;
    if (flagDecOut == 1) {
        cout << "DEC output EOS " << endl;
        isDecOutputEOS = true;
        cout << "set isDecOutputEOS = true " << endl;
        if (setEos) {
            isEncInputEOS = true;
            attr.flags = 1;
        }
    } else {
        if (memcpy_s(OH_AVMemory_GetAddr(bufferEnc), OH_AVMemory_GetSize(bufferEnc),
            OH_AVMemory_GetAddr(bufferDec), sizeDecOut) != EOK) {
            cout << "ENC input Fatal: memcpy fail" << endl;
            PopOutqueueDec();
            PopInqueueEnc();
            return AV_ERR_OPERATE_NOT_PERMIT;
        }
        if (OH_AudioDecoder_FreeOutputData(adec_, indexDec) != AV_ERR_OK) {
            cout << "Fatal: DEC ReleaseDecOutputBuffer fail" << endl;
            acodecSignal_->errorNum_ += 1;
        } else {
            decOutCnt_ += 1;
        }
    }
    return OH_AudioEncoder_PushInputData(aenc_, indexEnc, attr);
}

void ADecEncNdkSample::InputFuncEnc()
{
    while (true) {
        cout << "DEC enter InputFuncEnc()" << endl;
        if (!isEncRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(acodecSignal_->inMutexEnc_);
        acodecSignal_->inCondEnc_.wait(lock, [this]() {
            return (acodecSignal_->inQueueEnc_.size() > 0 && acodecSignal_->outQueueDec_.size() > 0);
        });

        if (!isEncRunning_.load()) {
            break;
        }
        if (acodecSignal_->isFlushing_.load() || isDecOutputEOS) {
            PopOutqueueDec();
            PopInqueueEnc();
            continue;
        }
        if (PushInbufferEnc() != AV_ERR_OK) {
            cout << "Fatal error, exit" << endl;
            acodecSignal_->errorNum_ += 1;
        } else {
            encInCnt_++;
        }
        timeStampEnc_ += SAMPLE_DURATION_US;
        PopOutqueueDec();
        PopInqueueEnc();
    }
}

void ADecEncNdkSample::PopOutqueueEnc()
{
    if (acodecSignal_ == nullptr) {
        return;
    }
    acodecSignal_->outQueueEnc_.pop();
    acodecSignal_->sizeQueueEnc_.pop();
    acodecSignal_->flagQueueEnc_.pop();
    acodecSignal_->outBufferQueueEnc_.pop();
}

int32_t ADecEncNdkSample::WriteToFile()
{
    auto buffer = acodecSignal_->outBufferQueueEnc_.front();
    if (buffer == nullptr) {
        cout << "getOutPut Buffer fail" << endl;
        return AV_ERR_INVALID_VAL;
    }
    uint32_t size = acodecSignal_->sizeQueueEnc_.front();
    FILE *outFile = fopen(OUT_FILE, "a");
    if (outFile == nullptr) {
        cout << "dump data fail" << endl;
        return AV_ERR_INVALID_VAL;
    } else {
        fwrite(OH_AVMemory_GetAddr(buffer), 1, size, outFile);
    }
    return fclose(outFile);
}

void ADecEncNdkSample::OutputFuncEnc()
{
    while (true) {
        if (!isEncRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(acodecSignal_->outMutexEnc_);
        acodecSignal_->outCondEnc_.wait(lock, [this]() { return acodecSignal_->outQueueEnc_.size() > 0; });
        if (!isEncRunning_.load()) {
            break;
        }
        if (acodecSignal_->isFlushing_.load() || isEncOutputEOS) {
            PopOutqueueEnc();
            continue;
        }
        uint32_t index = acodecSignal_->outQueueEnc_.front();
        uint32_t encOutflag = acodecSignal_->flagQueueEnc_.front();
        if (encOutflag == 1) {
            cout << "ENC get output EOS" << endl;
            isEncOutputEOS = true;
        } else {
            if (WriteToFile() != 0) {
                PopOutqueueEnc();
                continue;
            }
            if (OH_AudioEncoder_FreeOutputData(aenc_, index) != AV_ERR_OK) {
                cout << "Fatal: ReleaseOutputBuffer fail" << endl;
                acodecSignal_->errorNum_ += 1;
            } else {
                encOutCnt_ += 1;
                cout << "ENC output cnt: " << encOutCnt_ << endl;
            }
        }
        PopOutqueueEnc();
    }
}

void ADecEncNdkSample::SetReadPath(const char * inp_path, uint32_t es[], uint32_t length)
{
    INP_FILE = inp_path;
    ES = es;
    ES_LENGTH = length;
}

void ADecEncNdkSample::ReRead()
{
    if (testFile_ != nullptr) {
        testFile_->close();
        cout << "ReRead close before file success " << endl;
    }
    cout << "ReRead INP_FILE is " << INP_FILE << endl;
    testFile_->open(INP_FILE, std::ios::in | std::ios::binary);
    if (testFile_ != nullptr) {
        cout << "testFile open success" << endl;
    }
    decInCnt_ = 0;
}

void ADecEncNdkSample::SetEosState(bool needSetEos)
{
    setEos = needSetEos;
}

void ADecEncNdkSample::SetSavePath(const char * outp_path)
{
    OUT_FILE = outp_path;
}

int32_t ADecEncNdkSample::CalcuError()
{
    cout << "errorNum_ is :" << acodecSignal_->errorNum_ << endl;
    cout << "decInCnt_ is :" << decInCnt_ << endl;
    cout << "decOutCnt_ is :" << decOutCnt_ << endl;
    cout << "encInCnt_ is :" << encInCnt_ << endl;
    cout << "encOutCnt_ is :" << encOutCnt_ << endl;
    cout << "acodecSignal_->inQueueDec_.size() is :" << acodecSignal_->inQueueDec_.size() << endl;
    cout << "acodecSignal_->outQueueDec_.size() is :" << acodecSignal_->outQueueDec_.size() << endl;
    cout << "acodecSignal_->inQueueEnc_.size() is :" << acodecSignal_->inQueueEnc_.size() << endl;
    cout << "acodecSignal_->outQueueEnc_.size() is :" << acodecSignal_->outQueueEnc_.size() << endl;
    return acodecSignal_->errorNum_ ;
}

int32_t ADecEncNdkSample::GetFrameCount()
{
    return encOutCnt_;
}

bool ADecEncNdkSample::GetEncEosState()
{
    return isEncOutputEOS;
}

bool ADecEncNdkSample::GetDecEosState()
{
    return isDecOutputEOS;
}