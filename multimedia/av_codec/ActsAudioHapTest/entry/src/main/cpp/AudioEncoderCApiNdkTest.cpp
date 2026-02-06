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

#include <atomic>
#include <fstream>
#include <include/AudioEncoderCApiNdkTest.h>
#include <include/CommonToolTest.h>
#include <iostream>
#include <map>
#include <multimedia/native_audio_channel_layout.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avformat.h>
#include <mutex>
#include <queue>
#include <set>
#include <string>
#include <thread>
#include <unistd.h>
#include <vector>

using namespace std;

namespace OHOS {

namespace {
constexpr int SUCCESS_CODE = 0;
}

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

static void OnInputBufferAvailableAv(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    (void)codec;
    AEncSignalAv* signal = static_cast<AEncSignalAv*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailableAv(OH_AVCodec* codec, uint32_t index, OH_AVBuffer* data, void* userData)
{
    (void)codec;
    AEncSignalAv* signal = static_cast<AEncSignalAv*>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    if (data) {
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

int32_t AudioCodeCApiEncoderNdkTestContext::ProceByMimeFunc(const std::string mime, bool isEncoder)
{
    audioEnc_ = OH_AudioCodec_CreateByMime(mime.c_str(), isEncoder);
    EXPECT_NE((OH_AVCodec*)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signalAv_);

    avcb_ = { &OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv };
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

int32_t AudioCodeCApiEncoderNdkTestContext::ProceByCapabilityFunc(const std::string mime, bool isEncoder)
{
    OH_AVCapability* cap = OH_AVCodec_GetCapability(mime.c_str(), isEncoder);
    const char* name = OH_AVCapability_GetName(cap);
    audioEnc_ = OH_AudioCodec_CreateByName(name);
    EXPECT_NE((OH_AVCodec*)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signalAv_);

    avcb_ = { &OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv };
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

void AudioCodeCApiEncoderNdkTestContext::InputFuncAv()
{
    OH_AVCodecBufferAttr info = {};
    bool isEos = false;
    inputFile_ = std::make_unique<std::ifstream>(inputFilePath_, std::ios::binary);
    if (!inputFile_->is_open()) {
        std::cout << "open file failed, path: " << inputFilePath_ << std::endl;
        return;
    }
    while (isRunning_) {
        unique_lock<mutex> lock(signalAv_->inMutex_);
        signalAv_->inCond_.wait(lock, [this]() { return (signalAv_->inQueue_.size() > 0 || !isRunning_); });
        if (!isRunning_) {
            break;
        }
        uint32_t index = signalAv_->inQueue_.front();
        auto buffer = signalAv_->inBufferQueue_.front();
        isEos = !inputFile_->eof();
        if (!isEos) {
            inputFile_->read((char*)OH_AVBuffer_GetAddr(buffer), frameBytes_);
        }
        info.size = frameBytes_;
        info.flags = AVCODEC_BUFFER_FLAGS_NONE;
        if (isEos) {
            info.size = 0;
            info.flags = AVCODEC_BUFFER_FLAGS_EOS;
        } else if (isFirstFrame_) {
            info.flags = AVCODEC_BUFFER_FLAGS_CODEC_DATA;
            isFirstFrame_ = false;
        }
        info.offset = 0;
        OH_AVBuffer_SetBufferAttr(buffer, &info);
        int32_t ret = OH_AudioCodec_PushInputBuffer(audioEnc_, index);
        signalAv_->inQueue_.pop();
        signalAv_->inBufferQueue_.pop();
        if (ret != AV_ERR_OK) {
            isRunning_ = false;
            break;
        }
        if (isEos) {
            break;
        }
        timeStamp_ += FRAME_DURATION_US;
    }
    inputFile_->close();
}

void AudioCodeCApiEncoderNdkTestContext::OutputFuncAv()
{
    std::ofstream outputFile;
    outputFile.open(outputFilePath_, std::ios::out | std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << "open file failed, path: " << outputFilePath_ << std::endl;
        return;
    }

    while (isRunning_) {
        unique_lock<mutex> lock(signalAv_->outMutex_);
        signalAv_->outCond_.wait(lock, [this]() { return (signalAv_->outQueue_.size() > 0 || !isRunning_); });

        if (!isRunning_) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signalAv_->outQueue_.front();
        auto* data = signalAv_->outBufferQueue_.front();
        OH_AVCodecBufferAttr attr;
        OH_AVBuffer_GetBufferAttr(data, &attr);
        if (data != nullptr) {
            outputFile.write(reinterpret_cast<char*>(OH_AVBuffer_GetAddr(data)), attr.size);
        }
        if (data != nullptr && (attr.flags == AVCODEC_BUFFER_FLAGS_EOS || attr.size == 0)) {
            cout << "encode eos" << endl;
            isRunning_ = false;
            signalAv_->startCond_.notify_all();
        }
        signalAv_->outBufferQueue_.pop();
        signalAv_->outQueue_.pop();
        if (OH_AudioCodec_FreeOutputBuffer(audioEnc_, index) != AV_ERR_OK) {
            cout << "Fatal: FreeOutputData fail" << endl;
            break;
        }
    }
    outputFile.close();
}

void AudioCodeCApiEncoderNdkTestContext::HeAACSampleRateTest(int32_t profile)
{
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    set<uint32_t> supportedSampleRateSet = {
        16000, 22050, 24000, 32000, 44100, 48000, 64000, 88200, 96000,
    };
    for (const uint32_t rate : supportedSampleRateSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

void AudioCodeCApiEncoderNdkTestContext::ChannelCountTest(set<int32_t>& supportedChannelCntSet, int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    for (const int32_t cnt : supportedChannelCntSet) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, cnt);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

void AudioCodeCApiEncoderNdkTestContext::ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t>& supportedLayoutMap,
                                                           int32_t profile)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
    map<OH_AudioChannelLayout, int32_t>::iterator iter;
    for (iter = supportedLayoutMap.begin(); iter != supportedLayoutMap.end(); iter++) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, iter->second);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, iter->first);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

bool AudioCodeCApiEncoderNdkTestContext::IsSupportHeAac()
{
    OH_AVCapability* cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability_GetSupportedProfiles(cap, &profiles, &profileNum);
    for (uint32_t i = 0; i < profileNum; i++) {
        if (profiles[i] == AAC_PROFILE_HE) {
            cout << "support HE-AAC" << endl;
            return true;
        }
    }
    cout << "not support HE-AAC" << endl;
    return false;
}

int EncoderConfigureLCAAC()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    ctx->inputFilePath_ = AAC_INPUT_FILE_PATH;
    ctx->outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    ctx->frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ctx->ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(ctx->format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
    ctx->isRunning_ = true;

    ctx->inputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->InputFuncAv(); });
    EXPECT_NE(nullptr, ctx->inputLoop_);
    ctx->outputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->OutputFuncAv(); });
    EXPECT_NE(nullptr, ctx->outputLoop_);

    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(ctx->audioEnc_));
    while (ctx->isRunning_) {
        sleep(1); // sleep 1s
    }

    ctx->isRunning_ = false;
    if (ctx->inputLoop_ != nullptr && ctx->inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->inMutex_);
            ctx->signalAv_->inCond_.notify_all();
        }
        ctx->inputLoop_->join();
    }

    if (ctx->outputLoop_ != nullptr && ctx->outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->outMutex_);
            ctx->signalAv_->outCond_.notify_all();
        }
        ctx->outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(ctx->audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
    return SUCCESS_CODE;
}

int EncoderConfigureHEAAC()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    ctx->inputFilePath_ = AAC_INPUT_FILE_PATH;
    ctx->outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    ctx->frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ctx->ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(ctx->format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    if (ctx->IsSupportHeAac()) {
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
    } else {
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
        return SUCCESS_CODE;
    }

    ctx->isRunning_ = true;

    ctx->inputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->InputFuncAv(); });
    EXPECT_NE(nullptr, ctx->inputLoop_);
    ctx->outputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->OutputFuncAv(); });
    EXPECT_NE(nullptr, ctx->outputLoop_);

    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(ctx->audioEnc_));
    while (ctx->isRunning_) {
        sleep(1); // sleep 1s
    }

    ctx->isRunning_ = false;
    if (ctx->inputLoop_ != nullptr && ctx->inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->inMutex_);
            ctx->signalAv_->inCond_.notify_all();
        }
        ctx->inputLoop_->join();
    }

    if (ctx->outputLoop_ != nullptr && ctx->outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->outMutex_);
            ctx->signalAv_->outCond_.notify_all();
        }
        ctx->outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(ctx->audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
    return SUCCESS_CODE;
}

int EncoderConfigureHEAACv2()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    ctx->inputFilePath_ = AAC_INPUT_FILE_PATH;
    ctx->outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    ctx->frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ctx->ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(ctx->format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE_V2);
    if (ctx->IsSupportHeAac()) {
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
    } else {
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
        return SUCCESS_CODE;
    }
    ctx->isRunning_ = true;

    ctx->inputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->InputFuncAv(); });
    EXPECT_NE(nullptr, ctx->inputLoop_);
    ctx->outputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->OutputFuncAv(); });
    EXPECT_NE(nullptr, ctx->outputLoop_);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(ctx->audioEnc_));
    while (ctx->isRunning_) {
        sleep(1); // sleep 1s
    }

    ctx->isRunning_ = false;
    if (ctx->inputLoop_ != nullptr && ctx->inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->inMutex_);
            ctx->signalAv_->inCond_.notify_all();
        }
        ctx->inputLoop_->join();
    }

    if (ctx->outputLoop_ != nullptr && ctx->outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->outMutex_);
            ctx->signalAv_->outCond_.notify_all();
        }
        ctx->outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(ctx->audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
    return SUCCESS_CODE;
}

int EncoderConfigureByCap()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    ctx->inputFilePath_ = AAC_INPUT_FILE_PATH;
    ctx->outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    ctx->frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ctx->ProceByCapabilityFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(ctx->format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    if (ctx->IsSupportHeAac()) {
        OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
    ctx->isRunning_ = true;

    ctx->inputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->InputFuncAv(); });
    EXPECT_NE(nullptr, ctx->inputLoop_);
    ctx->outputLoop_ = std::make_unique<std::thread>([ctxPtr = ctx.get()]() { ctxPtr->OutputFuncAv(); });
    EXPECT_NE(nullptr, ctx->outputLoop_);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(ctx->audioEnc_));
    while (ctx->isRunning_) {
        sleep(1); // sleep 1s
    }

    ctx->isRunning_ = false;
    if (ctx->inputLoop_ != nullptr && ctx->inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->inMutex_);
            ctx->signalAv_->inCond_.notify_all();
        }
        ctx->inputLoop_->join();
    }

    if (ctx->outputLoop_ != nullptr && ctx->outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(ctx->signalAv_->outMutex_);
            ctx->signalAv_->outCond_.notify_all();
        }
        ctx->outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(ctx->audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(ctx->audioEnc_));
    return SUCCESS_CODE;
}

int SampleRate()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    if (!ctx->IsSupportHeAac()) {
        return SUCCESS_CODE;
    }
    ctx->ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    ctx->HeAACSampleRateTest(AAC_PROFILE_HE);
    ctx->HeAACSampleRateTest(AAC_PROFILE_HE_V2);
    return SUCCESS_CODE;
}

int ChannelCountV1()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    if (!ctx->IsSupportHeAac()) {
        return SUCCESS_CODE;
    }
    set<int32_t> supportedChannelCntSet = { 1, 2, 3, 4, 5, 6, 8 };
    ctx->ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE);
    return SUCCESS_CODE;
}

int ChannelCountV2()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    if (!ctx->IsSupportHeAac()) {
        return SUCCESS_CODE;
    }
    set<int32_t> supportedChannelCntSet = { 2 };
    ctx->ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE_V2);
    return SUCCESS_CODE;
}

int ChannelLayoutV1()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    if (!ctx->IsSupportHeAac()) {
        return SUCCESS_CODE;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        { CH_LAYOUT_MONO, 1 },
        { CH_LAYOUT_STEREO, 2 },
        { CH_LAYOUT_SURROUND, 3 },
        { CH_LAYOUT_4POINT0, 4 },
        { CH_LAYOUT_5POINT0_BACK, 5 },
        { CH_LAYOUT_5POINT1_BACK, 6 },
        { CH_LAYOUT_7POINT1_WIDE_BACK, 8 },
        { CH_LAYOUT_7POINT1, 8 },
    };
    ctx->ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE);
    return SUCCESS_CODE;
}

int ChannelLayoutV2()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    if (!ctx->IsSupportHeAac()) {
        return SUCCESS_CODE;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        { CH_LAYOUT_STEREO, 2 },
    };
    ctx->ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE_V2);
    return SUCCESS_CODE;
}

int AacProfile()
{
    auto ctx = std::make_unique<AudioCodeCApiEncoderNdkTestContext>();
    ctx->ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(ctx->format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    set<int32_t> supportedAacProfile = { AAC_PROFILE_LC };
    if (ctx->IsSupportHeAac()) {
        supportedAacProfile = { AAC_PROFILE_LC, AAC_PROFILE_HE, AAC_PROFILE_HE_V2 };
    }
    for (const int32_t profile : supportedAacProfile) {
        OH_AVFormat_SetIntValue(ctx->format, OH_MD_KEY_PROFILE, profile);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(ctx->audioEnc_, ctx->format));
        EXPECT_EQ(OH_AudioCodec_Reset(ctx->audioEnc_), AV_ERR_OK);
    }
    return SUCCESS_CODE;
}

} // namespace OHOS
