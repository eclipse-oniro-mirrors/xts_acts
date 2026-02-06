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
#include "HdrCodecSample.h"
#include <iostream>
#include <string>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>
#include <list>
#include <arpa/inet.h>
#include <sys/time.h>
#include <utility>
#include <memory>

#include "av_common.h"

#include "avcodec_common.h"
#include "native_avdemuxer.h"
#include "native_avsource.h"
#include "native_avmuxer.h"
#include "avcodec_errors.h"
#include "native_avformat.h"
#include "native_avcodec_base.h"
#include "media_description.h"
#include "native_avmemory.h"
#include "native_averrors.h"
#include "surface/window.h"
#include "openssl/crypto.h"
#include "openssl/sha.h"
using namespace OHOS;
using namespace OHOS::Media;
using namespace std;
namespace {
constexpr int64_t NANOS_IN_SECOND = 1000000000L;
constexpr int64_t NANOS_IN_MICRO = 1000L;
std::shared_ptr<std::ifstream> inFile_;
std::condition_variable g_cv;
std::atomic<bool> g_isRunning = true;
constexpr uint32_t START_CODE_SIZE = 4;
constexpr int32_t EIGHT = 8;
constexpr int32_t SIXTEEN = 16;
constexpr int32_t TWENTY_FOUR = 24;
constexpr uint8_t H264_NALU_TYPE = 0x1f;
constexpr uint8_t START_CODE[START_CODE_SIZE] = {0, 0, 0, 1};
constexpr uint8_t SPS = 7;
constexpr uint8_t PPS = 8;
constexpr uint8_t MPEG2_FRAME_HEAD[] = {0x00, 0x00, 0x01, 0x00};
constexpr uint8_t MPEG2_SEQUENCE_HEAD[] = {0x00, 0x00, 0x01, 0xb3};
constexpr uint8_t MPEG4_FRAME_HEAD[] = {0x00, 0x00, 0x01, 0xb6};
constexpr uint8_t MPEG4_SEQUENCE_HEAD[] = {0x00, 0x00, 0x01, 0xb0};
constexpr uint32_t PREREAD_BUFFER_SIZE = 0.1 * 1024 * 1024;
constexpr uint32_t MAX_WIDTH = 4000;
constexpr uint32_t MAX_HEIGHT = 3000;
constexpr uint32_t MAX_NALU_SIZE = MAX_WIDTH * MAX_HEIGHT << 1;
constexpr int32_t AUDIO_BUFFER_SIZE = 1024 * 1024;
constexpr int32_t CHANNEL_0 = 0;
constexpr int32_t CHANNEL_1 = 1;
constexpr int32_t CHANNEL_2 = 2;
constexpr int32_t CHANNEL_3 = 3;
constexpr int32_t CHANNEL_4 = 4;
}

int64_t GetSystemTimeUs()
{
    struct timespec now;
    (void)clock_gettime(CLOCK_BOOTTIME, &now);
    int64_t nanoTime = static_cast<int64_t>(now.tv_sec) * NANOS_IN_SECOND + now.tv_nsec;

    return nanoTime / NANOS_IN_MICRO;
}

void VdecFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    cout << "Format Changed" << endl;
}

void VdecInputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    HDRCodecNdkSample *sample = static_cast<HDRCodecNdkSample *>(userData);
    VSignal *signal = sample->decSignal;
    unique_lock<mutex> lock(signal->inMutex_);
    if (sample->DEMUXER_FLAG) {
        OH_AVCodecBufferAttr attr;
        OH_AVDemuxer_ReadSample(sample->demuxer, sample->videoTrackID, data, &attr);
        OH_VideoDecoder_PushInputData(codec, index, attr);
    } else {
        signal->inIdxQueue_.push(index);
        signal->inBufferQueue_.push(data);
        signal->inCond_.notify_all();
    }
}

void VdecOutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                         void *userData)
{
    HDRCodecNdkSample *sample = static_cast<HDRCodecNdkSample *>(userData);
    if (attr->flags & AVCODEC_BUFFER_FLAGS_EOS) {
        OH_VideoEncoder_NotifyEndOfStream(sample->venc_);
    } else {
        OH_VideoDecoder_RenderOutputData(codec, index);
        sample->frameCountDec++;
    }
}

void VdecError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    HDRCodecNdkSample *sample = static_cast<HDRCodecNdkSample *>(userData);
    sample->errorCount++;
    cout << "VdecError errorCode=" << errorCode << endl;
    g_isRunning.store(false);
    g_cv.notify_all();
}

static void VencError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    HDRCodecNdkSample *sample = static_cast<HDRCodecNdkSample *>(userData);
    sample->errorCount++;
    cout << "VencError errorCode=" << errorCode << endl;
    g_isRunning.store(false);
    g_cv.notify_all();
}

static void VencFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    cout << "Format Changed" << endl;
}

static void VencInputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    (void)codec;
    (void)index;
    (void)data;
    (void)userData;
}

static void VencOutputDataReady(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr,
                                void *userData)
{
    HDRCodecNdkSample *sample = static_cast<HDRCodecNdkSample*>(userData);
    OH_VideoEncoder_FreeOutputData(codec, index);
    if (attr->flags & AVCODEC_BUFFER_FLAGS_EOS) {
        g_isRunning.store(false);
        g_cv.notify_all();
    } else if (attr->flags != AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        sample->frameCountEnc++;
    }
    if (sample->DEMUXER_FLAG) {
        OH_AVMuxer_WriteSample(sample->muxer, sample->videoTrackID, data, *attr);
    }
}

static void clearIntqueue(std::queue<uint32_t> &q)
{
    std::queue<uint32_t> empty;
    swap(empty, q);
}

void HDRCodecNdkSample::PtrStep(uint32_t &bufferSize, unsigned char **pBuffer, uint32_t size)
{
    pPrereadBuffer_ += size;
    bufferSize += size;
    *pBuffer += size;
}

void HDRCodecNdkSample::PtrStepExtraRead(uint32_t &bufferSize, unsigned char **pBuffer)
{
    bufferSize -= START_CODE_SIZE;
    *pBuffer -= START_CODE_SIZE;
    pPrereadBuffer_ = 0;
}

void HDRCodecNdkSample::ProcessInitialSearch(uint32_t &bufferSize, void *&pBuffer)
{
    const uint32_t savedBufferSize = bufferSize;
    void* const savedPBuffer = pBuffer;
    unsigned char* currentBuffer = static_cast<unsigned char*>(pBuffer);
    
    const auto bufferStart = prereadBuffer_.get() + pPrereadBuffer_;
    const auto bufferEnd = prereadBuffer_.get() + prereadBufferSize_;

    const auto frameHeadPos = std::search(bufferStart + START_CODE_SIZE, bufferEnd,
                                          std::begin(MPEG4_FRAME_HEAD), std::end(MPEG4_FRAME_HEAD));
    const uint32_t frameHeadDistance = std::distance(bufferStart, frameHeadPos);

    const auto seqHeadPos = std::search(bufferStart, frameHeadPos,
                                        std::begin(MPEG4_SEQUENCE_HEAD), std::end(MPEG4_SEQUENCE_HEAD));
    const uint32_t seqHeadDistance = std::distance(bufferStart, seqHeadPos);
    
    uint32_t copySize = 0;
    if (seqHeadDistance == 0) {
    const auto nextFrameHeadPos = std::search(frameHeadPos + START_CODE_SIZE, bufferEnd,
                                              std::begin(MPEG4_FRAME_HEAD), std::end(MPEG4_FRAME_HEAD));
        copySize = std::distance(bufferStart, nextFrameHeadPos);
    } else if (frameHeadDistance > seqHeadDistance) {
        copySize = seqHeadDistance;
    } else {
        copySize = frameHeadDistance;
    }
    if (memcpy_s(currentBuffer, copySize, bufferStart, copySize) != EOK) {
        bufferSize = savedBufferSize;
        pBuffer = savedPBuffer;
        mpegUnit_->resize(0);
        return;
    }
    PtrStep(bufferSize, &currentBuffer, copySize);
    pBuffer = currentBuffer;
    const bool shouldContinue = (pPrereadBuffer_ == prereadBufferSize_) && !inFile_->eof();
    if (!shouldContinue) {
        return;
    }
}

void HDRCodecNdkSample::ProcessAdditionalRead(uint32_t &bufferSize, void *&pBuffer)
{
    unsigned char* currentBuffer = static_cast<unsigned char*>(pBuffer);
    
    const uint32_t readSize = PREREAD_BUFFER_SIZE;
    inFile_->read(reinterpret_cast<char*>(prereadBuffer_.get() + START_CODE_SIZE), readSize);
    prereadBufferSize_ = static_cast<uint32_t>(inFile_->gcount()) + START_CODE_SIZE;
    pPrereadBuffer_ = START_CODE_SIZE;

    if (memcpy_s(prereadBuffer_.get(), START_CODE_SIZE,
                 currentBuffer - START_CODE_SIZE, START_CODE_SIZE) != EOK) {
        bufferSize = 0;
        pBuffer = nullptr;
        mpegUnit_->resize(0);
        return;
    }
    PtrStepExtraRead(bufferSize, &currentBuffer);
    pBuffer = currentBuffer;
}

void HDRCodecNdkSample::GetMpeg4BufferSize()
{
    unsigned char* pBuffer = reinterpret_cast<unsigned char*>(mpegUnit_->data());
    uint32_t bufferSize = 0;
    mpegUnit_->resize(MAX_NALU_SIZE);
    
    void* voidBuffer = pBuffer;
    do {
        ProcessInitialSearch(bufferSize, voidBuffer);
        pBuffer = static_cast<unsigned char*>(voidBuffer);
        ProcessAdditionalRead(bufferSize, voidBuffer);
        pBuffer = static_cast<unsigned char*>(voidBuffer);
    } while (pPrereadBuffer_ != prereadBufferSize_ && !inFile_->eof());
    
    mpegUnit_->resize(bufferSize);
}

void HDRCodecNdkSample::GetBufferSize()
{
    auto pBuffer = mpegUnit_->data();
    uint32_t bufferSize = 0;
    mpegUnit_->resize(MAX_NALU_SIZE);
    do {
        auto pos1 = std::search(prereadBuffer_.get() + pPrereadBuffer_ + START_CODE_SIZE,
            prereadBuffer_.get() + prereadBufferSize_, std::begin(MPEG2_FRAME_HEAD), std::end(MPEG2_FRAME_HEAD));
        uint32_t size1 = std::distance(prereadBuffer_.get() + pPrereadBuffer_, pos1);
        auto pos2 = std::search(prereadBuffer_.get() + pPrereadBuffer_, prereadBuffer_.get() +
            pPrereadBuffer_ + size1, std::begin(MPEG2_SEQUENCE_HEAD), std::end(MPEG2_SEQUENCE_HEAD));
        uint32_t size = std::distance(prereadBuffer_.get() + pPrereadBuffer_, pos2);
        if (size == 0) {
            auto pos3 = std::search(prereadBuffer_.get() + pPrereadBuffer_ + size1 + START_CODE_SIZE,
            prereadBuffer_.get() + prereadBufferSize_, std::begin(MPEG2_FRAME_HEAD), std::end(MPEG2_FRAME_HEAD));
            uint32_t size2 = std::distance(prereadBuffer_.get() + pPrereadBuffer_, pos3);
            if (memcpy_s(pBuffer, size2, prereadBuffer_.get() + pPrereadBuffer_, size2) != EOK) {
                return;
            }
            PtrStep(bufferSize, &pBuffer, size2);
            if (!((pPrereadBuffer_ == prereadBufferSize_) && !inFile_->eof())) {
                break;
            }
        } else if (size1 > size) {
            if (memcpy_s(pBuffer, size, prereadBuffer_.get() + pPrereadBuffer_, size) != EOK) {
                return;
            }
            PtrStep(bufferSize, &pBuffer, size);
            if (!((pPrereadBuffer_ == prereadBufferSize_) && !inFile_->eof())) {
                break;
            }
        } else {
            if (memcpy_s(pBuffer, size1, prereadBuffer_.get() + pPrereadBuffer_, size1) != EOK) {
                return;
            }
            PtrStep(bufferSize, &pBuffer, size1);
            if (!((pPrereadBuffer_ == prereadBufferSize_) && !inFile_->eof())) {
                break;
            }
        }
        inFile_->read(reinterpret_cast<char *>(prereadBuffer_.get() + START_CODE_SIZE), PREREAD_BUFFER_SIZE);
        prereadBufferSize_ = inFile_->gcount() + START_CODE_SIZE;
        pPrereadBuffer_ = START_CODE_SIZE;
        if (memcpy_s(prereadBuffer_.get(), START_CODE_SIZE, pBuffer - START_CODE_SIZE, START_CODE_SIZE) != EOK) {
            return;
        }
        PtrStepExtraRead(bufferSize, &pBuffer);
    } while (pPrereadBuffer_ != prereadBufferSize_);
    mpegUnit_->resize(bufferSize);
}

int32_t HDRCodecNdkSample::SendDataHdr(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    uint32_t bufferSize = 0;
    int32_t result = 0;
    OH_AVCodecBufferAttr attr;
    static bool isFirstFrame = true;
    (void)inFile_->read(reinterpret_cast<char *>(&bufferSize), sizeof(uint32_t));
    if (inFile_->eof()) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        return 1;
    }
    if (isFirstFrame) {
        attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
        isFirstFrame = false;
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    }
    int32_t size = OH_AVMemory_GetSize(data);
    uint8_t *avBuffer = OH_AVMemory_GetAddr(data);
    if (avBuffer == nullptr) {
        return 0;
    }
    uint8_t *fileBuffer = new uint8_t[bufferSize];
    if (fileBuffer == nullptr) {
        cout << "Fatal: no memory" << endl;
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return 0;
    }
    (void)inFile_->read(reinterpret_cast<char *>(fileBuffer), bufferSize);
    if (memcpy_s(avBuffer, size, fileBuffer, bufferSize) != EOK) {
        delete[] fileBuffer;
        fileBuffer = nullptr;
        cout << "Fatal: memcpy fail" << endl;
        return 0;
    }
    delete[] fileBuffer;
    fileBuffer = nullptr;
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize;
    attr.offset = 0;
    result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed,error:" << result << endl;
    } else {
        inputNum++;
    }
    return 0;
}

int32_t HDRCodecNdkSample::SendDataH263(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    OH_AVCodecBufferAttr attr;
    char ch[4] = {};
    (void)inFile_->read(ch, START_CODE_SIZE);
    if (inFile_->eof()) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        return 1;
    }
    uint32_t bufferSize = (uint32_t)(((ch[3] & 0xFF)) | ((ch[2] & 0xFF) << EIGHT) | ((ch[1] & 0xFF) << SIXTEEN) |
                                     ((ch[0] & 0xFF) << TWENTY_FOUR));
    if (bufferSize != 0) {
        attr.flags = AVCODEC_BUFFER_FLAGS_SYNC_FRAME + AVCODEC_BUFFER_FLAGS_CODEC_DATA;
    } else {
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        return 1;
    }
    int32_t size = OH_AVMemory_GetSize(data);
    if (size < bufferSize) {
        return 0;
    }
    uint8_t *avBuffer = OH_AVMemory_GetAddr(data);
    if (avBuffer == nullptr) {
        return 0;
    }
    uint8_t *fileBuffer = new uint8_t[bufferSize];
    if (fileBuffer == nullptr) {
        delete[] fileBuffer;
        return 0;
    }
    (void)inFile_->read(reinterpret_cast<char *>(fileBuffer), bufferSize);
    if (memcpy_s(avBuffer, size, fileBuffer, bufferSize) != EOK) {
        delete[] fileBuffer;
        return 0;
    }
    delete[] fileBuffer;
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize;
    attr.offset = 0;
    int32_t result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed,error:" << result << endl;
    } else {
        inputNum++;
    }
    return 0;
}

int32_t DecAvcPushData(OH_AVMemory *data, uint32_t bufferSize, uint8_t *fileBuffer)
{
    int32_t size = OH_AVMemory_GetSize(data);
    if (size < bufferSize + START_CODE_SIZE) {
        cout << "error: size < bufferSize" << endl;
        return 1;
    }
    uint8_t *avBuffer = OH_AVMemory_GetAddr(data);
    if (avBuffer == nullptr) {
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return 1;
    }
    if (fileBuffer == nullptr) {
        cout << "error: fileBuffer is null" << endl;
        return 1;
    }
    if (memcpy_s(avBuffer, size, fileBuffer, bufferSize + START_CODE_SIZE) != EOK) {
        delete[] fileBuffer;
        fileBuffer = nullptr;
        cout << "Fatal: memcpy fail" << endl;
        return 1;
    }
    delete[] fileBuffer;
    fileBuffer = nullptr;
    return 0;
}

int32_t HDRCodecNdkSample::SendDataAvc(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    OH_AVCodecBufferAttr attr;
    char ch[4] = {};
    (void)inFile_->read(ch, START_CODE_SIZE);
    if (inFile_->eof()) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        return 1;
    }
    uint32_t bufferSize = (uint32_t)(((ch[3] & 0xFF)) | ((ch[2] & 0xFF) << EIGHT) | ((ch[1] & 0xFF) << SIXTEEN) |
                                     ((ch[0] & 0xFF) << TWENTY_FOUR));
    uint8_t *fileBuffer = new uint8_t[bufferSize + START_CODE_SIZE];
    if (fileBuffer == nullptr) {
        cout << "Fatal: memory allocation failed" << endl;
        return -1;
    }
    if (memcpy_s(fileBuffer, bufferSize + START_CODE_SIZE, START_CODE, START_CODE_SIZE) != EOK) {
        cout << "Fatal: memory copy failed for START_CODE" << endl;
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return -1;
    }
    
    (void)inFile_->read((char *)fileBuffer + START_CODE_SIZE, bufferSize);
    if (inFile_->fail()) {
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return -1;
    }
    if ((fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == SPS ||
        (fileBuffer[START_CODE_SIZE] & H264_NALU_TYPE) == PPS) {
        attr.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    }
    if (DecAvcPushData(data, bufferSize, fileBuffer) != 0) {
        return -1;
    }
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize + START_CODE_SIZE;
    attr.offset = 0;
    int32_t result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed, error:" << result << endl;
        return -1;
    } else {
        inputNum++;
    }
    return 0;
}

int32_t DecPushData(OH_AVMemory *data, uint32_t bufferSize, uint8_t *fileBuffer)
{
    int32_t size = OH_AVMemory_GetSize(data);
    if (size < bufferSize) {
        cout << "error: size < bufferSize" << endl;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return 1;
    }
    uint8_t *avBuffer = OH_AVMemory_GetAddr(data);
    if (avBuffer == nullptr) {
        cout << "avBuffer == nullptr" << endl;
        inFile_->clear();
        inFile_->seekg(0, ios::beg);
        delete[] fileBuffer;
        fileBuffer = nullptr;
        return 1;
    }
    if (memcpy_s(avBuffer, size, fileBuffer, bufferSize) != EOK) {
        delete[] fileBuffer;
        cout << "Fatal: memcpy fail" << endl;
        return 1;
    }
    delete[] fileBuffer;
    fileBuffer = nullptr;
    return 0;
}

int32_t HDRCodecNdkSample::SendDataMpeg2(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    uint32_t bufferSize = 0;
    int32_t result = 0;
    OH_AVCodecBufferAttr attr;
    if (inFile_->tellg() == 0) {
        inFile_->read(reinterpret_cast<char *>(prereadBuffer_.get() + START_CODE_SIZE), PREREAD_BUFFER_SIZE);
        prereadBufferSize_ = inFile_->gcount() + START_CODE_SIZE;
        pPrereadBuffer_ = START_CODE_SIZE;
    }
    if (finishLastPush) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        mpegUnit_->resize(0);
        return 1;
    }
    GetBufferSize();
    bufferSize = mpegUnit_->size();
    uint8_t *fileBuffer = nullptr;
    if (bufferSize > 0) {
        fileBuffer = new uint8_t[bufferSize];
    } else {
        delete[] fileBuffer;
        return 0;
    }
    if (memcpy_s(fileBuffer, bufferSize, mpegUnit_->data(), bufferSize) != EOK) {
        cout << "Fatal: memcpy copy fail" << endl;
    }
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (pPrereadBuffer_ == prereadBufferSize_ && inFile_->eof()) {
        finishLastPush = true;
    }
    if (DecPushData(data, bufferSize, fileBuffer)) {
        return 0;
    }
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize;
    attr.offset = 0;
    result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed,error:" << result << endl;
    } else {
        inputNum++;
    }
    return 0;
}

int32_t HDRCodecNdkSample::SendDataMpeg4(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    uint32_t bufferSize = 0;
    int32_t result = 0;
    OH_AVCodecBufferAttr attr;
    if (inFile_->tellg() == 0) {
        inFile_->read(reinterpret_cast<char *>(prereadBuffer_.get() + START_CODE_SIZE), PREREAD_BUFFER_SIZE);
        prereadBufferSize_ = inFile_->gcount() + START_CODE_SIZE;
        pPrereadBuffer_ = START_CODE_SIZE;
    }
    if (finishLastPush) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        attr.offset = 0;
        OH_VideoDecoder_PushInputData(codec, index, attr);
        mpegUnit_->resize(0);
        return 1;
    }
    GetMpeg4BufferSize();
    bufferSize = mpegUnit_->size();
    if (bufferSize > MAX_WIDTH * MAX_HEIGHT << 1) {
        return 1;
    }
    uint8_t *fileBuffer = nullptr;
    if (bufferSize > 0) {
        fileBuffer = new uint8_t[bufferSize];
    } else {
        delete[] fileBuffer;
        return 0;
    }
    if (memcpy_s(fileBuffer, bufferSize, mpegUnit_->data(), bufferSize) != EOK) {
        cout << "Fatal: memcpy copy fail" << endl;
    }
    attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (pPrereadBuffer_ == prereadBufferSize_ && inFile_->eof()) {
        finishLastPush = true;
    }
    if (DecPushData(data, bufferSize, fileBuffer)) {
        return 0;
    }
    attr.pts = GetSystemTimeUs();
    attr.size = bufferSize;
    attr.offset = 0;
    result = OH_VideoDecoder_PushInputData(codec, index, attr);
    if (result != AV_ERR_OK) {
        cout << "push input data failed,error:" << result << endl;
    } else {
        inputNum++;
    }
    return 0;
}

int32_t HDRCodecNdkSample::SendData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data)
{
    switch (typeDec) {
        case CHANNEL_0: {
            return SendDataHdr(codec, index, data);
        }
        case CHANNEL_1: {
            return SendDataH263(codec, index, data);
        }
        case CHANNEL_2: {
            return SendDataAvc(codec, index, data);
        }
        case CHANNEL_3: {
            return SendDataMpeg2(codec, index, data);
        }
        case CHANNEL_4: {
            return SendDataMpeg4(codec, index, data);
        }
        default:
            g_isRunning.store(false);
            g_cv.notify_all();
            return 1;
    }
    return 0;
}

static int32_t RepeatCallStartFlush(HDRCodecNdkSample *sample)
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

static int32_t RepeatCallStartStop(HDRCodecNdkSample *sample)
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

static int32_t RepeatCallStartFlushStop(HDRCodecNdkSample *sample)
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

HDRCodecNdkSample::~HDRCodecNdkSample()
{
    inputNum = 0;
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

static int64_t GetFileSize(const char *fileName)
{
    int64_t fileSize = 0;
    if (fileName != nullptr) {
        struct stat fileStatus {};
        if (stat(fileName, &fileStatus) == 0) {
            fileSize = static_cast<int64_t>(fileStatus.st_size);
        }
    }
    return fileSize;
}

int32_t HDRCodecNdkSample::CreateDemuxerVideocoder(const char *file, std::string codeName, std::string enCodeName)
{
    int trackType = 0;
    fd = open(file, O_RDONLY);
    outFd = open("./output.mp4", O_CREAT | O_RDWR |O_TRUNC, S_IRUSR | S_IWUSR);
    int64_t size = GetFileSize(file);
    source = OH_AVSource_CreateWithFD(fd, 0, size);
    if (!source) {
        return AV_ERR_UNKNOWN;
    }
    if (CreateVideocoder(codeName, enCodeName)) {
        return AV_ERR_UNKNOWN;
    }
    demuxer = OH_AVDemuxer_CreateWithSource(source);
    muxer = OH_AVMuxer_Create(outFd, AV_OUTPUT_FORMAT_MPEG_4);
    if (!demuxer || !muxer) {
        return AV_ERR_UNKNOWN;
    }
    OH_AVFormat *sourceFormat = OH_AVSource_GetSourceFormat(source);
    OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &trackCount);
    OH_AVMuxer_SetFormat(muxer, sourceFormat);
    int32_t muxTrack = 0;
    for (int32_t index = 0; index < trackCount; index++) {
        OH_AVDemuxer_SelectTrackByID(demuxer, index);
        OH_AVFormat *trackFormat = OH_AVSource_GetTrackFormat(source, index);
        OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &trackType);
        if (trackType == MEDIA_TYPE_VID) {
            videoTrackID = index;
            OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_ROTATION, &DEFAULT_ROTATION);
            OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_WIDTH, &DEFAULT_WIDTH);
            OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_HEIGHT, &DEFAULT_HEIGHT);
            OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_PIXEL_FORMAT, &DEFAULT_PIXEL_FORMAT);
            OH_AVFormat_GetDoubleValue(trackFormat, OH_MD_KEY_FRAME_RATE, &DEFAULT_FRAME_RATE);
            OH_AVFormat_SetStringValue(trackFormat, OH_MD_KEY_CODEC_MIME, MIME_TYPE);
            OH_AVMuxer_SetRotation(muxer, DEFAULT_ROTATION);
        } else {
            audioTrackID = index;
        }
        OH_AVMuxer_AddTrack(muxer, &muxTrack, trackFormat);
        OH_AVMuxer_SetFormat(muxer, trackFormat);
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    return AV_ERR_OK;
}

int32_t HDRCodecNdkSample::CreateVideocoder(std::string codeName, std::string enCodeName)
{
    decSignal = new VSignal();
    if (decSignal == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    vdec_ = OH_VideoDecoder_CreateByName(codeName.c_str());
    if (vdec_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }

    venc_ = OH_VideoEncoder_CreateByName(enCodeName.c_str());
    if (venc_ == nullptr) {
        return AV_ERR_UNKNOWN;
    }
    return AV_ERR_OK;
}

void HDRCodecNdkSample::FlushBuffer()
{
    unique_lock<mutex> decInLock(decSignal->inMutex_);
    clearIntqueue(decSignal->inIdxQueue_);
    std::queue<OH_AVMemory *>empty;
    swap(empty, decSignal->inBufferQueue_);
    decSignal->inCond_.notify_all();
    inFile_->clear();
    inFile_->seekg(0, ios::beg);
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
    bool isRunning = true;
    while (isRunning) {
        if (!g_isRunning.load()) {
            break;
        }
        int32_t ret = RepeatCall();
        if (ret != 0) {
            cout << "repeat call failed, errcode " << ret << endl;
            errorCount++;
            g_isRunning.store(false);
            g_cv.notify_all();
            break;
        }
        uint32_t index;
        unique_lock<mutex> lock(decSignal->inMutex_);
        decSignal->inCond_.wait(lock, [this]() {
            if (!g_isRunning.load()) {
                return true;
            }
            return decSignal->inIdxQueue_.size() > 0;
        });
        if (!g_isRunning.load()) {
            break;
        }
        index = decSignal->inIdxQueue_.front();
        auto buffer = decSignal->inBufferQueue_.front();

        decSignal->inIdxQueue_.pop();
        decSignal->inBufferQueue_.pop();
        lock.unlock();
        if (SendData(vdec_, index, buffer) == 1)
            break;
    }
}

int32_t HDRCodecNdkSample::Configure()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout << "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXEL_FORMAT);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    int ret = OH_VideoDecoder_Configure(vdec_, format);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    if (bframe) {
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_B_FRAME, 1);
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, DEFAULT_PROFILE);
    ret = OH_VideoEncoder_Configure(venc_, format);
    if (ret != AV_ERR_OK) {
        return ret;
    }
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
    OH_AVFormat_Destroy(format);
    decCb_.onError = VdecError;
    decCb_.onStreamChanged = VdecFormatChanged;
    decCb_.onNeedInputData = VdecInputDataReady;
    decCb_.onNeedOutputData = VdecOutputDataReady;
    return OH_VideoDecoder_SetCallback(vdec_, decCb_, this);
}

int32_t HDRCodecNdkSample::ReConfigure()
{
    int32_t ret = OH_VideoDecoder_Reset(vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoEncoder_Reset(venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    FlushBuffer();
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        cout<< "Fatal: Failed to create format" << endl;
        return AV_ERR_UNKNOWN;
    }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXEL_FORMAT);
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
    ret = OH_VideoDecoder_SetSurface(vdec_, window);
    if (ret != AV_ERR_OK) {
        OH_AVFormat_Destroy(format);
        return ret;
    }
    OH_AVFormat_Destroy(format);
    return ret;
}

void HDRCodecNdkSample::WriteAudioTrack()
{
    OH_AVMemory *buffer = nullptr;
    buffer = OH_AVMemory_Create(AUDIO_BUFFER_SIZE);
    if (buffer == nullptr) {
        cout << "Fatal: Failed to create audio buffer" << endl;
        return;
    }
    bool audioWrite = true;
    while (audioWrite) {
        if (!g_isRunning.load()) {
            audioWrite = false;
            break;
        }
        OH_AVCodecBufferAttr info = {};
        int32_t result = OH_AVDemuxer_ReadSample(demuxer, audioTrackID, buffer, &info);
        if (result != AV_ERR_OK) {
            cout << "Fatal: Failed to read audio sample, error: " << result << endl;
            audioWrite = false;
            break;
        }
        if (info.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "Audio track reached end of stream" << endl;
            audioWrite = false;
            break;
        }
        if (info.size <= 0 || info.size > AUDIO_BUFFER_SIZE) {
            cout << "Warning: Invalid audio sample size: " << info.size << ", skipping" << endl;
            continue;
        }
        result = OH_AVMuxer_WriteSample(muxer, audioTrackID, buffer, info);
        if (result != AV_ERR_OK) {
            cout << "Warning: Failed to write audio sample, error: " << result << endl;
        }
    }
    if (buffer != nullptr) {
        OH_AVMemory_Destroy(buffer);
        buffer = nullptr;
    }
}

int32_t HDRCodecNdkSample::StartDemuxer()
{
    int32_t ret = 0;
    g_isRunning.store(true);
    OH_AVMuxer_Start(muxer);
    ret = OH_VideoEncoder_Start(venc_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    ret = OH_VideoDecoder_Start(vdec_);
    if (ret != AV_ERR_OK) {
        return ret;
    }
    if (audioTrackID != -1) {
        audioThread = make_unique<thread>(&HDRCodecNdkSample::WriteAudioTrack, this);
    }
    return 0;
}
int32_t HDRCodecNdkSample::Start()
{
    int32_t ret = 0;
    prereadBuffer_ = std::make_unique<uint8_t []>(PREREAD_BUFFER_SIZE + START_CODE_SIZE);
    mpegUnit_ = std::make_unique<std::vector<uint8_t>>(MAX_NALU_SIZE);
    inFile_ = make_unique<ifstream>();
    inFile_->open(INP_DIR, ios::in | ios::binary);
    if (!inFile_->is_open()) {
        (void)OH_VideoDecoder_Destroy(vdec_);
        (void)OH_VideoEncoder_Destroy(venc_);
        vdec_ = nullptr;
        venc_ = nullptr;
        inFile_->close();
        inFile_.reset();
        inFile_ = nullptr;
        return AV_ERR_UNKNOWN;
    }
    g_isRunning.store(true);
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
        g_isRunning.store(false);
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
        g_isRunning.store(false);
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
    std::mutex mtx;
    unique_lock<mutex> lock(mtx);
    g_cv.wait(lock, []() {
        return !(g_isRunning.load());
    });
    if (audioThread) {
        audioThread->join();
    }
    if (inputLoop_) {
        inputLoop_->join();
    }
    OH_VideoDecoder_Stop(vdec_);
    OH_VideoEncoder_Stop(venc_);
}

int32_t HDRCodecNdkSample::Release()
{
    if (decSignal != nullptr) {
        delete decSignal;
        decSignal = nullptr;
    }
    if (vdec_ != nullptr) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
    if (venc_ != nullptr) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (muxer != nullptr) {
        OH_AVMuxer_Destroy(muxer);
        muxer = nullptr;
    }
    if (demuxer != nullptr) {
        OH_AVDemuxer_Destroy(demuxer);
        demuxer = nullptr;
    }
    if (source != nullptr) {
        OH_AVSource_Destroy(source);
        source = nullptr;
    }
    if (fd > 0) {
        close(fd);
        fd = -1;
    }
    if (outFd > 0) {
        close(outFd);
        outFd = -1;
    }
    return 0;
}