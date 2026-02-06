/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include <thread>
#include <chrono>
#include "oh_audio_render_unit_test.h"

using namespace testing::ext;
using namespace std::chrono;

namespace {
    constexpr int32_t SAMPLE_RATE_48000 = 48000;
    constexpr int32_t CHANNEL_2 = 2;
}

namespace OHOS {
namespace AudioStandard {

void OHAudioRenderUnitTest::SetUpTestCase(void) { }

void OHAudioRenderUnitTest::TearDownTestCase(void) { }

void OHAudioRenderUnitTest::SetUp(void) { }

void OHAudioRenderUnitTest::TearDown(void) { }

const int32_t SAMPLING_RATE = 48000; // 48000:SAMPLING_RATE value
const int32_t CHANNEL_COUNT = 2; // 2:CHANNEL_COUNT value
const int32_t LATENCY_FORMAT = 0;
const int32_t SAMPLE_FORMAT = 1;
const int32_t FRAME_SIZE = 240; // 240:FRAME_SIZE value
uint32_t g_flag = 0;
const float MAX_AUDIO_VOLUME = 1.0f; // volume range is between 0 to 1.
const float MIN_AUDIO_VOLUME = 0.0f; // volume range is between 0 to 1.
const int32_t DURATIONMS = 40; // 40:fade out latency ms

static int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return 0;
}

static void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData)
{
    g_flag = samplePos;
    printf("AudioRendererOnMarkReachedCb samplePos: %d \n", samplePos);
}

class OHAudioRendererWriteCallbackMock {
public:
    void OnWriteData(OH_AudioRenderer* renderer, void* userData,
    void* buffer,
    int32_t bufferLen)
    {
        exeCount_++;
        if (executor_) {
            executor_(renderer, userData, buffer, bufferLen);
        }
    }

    void Install(std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor)
    {
        executor_ = executor;
    }

    uint32_t GetExeCount()
    {
        return exeCount_;
    }
private:
    std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor_;
    std::atomic<uint32_t> exeCount_ = 0;
};

static int32_t AudioRendererOnWriteDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    OHAudioRendererWriteCallbackMock *mockPtr = static_cast<OHAudioRendererWriteCallbackMock*>(userData);
    mockPtr->OnWriteData(renderer, userData, buffer, bufferLen);

    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithValidData(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithInvalidData(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

struct UserData {
public:
    enum {
        WRITE_DATA_CALLBACK,

        WRITE_DATA_CALLBACK_WITH_RESULT
    } writeDataCallbackType;
};

static int32_t OnWriteDataCbMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLer)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK;
    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithValidDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithInvalidDataMock(OH_AudioRenderer* renderer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    UserData *u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

OH_AudioStreamBuilder* OHAudioRenderUnitTest::CreateRenderBuilder()
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

OH_AudioStreamBuilder* InitRenderBuilder()
{
    // create builder
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    // set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    return builder;
}

void CleanupAudioResources(OH_AudioStreamBuilder* builder, OH_AudioRenderer* audioRenderer)
{
    // stop and release client
    OH_AudioStream_Result result = OH_AudioRenderer_Stop(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // destroy the builder
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_GenerateRenderer API via legal state.
 * @tc.number: OH_Audio_Capture_Generate_001
 * @tc.desc  : Test OH_AudioStreamBuilder_GenerateRenderer interface. Returns true, if the result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Generate_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_GenerateRenderer API via illegal OH_AudioStream_Type.
 * @tc.number: OH_Audio_Render_Generate_002
 * @tc.desc  : Test OH_AudioStreamBuilder_GenerateRenderer interface. Returns error code, if the stream type is
 *             AUDIOSTREAM_TYPE_CAPTURER.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Generate_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Start API via legal state.
 * @tc.number: Audio_Capturer_Start_001
 * @tc.desc  : Test OH_AudioRenderer_Start interface. Returns true if start is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Start_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Start API via illegal state.
 * @tc.number: Audio_Capturer_Start_002
 * @tc.desc  : Test OH_AudioRenderer_Start interface. Returns error code, if Start interface is called twice.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Start_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    result = OH_AudioRenderer_Start(audioRenderer);

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_ILLEGAL_STATE);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Pause API via legal state.
 * @tc.number: OH_Audio_Render_Pause_001
 * @tc.desc  : Test OH_AudioRenderer_Pause interface. Returns true if Pause is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Pause_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);

    result = OH_AudioRenderer_Pause(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Pause API via illegal state, Pause without Start first.
 * @tc.number: OH_Audio_Render_Pause_002
 * @tc.desc  : Test OH_AudioRenderer_Pause interface. Returns error code, if Pause without Start first.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Pause_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    result = OH_AudioRenderer_Pause(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_ILLEGAL_STATE);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Stop API via legal state.
 * @tc.number: OH_Audio_Render_Stop_001
 * @tc.desc  : Test OH_AudioRenderer_Stop interface. Returns true if Stop is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Stop_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);

    result = OH_AudioRenderer_Stop(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Stop API via illegal state, Stop without Start first.
 * @tc.number: OH_Audio_Render_Stop_002
 * @tc.desc  : Test OH_AudioRenderer_Stop interface. Returns error code, if Stop without Start first.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Stop_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    result = OH_AudioRenderer_Stop(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_ILLEGAL_STATE);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Flush API via legal state.
 * @tc.number: OH_Audio_Render_Flush_001
 * @tc.desc  : Test OH_AudioRenderer_Flush interface. Returns true if Flush is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Flush_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);

    result = OH_AudioRenderer_Flush(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Flush API via illegal state.
 * @tc.number: OH_Audio_Render_Flush_002
 * @tc.desc  : Test OH_AudioRenderer_Flush interface. Returns error code, if Flush without Start first.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Flush_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    result = OH_AudioRenderer_Flush(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_ILLEGAL_STATE);

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_Release API via legal state.
 * @tc.number: OH_Audio_Render_Release_001
 * @tc.desc  : Test OH_AudioRenderer_Release interface. Returns true if Release is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_Release_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetCurrentState API via legal state.
 * @tc.number: OH_AudioRenderer_GetCurrentState_001
 * @tc.desc  : Test OH_AudioRenderer_GetCurrentState interface. Return true if the result state is
 *             AUDIOSTREAM_STATE_PREPARED.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetCurrentState_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(state == AUDIOSTREAM_STATE_PREPARED);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetCurrentState API via legal state.
 * @tc.number: OH_AudioRenderer_GetCurrentState_002
 * @tc.desc  : Test OH_AudioRenderer_GetCurrentState interface. Return true if the result state is
 *             AUDIOSTREAM_STATE_RUNNING.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetCurrentState_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioRenderer_Start(audioRenderer);

    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(state == AUDIOSTREAM_STATE_RUNNING);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetCurrentState API via legal state.
 * @tc.number: OH_AudioRenderer_GetCurrentState_003
 * @tc.desc  : Test OH_AudioRenderer_GetCurrentState interface. Return true if the result state is
 *             AUDIOSTREAM_STATE_PAUSED.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetCurrentState_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Pause(audioRenderer);

    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(state == AUDIOSTREAM_STATE_PAUSED);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetCurrentState API via legal state.
 * @tc.number: OH_AudioRenderer_GetCurrentState_004
 * @tc.desc  : Test OH_AudioRenderer_GetCurrentState interface. Return true if the result state is
 *             AUDIOSTREAM_STATE_STOPPED.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetCurrentState_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Stop(audioRenderer);

    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(state == AUDIOSTREAM_STATE_STOPPED);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetLatencyMode API via legal state.
 * @tc.number: OH_Audio_Render_GetParameter_001
 * @tc.desc  : Test OH_AudioRenderer_GetLatencyMode interface. Returns true if latencyMode is
 *             AUDIOSTREAM_LATENCY_MODE_NORMAL,because default latency mode is AUDIOSTREAM_LATENCY_MODE_NORMAL.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetParameter_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    result = OH_AudioRenderer_GetLatencyMode(audioRenderer, &latencyMode);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(latencyMode == AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetStreamId API via legal state.
 * @tc.number: OH_Audio_Render_GetParameter_002
 * @tc.desc  : Test OH_AudioRenderer_GetStreamId interface. Returns true if the result is AUDIOSTREAM_SUCCESS.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetParameter_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    uint32_t streamId;
    result = OH_AudioRenderer_GetStreamId(audioRenderer, &streamId);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetSamplingRate API via legal state.
 * @tc.number: OH_Audio_Render_GetSamplingRate_001
 * @tc.desc  : Test OH_AudioRenderer_GetSamplingRate interface. Returns true if samplingRate is
 *             SAMPLE_RATE_48000,because default samplingRate is SAMPLE_RATE_48000.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetSamplingRate_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    int32_t rate;
    result = OH_AudioRenderer_GetSamplingRate(audioRenderer, &rate);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(rate == SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetSampleFormat API via legal state.
 * @tc.number: OH_Audio_Render_GetSampleFormat_001
 * @tc.desc  : Test OH_AudioRenderer_GetSampleFormat interface. Returns true if sampleFormat is
 *             AUDIOSTREAM_SAMPLE_S16LE,because default sampleFormat is AUDIOSTREAM_SAMPLE_S16LE.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetSampleFormat, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_SampleFormat sampleFormat;
    result = OH_AudioRenderer_GetSampleFormat(audioRenderer, &sampleFormat);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(sampleFormat == AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetEncodingType API via legal state.
 * @tc.number: OH_Audio_Render_GetEncodingType_001
 * @tc.desc  : Test OH_AudioRenderer_GetEncodingType interface. Returns true if encodingType is
 *             ENCODING_PCM,because default encodingType is ENCODING_PCM.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetEncodingType_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_EncodingType encodingType;
    result = OH_AudioRenderer_GetEncodingType(audioRenderer, &encodingType);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(encodingType == AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetRendererInfo API via legal state.
 * @tc.number: OH_Audio_Render_GetRendererInfo_001
 * @tc.desc  : Test OH_AudioRenderer_GetRendererInfo interface. Returns true if usage is STREAM_USAGE_MEDIA and content
 *             is CONTENT_TYPE_MUSIC.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetRendererInfo_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_Usage usage;
    result = OH_AudioRenderer_GetRendererInfo(audioRenderer, &usage);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(usage, AUDIOSTREAM_USAGE_MUSIC);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetRendererPrivacy API.
 * @tc.number: OH_AudioRenderer_GetRendererPrivacy_001
 * @tc.desc  : Test OH_AudioRenderer_GetRendererPrivacy interface with default privacy AUDIO_STREAM_PRIVACY_TYPE_PUBLIC.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetRendererPrivacy_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_PrivacyType privacyType;
    result = OH_AudioRenderer_GetRendererPrivacy(audioRenderer, &privacyType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(privacyType, AUDIO_STREAM_PRIVACY_TYPE_PUBLIC);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetRendererPrivacy API.
 * @tc.number: OH_AudioRenderer_GetRendererPrivacy_002
 * @tc.desc  : Test OH_AudioRenderer_GetRendererPrivacy interface with privacy AUDIO_STREAM_PRIVACY_TYPE_PRIVATE.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetRendererPrivacy_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioStream_Result privacyResult = OH_AudioStreamBuilder_SetRendererPrivacy(builder,
        AUDIO_STREAM_PRIVACY_TYPE_PRIVATE);
    EXPECT_EQ(privacyResult, AUDIOSTREAM_SUCCESS);
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_PrivacyType privacyType;
    result = OH_AudioRenderer_GetRendererPrivacy(audioRenderer, &privacyType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(privacyType, AUDIO_STREAM_PRIVACY_TYPE_PRIVATE);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetChannelLayout API via legal state.
 * @tc.number: OH_AudioRenderer_GetChannelLayout_001
 * @tc.desc  : Test OH_AudioRenderer_GetChannelLayout interface. Returns true if channelLayout is
 *             CH_LAYOUT_UNKNOWN, because default channelLayout is CH_LAYOUT_UNKNOWN.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetChannelLayout_001, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioChannelLayout channelLayout;
    result = OH_AudioRenderer_GetChannelLayout(audioRenderer, &channelLayout);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(channelLayout == CH_LAYOUT_UNKNOWN);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetEffectMode API via legal state.
 * @tc.number: OH_AudioRenderer_GetEffectMode_001
 * @tc.desc  : Test OH_AudioRenderer_GetEffectMode interface. Returns true if effect mode is the same as set.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetEffectMode_001, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer *audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_AudioEffectMode effectMode;
    result = OH_AudioRenderer_SetEffectMode(audioRenderer, EFFECT_DEFAULT);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    result = OH_AudioRenderer_GetEffectMode(audioRenderer, &effectMode);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_TRUE(effectMode == EFFECT_DEFAULT);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetVolume API via illegal state.
 * @tc.number: OH_Audio_Render_GetVolume_001
 * @tc.desc  : Test OH_AudioRenderer_GetVolume interface with nullptr audioRenderer.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetVolume_001, TestSize.Level0)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volume;
    OH_AudioStream_Result result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetVolume API via legal state.
 * @tc.number: OH_Audio_Render_GetVolume_002
 * @tc.desc  : Test OH_AudioRenderer_GetVolume interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetVolume_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volume;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetVolume API via legal state.
 * @tc.number: OH_Audio_Render_GetVolume_003
 * @tc.desc  : Test OH_AudioRenderer_GetVolume interface after set volume call.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetVolume_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = 0.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(volumeGet, 0.5);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetVolume API via legal state.
 * @tc.number: OH_Audio_Render_GetVolume_004
 * @tc.desc  : Test OH_AudioRenderer_GetVolume interface after set volume fails.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetVolume_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = 0.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    volumeSet = 1.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(volumeGet, 0.5);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolume API via illegal state.
 * @tc.number: OH_Audio_Render_SetVolume_001
 * @tc.desc  : Test OH_AudioRenderer_SetVolume interface with nullptr audioRenderer.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolume_001, TestSize.Level0)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = 0.5;
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolume API via legal state.
 * @tc.number: OH_Audio_Render_SetVolume_002
 * @tc.desc  : Test OH_AudioRenderer_SetVolume interface between minimum and maximum volumes.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolume_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = 0.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolume API via legal state.
 * @tc.number: OH_Audio_Render_SetVolume_003
 * @tc.desc  : Test OH_AudioRenderer_SetVolume interface for minimum and maximum volumes.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolume_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = MIN_AUDIO_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    volumeSet = MAX_AUDIO_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolume API via illegal state.
 * @tc.number: OH_Audio_Render_SetVolume_004
 * @tc.desc  : Test OH_AudioRenderer_SetVolume interface out of volumes range.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolume_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = -0.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);
    volumeSet = -1.5;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolumeWithRamp API via illegal state.
 * @tc.number: OH_Audio_Render_SetVolumeWithRamp_001
 * @tc.desc  : Test OH_AudioRenderer_SetVolumeWithRamp interface with nullptr audioRenderer.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolumeWithRamp_001, TestSize.Level0)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = MIN_AUDIO_VOLUME;
    int32_t durationMs = DURATIONMS;
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetVolumeWithRamp API via legal state.
 * @tc.number: OH_Audio_Render_SetVolumeWithRamp_002
 * @tc.desc  : Test OH_AudioRenderer_SetVolumeWithRamp interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetVolumeWithRamp_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = MIN_AUDIO_VOLUME;
    int32_t durationMs = DURATIONMS;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetMarkPosition API via illegal state.
 * @tc.number: OH_Audio_Render_SetMarkPosition_001
 * @tc.desc  : Test OH_AudioRenderer_SetMarkPosition interface with nullptr audioRenderer.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetMarkPosition_001, TestSize.Level0)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    OH_AudioStream_Result result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetMarkPosition API via legal state.
 * @tc.number: OH_Audio_Render_SetMarkPosition_002
 * @tc.desc  : Test OH_AudioRenderer_SetMarkPosition interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetMarkPosition_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetMarkPosition API via illegal state.
 * @tc.number: OH_Audio_Render_SetMarkPosition_003
 * @tc.desc  : Test OH_AudioRenderer_SetMarkPosition interface with incorrect samplepos value.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetMarkPosition_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    uint32_t samplePos = 0;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetMarkPosition API via legal state.
 * @tc.number: OH_Audio_Render_SetMarkPosition_004
 * @tc.desc  : Test OH_AudioRenderer_SetMarkPosition interface with callback.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetMarkPosition_004, TestSize.Level0)
{
    // 1. create
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    // 2. set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    // 3. set buffer size to FRAME_SIZE
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(g_flag, 0);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_EQ(g_flag, 1);
    // 5. stop and release client
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);

    // 6. destroy the builder
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_SetMarkPosition API via legal state.
 * @tc.number: OH_Audio_Render_SetMarkPosition_005
 * @tc.desc  : Test OH_AudioRenderer_SetMarkPosition interface multiple times.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetMarkPosition_005, TestSize.Level0)
{
    // 1. create
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    // 2. set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    // 3. set buffer size to FRAME_SIZE
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_EQ(g_flag, 1);
    // 5. stop and release client
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);

    // 6. destroy the builder
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_CancelMark API via illegal state.
 * @tc.number: OH_Audio_Render_CancelMark_001
 * @tc.desc  : Test OH_AudioRenderer_CancelMark interface with nullptr audioRenderer.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_CancelMark_001, TestSize.Level0)
{
    OH_AudioRenderer* audioRenderer = nullptr;
    OH_AudioStream_Result result = OH_AudioRenderer_CancelMark(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : Test OH_AudioRenderer_CancelMark API via legal state.
 * @tc.number: OH_Audio_Render_CancelMark_002
 * @tc.desc  : Test OH_AudioRenderer_CancelMark interface without callback.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_CancelMark_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    EXPECT_TRUE(result == AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_CancelMark API via legal state.
 * @tc.number: OH_Audio_Render_CancelMark_003
 * @tc.desc  : Test OH_AudioRenderer_CancelMark interface with callback.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_CancelMark_003, TestSize.Level0)
{
    // 1. create
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    // 2. set params and callbacks
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    // 3. set buffer size to FRAME_SIZE
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);

    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 2;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_EQ(g_flag, 2);

    // CancelMark
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 5. stop and release client
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);

    // 6. destroy the builder
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetUnderflowCount API.
 * @tc.number: OH_AudioRenderer_GetUnderflowCount_001
 * @tc.desc  : Test OH_AudioRenderer_GetUnderflowCount interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OHAudioRendererWriteCallbackMock writeCallbackMock;

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;
    writeCallbackMock.Install([&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData,
        void* buffer,
        int32_t bufferLen) {
            std::lock_guard lock(mutex);
            cv.notify_one();

            // sleep time trigger underflow
            if (count == 1) {
                std::this_thread::sleep_for(200ms);
            }
            count++;
        });

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::unique_lock lock(mutex);
    cv.wait_for(lock, 1s, [&count] {
        // count > 1 ensure sleeped
        return count > 1;
    });
    lock.unlock();

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_GE(underFlowCount, 1);

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetUnderflowCount API.
 * @tc.number: OH_AudioRenderer_GetUnderflowCount_002
 * @tc.desc  : Test OH_AudioRenderer_GetUnderflowCount interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OHAudioRendererWriteCallbackMock writeCallbackMock;

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;
    writeCallbackMock.Install([&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData,
        void* buffer,
        int32_t bufferLen) {
            std::lock_guard lock(mutex);
            cv.notify_one();

            // sleep time trigger underflow
            if (count == 0) {
                std::this_thread::sleep_for(200ms);
            }
            count++;
        });

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::unique_lock lock(mutex);
    cv.wait_for(lock, 1s, [&count] {
        // count > 1 ensure sleeped
        return count > 1;
    });
    lock.unlock();

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_GT(underFlowCount, 0);

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetUnderflowCount API.
 * @tc.number: OH_AudioRenderer_GetUnderflowCount_003
 * @tc.desc  : Test OH_AudioRenderer_GetUnderflowCount interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OHAudioRendererWriteCallbackMock writeCallbackMock;

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(underFlowCount, 0);

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetUnderflowCount API.
 * @tc.number: OH_AudioRenderer_GetUnderflowCount_004
 * @tc.desc  : Test OH_AudioRenderer_GetUnderflowCount interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_004, TestSize.Level0)
{
    uint32_t lastUnderFlowCount = 0;
    for (auto sleepTimes : {200ms, 400ms, 600ms}) {
        OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

        OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
        OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
        OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
        OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

        OHAudioRendererWriteCallbackMock writeCallbackMock;

        OH_AudioRenderer_Callbacks callbacks;
        callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
        OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

        OH_AudioRenderer* audioRenderer;
        OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        std::mutex mutex;
        std::condition_variable cv;
        int32_t count = 0;
        writeCallbackMock.Install([&count, &mutex, &cv, sleepTimes](OH_AudioRenderer* renderer, void* userData,
            void* buffer,
            int32_t bufferLen) {
                std::lock_guard lock(mutex);
                cv.notify_one();

                // sleep time trigger underflow
                if (count == 1) {
                    std::this_thread::sleep_for(sleepTimes);
                }
                count++;
            });

        result = OH_AudioRenderer_Start(audioRenderer);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        std::unique_lock lock(mutex);
        cv.wait_for(lock, 1s, [&count] {
            // count > 1 ensure sleeped
            return count > 10;
        });
        lock.unlock();

        uint32_t underFlowCount = 0;
        result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
        EXPECT_GT(underFlowCount, lastUnderFlowCount);
        lastUnderFlowCount = underFlowCount;

        OH_AudioRenderer_Stop(audioRenderer);
        OH_AudioRenderer_Release(audioRenderer);

        OH_AudioStreamBuilder_Destroy(builder);
    }
}

/**
 * @tc.name  : Test OH_AudioRenderer_GetUnderflowCount API.
 * @tc.number: OH_AudioRenderer_GetUnderflowCount_005
 * @tc.desc  : Test OH_AudioRenderer_GetUnderflowCount interface.
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioRenderer_GetUnderflowCount_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = OHAudioRenderUnitTest::CreateRenderBuilder();

    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OHAudioRendererWriteCallbackMock writeCallbackMock;

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &writeCallbackMock);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    std::this_thread::sleep_for(1s);

    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    EXPECT_EQ(underFlowCount, 0);

    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);

    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_001
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with VALID result.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_002
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with INVALID result.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_003
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with VALID result
 *             overwrites OH_AudioStreamBuilder_SetRendererCallback interface.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    UserData userData;
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = OnWriteDataCbMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &userData);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCbWithValidDataMock;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, &userData);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_TRUE(userData.writeDataCallbackType == UserData::WRITE_DATA_CALLBACK_WITH_RESULT);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_004
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with INVALID result
 *             overwrites OH_AudioStreamBuilder_SetRendererCallback interface.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    UserData userData;
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = OnWriteDataCbMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &userData);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCbWithInvalidDataMock;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, &userData);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_TRUE(userData.writeDataCallbackType == UserData::WRITE_DATA_CALLBACK_WITH_RESULT);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_005
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererCallback interface
 *             overwrites OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with VALID result.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    UserData userData;
    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCbWithValidDataMock;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, &userData);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = OnWriteDataCbMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &userData);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_TRUE(userData.writeDataCallbackType == UserData::WRITE_DATA_CALLBACK);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : Test OH_AudioStreamBuilder_SetRendererWriteDataCallback API via legal state.
 * @tc.number: OH_Audio_Render_WriteDataCallback_006
 * @tc.desc  : Test OH_AudioStreamBuilder_SetRendererCallback interface
 *             overwrites OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with INVALID result.
 *             Returns true if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_WriteDataCallback_006, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();

    UserData userData;
    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCbWithInvalidDataMock;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, &userData);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = OnWriteDataCbMock;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, &userData);

    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_Start(audioRenderer);
    sleep(2);
    EXPECT_TRUE(userData.writeDataCallbackType == UserData::WRITE_DATA_CALLBACK);

    CleanupAudioResources(builder, audioRenderer);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_001
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_001
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'right test.
 *             loudness is -90.0 and streamtype is music.
 *             Returns AUDIOSTREAM_SUCCESS if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -90.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && -90.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_002
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_002
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'right test.
 *             loudness is -89.9 and streamtype is music.
 *             Returns AUDIOSTREAM_SUCCESS if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MUSIC);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -89.9f);
    sleep(1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    
    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (-89.9 - loudnessGain < 0.1 || loudnessGain + 89.9 < 0.1));
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_003
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_003
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'right test.
 *             loudness is 24.0 and streamtype is movie.
 *             Returns AUDIOSTREAM_SUCCESS if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 24.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_004
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_004
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'right test.
 *             loudness is 23.9 and streamtype is audiobook.
 *             Returns AUDIOSTREAM_SUCCESS if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 23.9f);
    sleep(1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    
    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (23.9 - loudnessGain < 0.1 || loudnessGain - 23.9 < 0.1));
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_005
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_005
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'right test.
 *             super low-power.
 *             Returns AUDIOSTREAM_SUCCESS if result is successful.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)5);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 24.0f == loudnessGain);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_006
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_006
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             loudness is -90.1.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_006, TestSize.Level1)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -90.1f);
    sleep(1);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_007
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_007
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             loudness is 24.1.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_007, TestSize.Level1)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.1f);
    sleep(1);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_008
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_008
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             OH_AudioRenderer_SetLoudnessGain'renderer is nullptr.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_008, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(nullptr, 24.0f);
    sleep(1);

    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_010
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_010
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_VOICE_COMMUNICATION.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_010, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_COMMUNICATION);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_011
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_011
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_VOICE_ASSISTANT.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_011, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_ASSISTANT);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_012
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_012
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_ALARM.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_012, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_ALARM);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_013
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_013
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_VOICE_MESSAGE.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_013, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_MESSAGE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_014
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_014
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_RINGTONE.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_014, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_RINGTONE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_015
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_015
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_NOTIFICATION.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_015, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_NOTIFICATION);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_017
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_017
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_GAME.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_017, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_GAME);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_018
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_018
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_NAVIGATION.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_018, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_NAVIGATION);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_019
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_019
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface'back test.
 *             streamtype is AUDIOSTREAM_USAGE_VIDEO_COMMUNICATION.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_019, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VIDEO_COMMUNICATION);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    sleep(1);

    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    EXPECT_TRUE((AUDIOSTREAM_SUCCESS == result) && (loudnessGain == 0));

    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}
/**
 * @tc.name  : OH_AudioRenderer_SetLoudnessGain_021
 * @tc.number: OH_AudioRenderer_SetLoudnessGain_021
 * @tc.desc  : Test OH_AudioRenderer_SetLoudnessGain interface
 *             overwrites OH_AudioRenderer_SetLoudnessGain interface' stability_test.
 *             Returns AUDIOSTREAM_SUCCESS if result is success.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_SetLoudnessGain_021, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int i = 0;
    float loudnessGain = 0;

    while (i < 2000) {
        result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 10.0f);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
        EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && 10.0f == loudnessGain);

        result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -10.0f);
        EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

        result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
        EXPECT_TRUE(AUDIOSTREAM_SUCCESS == result && -10.0f == loudnessGain);

        i++;
    }
    
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_GetLoudnessGain_001
 * @tc.number: OH_AudioRenderer_GetLoudnessGain_001
 * @tc.desc  : Test OH_AudioRenderer_GetLoudnessGain interface
 *             overwrites OH_AudioRenderer_GetLoudnessGain interface'back test.
 *             renderer is nullptr.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetLoudnessGain_001, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(nullptr, &loudnessGain);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioRenderer_GetLoudnessGain_002
 * @tc.number: OH_AudioRenderer_GetLoudnessGain_002
 * @tc.desc  : Test OH_AudioRenderer_GetLoudnessGain interface
 *             overwrites OH_AudioRenderer_GetLoudnessGain interface'back test.
 *             renderer is nullptr.
 *             Returns AUDIOSTREAM_ERROR_INVALID_PARAM if result is fail.
 */
HWTEST(OHAudioRenderUnitTest, OH_Audio_Render_GetLoudnessGain_002, TestSize.Level2)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);

    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_MOVIE);

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);

    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, nullptr);
    EXPECT_TRUE(AUDIOSTREAM_ERROR_INVALID_PARAM == result);
    result = OH_AudioRenderer_Release(audioRenderer);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioStreamBuilder_Destroy(builder);
}

/**
 * @tc.name  : OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001
 * @tc.number: OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001
 * @tc.desc  : null check
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioStreamManager_IsAcousticEchoCancelerSupported_001, TestSize.Level2)
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);

    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_NE(streamManager, nullptr);

    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(nullptr, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM);

    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, nullptr);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM);
}

/**
 * @tc.name  : OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002
 * @tc.number: OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002
 * @tc.desc  : IsAcousticEchoCancelerSupported
 */
HWTEST(OHAudioRenderUnitTest, OH_AudioStreamManager_IsAcousticEchoCancelerSupported_002, TestSize.Level2)
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);

    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_NE(streamManager, nullptr);

    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    EXPECT_EQ(ret, AUDIOCOMMON_RESULT_SUCCESS);
    EXPECT_EQ(supported, false);
}

} // namespace AudioStandard
} // namespace OHOS
