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

#include "napi/native_api.h"
#include "include/AudioSuiteBaseTest.h"
#include <cstdio>
#include <cstdlib>
#include <string>
#include <set>
#include <thread>

void *g_userData = nullptr;
int32_t g_samplingRate = 48000;
int32_t g_channelCount = 2;
int32_t g_bitsPerSample = 16;
int32_t g_frameSize = 2 * g_samplingRate * g_channelCount / 1000 * g_bitsPerSample / 8;
int32_t g_writeSize = g_frameSize;
const int32_t NUM_ONE = 1;
const int32_t NUM_TWO = 2;
const int32_t NUM_THREE = 3;
const int32_t NUM_FOUR = 4;
const int32_t NUM_FIVE = 5;
const int32_t NUM_SIX = 6;
const int32_t NUM_TEN = 10;
const int32_t NUM_ELEVEN = 11;
const int32_t REQUEST_FRAME_SIZE = 4096;
float g_speedMin = 0.5;
float g_speedMax = 10.0;
float g_pitchMin = 0.1;
float g_pitchMax = 5.0;
float g_changeOptionMin = 0.3;
float g_changeOptionMax = 3.0;
const OH_AudioFormat audioFormatInput = {.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                         .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                         .channelCount = NUM_TWO,
                                         .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                         .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE};
const OH_AudioFormat audioFormatOutput = {.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
                                          .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                                          .channelCount = NUM_TWO,
                                          .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                                          .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE};

std::vector<OH_AudioNode_Type> audioNodeTypeTest = {
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST),
    static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST),
};

std::vector<OH_Audio_SampleFormat> audioSampleFormatTest = {
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_U8_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S16LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S24LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S32LE_TEST),
    static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_F32LE_TEST),
};

std::vector<OH_Audio_SampleRate> audioSampleRateTest = {
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_8000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_11025_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_12000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_16000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_22050_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_24000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_32000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_44100_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_48000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_64000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_88200_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_96000_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_176400_TEST),
    static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_192000_TEST),
};

std::vector<OH_AudioSuite_PureVoiceChangeType> pureVoiceChangeTypeTest = {
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CUTE_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_FEMALE_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_MALE_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_MONSTER_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_ROBOTS_TEST),
    static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_SEASONED_TEST),
};

std::vector<OH_AudioSuite_GeneralVoiceChangeType> generalVoiceChangeTypeTest = {
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CYBERPUNK_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_FEMALE_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MALE_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MIX_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MONSTER_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_SEASONED_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_SYNTH_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_TRILL_TEST),
    static_cast<OH_AudioSuite_GeneralVoiceChangeType>(GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_WAR_TEST),
};
std::vector<char> audioData(g_frameSize);
bool g_finishedFlag = false;
OH_EqualizerFrequencyBandGains frequencyBandGains[]{
    OH_EQUALIZER_PARAM_DEFAULT,   OH_EQUALIZER_PARAM_BALLADS,     OH_EQUALIZER_PARAM_CHINESE_STYLE,
    OH_EQUALIZER_PARAM_CLASSICAL, OH_EQUALIZER_PARAM_DANCE_MUSIC, OH_EQUALIZER_PARAM_JAZZ,
    OH_EQUALIZER_PARAM_POP,       OH_EQUALIZER_PARAM_RB,          OH_EQUALIZER_PARAM_ROCK};
std::vector<OH_VoiceBeautifierType> voiceBeautifierTypeTest = {
    static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CLEAR_TEST),
    static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_THEATRE_TEST),
    static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CD_TEST),
    static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO_TEST),
};
static int32_t MyOnWriteData(OH_AudioNode *audioNode, void *userData, void *audioData, int32_t audioDataSize,
                             bool *finished)
{
    std::fill(static_cast<char *>(audioData), static_cast<char *>(audioData) + audioDataSize, 1);
    *finished = true;
    return 1;
}
static napi_value AudioSuiteEngineCreateTest_0001(napi_env env, napi_callback_info info)
{
    OH_AudioSuite_Result result = CreateAudioSuiteEngine();

    napi_value res;
    if (result == OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    }

    return res;
}

static napi_value AudioSuiteEngineCreateTest_0002(napi_env env, napi_callback_info info)
{
    LOG("OH_AudioSuiteEngine_Create ");

    napi_value res;
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);

    return res;
}

static napi_value AudioSuiteEngineCreateTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result result1 = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    if (result1 != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0003 fail, result is: %{public}d", result1);
        return res;
    }
    OH_AudioSuite_Result result2 = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineCreateTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Create(nullptr);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineCreateTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineCreateTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    OH_AudioSuite_Result result2 = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0001 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(nullptr);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineDestroyTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineDestroyTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetNodeTypeTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *audioNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&audioNodeBuilder);
    for (const auto setNodeType : audioNodeTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetNodeType(audioNodeBuilder, setNodeType);
        if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteNodeBuilderSetNodeTypeTest_0001 fail, result is: %{public}d", result);
        } else {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(audioNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetNodeTypeTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *audioNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&audioNodeBuilder);
    for (const auto setNodeType : audioNodeTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetNodeType(nullptr, setNodeType);
        if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteNodeBuilderSetNodeTypeTest_0002 fail, result is: %{public}d", result);
        } else {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(audioNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatInput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO,
                .channelCount = NUM_ONE,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0001 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatInput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                .channelCount = NUM_TWO,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0002 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(nullptr, audioFormatInput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0003 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;
    const OH_AudioFormat audioFormatInput = {
        .samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
        .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
        .channelCount = NUM_THREE,
        .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
        .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE
    };
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_UNSUPPORTED_FORMAT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0004 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatOutput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_MONO,
                .channelCount = NUM_ONE,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0005 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const std::vector<OH_Audio_SampleFormat>& sampleFormats = audioSampleFormatTest;
    const std::vector<OH_Audio_SampleRate>& sampleRates = audioSampleRateTest;
    for (const auto &format : sampleFormats) {
        for (const auto &rate : sampleRates) {
            OH_AudioFormat audioFormatOutput = {
                .samplingRate = rate,
                .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
                .channelCount = NUM_TWO,
                .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
                .sampleFormat = format
            };
            OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteNodeBuilderSetFormatTest_0006 fail, result is: %{public}d", result);
            } else {
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
            }
        }
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(nullptr, audioFormatOutput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0007 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteNodeBuilderSetFormatTest_0008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&outputNodeBuilder);
    const OH_AudioFormat audioFormatOutput = {
        .samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000,
        .channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO,
        .channelCount = NUM_ONE,
        .encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW,
        .sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE
    };
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetFormat(outputNodeBuilder, audioFormatOutput);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_UNSUPPORTED_FORMAT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilderSetFormatTest_0008 fail, result is: %{public}d", result);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(outputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value InputNodeRequestDataCallbackTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(inputNodeBuilder, static_cast
        <OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    OH_AudioSuite_Result result =
        OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputNodeBuilder, MyOnWriteData, g_userData);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("InputNodeRequestDataCallbackTest_0001 fail, result is: %{public}d", result);
        return res;
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value InputNodeRequestDataCallbackTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputNodeBuilder = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&inputNodeBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(inputNodeBuilder, static_cast
        <OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputNodeBuilder, audioFormatInput);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_SetRequestDataCallback(
        inputNodeBuilder, nullptr, g_userData);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("InputNodeRequestDataCallbackTest_0002 fail, result is: %{public}d", result);
        return res;
    }
        
    OH_AudioSuiteNodeBuilder_Destroy(inputNodeBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static int32_t IsNodeTypeSupported(OH_AudioNode_Type type)
{
    bool isSupported = false;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_IsNodeTypeSupported(type, &isSupported);
    if (result != AUDIOSUITE_SUCCESS) {
        LOG("IsNodeTypeSupported failed, type is: %{public}d, result is: %{public}d", type, result);
    }
    LOG("IsNodeTypeSupported, type is: %{public}d, isSupported is: %{public}d", type, isSupported);
    return isSupported;
}

static napi_value AudioSuiteEngineBypassEffectNodeTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_BypassEffectNode(audioNode, true);
    
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineBypassEffectNodeTest_0001 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineBypassEffectNodeTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_BypassEffectNode(audioNode, false);
    
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineBypassEffectNodeTest_0002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineBypassEffectNodeTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_BypassEffectNode(nullptr, true);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineBypassEffectNodeTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineBypassEffectNodeTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        builder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_BypassEffectNode(audioNode, true);
    
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineBypassEffectNodeTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineBypassEffectNodeTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_BypassEffectNode(audioNode, true);
    
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineBypassEffectNodeTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0001 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(nullptr, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, nullptr);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(nullptr, nullptr);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(outNode, effectNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_CONNECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *inBuilder = nullptr;
    OH_AudioNode *inNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&inBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inBuilder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inBuilder, &inNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, inNode);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(inNode);
    OH_AudioSuiteNodeBuilder_Destroy(inBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_CONNECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0006 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, effectNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_CONNECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0007 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectSepBuilder = nullptr;
    OH_AudioNode *effectSepNode = nullptr;
    OH_AudioNodeBuilder *effectEeBuilder = nullptr;
    OH_AudioNode *effectEeNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioNode_Type type1 =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    bool isSupported1 = IsNodeTypeSupported(type1);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectSepBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectSepBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectSepBuilder, &effectSepNode);
    OH_AudioSuiteNodeBuilder_Create(&effectEeBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectEeBuilder, type1);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectEeBuilder, &effectEeNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectSepNode, effectEeNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectEeNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectEeBuilder);
    OH_AudioSuiteEngine_DestroyNode(effectSepNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectSepBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && isSupported1 && result != AUDIOSUITE_ERROR_UNSUPPORTED_CONNECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0008 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0009(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioOutPipeline = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioOutPipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioOutPipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_DestroyPipeline(audioOutPipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_CONNECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0009 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0010(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_ConnectNodes(effectNode, outNode);
    
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0010 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0011(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_ConnectNodes(effectNode, outNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0011 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0012(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(nullptr, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0012 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0013(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, nullptr);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0013 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0014(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(nullptr, nullptr);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0014 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0015(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(outNode, effectNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0015 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0016(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *inBuilder = nullptr;
    OH_AudioNode *inNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&inBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inBuilder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inBuilder, &inNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, inNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(inNode);
    OH_AudioSuiteNodeBuilder_Destroy(inBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0016 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0017(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, effectNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0017 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0018(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioOutPipeline = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioOutPipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioOutPipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, outNode);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_DestroyPipeline(audioOutPipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0018 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineConnectNodesTest_0019(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DisconnectNodes(effectNode, outNode);
    
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineConnectNodesTest_0019 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    for (size_t i = 0; i < sizeof(frequencyBandGains) / sizeof(frequencyBandGains[0]); i++) {
        OH_AudioSuite_Result result =
            OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, frequencyBandGains[i]);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(effectNode);
            OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_EqualizerFrequencyBandGains gains = {11, 1, 3, 0, 4, 9, -5, 9, 5, -7};
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, gains);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_EqualizerFrequencyBandGains gains = {-11, 1, 3, 0, 4, 9, -5, 9, 5, -7};
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, gains);
    
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result =
        OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(nullptr, OH_EQUALIZER_PARAM_BALLADS);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004 fail, result is: %{public}d", result);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result =
        OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, OH_EQUALIZER_PARAM_DEFAULT);

    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result =
        OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, OH_EQUALIZER_PARAM_DEFAULT);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    for (size_t i = 0; i < sizeof(frequencyBandGains) / sizeof(frequencyBandGains[0]); i++) {
        OH_AudioSuiteEngine_SetEqualizerFrequencyBandGains(effectNode, frequencyBandGains[i]);
        OH_AudioSuite_Result result =
            OH_AudioSuiteEngine_GetEqualizerFrequencyBandGains(effectNode, &frequencyBandGains[i]);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(effectNode);
            OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEqualizerFrequencyBandGains(nullptr, &frequencyBandGains[0]);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002 fail, result is: %{public}d", result);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEqualizerFrequencyBandGains(effectNode, nullptr);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result =
        OH_AudioSuiteEngine_GetEqualizerFrequencyBandGains(effectNode, &frequencyBandGains[0]);

    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result =
        OH_AudioSuiteEngine_GetEqualizerFrequencyBandGains(effectNode, &frequencyBandGains[0]);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetVoiceBeautifierTypeTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    for (const auto &typeTest : voiceBeautifierTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetVoiceBeautifierType(effectNode, typeTest);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(effectNode);
            OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineSetVoiceBeautifierTypeTest_0001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetVoiceBeautifierTypeTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetVoiceBeautifierType(
        nullptr,
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_THEATRE_TEST));
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetVoiceBeautifierTypeTest_0002 fail, result is: %{public}d", result);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetVoiceBeautifierTypeTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetVoiceBeautifierType(
        effectNode,
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CD_TEST));
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetVoiceBeautifierTypeTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetVoiceBeautifierTypeTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetVoiceBeautifierType(
        effectNode, static_cast<OH_VoiceBeautifierType>(
                        AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO_TEST));

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetVoiceBeautifierTypeTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetVoiceBeautifierTypeTest_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    AudioSuiteVoiceBeautifierTypeTest beautifierType;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    for (const auto &typeTest : voiceBeautifierTypeTest) {
        OH_AudioSuiteEngine_SetVoiceBeautifierType(effectNode, typeTest);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetVoiceBeautifierType(
            effectNode, (OH_VoiceBeautifierType *)&beautifierType);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(effectNode);
            OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineGetVoiceBeautifierTypeTest_0001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetVoiceBeautifierTypeTest_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_VoiceBeautifierType beautifierType =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CLEAR_TEST);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetVoiceBeautifierType(nullptr, &beautifierType);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetVoiceBeautifierTypeTest_0002 fail, result is: %{public}d", result);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetVoiceBeautifierTypeTest_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetVoiceBeautifierType(effectNode, nullptr);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetVoiceBeautifierTypeTest_0003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetVoiceBeautifierTypeTest_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    OH_VoiceBeautifierType beautifierType =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CLEAR_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);
    OH_AudioSuiteEngine_DestroyNode(effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetVoiceBeautifierType(effectNode, &beautifierType);

    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetVoiceBeautifierTypeTest_0004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetVoiceBeautifierTypeTest_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    OH_VoiceBeautifierType beautifierType =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CLEAR_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(effectBuilder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetVoiceBeautifierType(effectNode, &beautifierType);

    OH_AudioSuiteEngine_DestroyNode(effectNode);
    OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetVoiceBeautifierTypeTest_0005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Create(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    if (result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Create FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Create_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Create(nullptr);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Create_001 FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Destory(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Destroy(builder);
    if (result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Destory FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Destory_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Destroy(nullptr);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Destory_001 FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Reset(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Reset(builder);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    if (result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Reset FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteNodeBuilder_Reset_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteNodeBuilder_Reset(nullptr);
    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteNodeBuilder_Reset_001 FAILED,result is:%{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

const std::set<OH_EnvironmentType> Environment_Type = {ENVIRONMENT_TYPE_BROADCAST, ENVIRONMENT_TYPE_EARPIECE,
                                                       ENVIRONMENT_TYPE_GRAMOPHONE, ENVIRONMENT_TYPE_UNDERWATER};
const std::set<OH_SoundFieldType> SoundField_Type = {SOUND_FIELD_FRONT_FACING, SOUND_FIELD_GRAND, SOUND_FIELD_NEAR,
                                                     SOUND_FIELD_WIDE};

static napi_value AudioSuiteEngineSetSoundFieldType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    for (auto soundFieldType : SoundField_Type) {
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(audioNode);
            OH_AudioSuiteNodeBuilder_Destroy(builder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineSetSoundFieldType_001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetSoundFieldType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetSoundFieldType_002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetSoundFieldType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);
    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetSoundFieldType_003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineSetSoundFieldType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetSoundFieldType_004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetSoundFieldType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_SoundFieldType sound;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    for (auto soundFieldType : SoundField_Type) {
        OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSoundFieldType(audioNode, &sound);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(audioNode);
            OH_AudioSuiteNodeBuilder_Destroy(builder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngineGetSoundFieldType_001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetSoundFieldType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_SoundFieldType sound;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSoundFieldType(audioNode, &sound);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetSoundFieldType_002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetSoundFieldType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_SoundFieldType sound;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSoundFieldType(audioNode, &sound);
    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineGetSoundFieldType_003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngineGetSoundFieldType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_SoundFieldType sound;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    OH_SoundFieldType soundFieldType = SOUND_FIELD_FRONT_FACING;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_SetSoundFieldType(audioNode, soundFieldType);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSoundFieldType(audioNode, &sound);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngineSetSoundFieldType_004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetEnvironmentType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    for (auto environmentType : Environment_Type) {
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(audioNode);
            OH_AudioSuiteNodeBuilder_Destroy(builder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_SetEnvironmentType_001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetEnvironmentType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_SetEnvironmentType_002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetEnvironmentType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);
    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_SetEnvironmentType_003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetEnvironmentType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_SetEnvironmentType_004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetEnvironmentType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_EnvironmentType environment;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    for (auto environmentType : Environment_Type) {
        OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEnvironmentType(audioNode, &environment);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            OH_AudioSuiteEngine_DestroyNode(audioNode);
            OH_AudioSuiteNodeBuilder_Destroy(builder);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_GetEnvironmentType_001 fail, result is: %{public}d", result);
            return res;
        }
    }
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetEnvironmentType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_EnvironmentType environment;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEnvironmentType(audioNode, &environment);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_GetEnvironmentType_002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetEnvironmentType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_EnvironmentType environment;

    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEnvironmentType(audioNode, &environment);
    if (isSupported && result != AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_GetEnvironmentType_003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetEnvironmentType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_EnvironmentType environment;
    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    OH_EnvironmentType environmentType = ENVIRONMENT_TYPE_BROADCAST;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_SetEnvironmentType(audioNode, environmentType);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetEnvironmentType(audioNode, &environment);

    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_GetEnvironmentType_004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

// 谢世奇--start
static napi_value AudioSuiteEngine_GetNodeBypassStatus_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, &bypassStatus);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool bypassStatus = true;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, &bypassStatus);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool bypassStatus = true;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, &bypassStatus);

    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool *bypassStatus = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, bypassStatus);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool *bypassStatus = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, bypassStatus);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool bypassStatus = true;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, &bypassStatus);

    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetNodeBypassStatus_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    bool bypassStatus = true;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        builder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatBuilder);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetNodeBypassStatus(audioNode, &bypassStatus);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetNodeBypassStatus_007 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetNodeBypassStatus_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        builder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatBuilder);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioFormat *audioFormatEngine = new OH_AudioFormat();
    audioFormatEngine->samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatEngine->channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatEngine->sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatEngine->encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatEngine->channelCount = NUM_TWO;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(audioNode, audioFormatEngine);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        builder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatBuilder);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(audioNode, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioFormat *audioFormatEngine = new OH_AudioFormat();
    audioFormatEngine->samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatEngine->channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatEngine->sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatEngine->encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatEngine->channelCount = NUM_TWO;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(nullptr, audioFormatEngine);

    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        builder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatBuilder);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioFormat *audioFormatEngine = new OH_AudioFormat();
    audioFormatEngine->samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatEngine->channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatEngine->sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatEngine->encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatEngine->channelCount = NUM_TWO;
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(audioNode, audioFormatEngine);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioFormat *audioFormatEngine = new OH_AudioFormat();
    audioFormatEngine->samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatEngine->channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatEngine->sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatEngine->encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatEngine->channelCount = NUM_TWO;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(audioNode, audioFormatEngine);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_setAudioFormat_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputAudioNode = nullptr;
    OH_AudioNodeBuilder *outputBuilder = nullptr;
    OH_AudioNode *outputAudioNode = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatOutput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputAudioNode);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputAudioNode);
    OH_AudioSuiteEngine_ConnectNodes(inputAudioNode, outputAudioNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    OH_AudioFormat *audioFormatEngine = new OH_AudioFormat();
    audioFormatEngine->samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatEngine->channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatEngine->sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatEngine->encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatEngine->channelCount = NUM_TWO;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetAudioFormat(inputAudioNode, audioFormatEngine);

    OH_AudioSuiteNodeBuilder_Destroy(inputBuilder);
    OH_AudioSuiteNodeBuilder_Destroy(outputBuilder);
    OH_AudioSuiteEngine_DestroyNode(inputAudioNode);
    OH_AudioSuiteEngine_DestroyNode(outputAudioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_setAudioFormat_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_setAudioFormat_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_DestroyNode_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_DestroyNode_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyNode_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_DestroyNode_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_DestroyNode_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyNode_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_DestroyNode_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_DestroyNode_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyNode_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_DestroyNode_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputAudioNode = nullptr;
    OH_AudioNodeBuilder *outputBuilder = nullptr;
    OH_AudioNode *outputAudioNode = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatOutput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputAudioNode);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputAudioNode);
    OH_AudioSuiteEngine_ConnectNodes(inputAudioNode, outputAudioNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    OH_AudioSuiteNodeBuilder_Destroy(inputBuilder);
    OH_AudioSuiteNodeBuilder_Destroy(outputBuilder);
    OH_AudioSuite_Result destroyInputAudioNodeResult = OH_AudioSuiteEngine_DestroyNode(inputAudioNode);
    OH_AudioSuite_Result destroyOutputAudioNodeResult = OH_AudioSuiteEngine_DestroyNode(outputAudioNode);
    OH_AudioSuiteEngine_DestroyNode(outputAudioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (destroyInputAudioNodeResult == AUDIOSUITE_ERROR_INVALID_STATE and
        destroyOutputAudioNodeResult == AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_DestroyNode_004 success, destroyInputAudioNodeResult is: "
            "%{public}d,destroyOutputAudioNodeResult is: %{public}d",
            destroyInputAudioNodeResult, destroyOutputAudioNodeResult);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyNode_004 fail, destroyInputAudioNodeResult is: "
        "%{public}d,destroyOutputAudioNodeResult is: %{public}d",
        destroyInputAudioNodeResult, destroyOutputAudioNodeResult);
    return res;
}

static napi_value AudioSuiteEngine_DestroyNode_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_DestroyNode_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyNode_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_001 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_001 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_002 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_002 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_003 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_003 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_004 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_004 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_005 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_005 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(nullptr, nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_CreateNode_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_CreateNode_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_CreateNode_007 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_CreateNode_007 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builders[6] = {nullptr};
    OH_AudioNode *audioNodes[6] = {nullptr};
    OH_AudioSuite_Result result[6];
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_REALTIME_MODE);
    for (int i = 0; i < NUM_SIX; ++i) {
        builders[i] = nullptr;
        OH_AudioSuiteNodeBuilder_Create(&builders[i]);
        OH_AudioSuiteNodeBuilder_SetNodeType(builders[i], type);
        audioNodes[i] = nullptr;
        result[i] = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builders[i], &audioNodes[i]);
    }
    if (!isSupported ||
        (result[NUM_FOUR] == AUDIOSUITE_SUCCESS && result[NUM_FIVE] == AUDIOSUITE_ERROR_CREATED_EXCEED_SYSTEM_LIMITS)) {
        LOG("CreateNode_008 success, createNodeResult6 is:%{public}d", result[NUM_FIVE]);
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        for (int i = 0; i < NUM_SIX; ++i) {
            if (builders[i])
                OH_AudioSuiteNodeBuilder_Destroy(builders[i]);
            if (audioNodes[i])
                OH_AudioSuiteEngine_DestroyNode(audioNodes[i]);
        }
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
    LOG("CreateNode_008 fail, createNodeResult5 is:%{public}d, createNodeResult6 is:%{public}d", result[NUM_FOUR],
        result[NUM_FIVE]);
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    for (int i = 0; i < NUM_SIX; ++i) {
        if (builders[i])
            OH_AudioSuiteNodeBuilder_Destroy(builders[i]);
        if (audioNodes[i])
            OH_AudioSuiteEngine_DestroyNode(audioNodes[i]);
    }
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_009(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputBuilder = nullptr;
    OH_AudioNode *outputAudioNode = nullptr;
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(outputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputAudioNode);
    OH_AudioSuiteNodeBuilder_Destroy(outputBuilder);
    OH_AudioSuiteEngine_DestroyNode(outputAudioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_setAudioFormat_009 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_setAudioFormat_009 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_010(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioFormat audioFormatBuilder;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_setAudioFormat_010 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_setAudioFormat_010 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_011(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputAudioNode = nullptr;
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputAudioNode);

    OH_AudioSuiteNodeBuilder_Destroy(inputBuilder);
    OH_AudioSuiteEngine_DestroyNode(inputAudioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_REQUIRED_PARAMETERS_MISSING) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_setAudioFormat_011 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_setAudioFormat_011 success, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_CreateNode_012(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outputBuilder = nullptr;
    OH_AudioNode *outputAudioNode = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputAudioNode);
    OH_AudioSuiteNodeBuilder_Destroy(outputBuilder);
    OH_AudioSuiteEngine_DestroyNode(outputAudioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (result != AUDIOSUITE_ERROR_REQUIRED_PARAMETERS_MISSING) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_setAudioFormat_012 fail, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    LOG("AudioSuiteEngine_setAudioFormat_012 success, result is: %{public}d", result);
    return res;
}
// 谢世奇--end

static napi_value AudioSuiteEngine_GetPipelineState001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_PipelineState pipelineState;
    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuite_Result res = OH_AudioSuiteEngine_GetPipelineState(audioSuitePipeline, &pipelineState);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (res != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_GetPipelineState001 fail, result is: %{public}d", res);
        return result;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_GetPipelineState002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuite_Result res = OH_AudioSuiteEngine_GetPipelineState(audioSuitePipeline, nullptr);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (res != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_GetPipelineState002 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_GetPipelineState003(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_PipelineState pipelineState;
    OH_AudioSuite_PipelineWorkMode workMode = AUDIOSUITE_PIPELINE_EDIT_MODE;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, workMode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    OH_AudioSuite_Result res = OH_AudioSuiteEngine_GetPipelineState(audioSuitePipeline, &pipelineState);
    if (res != AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_GetPipelineState003 fail, result is: %{public}d", res);
        return result;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_RenderFrame001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);

    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);

    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

    OH_AudioSuiteEngine_ConnectNodes(inputNode, outNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    OH_AudioSuite_Result res =
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize,
                                        &g_finishedFlag);

    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (res != AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_RenderFrame001 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_RenderFrame002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);

    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);

    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

    OH_AudioSuiteEngine_ConnectNodes(inputNode, outNode);

    OH_AudioSuite_Result res =
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize,
                                        &g_finishedFlag);

    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (res != AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_RenderFrame002 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_RenderFrame003(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);

    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);

    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

    OH_AudioSuiteEngine_ConnectNodes(inputNode, outNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    OH_AudioSuite_Result res =
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), 0, &g_writeSize, &g_finishedFlag);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (res != AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_RenderFrame003 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_RenderFrame004(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);

    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);

    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

    OH_AudioSuiteEngine_ConnectNodes(inputNode, outNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);

    OH_AudioSuite_Result res =
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize,
                                        &g_finishedFlag);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (res != AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_RenderFrame004 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_RenderFrame005(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;

    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

    OH_AudioSuiteNodeBuilder_Create(&outBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);

    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

    OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);

    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

    OH_AudioSuiteEngine_ConnectNodes(inputNode, outNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);

    do {
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize,
                                        &g_finishedFlag);
    } while (!g_finishedFlag);

    OH_AudioSuite_Result res =
        OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize,
                                        &g_finishedFlag);
    OH_AudioSuiteEngine_DestroyNode(outNode);
    OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (res != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioSuiteEngine_RenderFrame005 fail, result is: %{public}d", res);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

class AudioSuiteRAII {
public:
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *outBuilder = nullptr;
    OH_AudioNode *outNode = nullptr;
    OH_AudioNodeBuilder *inputBuilder = nullptr;
    OH_AudioNode *inputNode = nullptr;
    OH_AudioNodeBuilder *effectBuilder = nullptr;
    OH_AudioNode *effectNode = nullptr;

    AudioSuiteRAII()
    {
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, AUDIOSUITE_PIPELINE_EDIT_MODE);

        OH_AudioSuiteNodeBuilder_Create(&outBuilder);
        OH_AudioSuiteNodeBuilder_SetNodeType(
            outBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
        OH_AudioSuiteNodeBuilder_SetFormat(outBuilder, audioFormatOutput);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outBuilder, &outNode);

        OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
        OH_AudioSuiteNodeBuilder_SetNodeType(
            inputBuilder, static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
        OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatInput);
        OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);

        OH_AudioSuiteNodeBuilder_Create(&effectBuilder);
        OH_AudioSuiteNodeBuilder_SetNodeType(
            effectBuilder,
            static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST));
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, effectBuilder, &effectNode);

        OH_AudioSuiteEngine_ConnectNodes(inputNode, effectNode);
        OH_AudioSuiteEngine_ConnectNodes(effectNode, outNode);
        OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    }
    ~AudioSuiteRAII()
    {
        OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_DestroyNode(effectNode);
        OH_AudioSuiteNodeBuilder_Destroy(effectBuilder);
        OH_AudioSuiteEngine_DestroyNode(inputNode);
        OH_AudioSuiteNodeBuilder_Destroy(inputBuilder);
        OH_AudioSuiteEngine_DestroyNode(outNode);
        OH_AudioSuiteNodeBuilder_Destroy(outBuilder);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    }
};

static napi_value OH_AudioSuiteEngine_MultiRenderFrame_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    int bufferSize = 4 * 1024;
    int responseSize = 0;

    std::vector<std::vector<uint8_t>> audioData(NUM_TWO, std::vector<uint8_t>(bufferSize));
    void **audioDataPtr = new void *[2];
    for (int i = 0; i < NUM_TWO; ++i) {
        audioDataPtr[i] = audioData[i].data();
    }

    OH_AudioDataArray *audioDataArray = new OH_AudioDataArray();
    audioDataArray->audioDataArray = audioDataPtr;
    audioDataArray->arraySize = NUM_TWO;
    audioDataArray->requestFrameSize = REQUEST_FRAME_SIZE;
    bool isSupported = IsNodeTypeSupported(EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION);
    AudioSuiteRAII audioSuite;
    do {
        OH_AudioSuite_Result res = OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray,
                                                                        &responseSize, &g_finishedFlag);
        if (isSupported && res != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
            LOG("AudioSuiteEngine_MultiRenderFrame001 fail, result is: %{public}d", res);
            return result;
        }
    } while (!g_finishedFlag);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_MultiRenderFrame_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    int responseSize = 0;

    AudioSuiteRAII audioSuite;
    do {
        OH_AudioSuite_Result res = OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, nullptr,
                                                                        &responseSize, &g_finishedFlag);
        if (res != AUDIOSUITE_ERROR_INVALID_PARAM) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
            LOG("OH_AudioSuiteEngine_MultiRenderFrame_002 fail, result is: %{public}d", res);
            return result;
        }
    } while (!g_finishedFlag);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_MultiRenderFrame_003(napi_env env, napi_callback_info info)
{
    napi_value result;
    int bufferSize = 4 * 1024;
    int responseSize = 0;

    std::vector<std::vector<uint8_t>> audioData(NUM_TWO, std::vector<uint8_t>(bufferSize));
    void **audioDataPtr = new void *[2];
    for (int i = 0; i < NUM_TWO; ++i) {
        audioDataPtr[i] = audioData[i].data();
    }

    OH_AudioDataArray *audioDataArray = new OH_AudioDataArray();
    audioDataArray->audioDataArray = audioDataPtr;
    audioDataArray->arraySize = NUM_TWO;
    audioDataArray->requestFrameSize = REQUEST_FRAME_SIZE;

    AudioSuiteRAII audioSuite;
    OH_AudioSuiteEngine_DestroyPipeline(audioSuite.audioSuitePipeline);
    OH_AudioSuite_Result res = OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray,
                                                                    &responseSize, &g_finishedFlag);
    if (res != AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_MultiRenderFrame_003 fail, result is: %{public}d", res);
        return result;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_MultiRenderFrame_004(napi_env env, napi_callback_info info)
{
    napi_value result;
    int bufferSize = 4 * 1024;
    int responseSize = 0;

    std::vector<std::vector<uint8_t>> audioData(NUM_TWO, std::vector<uint8_t>(bufferSize));
    void **audioDataPtr = new void *[2];
    for (int i = 0; i < NUM_TWO; ++i) {
        audioDataPtr[i] = audioData[i].data();
    }

    OH_AudioDataArray *audioDataArray = new OH_AudioDataArray();
    audioDataArray->audioDataArray = audioDataPtr;
    audioDataArray->arraySize = NUM_TWO;
    audioDataArray->requestFrameSize = REQUEST_FRAME_SIZE;

    AudioSuiteRAII audioSuite;
    do {
        OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray, &responseSize,
                                             &g_finishedFlag);
    } while (!g_finishedFlag);
    OH_AudioSuiteEngine_StopPipeline(audioSuite.audioSuitePipeline);
    OH_AudioSuite_Result res = OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray,
                                                                    &responseSize, &g_finishedFlag);
    if (res != AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_MultiRenderFrame_004 fail, result is: %{public}d", res);
        return result;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_MultiRenderFrame_005(napi_env env, napi_callback_info info)
{
    napi_value result;
    int bufferSize = 4 * 1024;
    int responseSize = 0;

    std::vector<std::vector<uint8_t>> audioData(NUM_TWO, std::vector<uint8_t>(bufferSize));
    void **audioDataPtr = new void *[2];
    for (int i = 0; i < NUM_TWO; ++i) {
        audioDataPtr[i] = audioData[i].data();
    }

    OH_AudioDataArray *audioDataArray = new OH_AudioDataArray();
    audioDataArray->audioDataArray = audioDataPtr;
    audioDataArray->arraySize = NUM_TWO;
    audioDataArray->requestFrameSize = REQUEST_FRAME_SIZE;
    bool isSupported = IsNodeTypeSupported(EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION);
    AudioSuiteRAII audioSuite;
    do {
        OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray, &responseSize,
                                             &g_finishedFlag);
    } while (!g_finishedFlag);
    OH_AudioSuite_Result res = OH_AudioSuiteEngine_MultiRenderFrame(audioSuite.audioSuitePipeline, audioDataArray,
                                                                    &responseSize, &g_finishedFlag);
    if (isSupported && res != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_MultiRenderFrame_005 fail, result is: %{public}d", res);
        return result;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_CreatePipeline_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr ;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result == OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    } else {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_CreatePipeline_0001 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
}

static napi_value AudioSuiteEngine_CreatePipeline_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result == OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    return res;
    } else {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_CreatePipeline_0002 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    return res;
    }
}

static napi_value AudioSuiteEngine_CreatePipeline_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, nullptr,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result == OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    } else {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_CreatePipeline_0003 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
}

static napi_value AudioSuiteEngine_CreatePipeline_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result == OH_AudioSuite_Result::AUDIOSUITE_ERROR_ENGINE_NOT_EXIST) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    } else {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_CreatePipeline_0004 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
}

static napi_value AudioSuiteEngine_CreatePipeline_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline[11];
    OH_AudioSuite_Result result;
    for (int i = 0; i < NUM_ELEVEN; ++i) {
        audioSuitePipeline[i] = nullptr;
        result = OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline[i],
            static_cast<OH_AudioSuite_PipelineWorkMode>(
                AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        if (i < NUM_TEN) {
            if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
                printf("FAILED:第%d个管线创建失败, result: %d", i + 1, static_cast<int>(result));
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteEngine_CreatePipeline_0005 fail, result is: %{public}d", result);
                OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
                return res;
            }
            printf("SUCCESS:第%d个管线创建成功",  i + 1);
        } else {
            if (result == OH_AudioSuite_Result::AUDIOSUITE_ERROR_CREATED_EXCEED_SYSTEM_LIMITS) {
                printf("SUCCESS:第%d个管线不应该创建成功, result: %d",  i + 1, result);
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
                OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
                return res;
            } else {
                printf("FAILED: 第 %d 个管线不应该创建成功, 但创建成功了", i + 1);
                napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
                LOG("AudioSuiteEngine_CreatePipeline_0005 fail, result is: %{public}d", result);
                OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
                return res;
            }
        }
    }
    return res;
}

static napi_value AudioSuiteEngine_DestroyPipeline_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result != AUDIOSUITE_SUCCESS) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
    OH_AudioSuite_Result destroypipelineresult = OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    if (destroypipelineresult != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_DestroyPipeline_0001 fail, result is: %{public}d", destroypipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_DestroyPipeline_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result != AUDIOSUITE_SUCCESS) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyPipeline_0002 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
    OH_AudioSuite_Result destroypipelineresult = OH_AudioSuiteEngine_DestroyPipeline(nullptr);
    if (destroypipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_DestroyPipeline_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_DestroyPipeline_0003 fail, result is: %{public}d", result);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    return res;
    }
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuite_Result destroypipelineresult = OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    if (destroypipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_DestroyPipeline_0003 fail, result is: %{public}d", destroypipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_DestroyPipeline_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuite_Result destroypipelineresult = OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    if (destroypipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_DestroyPipeline_0004 fail, result is: %{public}d", destroypipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0001 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(nullptr);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0002 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0003 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0004 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0005 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StartPipeline_0006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(outputNode, inputNode);
    OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    if (startpipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StartPipeline_0006 fail, result is: %{public}d", startpipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StopPipeline_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuite_Result stoppipelineresult = OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
    if (stoppipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StopPipeline_0001 fail, result is: %{public}d", stoppipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StopPipeline_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result stoppipelineresult = OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
    if (stoppipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StopPipeline_0002 fail, result is: %{public}d", stoppipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}


static napi_value AudioSuiteEngine_StopPipeline_0003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
    OH_AudioSuite_Result stoppipelineresult = OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
    if (stoppipelineresult != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_STATE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StopPipeline_0003 fail, result is: %{public}d", stoppipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_StopPipeline_0004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuite_Result createEngineresult = OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_CreatePipeline(
        audioSuiteEngine, &audioSuitePipeline,
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST)
    );
    OH_AudioFormat audioFormatBuilder;
    audioFormatBuilder.samplingRate = OH_Audio_SampleRate::SAMPLE_RATE_48000;
    audioFormatBuilder.channelLayout = OH_AudioChannelLayout::CH_LAYOUT_STEREO;
    audioFormatBuilder.sampleFormat = OH_Audio_SampleFormat::AUDIO_SAMPLE_S16LE;
    audioFormatBuilder.encodingType = OH_Audio_EncodingType::AUDIO_ENCODING_TYPE_RAW;
    audioFormatBuilder.channelCount = NUM_TWO;
    OH_AudioNodeBuilder* inputBuilder;
    OH_AudioSuite_Result createInputresult = OH_AudioSuiteNodeBuilder_Create(&inputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        inputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(inputBuilder, audioFormatBuilder);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(inputBuilder, MyOnWriteData, g_userData);
    OH_AudioNode *inputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, inputBuilder, &inputNode);
    OH_AudioNodeBuilder* outputBuilder;
    OH_AudioSuite_Result createOutputresult = OH_AudioSuiteNodeBuilder_Create(&outputBuilder);
    OH_AudioSuiteNodeBuilder_SetNodeType(
        outputBuilder,
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST));
    OH_AudioSuiteNodeBuilder_SetFormat(outputBuilder, audioFormatBuilder);
    OH_AudioNode *outputNode;
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, outputBuilder, &outputNode);
    OH_AudioSuite_Result connectNodesresult = OH_AudioSuiteEngine_ConnectNodes(inputNode, outputNode);
    OH_AudioSuite_Result startpipelineresult = OH_AudioSuiteEngine_StartPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_RenderFrame(audioSuitePipeline, audioData.data(), g_frameSize, &g_writeSize, &g_finishedFlag);
    OH_AudioSuite_Result stoppipelineresult = OH_AudioSuiteEngine_StopPipeline(audioSuitePipeline);
    if (stoppipelineresult != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
        LOG("AudioSuiteEngine_StopPipeline_0004 fail, result is: %{public}d", stoppipelineresult);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        return res;
    }
}

static napi_value AudioSuiteEngine_IsNodeTypeSupported_0001(napi_env env, napi_callback_info info)
{
    napi_value res;
    bool isSupported = false;
    for (const auto setNodeType : audioNodeTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_IsNodeTypeSupported(setNodeType, &isSupported);
        napi_create_int32(env, result, &res);
        if (result != OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
            LOG("AudioSuiteEngine_IsNodeTypeSupported_0001 fail, result is: %{public}d", result);
            return res;
        }
    }
    return res;
}

static napi_value AudioSuiteEngine_IsNodeTypeSupported_0002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioNode_Type nodeType = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_IsNodeTypeSupported(nodeType, nullptr);
    if (result != OH_AudioSuite_Result::AUDIOSUITE_ERROR_INVALID_PARAM) {
        LOG("AudioSuiteEngine_IsNodeTypeSupported_0002 fail, result is: %{public}d", result);
    }
    napi_create_int32(env, result, &res);
    return res;
}

static napi_value OH_AudioSuiteEngine_AudioNodeType_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioNode_Type input = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    OH_AudioNode_Type output = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    OH_AudioNode_Type equalizer = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_EQUALIZER_TEST);
    OH_AudioNode_Type noise = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_NOISE_REDUCTION_TEST);
    OH_AudioNode_Type sound = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SOUND_FIELD_TEST);

    if (input != INPUT_NODE_TYPE_DEFAULT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_001 fail, INPUT_NODE_TYPE_DEFAULT_TEST is: %{public}d", INPUT_NODE_TYPE_DEFAULT);
        return result;
    }
    if (output != OUTPUT_NODE_TYPE_DEFAULT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_001 fail, OUTPUT_NODE_TYPE_DEFAULT is: %{public}d", OUTPUT_NODE_TYPE_DEFAULT);
        return result;
    }
    if (equalizer != EFFECT_NODE_TYPE_EQUALIZER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_001 fail, EFFECT_NODE_TYPE_EQUALIZER is: %{public}d", EFFECT_NODE_TYPE_EQUALIZER);
        return result;
    }
    if (noise != EFFECT_NODE_TYPE_NOISE_REDUCTION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_001 fail,EFFECT_NODE_TYPE_NOISE_REDUCTION is: %{public}d", EFFECT_NODE_TYPE_NOISE_REDUCTION);
        return result;
    }
    if (sound != EFFECT_NODE_TYPE_SOUND_FIELD) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_001 fail, EFFECT_NODE_TYPE_SOUND_FIELD is: %{public}d", EFFECT_NODE_TYPE_SOUND_FIELD);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_AudioNodeType_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioNode_Type separation =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION_TEST);
    OH_AudioNode_Type beaudifier =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_VOICE_BEAUTIFIER_TEST);
    OH_AudioNode_Type environment =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT_TEST);
    OH_AudioNode_Type mixer = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    if (separation != EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_002 fail, EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION is: %{public}d",
            EFFECT_MULTII_OUTPUT_NODE_TYPE_AUDIO_SEPARATION);
        return result;
    }
    if (beaudifier != EFFECT_NODE_TYPE_VOICE_BEAUTIFIER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_002 fail, EFFECT_NODE_TYPE_VOICE_BEAUTIFIER is: %{public}d",
            EFFECT_NODE_TYPE_VOICE_BEAUTIFIER);
        return result;
    }
    if (environment != EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_002 fail, EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT is: %{public}d",
            EFFECT_NODE_TYPE_ENVIRONMENT_EFFECT);
        return result;
    }
    if (mixer != EFFECT_NODE_TYPE_AUDIO_MIXER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_002 fail, EFFECT_NODE_TYPE_AUDIO_MIXER is: %{public}d", EFFECT_NODE_TYPE_AUDIO_MIXER);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_AudioNodeType_003(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioNode_Type spacerRender =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);
    OH_AudioNode_Type pureVoice =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    OH_AudioNode_Type geberalVoice =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    OH_AudioNode_Type tempoPitch = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);

    if (spacerRender != OH_AudioNode_Type::EFFECT_NODE_TYPE_SPACE_RENDER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_003 fail, EFFECT_NODE_TYPE_SPACE_RENDER is: %{public}d",
            EFFECT_NODE_TYPE_SPACE_RENDER);
        return result;
    }
    if (pureVoice != OH_AudioNode_Type::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_003 fail, EFFECT_NODE_TYPE_PURE_VOICE_CHANGE is: %{public}d",
            EFFECT_NODE_TYPE_PURE_VOICE_CHANGE);
        return result;
    }
    if (geberalVoice != OH_AudioNode_Type::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_003 fail, EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE is: %{public}d",
            EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE);
        return result;
    }
    if (tempoPitch != OH_AudioNode_Type::EFFECT_NODE_TYPE_TEMPO_PITCH) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_003 fail, EFFECT_NODE_TYPE_TEMPO_PITCH is: %{public}d", EFFECT_NODE_TYPE_TEMPO_PITCH);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_AudioNodeType_004(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioNode_Type spacerender =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);
    OH_AudioSuite_SurroundDirection spaceccw =
        static_cast<OH_AudioSuite_SurroundDirection>(AudioSuiteSurroundDirectionTest::SPACE_RENDER_CCW_TEST);
    OH_AudioSuite_SurroundDirection spacecw =
        static_cast<OH_AudioSuite_SurroundDirection>(AudioSuiteSurroundDirectionTest::SPACE_RENDER_CW_TEST);

    if (spacerender != EFFECT_NODE_TYPE_SPACE_RENDER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_004 fail, EFFECT_NODE_TYPE_SPACE_RENDER is: %{public}d",
            EFFECT_NODE_TYPE_SPACE_RENDER);
        return result;
    }
    if (spaceccw != SPACE_RENDER_CCW) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_004 fail, SPACE_RENDER_CCW is: %{public}d",
            SPACE_RENDER_CCW);
        return result;
    }
    if (spacecw != SPACE_RENDER_CW) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioNodeType_004 fail, SPACE_RENDER_CW is: %{public}d",
            SPACE_RENDER_CW);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}
static napi_value OH_AudioSuiteEngine_PipelineWorkMode_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_PipelineWorkMode editMode =
        static_cast<OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST);
    OH_AudioSuite_PipelineWorkMode realtimeMode = static_cast<OH_AudioSuite_PipelineWorkMode>(
        AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_REALTIME_MODE_TEST);

    if (editMode != AUDIOSUITE_PIPELINE_EDIT_MODE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_PipelineWorkMode_001 fail, AUDIOSUITE_PIPELINE_EDIT_MODE is: %{public}d",
            AUDIOSUITE_PIPELINE_EDIT_MODE);
        return result;
    }
    if (realtimeMode != AUDIOSUITE_PIPELINE_REALTIME_MODE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_PipelineWorkMode_001 fail, AUDIOSUITE_PIPELINE_REALTIME_MODE is: %{public}d",
            AUDIOSUITE_PIPELINE_REALTIME_MODE);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_AudioSuitePipelineState_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_PipelineState stopped =
        static_cast<OH_AudioSuite_PipelineState>(AudioSuitePipelineStateTest::AUDIOSUITE_PIPELINE_STOPPED_TEST);
    OH_AudioSuite_PipelineState running =
        static_cast<OH_AudioSuite_PipelineState>(AudioSuitePipelineStateTest::AUDIOSUITE_PIPELINE_RUNNING_TEST);

    if (stopped != AUDIOSUITE_PIPELINE_STOPPED) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuitePipelineState_001 fail, AUDIOSUITE_PIPELINE_STOPPED is: %{public}d",
            AUDIOSUITE_PIPELINE_STOPPED);
        return result;
    }
    if (running != AUDIOSUITE_PIPELINE_RUNNING) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuitePipelineState_001 fail, AUDIOSUITE_PIPELINE_RUNNING is: %{public}d",
            AUDIOSUITE_PIPELINE_RUNNING);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_SampleFormat_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Audio_SampleFormat u8 = static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_U8_TEST);
    OH_Audio_SampleFormat s16le = static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S16LE_TEST);
    OH_Audio_SampleFormat s24le = static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S24LE_TEST);
    OH_Audio_SampleFormat s32le = static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_S32LE_TEST);
    OH_Audio_SampleFormat f32le = static_cast<OH_Audio_SampleFormat>(AudioSampleFormatTest::AUDIO_SAMPLE_F32LE_TEST);

    if (u8 != AUDIO_SAMPLE_U8) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleFormat_001 fail, AUDIO_SAMPLE_U8 is: %{public}d", AUDIO_SAMPLE_U8);
        return result;
    }
    if (s16le != AUDIO_SAMPLE_S16LE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleFormat_001 fail, AUDIO_SAMPLE_S16LE is: %{public}d", AUDIO_SAMPLE_S16LE);
        return result;
    }
    if (s24le != AUDIO_SAMPLE_S24LE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleFormat_001 fail, AUDIO_SAMPLE_S24LE is: %{public}d", AUDIO_SAMPLE_S24LE);
        return result;
    }
    if (s32le != AUDIO_SAMPLE_S32LE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleFormat_001 fail, AUDIO_SAMPLE_S32LE is: %{public}d", AUDIO_SAMPLE_S32LE);
        return result;
    }
    if (f32le != AUDIO_SAMPLE_F32LE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleFormat_001 fail, AUDIO_SAMPLE_F32LE is: %{public}d", AUDIO_SAMPLE_F32LE);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_SampleRate_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Audio_SampleRate rate8000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_8000_TEST);
    OH_Audio_SampleRate rate11025 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_11025_TEST);
    OH_Audio_SampleRate rate12000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_12000_TEST);
    OH_Audio_SampleRate rate16000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_16000_TEST);
    OH_Audio_SampleRate rate22050 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_22050_TEST);
    OH_Audio_SampleRate rate24000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_24000_TEST);
    OH_Audio_SampleRate rate32000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_32000_TEST);

    if (rate8000 != SAMPLE_RATE_8000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_8000 is: %{public}d", SAMPLE_RATE_8000);
        return result;
    }
    if (rate11025 != SAMPLE_RATE_11025) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_11025 is: %{public}d", SAMPLE_RATE_11025);
        return result;
    }
    if (rate12000 != SAMPLE_RATE_12000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_12000 is: %{public}d", SAMPLE_RATE_12000);
        return result;
    }
    if (rate16000 != SAMPLE_RATE_16000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_16000 is: %{public}d", SAMPLE_RATE_16000);
        return result;
    }
    if (rate22050 != SAMPLE_RATE_22050) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_22050 is: %{public}d", SAMPLE_RATE_22050);
        return result;
    }
    if (rate24000 != SAMPLE_RATE_24000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_24000 is: %{public}d", SAMPLE_RATE_24000);
        return result;
    }
    if (rate32000 != SAMPLE_RATE_32000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_001 fail, SAMPLE_RATE_32000 is: %{public}d", SAMPLE_RATE_32000);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_SampleRate_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Audio_SampleRate rate44100 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_44100_TEST);
    OH_Audio_SampleRate rate48000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_48000_TEST);
    OH_Audio_SampleRate rate64000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_64000_TEST);
    OH_Audio_SampleRate rate88200 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_88200_TEST);
    OH_Audio_SampleRate rate96000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_96000_TEST);
    OH_Audio_SampleRate rate176400 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_176400_TEST);
    OH_Audio_SampleRate rate192000 = static_cast<OH_Audio_SampleRate>(AudioSampleRateTest::SAMPLE_RATE_192000_TEST);

    if (rate44100 != SAMPLE_RATE_44100) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_44100 is: %{public}d", SAMPLE_RATE_44100);
        return result;
    }
    if (rate48000 != SAMPLE_RATE_48000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_48000 is: %{public}d", SAMPLE_RATE_48000);
        return result;
    }
    if (rate64000 != SAMPLE_RATE_64000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_64000 is: %{public}d", SAMPLE_RATE_64000);
        return result;
    }
    if (rate88200 != SAMPLE_RATE_88200) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_88200 is: %{public}d", SAMPLE_RATE_88200);
        return result;
    }
    if (rate96000 != SAMPLE_RATE_96000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_96000 is: %{public}d", SAMPLE_RATE_96000);
        return result;
    }
    if (rate176400 != SAMPLE_RATE_176400) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_176400 is: %{public}d", SAMPLE_RATE_176400);
        return result;
    }
    if (rate192000 != SAMPLE_RATE_192000) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_SampleRate_002 fail, SAMPLE_RATE_192000 is: %{public}d", SAMPLE_RATE_192000);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_AudioSuiteResult_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_Result errorSystem =
        static_cast<OH_AudioSuite_Result>(AudioSuiteResultTest::AUDIOSUITE_ERROR_SYSTEM_TEST);
    OH_AudioSuite_Result engineNotExist =
        static_cast<OH_AudioSuite_Result>(AudioSuiteResultTest::AUDIOSUITE_ERROR_ENGINE_NOT_EXIST_TEST);
    OH_AudioSuite_Result timeout =
        static_cast<OH_AudioSuite_Result>(AudioSuiteResultTest::AUDIOSUITE_ERROR_TIMEOUT_TEST);
    OH_AudioSuite_Result memory =
        static_cast<OH_AudioSuite_Result>(AudioSuiteResultTest::AUDIOSUITE_ERROR_MEMORY_ALLOC_FAILED_TEST);

    if (errorSystem != AUDIOSUITE_ERROR_SYSTEM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuiteResult_001 fail, AUDIOSUITE_ERROR_SYSTEM is: %{public}d",
            AUDIOSUITE_ERROR_SYSTEM);
        return result;
    }
    if (engineNotExist != AUDIOSUITE_ERROR_ENGINE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuiteResult_001 fail, AUDIOSUITE_ERROR_ENGINE_NOT_EXIST is: %{public}d",
            AUDIOSUITE_ERROR_ENGINE_NOT_EXIST);
        return result;
    }
    if (timeout != AUDIOSUITE_ERROR_TIMEOUT) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuiteResult_001 fail, AUDIOSUITE_ERROR_TIMEOUT is: %{public}d",
            AUDIOSUITE_ERROR_TIMEOUT);
        return result;
    }
    if (memory != AUDIOSUITE_ERROR_MEMORY_ALLOC_FAILED) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_AudioSuiteResult_001 fail, AUDIOSUITE_ERROR_MEMORY_ALLOC_FAILED is: %{public}d",
            AUDIOSUITE_ERROR_MEMORY_ALLOC_FAILED);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value OH_AudioSuiteEngine_VoiceBeautifierType_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_VoiceBeautifierType clear =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CLEAR_TEST);
    OH_VoiceBeautifierType theater =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_THEATRE_TEST);
    OH_VoiceBeautifierType cd =
        static_cast<OH_VoiceBeautifierType>(AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_CD_TEST);
    OH_VoiceBeautifierType studio = static_cast<OH_VoiceBeautifierType>(
        AudioSuiteVoiceBeautifierTypeTest::VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO_TEST);

    if (clear != VOICE_BEAUTIFIER_TYPE_CLEAR) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_VoiceBeautifierType_001 fail, VOICE_BEAUTIFIER_TYPE_CLEAR is: %{public}d",
            VOICE_BEAUTIFIER_TYPE_CLEAR);
        return result;
    }
    if (theater != VOICE_BEAUTIFIER_TYPE_THEATRE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_VoiceBeautifierType_001 fail, VOICE_BEAUTIFIER_TYPE_THEATRE is: %{public}d",
            VOICE_BEAUTIFIER_TYPE_THEATRE);
        return result;
    }
    if (cd != VOICE_BEAUTIFIER_TYPE_CD) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_VoiceBeautifierType_001 fail, VOICE_BEAUTIFIER_TYPE_CD is: %{public}d",
            VOICE_BEAUTIFIER_TYPE_CD);
        return result;
    }
    if (studio != VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("OH_AudioSuiteEngine_VoiceBeautifierType_001 fail, VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO is: %{public}d",
            VOICE_BEAUTIFIER_TYPE_RECORDING_STUDIO);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioPureVoiceChangeTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_PureVoiceChangeType cartoon =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST);
    OH_AudioSuite_PureVoiceChangeType cute =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CUTE_TEST);
    OH_AudioSuite_PureVoiceChangeType female =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_FEMALE_TEST);
    OH_AudioSuite_PureVoiceChangeType male =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_MALE_TEST);

    if (cartoon != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_CARTOON) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_001 fail, PURE_VOICE_CHANGE_TYPE_CARTOON is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_CARTOON);
        return result;
    }
    if (cute != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_CUTE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_001 fail, PURE_VOICE_CHANGE_TYPE_CUTE is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_CUTE);
        return result;
    }
    if (female != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_FEMALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_001 fail, PURE_VOICE_CHANGE_TYPE_FEMALE is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_FEMALE);
        return result;
    }
    if (male != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_MALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_001 fail, PURE_VOICE_CHANGE_TYPE_MALE is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_MALE);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioPureVoiceChangeTypeTest_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_PureVoiceChangeType monster =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_MONSTER_TEST);
    OH_AudioSuite_PureVoiceChangeType robots =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_ROBOTS_TEST);
    OH_AudioSuite_PureVoiceChangeType seasoned =
        static_cast<OH_AudioSuite_PureVoiceChangeType>(PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_SEASONED_TEST);

    if (monster != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_MONSTER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_002 fail, PURE_VOICE_CHANGE_TYPE_MONSTER is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_MONSTER);
        return result;
    }
    if (robots != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_ROBOTS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_002 fail, PURE_VOICE_CHANGE_TYPE_ROBOTS is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_ROBOTS);
        return result;
    }
    if (seasoned != OH_AudioSuite_PureVoiceChangeType::PURE_VOICE_CHANGE_TYPE_SEASONED) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeTypeTest_002 fail, PURE_VOICE_CHANGE_TYPE_SEASONED is: %{public}d",
            PURE_VOICE_CHANGE_TYPE_SEASONED);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioGeneralVoiceChangeTypeTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_GeneralVoiceChangeType cute =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST);
    OH_AudioSuite_GeneralVoiceChangeType cyberpunk =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CYBERPUNK_TEST);
    OH_AudioSuite_GeneralVoiceChangeType female =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_FEMALE_TEST);
    OH_AudioSuite_GeneralVoiceChangeType male =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MALE_TEST);
    OH_AudioSuite_GeneralVoiceChangeType mix =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MIX_TEST);

    if (cute != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_CUTE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_001 fail, GENERAL_VOICE_CHANGE_TYPE_CUTE is: %{public}d",  GENERAL_VOICE_CHANGE_TYPE_CUTE);
        return result;
    }
    if (cyberpunk != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_CYBERPUNK) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_001 fail, GENERAL_VOICE_CHANGE_TYPE_CYBERPUNK is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_CYBERPUNK);
        return result;
    }
    if (female != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_FEMALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_001 fail, GENERAL_VOICE_CHANGE_TYPE_FEMALE is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_FEMALE);
        return result;
    }
    if (male != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_MALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_001 fail, GENERAL_VOICE_CHANGE_TYPE_MALE is: %{public}d", GENERAL_VOICE_CHANGE_TYPE_MALE);
        return result;
    }
    if (mix != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_MIX) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_001 fail, GENERAL_VOICE_CHANGE_TYPE_MIX is: %{public}d", GENERAL_VOICE_CHANGE_TYPE_MIX);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioGeneralVoiceChangeTypeTest_002(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_GeneralVoiceChangeType monster =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_MONSTER_TEST);
    OH_AudioSuite_GeneralVoiceChangeType seasoned =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_SEASONED_TEST);
    OH_AudioSuite_GeneralVoiceChangeType synth =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_SYNTH_TEST);
    OH_AudioSuite_GeneralVoiceChangeType trill =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_TRILL_TEST);
    OH_AudioSuite_GeneralVoiceChangeType war =
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_WAR_TEST);

    if (monster != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_MONSTER) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_002 fail, GENERAL_VOICE_CHANGE_TYPE_MONSTER is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_MONSTER);
        return result;
    }
    if (seasoned != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_SEASONED) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_002 fail, GENERAL_VOICE_CHANGE_TYPE_SEASONED is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_SEASONED);
        return result;
    }
    if (synth != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_SYNTH) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_002 fail, GENERAL_VOICE_CHANGE_TYPE_SYNTH is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_SYNTH);
        return result;
    }
    if (trill != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_TRILL) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_002 fail, GENERAL_VOICE_CHANGE_TYPE_TRILL is: %{public}d",
            GENERAL_VOICE_CHANGE_TYPE_TRILL);
        return result;
    }
    if (war != OH_AudioSuite_GeneralVoiceChangeType::GENERAL_VOICE_CHANGE_TYPE_WAR) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("VoiceChangeType_002 fail, GENERAL_VOICE_CHANGE_TYPE_WAR is: %{public}d", GENERAL_VOICE_CHANGE_TYPE_WAR);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioPureVoiceChangeGenderOptionTest_001(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_AudioSuite_PureVoiceChangeGenderOption female =
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST);
    OH_AudioSuite_PureVoiceChangeGenderOption male =
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_MALE_TEST);

    if (female != OH_AudioSuite_PureVoiceChangeGenderOption::PURE_VOICE_CHANGE_FEMALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeGenderOptionTest_001 fail, PURE_VOICE_CHANGE_FEMALE is: %{public}d",
            PURE_VOICE_CHANGE_FEMALE);
        return result;
    }
    if (male != OH_AudioSuite_PureVoiceChangeGenderOption::PURE_VOICE_CHANGE_MALE) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &result);
        LOG("AudioPureVoiceChangeGenderOptionTest_001 fail, PURE_VOICE_CHANGE_MALE is: %{public}d",
            PURE_VOICE_CHANGE_MALE);
        return result;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &result);
    return result;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMax, g_pitchMax);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin - 0.1, g_pitchMin);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin - 0.1);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMax + 0.1, g_pitchMax);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMax, g_pitchMax + 0.1);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(nullptr, g_speedMax, g_pitchMax);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
            <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMax, g_pitchMax);
        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("SetTempoAndPitch_008 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_009(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin);

    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_009 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_010(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_010 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetTempoAndPitch_011(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin);
    
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetTempoAndPitch_011 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    float speed;
    float pitch;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_SetTempoAndPitch(audioNode, g_speedMin, g_pitchMin);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(audioNode, &speed, &pitch);
    
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    float speed;
    float pitch;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(nullptr, &speed, &pitch);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    float pitch;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(nullptr, nullptr, &pitch);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(nullptr, nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    float speed;
    float pitch;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
            <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(audioNode, &speed, &pitch);
        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("GetTempoAndPitch_005 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_TEMPO_PITCH_TEST);
    float speed;
    float pitch;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(audioNode, &speed, &pitch);
    
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    float speed;
    float pitch;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(audioNode, &speed, &pitch);
    
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetTempoAndPitch_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    float speed;
    float pitch;
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetTempoAndPitch(audioNode, &speed, &pitch);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetTempoAndPitch_008 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
                PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
            static_cast<OH_AudioSuite_PureVoiceChangeType>(
                PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("SetPureVoiceChange_001 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto optionType : pureVoiceChangeTypeTest) {
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
            optionType};
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_SetPureVoiceChangeOption_002 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto optionType : pureVoiceChangeTypeTest) {
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_MALE_TEST),
            optionType};
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_SetPureVoiceChangeOption_003 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        g_changeOptionMin};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        g_changeOptionMax};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    float pitch = g_changeOptionMin - 0.1f;
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        pitch};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    float pitch = g_changeOptionMax + 0.1f;
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        pitch};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(nullptr, option);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_008 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_009(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_009 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_010(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_010 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetPureVoiceChangeOption_011(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetPureVoiceChangeOption_011 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
                PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
            static_cast<OH_AudioSuite_PureVoiceChangeType>(
                PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);

        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("GetPureVoiceChange_001 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto optionType : pureVoiceChangeTypeTest) {
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
            optionType};
        OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_GetPureVoiceChangeOption_002 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto optionType : pureVoiceChangeTypeTest) {
        OH_AudioSuite_PureVoiceChangeOption option = {
            static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_MALE_TEST),
            optionType};
        OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_GetPureVoiceChangeOption_003 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        g_changeOptionMin};
    OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
        PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
        PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST),
        g_changeOptionMax};
    OH_AudioSuiteEngine_SetPureVoiceChangeOption(audioNode, option);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(nullptr, &option);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, nullptr);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_008 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_009(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_PURE_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
 
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_009 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_010(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_010 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetPureVoiceChangeOption_011(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_PureVoiceChangeOption option = {
        static_cast<OH_AudioSuite_PureVoiceChangeGenderOption>(
            PureVoiceChangeGenderOptionTest::PURE_VOICE_CHANGE_FEMALE_TEST),
        static_cast<OH_AudioSuite_PureVoiceChangeType>(
            PureVoiceChangeTypeTest::PURE_VOICE_CHANGE_TYPE_CARTOON_TEST)};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetPureVoiceChangeOption(audioNode, &option);
 
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetPureVoiceChangeOption_011 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto changeType : generalVoiceChangeTypeTest) {
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode, changeType);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_SetGeneralVoiceChangeType_001 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType ==
            static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode,
            static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
                GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST));
        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("SetVoiceChangeType_002 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(nullptr,
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
            GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST));
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetGeneralVoiceChangeType_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode,
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST));
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetGeneralVoiceChangeType_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode,
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST));
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetGeneralVoiceChangeType_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetGeneralVoiceChangeType_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode,
        static_cast<OH_AudioSuite_GeneralVoiceChangeType>(
        GeneralVoiceChangeTypeTest::GENERAL_VOICE_CHANGE_TYPE_CUTE_TEST));
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetGeneralVoiceChangeType_008 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    for (const auto changeType : generalVoiceChangeTypeTest) {
        OH_AudioSuiteEngine_SetGeneralVoiceChangeType(audioNode, changeType);
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode,
            (OH_AudioSuite_GeneralVoiceChangeType *)&changeType);
        if (isSupported && result != AUDIOSUITE_SUCCESS) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_001 fail, result is: %{public}d", result);
            OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
            OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
            return res;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    for (const auto setNodeType : audioNodeTypeTest) {
        if (setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType == static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST) ||
            setNodeType ==
            static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST)) {
            continue;
        }
        OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
        OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
        OH_AudioNodeBuilder *builder = nullptr;
        OH_AudioNode *audioNode = nullptr;
        bool isSupported = IsNodeTypeSupported(setNodeType);
        OH_AudioSuiteEngine_Create(&audioSuiteEngine);
        OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
        OH_AudioSuiteNodeBuilder_Create(&builder);
        OH_AudioSuiteNodeBuilder_SetNodeType(builder, setNodeType);
        OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
        OH_AudioSuite_GeneralVoiceChangeType generalType;
        OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode, &generalType);
        OH_AudioSuiteNodeBuilder_Destroy(builder);
        OH_AudioSuiteEngine_DestroyNode(audioNode);
        OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
        OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

        if (isSupported && result != AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
            napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
            LOG("GetVoiceChangeType_002 fail, result is: %{public}d, setNodeType is: %{public}d ", result, setNodeType);
            return res;
        }
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_GeneralVoiceChangeType generalType;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(nullptr, &generalType);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type =
        static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_GENERAL_VOICE_CHANGE_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuite_GeneralVoiceChangeType generalType;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode, &generalType);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_007(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::OUTPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatOutput);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuite_GeneralVoiceChangeType generalType;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode, &generalType);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_007 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetGeneralVoiceChangeType_008(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::INPUT_NODE_TYPE_DEFAULT_TEST);
    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline, static_cast
        <OH_AudioSuite_PipelineWorkMode>(AudioSuitePipelineWorkModeTest::AUDIOSUITE_PIPELINE_EDIT_MODE_TEST));
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteNodeBuilder_SetFormat(builder, audioFormatInput);
    OH_AudioSuiteNodeBuilder_SetRequestDataCallback(builder, MyOnWriteData, g_userData);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_GeneralVoiceChangeType generalType;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetGeneralVoiceChangeType(audioNode, &generalType);
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        return res;
    }

    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetGeneralVoiceChangeType_008 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderPositionParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderPositionParams positionNormalCases[] = {
        {1, 2, 3},
        {5, 5, 5},
        {1, 1, 1},
        {0, 0, 0},
        {-1, -1, -1},
        {-5, -5, -5}
    };
    for (size_t i = 0; i < sizeof(positionNormalCases)/sizeof(positionNormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderPositionParams position = positionNormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderPositionParams(audioNode, position);
        if (result != AUDIOSUITE_SUCCESS) {
            LOG("Test case %zu failed with param:{%f, %f, %f}, result: %d",
                i, position.x, position.y, position.z, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderPositionParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderPositionParams position = {1, 2, 3};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderPositionParams(audioNode, position);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderPositionParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderPositionParams position = {1, 2, 3};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderPositionParams(audioNode, position);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderPositionParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_SpaceRenderPositionParams position = {1, 2, 3};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderPositionParams(nullptr, position);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderPositionParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderPositionParams positionAbnormalCases[] = {
        {6, 0, 0},
        {-6, 0, 0},
        {0, 6, 0},
        {0, -6, 0},
        {0, 0, 6},
        {0, 0, -6}
    };
    for (size_t i = 0; i < sizeof(positionAbnormalCases)/sizeof(positionAbnormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderPositionParams position = positionAbnormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderPositionParams(audioNode, position);
        if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
            LOG("Test case %zu failed with param:{%f, %f, %f}, result: %d",
                i, position.x, position.y, position.z, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderPositionParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderPositionParams position = {1, 2, 3};
    OH_AudioSuiteEngine_SetSpaceRenderPositionParams(audioNode, position);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(audioNode, &position);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderPositionParams position;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(audioNode, &position);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderPositionParams position;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(audioNode, &position);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(audioNode, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_SpaceRenderPositionParams position = {1, 2, 3};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(nullptr, &position);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderPositionParams_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderPositionParams(nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderPositionParams_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderRotationParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderRotationParams rotationNormalCases[] = {
        {1, 2, 3, 5, SPACE_RENDER_CW},
        {5, 5, 5, 2, SPACE_RENDER_CW},
        {1, 1, 1, 2, SPACE_RENDER_CW},
        {0, 0, 0, 20, SPACE_RENDER_CW},
        {-1, -1, -1, 40, SPACE_RENDER_CCW},
        {-5, -5, -5, 40, SPACE_RENDER_CCW}
    };
    for (size_t i = 0; i < sizeof(rotationNormalCases)/sizeof(rotationNormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderRotationParams rotation = rotationNormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderRotationParams(audioNode, rotation);
        if (result != AUDIOSUITE_SUCCESS) {
            LOG("Test case %zu failed with param:{%f, %f, %f, %d, %d}, result: %d",
                i, rotation.x, rotation.y, rotation.z, rotation.surroundTime, rotation.surroundDirection, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderRotationParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderRotationParams rotation = {1, 2, 3, 5, SPACE_RENDER_CW};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderRotationParams(audioNode, rotation);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderRotationParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderRotationParams rotation = {1, 2, 3, 5, SPACE_RENDER_CW};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderRotationParams(audioNode, rotation);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderRotationParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_SpaceRenderRotationParams rotation = {1, 2, 3, 5, SPACE_RENDER_CW};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderRotationParams(nullptr, rotation);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderRotationParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderRotationParams rotationAbnormalCases[] = {
        {-6, 0, 0, 21, SPACE_RENDER_CW},
        {6, 0, 0, 21, SPACE_RENDER_CW},
        {0, -6, 0, 21, SPACE_RENDER_CW},
        {0, 6, 0, 21, SPACE_RENDER_CW},
        {0, 0, -6, 21, SPACE_RENDER_CCW},
        {0, 0, 6, 21, SPACE_RENDER_CCW},
        {0, 0, 0, 41, SPACE_RENDER_CCW},
        {0, 0, 0, 1, SPACE_RENDER_CCW}
    };
    for (size_t i = 0; i < sizeof(rotationAbnormalCases)/sizeof(rotationAbnormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderRotationParams rotation = rotationAbnormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderRotationParams(audioNode, rotation);
        if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
            LOG("Test case %zu failed with param:{%f, %f, %f, %d, %d}, result: %d",
                i, rotation.x, rotation.y, rotation.z, rotation.surroundTime, rotation.surroundDirection, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderRotationParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderRotationParams rotation = {1, 2, 3, 5, SPACE_RENDER_CW};
    OH_AudioSuiteEngine_SetSpaceRenderRotationParams(audioNode, rotation);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(audioNode, &rotation);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderRotationParams rotation;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(audioNode, &rotation);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderRotationParams rotation;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(audioNode, &rotation);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(audioNode, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_SpaceRenderRotationParams rotation = {1, 2, 3, 5, SPACE_RENDER_CW};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(nullptr, &rotation);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderRotationParams_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderRotationParams(nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderRotationParams_006 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderExtensionParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderExtensionParams extensionNormalCases[] = {
        {1, 1},
        {2, 90},
        {3, 180},
        {5, 359}
    };
    for (size_t i = 0; i < sizeof(extensionNormalCases)/sizeof(extensionNormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderExtensionParams extension = extensionNormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(audioNode, extension);
        if (result != AUDIOSUITE_SUCCESS) {
            LOG("Test case %zu failed with param:{%f, %d}, result: %d",
                i, extension.extRadius, extension.extAngle, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderExtensionParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderExtensionParams extension = {1, 1};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(audioNode, extension);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderExtensionParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderExtensionParams extension = {1, 1};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(audioNode, extension);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderExtensionParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;

    OH_AudioSuite_SpaceRenderExtensionParams extension = {1, 1};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(nullptr, extension);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_SetSpaceRenderExtensionParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    OH_AudioSuite_Result result;
    bool isSupported =
        IsNodeTypeSupported(static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);
    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, static_cast<OH_AudioNode_Type>
                                        (AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST));
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    bool testPassed = true;
    OH_AudioSuite_SpaceRenderExtensionParams extensionAbnormalCases[] = {
        {0, 1},
        {1, 360},
        {6, 1},
        {1, 0}
    };
    for (size_t i = 0; i < sizeof(extensionAbnormalCases)/sizeof(extensionAbnormalCases[0]); ++i) {
        OH_AudioSuite_SpaceRenderExtensionParams extension = extensionAbnormalCases[i];
        result = OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(audioNode, extension);
        if (result != AUDIOSUITE_ERROR_INVALID_PARAM) {
            LOG("Test case %zu failed with param:{%f, %d}, result: %d",
                i, extension.extRadius, extension.extAngle, result);
            testPassed = false;
        }
    }
    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);
    if (!isSupported || testPassed) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_SetSpaceRenderExtensionParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_001(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderExtensionParams extension = {1, 1};
    OH_AudioSuiteEngine_SetSpaceRenderExtensionParams(audioNode, extension);
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(audioNode, &extension);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_001 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_001 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_002(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    OH_AudioSuiteEngine_DestroyNode(audioNode);

    OH_AudioSuite_SpaceRenderExtensionParams extension;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(audioNode, &extension);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_NODE_NOT_EXIST) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_002 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_002 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_003(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_AUDIO_MIXER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);

    OH_AudioSuite_SpaceRenderExtensionParams extension;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(audioNode, &extension);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_003 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_003 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_004(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuiteEngine *audioSuiteEngine = nullptr;
    OH_AudioSuitePipeline *audioSuitePipeline = nullptr;
    OH_AudioNodeBuilder *builder = nullptr;
    OH_AudioNode *audioNode = nullptr;
    
    bool bypassStatus = false;
    OH_AudioNode_Type type = static_cast<OH_AudioNode_Type>(AudioNodeTypeTest::EFFECT_NODE_TYPE_SPACE_RENDER_TEST);

    bool isSupported = IsNodeTypeSupported(type);
    OH_AudioSuiteEngine_Create(&audioSuiteEngine);

    OH_AudioSuiteEngine_CreatePipeline(audioSuiteEngine, &audioSuitePipeline,
                                       OH_AudioSuite_PipelineWorkMode::AUDIOSUITE_PIPELINE_EDIT_MODE);
    OH_AudioSuiteNodeBuilder_Create(&builder);
    OH_AudioSuiteNodeBuilder_SetNodeType(builder, type);
    OH_AudioSuiteEngine_CreateNode(audioSuitePipeline, builder, &audioNode);
    
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(audioNode, nullptr);

    OH_AudioSuiteNodeBuilder_Destroy(builder);
    OH_AudioSuiteEngine_DestroyNode(audioNode);
    OH_AudioSuiteEngine_DestroyPipeline(audioSuitePipeline);
    OH_AudioSuiteEngine_Destroy(audioSuiteEngine);

    if (!isSupported || result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_004 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_004 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_005(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_SpaceRenderExtensionParams extension = {1, 1};
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(nullptr, &extension);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_005 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_005 fail, result is: %{public}d", result);
    return res;
}

static napi_value AudioSuiteEngine_GetSpaceRenderExtensionParams_006(napi_env env, napi_callback_info info)
{
    napi_value res;
    OH_AudioSuite_Result result = OH_AudioSuiteEngine_GetSpaceRenderExtensionParams(nullptr, nullptr);
    if (result == AUDIOSUITE_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
        LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_006 success, result is: %{public}d", result);
        return res;
    }
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    LOG("AudioSuiteEngine_GetSpaceRenderExtensionParams_006 fail, result is: %{public}d", result);
    return res;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "AudioSuiteEngineCreateTest_0001", nullptr, AudioSuiteEngineCreateTest_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0002", nullptr, AudioSuiteEngineCreateTest_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0003", nullptr, AudioSuiteEngineCreateTest_0003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0004", nullptr, AudioSuiteEngineCreateTest_0004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0005", nullptr, AudioSuiteEngineCreateTest_0005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineDestroyTest_0001", nullptr, AudioSuiteEngineDestroyTest_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineDestroyTest_0002", nullptr, AudioSuiteEngineDestroyTest_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineDestroyTest_0003", nullptr, AudioSuiteEngineDestroyTest_0003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetNodeTypeTest_0001", nullptr, AudioSuiteNodeBuilderSetNodeTypeTest_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetNodeTypeTest_0002", nullptr, AudioSuiteNodeBuilderSetNodeTypeTest_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0001", nullptr, AudioSuiteNodeBuilderSetFormatTest_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0002", nullptr, AudioSuiteNodeBuilderSetFormatTest_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0003", nullptr, AudioSuiteNodeBuilderSetFormatTest_0003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0004", nullptr, AudioSuiteNodeBuilderSetFormatTest_0004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0005", nullptr, AudioSuiteNodeBuilderSetFormatTest_0005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0006", nullptr, AudioSuiteNodeBuilderSetFormatTest_0006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0007", nullptr, AudioSuiteNodeBuilderSetFormatTest_0007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilderSetFormatTest_0008", nullptr, AudioSuiteNodeBuilderSetFormatTest_0008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "InputNodeRequestDataCallbackTest_0001", nullptr, InputNodeRequestDataCallbackTest_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "InputNodeRequestDataCallbackTest_0002", nullptr, InputNodeRequestDataCallbackTest_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineBypassEffectNodeTest_0001", nullptr, AudioSuiteEngineBypassEffectNodeTest_0001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineBypassEffectNodeTest_0002", nullptr, AudioSuiteEngineBypassEffectNodeTest_0002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineBypassEffectNodeTest_0003", nullptr, AudioSuiteEngineBypassEffectNodeTest_0003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineBypassEffectNodeTest_0004", nullptr, AudioSuiteEngineBypassEffectNodeTest_0004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineBypassEffectNodeTest_0005", nullptr, AudioSuiteEngineBypassEffectNodeTest_0005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0001", nullptr, AudioSuiteEngineConnectNodesTest_0001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0002", nullptr, AudioSuiteEngineConnectNodesTest_0002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0003", nullptr, AudioSuiteEngineConnectNodesTest_0003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0004", nullptr, AudioSuiteEngineConnectNodesTest_0004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0005", nullptr, AudioSuiteEngineConnectNodesTest_0005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0006", nullptr, AudioSuiteEngineConnectNodesTest_0006,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0007", nullptr, AudioSuiteEngineConnectNodesTest_0007,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0008", nullptr, AudioSuiteEngineConnectNodesTest_0008,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0009", nullptr, AudioSuiteEngineConnectNodesTest_0009,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0010", nullptr, AudioSuiteEngineConnectNodesTest_0010,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0011", nullptr, AudioSuiteEngineConnectNodesTest_0011,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0012", nullptr, AudioSuiteEngineConnectNodesTest_0012,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0013", nullptr, AudioSuiteEngineConnectNodesTest_0013,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0014", nullptr, AudioSuiteEngineConnectNodesTest_0014,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0015", nullptr, AudioSuiteEngineConnectNodesTest_0015,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0016", nullptr, AudioSuiteEngineConnectNodesTest_0016,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0017", nullptr, AudioSuiteEngineConnectNodesTest_0017,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0018", nullptr, AudioSuiteEngineConnectNodesTest_0018,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineConnectNodesTest_0019", nullptr, AudioSuiteEngineConnectNodesTest_0019,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006", nullptr,
          AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001", nullptr,
          AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002", nullptr,
          AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003", nullptr,
          AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004", nullptr,
          AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005", nullptr,
          AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetVoiceBeautifierTypeTest_0001", nullptr, AudioSuiteEngineSetVoiceBeautifierTypeTest_0001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetVoiceBeautifierTypeTest_0002", nullptr, AudioSuiteEngineSetVoiceBeautifierTypeTest_0002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetVoiceBeautifierTypeTest_0003", nullptr, AudioSuiteEngineSetVoiceBeautifierTypeTest_0003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetVoiceBeautifierTypeTest_0004", nullptr, AudioSuiteEngineSetVoiceBeautifierTypeTest_0004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetVoiceBeautifierTypeTest_0001", nullptr, AudioSuiteEngineGetVoiceBeautifierTypeTest_0001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetVoiceBeautifierTypeTest_0002", nullptr, AudioSuiteEngineGetVoiceBeautifierTypeTest_0002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetVoiceBeautifierTypeTest_0003", nullptr, AudioSuiteEngineGetVoiceBeautifierTypeTest_0003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetVoiceBeautifierTypeTest_0004", nullptr, AudioSuiteEngineGetVoiceBeautifierTypeTest_0004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetVoiceBeautifierTypeTest_0005", nullptr, AudioSuiteEngineGetVoiceBeautifierTypeTest_0005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Create", nullptr, AudioSuiteNodeBuilder_Create,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Create_001", nullptr, AudioSuiteNodeBuilder_Create_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Destory", nullptr, AudioSuiteNodeBuilder_Destory,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Destory_001", nullptr, AudioSuiteNodeBuilder_Destory_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Reset", nullptr, AudioSuiteNodeBuilder_Reset,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteNodeBuilder_Reset_001", nullptr, AudioSuiteNodeBuilder_Reset_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetSoundFieldType_001", nullptr, AudioSuiteEngineSetSoundFieldType_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetSoundFieldType_002", nullptr, AudioSuiteEngineSetSoundFieldType_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetSoundFieldType_003", nullptr, AudioSuiteEngineSetSoundFieldType_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineSetSoundFieldType_004", nullptr, AudioSuiteEngineSetSoundFieldType_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetSoundFieldType_001", nullptr, AudioSuiteEngineGetSoundFieldType_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetSoundFieldType_002", nullptr, AudioSuiteEngineGetSoundFieldType_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetSoundFieldType_003", nullptr, AudioSuiteEngineGetSoundFieldType_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineGetSoundFieldType_004", nullptr, AudioSuiteEngineGetSoundFieldType_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetEnvironmentType_001", nullptr, AudioSuiteEngine_SetEnvironmentType_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetEnvironmentType_002", nullptr, AudioSuiteEngine_SetEnvironmentType_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetEnvironmentType_003", nullptr, AudioSuiteEngine_SetEnvironmentType_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetEnvironmentType_004", nullptr, AudioSuiteEngine_SetEnvironmentType_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetEnvironmentType_001", nullptr, AudioSuiteEngine_GetEnvironmentType_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetEnvironmentType_002", nullptr, AudioSuiteEngine_GetEnvironmentType_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetEnvironmentType_003", nullptr, AudioSuiteEngine_GetEnvironmentType_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetEnvironmentType_004", nullptr, AudioSuiteEngine_GetEnvironmentType_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_001", nullptr, AudioSuiteEngine_GetNodeBypassStatus_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_002", nullptr, AudioSuiteEngine_GetNodeBypassStatus_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_003", nullptr, AudioSuiteEngine_GetNodeBypassStatus_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_004", nullptr, AudioSuiteEngine_GetNodeBypassStatus_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_005", nullptr, AudioSuiteEngine_GetNodeBypassStatus_005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_006", nullptr, AudioSuiteEngine_GetNodeBypassStatus_006,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetNodeBypassStatus_007", nullptr, AudioSuiteEngine_GetNodeBypassStatus_007,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_001", nullptr, AudioSuiteEngine_setAudioFormat_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_002", nullptr, AudioSuiteEngine_setAudioFormat_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_003", nullptr, AudioSuiteEngine_setAudioFormat_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_004", nullptr, AudioSuiteEngine_setAudioFormat_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_005", nullptr, AudioSuiteEngine_setAudioFormat_005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_setAudioFormat_006", nullptr, AudioSuiteEngine_setAudioFormat_006,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyNode_001", nullptr, AudioSuiteEngine_DestroyNode_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyNode_002", nullptr, AudioSuiteEngine_DestroyNode_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyNode_003", nullptr, AudioSuiteEngine_DestroyNode_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyNode_004", nullptr, AudioSuiteEngine_DestroyNode_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyNode_006", nullptr, AudioSuiteEngine_DestroyNode_006,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_001", nullptr, AudioSuiteEngine_CreateNode_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_002", nullptr, AudioSuiteEngine_CreateNode_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_003", nullptr, AudioSuiteEngine_CreateNode_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_004", nullptr, AudioSuiteEngine_CreateNode_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_005", nullptr, AudioSuiteEngine_CreateNode_005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_006", nullptr, AudioSuiteEngine_CreateNode_006,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_007", nullptr, AudioSuiteEngine_CreateNode_007,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_008", nullptr, AudioSuiteEngine_CreateNode_008,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_009", nullptr, AudioSuiteEngine_CreateNode_009,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_010", nullptr, AudioSuiteEngine_CreateNode_010,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_011", nullptr, AudioSuiteEngine_CreateNode_011,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreateNode_012", nullptr, AudioSuiteEngine_CreateNode_012,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPipelineState001", nullptr, AudioSuiteEngine_GetPipelineState001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPipelineState002", nullptr, AudioSuiteEngine_GetPipelineState002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPipelineState003", nullptr, AudioSuiteEngine_GetPipelineState003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_RenderFrame001", nullptr, AudioSuiteEngine_RenderFrame001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_RenderFrame002", nullptr, AudioSuiteEngine_RenderFrame002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_RenderFrame003", nullptr, AudioSuiteEngine_RenderFrame003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_RenderFrame004", nullptr, AudioSuiteEngine_RenderFrame004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_RenderFrame005", nullptr, AudioSuiteEngine_RenderFrame005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_MultiRenderFrame_001", nullptr, OH_AudioSuiteEngine_MultiRenderFrame_001,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_MultiRenderFrame_002", nullptr, OH_AudioSuiteEngine_MultiRenderFrame_002,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_MultiRenderFrame_003", nullptr, OH_AudioSuiteEngine_MultiRenderFrame_003,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_MultiRenderFrame_004", nullptr, OH_AudioSuiteEngine_MultiRenderFrame_004,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_MultiRenderFrame_005", nullptr, OH_AudioSuiteEngine_MultiRenderFrame_005,
          nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreatePipeline_0001", nullptr, AudioSuiteEngine_CreatePipeline_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreatePipeline_0002", nullptr, AudioSuiteEngine_CreatePipeline_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreatePipeline_0003", nullptr, AudioSuiteEngine_CreatePipeline_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreatePipeline_0004", nullptr, AudioSuiteEngine_CreatePipeline_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_CreatePipeline_0005", nullptr, AudioSuiteEngine_CreatePipeline_0005,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyPipeline_0001", nullptr, AudioSuiteEngine_DestroyPipeline_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyPipeline_0002", nullptr, AudioSuiteEngine_DestroyPipeline_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyPipeline_0003", nullptr, AudioSuiteEngine_DestroyPipeline_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_DestroyPipeline_0004", nullptr, AudioSuiteEngine_DestroyPipeline_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0001", nullptr, AudioSuiteEngine_StartPipeline_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0002", nullptr, AudioSuiteEngine_StartPipeline_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0003", nullptr, AudioSuiteEngine_StartPipeline_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0004", nullptr, AudioSuiteEngine_StartPipeline_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0005", nullptr, AudioSuiteEngine_StartPipeline_0005,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StartPipeline_0006", nullptr, AudioSuiteEngine_StartPipeline_0006,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StopPipeline_0001", nullptr, AudioSuiteEngine_StopPipeline_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StopPipeline_0002", nullptr, AudioSuiteEngine_StopPipeline_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StopPipeline_0003", nullptr, AudioSuiteEngine_StopPipeline_0003,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_StopPipeline_0004", nullptr, AudioSuiteEngine_StopPipeline_0004,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioNodeType_001", nullptr, OH_AudioSuiteEngine_AudioNodeType_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioNodeType_002", nullptr, OH_AudioSuiteEngine_AudioNodeType_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioNodeType_003", nullptr, OH_AudioSuiteEngine_AudioNodeType_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_PipelineWorkMode_001", nullptr, OH_AudioSuiteEngine_PipelineWorkMode_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioSuitePipelineState_001", nullptr, OH_AudioSuiteEngine_AudioSuitePipelineState_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_SampleFormat_001", nullptr, OH_AudioSuiteEngine_SampleFormat_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_SampleRate_001", nullptr, OH_AudioSuiteEngine_SampleRate_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_SampleRate_002", nullptr, OH_AudioSuiteEngine_SampleRate_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioSuiteResult_001", nullptr, OH_AudioSuiteEngine_AudioSuiteResult_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_VoiceBeautifierType_001", nullptr, OH_AudioSuiteEngine_VoiceBeautifierType_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_IsNodeTypeSupported_0001", nullptr, AudioSuiteEngine_IsNodeTypeSupported_0001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_IsNodeTypeSupported_0002", nullptr, AudioSuiteEngine_IsNodeTypeSupported_0002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioPureVoiceChangeTypeTest_001", nullptr, AudioPureVoiceChangeTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioPureVoiceChangeTypeTest_002", nullptr, AudioPureVoiceChangeTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioGeneralVoiceChangeTypeTest_001", nullptr, AudioGeneralVoiceChangeTypeTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioGeneralVoiceChangeTypeTest_002", nullptr, AudioGeneralVoiceChangeTypeTest_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioPureVoiceChangeGenderOptionTest_001", nullptr, AudioPureVoiceChangeGenderOptionTest_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_001", nullptr, AudioSuiteEngine_SetTempoAndPitch_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_002", nullptr, AudioSuiteEngine_SetTempoAndPitch_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_003", nullptr, AudioSuiteEngine_SetTempoAndPitch_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_004", nullptr, AudioSuiteEngine_SetTempoAndPitch_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_005", nullptr, AudioSuiteEngine_SetTempoAndPitch_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_006", nullptr, AudioSuiteEngine_SetTempoAndPitch_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_007", nullptr, AudioSuiteEngine_SetTempoAndPitch_007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_008", nullptr, AudioSuiteEngine_SetTempoAndPitch_008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_009", nullptr, AudioSuiteEngine_SetTempoAndPitch_009,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_010", nullptr, AudioSuiteEngine_SetTempoAndPitch_010,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetTempoAndPitch_011", nullptr, AudioSuiteEngine_SetTempoAndPitch_011,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_001", nullptr, AudioSuiteEngine_GetTempoAndPitch_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_002", nullptr, AudioSuiteEngine_GetTempoAndPitch_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_003", nullptr, AudioSuiteEngine_GetTempoAndPitch_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_004", nullptr, AudioSuiteEngine_GetTempoAndPitch_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_005", nullptr, AudioSuiteEngine_GetTempoAndPitch_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_006", nullptr, AudioSuiteEngine_GetTempoAndPitch_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_007", nullptr, AudioSuiteEngine_GetTempoAndPitch_007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetTempoAndPitch_008", nullptr, AudioSuiteEngine_GetTempoAndPitch_008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_001", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_002", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_003", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_004", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_005", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_006", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_007", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_008", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_009", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_009,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_010", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_010,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetPureVoiceChangeOption_011", nullptr, AudioSuiteEngine_SetPureVoiceChangeOption_011,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_001", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_002", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_003", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_004", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_005", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_006", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_007", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_008", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_009", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_009,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_010", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_010,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetPureVoiceChangeOption_011", nullptr, AudioSuiteEngine_GetPureVoiceChangeOption_011,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_001", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_002", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_003", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_004", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_005", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetGeneralVoiceChangeType_006", nullptr, AudioSuiteEngine_SetGeneralVoiceChangeType_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_001", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_001,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_002", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_002,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_003", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_003,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_004", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_005", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_005,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_006", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_006,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_007", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetGeneralVoiceChangeType_008", nullptr, AudioSuiteEngine_GetGeneralVoiceChangeType_008,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "OH_AudioSuiteEngine_AudioNodeType_004", nullptr, OH_AudioSuiteEngine_AudioNodeType_004,
            nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderPositionParams_001", nullptr,
            AudioSuiteEngine_SetSpaceRenderPositionParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderPositionParams_002", nullptr,
            AudioSuiteEngine_SetSpaceRenderPositionParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderPositionParams_003", nullptr,
            AudioSuiteEngine_SetSpaceRenderPositionParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderPositionParams_004", nullptr,
            AudioSuiteEngine_SetSpaceRenderPositionParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderPositionParams_005", nullptr,
            AudioSuiteEngine_SetSpaceRenderPositionParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_001", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_002", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_003", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_004", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_005", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderPositionParams_006", nullptr,
            AudioSuiteEngine_GetSpaceRenderPositionParams_006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderRotationParams_001", nullptr,
            AudioSuiteEngine_SetSpaceRenderRotationParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderRotationParams_002", nullptr,
            AudioSuiteEngine_SetSpaceRenderRotationParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderRotationParams_003", nullptr,
            AudioSuiteEngine_SetSpaceRenderRotationParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderRotationParams_004", nullptr,
            AudioSuiteEngine_SetSpaceRenderRotationParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderRotationParams_005", nullptr,
            AudioSuiteEngine_SetSpaceRenderRotationParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_001", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_002", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_003", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_004", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_005", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderRotationParams_006", nullptr,
            AudioSuiteEngine_GetSpaceRenderRotationParams_006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderExtensionParams_001", nullptr,
            AudioSuiteEngine_SetSpaceRenderExtensionParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderExtensionParams_002", nullptr,
            AudioSuiteEngine_SetSpaceRenderExtensionParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderExtensionParams_003", nullptr,
            AudioSuiteEngine_SetSpaceRenderExtensionParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderExtensionParams_004", nullptr,
            AudioSuiteEngine_SetSpaceRenderExtensionParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_SetSpaceRenderExtensionParams_005", nullptr,
            AudioSuiteEngine_SetSpaceRenderExtensionParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_001", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_002", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_003", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_004", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_005", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngine_GetSpaceRenderExtensionParams_006", nullptr,
            AudioSuiteEngine_GetSpaceRenderExtensionParams_006, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "audiosuiteenginetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
