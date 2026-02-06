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
