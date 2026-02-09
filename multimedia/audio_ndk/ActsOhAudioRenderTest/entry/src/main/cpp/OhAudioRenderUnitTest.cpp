/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "include/OhAudioRenderUnitTest.h"
#include <atomic>
#include <chrono>
#include <cmath>
#include <condition_variable>
#include <functional>
#include <mutex>
#include <ohaudio/native_audio_device_base.h>
#include <ohaudio/native_audio_routing_manager.h>
#include <ohaudio/native_audio_stream_manager.h>
#include <ohaudio/native_audiorenderer.h>
#include <thread>
#include <unistd.h>
#include <vector>
#include "include/OhosCommonTest.h"

using namespace std::chrono;

namespace {
    constexpr int32_t SAMPLE_RATE_48000 = 48000;
    constexpr int32_t CHANNEL_2 = 2;
    constexpr int32_t SAMPLING_RATE = 48000;
    constexpr int32_t CHANNEL_COUNT = 2;
    constexpr int32_t LATENCY_FORMAT = 0;
    constexpr int32_t SAMPLE_FORMAT = 1;
    constexpr int32_t FRAME_SIZE = 240;
    constexpr float MAX_AUDIO_VOLUME = 1.0f;
    constexpr float MIN_AUDIO_VOLUME = 0.0f;
    constexpr int32_t DURATIONMS = 40;
constexpr int32_t DELAY_TIME_SECONDS = 2;
constexpr float DEFAULT_VOLUME = -0.5f;
constexpr float MUTE_VOLUME = -1.5f;
constexpr float VALID_TEST_VOLUME = 0.5f;
constexpr float OUT_OF_RANGE_VOLUME = 1.5f;
constexpr auto CALLBACK_WAIT_TIMEOUT = 1s; // 回调等待超时时间：1秒
constexpr int32_t MIN_CALLBACK_COUNT = 10; // 等待的最小回调次数阈值
constexpr uint32_t FLAG_INITIAL = 0;       // 标记位置初始状态
constexpr uint32_t FLAG_STARTED = 1;       // 标记位置第一状态
constexpr uint32_t FLAG_RUNNING = 2;       // 标记位置第二状态
uint32_t g_flag = FLAG_INITIAL;
// 设备类型缓存变量
static bool g_deviceTypeInitialized = false;
static bool g_isTV = false;
} // namespace

namespace Acts {
namespace AudioRender {

// Callback synchronization context structure
struct CallbackSyncContext {
    int32_t& count;
    std::mutex& mutex;
    std::condition_variable& cv;

    CallbackSyncContext(int32_t& c, std::mutex& m, std::condition_variable& cvRef) : count(c), mutex(m), cv(cvRef) {}
};

// Helper callback functions
static int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer, void* userData, void* buffer, int32_t bufferLen)
{
    return 0;
}

static void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData)
{
    g_flag = samplePos;
}

// Mock class for write callback
class OHAudioRendererWriteCallbackMock {
public:
    void OnWriteData(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
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
    std::atomic<uint32_t> exeCount_{ 0 };
};

static int32_t AudioRendererOnWriteDataMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    OHAudioRendererWriteCallbackMock* mockPtr = static_cast<OHAudioRendererWriteCallbackMock*>(userData);
    mockPtr->OnWriteData(renderer, userData, buffer, bufferLen);
    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithValidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCallbackWithInvalidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

struct UserData {
    enum { WRITE_DATA_CALLBACK, WRITE_DATA_CALLBACK_WITH_RESULT } writeDataCallbackType;
};

static int32_t OnWriteDataCbMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK;
    return 0;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithValidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

static OH_AudioData_Callback_Result OnWriteDataCbWithInvalidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

// Device detection helper
bool GetCurrentDeviceIsTV()
{
    // 如果已经初始化，直接返回缓存值
    if (g_deviceTypeInitialized) {
        return g_isTV;
    }

    // 原有的设备查询逻辑
    OH_AudioRoutingManager* audioRoutingManager = nullptr;
    OH_AudioDevice_Flag deviceFlage = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray* audioDeviceDescriptorArray = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);

    OH_AudioCommon_Result res =
        OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlage, &audioDeviceDescriptorArray);
    if (res != OH_AudioCommon_Result::AUDIOCOMMON_RESULT_SUCCESS) {
        g_isTV = false;
        g_deviceTypeInitialized = true;
        return false;
    }

    OH_AudioDevice_Type deviceType;
    std::vector<uint8_t> deviceTypes;
    for (size_t i = 0; i < audioDeviceDescriptorArray->size; i++) {
        OH_AudioDeviceDescriptor_GetDeviceType(audioDeviceDescriptorArray->descriptors[i], &deviceType);
        deviceTypes.push_back(deviceType);
    }

    bool isTVDevice = false;
    for (auto& device : deviceTypes) {
        if (!isTVDevice && device == AUDIO_DEVICE_TYPE_DISPLAY_PORT) {
            isTVDevice = true;
            break;
        }
    }
    
    // 缓存结果
    g_isTV = isTVDevice;
    g_deviceTypeInitialized = true;
    return isTVDevice;
}

// Builder helpers
OH_AudioStreamBuilder* CreateRenderBuilder()
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

OH_AudioStreamBuilder* InitRenderBuilder()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);
    return builder;
}

// Forward declarations
static int CreateGameUsageRendererWithCallback(OH_AudioStreamBuilder** builder,
                                               OH_AudioRenderer** audioRenderer,
                                               OHAudioRendererWriteCallbackMock* writeCallbackMock);

void CleanupAudioResources(OH_AudioStreamBuilder* builder, OH_AudioRenderer* audioRenderer)
{
    OH_AudioStream_Result result = OH_AudioRenderer_Stop(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return;
    }
    OH_AudioStreamBuilder_Destroy(builder);
}

// Test functions - Category 1: Renderer Creation Tests (2)
int OhAudioRenderGenerate001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGenerate002()
{
    OH_AudioStreamBuilder* builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_Create(&builder, type);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

// Category 2: Lifecycle Control Tests (13)
int OhAudioRenderStart001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }

    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderStart002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderPause001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    result = OH_AudioRenderer_Pause(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderPause002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Pause(audioRenderer);
    if (result != AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderStop001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    result = OH_AudioRenderer_Stop(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderStop002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Stop(audioRenderer);
    if (result != AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderFlush001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    result = OH_AudioRenderer_Flush(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderFlush002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Flush(audioRenderer);
    if (result != AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        return -1;
    }
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderRelease001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_Start(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetCurrentState001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (state != AUDIOSTREAM_STATE_PREPARED) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetCurrentState002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (state != AUDIOSTREAM_STATE_RUNNING) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetCurrentState003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Pause(audioRenderer);
    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (state != AUDIOSTREAM_STATE_PAUSED) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetCurrentState004()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioRenderer_Start(audioRenderer);
    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioStream_State state;
    result = OH_AudioRenderer_GetCurrentState(audioRenderer, &state);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (state != AUDIOSTREAM_STATE_STOPPED) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Category 3: Parameter Getter Tests (10)
int OhAudioRenderGetParameter001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_LatencyMode latencyMode = AUDIOSTREAM_LATENCY_MODE_NORMAL;
    result = OH_AudioRenderer_GetLatencyMode(audioRenderer, &latencyMode);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (latencyMode != AUDIOSTREAM_LATENCY_MODE_NORMAL) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetParameter002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t streamId;
    result = OH_AudioRenderer_GetStreamId(audioRenderer, &streamId);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetSamplingRate001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    int32_t rate;
    result = OH_AudioRenderer_GetSamplingRate(audioRenderer, &rate);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (rate != SAMPLE_RATE_48000) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetSampleFormat()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_SampleFormat sampleFormat;
    result = OH_AudioRenderer_GetSampleFormat(audioRenderer, &sampleFormat);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (sampleFormat != AUDIOSTREAM_SAMPLE_S16LE) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetEncodingType001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_EncodingType encodingType;
    result = OH_AudioRenderer_GetEncodingType(audioRenderer, &encodingType);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (encodingType != AUDIOSTREAM_ENCODING_TYPE_RAW) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetRendererInfo001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_Usage usage;
    result = OH_AudioRenderer_GetRendererInfo(audioRenderer, &usage);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (usage != AUDIOSTREAM_USAGE_MUSIC) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetRendererPrivacy001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_PrivacyType privacyType;
    result = OH_AudioRenderer_GetRendererPrivacy(audioRenderer, &privacyType);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (privacyType != AUDIO_STREAM_PRIVACY_TYPE_PUBLIC) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetRendererPrivacy002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioStream_Result privacyResult =
        OH_AudioStreamBuilder_SetRendererPrivacy(builder, AUDIO_STREAM_PRIVACY_TYPE_PRIVATE);
    if (privacyResult != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_PrivacyType privacyType;
    result = OH_AudioRenderer_GetRendererPrivacy(audioRenderer, &privacyType);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (privacyType != AUDIO_STREAM_PRIVACY_TYPE_PRIVATE) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetChannelLayout001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioChannelLayout channelLayout;
    result = OH_AudioRenderer_GetChannelLayout(audioRenderer, &channelLayout);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (channelLayout != CH_LAYOUT_UNKNOWN) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRendererGetEffectMode001()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_AudioEffectMode effectMode;
    result = OH_AudioRenderer_SetEffectMode(audioRenderer, EFFECT_DEFAULT);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_GetEffectMode(audioRenderer, &effectMode);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (effectMode != EFFECT_DEFAULT) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Category 4: Volume Control Tests (10)
int OhAudioRenderGetVolume001()
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volume;
    OH_AudioStream_Result result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioRenderGetVolume002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volume;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetVolume003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = VALID_TEST_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (volumeGet != VALID_TEST_VOLUME) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderGetVolume004()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = VALID_TEST_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    volumeSet = OUT_OF_RANGE_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    float volumeGet;
    result = OH_AudioRenderer_GetVolume(audioRenderer, &volumeGet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (volumeGet != VALID_TEST_VOLUME) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetVolume001()
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = VALID_TEST_VOLUME;
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioRenderSetVolume002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = VALID_TEST_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetVolume003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = MIN_AUDIO_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    volumeSet = MAX_AUDIO_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetVolume004()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = DEFAULT_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    volumeSet = MUTE_VOLUME;
    result = OH_AudioRenderer_SetVolume(audioRenderer, volumeSet);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetVolumeWithRamp001()
{
    OH_AudioRenderer* audioRenderer = nullptr;
    float volumeSet = MIN_AUDIO_VOLUME;
    int32_t durationMs = DURATIONMS;
    OH_AudioStream_Result result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioRenderSetVolumeWithRamp002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float volumeSet = MIN_AUDIO_VOLUME;
    int32_t durationMs = DURATIONMS;
    result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, volumeSet, durationMs);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Category 5: Mark Position Tests (8)
int OhAudioRenderSetMarkPosition001()
{
    OH_AudioRenderer* audioRenderer = nullptr;
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    OH_AudioStream_Result result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioRenderSetMarkPosition002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetMarkPosition003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 0;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetMarkPosition004()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);
    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (g_flag != FLAG_INITIAL) {
        return -1;
    }
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (g_flag != FLAG_STARTED) {
        return -1;
    }
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetMarkPosition005()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);
    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 1;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (g_flag != FLAG_STARTED) {
        return -1;
    }
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderCancelMark001()
{
    OH_AudioRenderer* audioRenderer = nullptr;
    OH_AudioStream_Result result = OH_AudioRenderer_CancelMark(audioRenderer);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioRenderCancelMark002()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderCancelMark003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
    OH_AudioStreamBuilder_SetSamplingRate(builder, SAMPLING_RATE);
    OH_AudioStreamBuilder_SetChannelCount(builder, CHANNEL_COUNT);
    OH_AudioStreamBuilder_SetLatencyMode(builder, (OH_AudioStream_LatencyMode)LATENCY_FORMAT);
    OH_AudioStreamBuilder_SetSampleFormat(builder, (OH_AudioStream_SampleFormat)SAMPLE_FORMAT);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);
    result = OH_AudioStreamBuilder_SetFrameSizeInCallback(builder, FRAME_SIZE);
    OH_AudioRenderer* audioRenderer;
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    uint32_t samplePos = 2;
    OH_AudioRenderer_OnMarkReachedCallback callback = AudioRendererOnMarkReachedCb;
    result = OH_AudioRenderer_SetMarkPosition(audioRenderer, samplePos, callback, nullptr);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (g_flag != FLAG_RUNNING) {
        return -1;
    }
    result = OH_AudioRenderer_CancelMark(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Stop(audioRenderer);
    result = OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

static void InstallShortDelayCallback(OHAudioRendererWriteCallbackMock* writeCallbackMock,
                                      int32_t& count,
                                      std::mutex& mutex,
                                      std::condition_variable& cv)
{
    writeCallbackMock->Install(
        [&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen) {
            std::lock_guard<std::mutex> lock(mutex);
            cv.notify_one();
            if (count == 1) {
                std::this_thread::sleep_for(200ms);
            }
            count++;
        });
}

static int StartAndWaitForCallback(OH_AudioRenderer* audioRenderer,
                                   std::mutex& mutex,
                                   std::condition_variable& cv,
                                   int32_t& count,
                                   int32_t minCount)
{
    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    std::unique_lock<std::mutex> lock(mutex);
    cv.wait_for(lock, CALLBACK_WAIT_TIMEOUT, [&count, minCount] { return count > minCount; });
    lock.unlock();
    return 0;
}

static int ValidateInitialUnderflowCount(OH_AudioRenderer* audioRenderer)
{
    uint32_t underFlowCount;
    OH_AudioStream_Result result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (GetCurrentDeviceIsTV()) {
        if (underFlowCount < 0) {
            return -1;
        }
    } else {
        if (underFlowCount < 1) {
            return -1;
    }
    }
    return 0;
}

int OhAudioRendererGetUnderflowCount001()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    OHAudioRendererWriteCallbackMock writeCallbackMock;

    if (CreateGameUsageRendererWithCallback(&builder, &audioRenderer, &writeCallbackMock) != 0) {
        return -1;
    }

    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;

    InstallShortDelayCallback(&writeCallbackMock, count, mutex, cv);

    if (StartAndWaitForCallback(audioRenderer, mutex, cv, count, 1) != 0) {
        CleanupAudioResources(builder, audioRenderer);
        return -1;
    }

    if (ValidateInitialUnderflowCount(audioRenderer) != 0) {
        CleanupAudioResources(builder, audioRenderer);
        return -1;
    }

    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

static int CreateGameUsageRendererWithCallback(OH_AudioStreamBuilder** builder,
                                               OH_AudioRenderer** audioRenderer,
                                               OHAudioRendererWriteCallbackMock* writeCallbackMock)
{
    *builder = CreateRenderBuilder();
    OH_AudioStreamBuilder_SetSamplingRate(*builder, SAMPLE_RATE_48000);
    OH_AudioStreamBuilder_SetChannelCount(*builder, CHANNEL_2);
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_GAME;
    OH_AudioStreamBuilder_SetRendererInfo(*builder, usage);
    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteDataMock;
    OH_AudioStreamBuilder_SetRendererCallback(*builder, callbacks, writeCallbackMock);
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(*builder, audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    return 0;
}

static int InstallDelayedWriteCallback(OH_AudioRenderer* audioRenderer,
                                       OHAudioRendererWriteCallbackMock* writeCallbackMock)
{
    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;
    writeCallbackMock->Install(
        [&count, &mutex, &cv](OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen) {
            std::lock_guard<std::mutex> lock(mutex);
            cv.notify_one();
            if (count == 0) {
                std::this_thread::sleep_for(200ms);
            }
            count++;
        });
    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    std::unique_lock<std::mutex> lock(mutex);
    bool timeout = !cv.wait_for(lock, CALLBACK_WAIT_TIMEOUT, [&count] { return count > 1; });
    lock.unlock();
    
    // 如果超时，返回失败
    if (timeout) {
        return -1;
    }
    
    return 0;
}

static int ValidateUnderflowCountResult(OH_AudioRenderer* audioRenderer)
{
    uint32_t underFlowCount;
    OH_AudioStream_Result result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (GetCurrentDeviceIsTV()) {
        if (underFlowCount < 0) {
            return -1;
        }
    } else {
        if (underFlowCount <= 0) {
            return -1;
        }
    }
    return 0;
}

int OhAudioRendererGetUnderflowCount003()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (underFlowCount != 0) {
        return -1;
    }
    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

static int CreateRendererWithCallback(OH_AudioStreamBuilder** builder,
                                      OH_AudioRenderer** audioRenderer,
                                      OHAudioRendererWriteCallbackMock* writeCallbackMock)
{
    if (CreateGameUsageRendererWithCallback(builder, audioRenderer, writeCallbackMock) != 0) {
        return -1;
    }
    return 0;
}

static int InitializeRendererBase(std::chrono::milliseconds sleepTime,
                                  OH_AudioStreamBuilder** builder,
                                  OH_AudioRenderer** audioRenderer,
                                  OHAudioRendererWriteCallbackMock* writeCallbackMock)
{
    if (CreateRendererWithCallback(builder, audioRenderer, writeCallbackMock) != 0) {
        return -1;
    }
    return 0;
}

static int InitializeRendererWithDelayCallback(std::chrono::milliseconds sleepTime,
                                               OH_AudioStreamBuilder** builder,
                                               OH_AudioRenderer** audioRenderer,
                                               OHAudioRendererWriteCallbackMock* writeCallbackMock,
                                               CallbackSyncContext& syncContext)
{
    if (InitializeRendererBase(sleepTime, builder, audioRenderer, writeCallbackMock) != 0) {
        return -1;
    }
    writeCallbackMock->Install(
        [&syncContext, sleepTime](OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen) {
            std::lock_guard<std::mutex> lock(syncContext.mutex);
            syncContext.cv.notify_one();
            if (syncContext.count == 1) {
                std::this_thread::sleep_for(sleepTime);
            }
            syncContext.count++;
        });
    return 0;
}

static int StartRendererAndWait(OH_AudioRenderer* audioRenderer,
                                std::mutex& mutex,
                                std::condition_variable& cv,
                                int32_t& count)
{
    OH_AudioStream_Result result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
        std::unique_lock<std::mutex> lock(mutex);
    cv.wait_for(lock, CALLBACK_WAIT_TIMEOUT, [&count] { return count > MIN_CALLBACK_COUNT; });
        lock.unlock();
    return 0;
}

static int ValidateUnderflowCount(OH_AudioRenderer* audioRenderer, uint32_t* lastUnderFlowCount)
{
        uint32_t underFlowCount = 0;
    OH_AudioStream_Result result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
        if (GetCurrentDeviceIsTV()) {
        if (underFlowCount < *lastUnderFlowCount) {
            return -1;
        }
        } else {
        if (underFlowCount <= *lastUnderFlowCount) {
            return -1;
        }
    }
    *lastUnderFlowCount = underFlowCount;
    return 0;
}

static int TestUnderflowCountWithDelay(std::chrono::milliseconds sleepTime, uint32_t* lastUnderFlowCount)
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    OHAudioRendererWriteCallbackMock writeCallbackMock;
    std::mutex mutex;
    std::condition_variable cv;
    int32_t count = 0;

    CallbackSyncContext syncContext(count, mutex, cv);
    if (InitializeRendererWithDelayCallback(sleepTime, &builder, &audioRenderer, &writeCallbackMock, syncContext) !=
        0) {
        return -1;
    }

    if (StartRendererAndWait(audioRenderer, mutex, cv, count) != 0) {
        CleanupAudioResources(builder, audioRenderer);
        return -1;
    }

    if (ValidateUnderflowCount(audioRenderer, lastUnderFlowCount) != 0) {
        CleanupAudioResources(builder, audioRenderer);
        return -1;
    }

    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRendererGetUnderflowCount004()
{
    uint32_t lastUnderFlowCount = 0;
    for (auto sleepTimes : { 200ms, 400ms, 600ms }) {
        if (TestUnderflowCountWithDelay(sleepTimes, &lastUnderFlowCount) != 0) {
            return -1;
        }
    }
    return 0;
}

int OhAudioRendererGetUnderflowCount005()
{
    OH_AudioStreamBuilder* builder = CreateRenderBuilder();
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    std::this_thread::sleep_for(CALLBACK_WAIT_TIMEOUT);
    uint32_t underFlowCount;
    result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &underFlowCount);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    if (underFlowCount != 0) {
        return -1;
    }
    OH_AudioRenderer_Stop(audioRenderer);
    OH_AudioRenderer_Release(audioRenderer);
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Category 7: Write Data Callback Tests (6)
int OhAudioRenderWriteDataCallback001()
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();
    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithValidData;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRenderWriteDataCallback002()
{
    OH_AudioStreamBuilder* builder = InitRenderBuilder();
    OH_AudioRenderer_OnWriteDataCallback callback = OnWriteDataCallbackWithInvalidData;
    OH_AudioStreamBuilder_SetRendererWriteDataCallback(builder, callback, nullptr);
    OH_AudioRenderer* audioRenderer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRenderWriteDataCallback003()
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (userData.writeDataCallbackType != UserData::WRITE_DATA_CALLBACK_WITH_RESULT) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRenderWriteDataCallback004()
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (userData.writeDataCallbackType != UserData::WRITE_DATA_CALLBACK_WITH_RESULT) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRenderWriteDataCallback005()
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (userData.writeDataCallbackType != UserData::WRITE_DATA_CALLBACK) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

int OhAudioRenderWriteDataCallback006()
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
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_Start(audioRenderer);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (userData.writeDataCallbackType != UserData::WRITE_DATA_CALLBACK) {
        return -1;
    }
    CleanupAudioResources(builder, audioRenderer);
    return 0;
}

// Category 8: Loudness Gain Set Tests (22)
int OhAudioRenderSetLoudnessGain006()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, -90.1f);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain007()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.1f);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain008()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_AUDIOBOOK);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(nullptr, 24.0f);
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain010()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_COMMUNICATION);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain011()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_ASSISTANT);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain012()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_ALARM);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain013()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VOICE_MESSAGE);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain014()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_RINGTONE);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain015()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_NOTIFICATION);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain017()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_GAME);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain018()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_NAVIGATION);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

int OhAudioRenderSetLoudnessGain019()
{
    OH_AudioStreamBuilder* builder = nullptr;
    OH_AudioRenderer* audioRenderer = nullptr;
    auto result = OH_AudioStreamBuilder_Create(&builder, AUDIOSTREAM_TYPE_RENDERER);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_SetLatencyMode(builder, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    OH_AudioStreamBuilder_SetRendererInfo(builder, AUDIOSTREAM_USAGE_VIDEO_COMMUNICATION);
    result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 24.0f);
    if (result != AUDIOSTREAM_ERROR_INVALID_PARAM) {
        return -1;
    }
    std::this_thread::sleep_for(std::chrono::seconds(DELAY_TIME_SECONDS));
    float loudnessGain = 1;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == 0))) {
        return -1;
    }
    result = OH_AudioRenderer_Release(audioRenderer);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    OH_AudioStreamBuilder_Destroy(builder);
    return 0;
}

// Category 10: Stream Manager Tests (2)
int OhAudioStreamManagerIsAcousticEchoCancelerSupported001()
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);
    if (ret != AUDIOCOMMON_RESULT_SUCCESS) {
        return -1;
    }
    if (streamManager == nullptr) {
        return -1;
    }
    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(nullptr, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    if (ret != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        return -1;
    }
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, nullptr);
    if (ret != AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        return -1;
    }
    return 0;
}

int OhAudioStreamManagerIsAcousticEchoCancelerSupported002()
{
    OH_AudioStreamManager* streamManager = nullptr;
    OH_AudioCommon_Result ret = OH_AudioManager_GetAudioStreamManager(&streamManager);
    if (ret != AUDIOCOMMON_RESULT_SUCCESS) {
        return -1;
    }
    if (streamManager == nullptr) {
        return -1;
    }
    bool supported;
    ret = OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    if (ret != AUDIOCOMMON_RESULT_SUCCESS) {
        return -1;
    }
    if (supported != false) {
        return -1;
    }
    return 0;
}

} // namespace AudioRender
} // namespace Acts
