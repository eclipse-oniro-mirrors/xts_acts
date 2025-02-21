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

#include "avcodec_audio_avbuffer_decoder_demo.h"
#include <iostream>
#include <fstream>
#include <unistd.h>
#include <sys/stat.h>
#include <chrono>
#include <fcntl.h>
#include "avcodec_codec_name.h"
#include "avcodec_common.h"
#include "avcodec_errors.h"
#include "demo_log.h"
#include "media_description.h"
#include "native_avcodec_base.h"
#include "native_avformat.h"
#include "native_avbuffer.h"
#include "native_avmemory.h"
#include "securec.h"

using namespace OHOS;
using namespace OHOS::MediaAVCodec;
using namespace OHOS::MediaAVCodec::AudioBufferDemo;
using namespace OHOS::AudioStandard;
using namespace std;
namespace {
constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr uint32_t DEFAULT_AAC_TYPE = 1;
constexpr uint32_t AMRWB_SAMPLE_RATE = 16000;
constexpr uint32_t AMRNB_SAMPLE_RATE = 8000;

} // namespace

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

static void OnInputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    ADecBufferSignal *signal = static_cast<ADecBufferSignal *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailable(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    ADecBufferSignal *signal = static_cast<ADecBufferSignal *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
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

static vector<string> SplitStringFully(const string &str, const string &separator)
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
    vector<string> dest = SplitStringFully(inputFile, "_");
    if (decoderName == "OH.Media.Codec.Encoder.Audio.Opus") {
        if (dest.size() < opusNameSplitNum) {
            cout << "split error !!!" << endl;
            return;
        }
        channelCount = stoi(dest[3]);  // num 3
        sampleRate = stoi(dest[1]);

        string bitStr = dest[2];
        StringReplace(bitStr, "k", "000");
        bitrate = atol(bitStr.c_str());
    } else if (decoderName == "OH.Media.Codec.Decoder.Audio.vivid") {
        if (dest.size() < opusNameSplitNum) {
            cout << "split error !!!" << endl;
            return;
        }
        channelCount = stoi(dest[3]);  // num 3
        sampleRate = stoi(dest[1]);

        string bitStr = dest[2];
        StringReplace(bitStr, "k", "000");
        bitrate = atol(bitStr.c_str());
    } else {
        if (dest.size() < opusNameSplitNum) {
            cout << "split error !!!" << endl;
            return;
        }
        channelCount = stoi(dest[3]);  // num 3
        sampleRate = stoi(dest[2]);    // 2nd parameter

        string bitStr = dest[1];
        StringReplace(bitStr, "k", "000");
        bitrate = atol(bitStr.c_str());
    }
}

bool ADecBufferDemo::RunCase(std::string inputFile, std::string outputFile)
{
    DEMO_CHECK_AND_RETURN_RET_LOG(InitFile(inputFile, outputFile), false, "Fatal: InitFile file failed");
    if (audioType_ == AudioBufferFormatType::TYPE_vivid || audioType_ == AudioBufferFormatType::TYPE_AMRNB ||
        audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
        CreatDeMuxer(inputFile);
    }
    DEMO_CHECK_AND_RETURN_RET_LOG(CreateDec() == AVCS_ERR_OK, false, "Fatal: CreateDec fail");
    std::cout << "CreateDec over " << std::endl;
    OH_AVFormat *format = OH_AVFormat_Create();
    int32_t channelCount = CHANNEL_COUNT;
    int32_t sampleRate = SAMPLE_RATE;
    if (audioType_ == AudioBufferFormatType::TYPE_AAC) {
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AAC_IS_ADTS.data(), DEFAULT_AAC_TYPE);
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                OH_BitsPerSample::SAMPLE_S16LE);
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRNB || audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        channelCount = 1;
        sampleRate = AMRNB_SAMPLE_RATE;
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                OH_BitsPerSample::SAMPLE_S16LE);
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
        channelCount = 1;
        sampleRate = AMRWB_SAMPLE_RATE;
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                OH_BitsPerSample::SAMPLE_S16LE);
    } else if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        int32_t channelCounttmp;
        int32_t sampleRatetmp;
        long bitrate;
        GetParamsByName("OH.Media.Codec.Encoder.Audio.Opus", inputFile, channelCounttmp, sampleRatetmp, bitrate);
        channelCount = channelCounttmp;
        sampleRate = sampleRatetmp;
        std::cout << "getParamsByName opus ok = " << std::endl;
    }

    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), channelCount);
    OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), sampleRate);
    if (audioType_ == AudioBufferFormatType::TYPE_VORBIS) {
        OH_AVFormat_SetIntValue(format, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                OH_BitsPerSample::SAMPLE_S16LE);
        // extradata for vorbis
        int64_t extradataSize;
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: file is not open");
        inputFile_.read(reinterpret_cast<char *>(&extradataSize), sizeof(int64_t));
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.gcount() == sizeof(int64_t), false,
                                      "Fatal: read extradataSize bytes error");
        if (extradataSize < 0) {
            return false;
        }
        char buffer[extradataSize];
        inputFile_.read(buffer, extradataSize);
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.gcount() == extradataSize, false, "Fatal: read extradata bytes error");
        OH_AVFormat_SetBuffer(format, MediaDescriptionKey::MD_KEY_CODEC_CONFIG.data(), (uint8_t *)buffer,
                              extradataSize);
    }
    if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
        OH_AVFormat_SetIntValue(trackFormat, MediaDescriptionKey::MD_KEY_AUDIO_SAMPLE_FORMAT.data(),
                                OH_BitsPerSample::SAMPLE_S16LE);
        DEMO_CHECK_AND_RETURN_RET_LOG(Configure(trackFormat) == AVCS_ERR_OK, false, "Fatal: Configure fail");
        std::cout << "Configure over " << std::endl;
        audioRenderer->Start();
        std::cout << "audioRenderer->Start over " << std::endl;
    } else {
        DEMO_CHECK_AND_RETURN_RET_LOG(Configure(format) == AVCS_ERR_OK, false, "Fatal: Configure fail");
    }

    DEMO_CHECK_AND_RETURN_RET_LOG(Start() == AVCS_ERR_OK, false, "Fatal: Start fail");
    std::cout << "Start over " << std::endl;
    auto start = chrono::steady_clock::now();

    unique_lock<mutex> lock(signal_->startMutex_);
    signal_->startCond_.wait(lock, [this]() { return (!(isRunning_.load())); });

    auto end = chrono::steady_clock::now();
    std::cout << "decode finished, time = " << std::chrono::duration_cast<chrono::milliseconds>(end - start).count()
              << " ms" << std::endl;

    DEMO_CHECK_AND_RETURN_RET_LOG(Stop() == AVCS_ERR_OK, false, "Fatal: Stop fail");
    DEMO_CHECK_AND_RETURN_RET_LOG(Release() == AVCS_ERR_OK, false, "Fatal: Release fail");
    OH_AVFormat_Destroy(format);
    if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
        if (!audioRenderer->Drain()) {
            std::cout << "audioRenderer->Drain fail = " << std::endl;
        }
        if (!audioRenderer->Release()) {
            std::cout << "audioRenderer->Release fail = " << std::endl;
        }
    }

    return true;
}

bool ADecBufferDemo::InitFile(std::string inputFile, std::string outputFile)
{
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
        audioType_ = AudioBufferFormatType::TYPE_G711MU;
        inputFile_.open(inputFile, std::ios::in | std::ios::binary);
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: open input file failed");
    } else if (inputFile.find("amrwb") != std::string::npos) {
        audioType_ = AudioBufferFormatType::TYPE_AMRWB;
    } else if (inputFile.find("amrnb") != std::string::npos) {
        audioType_ = AudioBufferFormatType::TYPE_AMRNB;
    } else {
        audioType_ = AudioBufferFormatType::TYPE_AAC;
        inputFile_.open(inputFile, std::ios::in | std::ios::binary);
        DEMO_CHECK_AND_RETURN_RET_LOG(inputFile_.is_open(), false, "Fatal: open input file failed");
    }

    pcmOutputFile_.open(outputFile, std::ios::out | std::ios::binary);
    DEMO_CHECK_AND_RETURN_RET_LOG(pcmOutputFile_.is_open(), false, "Fatal: open output file failed");
    inputFile_str = inputFile;
    outputFile_str = outputFile;
    return true;
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
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_AAC_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_FLAC) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_FLAC_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_MP3) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_MP3_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_VORBIS) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_VORBIS_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRNB) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_AMRNB_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_AMRWB_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_OPUS) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_OPUS_NAME).data());
        std::cout << "CreateDec opus ok = " << std::endl;
    } else if (audioType_ == AudioBufferFormatType::TYPE_G711MU) {
        audioDec_ = OH_AudioCodec_CreateByName((AVCodecCodecName::AUDIO_DECODER_G711MU_NAME).data());
    } else if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
        audioDec_ = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Vivid");
    } else {
        return AVCS_ERR_INVALID_VAL;
    }
    DEMO_CHECK_AND_RETURN_RET_LOG(audioDec_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: CreateByName fail");

    if (signal_ == nullptr) {
        signal_ = new ADecBufferSignal();
        DEMO_CHECK_AND_RETURN_RET_LOG(signal_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");
    }

    cb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable};
    int32_t ret = OH_AudioCodec_RegisterCallback(audioDec_, cb_, signal_);
    DEMO_CHECK_AND_RETURN_RET_LOG(ret == AVCS_ERR_OK, AVCS_ERR_UNKNOWN, "Fatal: SetCallback fail");

    return AVCS_ERR_OK;
}

int32_t ADecBufferDemo::Configure(OH_AVFormat *format)
{
    return OH_AudioCodec_Configure(audioDec_, format);
}

int32_t ADecBufferDemo::Start()
{
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&ADecBufferDemo::InputFunc, this);
    DEMO_CHECK_AND_RETURN_RET_LOG(inputLoop_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");

    outputLoop_ = make_unique<thread>(&ADecBufferDemo::OutputFunc, this);
    DEMO_CHECK_AND_RETURN_RET_LOG(outputLoop_ != nullptr, AVCS_ERR_UNKNOWN, "Fatal: No memory");

    return OH_AudioCodec_Start(audioDec_);
}

int32_t ADecBufferDemo::Stop()
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

bool ADecBufferDemo::ReadBuffer(OH_AVBuffer *buffer, uint32_t index)
{
    int64_t size;
    inputFile_.read(reinterpret_cast<char *>(&size), sizeof(size));
    if (inputFile_.eof() || inputFile_.gcount() == 0 || size == 0) {
        buffer->buffer_->memory_->SetSize(1);
        buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_EOS;
        HandleInputEOS(index);
        cout << "Set EOS" << endl;
        return false;
    }

    if (inputFile_.gcount() != sizeof(size)) {
        cout << "Fatal: read size fail" << endl;
        return false;
    }

    inputFile_.read(reinterpret_cast<char *>(&buffer->buffer_->pts_), sizeof(buffer->buffer_->pts_));
    if (inputFile_.gcount() != sizeof(buffer->buffer_->pts_)) {
        cout << "Fatal: read size fail" << endl;
        return false;
    }

    inputFile_.read((char *)OH_AVBuffer_GetAddr(buffer), size);
    buffer->buffer_->memory_->SetSize(size);
    if (inputFile_.gcount() != size) {
        cout << "Fatal: read buffer fail" << endl;
        return false;
    }

    return true;
}

void ADecBufferDemo::InputFunc()
{
    uint32_t buffersize = 10 * 1024 * 1024;
    OH_AVMemory *sampleMem = OH_AVMemory_Create(buffersize);
    while (isRunning_.load()) {
        if (!isRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [this]() { return (signal_->inQueue_.size() > 0 || !isRunning_.load()); });

        if (!isRunning_.load()) {
            break;
        }

        uint32_t index = signal_->inQueue_.front();
        auto buffer = signal_->inBufferQueue_.front();
        DEMO_CHECK_AND_BREAK_LOG(buffer != nullptr, "Fatal: GetInputBuffer fail");
        int ret;
        if (audioType_ == AudioBufferFormatType::TYPE_vivid || audioType_ == AudioBufferFormatType::TYPE_AMRNB ||
            audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
            ret = OH_AVDemuxer_ReadSampleBuffer(avdemuxer_, trackIndex_, buffer);
            buffer->buffer_->dts_ = frameCount_;
            if (buffer->buffer_->flag_ == AVCODEC_BUFFER_FLAGS_EOS) {
                buffer->buffer_->memory_->SetSize(1);
                HandleInputEOS(index);
                cout << "Set EOS" << endl;
                break;
            }
        } else {
            if (ReadBuffer(buffer, index) == false) {
                break;
            }
        }

        cout << "InputFunc index:" << index << endl;

        if (isFirstFrame_) {
            buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            ret = OH_AudioCodec_PushInputBuffer(audioDec_, index);
            isFirstFrame_ = false;
        } else {
            buffer->buffer_->flag_ = AVCODEC_BUFFER_FLAGS_NONE;
            ret = OH_AudioCodec_PushInputBuffer(audioDec_, index);
        }
        signal_->inQueue_.pop();
        signal_->inBufferQueue_.pop();
        frameCount_++;
        if (ret != AVCS_ERR_OK) {
            cout << "Fatal error, exit" << endl;
            break;
        }
    }
    if (audioType_ == AudioBufferFormatType::TYPE_vivid || audioType_ == AudioBufferFormatType::TYPE_AMRNB ||
        audioType_ == AudioBufferFormatType::TYPE_AMRWB) {
        if (fd >= 0) {
            close(fd);
            fd = -1;
        }
    } else {
        if (inputFile_.is_open()) {
            inputFile_.close();
        }
    }

    OH_AVMemory_Destroy(sampleMem);
}

void ADecBufferDemo::OutputFunc()
{
    DEMO_CHECK_AND_RETURN_LOG(pcmOutputFile_.is_open(), "Fatal: output file failedis not open");
    while (isRunning_.load()) {
        if (!isRunning_.load()) {
            break;
        }
        unique_lock<mutex> lock(signal_->outMutex_);
        signal_->outCond_.wait(lock, [this]() { return (signal_->outQueue_.size() > 0 || !isRunning_.load()); });
        if (!isRunning_.load()) {
            break;
        }
        if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
            if (audioRenderer == nullptr) {
                isRunning_ = false;
                break;
            }
        }
        uint32_t index = signal_->outQueue_.front();
        OH_AVBuffer* data = signal_->outBufferQueue_.front();
        if (data == nullptr) {
            continue;
        }
        pcmOutputFile_.write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(data)), data->buffer_->memory_->GetSize());
        if (data != nullptr &&
            (data->buffer_->flag_ == AVCODEC_BUFFER_FLAGS_EOS || data->buffer_->memory_->GetSize() == 0)) {
            isRunning_.store(false);
            signal_->startCond_.notify_all();
        } else {
            if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
                OH_AVFormat *format = OH_AVBuffer_GetParameter(data);
                uint8_t *metadata = nullptr;
                size_t metasize;
                DEMO_CHECK_AND_RETURN_LOG(format != nullptr, "OH_AVBuffer_GetParameter format is nullptr");
                OH_AVFormat_GetBuffer(format, OH_MD_KEY_AUDIO_VIVID_METADATA, &metadata, &metasize);
                audioRenderer->Write(OH_AVBuffer_GetAddr(data), data->buffer_->memory_->GetSize(), metadata, metasize);
            }
        }
        signal_->outBufferQueue_.pop();
        signal_->outQueue_.pop();
        if (OH_AudioCodec_FreeOutputBuffer(audioDec_, index) != AV_ERR_OK) {
            break;
        }
        if (data->buffer_->flag_ == AVCODEC_BUFFER_FLAGS_EOS) {
            isRunning_.store(false);
            signal_->startCond_.notify_all();
        }
    }
    pcmOutputFile_.close();
}

void ADecBufferDemo::CreatDeMuxer(const std::string inputFile)
{
    fd = open(inputFile.c_str(), O_RDONLY);
    int64_t size = GetFileSize(inputFile.c_str());
    cout << inputFile << "----------------------" << fd << "---------" << size << endl;
    avsource_ = OH_AVSource_CreateWithFD(fd, 0, size);
    if (avsource_ == nullptr) {
        cout << "avsource_ is null" << endl;
        return;
    }

    avdemuxer_ = OH_AVDemuxer_CreateWithSource(avsource_);
    if (avdemuxer_ == nullptr) {
        cout << "avdemuxer_ is null" << endl;
        return;
    }

    OH_AVFormat *sourceFormat = OH_AVSource_GetSourceFormat(avsource_);
    int32_t g_trackCount;
    int ret = OH_AVFormat_GetIntValue(sourceFormat, OH_MD_KEY_TRACK_COUNT, &g_trackCount);
    cout << "OH_AVFormat_GetIntValue ret is :" << ret << endl;
    for (int32_t index = 0; index < g_trackCount; index++) {
        trackFormat = OH_AVSource_GetTrackFormat(avsource_, index);
        if (trackFormat == nullptr) {
            cout << "trackFormat is null" << endl;
            return;
        }
        int tarckType = -1;
        OH_AVFormat_GetIntValue(trackFormat, OH_MD_KEY_TRACK_TYPE, &tarckType);
        if (tarckType == 0) {
            trackIndex_ = index;
            cout << "OH_AVFormat_GetIntValue index is:" << index << endl;
            break;
        }
    }
    OH_AVFormat_SetIntValue(trackFormat, "audio.vivid.write.meta", 1);
    OH_AVDemuxer_SelectTrackByID(avdemuxer_, trackIndex_);
    if (sourceFormat != nullptr) {
        OH_AVFormat_Destroy(sourceFormat);
        sourceFormat = nullptr;
    }
    if (audioType_ == AudioBufferFormatType::TYPE_vivid) {
        AudioRendererOptions rendererOptions;
        int32_t channelNum_Get;
        int32_t sampleRate_Get;
        OH_AVFormat_GetIntValue(trackFormat, MediaDescriptionKey::MD_KEY_CHANNEL_COUNT.data(), &channelNum_Get);
        OH_AVFormat_GetIntValue(trackFormat, MediaDescriptionKey::MD_KEY_SAMPLE_RATE.data(), &sampleRate_Get);
        rendererOptions.streamInfo.samplingRate = AudioSamplingRate(sampleRate_Get);
        rendererOptions.streamInfo.encoding = AudioEncodingType::ENCODING_AUDIOVIVID;
        rendererOptions.streamInfo.format = OHOS::AudioStandard::AudioSampleFormat::SAMPLE_S16LE;
        rendererOptions.streamInfo.channels = AudioChannel(channelNum_Get);
        rendererOptions.rendererInfo.contentType = ContentType::CONTENT_TYPE_MUSIC;
        rendererOptions.rendererInfo.streamUsage = StreamUsage::STREAM_USAGE_MEDIA;
        rendererOptions.rendererInfo.rendererFlags = 0;
        cout << "rendererOptions channelNum_Get is:" << channelNum_Get << endl;
        cout << "rendererOptions sampleRate_Get is:" << sampleRate_Get << endl;
        audioRenderer = AudioRenderer::Create(rendererOptions);
        if (audioRenderer != nullptr) {
            cout << "audioRenderer is creat" << endl;
        }
    }
}

OH_AVErrCode ADecBufferDemo::SetCallback(OH_AVCodec *codec)
{
    cb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailable, &OnOutputBufferAvailable};
    return OH_AudioCodec_RegisterCallback(codec, cb_, signal_);
}

OH_AVCodec *ADecBufferDemo::CreateByMime(const char *mime)
{
    if (mime != nullptr) {
        if (0 == strcmp(mime, "audio/mp4a-latm")) {
            audioType_ = AudioBufferFormatType::TYPE_AAC;
        } else if (0 == strcmp(mime, "audio/flac")) {
            audioType_ = AudioBufferFormatType::TYPE_FLAC;
        } else {
            audioType_ = AudioBufferFormatType::TYPE_vivid;
        }
    }
    return OH_AudioCodec_CreateByMime(mime, false);
}

OH_AVCodec *ADecBufferDemo::CreateByName(const char *name)
{
    return OH_AudioCodec_CreateByName(name);
}

OH_AVErrCode ADecBufferDemo::Destroy(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Destroy(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::IsValid(OH_AVCodec *codec, bool *isValid)
{
    return OH_AudioCodec_IsValid(codec, isValid);
}

OH_AVErrCode ADecBufferDemo::Prepare(OH_AVCodec *codec)
{
    return OH_AudioCodec_Prepare(codec);
}

OH_AVErrCode ADecBufferDemo::Start(OH_AVCodec *codec)
{
    return OH_AudioCodec_Start(codec);
}

OH_AVErrCode ADecBufferDemo::Stop(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Stop(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::Flush(OH_AVCodec *codec)
{
    OH_AVErrCode ret = OH_AudioCodec_Flush(codec);
    return ret;
}

OH_AVErrCode ADecBufferDemo::Reset(OH_AVCodec *codec)
{
    return OH_AudioCodec_Reset(codec);
}

OH_AVFormat *ADecBufferDemo::GetOutputDescription(OH_AVCodec *codec)
{
    return OH_AudioCodec_GetOutputDescription(codec);
}

OH_AVErrCode ADecBufferDemo::FreeOutputData(OH_AVCodec *codec, uint32_t index)
{
    return OH_AudioCodec_FreeOutputBuffer(codec, index);
}

OH_AVErrCode ADecBufferDemo::PushInputData(OH_AVCodec *codec, uint32_t index)
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
    int32_t sleep_time = 0;
    uint32_t index;
    while (signal_->inQueue_.empty() && sleep_time < 5) {  // time 5
        sleep(1);
        sleep_time++;
    }
    if (sleep_time >= 5) {  // time 5
        return 0;
    } else {
        index = signal_->inQueue_.front();
        signal_->inQueue_.pop();
    }
    return index;
}

uint32_t ADecBufferDemo::GetOutputIndex()
{
    int32_t sleep_time = 0;
    uint32_t index;
    while (signal_->outQueue_.empty() && sleep_time < 5) {  // time 5
        sleep(1);
        sleep_time++;
    }
    if (sleep_time >= 5) {  // time 5
        return 0;
    } else {
        index = signal_->outQueue_.front();
        signal_->outQueue_.pop();
    }
    return index;
}

OH_AVErrCode ADecBufferDemo::PushInputDataEOS(OH_AVCodec *codec, uint32_t index)
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

OH_AVErrCode ADecBufferDemo::Configure(OH_AVCodec *codec, OH_AVFormat *format, int32_t channel, int32_t sampleRate)
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

OH_AVErrCode ADecBufferDemo::SetParameter(OH_AVCodec *codec, OH_AVFormat *format, int32_t channel, int32_t sampleRate)
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
