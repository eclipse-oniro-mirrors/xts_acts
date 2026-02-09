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

#include "Audio1Test.h"
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
#include <js_native_api_types.h>

napi_value AudioRoutingGetAudioRoutingManagerSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    result = OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetDevicesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioRoutingManager_GetDevices(nullptr, AUDIO_DEVICE_FLAG_NONE, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetDevicesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetAvailableDevicesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_GetAvailableDevices(nullptr, AUDIO_DEVICE_USAGE_MEDIA_OUTPUT, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetAvailableDevicesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, AUDIO_DEVICE_USAGE_MEDIA_OUTPUT, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetPreferredOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_GetPreferredOutputDevice(nullptr, AUDIOSTREAM_USAGE_UNKNOWN, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetPreferredOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioRoutingManager_GetPreferredOutputDevice(audioRoutingManager, AUDIOSTREAM_USAGE_UNKNOWN, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetPreferredInputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_GetPreferredInputDevice(nullptr, AUDIOSTREAM_SOURCE_TYPE_MIC, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingGetPreferredInputDeviceSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioRoutingManager_GetPreferredInputDevice(audioRoutingManager, AUDIOSTREAM_SOURCE_TYPE_MIC, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingRegisterDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_RegisterDeviceChangeCallback(nullptr, AUDIO_DEVICE_FLAG_ALL, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingRegisterDeviceChangeCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioRoutingManager_OnDeviceChangedCallback callback;
    result = OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingUnregisterDeviceChangeCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioRoutingManager_UnregisterDeviceChangeCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingUnregisterDeviceChangeCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    OH_AudioRoutingManager_OnDeviceChangedCallback callback;
    result = OH_AudioRoutingManager_UnregisterDeviceChangeCallback(audioRoutingManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingReleaseDevicesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioRoutingManager_ReleaseDevices(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingReleaseDevicesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioRoutingManager_ReleaseDevices(audioRoutingManager, array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingIsMicBlockDetectionSupInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioRoutingManager_IsMicBlockDetectionSupported(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRoutingSetMicBlockStatusCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    void *userData;
    OH_AudioCommon_Result result = OH_AudioRoutingManager_SetMicBlockStatusCallback(nullptr, nullptr, userData);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionGetAudioSessionManagerSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    result = OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionActivateAudioSessionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_ActivateAudioSession(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionActivateAudioSessionSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_Strategy strategy = {CONCURRENCY_DEFAULT};
    result = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionActivateAudioSessionIllegalState(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_Strategy *strategy;
    result = OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, strategy);
    if (result == AUDIOCOMMON_RESULT_ERROR_ILLEGAL_STATE) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionDeactivateAudioSessionInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_DeactivateAudioSession(nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionDeactivateAudioSessionSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_Strategy strategy = {CONCURRENCY_DEFAULT};
    OH_AudioSessionManager_ActivateAudioSession(audioSessionManager, &strategy);
    result = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionDeactivateAudioSessionIllegalState(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    result = OH_AudioSessionManager_DeactivateAudioSession(audioSessionManager);
    if (result == AUDIOCOMMON_RESULT_ERROR_ILLEGAL_STATE) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionRegisterSessionDeactivatedCbInvPar(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_RegisterSessionDeactivatedCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionRegisterSessionDeactivatedCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_DeactivatedCallback callback;
    result = OH_AudioSessionManager_RegisterSessionDeactivatedCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterSessionDeactivatedCbInvPar(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterSessionDeactivatedCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_DeactivatedCallback callback;
    result = OH_AudioSessionManager_UnregisterSessionDeactivatedCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionSetSceneInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_SetScene(nullptr, AUDIO_SESSION_SCENE_MEDIA);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionSetSceneSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    result = OH_AudioSessionManager_SetScene(audioSessionManager, AUDIO_SESSION_SCENE_MEDIA);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

void AudioSessionStateChangedCallback(OH_AudioSession_StateChangedEvent event){};

napi_value AudioSessionRegisterStateChangeCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_RegisterStateChangeCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionRegisterStateChangeCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, AudioSessionStateChangedCallback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterStateChangeCbInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_UnregisterStateChangeCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterStateChangeCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, AudioSessionStateChangedCallback);
    result =
        OH_AudioSessionManager_UnregisterStateChangeCallback(audioSessionManager, AudioSessionStateChangedCallback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionSetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_SetDefaultOutputDevice(nullptr, AUDIO_DEVICE_TYPE_DEFAULT);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionSetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    result = OH_AudioSessionManager_SetDefaultOutputDevice(audioSessionManager, AUDIO_DEVICE_TYPE_DEFAULT);
    if (result == AUDIOCOMMON_RESULT_SUCCESS || result == AUDIOCOMMON_RESULT_ERROR_SYSTEM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionGetDefaultOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_DEFAULT;
    OH_AudioCommon_Result result = OH_AudioSessionManager_GetDefaultOutputDevice(nullptr, &deviceType);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionGetDefaultOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_DEFAULT;
    result = OH_AudioSessionManager_GetDefaultOutputDevice(audioSessionManager, &deviceType);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionReleaseDevicesInvalidParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_ReleaseDevices(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionReleaseDevicesSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDeviceDescriptorArray *array = nullptr;
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_ALL;
    OH_AudioRoutingManager_GetDevices(audioRoutingManager, deviceFlag, &array);
    result = OH_AudioSessionManager_ReleaseDevices(audioSessionManager, array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionRegisterCurOutDevChgCbInvParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(nullptr, nullptr);
    OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

void AudioSessionCurrentOutputDeviceChangedCallback(
    OH_AudioDeviceDescriptorArray *devices, OH_AudioStream_DeviceChangeReason changeReason,
    OH_AudioSession_OutputDeviceChangeRecommendedAction recommendedAction){};

napi_value AudioSessionRegisterCurOutDevChgCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(
        audioSessionManager, AudioSessionCurrentOutputDeviceChangedCallback);
    OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback(audioSessionManager,
                                                                       AudioSessionCurrentOutputDeviceChangedCallback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterCurOutDevChgCbInvParam(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result = OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback(nullptr, nullptr);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionUnregisterCurOutDevChgCbSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(audioSessionManager,
                                                                     AudioSessionCurrentOutputDeviceChangedCallback);
    result = OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback(
        audioSessionManager, AudioSessionCurrentOutputDeviceChangedCallback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionGetDirectPlaybackSupportSuccess(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioStreamManager *audioStreamManager;
    OH_AudioManager_GetAudioStreamManager(&audioStreamManager);
    OH_AudioStreamInfo streamInfo;
    streamInfo.samplingRate = 1;
    OH_AudioStream_DirectPlaybackMode directPlaybackMode = AUDIOSTREAM_DIRECT_PLAYBACK_NOT_SUPPORTED;
    result = OH_AudioStreamManager_GetDirectPlaybackSupport(audioStreamManager, &streamInfo, AUDIOSTREAM_USAGE_MUSIC,
                                                            &directPlaybackMode);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionIsAcousticEchoCancelerSupportedInvPar(napi_env env, napi_callback_info info)
{
    bool *supported;
    OH_AudioCommon_Result result =
        OH_AudioStreamManager_IsAcousticEchoCancelerSupported(nullptr, AUDIOSTREAM_SOURCE_TYPE_MIC, supported);
    if (result == AUDIOCOMMON_RESULT_ERROR_INVALID_PARAM) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionIsAcousticEchoCancelerSupportedSuc(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioStreamManager *streamManager;
    OH_AudioManager_GetAudioStreamManager(&streamManager);
    bool supported = false;
    result =
        OH_AudioStreamManager_IsAcousticEchoCancelerSupported(streamManager, AUDIOSTREAM_SOURCE_TYPE_MIC, &supported);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}
