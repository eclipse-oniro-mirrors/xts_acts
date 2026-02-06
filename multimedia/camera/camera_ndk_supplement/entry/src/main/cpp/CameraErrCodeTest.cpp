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
#include <ohcamera/camera.h>
#include <ohcamera/camera_manager.h>
#include <ohcamera/capture_session.h>
#include <ohcamera/camera_device.h>
#include <ohcamera/camera_input.h>
#include <ohcamera/photo_output.h>
#include <ohcamera/photo_native.h>
#include <string>
#include <napi/native_api.h>
#include <ohcamera/video_output.h>
#include "CameraErrCodeTest.h"
#include <hilog/log.h>
#define CAMERA_LOG_TAG "LOG_CAMERA_TEST_TAG"
#define CAMERA_LOG_DOMAIN 0x3200
#define LogD(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
#define LogE(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_ERROR, CAMERA_LOG_DOMAIN, CAMERA_LOG_TAG, fmt, ##__VA_ARGS__)
bool GetString(napi_env env, napi_callback_info info, uint32_t index, std::string& outstr)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    char output[MAX_BUFFER_SIZE] = {0};
    size_t size = 0;
    if (napi_get_value_string_utf8(env, args[index], output, MAX_BUFFER_SIZE, &size) != napi_ok) {
        return false;
    }
    outstr = std::string(output);
    return true;
}

int32_t GetInt(napi_env env, napi_callback_info info, uint32_t index, int32_t& outint)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok) {
        return false;
    }
    if (index >= argc) {
        return false;
    }
    if (napi_get_value_int32(env, args[index], &outint) != napi_ok) {
        return false;
    }
    return true;
}

napi_value ReturnInt(napi_env env, int32_t value, napi_value* result)
{
    napi_create_int32(env, value, result);
    return *result;
}

napi_value CaptureSessionGetWhiteBalanceRange(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    int32_t minColorTmp;
    int32_t maxColorTmp;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_GetWhiteBalanceRange(captureSession, &minColorTmp, &maxColorTmp);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionGetWhiteBalance(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    int32_t colorTemperature;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_GetWhiteBalance(captureSession, &colorTemperature);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionSetWhiteBalance(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    int32_t colorTemperature = 0;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_SetWhiteBalance(captureSession, colorTemperature);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionSetWhiteBalanceMode(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_WhiteBalanceMode whiteBalanceMode;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, whiteBalanceMode);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        OH_CaptureSession_SetSessionMode(captureSession, NORMAL_VIDEO);
        OH_CaptureSession_BeginConfig(captureSession);
        OH_CaptureSession_CommitConfig(captureSession);
        rest = OH_CaptureSession_SetWhiteBalanceMode(captureSession, CAMERA_WHITE_BALANCE_MODE_AUTO);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

void OnSystemLevel(Camera_CaptureSession* session, Camera_SystemPressureLevel level)
{
    return;
}

napi_value CaptureSessionRegisterSystem(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession,
                                                                                            OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_RegisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionUnregisterSystem(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession,
                                                                                              OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_UnregisterSystemPressureLevelChangeCallback(captureSession, OnSystemLevel);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionIsControlCenterSupported(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    bool isSupported;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_IsControlCenterSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_IsControlCenterSupported(captureSession, &isSupported);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionGetSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_ControlCenterEffectType* types = nullptr;
    uint32_t size;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionDeleteSupportedEffectTypes(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    Camera_ControlCenterEffectType types = CONTROL_CENTER_EFFECT_TYPE_BEAUTY;
    uint32_t size = 0;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        Camera_ControlCenterEffectType* types = nullptr;
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, types, size);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, &types, size);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        Camera_ControlCenterEffectType* types = nullptr;
        rest = OH_CaptureSession_GetSupportedEffectTypes(captureSession, &types, &size);
        rest = OH_CaptureSession_DeleteSupportedEffectTypes(captureSession, types, size);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionEnableControlCenter(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    bool enabled = true;
    Camera_CaptureSession* captureSession = nullptr;
    if (index == ARG_INDEX_0) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        rest = OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_SESSION_NOT_CONFIG) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_1) {
        Camera_ErrorCode rest = OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_INVALID_ARGUMENT) {
            ret = CAMERA_OK;
        }
    } else if (index == ARG_INDEX_2) {
        OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
        cameraNdkCommon.InitCamera();
        Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
        cameraNdkCommon.SessionCommit(captureSession);
        OH_CaptureSession_EnableControlCenter(captureSession, enabled);
        ret = rest;
        if (rest == CAMERA_OK) {
            ret = CAMERA_OK;
        }
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

void OnControlCenter(Camera_CaptureSession* session, Camera_ControlCenterStatusInfo* controlCenterStatusInfo)
{
    return;
}

napi_value CaptureSessionRegisterControl(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
    rest = OH_CaptureSession_RegisterControlCenterEffectStatusChangeCallback(captureSession, OnControlCenter);
    ret = rest;
    if (rest == CAMERA_OK) {
        ret = rest;
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}

napi_value CaptureSessionUnregisterControl(napi_env env, napi_callback_info info)
{
    int32_t ret = INVALID_STATUS;
    int32_t index = 0;
    napi_value result;
    if (GetInt(env, info, 0, index) == false) {
        return ReturnInt(env, ret, &result);
    }
    Camera_CaptureSession* captureSession = nullptr;
    OHOS::CameraStandard::CameraNdkCommon cameraNdkCommon;
    cameraNdkCommon.InitCamera();
    Camera_ErrorCode rest = OH_CameraManager_CreateCaptureSession(cameraNdkCommon.cameraManager, &captureSession);
    rest = OH_CaptureSession_UnregisterControlCenterEffectStatusChangeCallback(captureSession, OnControlCenter);
    ret = rest;
    if (rest == CAMERA_OK) {
        ret = rest;
    }
    OH_CaptureSession_Release(captureSession);
    return ReturnInt(env, ret, &result);
}