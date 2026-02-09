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

#include "oh_audio_stream_builder_unit_test.h"

using namespace testing::ext;

namespace OHOS {
namespace AudioStandard {

namespace {
    const int32_t SAMPLING_RATE_44100 = 44100;
    const int32_t SAMPLING_RATE_48000 = 48000;
    const int32_t SAMPLING_RATE_88200 = 88200;
    const int32_t SAMPLING_RATE_176400 = 176400;
    const int32_t SAMPLING_RATE_192000 = 192000;
    const int32_t SAMPLING_RATE_WRONG_NUM = -1;

    const int32_t CHANNEL_COUNT_1 = 1;
    const int32_t CHANNEL_COUNT_16 = 16;
    const int32_t CHANNEL_COUNT_18 = 18;

    FILE *g_file;
    bool g_readEnd = false;
}

const int32_t SAMPLING_RATE = 48000; // 48000:SAMPLING_RATE value
const int32_t CHANNEL_COUNT = 2; // 2:CHANNEL_COUNT value
const int32_t g_latencyMode = 0;
const int32_t g_sampleFormat = 1;
const int32_t g_frameSize = 240; // 240:g_frameSize value

static int32_t AudioRendererOnWriteDataInterrupt(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    return 0;
}

static int32_t AudioRendererInterruptEvent(OH_AudioRenderer* renderer,
    void* userData,
    OH_AudioInterrupt_ForceType type,
    OH_AudioInterrupt_Hint hint)
{
    printf("AudioRendererInterruptEvent type = %d, hint = %d\n", type, hint);
    return 0;
}

static int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    size_t readCount = fread(buffer, bufferLen, 1, g_file);
    if (!readCount) {
        g_readEnd = true;
        if (ferror(g_file)) {
            printf("Error reading myfile");
        } else if (feof(g_file)) {
            printf("EOF found");
        }
    }

    return 0;
}

static int32_t AudioRendererWriteDataWithMetadataCallback(OH_AudioRenderer *renderer,
    void *userData, void *audioData, int32_t audioDataSize, void *metadata, int32_t metadataSize)
{
    size_t readCount = fread(audioData, audioDataSize, 1, g_file);
    if (!readCount) {
        g_readEnd = true;
        if (ferror(g_file)) {
            printf("Error reading myfile");
        } else if (feof(g_file)) {
            printf("EOF found");
        }
        return 0;
    }
    readCount = fread(metadata, metadataSize, 1, g_file);
    if (!readCount) {
        g_readEnd = true;
        if (ferror(g_file)) {
            printf("Error reading myfile");
        } else if (feof(g_file)) {
            printf("EOF found");
        }
    }
    return 0;
}

static int32_t AudioCapturerOnReadData(
    OH_AudioCapturer* capturer,
    void* userData,
    void* buffer,
    int32_t bufferLen)
{
    printf("callback success\n");
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


void OHAudioStreamBuilderUnitTest::SetUpTestCase(void) { }

void OHAudioStreamBuilderUnitTest::TearDownTestCase(void) { }

void OHAudioStreamBuilderUnitTest::SetUp(void) { }

void OHAudioStreamBuilderUnitTest::TearDown(void) { }

/**
 * @tc.name   OH_AudioStreamBuilder_Create_001
 * @tc.number OH_AudioStreamBuilder_Create_001
 * @tc.desc   Test OH_AudioStreamBuilder_Create interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_Create_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_Create_002
 * @tc.number OH_AudioStreamBuilder_Create_001
 * @tc.desc   Test OH_AudioStreamBuilder_Create interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_Create_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_Destroy_001
 * @tc.number OH_AudioStreamBuilder_Destroy_001
 * @tc.desc   Test OH_AudioStreamBuilder_Destroy interface. Returns error code, if builder pointer is nullptr.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_Destroy_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;

    OH_AudioStream_Result result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_001
 * @tc.number OH_AudioStreamBuilder_SetParameter_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_48000;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_002
 * @tc.number OH_AudioStreamBuilder_SetParameter_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_44100;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_003
 * @tc.number OH_AudioStreamBuilder_SetParameter_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_88200;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_018
 * @tc.number OH_AudioStreamBuilder_SetParameter_018
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_018, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_176400;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_019
 * @tc.number OH_AudioStreamBuilder_SetParameter_019
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_019, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_192000;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_020
 * @tc.number OH_AudioStreamBuilder_SetParameter_020
 * @tc.desc   Test OH_AudioStreamBuilder_SetSamplingRate interface. Returns error code, if samplingRate is -1.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_020, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t samplingRate = SAMPLING_RATE_WRONG_NUM;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_004
 * @tc.number OH_AudioStreamBuilder_SetParameter_004
 * @tc.desc   Test OH_AudioStreamBuilder_SetChannelCount interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t channelCount = CHANNEL_COUNT_1;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_005
 * @tc.number OH_AudioStreamBuilder_SetParameter_005
 * @tc.desc   Test OH_AudioStreamBuilder_SetChannelCount interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t channelCount = CHANNEL_COUNT_16;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_006
 * @tc.number OH_AudioStreamBuilder_SetParameter_006
 * @tc.desc   Test OH_AudioStreamBuilder_SetChannelCount interface. Returns error code, if channelCount is 8.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_006, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    int32_t channelCount = CHANNEL_COUNT_18;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_007
 * @tc.number OH_AudioStreamBuilder_SetParameter_007
 * @tc.desc   Test OH_AudioStreamBuilder_SetEncodingType interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_007, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_008
 * @tc.number OH_AudioStreamBuilder_SetParameter_008
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns error code, if stream type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_008, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_009
 * @tc.number OH_AudioStreamBuilder_SetParameter_009
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_009, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_010
 * @tc.number OH_AudioStreamBuilder_SetParameter_010
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns error code, if builder type
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_010, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_011
 * @tc.number OH_AudioStreamBuilder_SetParameter_011
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererCallback interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_011, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, NULL);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_012
 * @tc.number OH_AudioStreamBuilder_SetParameter_012
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererCallback interface. Returns error code, builder type
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_012, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, NULL);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererPrivacy_001
 * @tc.number OH_AudioStreamBuilder_SetRendererPrivacy_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererPrivacy interface via illegal stream type.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererPrivacy_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PUBLIC);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererPrivacy_002
 * @tc.number OH_AudioStreamBuilder_SetRendererPrivacy_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererPrivacy interface via public privacy.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererPrivacy_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PUBLIC);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererPrivacy_003
 * @tc.number OH_AudioStreamBuilder_SetRendererPrivacy_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererPrivacy interface via private privacy.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererPrivacy_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PRIVATE);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_013
 * @tc.number OH_AudioStreamBuilder_SetParameter_013
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerInfo interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_013, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_MIC;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_014
 * @tc.number OH_AudioStreamBuilder_SetParameter_014
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerInfo interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_014, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION ;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_015
 * @tc.number OH_AudioStreamBuilder_SetParameter_015
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerInfo interface. Returns error code, if the builder type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_015, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION ;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_016
 * @tc.number OH_AudioStreamBuilder_SetParameter_016
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerCallback interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_016, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetParameter_017
 * @tc.number OH_AudioStreamBuilder_SetParameter_017
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerCallback interface. Returns error code, if the builder type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetParameter_017, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetSampleFormat_001
 * @tc.number OH_AudioStreamBuilder_SetSampleFormat_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetSampleFormat interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetSampleFormat_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_U8;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetSampleFormat_002
 * @tc.number OH_AudioStreamBuilder_SetSampleFormat_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetSampleFormat interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetSampleFormat_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S16LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetSampleFormat_003
 * @tc.number OH_AudioStreamBuilder_SetSampleFormat_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetSampleFormat interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetSampleFormat_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S24LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetSampleFormat_004
 * @tc.number OH_AudioStreamBuilder_SetSampleFormat_004
 * @tc.desc   Test OH_AudioStreamBuilder_SetSampleFormat interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetSampleFormat_004, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S32LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetSampleFormat_005
 * @tc.number OH_AudioStreamBuilder_SetSampleFormat_005
 * @tc.desc   Test OH_AudioStreamBuilder_SetSampleFormat interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetSampleFormat_005, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S32LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetLatencyMode_001
 * @tc.number OH_AudioStreamBuilder_SetLatencyMode_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetLatencyMode interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetLatencyMode_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetCapturerInfo_001
 * @tc.number OH_AudioStreamBuilder_SetCapturerInfo_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerInfo interface. Returns error code, if source type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetCapturerInfo_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_INVALID;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetCapturerInfo_002
 * @tc.number OH_AudioStreamBuilder_SetCapturerInfo_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetCapturerInfo interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetCapturerInfo_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererInfo_001
 * @tc.number OH_AudioStreamBuilder_SetRendererInfo_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns error code, if usage type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererInfo_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_UNKNOWN;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererInfo_002
 * @tc.number OH_AudioStreamBuilder_SetRendererInfo_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns error code, if content type is
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererInfo_002, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererInfo_003
 * @tc.number OH_AudioStreamBuilder_SetRendererInfo_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInfo interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererInfo_003, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetChannelLayout_001
 * @tc.number OH_AudioStreamBuilder_SetChannelLayout_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetChannelLayout interface. Returns true if result is successful.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetChannelLayout_001, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioChannelLayout channelLayout = CH_LAYOUT_UNKNOWN;
    result = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback_001
 * @tc.number OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback interface.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback_001, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_WriteDataWithMetadataCallback callback = AudioRendererWriteDataWithMetadataCallback;
    result = OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback(builder, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetInterruptMode_001
 * @tc.number OH_AudioStreamBuilder_SetRendererInterruptMode_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with nullptr builder.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetInterruptMode_001, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetInterruptMode_002
 * @tc.number OH_AudioStreamBuilder_SetRendererInterruptMode_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with share mode.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetInterruptMode_002, TestSize.Level0)
{
    // 1. create builder1 builder2
    OH_AudioStreamBuilder* builder1;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 2. set builder1 builder2 params
    OH_AudioStreamBuilder_SetSamplingRate(builder1, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder1, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder1, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder1, (OH_AudioStream_SampleFormat)g_sampleFormat);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder1, g_frameSize);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);

    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer2);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);
    result = OH_AudioRenderer_Start(audioRenderer2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);


    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);

    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);

    result = OH_AudioStreamBuilder_Destroy(builder1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetInterruptMode_003
 * @tc.number OH_AudioStreamBuilder_SetRendererInterruptMode_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with independent mode.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetInterruptMode_003, TestSize.Level0)
{
    // 1. create builder
    OH_AudioStreamBuilder* builder1;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 2. set builder params
    OH_AudioStreamBuilder_SetSamplingRate(builder1, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder1, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder1, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder1, (OH_AudioStream_SampleFormat)g_sampleFormat);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder1, g_frameSize);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);

    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer2);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);
    result = OH_AudioRenderer_Start(audioRenderer2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(2);

    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);

    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);

    result = OH_AudioStreamBuilder_Destroy(builder1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererInterruptMode_004
 * @tc.number OH_AudioStreamBuilder_SetRendererInterruptMode_004
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with independent mode and share mode.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererInterruptMode_004, TestSize.Level0)
{
    // 1. create builder1 builder2
    OH_AudioStreamBuilder* builder1;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioStreamBuilder* builder2;
    result = OH_AudioStreamBuilder_Create(&builder2, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 2. set builder1 builder2 params
    OH_AudioStreamBuilder_SetSamplingRate(builder1, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder1, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder1, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder1, (OH_AudioStream_SampleFormat)g_sampleFormat);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder1, g_frameSize);

    OH_AudioStreamBuilder_SetSamplingRate(builder2, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder2, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder2, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder2, (OH_AudioStream_SampleFormat)g_sampleFormat);
    result = OH_AudioStreamBuilder_SetRendererCallback(builder2, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder2, g_frameSize);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder2, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);

    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder2, &audioRenderer2);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);
    result = OH_AudioRenderer_Start(audioRenderer2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(2);

    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);

    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);

    result = OH_AudioStreamBuilder_Destroy(builder2);
    result = OH_AudioStreamBuilder_Destroy(builder1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererInterruptMode_005
 * @tc.number OH_AudioStreamBuilder_SetRendererInterruptMode_005
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with independent mode and share mode.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererInterruptMode_005, TestSize.Level0)
{
    // 1. create builder1
    OH_AudioStreamBuilder* builder1;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 2. set builder1 params
    OH_AudioStreamBuilder_SetSamplingRate(builder1, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder1, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder1, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder1, (OH_AudioStream_SampleFormat)g_sampleFormat);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder1, g_frameSize);

    OH_AudioRenderer_Callbacks callbacks2;
    callbacks2.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder1, callbacks2, nullptr);

    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    mode = AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT;
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    // 3. create audioRenderer1 audioRenderer2
    OH_AudioRenderer* audioRenderer1;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);

    OH_AudioRenderer* audioRenderer2;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer2);

    // 4. start
    result = OH_AudioRenderer_Start(audioRenderer1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(1);
    result = OH_AudioRenderer_Start(audioRenderer2);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    sleep(2);

    // 5. stop and release client
    OH_AudioRenderer_Stop(audioRenderer2);
    OH_AudioRenderer_Release(audioRenderer2);

    OH_AudioRenderer_Stop(audioRenderer1);
    OH_AudioRenderer_Release(audioRenderer1);

    result = OH_AudioStreamBuilder_Destroy(builder1);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetInterruptMode_006
 * @tc.number OH_AudioStreamBuilder_SetInterruptMode_006
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with invalid interrupt mode.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetInterruptMode_006, TestSize.Level0)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
    OH_AudioInterrupt_Mode mode = (OH_AudioInterrupt_Mode)(-2);
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    EXPECT_TRUE(result == AUDIOSTREAM_ERROR_INVALID_PARAM);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererWriteDataCallback_001
 * @tc.number OH_AudioStreamBuilder_SetRendererWriteDataCallback_001
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with VALID result.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererWriteDataCallback_001, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererWriteDataCallback_002
 * @tc.number OH_AudioStreamBuilder_SetRendererWriteDataCallback_002
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with INVALID result.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererWriteDataCallback_002, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererWriteDataCallback_003
 * @tc.number OH_AudioStreamBuilder_SetRendererWriteDataCallback_003
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with VALID result.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererWriteDataCallback_003, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}

/**
 * @tc.name   OH_AudioStreamBuilder_SetRendererWriteDataCallback_004
 * @tc.number OH_AudioStreamBuilder_SetRendererWriteDataCallback_004
 * @tc.desc   Test OH_AudioStreamBuilder_SetRendererWriteDataCallback interface with INVALID result.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
HWTEST(OHAudioStreamBuilderUnitTest, OH_AudioStreamBuilder_SetRendererWriteDataCallback_004, TestSize.Level0)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    EXPECT_EQ(result, AUDIOSTREAM_ERROR_INVALID_PARAM);

    result = OH_AudioStreamBuilder_Destroy(builder);
    EXPECT_EQ(result, AUDIOSTREAM_SUCCESS);
}
} // namespace AudioStandard
} // namespace OHOS
