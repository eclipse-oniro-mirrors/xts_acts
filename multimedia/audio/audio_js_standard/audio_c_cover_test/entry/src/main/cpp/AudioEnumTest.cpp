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

#include "AudioEnumTest.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "AudioTest.h"
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
#include <hilog/log.h>
#include <js_native_api_types.h>

napi_value AudioStreamEncodingTypeAudioVividCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_AUDIOVIVID;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamEncodingTypeEAc3Code(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_CAPTURER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioStream_EncodingType encodingType = AUDIOSTREAM_ENCODING_TYPE_E_AC3;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_SetEncodingType(builder, encodingType);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamDirectPlayBackBitStreamSupportedCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioStreamManager *audioStreamManager;
    OH_AudioManager_GetAudioStreamManager(&audioStreamManager);
    OH_AudioStreamInfo streamInfo;
    streamInfo.samplingRate = 1;
    OH_AudioStream_DirectPlaybackMode directPlaybackMode = AUDIOSTREAM_DIRECT_PLAYBACK_BITSTREAM_SUPPORTED;
    result = OH_AudioStreamManager_GetDirectPlaybackSupport(audioStreamManager, &streamInfo, AUDIOSTREAM_USAGE_MUSIC,
                                                            &directPlaybackMode);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamDirectPlayBackPcmSupportedCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioStreamManager *audioStreamManager;
    OH_AudioManager_GetAudioStreamManager(&audioStreamManager);
    OH_AudioStreamInfo streamInfo;
    streamInfo.samplingRate = 1;
    OH_AudioStream_DirectPlaybackMode directPlaybackMode = AUDIOSTREAM_DIRECT_PLAYBACK_PCM_SUPPORTED;
    result = OH_AudioStreamManager_GetDirectPlaybackSupport(audioStreamManager, &streamInfo, AUDIOSTREAM_USAGE_MUSIC,
                                                            &directPlaybackMode);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStateInvalidCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_INVALID;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStateNewCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_NEW;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStatePreparedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_PREPARED;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStateRunningCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_RUNNING;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStateStoppedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_RUNNING;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStateReleasedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_RELEASED;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamStatePausedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStream_Result result = OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);
    OH_AudioStream_State state = AUDIOSTREAM_STATE_PAUSED;
    result = OH_AudioCapturer_GetCurrentState(audioCapturer, &state);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSourceTypeUnprocessedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_UNPROCESSED;
    OH_AudioStream_Result result = OH_AudioCapturer_GetCapturerInfo(audioCapturer, &sourceType);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamSourceTypeLiveCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder = CreateCapturerBuilder();
    OH_AudioCapturer *audioCapturer;
    OH_AudioStreamBuilder_GenerateCapturer(builder, &audioCapturer);

    OH_AudioStream_SourceType sourceType = AUDIOSTREAM_SOURCE_TYPE_LIVE;
    OH_AudioStream_Result result = OH_AudioCapturer_GetCapturerInfo(audioCapturer, &sourceType);
    OH_AudioCapturer_Release(audioCapturer);
    OH_AudioStreamBuilder_Destroy(builder);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamEffectDefaultCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    auto result = OH_AudioRenderer_SetEffectMode(audioRenderer, EFFECT_DEFAULT);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamFastStatusNormalCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_FastStatus status = AUDIOSTREAM_FASTSTATUS_NORMAL;
    auto result = OH_AudioRenderer_GetFastStatus(audioRenderer, &status);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamFastStatusFastCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStreamBuilder_Create(&builder, type);
    OH_AudioRenderer *audioRenderer;
    OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    OH_AudioStream_FastStatus status = AUDIOSTREAM_FASTSTATUS_FAST;
    auto result = OH_AudioRenderer_GetFastStatus(audioRenderer, &status);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSceneRingingCode(napi_env env, napi_callback_info info)
{
    OH_AudioManager *audioManager = nullptr;
    OH_GetAudioManager(&audioManager);
    OH_AudioScene scene = AUDIO_SCENE_RINGING;
    OH_AudioCommon_Result result = OH_GetAudioScene(audioManager, &scene);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioScenePhoneCallCode(napi_env env, napi_callback_info info)
{
    OH_AudioManager *audioManager = nullptr;
    OH_GetAudioManager(&audioManager);
    OH_AudioScene scene = AUDIO_SCENE_PHONE_CALL;
    OH_AudioCommon_Result result = OH_GetAudioScene(audioManager, &scene);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSceneVoiceChatCode(napi_env env, napi_callback_info info)
{
    OH_AudioManager *audioManager = nullptr;
    OH_GetAudioManager(&audioManager);
    OH_AudioScene scene = AUDIO_SCENE_VOICE_CHAT;
    OH_AudioCommon_Result result = OH_GetAudioScene(audioManager, &scene);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRingerModeSilentCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioVolumeManager *volumeManager = nullptr;
    OH_AudioManager_GetAudioVolumeManager(&volumeManager);
    OH_AudioRingerMode ringerMode = AUDIO_RINGER_MODE_SILENT;
    result = OH_AudioVolumeManager_GetRingerMode(volumeManager, &ringerMode);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioRingerModeVibrateCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioVolumeManager *volumeManager = nullptr;
    OH_AudioManager_GetAudioVolumeManager(&volumeManager);
    OH_AudioRingerMode ringerMode = AUDIO_RINGER_MODE_VIBRATE;
    result = OH_AudioVolumeManager_GetRingerMode(volumeManager, &ringerMode);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceRoleInputCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Role deviceRole = AUDIO_DEVICE_ROLE_INPUT;
        result = OH_AudioDeviceDescriptor_GetDeviceRole(descriptor, &deviceRole);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeWiredHeadphonesCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_WIRED_HEADPHONES;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeBluetoothScoCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_BLUETOOTH_SCO;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeBluetoothA2dpCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_BLUETOOTH_A2DP;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeMicCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_MIC;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeUsbHeadsetCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_USB_HEADSET;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeDisplayPortCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_DISPLAY_PORT;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeRemoteCastCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_REMOTE_CAST;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeUsbDeviceCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_USB_DEVICE;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeAccessoryCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_ACCESSORY;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeHdmiCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_HDMI;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeLineDigitalCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_LINE_DIGITAL;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeHearingAidCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_HEARING_AID;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceTypeNearlinkCode(napi_env env, napi_callback_info info)
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
        OH_AudioDevice_Type deviceType = AUDIO_DEVICE_TYPE_NEARLINK;
        result = OH_AudioDeviceDescriptor_GetDeviceType(descriptor, &deviceType);
    }
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceUsageMediaInputCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_MEDIA_INPUT;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceUsageMediaAllCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_MEDIA_ALL;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceUsageCallOutputCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_CALL_OUTPUT;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceUsageCallInputCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_CALL_INPUT;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioDeviceUsageCallAllCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Usage deviceUsage = AUDIO_DEVICE_USAGE_CALL_ALL;
    OH_AudioDeviceDescriptorArray *array;
    result = OH_AudioRoutingManager_GetAvailableDevices(audioRoutingManager, deviceUsage, &array);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

int32_t AudioRendererOnStreamEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioStream_Event event)
{
    if (event == AUDIOSTREAM_EVENT_ROUTING_CHANGED) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererInterruptCallbackWithResult  status:%{public}d",
                     event);
    }
};

static int32_t RendererInterruptCallbackWithResult(OH_AudioRenderer *renderer, void *userData,
                                                   OH_AudioInterrupt_ForceType type, OH_AudioInterrupt_Hint hint)
{
    if (type == AUDIOSTREAM_INTERRUPT_FORCE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererInterruptCallbackWithResult  status:%{public}d",
                     type);
    } else if (type == AUDIOSTREAM_INTERRUPT_SHARE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererInterruptCallbackWithResult  status:%{public}d",
                     type);
    }
}

napi_value AudioStreamEventRoutingChangedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnStreamEvent = AudioRendererOnStreamEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptForceCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererInterruptCallbackWithResult;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptShareCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererInterruptCallbackWithResult;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

int32_t RendererOnInterruptEvent(OH_AudioRenderer *renderer, void *userData, OH_AudioInterrupt_ForceType type,
                                 OH_AudioInterrupt_Hint hint)
{
    if (hint == AUDIOSTREAM_INTERRUPT_HINT_NONE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_RESUME) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_PAUSE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_STOP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_DUCK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_UNDUCK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_MUTE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    } else if (hint == AUDIOSTREAM_INTERRUPT_HINT_UNMUTE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOnInterruptEvent  status:%{public}d", type);
    }
}

napi_value AudioStreamInterruptHintNoneCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintResumeCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintPauseCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintStopCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintDuckCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintUnduckCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintMuteCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamInterruptHintUnmuteCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_Callbacks callbacks;
    callbacks.OH_AudioRenderer_OnStreamEvent = AudioRendererOnStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = RendererOnInterruptEvent;
    OH_AudioStreamBuilder_SetRendererCallback(builder, callbacks, nullptr);

    // 3. generate audiorenderer
    OH_AudioRenderer *audioRenderer;
    auto result = OH_AudioStreamBuilder_GenerateRenderer(builder, &audioRenderer);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

void RendererOutputDeviceChangeCallback(OH_AudioRenderer *renderer, void *userData,
                                        OH_AudioStream_DeviceChangeReason reason)
{
    if (reason == REASON_UNKNOWN) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    } else if (reason == REASON_NEW_DEVICE_AVAILABLE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    } else if (reason == REASON_OLD_DEVICE_UNAVAILABLE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    } else if (reason == REASON_OVERRODE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    } else if (reason == REASON_SESSION_ACTIVATED) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    } else if (reason == REASON_STREAM_PRIORITY_CHANGED) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "RendererOutputDeviceChangeCallback  status:%{public}d",
                     reason);
    }
};

napi_value AudioStreamReasonUnknownCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamReasonOldDeviceAvailableCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamReasonOldDeviceUnavailableCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamReasonOverrodeCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamReasonSessionActivatedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioStreamReasonStreamPriorityChangedCode(napi_env env, napi_callback_info info)
{
    OH_AudioStreamBuilder *builder;
    OH_AudioStream_Type type = AUDIOSTREAM_TYPE_RENDERER;
    OH_AudioStream_Usage usage = AUDIOSTREAM_USAGE_MUSIC;
    OH_AudioStreamBuilder_Create(&builder, type);

    // 2. set builder params
    OH_AudioStreamBuilder_SetRendererInfo(builder, usage);

    OH_AudioRenderer_OutputDeviceChangeCallback callback = RendererOutputDeviceChangeCallback;
    void *userData;
    auto result = OH_AudioStreamBuilder_SetRendererOutputDeviceChangeCallback(builder, callback, &userData);
    if (result == AUDIOSTREAM_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

static int32_t DeviceChangeCallback(OH_AudioDevice_ChangeType type,
                                    OH_AudioDeviceDescriptorArray *audioDeviceDescriptorArray)
{
    if (type == AUDIO_DEVICE_CHANGE_TYPE_DISCONNECT) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "DeviceChangeCallback  status:%{public}d", type);
    }
    return 0;
}

napi_value AudioDeviceChangeTypeDisconnectCode(napi_env env, napi_callback_info info)
{
    OH_AudioRoutingManager *audioRoutingManager = nullptr;
    OH_AudioManager_GetAudioRoutingManager(&audioRoutingManager);
    OH_AudioDevice_Flag deviceFlag = AUDIO_DEVICE_FLAG_NONE;
    OH_AudioRoutingManager_OnDeviceChangedCallback callback = DeviceChangeCallback;
    OH_AudioCommon_Result result =
        OH_AudioRoutingManager_RegisterDeviceChangeCallback(audioRoutingManager, deviceFlag, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

void SessionStateChangedCallback(OH_AudioSession_StateChangedEvent event)
{
    if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_RESUME) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    } else if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    } else if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_STOP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    } else if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    } else if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_DUCK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    } else if (event.stateChangeHint == AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia", "SessionStateChangedCallback  status:%{public}d",
                     event.stateChangeHint);
    }
};

napi_value AudioSessionStateChangeHintResumeCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangeHintPauseCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangeHintStopCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangeHintTimeOutStopCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangeHintDuckCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangeHintUnduckCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_StateChangedCallback callback = SessionStateChangedCallback;
    result = OH_AudioSessionManager_RegisterStateChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

void SessionCurrentOutputDeviceChangedCallback(OH_AudioDeviceDescriptorArray *devices,
                                               OH_AudioStream_DeviceChangeReason changeReason,
                                               OH_AudioSession_OutputDeviceChangeRecommendedAction recommendedAction)
{
    if (recommendedAction == DEVICE_CHANGE_RECOMMEND_TO_CONTINUE) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia",
                     "SessionCurrentOutputDeviceChangedCallback  status:%{public}d", recommendedAction);
    } else if (recommendedAction == DEVICE_CHANGE_RECOMMEND_TO_STOP) {
        OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "OSMedia",
                     "SessionCurrentOutputDeviceChangedCallback  status:%{public}d", recommendedAction);
    }
};

napi_value DeviceChangeRecommendToContinueCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_CurrentOutputDeviceChangedCallback callback = SessionCurrentOutputDeviceChangedCallback;
    result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value DeviceChangeRecommendToStopCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_CurrentOutputDeviceChangedCallback callback = SessionCurrentOutputDeviceChangedCallback;
    result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangedEventCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_CurrentOutputDeviceChangedCallback callback = SessionCurrentOutputDeviceChangedCallback;
    result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}

napi_value AudioSessionStateChangedEventStateChangeHintCode(napi_env env, napi_callback_info info)
{
    OH_AudioCommon_Result result;
    OH_AudioSessionManager *audioSessionManager = nullptr;
    OH_AudioManager_GetAudioSessionManager(&audioSessionManager);
    OH_AudioSession_CurrentOutputDeviceChangedCallback callback = SessionCurrentOutputDeviceChangedCallback;
    result = OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback(audioSessionManager, callback);
    if (result == AUDIOCOMMON_RESULT_SUCCESS) {
        napi_value res;
        napi_create_int32(env, result, &res);
        return res;
    }
    return nullptr;
}