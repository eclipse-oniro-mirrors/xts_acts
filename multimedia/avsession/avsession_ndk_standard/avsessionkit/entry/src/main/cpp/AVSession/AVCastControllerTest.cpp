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
#include <multimedia/av_session/native_avcastcontroller.h>
#include <multimedia/av_session/native_avmetadata.h>
#include <multimedia/av_session/native_avsession.h>
#include <multimedia/av_session/native_avsession_errors.h>
#include <multimedia/av_session/native_avplaybackstate.h>
#include <multimedia/av_session/native_avqueueitem.h>
#include <multimedia/av_session/native_avsession_base.h>

static int32_t g_trueValue = PARAM_1;
static int32_t g_falseValue = PARAM_0;

napi_value AVCastControllerDestroyInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    int32_t result = OH_AVCastController_Destroy(avcastController);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerGetPlaybackStateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVPlaybackState *avPlaybackState = nullptr;
    int32_t result = OH_AVCastController_GetPlaybackState(avcastController, &avPlaybackState);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlaybackStateChanged playBackStateChangedCallback = [](
        OH_AVCastController* avcastcontroller, OH_AVSession_AVPlaybackState* playbackState,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlaybackStateChangedCallback(avcastController, 2,
        playBackStateChangedCallback, &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterPlaybackStateChangedCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlaybackStateChanged playBackStateChangedCallback = [](
        OH_AVCastController* avcastcontroller, OH_AVSession_AVPlaybackState* playbackState,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlaybackStateChangedCallback(avcastController, 2,
        playBackStateChangedCallback, &userData);
    result = OH_AVCastController_UnregisterPlaybackStateChangedCallback(avcastController,
        playBackStateChangedCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterMediaItemChangedCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_MediaItemChange mediaItemChangedCallback = [](OH_AVCastController* avcastcontroller,
        OH_AVSession_AVQueueItem* avQueueItem, void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterMediaItemChangedCallback(avcastController,
        mediaItemChangedCallback, &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterMediaItemChangedCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_MediaItemChange mediaItemChangedCallback = [](OH_AVCastController* avcastcontroller,
        OH_AVSession_AVQueueItem* avQueueItem, void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterMediaItemChangedCallback(avcastController,
        mediaItemChangedCallback, &userData);
    result = OH_AVCastController_UnregisterMediaItemChangedCallback(avcastController,
        mediaItemChangedCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterPlayNextCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlayNext playNextCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlayNextCallback(avcastController, playNextCallback,
        &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterPlayNextCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlayNext playNextCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlayNextCallback(avcastController, playNextCallback,
        &userData);
    result = OH_AVCastController_UnregisterPlayNextCallback(avcastController, playNextCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterPlayPreviousCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlayPrevious playPreviousCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlayPreviousCallback(avcastController, playPreviousCallback,
        &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterPlayPreviousCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
        OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_PlayPrevious playPreviousCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterPlayPreviousCallback(avcastController, playPreviousCallback,
        &userData);
    result = OH_AVCastController_UnregisterPlayPreviousCallback(avcastController, playPreviousCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterSeekDoneCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_SeekDone seekDoneCallback = [](OH_AVCastController* avcastcontroller,
        int32_t position, void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterSeekDoneCallback(avcastController, seekDoneCallback,
        &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterSeekDoneCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_SeekDone seekDoneCallback = [](OH_AVCastController* avcastcontroller,
        int32_t position, void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterSeekDoneCallback(avcastController, seekDoneCallback,
        &userData);
    result = OH_AVCastController_UnregisterSeekDoneCallback(avcastController, seekDoneCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterEndOfStreamCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_EndOfStream endOfStreamCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterEndOfStreamCallback(avcastController, endOfStreamCallback,
        &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterEndOfStreamCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_EndOfStream endOfStreamCallback = [](OH_AVCastController* avcastcontroller,
        void* userData) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterEndOfStreamCallback(avcastController, endOfStreamCallback,
        &userData);
    result = OH_AVCastController_UnregisterEndOfStreamCallback(avcastController, endOfStreamCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerRegisterErrorCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_Error errorCallback = [](OH_AVCastController* avcastcontroller,
        void* userData, AVSession_ErrCode error) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterErrorCallback(avcastController, errorCallback,
        &userData);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerUnregisterErrorCallbackInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVCastControllerCallback_Error errorCallback = [](OH_AVCastController* avcastcontroller,
        void* userData, AVSession_ErrCode error) -> AVSessionCallback_Result {
        return AVSESSION_CALLBACK_RESULT_SUCCESS;
    };
    char *userData = "应用数据";
    int32_t result = OH_AVCastController_RegisterErrorCallback(avcastController, errorCallback,
        &userData);
    result = OH_AVCastController_UnregisterErrorCallback(avcastController, errorCallback);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendCommonCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_PLAY;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendSeekCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    int32_t seekTimeMS = 0;
    int32_t result = OH_AVCastController_SendSeekCommand(avcastController, seekTimeMS);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendFastForwardCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    int32_t fastForwardTimeS = 0;
    int32_t result = OH_AVCastController_SendFastForwardCommand(avcastController, fastForwardTimeS);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendRewindCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    int32_t rewindTimeS = 0;
    int32_t result = OH_AVCastController_SendRewindCommand(avcastController, rewindTimeS);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendSetSpeedCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_0_75_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerSendVolumeCommandInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    int32_t volume = 1;
    int32_t result = OH_AVCastController_SendVolumeCommand(avcastController, volume);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerPrepareInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    OH_AVSession_AVMediaDescription *description = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &description);
    OH_AVSession_AVQueueItem item;
    item.itemId = 1;
    item.description = description;
    int32_t result = OH_AVCastController_Prepare(avcastController, &item);
    OH_AVSession_AVMediaDescription_Destroy(description);
    OH_AVSession_AVMediaDescriptionBuilder_Destroy(builder);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControllerStartInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVMediaDescriptionBuilder *builder = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_Create(&builder);
    OH_AVSession_AVMediaDescription *description = nullptr;
    OH_AVSession_AVMediaDescriptionBuilder_GenerateAVMediaDescription(builder, &description);
    OH_AVSession_AVQueueItem item;
    item.itemId = 1;
    item.description = description;
    int32_t result = OH_AVCastController_Start(avcastController, &item);
    OH_AVSession_AVMediaDescription_Destroy(description);
    OH_AVSession_AVMediaDescriptionBuilder_Destroy(builder);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetPlaybackStateInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVPlaybackState *avPlaybackState = nullptr;
    OH_AVCastController_GetPlaybackState(avcastController, &avPlaybackState);
    AVSession_PlaybackState state = AVSession_PlaybackState::PLAYBACK_STATE_MAX;
    int32_t result = OH_AVSession_GetPlaybackState(avPlaybackState, &state);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetPlaybackPositionInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVPlaybackState *avPlaybackState = nullptr;
    OH_AVCastController_GetPlaybackState(avcastController, &avPlaybackState);
    AVSession_PlaybackPosition position;
    position.elapsedTime = -1;
    position.updateTime = -1;
    int32_t result = OH_AVSession_GetPlaybackPosition(avPlaybackState, &position);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetPlaybackSpeedInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVPlaybackState *avPlaybackState = nullptr;
    OH_AVCastController_GetPlaybackState(avcastController, &avPlaybackState);
    int32_t speed = -1;
    int32_t result = OH_AVSession_GetPlaybackSpeed(avPlaybackState, &speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionGetPlaybackVolumeInvalidParam(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    OH_AVSession_AVPlaybackState *avPlaybackState = nullptr;
    OH_AVCastController_GetPlaybackState(avcastController, &avPlaybackState);
    int32_t volume = -1;
    int32_t result = OH_AVSession_GetPlaybackVolume(avPlaybackState, &volume);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypePlay(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_PLAY;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypePause(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_PAUSE;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeStop(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_STOP;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypePlayNext(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_PLAY_NEXT;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypePlayPrevious(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_PLAY_PREVIOUS;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeFastForward(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_FAST_FORWARD;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeRewind(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_REWIND;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeSeek(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_SEEK;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeSetVolume(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_SET_VOLUME;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVCastControlCommandTypeSetSpeed(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_AVCastControlCommandType commandType = AVSession_AVCastControlCommandType::CAST_CONTROL_CMD_SET_SPEED;
    int32_t result = OH_AVCastController_SendCommonCommand(avcastController, &commandType);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed0_75X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_0_75_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed1_00X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_1_00_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed1_25X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_1_25_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed1_75X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_1_75_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed2_00X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_2_00_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed0_50X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_0_50_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}

napi_value AVSessionPlaybackSpeed1_50X(napi_env env, napi_callback_info info)
{
    const char *sessionTag = nullptr;
    const char *bundleName = nullptr;
    const char *abilityName = nullptr;
    OH_AVSession *avsession = nullptr;
    AVSession_Type sessionType = SESSION_TYPE_AUDIO;
    OH_AVSession_Create(sessionType, sessionTag, bundleName, abilityName, &avsession);
    OH_AVCastController *avcastController = nullptr;
    OH_AVSession_CreateAVCastController(avsession, &avcastController);
    AVSession_PlaybackSpeed speed = AVSession_PlaybackSpeed::SPEED_FORWARD_1_50_X;
    int32_t result = OH_AVCastController_SendSetSpeedCommand(avcastController, speed);
    OH_AVCastController_Destroy(avcastController);
    OH_AVSession_Destroy(avsession);
    napi_value retValue;
    if (result == AV_SESSION_ERR_INVALID_PARAMETER) {
        napi_create_int32(env, g_trueValue, &retValue);
    } else {
        napi_create_int32(env, g_falseValue, &retValue);
    }
    return retValue;
}