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

#include "AVSession/AVSession_Test.h"
#include "common/Common.h"
#include <multimedia/av_session/native_avmetadata.h>
#include <multimedia/av_session/native_avsession.h>
#include <multimedia/av_session/native_avsession_errors.h>

static int32_t g_trueValue = PARAM_1;
static int32_t g_falseValue = PARAM_0;
const int32_t ENUM_SESSION_TYPE_PHOTO = 4;
const int32_t ENUM_STATE_CONNECTING = 0;
const int32_t ENUM_STATE_CONNECTED = 1;
const int32_t ENUM_STATE_DISCONNECTED = 6;
const int32_t ENUM_CATEGORY_LOCAL = 0;
const int32_t ENUM_CATEGORY_REMOTE = 1;
const int32_t ENUM_DEVICE_TYPE_LOCAL = 0;
const int32_t ENUM_DEVICE_TYPE_TV = 2;
const int32_t ENUM_DEVICE_TYPE_SMART_SPEAKER = 3;
const int32_t ENUM_DEVICE_TYPE_BLUETOOTH = 10;
const int32_t ENUM_TYPE_LOCAL = 0;
const int32_t ENUM_TYPE_CAST_PLUS_STREAM = 2;
const int32_t ENUM_TYPE_DLNA = 4;
const int32_t ENUM_TYPE_CAST_PLUS_AUDIO = 8;
const int32_t ENUM_AV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST = 6600109;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED = 6611000;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR = 6611001;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW = 6611002;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT = 6611003;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED = 6611004;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING = 6611100;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED = 6611101;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET = 6611102;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED = 6611103;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED = 6611104;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING = 6611105;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM = 6611106;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY = 6611107;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED = 6611108;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED = 6612000;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED = 6612001;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT = 6612002;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE = 6612003;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS = 6612004;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND = 6612005;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION = 6612006;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED = 6612007;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE = 6612008;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS = 6612100;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR = 6612101;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY = 6612102;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED = 6612103;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN = 6612104;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED = 6612105;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES = 6612106;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED = 6612107;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED = 6613000;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED = 6613001;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED = 6613002;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED = 6613003;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED = 6613004;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED = 6614000;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED = 6614001;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED = 6614002;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED = 6614003;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES = 6614004;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED = 6614005;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED = 6615000;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED = 6615001;
const int32_t ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED = 6615002;
const int32_t ENUM_AVQUEUEITEM_ERROR_NO_MEMORY = 2;

napi_value AVSessionRegisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t callbackResult = OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    int32_t callbackResult = OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterToggleFavoriteCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterToggleFavoriteCallback(avsession, toggleFavoriteback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterToggleFavoriteCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnToggleFavorite toggleFavoriteback = [](OH_AVSession *session, const char *assetId,
                                                                  void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterToggleFavoriteCallback(avsession, toggleFavoriteback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterToggleFavoriteCallback(avsession, toggleFavoriteback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterOutputDeviceChangeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    int32_t callbackResult = OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionRegisterOutputDeviceChangeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    int32_t callbackResult = OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterOutputDeviceChangeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    int32_t callbackResult = OH_AVSession_UnregisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OutputDeviceChange outputDeviceChangeback = [](OH_AVSession *session,
        AVSession_ConnectionState state, AVSession_OutputDeviceInfo* outputDeviceInfo) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    OH_AVSession_RegisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    int32_t callbackResult = OH_AVSession_UnregisterOutputDeviceChangeCallback(avsession, outputDeviceChangeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    int32_t createResult = OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (createResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrServiceException(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    OH_AVMetadata *avmetadata = nullptr;
    OH_AVMetadataBuilder_GenerateAVMetadata(builder, &avmetadata);
    int32_t setResult = OH_AVSession_SetAVMetadata(avsession, avmetadata);
    OH_AVSession_Destroy(avsession);
    OH_AVMetadata_Destroy(avmetadata);
    OH_AVMetadataBuilder_Destroy(builder);
    napi_value retValue;
    if (setResult == AV_SESSION_ERR_SERVICE_EXCEPTION) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionErrCodeCommandInvalid(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnCommand commandCallback = [](OH_AVSession *session, AVSession_ControlCommand command,
                                                        void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    AVSession_ControlCommand command = CONTROL_CMD_INVALID;
    int32_t callbackResult = OH_AVSession_RegisterCommandCallback(avsession, command, commandCallback, &userData);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_CODE_COMMAND_INVALID) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}


napi_value AVSessionUnregisterSetLoopModeCallbackSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionUnregisterSetLoopModeCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVSessionCallback_OnSetLoopMode setLoopModeback = [](OH_AVSession *session, AVSession_LoopMode curLoopMode,
                                                            void *userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData;
    OH_AVSession_RegisterSetLoopModeCallback(avsession, setLoopModeback, &userData);
    int32_t callbackResult = OH_AVSession_UnregisterSetLoopModeCallback(avsession, setLoopModeback);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (callbackResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireSessionSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t getResult = OH_AVSession_AcquireSession(sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireSessionInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t getResult = OH_AVSession_AcquireSession(sessionTag, bundleName, abilityName, &avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateAVCastControllerSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastcontroller = nullptr;
    int32_t getResult = OH_AVSession_CreateAVCastController(avsession, &avcastcontroller);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionCreateAVCastControllerInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    OH_AVCastController *avcastcontroller = nullptr;
    int32_t getResult = OH_AVSession_CreateAVCastController(avsession, &avcastcontroller);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionStopCastingSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    int32_t stopResult = OH_AVSession_StopCasting(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (stopResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionStopCastingInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    int32_t stopResult = OH_AVSession_StopCasting(avsession);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (stopResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAcquireOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionReleaseOutputDeviceSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    int32_t releaseResult = OH_AVSession_ReleaseOutputDevice(avsession, avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (releaseResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionReleaseOutputDeviceInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    OH_AVSession **avsessionptr = nullptr;
    AVSession_Type sessionType;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, avsessionptr);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t releaseResult = OH_AVSession_ReleaseOutputDevice(avsession, avdeviceinfo);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (releaseResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetAVCastCategorySuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    int32_t getResult = OH_DeviceInfo_GetAVCastCategory(ohDeviceInfo, &category);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetAVCastCategoryInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    AVSession_AVCastCategory category;
    int32_t getResult = OH_DeviceInfo_GetAVCastCategory(ohDeviceInfo, &category);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceIdSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    char *deviceId = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceId(ohDeviceInfo, &deviceId);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceIdInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    char *deviceId = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceId(ohDeviceInfo, &deviceId);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceNameSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    char *deviceName = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceName(ohDeviceInfo, &deviceName);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceNameInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    char *deviceName = nullptr;
    int32_t getResult = OH_DeviceInfo_GetDeviceName(ohDeviceInfo, &deviceName);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceTypeSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    AVSession_DeviceType deviceType;
    int32_t getResult = OH_DeviceInfo_GetDeviceType(ohDeviceInfo, &deviceType);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetDeviceTypeInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    AVSession_DeviceType deviceType;
    int32_t getResult = OH_DeviceInfo_GetDeviceType(ohDeviceInfo, &deviceType);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSupportedProtocolsSuccess(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    AVSession_AVCastCategory category;
    AVSession_DeviceInfo* ohDeviceInfo = avdeviceinfo->deviceInfos[0];
    uint32_t protocols;
    int32_t getResult = OH_DeviceInfo_GetSupportedProtocols(ohDeviceInfo, &protocols);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetSupportedProtocolsInvalidParam(napi_env env, napi_callback_info info)
{
    AVSession_DeviceInfo* ohDeviceInfo = nullptr;
    uint32_t protocols;
    int32_t getResult = OH_DeviceInfo_GetSupportedProtocols(ohDeviceInfo, &protocols);
    napi_value retValue;
    if (getResult == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterSTATE(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_STATE;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterPOSITION(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_POSITION;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterSPEED(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_SPEED;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackFilterVOLUME(napi_env env, napi_callback_info info)
{
    OH_AVMetadataBuilder *builder = nullptr;
    OH_AVMetadataBuilder_Create(&builder);
    AVSession_PlaybackFilter filter = AVSession_PlaybackFilter::FILTER_VOLUME;
    int32_t result = OH_AVMetadataBuilder_SetFilter(builder, filter);
    napi_value retValue;
    if (result == AVMETADATA_SUCCESS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionOutputDeviceInfo(napi_env env, napi_callback_info info)
{
    const char *sessionTag = "MyTag";
    const char *bundleName = "MyBundleName";
    const char *abilityName = "MyAbilityName";
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    AVSession_OutputDeviceInfo *avdeviceinfo = nullptr;
    int32_t getResult = OH_AVSession_AcquireOutputDevice(avsession, &avdeviceinfo);
    avdeviceinfo->size = 0;
    avdeviceinfo->deviceInfos = nullptr;
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (avdeviceinfo->size == 0 && avdeviceinfo->deviceInfos == nullptr) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_TypeSESSION_TYPE_PHOTO(napi_env env, napi_callback_info info)
{
    AVSession_Type sessionType = SESSION_TYPE_PHOTO;
    napi_value retValue;
    if (sessionType == ENUM_SESSION_TYPE_PHOTO) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionConnectionStateSTATE_CONNECTING(napi_env env, napi_callback_info info)
{
    AVSession_ConnectionState state = AVSession_ConnectionState::STATE_CONNECTING;
    napi_value retValue;
    if (state == ENUM_STATE_CONNECTING) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionConnectionStateSTATE_CONNECTED(napi_env env, napi_callback_info info)
{
    AVSession_ConnectionState state = AVSession_ConnectionState::STATE_CONNECTED;
    napi_value retValue;
    if (state == ENUM_STATE_CONNECTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionConnectionStateSTATE_DISCONNECTED(napi_env env, napi_callback_info info)
{
    AVSession_ConnectionState state = AVSession_ConnectionState::STATE_DISCONNECTED;
    napi_value retValue;
    if (state == ENUM_STATE_DISCONNECTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAVCastCategoryCATEGORY_LOCAL(napi_env env, napi_callback_info info)
{
    AVSession_AVCastCategory category = AVSession_AVCastCategory::CATEGORY_LOCAL;
    napi_value retValue;
    if (category == ENUM_CATEGORY_LOCAL) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionAVCastCategoryCATEGORY_REMOTE(napi_env env, napi_callback_info info)
{
    AVSession_AVCastCategory category = AVSession_AVCastCategory::CATEGORY_REMOTE;
    napi_value retValue;
    if (category == ENUM_CATEGORY_REMOTE) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeviceTypeDEVICE_TYPE_LOCAL(napi_env env, napi_callback_info info)
{
    AVSession_DeviceType deviceType = AVSession_DeviceType::DEVICE_TYPE_LOCAL;
    napi_value retValue;
    if (deviceType == ENUM_DEVICE_TYPE_LOCAL) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeviceTypeDEVICE_TYPE_TV(napi_env env, napi_callback_info info)
{
    AVSession_DeviceType deviceType = AVSession_DeviceType::DEVICE_TYPE_TV;
    napi_value retValue;
    if (deviceType == ENUM_DEVICE_TYPE_TV) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER(napi_env env, napi_callback_info info)
{
    AVSession_DeviceType deviceType = AVSession_DeviceType::DEVICE_TYPE_SMART_SPEAKER;
    napi_value retValue;
    if (deviceType == ENUM_DEVICE_TYPE_SMART_SPEAKER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH(napi_env env, napi_callback_info info)
{
    AVSession_DeviceType deviceType = AVSession_DeviceType::DEVICE_TYPE_BLUETOOTH;
    napi_value retValue;
    if (deviceType == ENUM_DEVICE_TYPE_BLUETOOTH) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionProtocolTypeTYPE_LOCAL(napi_env env, napi_callback_info info)
{
    AVSession_ProtocolType protocolType = AVSession_ProtocolType::TYPE_LOCAL;
    napi_value retValue;
    if (protocolType == ENUM_TYPE_LOCAL) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionProtocolTypeTYPE_CAST_PLUS_STREAM(napi_env env, napi_callback_info info)
{
    AVSession_ProtocolType protocolType = AVSession_ProtocolType::TYPE_CAST_PLUS_STREAM;
    napi_value retValue;
    if (protocolType == ENUM_TYPE_CAST_PLUS_STREAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionProtocolTypeTYPE_DLNA(napi_env env, napi_callback_info info)
{
    AVSession_ProtocolType protocolType = AVSession_ProtocolType::TYPE_DLNA;
    napi_value retValue;
    if (protocolType == ENUM_TYPE_DLNA) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO(napi_env env, napi_callback_info info)
{
    AVSession_ProtocolType protocolType = AVSession_ProtocolType::TYPE_CAST_PLUS_AUDIO;
    napi_value retValue;
    if (protocolType == ENUM_TYPE_CAST_PLUS_AUDIO) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_UNSPECIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_REMOTE_ERROR(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_TIMEOUT(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DEVICE_MISSING(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_INVALID_PARAM(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_NO_MEMORY(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}
napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_READ_ERROR(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED(napi_env env, napi_callback_info info)
{
    int32_t errCode = AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED;
    napi_value retValue;
    if (errCode == ENUM_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSession_AVQUEUEITEM_ERROR_NO_MEMORY(napi_env env, napi_callback_info info)
{
    int32_t errCode = AVQUEUEITEM_ERROR_NO_MEMORY;
    napi_value retValue;
    if (errCode == ENUM_AVQUEUEITEM_ERROR_NO_MEMORY) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}
