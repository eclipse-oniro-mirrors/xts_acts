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

#include "include/AudioStreamBuilderTest.h"
#include <ohaudio/native_audiostreambuilder.h>
#include <unistd.h>
#include <cstdio>

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
const int32_t CHANNEL_COUNT_2 = 2;
const int32_t CHANNEL_COUNT_16 = 16;
const int32_t CHANNEL_COUNT_18 = 18;

const int32_t LATENCY_MODE_NORMAL = 0;
const int32_t SAMPLE_FORMAT_S16LE = 1;
const int32_t FRAME_SIZE_IN_CALLBACK = 240;
const int32_t SLEEP_TIME_ONE_SECOND = 1;
const int32_t SLEEP_TIME_TWO_SECONDS = 2;
const int32_t INVALID_INTERRUPT_MODE = -2;

FILE *g_file = nullptr;
bool g_readEnd = false;
}

const int32_t SAMPLING_RATE = SAMPLING_RATE_48000;
const int32_t CHANNEL_COUNT = CHANNEL_COUNT_2;
const int32_t g_latencyMode = LATENCY_MODE_NORMAL;
const int32_t g_sampleFormat = SAMPLE_FORMAT_S16LE;
const int32_t g_frameSize = FRAME_SIZE_IN_CALLBACK;

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
    // Just return success, do not perform any operations in interrupt callback
    (void)renderer;
    (void)userData;
    (void)type;
    (void)hint;
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

// Helper function to handle file read errors
static void HandleFileReadError()
{
    g_readEnd = true;
    if (ferror(g_file)) {
        printf("Error reading myfile");
    } else if (feof(g_file)) {
        printf("EOF found");
    }
}

// Helper function to read data from file with error handling
static bool ReadDataFromFile(void *buffer, int32_t size)
{
    size_t readCount = fread(buffer, size, 1, g_file);
    if (!readCount) {
        HandleFileReadError();
        return false;
    }
    return true;
}

// Helper function to write audio data with metadata
static int32_t WriteData(OH_AudioRenderer *renderer, void *audioData, int32_t audioDataSize,
    void *metadata, int32_t metadataSize)
{
    if (!ReadDataFromFile(audioData, audioDataSize)) {
        return 0;
    }
    ReadDataFromFile(metadata, metadataSize);
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

// Test OH_AudioStreamBuilder_Create interface with RENDERER type
int OhAudioStreamBuilderCreate001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_Create interface with CAPTURER type
int OhAudioStreamBuilderCreate002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_Destroy interface with nullptr builder
int OhAudioStreamBuilderDestroy001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with 48000 Hz
int OhAudioStreamBuilderSetParameter001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_48000;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with 44100 Hz
int OhAudioStreamBuilderSetParameter002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_44100;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with 88200 Hz
int OhAudioStreamBuilderSetParameter003()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_88200;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with 176400 Hz
int OhAudioStreamBuilderSetParameter018()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_176400;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with 192000 Hz
int OhAudioStreamBuilderSetParameter019()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_192000;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSamplingRate interface with invalid sampling rate
int OhAudioStreamBuilderSetParameter020()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t samplingRate = SAMPLING_RATE_WRONG_NUM;
    result = OH_AudioStreamBuilder_SetSamplingRate(builder, samplingRate);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetChannelCount interface with 1 channel
int OhAudioStreamBuilderSetParameter004()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t channelCount = CHANNEL_COUNT_1;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetChannelCount interface with 16 channels
int OhAudioStreamBuilderSetParameter005()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t channelCount = CHANNEL_COUNT_16;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetChannelCount interface with invalid channel count
int OhAudioStreamBuilderSetParameter006()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    int32_t channelCount = CHANNEL_COUNT_18;
    result = OH_AudioStreamBuilder_SetChannelCount(builder, channelCount);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetEncodingType interface with RAW encoding
int OhAudioStreamBuilderSetParameter007()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_RAW;
    result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with CAPTURER type (should fail)
int OhAudioStreamBuilderSetParameter008()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with VOICE_COMMUNICATION usage
int OhAudioStreamBuilderSetParameter009()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with CAPTURER type (should fail)
int OhAudioStreamBuilderSetParameter010()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererCallback interface
int OhAudioStreamBuilderSetParameter011()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, NULL);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererCallback interface with CAPTURER type (should fail)
int OhAudioStreamBuilderSetParameter012()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, NULL);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererPrivacy interface with CAPTURER type (should fail)
int OhAudioStreamBuilderSetRendererPrivacy001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PUBLIC);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererPrivacy interface with PUBLIC privacy
int OhAudioStreamBuilderSetRendererPrivacy002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PUBLIC);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererPrivacy interface with PRIVATE privacy
int OhAudioStreamBuilderSetRendererPrivacy003()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PRIVATE);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerInfo interface with MIC source
int OhAudioStreamBuilderSetParameter013()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_MIC;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerInfo interface with VOICE_RECOGNITION source
int OhAudioStreamBuilderSetParameter014()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerInfo interface with RENDERER type (should fail)
int OhAudioStreamBuilderSetParameter015()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_RECOGNITION;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerCallback interface
int OhAudioStreamBuilderSetParameter016()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerCallback interface with RENDERER type (should fail)
int OhAudioStreamBuilderSetParameter017()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioCapturer_Callbacks callbacks;
    callbacks.OH_AudioCapturer_OnReadData = AudioCapturerOnReadData;
    result = OH_AudioStreamBuilder_SetCapturerCallback(builder, callbacks, NULL);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSampleFormat interface with U8 format
int OhAudioStreamBuilderSetSampleFormat001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_U8;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSampleFormat interface with S16LE format
int OhAudioStreamBuilderSetSampleFormat002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S16LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSampleFormat interface with S24LE format
int OhAudioStreamBuilderSetSampleFormat003()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S24LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSampleFormat interface with S32LE format
int OhAudioStreamBuilderSetSampleFormat004()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S32LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetSampleFormat interface with S32LE format (duplicate test)
int OhAudioStreamBuilderSetSampleFormat005()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SampleFormat format = AUDIOSTREAM_SAMPLE_S32LE;
    result = OH_AudioStreamBuilder_SetSampleFormat(builder, format);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetLatencyMode interface with NORMAL mode
int OhAudioStreamBuilderSetLatencyMode001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    result = OH_AudioStreamBuilder_SetLatencyMode(builder, latencyMode);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerInfo interface with INVALID source type
int OhAudioStreamBuilderSetCapturerInfo001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_INVALID;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetCapturerInfo interface with VOICE_COMMUNICATION source
int OhAudioStreamBuilderSetCapturerInfo002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_VOICE_COMMUNICATION;
    result = OH_AudioStreamBuilder_SetCapturerInfo(builder, sourceType);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with UNKNOWN usage
int OhAudioStreamBuilderSetRendererInfo001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_UNKNOWN;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with MUSIC usage
int OhAudioStreamBuilderSetRendererInfo002()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInfo interface with MUSIC usage (duplicate test)
int OhAudioStreamBuilderSetRendererInfo003()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    result = OH_AudioStreamBuilder_SetRendererInfo(builder, usage);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetChannelLayout interface with UNKNOWN layout
int OhAudioStreamBuilderSetChannelLayout001()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioChannelLayout channelLayout = CH_LAYOUT_UNKNOWN;
    result = OH_AudioStreamBuilder_SetChannelLayout(builder, channelLayout);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback interface
int OhAudioStreamBuilderSetWriteDataWithMetadataCallback001()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback(builder,
        [](OH_AudioRenderer *renderer, void *userData, void *audioData, int32_t audioDataSize,
           void *metadata, int32_t metadataSize) -> int32_t {
            return WriteData(renderer, audioData, audioDataSize, metadata, metadataSize);
        }, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with nullptr builder
int OhAudioStreamBuilderSetInterruptMode001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioInterrupt_Mode mode = AUDIOSTREAM_INTERRUPT_MODE_SHARE;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

// Helper function to setup builder with common parameters
static OH_AudioStream_Result SetupBuilderWithCommonParams(OH_AudioStreamBuilder* builder)
{
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)g_latencyMode);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)g_sampleFormat);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return result;
    }

    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, g_frameSize);
    return result;
}

// Helper function to start and test two renderers
static int StartAndTestTwoRenderers(OH_AudioRenderer* renderer1, OH_AudioRenderer* renderer2)
{
    OH_AudioStream_Result result = OH_AudioRenderer_Start(renderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    sleep(SLEEP_TIME_ONE_SECOND);

    result = OH_AudioRenderer_Start(renderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Helper function to stop and release two renderers
static void StopAndReleaseTwoRenderers(OH_AudioRenderer* renderer1, OH_AudioRenderer* renderer2)
{
    OH_AudioRenderer_Stop(renderer2);
    OH_AudioRenderer_Release(renderer2);
    OH_AudioRenderer_Stop(renderer1);
    OH_AudioRenderer_Release(renderer1);
}

// Helper function to generate two renderers from builders
static int GenerateTwoRenderers(OH_AudioStreamBuilder* builder1, OH_AudioStreamBuilder* builder2,
    OH_AudioRenderer** renderer1, OH_AudioRenderer** renderer2)
{
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder1, renderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_GenerateRenderer(builder2, renderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioRenderer_Release(*renderer1);
        return -1;
    }
    return 0;
}

// Helper function to start two renderers with sleep
static int StartTwoRenderersWithSleep(OH_AudioRenderer* renderer1, OH_AudioRenderer* renderer2)
{
    OH_AudioStream_Result result = OH_AudioRenderer_Start(renderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    sleep(SLEEP_TIME_ONE_SECOND);

    result = OH_AudioRenderer_Start(renderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    sleep(SLEEP_TIME_TWO_SECONDS);
    return 0;
}

// Helper function to setup builder and set interrupt mode twice
static int SetupBuilderAndSetInterruptModeTwice(OH_AudioStreamBuilder* builder, OH_AudioInterrupt_Mode mode)
{
    OH_AudioStream_Result result = SetupBuilderWithCommonParams(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    return result == AUDIOSTREAM_SUCCESS ? 0 : -1;
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with SHARE mode
int OhAudioStreamBuilderSetInterruptMode002()
{
    OH_AudioStreamBuilder* builder1 = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    if (SetupBuilderAndSetInterruptModeTwice(builder1, AUDIOSTREAM_INTERRUPT_MODE_SHARE) != 0) {
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    OH_AudioRenderer* audioRenderer1 = nullptr;
    OH_AudioRenderer* audioRenderer2 = nullptr;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    result = OH_AudioStreamBuilder_GenerateRenderer(builder1, &audioRenderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioRenderer_Release(audioRenderer1);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    if (StartAndTestTwoRenderers(audioRenderer1, audioRenderer2) != 0) {
        StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
    result = OH_AudioStreamBuilder_Destroy(builder1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Helper function to generate and start two renderers from same builder
static int GenerateAndStartTwoRenderersFromBuilder(OH_AudioStreamBuilder* builder,
    OH_AudioRenderer** renderer1, OH_AudioRenderer** renderer2)
{
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, renderer1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_GenerateRenderer(builder, renderer2);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioRenderer_Release(*renderer1);
        return -1;
    }

    return StartTwoRenderersWithSleep(*renderer1, *renderer2);
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode interface with INDEPENDENT mode
int OhAudioStreamBuilderSetInterruptMode003()
{
    OH_AudioStreamBuilder* builder1 = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    if (SetupBuilderAndSetInterruptModeTwice(builder1, AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT) != 0) {
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    OH_AudioRenderer* audioRenderer1 = nullptr;
    OH_AudioRenderer* audioRenderer2 = nullptr;
    if (GenerateAndStartTwoRenderersFromBuilder(builder1, &audioRenderer1, &audioRenderer2) != 0) {
        StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
    result = OH_AudioStreamBuilder_Destroy(builder1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Helper function to create and setup two builders
static int CreateAndSetupTwoBuilders(OH_AudioStreamBuilder** builder1, OH_AudioStreamBuilder** builder2)
{
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(builder1, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_Create(builder2, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(*builder1);
        return -1;
    }

    result = SetupBuilderWithCommonParams(*builder1);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(*builder2);
        OH_AudioStreamBuilder_Destroy(*builder1);
        return -1;
    }

    result = SetupBuilderWithCommonParams(*builder2);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(*builder2);
        OH_AudioStreamBuilder_Destroy(*builder1);
        return -1;
    }

    return 0;
}

// Helper function to set interrupt modes for two builders
static int SetInterruptModesForTwoBuilders(OH_AudioStreamBuilder* builder1, OH_AudioStreamBuilder* builder2,
    OH_AudioInterrupt_Mode mode1, OH_AudioInterrupt_Mode mode2)
{
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder1, mode1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder2, mode2);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode with INDEPENDENT and SHARE modes
int OhAudioStreamBuilderSetRendererInterruptMode004()
{
    OH_AudioStreamBuilder* builder1 = nullptr;
    OH_AudioStreamBuilder* builder2 = nullptr;

    if (CreateAndSetupTwoBuilders(&builder1, &builder2) != 0) {
        return -1;
    }

    if (SetInterruptModesForTwoBuilders(builder1, builder2,
        AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT, AUDIOSTREAM_INTERRUPT_MODE_SHARE) != 0) {
        OH_AudioStreamBuilder_Destroy(builder2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    OH_AudioRenderer* audioRenderer1 = nullptr;
    OH_AudioRenderer* audioRenderer2 = nullptr;
    if (GenerateTwoRenderers(builder1, builder2, &audioRenderer1, &audioRenderer2) != 0) {
        OH_AudioStreamBuilder_Destroy(builder2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    if (StartTwoRenderersWithSleep(audioRenderer1, audioRenderer2) != 0) {
        StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
        OH_AudioStreamBuilder_Destroy(builder2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
    OH_AudioStreamBuilder_Destroy(builder2);
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Destroy(builder1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Helper function to setup builder with callbacks and switch interrupt modes
static int SetupBuilderWithCallbacksAndSwitchModes(OH_AudioStreamBuilder* builder)
{
    OH_AudioStream_Result result = SetupBuilderWithCommonParams(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataInterrupt;
    callbacks.OH_AudioRenderer_OnInterruptEvent = AudioRendererInterruptEvent;
    result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, AUDIOSTREAM_INTERRUPT_MODE_SHARE);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, AUDIOSTREAM_INTERRUPT_MODE_INDEPENDENT);
    return result == AUDIOSTREAM_SUCCESS ? 0 : -1;
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode switching between SHARE and INDEPENDENT
int OhAudioStreamBuilderSetRendererInterruptMode005()
{
    OH_AudioStreamBuilder* builder1 = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder1, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    if (SetupBuilderWithCallbacksAndSwitchModes(builder1) != 0) {
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    OH_AudioRenderer* audioRenderer1 = nullptr;
    OH_AudioRenderer* audioRenderer2 = nullptr;
    if (GenerateAndStartTwoRenderersFromBuilder(builder1, &audioRenderer1, &audioRenderer2) != 0) {
        StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
        OH_AudioStreamBuilder_Destroy(builder1);
        return -1;
    }

    StopAndReleaseTwoRenderers(audioRenderer1, audioRenderer2);
    result = OH_AudioStreamBuilder_Destroy(builder1);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererInterruptMode with invalid interrupt mode
int OhAudioStreamBuilderSetInterruptMode006()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioInterrupt_Mode mode = (OH_AudioInterrupt_Mode)(INVALID_INTERRUPT_MODE);
    result = OH_AudioStreamBuilder_SetRendererInterruptMode(builder, mode);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererWriteDataCallback with VALID result
int OhAudioStreamBuilderSetRendererWriteDataCallback001()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererWriteDataCallback with INVALID result
int OhAudioStreamBuilderSetRendererWriteDataCallback002()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererWriteDataCallback with CAPTURER type (should fail)
int OhAudioStreamBuilderSetRendererWriteDataCallback003()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

// Test OH_AudioStreamBuilder_SetRendererWriteDataCallback with CAPTURER type (should fail)
int OhAudioStreamBuilderSetRendererWriteDataCallback004()
{
    OH_AudioStreamBuilder *builder = nullptr;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        OH_AudioStreamBuilder_Destroy(builder);
        return -1;
    }

    result = OH_AudioStreamBuilder_Destroy(builder);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

} // namespace AudioStandard
} // namespace OHOS
