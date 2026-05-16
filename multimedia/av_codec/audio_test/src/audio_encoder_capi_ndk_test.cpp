/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <vector>
#include <mutex>
#include <gtest/gtest.h>
#include <iostream>
#include <unistd.h>
#include <atomic>
#include <fstream>
#include <queue>
#include <string>
#include <thread>
#include <multimedia/av_codec/native_avcodec_audiocodec.h>
#include <multimedia/media_foundation/native_audio_channel_layout.h>
#include <multimedia/av_codec/native_avcapability.h>
#include <multimedia/av_codec/native_avcodec_base.h>
#include <multimedia/media_foundation/native_avformat.h>
#include <multimedia/media_foundation/native_avbuffer.h>
#include "securec.h"

using namespace std;
using namespace testing::ext;

namespace {
constexpr uint32_t CHANNEL_COUNT = 2;
constexpr uint32_t SAMPLE_RATE = 44100;
constexpr int64_t BITS_RATE = 261000;
constexpr uint32_t FRAME_DURATION_US = 33000;
constexpr uint32_t AAC_DEFAULT_FRAME_BYTES = 2 * 1024 * 4;

constexpr string_view AAC_INPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_199k.pcm";
constexpr string_view AAC_OUTPUT_FILE_PATH = "/data/test/media/aac_2c_44100hz_encode.aac";
} // namespace

namespace OHOS {

class AEncSignalAv {
public:
    std::mutex inMutex_;
    std::mutex outMutex_;
    std::mutex startMutex_;
    std::condition_variable inCond_;
    std::condition_variable outCond_;
    std::condition_variable startCond_;
    std::queue<uint32_t> inQueue_;
    std::queue<uint32_t> outQueue_;
    std::queue<OH_AVBuffer*> inBufferQueue_;
    std::queue<OH_AVBuffer*> outBufferQueue_;
};

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

static void OnInputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
}

static void OnOutputBufferAvailableAv(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *data, void *userData)
{
    (void)codec;
    AEncSignalAv *signal = static_cast<AEncSignalAv *>(userData);
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outQueue_.push(index);
    signal->outBufferQueue_.push(data);
    if (data) {
    } else {
        cout << "OnOutputBufferAvailable error, attr is nullptr!" << endl;
    }
    signal->outCond_.notify_all();
}

class AudioCodeCapiEncoderNdkTest : public testing::Test {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp();
    void TearDown();
    int32_t ProceByMimeFunc(const std::string mime, bool isEncoder);
    int32_t ProceByCapabilityFunc(const std::string mime, bool isEncoder);
    void InputFuncAv();
    void OutputFuncAv();
    void HeAACSampleRateTest(int32_t profile);
    void ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t> &supportedLayoutMap, int32_t profile);
    void ChannelCountTest(set<int32_t> &supportedChannelCntSet, int32_t profile);
    bool IsSupportHeAac();
protected:
    std::atomic<bool> isRunning_ = false;
    std::unique_ptr<std::ifstream> inputFile_;
    std::unique_ptr<std::thread> inputLoop_;
    std::unique_ptr<std::thread> outputLoop_;
    int32_t index_;
    uint32_t frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    std::string inputFilePath_ = AAC_INPUT_FILE_PATH.data();
    std::string outputFilePath_ = AAC_OUTPUT_FILE_PATH.data();
    struct OH_AVCodecCallback avcb_;
    AEncSignalAv *signalAv_ = nullptr;
    OH_AVCodec *audioEnc_;
    OH_AVFormat *format;
    bool isFirstFrame_ = true;
    int64_t timeStamp_ = 0;
};

void AudioCodeCapiEncoderNdkTest::SetUpTestCase(void)
{
    cout << "[SetUpTestCase]: " << endl;
}

void AudioCodeCapiEncoderNdkTest::TearDownTestCase(void)
{
    cout << "[TearDownTestCase]: " << endl;
}

void AudioCodeCapiEncoderNdkTest::SetUp(void)
{
    cout << "[SetUp]: SetUp!!!" << endl;
}

void AudioCodeCapiEncoderNdkTest::TearDown(void)
{
    if (signalAv_ != nullptr) {
        delete signalAv_;
        signalAv_ = nullptr;
    }
    cout << "[TearDown]: over!!!" << endl;
}

int32_t AudioCodeCapiEncoderNdkTest::ProceByMimeFunc(const std::string mime, bool isEncoder)
{
    audioEnc_ = OH_AudioCodec_CreateByMime(mime.c_str(), isEncoder);
    EXPECT_NE((OH_AVCodec *)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signal);

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

int32_t AudioCodeCapiEncoderNdkTest::ProceByCapabilityFunc(const std::string mime, bool isEncoder)
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(mime.c_str(), isEncoder);
    const char *name = OH_AVCapability_GetName(cap);
    audioEnc_ = OH_AudioCodec_CreateByName(name);
    EXPECT_NE((OH_AVCodec *)nullptr, audioEnc_);

    signalAv_ = new AEncSignalAv();
    EXPECT_NE(nullptr, signal);

    avcb_ = {&OnError, &OnOutputFormatChanged, &OnInputBufferAvailableAv, &OnOutputBufferAvailableAv};
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_RegisterCallback(audioEnc_, avcb_, signalAv_));

    format = OH_AVFormat_Create();
    return AV_ERR_OK;
}

void AudioCodeCapiEncoderNdkTest::InputFuncAv()
{
    OH_AVCodecBufferAttr info = {};
    bool isEos = false;
    inputFile_ = std::make_unique<std::ifstream>(inputFilePath_, std::ios::binary);
    if (!inputFile_->is_open()) {
        std::cout << "open file failed, path: " << inputFilePath_ << std::endl;
        return;
    }
    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->inMutex_);
        signalAv_->inCond_.wait(lock, [this]() { return (signalAv_->inQueue_.size() > 0 || !isRunning_.load()); });
        if (!isRunning_.load()) {
            break;
        }
        uint32_t index = signalAv_->inQueue_.front();
        auto buffer = signalAv_->inBufferQueue_.front();
        isEos = !inputFile_->eof();
        if (!isEos) {
            inputFile_->read((char *)OH_AVBuffer_GetAddr(buffer), frameBytes_);
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

void AudioCodeCapiEncoderNdkTest::OutputFuncAv()
{
    std::ofstream outputFile;
    outputFile.open(outputFilePath_, std::ios::out | std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << "open file failed, path: " << outputFilePath_ << std::endl;
        return;
    }

    while (isRunning_.load()) {
        unique_lock<mutex> lock(signalAv_->outMutex_);
        signalAv_->outCond_.wait(lock, [this]() { return (signalAv_->outQueue_.size() > 0 || !isRunning_.load()); });

        if (!isRunning_.load()) {
            cout << "wait to stop, exit" << endl;
            break;
        }

        uint32_t index = signalAv_->outQueue_.front();
        auto *data = signalAv_->outBufferQueue_.front();
        OH_AVCodecBufferAttr attr;
        OH_AVBuffer_GetBufferAttr(data, &attr);
        if (data != nullptr) {
            outputFile.write(reinterpret_cast<char *>(OH_AVBuffer_GetAddr(data)), attr.size);
        }
        if (data != nullptr && (attr.flags == AVCODEC_BUFFER_FLAGS_EOS || attr.size == 0)) {
            cout << "encode eos" << endl;
            isRunning_.store(false);
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

void AudioCodeCapiEncoderNdkTest::HeAACSampleRateTest(int32_t profile)
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

void AudioCodeCapiEncoderNdkTest::ChannelCountTest(set<int32_t> &supportedChannelCntSet, int32_t profile)
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

void AudioCodeCapiEncoderNdkTest::ChannelLayoutTest(map<OH_AudioChannelLayout, int32_t> &supportedLayoutMap,
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

bool AudioCodeCapiEncoderNdkTest::IsSupportHeAac()
{
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    const int32_t *profiles = nullptr;
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

/**
 * @tc.name   EncoderConfigureLCAAC
 * @tc.number EncoderConfigureLCAAC
 * @tc.desc   EncoderConfigureLCAAC
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, EncoderConfigureLCAAC, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

/**
 * @tc.name   EncoderConfigureHEAAC
 * @tc.number EncoderConfigureHEAAC
 * @tc.desc   EncoderConfigureHEAAC
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, EncoderConfigureHEAAC, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    if (IsSupportHeAac()) {
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    } else {
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
        return;
    }

    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);

    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

/**
 * @tc.name   EncoderConfigureHEAACv2
 * @tc.number EncoderConfigureHEAACv2
 * @tc.desc   EncoderConfigureHEAACv2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, EncoderConfigureHEAACv2, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE_V2);
    if (IsSupportHeAac()) {
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    } else {
        EXPECT_NE(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
        return;
    }
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

/**
 * @tc.name   EncoderConfigureByCap
 * @tc.number EncoderConfigureByCap
 * @tc.desc   EncoderConfigureByCap
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, EncoderConfigureByCap, TestSize.Level1)
{
    inputFilePath_ = AAC_INPUT_FILE_PATH;
    outputFilePath_ = AAC_OUTPUT_FILE_PATH;
    frameBytes_ = AAC_DEFAULT_FRAME_BYTES;
    ProceByCapabilityFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    if (IsSupportHeAac()) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AAC_PROFILE_HE);
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
    isRunning_.store(true);

    inputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::InputFuncAv, this);
    EXPECT_NE(nullptr, inputLoop_);
    outputLoop_ = make_unique<thread>(&AudioCodeCapiEncoderNdkTest::OutputFuncAv, this);
    EXPECT_NE(nullptr, outputLoop_);
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Start(audioEnc_));
    while (isRunning_.load()) {
        sleep(1); // sleep 1s
    }

    isRunning_.store(false);
    if (inputLoop_ != nullptr && inputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->inMutex_);
            signalAv_->inCond_.notify_all();
        }
        inputLoop_->join();
    }

    if (outputLoop_ != nullptr && outputLoop_->joinable()) {
        {
            unique_lock<mutex> lock(signalAv_->outMutex_);
            signalAv_->outCond_.notify_all();
        }
        outputLoop_->join();
    }
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Flush(audioEnc_));
    EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Destroy(audioEnc_));
}

/**
 * @tc.name   sample_rate
 * @tc.number sample_rate
 * @tc.desc   sample_rate
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, sample_rate, TestSize.Level1)
{
    if (!IsSupportHeAac()) {
        return;
    }
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    HeAACSampleRateTest(AAC_PROFILE_HE);
    HeAACSampleRateTest(AAC_PROFILE_HE_V2);
}

/**
 * @tc.name   channel_count_v1
 * @tc.number channel_count_v1
 * @tc.desc   channel_count_v1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, channel_count_v1, TestSize.Level1)
{
    if (!IsSupportHeAac()) {
        return;
    }
    set<int32_t> supportedChannelCntSet = {1, 2, 3, 4, 5, 6, 8};
    ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE);
}

/**
 * @tc.name   channel_count_v2
 * @tc.number channel_count_v2
 * @tc.desc   channel_count_v2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, channel_count_v2, TestSize.Level1)
{
    if (!IsSupportHeAac()) {
        return;
    }
    set<int32_t> supportedChannelCntSet = {2};
    ChannelCountTest(supportedChannelCntSet, AAC_PROFILE_HE_V2);
}

/**
 * @tc.name   channel_layout_v1
 * @tc.number channel_layout_v1
 * @tc.desc   channel_layout_v1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, channel_layout_v1, TestSize.Level1)
{
    if (!IsSupportHeAac()) {
        return;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_MONO, 1},
        {CH_LAYOUT_STEREO, 2},
        {CH_LAYOUT_SURROUND, 3},
        {CH_LAYOUT_4POINT0, 4},
        {CH_LAYOUT_5POINT0_BACK, 5},
        {CH_LAYOUT_5POINT1_BACK, 6},
        {CH_LAYOUT_7POINT1_WIDE_BACK, 8},
        {CH_LAYOUT_7POINT1, 8},
    };
    ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE);
}

/**
 * @tc.name   channel_layout_v2
 * @tc.number channel_layout_v2
 * @tc.desc   channel_layout_v2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, channel_layout_v2, TestSize.Level1)
{
    if (!IsSupportHeAac()) {
        return;
    }
    map<OH_AudioChannelLayout, int32_t> supportedLayoutMap = {
        {CH_LAYOUT_STEREO, 2},
    };
    ChannelLayoutTest(supportedLayoutMap, AAC_PROFILE_HE_V2);
}

/**
 * @tc.name   aac_profile
 * @tc.number aac_profile
 * @tc.desc   aac_profile
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
HWTEST_F(AudioCodeCapiEncoderNdkTest, aac_profile, TestSize.Level1)
{
    ProceByMimeFunc(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITS_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_COUNT);
    set<int32_t> supportedAacProfile = {AAC_PROFILE_LC};
    if (IsSupportHeAac()) {
        supportedAacProfile = {AAC_PROFILE_LC, AAC_PROFILE_HE, AAC_PROFILE_HE_V2};
    }
    for (const int32_t profile : supportedAacProfile) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile);
        EXPECT_EQ(AV_ERR_OK, OH_AudioCodec_Configure(audioEnc_, format));
        EXPECT_EQ(OH_AudioCodec_Reset(audioEnc_), AV_ERR_OK);
    }
}

} // namespace OHOS
