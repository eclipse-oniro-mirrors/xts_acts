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

#include <iostream>
#include <unistd.h>
#include <chrono>
#include "securec.h"
#include "avcodec_common.h"
#include "avcodec_errors.h"
#include "media_description.h"
#include "native_avformat.h"
#include "demo_log.h"
#include "avcodec_codec_name.h"
#include "native_avmemory.h"
#include "native_avbuffer.h"
#include "ffmpeg_converter.h"
#include "avcodec_audio_avbuffer_encoder_demo.h"

using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioAacEncDemo;
using namespace std;
namespace {
constexpr uint32_t CHANNEL_COUNT_1 = 1;
constexpr uint32_t SAMPLE_RATE_8000 = 8000;
constexpr uint32_t BIT_RATE_64000 = 64000;
constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr uint32_t FRAME_DURATION_US = 33000;
constexpr int32_t SAMPLE_FORMAT = AudioSampleFormat::SAMPLE_S32LE;
constexpr int32_t BIT_PER_CODE_COUNT = 16;
constexpr int32_t COMPLEXITY_COUNT = 10;
constexpr int32_t CHANNEL_1 = 1;
constexpr int32_t CHANNEL_2 = 2;
constexpr int32_t CHANNEL_3 = 3;
constexpr int32_t CHANNEL_4 = 4;
constexpr int32_t CHANNEL_5 = 5;
constexpr int32_t CHANNEL_6 = 6;
constexpr int32_t CHANNEL_7 = 7;
constexpr int32_t CHANNEL_8 = 8;
} // namespace


static uint64_t GetChannelLayout(int32_t channel)
{
    switch (channel) {
        case CHANNEL_1:
            return MONO;
        case CHANNEL_2:
            return STEREO;
        case CHANNEL_3:
            return CH_2POINT1;
        case CHANNEL_4:
            return CH_3POINT1;
        case CHANNEL_5:
            return CH_4POINT1;
        case CHANNEL_6:
            return CH_5POINT1;
        case CHANNEL_7:
            return CH_6POINT1;
        case CHANNEL_8:
            return CH_7POINT1;
        default:
            return UNKNOWN_CHANNEL_LAYOUT;
    }
}

static  vector<string> SplitStringFully(const string &str, const string &separator)
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

static void StringReplace(std::string &strBig, const std::string &strsrc, const std::string &strdst)
{
    std::string::size_type pos = 0;
    std::string::size_type srclen = strsrc.size();
    std::string::size_type dstlen = strdst.size();

    while ((pos = strBig.find(strsrc, pos)) != std::string::npos) {
        strBig.replace(pos, srclen, strdst);
        pos += dstlen;
    }
}

static void GetParamsByName(string decoderName, string inputFile, int32_t &channelCount,
    int32_t &sampleRate, long &bitrate)
{
    int32_t opusNameSplitNum = 4;
    int32_t splitNum1 = 1;
    int32_t splitNum2 = 2;
    int32_t splitNum3 = 3;

    vector<string> dest = SplitStringFully(inputFile, "_");
    if (decoderName == "OH.Media.Codec.Encoder.Audio.Opus") {
        if (dest.size() < opusNameSplitNum) {
            cout << "split error !!!" << endl;
            return;
        }
        channelCount = stoi(dest[splitNum3]);
        sampleRate = stoi(dest[splitNum1]);

        string bitStr = dest[splitNum2];
        StringReplace(bitStr, "k", "000");
        bitrate = atol(bitStr.c_str());
    } else {
        if (dest.size() < opusNameSplitNum) {
            cout << "split error !!!" << endl;
            return;
        }
        channelCount = stoi(dest[splitNum3]);
        sampleRate = stoi(dest[splitNum2]);

        string bitStr = dest[splitNum1];
        StringReplace(bitStr, "k", "000");
        bitrate = atol(bitStr.c_str());
    }
}

static void OnError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    (void)codec;
    (void)errorCode;
    (void)userData;
    cout << "Error received, errorCode:" << errorCode << endl;
}

static void OnOutputFormatChanged(OH_AVCodec *codec, OH_AVFormat *format, void *userData)
{
    (void)codec;
    (void)format;
    (void)userData;
    cout << "OnOutputFormatChanged received" << endl;
}

static void OnInputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(buffer);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    (void)codec;
    AEncSignal *signal = static_cast<AEncSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(buffer);
    if (buffer) {
        cout << "OnOutputBufferAvailable received, index:" << index << ", size:" << buffer->buffer_->memory_->GetSize()
             << ", flags:" << buffer->buffer_->flag_ << ", pts: " << buffer->buffer_->pts_ << endl;
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

bool AudioBufferAacEncDemo::InitFile(std::string inputFile, std::string outputFile)
{
    std::cout << "InitFile enter" << std::endl;
    if (inputFile_.is_open()) {
        inputFile_.close();
    }
    if (inputFile.find("mp4") != std::string::npos || inputFile.find("m4a") != std::string::npos ||
        inputFile.find("ts") != std::string::npos) {
        audioType_ = AudioBufferFormatType::TYPE_vivid;
    } else if (inputFile.find("opus") != std::string::npos) {
        audioType_ = AudioBufferFormatType::TYPE_OPUS;
        inputFile_.open(inputFile, std::ios::in | std::ios::binary);
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: open input file failed");
        std::cout << "InitFile ok = " << std::endl;
    } else if (inputFile.find("g711") != std::string::npos) {
        std::cout << "g711 enter " << std::endl;
        audioType_ = AudioBufferFormatType::TYPE_G711MU;
        std::cout << "g711 inputFile: " << inputFile << std::endl;
        inputFile_.open(inputFile, std::ios::in | std::ios::binary);
        std::cout << "inputFile open: " << std::endl;
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: open input file failed");
        std::cout << "g711 InitFile ok = " << std::endl;
    } else {
        audioType_ = AudioBufferFormatType::TYPE_AAC;
        inputFile_.open(inputFile, std::ios::in | std::ios::binary);
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: open input file failed");
    }
    fileSize_ = GetFileSize(inputFile.data());
    outputFile_.open(outputFile, std::ios::out | std::ios::binary);
    DEMO_CHECK_AND_RETURN_RET_LOG(outputFile_.is_open(), false, "Fatal: open output file failed");
    inputFile_str = inputFile;
    outputFile_str = outputFile;
    return true;
}

bool AudioBufferAacEncDemo::RunCase(std::string inputFile, std::string outputFile)
{
    DEMO_CHECK_AND_RETURN_RET_LOG(InitFile(inputFile, outputFile), false, "Fatal: InitFile file failed");
    DEMO_CHECK_AND_RETURN_RET_LOG(CreateEnc() == AVCS_ERR_OK, false, "Fatal: CreateEnc fail");
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channelCount;
    int32_t sampleRate;
    long bitrate;
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), CHANNEL_COUNT);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(), SAMPLE_FORMAT);
    }
    if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        GetParamsByName("OH.Media.Codec.Encoder.Audio.Opus", inputFile, channelCount, sampleRate, bitrate);
        channels_ = channelCount;
        sampleRate_ = sampleRate;

        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), channels_);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), sampleRate_);
        OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), bitrate);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                AudioSampleFormat::SAMPLE_S16LE);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_BITS_PER_CODED_SAMPLE.data(), BIT_PER_CODE_COUNT);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_COMPLIANCE_LEVEL.data(), COMPLEXITY_COUNT);
    } else if (audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        channelCount = CHANNEL_COUNT_1;
        sampleRate = SAMPLE_RATE_8000;
        bitrate = BIT_RATE_64000;
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), channelCount);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), sampleRate);
        OH_AVFormat_SetLongValue(format, MediaDescriptionKey::MD_KEY_BITRATE.data(), bitrate);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                AudioSampleFormat::SAMPLE_S16LE);
        std::cout << "RunCase OH_AVFormat_SetIntValue" << std::endl;
    }
    DEMO_CHECK_AND_RETURN_RET_LOG(Configure(format) == AVCS_ERR_OK, false, "Fatal: Configure fail");
    DEMO_CHECK_AND_RETURN_RET_LOG(Start() == AVCS_ERR_OK, false, "Fatal: Start fail");
    auto start = chrono::steady_clock::now();
    {
        unique_lock<mutex> lock(signal_->startMutex_);
        signal_->startCond_.wait(lock, [this]() { return (!(isRunning_.load())); });
    }
    auto end = chrono::steady_clock::now();
    std::cout << "Encode finished, time = " << std::chrono::duration_cast<chrono::milliseconds>(end - start).count()
              << " ms" << std::endl;
    DEMO_CHECK_AND_RETURN_RET_LOG(Stop() == AVCS_ERR_OK, false, "Fatal: Stop fail");
    DEMO_CHECK_AND_RETURN_RET_LOG(Release() == AVCS_ERR_OK, false, "Fatal: Release fail");
    OH_AVFormat_Destroy(format);
    return true;
}

int32_t AudioBufferAacEncDemo::GetFileSize(const std::string &filePath)
{
    std::ifstream file(filePath, std::ios::binary | std::ios::ate);
    if (!file) {
        std::cerr << "Failed to open file: " << filePath << std::endl;
        return -1;
    }

    std::streampos fileSize = file.tellg(); // 获取文件大小
    file.close();

    return (int32_t)fileSize;
}

AudioBufferAacEncDemo::AudioBufferAacEncDemo() : isRunning_(false), audioEnc_(nullptr), signal_(nullptr), frameCount_(0)
{
    signal_ = new AEncSignal();
    DEMO_CHECK_AND_RETURN_LOG(signal_ != nullptr, "Fatal: No memory");
}

AudioBufferAacEncDemo::~AudioBufferAacEncDemo()
{
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
}

int32_t AudioBufferAacEncDemo::CreateEnc()
{
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        audioEnc_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_ENCODER_AAC_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
        audioEnc_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_ENCODER_FLAC_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        audioEnc_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_ENCODER_OPUS_NAME).data());
        std::cout << "CreateDec opus ok = " << std::endl;
    } else if (audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        audioEnc_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_ENCODER_G711MU_NAME).data());
    } else {
        return AVCS_ERR_INVALID_VAL;
    }
    DEMO_CHECK_AND_RETURN_RET_LOG(audioEnc_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: CreateByName fail");
    if (signal_ == nullptr) {
        signal_ = new AEncSignal();
        DEMO_CHECK_AND_RETURN_RET_LOG(signal_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");
    }
    cb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable};
    int32_t ret = OH_AudioCodec_RegisterCallback(audioEnc_, cb_, signal_);
    DEMO_CHECK_AND_RETURN_RET_LOG(ret == AVCS_ERR_OK, AVCS_ERR_UNKNOWN, "Fatal: SetCallback fail");

    return AVCS_ERR_OK;
}

int32_t AudioBufferAacEncDemo::Configure(OH_AVFormat *format)
{
    int32_t ret = OH_AudioCodec_Configure(audioEnc_, format);
    std::cout << "AudioBufferAacEncDemo::Configure :" << ret << std::endl;
    return ret;
}

int32_t AudioBufferAacEncDemo::Start()
{
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioBufferAacEncDemo::InputFunc, this);
    DEMO_CHECK_AND_RETURN_RET_LOG(inputLoop_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");

    outputLoop_ = make_unique<thread>(&AudioBufferAacEncDemo::OutputFunc, this);
    DEMO_CHECK_AND_RETURN_RET_LOG(outputLoop_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");

    return OH_AudioCodec_Start(audioEnc_);
}

int32_t AudioBufferAacEncDemo::Stop()
{
    isRunning_.store(false);

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

    return OH_AudioCodec_Stop(audioEnc_);
}

int32_t AudioBufferAacEncDemo::Flush()
{
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
    return OH_AudioCodec_Flush(audioEnc_);
}

int32_t AudioBufferAacEncDemo::Reset()
{
    return OH_AudioCodec_Reset(audioEnc_);
}

int32_t AudioBufferAacEncDemo::Release()
{
    return OH_AudioCodec_Destroy(audioEnc_);
}

void AudioBufferAacEncDemo::HandleEOS(const uint32_t &index)
{
    OH_AudioCodec_PushInputBuffer(audioEnc_, index);
    std::cout << "end buffer\n";
    signal_->inQueue_.pop();
    signal_->inBufferQueue_.pop();
}

void AudioBufferAacEncDemo::InputFunc()
{
    int64_t g77mu_size = 320;
    double time_20ms = 0.02;
    int32_t frameBytes = channels_ * sizeof(short) * sampleRate_ * time_20ms;
    if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        frameBytes = channels_ * sizeof(short) * sampleRate_ * time_20ms;
    } else if (audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        frameBytes = g77mu_size;
    }
    DEMO_CHECK_AND_RETURN_LOG(inputFile_.is_open(), "Fatal: open file fail");
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() { return (signal_->inQueue_.size() > 0 || !isRunning_.load()); });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signal_->inQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        DEMO_CHECK_AND_BREAK_LOG(buffer != nullptr, "Fatal: GetInputBuffer fail");
        if (!inputFile_.eof()) {
            inputFile_.read((char *)OH_AVBuffer_GetAddr(buffer), frameBytes);
            buffer->buffer_->memory_->SetSize(frameBytes);
        } else {
            buffer->buffer_->memory_->SetSize(1);
            buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_EOS;
            HandleEOS(index);
            break;
        }
        int32_t ret = AVCS_ERR_OK;
        if (isFirstFrame_) {
            buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            ret = OH_AudioCodec_PushInputBuffer(audioEnc_, index);
            isFirstFrame_ = false;
        } else {
            buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_NONE;
            ret = OH_AudioCodec_PushInputBuffer(audioEnc_, index);
        }
        timeStamp_ += FRAME_DURATION_US;
        signal_->inQueue_.pop();
        signal_->inBufferQueue_.pop();
        frameCount_++;
        if (ret != AVCS_ERR_OK) {
            break;
        }
    }
    if (inputFile_.is_open()) {
        inputFile_.close();
    }
}

void AudioBufferAacEncDemo::OutputFunc()
{
    DEMO_CHECK_AND_RETURN_LOG(outputFile_.is_open(), "Fatal: open output file fail");
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() { return (signal_->outQueue_.size() > 0 || !isRunning_.load()); });

        if (!isRunning_.load()) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signal_->outQueue_.front();
        OH_AVBuffer *avBuffer = signal_->outBufferQueue_.front();
        if (avBuffer == nullptr) {
            cout << "OutputFunc OH_AVBuffer is nullptr" << endl;
            continue;
        }
        std::cout << "OutputFunc index:" << index << endl;
        if (avBuffer != nullptr) {
            outputFile_.write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(avBuffer)),
                              avBuffer->buffer_->memory_->GetSize());
        }
        if (avBuffer != nullptr &&
            (avBuffer->buffer_->flag_ == AVCODEC_BUFFER_FLAGS_EOS || avBuffer->buffer_->memory_->GetSize() == 0)) {
            cout << "encode eos" << endl;
            isRunning_.store(false);
            signal_->startCond_.notify_all();
        }

        signal_->outBufferQueue_.pop();
        signal_->outQueue_.pop();
        if (OH_AudioCodec_FreeOutputBuffer(audioEnc_, index) != AV_ERR_OK) {
            cout << "Fatal: FreeOutputData fail" << endl;
            break;
        }
        if (avBuffer->buffer_->flag_ == AVCODEC_BUFFER_FLAGS_EOS) {
            cout << "decode eos" << endl;
            isRunning_.store(false);
            signal_->startCond_.notify_all();
        }
    }
    cout << "stop, exit" << endl;
    outputFile_.close();
}

OH_AVCodec *AudioBufferAacEncDemo::CreateByMime(const char *mime)
{
    if (mime != nullptr) {
        if (0 == strcmp(mime, "audio/mp4a-latm")) {
            audioType_ = AudioBufferFormatType::TYPE_AAC;
            cout << "creat, aac" << endl;
        } else if (0 == strcmp(mime, "audio/flac")) {
            audioType_ = AudioBufferFormatType::TYPE_FLAC;
            cout << "creat, flac" << endl;
        } else {
            audioType_ = AudioBufferFormatType::TYPE_G711MU;
        }
    }

    return OH_AudioCodec_CreateByMime(mime, true);
}

OH_AVCodec *AudioBufferAacEncDemo::CreateByName(const char *name)
{
    return OH_AudioCodec_CreateByName(name);
}

OH_AVErrCode AudioBufferAacEncDemo::Destroy(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Destroy(codec);
    ClearQueue();
    return ret;
}

OH_AVErrCode AudioBufferAacEncDemo::SetCallback(OH_AVCodec *codec)
{
    if (codec == nullptr) {
        cout << "SetCallback, codec null" << endl;
    }
    if (signal_ == nullptr) {
        cout << "SetCallback, signal_ null" << endl;
    }
    cb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable};
    return OH_AudioCodec_RegisterCallback(codec, cb_, signal_);
}

OH_AVErrCode AudioBufferAacEncDemo::Configure(OH_AVCodec *codec, OH_AVFormat *format, int32_t channel,
                                              int32_t sampleRate, int64_t bitRate, int32_t sampleFormat,
                                              int32_t sampleBit, int32_t complexity)
{
    if (format == nullptr) {
        return OH_AudioCodec_Configure(codec, format);
    }
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, sampleBit);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, 1);
        cout << "config, aac" << endl;
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
        uint64_t channelLayout = GetChannelLayout(channel);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, channelLayout);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, sampleBit);
        cout << "config, flac" << endl;
    } else {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, sampleBit);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_COMPLIANCE_LEVEL, complexity);
    }
    OH_AVErrCode ret = OH_AudioCodec_Configure(codec, format);
    return ret;
}

OH_AVErrCode AudioBufferAacEncDemo::Prepare(OH_AVCodec *codec)
{
    return OH_AudioCodec_Prepare(codec);
}

OH_AVErrCode AudioBufferAacEncDemo::Start(OH_AVCodec *codec)
{
    return OH_AudioCodec_Start(codec);
}

OH_AVErrCode AudioBufferAacEncDemo::Stop(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Stop(codec);
    ClearQueue();
    return ret;
}

OH_AVErrCode AudioBufferAacEncDemo::Flush(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Flush(codec);
    std::cout << "Flush ret:" << ret << endl;
    ClearQueue();
    return ret;
}

OH_AVErrCode AudioBufferAacEncDemo::Reset(OH_AVCodec *codec)
{
    return OH_AudioCodec_Reset(codec);
}

OH_AVFormat *AudioBufferAacEncDemo::GetOutputDescription(OH_AVCodec *codec)
{
    return OH_AudioCodec_GetOutputDescription(codec);
}

OH_AVErrCode AudioBufferAacEncDemo::PushInputData(OH_AVCodec *codec, uint32_t index)
{
    OH_AVCodecBufferAttr info;

    if (!signal_->inBufferQueue_.empty()) {
        auto buffer = signal_->inBufferQueue_.front();
        info.size = buffer->buffer_->memory_->GetSize();
        info.pts = buffer->buffer_->pts_;
        info.flags = buffer->buffer_->flag_;
        OH_AVErrCode ret = OH_AVBuffer_SetBufferAttr(buffer, &info);
        if (ret != AV_ERR_OK) {
            return ret;
        }
    }
    return OH_AudioCodec_PushInputBuffer(codec, index);
}

OH_AVErrCode AudioBufferAacEncDemo::PushInputDataEOS(OH_AVCodec *codec, uint32_t index)
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

OH_AVErrCode AudioBufferAacEncDemo::FreeOutputData(OH_AVCodec *codec, uint32_t index)
{
    return OH_AudioCodec_FreeOutputBuffer(codec, index);
}

OH_AVErrCode AudioBufferAacEncDemo::IsValid(OH_AVCodec *codec, bool *isValid)
{
    return OH_AudioCodec_IsValid(codec, isValid);
}

uint32_t AudioBufferAacEncDemo::GetInputIndex()
{
    int32_t sleep_time = 0;
    uint32_t index;
    uint32_t timeout = 5;
    while (signal_->inQueue_.empty() && sleep_time < timeout) {
        sleep(1);
        sleep_time++;
    }
    if (sleep_time >= timeout) {
        return 0;
    } else {
        index = signal_->inQueue_.front();
        signal_->inQueue_.pop();
    }
    return index;
}

uint32_t AudioBufferAacEncDemo::GetOutputIndex()
{
    int32_t sleep_time = 0;
    uint32_t index;
    uint32_t timeout = 5;
    while (signal_->outQueue_.empty() && sleep_time < timeout) {
        sleep(1);
        sleep_time++;
    }
    if (sleep_time >= timeout) {
        return 0;
    } else {
        index = signal_->outQueue_.front();
        signal_->outQueue_.pop();
    }
    return index;
}

void AudioBufferAacEncDemo::ClearQueue()
{
    while (!signal_->inQueue_.empty())
        signal_->inQueue_.pop();
    while (!signal_->outQueue_.empty())
        signal_->outQueue_.pop();
    while (!signal_->inBufferQueue_.empty())
        signal_->inBufferQueue_.pop();
    while (!signal_->outBufferQueue_.empty())
        signal_->outBufferQueue_.pop();
}

OH_AVErrCode AudioBufferAacEncDemo::SetParameter(OH_AVCodec *codec, OH_AVFormat *format, int32_t channel,
                                                 int32_t sampleRate, int64_t bitRate, int32_t sampleFormat,
                                                 int32_t sampleBit, int32_t complexity)
{
    if (format == nullptr) {
        return OH_AudioCodec_SetParameter(codec, format);
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITS_PER_CODED_SAMPLE, sampleBit);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COMPLIANCE_LEVEL, complexity);
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AAC_IS_ADTS, 1);
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
        uint64_t channelLayout = GetChannelLayout(channel);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, channelLayout);
    }
    OH_AVErrCode ret = OH_AudioCodec_SetParameter(codec, format);
    return ret;
}

OH_AVErrCode AudioBufferAacEncDemo::Configure(OH_AVCodec* codec, OH_AVFormat* format, int32_t channel,
                                              int32_t sampleRate, int64_t bitRate, int32_t sampleFormat,
                                              int32_t syncMode)
{
    if (codec == nullptr || format == nullptr) {
        return AV_ERR_INVALID_VAL;
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, syncMode);
    OH_AVErrCode ret = OH_AudioCodec_Configure(codec, format);
    return ret;
}