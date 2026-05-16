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

#include "AudioTest.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "napi/native_api.h"
#include "ohaudio/native_audio_device_base.h"
#include "ohaudio/native_audio_manager.h"
#include "ohaudio/native_audio_routing_manager.h"
#include "ohaudio/native_audio_session_manager.h"
#include "ohaudio/native_audio_stream_manager.h"
#include "ohaudio/native_audio_volume_manager.h"
#include "ohaudio/native_audiocapturer.h"
#include "ohaudio/native_audiorenderer.h"
#include "ohaudio/native_audiostream_base.h"
#include "ohaudio/native_audiostreambuilder.h"
#include <cstdint>
#include <js_native_api_types.h>

OH_AudioStreamBuilder *CreateCapturerBuilder()
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

OH_AudioStreamBuilder *CreateRenderBuilder()
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    return builder;
}

static int32_t AudioRendererOnWriteData(OH_AudioRenderer *capturer, void *userData, void *buffer, int32_t bufferLen)
{
    return 0;
}

napi_value AudioCaptureStartInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Start(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCapturePauseInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Pause(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureStopInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Stop(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureFlushInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_Flush(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetCurrentStateInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetCurrentState(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetLatencyModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetLatencyMode(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetStreamIdInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetStreamId(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetSamplingRateInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetSamplingRate(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetChannelCountInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetChannelCount(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetSampleFormatInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetSampleFormat(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetEncodingTypeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetEncodingType(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetCapturerInfoInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetCapturerInfo(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetFrameSizeInCallback(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetTimestampInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetTimestamp(nullptr, 1, nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetTimestampIllegalState(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetTimestamp(nullptr, 1, nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetFramesReadInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetFramesRead(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioCaptureGetOverflowCountInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioCapturer_GetOverflowCount(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererStartInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_Start(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererPauseInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_Pause(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererStopInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_Stop(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererFlushInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_Flush(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetCurrentStateInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetCurrentState(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetSamplingRateInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetSamplingRate(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetStreamIdInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetStreamId(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetChannelCountInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetChannelCount(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetSampleFormatInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetSampleFormat(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetLatencyModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetLatencyMode(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetRendererInfoInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetRendererInfo(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetEncodingTypeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetEncodingType(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetFramesWrittenInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetFramesWritten(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetTimestampInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetTimestamp(nullptr, 1, nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetTimestampIllegalState(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetTimestamp(nullptr, 1, nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetFrameSizeInCallback(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetSpeedInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetSpeed(nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetSpeedInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetSpeed(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetVolumeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetVolume(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetVolumeSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_SetVolume(audioRenderer, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetVolumeWithRampInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetVolumeWithRamp(nullptr, 0, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetVolumeWithRampSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_SetVolumeWithRamp(audioRenderer, 0, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetVolumeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetVolume(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetVolumeSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    float volume = 1;
    auto result = OH_AudioRenderer_GetVolume(audioRenderer, &volume);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetMarkPositionInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetMarkPosition(nullptr, 0, nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetMarkPositionSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioRenderer_OnMarkReachedCallback callback;
    auto result = OH_AudioRenderer_SetMarkPosition(audioRenderer, 1, callback, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererCancelMarkInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_CancelMark(nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererCancelMarkSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_CancelMark(audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetUnderflowCountInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetUnderflowCount(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetUnderflowCountSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    uint32_t count = 1;
    auto result = OH_AudioRenderer_GetUnderflowCount(audioRenderer, &count);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetChannelLayoutInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetChannelLayout(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetChannelLayoutSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioChannelLayout channelLayout = CH_LAYOUT_UNKNOWN;
    auto result = OH_AudioRenderer_GetChannelLayout(audioRenderer, &channelLayout);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetEffectModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetEffectMode(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetEffectModeSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioStream_AudioEffectMode effectMode = EFFECT_DEFAULT;
    auto result = OH_AudioRenderer_GetEffectMode(audioRenderer, &effectMode);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetEffectModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetEffectMode(nullptr, EFFECT_DEFAULT);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetEffectModeSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_SetEffectMode(audioRenderer, EFFECT_DEFAULT);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetRendererPrivacyInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetRendererPrivacy(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetSilentModeAndMixWithOthersInvPar(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetSilentModeAndMixWithOthers(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetSilentModeAndMixWithOthersSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_SetSilentModeAndMixWithOthers(audioRenderer, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetSilentModeAndMixWithOthersInvPar(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetSilentModeAndMixWithOthers(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetSilentModeAndMixWithOthersSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    bool on = true;
    auto result = OH_AudioRenderer_GetSilentModeAndMixWithOthers(audioRenderer, &on);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetDefaultOutputDevice(nullptr, AUDIO_DEVICE_TYPE_INVALID);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_VOICE_MESSAGE;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    OH_AudioRenderer_Start(audioRenderer);
    auto result = OH_AudioRenderer_SetDefaultOutputDevice(audioRenderer, deviceType);
    if (result == AUDIOSTREAM_SUCCESS || result == AUDIOSTREAM_ERROR_ILLEGAL_STATE) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetAudioTimestampInfoInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetAudioTimestampInfo(nullptr, 0, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_SetLoudnessGain(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_001(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMin = -90.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMin);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_002(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMin = -90.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMin + 1);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_003(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMin = -90.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMin - 1);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_004(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMax = 24.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMax);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_005(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMax = 24.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMax - 1);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererSetLoudnessGainSuccess_006(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    float loudnessGainMax = 24.0f;
    auto result = OH_AudioRenderer_SetLoudnessGain(audioRenderer, loudnessGainMax + 1);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetLoudnessGainInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioRenderer_GetLoudnessGain(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRendererGetLoudnessGainSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_SPEAKER;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnWriteData = AudioRendererOnWriteData;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);

    float loudnessGain = 0;
    auto result = OH_AudioRenderer_GetLoudnessGain(audioRenderer, &loudnessGain);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetSampleFormatInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetSampleFormat(nullptr, AUDIOSTREAM_SAMPLE_U8);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetEncodingTypeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetEncodingType(nullptr, AUDIOSTREAM_ENCODING_TYPE_RAW);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetLatencyModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetLatencyMode(nullptr, AUDIOSTREAM_LATENCY_MODE_NORMAL);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetChannelLayoutInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetChannelLayout(nullptr, CH_LAYOUT_UNKNOWN);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetChannelLayoutSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);

    auto result = OH_AudioStreamBuilder_SetChannelLayout(builder, CH_LAYOUT_UNKNOWN);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetRendererInfoInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetRendererInfo(nullptr, AUDIOSTREAM_USAGE_UNKNOWN);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetRendererCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer_Callbacks callbacks;
    auto result = OH_AudioStreamBuilder_SetRendererCallback(nullptr, callbacks, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetOutDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer_OutputDeviceChangeCallback callbacks;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(nullptr, callbacks, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCapturer_Callbacks callbacks;
    auto result = OH_AudioStreamBuilder_SetCapturerCallback(nullptr, callbacks, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetFrameSizeInCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetFrameSizeInCallback(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetWriteDataMetaCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer_WriteDataWithMetadataCallback callbacks;
    auto result = OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback(nullptr, callbacks, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetWriteDataMetaCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_WriteDataWithMetadataCallback callbacks;
    auto result = OH_AudioStreamBuilder_SetWriteDataWithMetadataCallback(builder, callbacks, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetRendererInterruptModeInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetRendererInterruptMode(nullptr, AUDIOSTREAM_INTERRUPT_MODE_SHARE);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetRendererWriteDataCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer_OnWriteDataCallback callback;
    auto result = OH_AudioStreamBuilder_SetRendererWriteDataCallback(nullptr, callback, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetWriteDataCbAdvancedInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioRenderer_OnWriteDataCallbackAdvanced callback;
    auto result = OH_AudioStreamBuilder_SetRendererWriteDataCallbackAdvanced(nullptr, callback, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetWriteDataCbAdvancedSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_OnWriteDataCallbackAdvanced callback;
    auto result = OH_AudioStreamBuilder_SetRendererWriteDataCallbackAdvanced(builder, callback, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetRendererErrorCallbackSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer_OnErrorCallback callback;
    auto result = OH_AudioStreamBuilder_SetRendererErrorCallback(builder, callback, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerReadDataCallbackSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioCapturer_OnReadDataCallback callback;
    auto result = OH_AudioStreamBuilder_SetCapturerReadDataCallback(builder, callback, 0);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerDeviceChangeCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioCapturer_OnDeviceChangeCallback callback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetCapturerDeviceChangeCallback(builder, callback, userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerInterruptCallbackSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioCapturer_OnInterruptCallback callback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetCapturerInterruptCallback(builder, callback, userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerErrorCallbackSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioCapturer_OnErrorCallback callback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetCapturerErrorCallback(builder, callback, userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSetCapturerWillMuteOnIntrptInvalidParam(napi_env env, napi_callback_info info)
{
    auto result = OH_AudioStreamBuilder_SetCapturerWillMuteWhenInterrupted(nullptr, 0);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceRoleInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceRole(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceRoleSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        OH_AudioDevice_Role deviceRole = AUDIO_DEVICE_ROLE_OUTPUT;
        result = OH_AudioDeviceDescriptor_GetDeviceRole(descriptor, &deviceRole);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceTypeInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceType(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_INVALID;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceIdInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceId(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceIdSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        uint32_t id = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceId(descriptor, &id);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceNameInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceName(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceNameSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        char *name = nullptr;
        result = OH_AudioDeviceDescriptor_GetDeviceName(descriptor, &name);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceAddressInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceAddress(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceAddressSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        char *address = nullptr;
        result = OH_AudioDeviceDescriptor_GetDeviceAddress(descriptor, &address);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceSampleRatesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(nullptr, nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceSampleRatesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        uint32_t *sampleRates = nullptr;
        uint32_t uSize = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceSampleRates(descriptor, &sampleRates, &uSize);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceChannelCountsInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(nullptr, nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceChannelCountsSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        uint32_t *channelCounts = nullptr;
        uint32_t uSize = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceChannelCounts(descriptor, &channelCounts, &uSize);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceDisplayNameInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceDisplayName(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceDisplayNameSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        char *channelCounts = nullptr;
        result = OH_AudioDeviceDescriptor_GetDeviceDisplayName(descriptor, &channelCounts);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceEncodingTypesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(nullptr, nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceGetDeviceEncodingTypesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    int size = array->size;
    for (int i = 0; i < size; i++) {
        OH_AudioDeviceDescriptor *descriptor = array->descriptors[i];
        OH_AudioStream_EncodingType *encodingTypes;
        uint32_t uSize = 0;
        result = OH_AudioDeviceDescriptor_GetDeviceEncodingTypes(descriptor, &encodingTypes, &uSize);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioGetAudioManagerInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_GetAudioManager(nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioGetAudioManagerSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioManager *audioManager = nullptr;
    OH_AudioCommon_Result result = OH_GetAudioManager(&audioManager);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioGetAudioSceneInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_GetAudioScene(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioGetAudioSceneSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioManager *audioManager = nullptr;
    OH_GetAudioManager(&audioManager);
    OH_AudioScene scene = AUDIO_SCENE_DEFAULT;
    OH_AudioCommon_Result result = OH_GetAudioScene(audioManager, &scene);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}