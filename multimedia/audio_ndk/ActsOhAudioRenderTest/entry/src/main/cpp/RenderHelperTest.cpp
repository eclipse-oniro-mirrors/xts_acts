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

#include "include/RenderHelperTest.h"
#include <ohaudio/native_audiostreambuilder.h>
#include <ohaudio/native_audio_device_base.h>
#include <ohaudio/native_audio_routing_manager.h>
#include <ohaudio/native_audio_stream_manager.h>
#include <ohaudio/native_audiorenderer.h>
#include <ohaudio/native_audiostream_base.h>
#include <vector>

namespace {
constexpr int32_t SAMPLING_RATE = 48000;
constexpr int32_t CHANNEL_COUNT = 2;
constexpr int32_t LATENCY_FORMAT = 0;
constexpr int32_t SAMPLE_FORMAT = 1;
constexpr int32_t FRAME_SIZE = 240;

// 设备类型缓存变量
static bool g_deviceTypeInitialized = false;
static bool g_isTV = false;
} // namespace

namespace Acts {
namespace AudioRender {

// CallbackSyncContext implementation
CallbackSyncContext::CallbackSyncContext(int32_t& c, std::mutex& m, std::condition_variable& cvRef)
    : count(c), mutex(m), cv(cvRef) {}

// OHAudioRendererWriteCallbackMock implementation
void OHAudioRendererWriteCallbackMock::OnWriteData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    exeCount_++;
    if (executor_) {
        executor_(renderer, userData, buffer, bufferLen);
    }
}

void OHAudioRendererWriteCallbackMock::Install(
    std::function<void(OH_AudioRenderer*, void*, void*, int32_t)> executor)
{
    executor_ = executor;
}

uint32_t OHAudioRendererWriteCallbackMock::GetExeCount()
{
    return exeCount_;
}

// Helper callback functions
int32_t AudioRendererOnWriteData(OH_AudioRenderer* capturer, void* userData, void* buffer, int32_t bufferLen)
{
    return 0;
}

void AudioRendererOnMarkReachedCb(OH_AudioRenderer* renderer, uint32_t samplePos, void* userData)
{
    g_flag = samplePos;
}

int32_t AudioRendererOnWriteDataMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    OHAudioRendererWriteCallbackMock* mockPtr = static_cast<OHAudioRendererWriteCallbackMock*>(userData);
    mockPtr->OnWriteData(renderer, userData, buffer, bufferLen);
    return 0;
}

OH_AudioData_Callback_Result OnWriteDataCallbackWithValidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

OH_AudioData_Callback_Result OnWriteDataCallbackWithInvalidData(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

int32_t OnWriteDataCbMock(OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK;
    return 0;
}

OH_AudioData_Callback_Result OnWriteDataCbWithValidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_VALID;
}

OH_AudioData_Callback_Result OnWriteDataCbWithInvalidDataMock(
    OH_AudioRenderer* renderer, void* userData, void* buffer, int32_t bufferLen)
{
    UserData* u = static_cast<UserData*>(userData);
    u->writeDataCallbackType = UserData::WRITE_DATA_CALLBACK_WITH_RESULT;
    return AUDIO_DATA_CALLBACK_RESULT_INVALID;
}

// Device detection helper
bool GetCurrentDeviceIsTV()
{
    if (g_deviceTypeInitialized) {
        return g_isTV;
    }

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

// Resource cleanup helper
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

// Loudness gain test helper
int TestLoudnessGainSetAndGet(OH_AudioRenderer* audioRenderer, float gainValue)
{
    OH_AudioStream_Result result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, gainValue);
    if (result != AUDIOSTREAM_SUCCESS) {
        return -1;
    }
    float loudnessGain = 0;
    result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (!((result == AUDIOSTREAM_SUCCESS) && (loudnessGain == gainValue))) {
        return -1;
    }
    return 0;
}

} // namespace AudioRender
} // namespace Acts
