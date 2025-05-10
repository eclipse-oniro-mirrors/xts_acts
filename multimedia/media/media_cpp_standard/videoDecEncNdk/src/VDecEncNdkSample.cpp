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

#include "gtest/gtest.h"
#include "audio_info.h"
#include "av_common.h"
#include "native_avcodec_base.h"
#include "avcodec_video_encoder.h"
#include "avcodec_video_decoder.h"
#include "native_avmemory.h"
#include "VDecEncNdkSample.h"

using namespace OHOS;
using namespace OHOS::Media;
using namespace std;

namespace {
    constexpr uint32_t SAMPLE_DURATION_US = 23000;
    constexpr uint32_t ES[] = {
        2106, 11465, 321, 72, 472, 68, 76, 79, 509, 90, 677, 88, 956, 99, 347, 77, 452, 681, 81, 1263, 94, 106, 97,
        998, 97, 797, 93, 1343, 150, 116, 117, 926, 1198, 128, 110, 78, 1582, 158, 135, 112, 1588, 165, 132,
        128, 1697, 168, 149, 117, 1938, 170, 141, 142, 1830, 106, 161, 122, 1623, 160, 154, 156, 1998, 230,
        177, 139, 1650, 186, 128, 134, 1214, 122, 1411, 120, 1184, 128, 1591, 195, 145, 105, 1587, 169, 140,
        118, 1952, 177, 150, 161, 1437, 159, 123, 1758, 180, 165, 144, 1936, 214, 191, 175, 2122, 180, 179,
        160, 1927, 161, 184, 119, 1973, 218, 210, 129, 1962, 196, 127, 154, 2308, 173, 127, 1572, 142, 122};
    constexpr uint32_t ES_LENGTH = sizeof(ES) / sizeof(uint32_t);
    constexpr int32_t STOPNUM = 10000;

    void VdecAsyncError(OH_AVCodec *codec, int32_t errorCode, void *userData)
    {
        cout << "DEC Error errorCode=" << errorCode << endl;
        VDecEncSignal* vcodecSignal_ = static_cast<VDecEncSignal *>(userData);
        vcodecSignal_->errorNum_ += 1;
    }

    void VdecAsyncStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
    {
        cout << "DEC Format Changed" << endl;
    }
    void VdecAsyncNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
    {
        VDecEncSignal* vcodecSignal_ = static_cast<VDecEncSignal *>(userData);
        unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
        if (vcodecSignal_->isVdecFlushing_.load()) {
            cout << "VdecAsyncNeedInputData isVdecFlushing_ is true, return" << endl;
            return;
        }
        vcodecSignal_->inQueueDec_.push(index);
        vcodecSignal_->inBufferQueueDec_.push(data);
        vcodecSignal_->inCondDec_.notify_all();
    }

    void VdecAsyncNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data,
                                OH_AVCodecBufferAttr *attr, void *userData)
    {
        VDecEncSignal* vcodecSignal_ = static_cast<VDecEncSignal *>(userData);
        unique_lock<mutex> lock(vcodecSignal_->outMutexDec_);
        if (vcodecSignal_->isVdecFlushing_.load()) {
            cout << "VdecAsyncNeedInputData isVdecFlushing_ is true, return" << endl;
            return;
        }
        vcodecSignal_->outQueueDec_.push(index);
        vcodecSignal_->flagQueueDec_.push(attr->flags);
        vcodecSignal_->outCondDec_.notify_all();
    }


    void VencAsyncError(OH_AVCodec *codec, int32_t errorCode, void *userData)
    {
        cout << "ENC Error errorCode=" << errorCode << endl;
        VDecEncSignal* vcodecSignal_ = static_cast<VDecEncSignal *>(userData);
        vcodecSignal_->errorNum_ += 1;
    }

    void VencAsyncStreamChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
    {
        cout << "ENC Format Changed" << endl;
    }

    void VencAsyncNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data,
                                OH_AVCodecBufferAttr *attr, void *userData)
    {
        VDecEncSignal* vcodecSignal_ = static_cast<VDecEncSignal *>(userData);
        unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
        if (vcodecSignal_->isVencFlushing_.load()) {
            cout << "VdecAsyncNeedInputData isVencFlushing_ is true, return" << endl;
            return;
        }
        vcodecSignal_->outQueueEnc_.push(index);
        vcodecSignal_->sizeQueueEnc_.push(attr->size);
        vcodecSignal_->flagQueueEnc_.push(attr->flags);
        vcodecSignal_->outBufferQueueEnc_.push(data);
        vcodecSignal_->outCondEnc_.notify_all();
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

VDecEncNdkSample::~VDecEncNdkSample()
{
    OH_VideoDecoder_Destroy(vdec_);
    OH_VideoEncoder_Destroy(venc_);

    delete vcodecSignal_;
    vcodecSignal_ = nullptr;
}

void VDecEncNdkSample::SetReadPath(std::string filepath)
{
    inFile_ = filepath;
    if (testFile_ == nullptr) {
        testFile_ = std::make_unique<std::ifstream>();
    }
    testFile_->open(inFile_, std::ios::in | std::ios::binary);
}

void VDecEncNdkSample::SetSavePath(std::string filepath)
{
    outFile_ = filepath;
}

void VDecEncNdkSample::SetEosState(bool needSetEos)
{
    setEos = needSetEos;
}

void VDecEncNdkSample::ReRead()
{
    if (testFile_ != nullptr) {
        testFile_->close();
        cout << "ReRead close before file success " << endl;
    }
    cout << "ReRead inFile is " << inFile_ << endl;
    testFile_->open(inFile_, std::ios::in | std::ios::binary);
    if (testFile_ != nullptr) {
        cout << "testFile open success" << endl;
    }
    decInCnt_ = 0;
    isFirstDecFrame_ = true;
    timeStampDec_ = 0;
}

void VDecEncNdkSample::ResetDecParam()
{
    decInCnt_ = 0;
    decOutCnt_ = 0;
    isDecInputEOS = false;
    isDecOutputEOS = false;
    unique_lock<mutex> lockIn(vcodecSignal_->inMutexDec_);
    clearIntqueue(vcodecSignal_->inQueueDec_);
    clearBufferqueue(vcodecSignal_->inBufferQueueDec_);
    vcodecSignal_->inCondDec_.notify_all();
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexDec_);
    clearIntqueue(vcodecSignal_->outQueueDec_);
    clearIntqueue(vcodecSignal_->flagQueueDec_);
    clearBufferqueue(vcodecSignal_->outBufferQueueDec_);
    vcodecSignal_->outCondDec_.notify_all();
    isDecRunning_.store(true);
    cout << "isDecRunning_.load() is " << isDecRunning_.load() << endl;
}
void VDecEncNdkSample::ResetEncParam()
{
    encOutCnt_ = 0;
    isEncInputEOS = false;
    isEncOutputEOS = false;
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexEnc_);
    clearIntqueue(vcodecSignal_->outQueueEnc_);
    clearIntqueue(vcodecSignal_->sizeQueueEnc_);
    clearIntqueue(vcodecSignal_->flagQueueEnc_);
    clearBufferqueue(vcodecSignal_->outBufferQueueEnc_);
    vcodecSignal_->outCondEnc_.notify_all();
    isEncRunning_.store(true);
    cout << "isEncRunning_.load() is " << isEncRunning_.load() << endl;
}

struct OH_AVCodec* VDecEncNdkSample::CreateVideoDecoderByMime(std::string mimetype)
{
    if (mimetype == "video/avc") {
        cout << "mimetype == 'video/avc'" << endl;
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    } else {
        vdec_ = OH_VideoDecoder_CreateByMime(mimetype.c_str());
    }
    NDK_CHECK_AND_RETURN_RET_LOG(vdec_ != nullptr, nullptr, "Fatal: OH_VideoDecoder_CreateByMime");
    if (vcodecSignal_ == nullptr) {
        vcodecSignal_ = new VDecEncSignal();
        NDK_CHECK_AND_RETURN_RET_LOG(vcodecSignal_ != nullptr, nullptr, "Fatal: No Memory");
    }
    cbDec_.onError = VdecAsyncError;
    cbDec_.onStreamChanged = VdecAsyncStreamChanged;
    cbDec_.onNeedInputData = VdecAsyncNeedInputData;
    cbDec_.onNeedOutputData = VdecAsyncNewOutputData;
    int32_t ret = OH_VideoDecoder_SetCallback(vdec_, cbDec_, static_cast<void *>(vcodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_VideoDecoder_SetCallback");
    return vdec_;
}

struct OH_AVCodec* VDecEncNdkSample::CreateVideoDecoderByName(std::string name)
{
    vdec_ = OH_VideoDecoder_CreateByName(name.c_str());
    NDK_CHECK_AND_RETURN_RET_LOG(vdec_ != nullptr, nullptr, "Fatal: OH_VideoDecoder_CreateByName");
    if (vcodecSignal_ == nullptr) {
        vcodecSignal_ = new VDecEncSignal();
        NDK_CHECK_AND_RETURN_RET_LOG(vcodecSignal_ != nullptr, nullptr, "Fatal: No Memory");
    }
    cbDec_.onError = VdecAsyncError;
    cbDec_.onStreamChanged = VdecAsyncStreamChanged;
    cbDec_.onNeedInputData = VdecAsyncNeedInputData;
    cbDec_.onNeedOutputData = VdecAsyncNewOutputData;
    int32_t ret = OH_VideoDecoder_SetCallback(vdec_, cbDec_, static_cast<void *>(vcodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_VideoDecoder_SetCallback");
    return vdec_;
}

int32_t VDecEncNdkSample::ConfigureDec(struct OH_AVFormat *format)
{
    return OH_VideoDecoder_Configure(vdec_, format);
}

int32_t VDecEncNdkSample::SetParameterDec(struct OH_AVFormat *format)
{
    return OH_VideoDecoder_SetParameter(vdec_, format);
}

int32_t VDecEncNdkSample::PrepareDec()
{
    return OH_VideoDecoder_Prepare(vdec_);
}

int32_t VDecEncNdkSample::StartDec()
{
    cout << "Enter dec start" << endl;
    isDecRunning_.store(true);

    if (inputLoopDec_ == nullptr) {
        inputLoopDec_ = make_unique<thread>(&VDecEncNdkSample::InputFuncDec, this);
        NDK_CHECK_AND_RETURN_RET_LOG(inputLoopDec_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    if (outputLoopDec_ == nullptr) {
        outputLoopDec_ = make_unique<thread>(&VDecEncNdkSample::OutputFuncDec, this);
        NDK_CHECK_AND_RETURN_RET_LOG(outputLoopDec_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    cout << "Exit dec start" << endl;
    return OH_VideoDecoder_Start(vdec_);
}

int32_t VDecEncNdkSample::StopDec()
{
    cout << "ENTER DEC stop" << endl;
    unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(vcodecSignal_->outMutexDec_);
    vcodecSignal_->isVdecFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret =  OH_VideoDecoder_Stop(vdec_);
    unique_lock<mutex> lockIn(vcodecSignal_->inMutexDec_);
    clearIntqueue(vcodecSignal_->inQueueDec_);
    clearBufferqueue(vcodecSignal_->inBufferQueueDec_);
    vcodecSignal_->inCondDec_.notify_all();
    lockIn.unlock();
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexDec_);
    clearIntqueue(vcodecSignal_->outQueueDec_);
    clearIntqueue(vcodecSignal_->flagQueueDec_);
    clearBufferqueue(vcodecSignal_->outBufferQueueDec_);
    vcodecSignal_->outCondDec_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVdecFlushing_.store(false);
    cout << "EXIT DEC stop" << endl;
    return ret;
}

int32_t VDecEncNdkSample::FlushDec()
{
    cout << "ENTER DEC FLUSH" << endl;
    unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(vcodecSignal_->outMutexDec_);
    vcodecSignal_->isVdecFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret =  OH_VideoDecoder_Flush(vdec_);
    unique_lock<mutex> lockIn(vcodecSignal_->inMutexDec_);
    clearIntqueue(vcodecSignal_->inQueueDec_);
    clearBufferqueue(vcodecSignal_->inBufferQueueDec_);
    vcodecSignal_->inCondDec_.notify_all();
    lockIn.unlock();
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexDec_);
    clearIntqueue(vcodecSignal_->outQueueDec_);
    clearIntqueue(vcodecSignal_->flagQueueDec_);
    clearBufferqueue(vcodecSignal_->outBufferQueueDec_);
    vcodecSignal_->outCondDec_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVdecFlushing_.store(false);
    cout << "EXIT DEC FLUSH" << endl;
    return ret;
}

int32_t VDecEncNdkSample::ResetDec()
{
    cout << "Enter DEC reset" << endl;
    unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
    unique_lock<mutex> lock2(vcodecSignal_->outMutexDec_);
    vcodecSignal_->isVdecFlushing_.store(true);
    lock.unlock();
    lock2.unlock();
    int32_t ret =  OH_VideoDecoder_Reset(vdec_);
    unique_lock<mutex> lockIn(vcodecSignal_->inMutexDec_);
    clearIntqueue(vcodecSignal_->inQueueDec_);
    clearBufferqueue(vcodecSignal_->inBufferQueueDec_);
    vcodecSignal_->inCondDec_.notify_all();
    lockIn.unlock();
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexDec_);
    clearIntqueue(vcodecSignal_->outQueueDec_);
    clearIntqueue(vcodecSignal_->flagQueueDec_);
    clearBufferqueue(vcodecSignal_->outBufferQueueDec_);
    vcodecSignal_->outCondDec_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVdecFlushing_.store(false);
    cout << "Exit DEC reset" << endl;
    return ret;
}

int32_t VDecEncNdkSample::ReleaseDec()
{
    cout << "Enter DEC release" << endl;
    isDecRunning_.store(false);
    if (inputLoopDec_ != nullptr && inputLoopDec_->joinable()) {
        unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
        vcodecSignal_->inQueueDec_.push(STOPNUM);
        vcodecSignal_->inCondDec_.notify_all();
        lock.unlock();
        inputLoopDec_->join();
        inputLoopDec_.reset();
    }
    if (outputLoopDec_ != nullptr && outputLoopDec_->joinable()) {
        unique_lock<mutex> lock(vcodecSignal_->outMutexDec_);
        vcodecSignal_->outQueueDec_.push(STOPNUM);
        vcodecSignal_->outCondDec_.notify_all();
        lock.unlock();
        outputLoopDec_->join();
        outputLoopDec_.reset();
    }
    OH_VideoDecoder_Destroy(vdec_);
    cout << "Exit DEC release" << endl;
    return AV_ERR_OK;
}

void VDecEncNdkSample::PopInqueueDec()
{
    if (vcodecSignal_ == nullptr) {
        return;
    }
    vcodecSignal_->inQueueDec_.pop();
    vcodecSignal_->inBufferQueueDec_.pop();
}

int32_t VDecEncNdkSample::PushInbufferDec(uint32_t index, uint32_t bufferSize)
{
    if (vdec_ == nullptr) {
        return AV_ERR_INVALID_VAL;
    }
    struct OH_AVCodecBufferAttr attr;
    attr.offset = 0;
    if (decInCnt_ == ES_LENGTH) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.pts = 0;
        attr.size = 0;
        cout << "EOS Frame, frameCount = " << decInCnt_ << endl;
        isDecInputEOS = true;
    } else {
        attr.pts = timeStampDec_;
        attr.size = bufferSize;
        if (isFirstDecFrame_) {
            attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            isFirstDecFrame_ = false;
        } else {
            attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
        }
    }
    return OH_VideoDecoder_PushInputData(vdec_, index, attr);
}

void VDecEncNdkSample::InputFuncDec()
{
    while (true) {
        cout << "ENTER DEC IN" << endl;
        if (!isDecRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(vcodecSignal_->inMutexDec_);
        vcodecSignal_->inCondDec_.wait(lock, [this]() { return vcodecSignal_->inQueueDec_.size() > 0; });
        if (!isDecRunning_.load()) {
            break;
        }

        uint32_t index = vcodecSignal_->inQueueDec_.front();
        OH_AVMemory *buffer = reinterpret_cast<OH_AVMemory *>(vcodecSignal_->inBufferQueueDec_.front());
        if (vcodecSignal_->isVdecFlushing_.load() || isDecInputEOS || buffer == nullptr) {
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
                cout << "Finish" << endl;
                break;
            }
            if (memcpy_s(OH_AVMemory_GetAddr(buffer), OH_AVMemory_GetSize(buffer), fileBuffer, bufferSize) != EOK
                || buffer == nullptr) {
                free(fileBuffer);
                PopInqueueDec();
                continue;
            }
            free(fileBuffer);
        }
        if (PushInbufferDec(index, bufferSize) != AV_ERR_OK) {
            cout << "Fatal: OH_VideoDecoder_PushInputData fail, exit" << endl;
            vcodecSignal_->errorNum_ += 1;
        } else {
            decInCnt_++;
        }
        timeStampDec_ += SAMPLE_DURATION_US;
        PopInqueueDec();
    }
}

void VDecEncNdkSample::PopOutqueueDec()
{
    if (vcodecSignal_ == nullptr) {
        return;
    }
    vcodecSignal_->outQueueDec_.pop();
    vcodecSignal_->flagQueueDec_.pop();
}

void VDecEncNdkSample::SendEncEos()
{
    if (vcodecSignal_ == nullptr || venc_== nullptr) {
        return;
    }
    if (setEos) {
        int32_t ret = OH_VideoEncoder_NotifyEndOfStream(venc_);
        if (ret == 0) {
            cout << "ENC IN: input EOS " << endl;
            isEncInputEOS = true;
        } else {
            cout << "ENC IN: input EOS fail" << endl;
            vcodecSignal_->errorNum_ += 1;
        }
    }
}

void VDecEncNdkSample::OutputFuncDec()
{
    while (true) {
        if (!isDecRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(vcodecSignal_->outMutexDec_);
        vcodecSignal_->outCondDec_.wait(lock, [this]() { return vcodecSignal_->outQueueDec_.size() > 0; });
        if (!isDecRunning_.load()) {
            break;
        }
        if (vcodecSignal_->isVdecFlushing_.load() || vcodecSignal_->isVencFlushing_.load() || isEncInputEOS) {
            PopOutqueueDec();
            continue;
        }

        uint32_t index = vcodecSignal_->outQueueDec_.front();
        uint32_t outflag = vcodecSignal_->flagQueueDec_.front();
        if (outflag == 0) {
            uint32_t ret;
            if (needRender) {
                ret = OH_VideoDecoder_RenderOutputData(vdec_, index);
            } else {
                ret = OH_VideoDecoder_FreeOutputData(vdec_, index);
            }
            if (ret == 0) {
                decOutCnt_ += 1;
                cout << "DEC OUT.: render output success, decOutCnt_ is " << decOutCnt_ << endl;
            } else {
                cout << "DEC OUT. Fatal: ReleaseOutputBuffer fail" << endl;
                vcodecSignal_->errorNum_ += 1;
                break;
            }
        } else {
            cout << "DEC OUT.: output EOS" << endl;
            isDecOutputEOS = true;
            SendEncEos();
        }
        PopOutqueueDec();
    }
}

struct OH_AVCodec* VDecEncNdkSample::CreateVideoEncoderByMime(std::string mimetype)
{
    if (mimetype == "video/avc") {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    } else {
        venc_ = OH_VideoEncoder_CreateByMime(mimetype.c_str());
    }
    NDK_CHECK_AND_RETURN_RET_LOG(venc_ != nullptr, nullptr, "Fatal: OH_VideoEncoder_CreateByMime");
    
    if (vcodecSignal_ == nullptr) {
        vcodecSignal_ = new VDecEncSignal();
        NDK_CHECK_AND_RETURN_RET_LOG(vcodecSignal_ != nullptr, nullptr, "Fatal: No Memory");
    }
    cbEnc_.onError = VencAsyncError;
    cbEnc_.onStreamChanged = VencAsyncStreamChanged;
    cbEnc_.onNeedOutputData = VencAsyncNewOutputData;
    int32_t ret = OH_VideoEncoder_SetCallback(venc_, cbEnc_, static_cast<void *>(vcodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_VideoEncoder_SetCallback");
    return venc_;
}

struct OH_AVCodec* VDecEncNdkSample::CreateVideoEncoderByName(std::string name)
{
    venc_ = OH_VideoEncoder_CreateByName(name.c_str());
    NDK_CHECK_AND_RETURN_RET_LOG(venc_ != nullptr, nullptr, "Fatal: OH_VideoEncoder_CreateByName");
    
    if (vcodecSignal_ == nullptr) {
        vcodecSignal_ = new VDecEncSignal();
        NDK_CHECK_AND_RETURN_RET_LOG(vcodecSignal_ != nullptr, nullptr, "Fatal: No Memory");
    }
    cbEnc_.onError = VencAsyncError;
    cbEnc_.onStreamChanged = VencAsyncStreamChanged;
    cbEnc_.onNeedOutputData = VencAsyncNewOutputData;
    int32_t ret = OH_VideoEncoder_SetCallback(venc_, cbEnc_, static_cast<void *>(vcodecSignal_));
    NDK_CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, NULL, "Fatal: OH_VideoEncoder_SetCallback");
    return venc_;
}

int32_t VDecEncNdkSample::ConfigureEnc(struct OH_AVFormat *format)
{
    return OH_VideoEncoder_Configure(venc_, format);
}

int32_t VDecEncNdkSample::SetParameterEnc(struct OH_AVFormat *format)
{
    return OH_VideoEncoder_SetParameter(venc_, format);
}


int32_t VDecEncNdkSample::GetSurface()
{
    return OH_VideoEncoder_GetSurface(venc_, &nativeWindow_);
}

int32_t VDecEncNdkSample::SetOutputSurface()
{
    return OH_VideoDecoder_SetSurface(vdec_, nativeWindow_);
}

int32_t VDecEncNdkSample::PrepareEnc()
{
    return OH_VideoEncoder_Prepare(venc_);
}

int32_t VDecEncNdkSample::StartEnc()
{
    cout << "Enter enc start" << endl;
    isEncRunning_.store(true);
    if (outputLoopEnc_ == nullptr) {
        outputLoopEnc_ = make_unique<thread>(&VDecEncNdkSample::OutputFuncEnc, this);
        NDK_CHECK_AND_RETURN_RET_LOG(outputLoopEnc_ != nullptr, AV_ERR_UNKNOWN, "Fatal: No memory");
    }
    cout << "Exit enc start" << endl;
    return OH_VideoEncoder_Start(venc_);
}

int32_t VDecEncNdkSample::StopEnc()
{
    cout << "Enter enc stop" << endl;
    unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
    vcodecSignal_->isVencFlushing_.store(true);
    lock.unlock();
    int32_t ret =  OH_VideoEncoder_Stop(venc_);
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexEnc_);
    clearIntqueue(vcodecSignal_->outQueueEnc_);
    clearIntqueue(vcodecSignal_->sizeQueueEnc_);
    clearIntqueue(vcodecSignal_->flagQueueEnc_);
    clearBufferqueue(vcodecSignal_->outBufferQueueEnc_);
    vcodecSignal_->outCondEnc_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVencFlushing_.store(false);
    cout << "Exit enc stop" << endl;
    return ret;
}

int32_t VDecEncNdkSample::FlushEnc()
{
    cout << "Enter enc flush" << endl;
    unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
    vcodecSignal_->isVencFlushing_.store(true);
    lock.unlock();
    int32_t ret =  OH_VideoEncoder_Flush(venc_);
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexEnc_);
    clearIntqueue(vcodecSignal_->outQueueEnc_);
    clearIntqueue(vcodecSignal_->sizeQueueEnc_);
    clearIntqueue(vcodecSignal_->flagQueueEnc_);
    clearBufferqueue(vcodecSignal_->outBufferQueueEnc_);
    vcodecSignal_->outCondEnc_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVencFlushing_.store(false);
    cout << "Exit enc flush" << endl;
    return ret;
}

int32_t VDecEncNdkSample::ResetEnc()
{
    cout << "Enter enc reset" << endl;
    unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
    vcodecSignal_->isVencFlushing_.store(true);
    lock.unlock();
    int32_t ret =  OH_VideoEncoder_Reset(venc_);
    unique_lock<mutex> lockOut(vcodecSignal_->outMutexEnc_);
    clearIntqueue(vcodecSignal_->outQueueEnc_);
    clearIntqueue(vcodecSignal_->sizeQueueEnc_);
    clearIntqueue(vcodecSignal_->flagQueueEnc_);
    clearBufferqueue(vcodecSignal_->outBufferQueueEnc_);
    vcodecSignal_->outCondEnc_.notify_all();
    lockOut.unlock();
    vcodecSignal_->isVencFlushing_.store(false);
    cout << "exit enc reset" << endl;
    return ret;
}

int32_t VDecEncNdkSample::ReleaseEnc()
{
    cout << "Enter enc release" << endl;
    isEncRunning_.store(false);
    if (outputLoopEnc_ != nullptr && outputLoopEnc_->joinable()) {
        unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
        vcodecSignal_->outQueueEnc_.push(STOPNUM);
        vcodecSignal_->outCondEnc_.notify_all();
        lock.unlock();
        outputLoopEnc_->join();
        outputLoopEnc_.reset();
    }
    cout << "exit enc release" << endl;
    OH_VideoEncoder_Destroy(venc_);
    cout << "exit enc destroy" << endl;
    return AV_ERR_OK;
}

void VDecEncNdkSample::PopOutqueueEnc()
{
    if (vcodecSignal_ == nullptr) {
        return;
    }
    vcodecSignal_->outQueueEnc_.pop();
    vcodecSignal_->sizeQueueEnc_.pop();
    vcodecSignal_->flagQueueEnc_.pop();
    vcodecSignal_->outBufferQueueEnc_.pop();
}

int32_t VDecEncNdkSample::WriteToFile()
{
    auto buffer = vcodecSignal_->outBufferQueueEnc_.front();
    uint32_t size = vcodecSignal_->sizeQueueEnc_.front();
    if (buffer == nullptr) {
        cout << "getOutPut Buffer fail" << endl;
        return AV_ERR_INVALID_VAL;
    }
    FILE *outFile = fopen(outFile_.c_str(), "a");
    if (outFile == nullptr) {
        cout << "dump data fail" << endl;
        return AV_ERR_INVALID_VAL;
    } else {
        fwrite(OH_AVMemory_GetAddr(buffer), 1, size, outFile);
    }
    return fclose(outFile);
}

void VDecEncNdkSample::OutputFuncEnc()
{
    while (true) {
        if (!isEncRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(vcodecSignal_->outMutexEnc_);
        vcodecSignal_->outCondEnc_.wait(lock, [this]() { return vcodecSignal_->outQueueEnc_.size() > 0; });
        if (!isEncRunning_.load()) {
            break;
        }
        if (vcodecSignal_->isVencFlushing_.load() || isEncOutputEOS) {
            PopOutqueueEnc();
            continue;
        }

        uint32_t index = vcodecSignal_->outQueueEnc_.front();
        uint32_t encOutflag = vcodecSignal_->flagQueueEnc_.front();
        if (encOutflag == 1) {
            cout << "ENC get output EOS" << endl;
            isEncOutputEOS = true;
        } else {
            if (WriteToFile() != 0) {
                PopOutqueueEnc();
                continue;
            }
            uint32_t ret = OH_VideoEncoder_FreeOutputData(venc_, index);
            if (ret != 0) {
                cout << "Fatal: ReleaseOutputBuffer fail" << endl;
                vcodecSignal_->errorNum_ += 1;
            } else {
                encOutCnt_ += 1;
                cout << "ENC OUT.: output success, encOutCnt_ is " << encOutCnt_ << endl;
            }
        }
        PopOutqueueEnc();
    }
}

int32_t VDecEncNdkSample::CalcuError()
{
    cout << "errorNum_ is :" << vcodecSignal_->errorNum_ << endl;
    cout << "decInCnt_ is :" << decInCnt_ << endl;
    cout << "decOutCnt_ is :" << decOutCnt_ << endl;
    cout << "encOutCnt_ is :" << encOutCnt_ << endl;
    cout << "DEC inQueueDec_.size() is " << vcodecSignal_->inQueueDec_.size() << endl;
    cout << "DEC outQueueDec_.size() is " << vcodecSignal_->outQueueDec_.size() << endl;
    cout << "DEC outBufferQueueDec_.size() is " << vcodecSignal_->outBufferQueueDec_.size() << endl;
    cout << "DEC outQueueEnc_.size() is " << vcodecSignal_->outQueueEnc_.size() << endl;
    return vcodecSignal_->errorNum_ ;
}

int32_t VDecEncNdkSample::GetFrameCount()
{
    return encOutCnt_;
}
bool VDecEncNdkSample::GetEncEosState()
{
    return isEncOutputEOS;
}
bool VDecEncNdkSample::GetDecEosState()
{
    return isDecOutputEOS;
}