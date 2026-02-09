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

#include "include/AvcodecAudioAvBufferDecoderDemoTest.h"
#include <chrono>
#include <cstdio>
#include <fcntl.h>
#include <fstream>
#include <iostream>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <sys/stat.h>gi
#include <unistd.h>
#include "include/CommonToolTest.h"
#include "include/avcodec_codec_name.h"
#include "include/avcodec_errors.h"
#include "include/demo_log.h"

using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;
using namespace std;
namespace {
constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr uint32_t DEFAULT_AAC_TYPE = 1;
constexpr uint32_t AMRWB_SAMPLE_RATE = 16000;
constexpr uint32_t AMRNB_SAMPLE_RATE = 8000;

} // namespace

static void OnError(OH_AVCodec* codec, int32_t errorCode, void* userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
    cout << "Error received, errorCode:" << errorCode << endl;
}

static void OnOutputFormatChanged(OH_AVCodec* codec, OH_AVFormat* format, void* userData)
{
    (void)codec;
    (void)format;
    (void)userData;
    cout << "OnOutputFormatChanged received" << endl;
}

static void OnInputBufferAvailable(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    (void)codec;
    ADecBufferSignal* signal = static_cast<ADecBufferSignal*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailable(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    (void)codec;
    ADecBufferSignal* signal = static_cast<ADecBufferSignal*>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}

static int64_t GetFileSize(const char* fileName)
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

static vector<string> SplitStringFully(const string& str, const string& separator)
{
    vector<string> dest;
    string substring;
    string::size_type start = 0;
    string::size_type index = str.find_first_of(separator, start);

    while (index != string::npos) {
        substring = str.substr(start, index - start);
        dest.push_back(substring);
        start = str.find_first_not_of(separator, index);
        if (start == string::npos) {
            return dest;
        }
        index = str.find_first_of(separator, start);
    }
    substring = str.substr(start);
    dest.push_back(substring);

    return dest;
}

static void StringReplace(std::string& strBig, const std::string& strsrc, const std::string& strdst)
{
    std::string::size_type pos = 0;
    std::string::size_type srclen = strsrc.size();
    std::string::size_type dstlen = strdst.size();

    while ((pos = strBig.find(strsrc, pos)) != std::string::npos) {
        strBig.replace(pos, srclen, strdst);
        pos += dstlen;
    }
}

ADecBufferDemo::ADecBufferDemo() : audioDec_(nullptr), signal_(nullptr), audioType_(AudioBufferFormatType::TYPE_AAC)
{
    signal_ = new ADecBufferSignal();
    DEMO_CHECK_AND_RETURN_LOG(signal_ != nullptr, "Fatal: No memory");
}

ADecBufferDemo::~ADecBufferDemo()
{
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
    if (inputFile_.is_open()) {
        inputFile_.close();
    }
    if (pcmOutputFile_.is_open()) {
        pcmOutputFile_.close();
    }
    if (trackFormat != nullptr) {
        OH_AVFormat_Destroy(trackFormat);
        trackFormat = nullptr;
    }
    if (avdemuxer_ != nullptr) {
        OH_AVDemuxer_Destroy(avdemuxer_);
        avdemuxer_ = nullptr;
    }
    if (avsource_ != nullptr) {
        OH_AVSource_Destroy(avsource_);
        avsource_ = nullptr;
    }
}

int32_t ADecBufferDemo::CreateDec()
{
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_AAC_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_FLAC_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_MP3) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_MP3_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_VORBIS) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_VORBIS_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRNB) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_AMRNB_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_AMRWB_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_OPUS_NAME);
        std::cout << "CreateDec opus ok = " << std::endl;
    } else if (audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        audioDec_ = OH_AudioCodec_CreateByName(AVCodecCodecName::AUDIO_DECODER_G711MU_NAME);
    } else if (audioType_ == AudioBufferFormatType::TYPE_VIVID) {
        audioDec_ = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Vivid");
    } else {
        return AVCS_ERR_INVALID_VAL;
    }
    DEMO_CHECK_AND_RETURN_RET_LOG(audioDec_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: CreateByName fail");

    if (signal_ == nullptr) {
        signal_ = new ADecBufferSignal();
        DEMO_CHECK_AND_RETURN_RET_LOG(signal_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");
    }

    cb_ = { &OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable };
    int32_t ret = OH_AudioCodec_RegisterCallback(audioDec_, cb_, signal_);
    DEMO_CHECK_AND_RETURN_RET_LOG(ret == AVCS_ERR_OK, AVCS_ERR_UNKNOWN, "Fatal: SetCallback fail");

    return AVCS_ERR_OK;
}

int32_t ADecBufferDemo::Configure(OH_AVFormat* format)
{
    return OH_AudioCodec_Configure(audioDec_, format);
}

int32_t ADecBufferDemo::Stop()
{
    isRunning_ = false;
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
        inputLoop_ = nullptr;
        while (!signal_->inQueue_.empty()) {
            signal_->inQueue_.pop();
        }
        while (!signal_->inBufferQueue_.empty()) {
            signal_->inBufferQueue_.pop();
        }
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
        outputLoop_ = nullptr;
        while (!signal_->outQueue_.empty()) {
            signal_->outQueue_.pop();
        }
        while (!signal_->outBufferQueue_.empty()) {
            signal_->outBufferQueue_.pop();
        }
    }
    std::cout << "start stop!\n";
    if (inputFile_.is_open()) {
        inputFile_.close();
    }
    if (pcmOutputFile_.is_open()) {
        pcmOutputFile_.close();
    }
    return OH_AudioCodec_Stop(audioDec_);
}

int32_t ADecBufferDemo::Flush()
{
    isRunning_ = false;
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->inMutex_);
            signal_->inCond_.notify_all();
        }
        inputLoop_->join();
        inputLoop_ = nullptr;
        while (!signal_->inQueue_.empty()) {
            signal_->inQueue_.pop();
        }
        while (!signal_->inBufferQueue_.empty()) {
            signal_->inBufferQueue_.pop();
        }
        std::cout << "clear input buffer!\n";
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signal_->outMutex_);
            signal_->outCond_.notify_all();
        }
        outputLoop_->join();
        outputLoop_ = nullptr;
        while (!signal_->outQueue_.empty()) {
            signal_->outQueue_.pop();
        }
        while (!signal_->outBufferQueue_.empty()) {
            signal_->outBufferQueue_.pop();
        }
        std::cout << "clear output buffer!\n";
    }
    return OH_AudioCodec_Flush(audioDec_);
}

int32_t ADecBufferDemo::Reset()
{
    return OH_AudioCodec_Reset(audioDec_);
}

int32_t ADecBufferDemo::Release()
{
    return OH_AudioCodec_Destroy(audioDec_);
}

void ADecBufferDemo::HandleInputEOS(const uint32_t index)
{
    std::cout << "end buffer\n";
    OH_AudioCodec_PushInputBuffer(audioDec_, index);
    signal_->inBufferQueue_.pop();
    signal_->inQueue_.pop();
}

OH_AVErrCode ADecBufferDemo::SetCallback(OH_AVCodec* codec)
{
    cb_ = { &OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable };
    return OH_AudioCodec_RegisterCallback(codec, cb_, signal_);
}

OH_AVCodec* ADecBufferDemo::CreateByMime(const char* mime)
{
    if (mime != nullptr) {
        if (0 == strcmp(mime, "audio/mp4a-latm")) {
            audioType_ = AudioBufferFormatType::TYPE_AAC;
        } else if (0 == strcmp(mime, "audio/flac")) {
            audioType_ = AudioBufferFormatType::TYPE_FLAC;
        } else {
            audioType_ = AudioBufferFormatType::TYPE_VIVID;
        }
    }
    return OH_AudioCodec_CreateByMime(mime, false);
}

OH_AVCodec* ADecBufferDemo::CreateByName(const char* name)
{
    return OH_AudioCodec_CreateByName(name);
}

OH_AVErrCode ADecBufferDemo::Destroy(OH_AVCodec* codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Destroy(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::IsValid(OH_AVCodec* codec, bool* isValid)
{
    return OH_AudioCodec_IsValid(codec, isValid);
}

OH_AVErrCode ADecBufferDemo::Prepare(OH_AVCodec* codec)
{
    return OH_AudioCodec_Prepare(codec);
}

OH_AVErrCode ADecBufferDemo::Start(OH_AVCodec* codec)
{
    return OH_AudioCodec_Start(codec);
}

OH_AVErrCode ADecBufferDemo::Stop(OH_AVCodec* codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Stop(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::Flush(OH_AVCodec* codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Flush(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::Reset(OH_AVCodec* codec)
{
    return OH_AudioCodec_Reset(codec);
}

OH_AVFormat* ADecBufferDemo::GetOutputDescription(OH_AVCodec* codec)
{
    return OH_AudioCodec_GetOutputDescription(codec);
}

OH_AVErrCode ADecBufferDemo::FreeOutputData(OH_AVCodec* codec, uint32_t index)
{
    return OH_AudioCodec_FreeOutputBuffer(codec, index);
}

OH_AVErrCode ADecBufferDemo::PushInputData(OH_AVCodec* codec, uint32_t index)
{
    OH_AVCodecBufferAttr info;

    if (!signal_->inBufferQueue_.empty()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        auto buffer = signal_->inBufferQueue_.front();
        OH_AVErrCode ret = OH_AVBuffer_GetBufferAttr(buffer, &info);
        if (ret != AV_ERR_OK) {
            return ret;
        }
        ret = OH_AVBuffer_SetBufferAttr(buffer, &info);
        if (ret != AV_ERR_OK) {
            return ret;
        }
    }

    return OH_AudioCodec_PushInputBuffer(codec, index);
}

uint32_t ADecBufferDemo::GetInputIndex()
{
    std::unique_lock<std::mutex> lock(signal_->inMutex_);
    bool ok = signal_->inCond_.wait_for(lock, std::chrono::seconds(5), [&] { return !signal_->inQueue_.empty(); });
    if (!ok) {
        return UINT32_MAX; // Return a specific invalid value if signature cannot be changed
    }
    uint32_t index = signal_->inQueue_.front();
    signal_->inQueue_.pop();
    return index;
}

uint32_t ADecBufferDemo::GetOutputIndex()
{
    std::unique_lock<std::mutex> lock(signal_->outMutex_);
    bool ok = signal_->outCond_.wait_for(lock, std::chrono::seconds(5), [&] { return !signal_->outQueue_.empty(); });
    if (!ok) {
        return UINT32_MAX; // Return a specific invalid value if signature cannot be changed
    }
    uint32_t index = signal_->outQueue_.front();
    signal_->outQueue_.pop();
    return index;
}

OH_AVErrCode ADecBufferDemo::PushInputDataEOS(OH_AVCodec* codec, uint32_t index)
{
    OH_AVCodecBufferAttr info;
    info.size = 0;
    info.offset = 0;
    info.pts = 0;
    info.flags = AVCODEC_BUFFER_FLAGS_EOS;

    if (!signal_->inBufferQueue_.empty()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        auto buffer = signal_->inBufferQueue_.front();
        OH_AVBuffer_SetBufferAttr(buffer, &info);
        signal_->inBufferQueue_.pop();
    }
    return OH_AudioCodec_PushInputBuffer(codec, index);
}

OH_AVErrCode ADecBufferDemo::Configure(OH_AVCodec* codec, OH_AVFormat* format, int32_t channel, int32_t sampleRate)
{
    if (format == nullptr) {
        return OH_AudioCodec_Configure(codec, format);
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, 1);
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
    }
    OH_AVErrCode ret = OH_AudioCodec_Configure(codec, format);
    return ret;
}

OH_AVErrCode ADecBufferDemo::SetParameter(OH_AVCodec* codec, OH_AVFormat* format, int32_t channel, int32_t sampleRate)
{
    if (format == nullptr) {
        return OH_AudioCodec_SetParameter(codec, format);
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, 1);
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
    }
    OH_AVErrCode ret = OH_AudioCodec_SetParameter(codec, format);
    return ret;
}
