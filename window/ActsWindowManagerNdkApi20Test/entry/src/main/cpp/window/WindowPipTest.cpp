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

#include "window/WindowPip.h"

namespace WindowPip {

std::random_device randomNumber; // 随机数种子生成器
std::mt19937 mt(randomNumber()); // 随机数生成器
PictureInPicture_PipState pipStateArray[PARAM_6] = {
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
    PictureInPicture_PipState(PARAM_NEGATIVE_1),
};

void WebPipStartPipCallBack(uint32_t controllerId, uint8_t requestId, uint64_t surfaceId)
{
    return;
};
    
void WebPipLifecycleCallBack(uint32_t controllerId, PictureInPicture_PipState state, int32_t errcode)
{
    if (pipStateArray[state - PARAM_1] == PARAM_NEGATIVE_1) {
        pipStateArray[state - PARAM_1] = state;
    }
    return;
};
    
void WebPipControlEventCallBack(uint32_t controllerId, PictureInPicture_PipControlType controlType,
                                PictureInPicture_PipControlStatus status)
{
    return;
};
    
void WebPipResizeCallback(uint32_t controllerId, uint32_t width, uint32_t height, double scale)
{
    return;
}
    
static napi_value CreatePipStateArray(napi_env env, napi_callback_info info,
                                      int32_t length, PictureInPicture_PipState* array)
{
    // 创建一个空数组
    napi_value arkTsArray = nullptr;
    napi_create_array(env, &arkTsArray);
    // 将创建好的数组进行赋值
    for (int i = PARAM_0; i < length; i++) {
        napi_value element;
        napi_create_int32(env, array[i], &element);
        napi_set_element(env, arkTsArray, i, element);
    }
    // 返回已创建好的数组
    return arkTsArray;
}

napi_value CreatePipConfigOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    int32_t result = OH_PictureInPicture_CreatePipConfig(&pipConfig) ==
                     OK ? OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "CreatePipConfigOk: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreatePipConfigIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_CreatePipConfig(nullptr) ==
                     WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "CreatePipConfigIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipMainWindowIdOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_windowId);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipMainWindowIdOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipMainWindowIdIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_SetPipMainWindowId(nullptr, Window::g_windowId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipMainWindowIdIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipTemplateTypeOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_SetPipTemplateType(pipConfig,
                                                            PictureInPicture_PipTemplateType(mt() % PARAM_4));
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipMainWindowIdOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipTemplateTypeIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_SetPipTemplateType(nullptr, PictureInPicture_PipTemplateType(mt() % PARAM_4));
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipMainWindowIdIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipRectOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    uint32_t width = mt() % PARAM_270;
    uint32_t height = width * PARAM_2 / PARAM_3;
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipRectOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipRectIncorrectParam(napi_env env, napi_callback_info info)
{
    uint32_t width = mt() % PARAM_270;
    uint32_t height = width * PARAM_2 / PARAM_3;
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_SetPipRect(nullptr, width, height);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipRectIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipControlGroupOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t index = mt() % PARAM_5;
    PictureInPicture_PipControlGroup pipControlGroup[PARAM_5][PARAM_4] = {
        {
            VIDEO_PLAY_VIDEO_PREVIOUS_NEXT,
            VIDEO_PLAY_FAST_FORWARD_BACKWARD
        },
        {
            VIDEO_CALL_MICROPHONE_SWITCH,
            VIDEO_CALL_HANG_UP_BUTTON,
            VIDEO_CALL_CAMERA_SWITCH,
            VIDEO_CALL_MUTE_SWITCH
        },
        {
            VIDEO_MEETING_HANG_UP_BUTTON,
            VIDEO_MEETING_CAMERA_SWITCH,
            VIDEO_MEETING_MUTE_SWITCH,
            VIDEO_MEETING_MICROPHONE_SWITCH
        },
        {
            VIDEO_LIVE_VIDEO_PLAY_PAUSE,
            VIDEO_LIVE_MUTE_SWITCH
        },
        {}
    };
    int32_t result = OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup[index], index != PARAM_5 ?
                                                            sizeof(pipControlGroup[index]) /
                                                            sizeof(pipControlGroup[index][PARAM_0]) : PARAM_0);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipControlGroupOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipControlGroupIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t index = mt() % PARAM_5;
    PictureInPicture_PipControlGroup pipControlGroup[PARAM_5][PARAM_4] = {
        {
            VIDEO_PLAY_VIDEO_PREVIOUS_NEXT,
            VIDEO_PLAY_FAST_FORWARD_BACKWARD
        },
        {
            VIDEO_CALL_MICROPHONE_SWITCH,
            VIDEO_CALL_HANG_UP_BUTTON,
            VIDEO_CALL_CAMERA_SWITCH,
            VIDEO_CALL_MUTE_SWITCH
        },
        {
            VIDEO_MEETING_HANG_UP_BUTTON,
            VIDEO_MEETING_CAMERA_SWITCH,
            VIDEO_MEETING_MUTE_SWITCH,
            VIDEO_MEETING_MICROPHONE_SWITCH
        },
        {
            VIDEO_LIVE_VIDEO_PLAY_PAUSE,
            VIDEO_LIVE_MUTE_SWITCH
        },
        {}
    };
    int32_t result = OH_PictureInPicture_SetPipControlGroup(nullptr, pipControlGroup[index], index != PARAM_5 ?
                                                            sizeof(pipControlGroup[index]) /
                                                            sizeof(pipControlGroup[index][PARAM_0]) : PARAM_0);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipControlGroupIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipNapiEnvOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_SetPipNapiEnv(pipConfig, &env);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipRectOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipNapiEnvIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_SetPipNapiEnv(nullptr, &env);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    int32_t result1 = OH_PictureInPicture_SetPipNapiEnv(pipConfig, nullptr);
    result = result1 == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipNapiEnvIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreatePipOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    int32_t result = OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "CreatePipOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreatePipPipInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    int32_t result = PARAM_NEGATIVE_1;
#define IS_BUILD
#undef IS_BUILD
#ifdef IS_BUILD
    do {
        result = OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
        controllerId++;
    } while (result == OK);
    controllerId--;
    do {
        OH_PictureInPicture_DeletePip(controllerId);
        controllerId--;
    } while (controllerId >= PARAM_0 && result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED);
#endif
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "CreatePipPipInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartPipPipCreateFailed(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId + PARAM_99);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    int32_t result = OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    result = result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
                       OH_PictureInPicture_StartPip(controllerId) : result;
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED ? WINDOW_MANAGER_ERRORCODE_PIP_CREATE_FAILED : result;
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StartPipPipCreateFailed: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartPipIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_StartPip(PARAM_NEGATIVE_1);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StartPipIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartPipPipStateAbnormal(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    int32_t index = mt() % PARAM_5;
    uint32_t width = mt() % PARAM_270;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_windowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(index % PARAM_4));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[PARAM_5][PARAM_4] = {
        {
            VIDEO_PLAY_VIDEO_PREVIOUS_NEXT,
            VIDEO_PLAY_FAST_FORWARD_BACKWARD
        },
        {
            VIDEO_CALL_MICROPHONE_SWITCH,
            VIDEO_CALL_HANG_UP_BUTTON,
            VIDEO_CALL_CAMERA_SWITCH,
            VIDEO_CALL_MUTE_SWITCH
        },
        {
            VIDEO_MEETING_HANG_UP_BUTTON,
            VIDEO_MEETING_CAMERA_SWITCH,
            VIDEO_MEETING_MUTE_SWITCH,
            VIDEO_MEETING_MICROPHONE_SWITCH
        },
        {
            VIDEO_LIVE_VIDEO_PLAY_PAUSE,
            VIDEO_LIVE_MUTE_SWITCH
        },
        {}
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup[index], index != PARAM_5 ?
                                           sizeof(pipControlGroup[index]) /
                                           sizeof(pipControlGroup[index][PARAM_0]) : PARAM_0);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    int32_t result = OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    result = result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
                       OH_PictureInPicture_StartPip(controllerId) : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StartPipPipStateAbnormal: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StartPipPipInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_StartPip(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StartPipPipInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StopPipIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_StopPip(PARAM_NEGATIVE_1);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StopPipIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StopPipPipDestroyFailed(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    int32_t result = OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    result = result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
                       OH_PictureInPicture_StartPip(controllerId) : result;
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StopPipPipDestroyFailed: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value StopPipInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    int32_t result = OH_PictureInPicture_StopPip(PARAM_NEGATIVE_1);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "StopPipInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UpdatePipContentSizeIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UpdatePipContentSize(PARAM_NEGATIVE_1, width * PARAM_2, height * PARAM_2);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : OK;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UpdatePipContentSizeInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UpdatePipContentSize(controllerId, PARAM_0, PARAM_0);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : OK;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UpdatePipControlStatusIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UpdatePipControlStatus(PARAM_NEGATIVE_1,
                                                                PictureInPicture_PipControlType(mt() % PARAM_9),
                                                                PictureInPicture_PipControlStatus(mt() % PARAM_2));
    result = result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? result :
                       OH_PictureInPicture_UpdatePipControlStatus(controllerId,
                                                                  PictureInPicture_PipControlType(PARAM_9),
                                                                  PictureInPicture_PipControlStatus(PARAM_2));
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UpdatePipControlStatusInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UpdatePipControlStatus(controllerId,
                                                                PictureInPicture_PipControlType(mt() % PARAM_9),
                                                                PictureInPicture_PipControlStatus(mt() % PARAM_2));
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : OK;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipControlEnabledIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_SetPipControlEnabled(PARAM_NEGATIVE_1,
                                                              PictureInPicture_PipControlType(mt() % PARAM_9),
                                                              mt() % PARAM_2);
    result = result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? result :
                       OH_PictureInPicture_SetPipControlEnabled(controllerId, PictureInPicture_PipControlType(PARAM_9),
                                                                mt() % PARAM_2);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipControlEnabledInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_SetPipControlEnabled(controllerId,
                                                              PictureInPicture_PipControlType(mt() % PARAM_9),
                                                              mt() % PARAM_2);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UpdatePipContentSizeInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipInitialSurfaceRectParameterOverride(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    int32_t positionX = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    int32_t positionY = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, positionX, positionY, width, height);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipInitialSurfaceRectParameterOverride: %{public}d", result);
    controllerId = PARAM_NEGATIVE_1;
    result = result != OK ? PARAM_NEGATIVE_1 :
             OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, positionX, positionY, width, height) ==
             WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? PARAM_NEGATIVE_2 : PARAM_NEGATIVE_3;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipInitialSurfaceRectParameterOverride: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipInitialSurfaceRectOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    int32_t positionX = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    int32_t positionY = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, OK, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, positionX, positionY, width, height);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipInitialSurfaceRectOk: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipInitialSurfaceRectIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    int32_t positionX = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    int32_t positionY = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM, &retValue);
        return retValue;
    }
    controllerId = PARAM_NEGATIVE_1;
    int32_t result = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, positionX, positionY, width, height);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipInitialSurfaceRectIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value SetPipInitialSurfaceRectPipInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    int32_t positionX = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    int32_t positionY = mt() % PARAM_201 - PARAM_100; // 按文档应该无限制
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_SetPipInitialSurfaceRect(controllerId, positionX, positionY, width, height);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "SetPipInitialSurfaceRectPipInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnsetPipInitialSurfaceRectParameterOverride(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, PARAM_NEGATIVE_2, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId);
    controllerId = PARAM_NEGATIVE_1;
    result = result != OK ? PARAM_NEGATIVE_1 :
                       OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId) ==
                       WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? PARAM_NEGATIVE_2 : PARAM_NEGATIVE_3;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnsetPipInitialSurfaceRectParameterOverride: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnsetPipInitialSurfaceRectOk(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, OK, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnsetPipInitialSurfaceRectOk: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnsetPipInitialSurfaceRectIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnsetPipInitialSurfaceRectIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnsetPipInitialSurfaceRectPipInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnsetPipInitialSurfaceRect(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnsetPipInitialSurfaceRectPipInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterStartPipCallbackOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterStartPipCallbackOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterStartPipCallbackIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterStartPipCallbackIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterStartPipCallbackInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterStartPipCallbackInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterStartPipCallbackOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    int32_t result = OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterStartPipCallbackOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterStartPipCallbackIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    int32_t result = OH_PictureInPicture_UnregisterStartPipCallback(controllerId, nullptr);
    if (result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM) {
        OH_PictureInPicture_DestroyPipConfig(&pipConfig);
        OH_PictureInPicture_DeletePip(controllerId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                     "UnregisterStartPipCallbackIncorrectParam: %{public}d", result);
        napi_create_int32(env, result, &retValue);
        return retValue;
    }
    controllerId = PARAM_NEGATIVE_1;
    result = OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterStartPipCallbackIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterStartPipCallbackInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterStartPipCallbackInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllStartPipCallbacksOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    OH_PictureInPicture_RegisterStartPipCallback(controllerId, WebPipStartPipCallBack);
    int32_t result = OH_PictureInPicture_UnregisterAllStartPipCallbacks(controllerId);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllStartPipCallbacksOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllStartPipCallbacksIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1;
    int32_t result = OH_PictureInPicture_UnregisterAllStartPipCallbacks(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllStartPipCallbacksIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllStartPipCallbacksInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllStartPipCallbacks(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllStartPipCallbacksInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterLifecycleListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterLifecycleListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterLifecycleListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterLifecycleListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterLifecycleListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterLifecycleListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterLifecycleListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    int32_t result = OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterLifecycleListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterLifecycleListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UnregisterLifecycleListener(controllerId, nullptr);
    if (result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM) {
        OH_PictureInPicture_DestroyPipConfig(&pipConfig);
        OH_PictureInPicture_DeletePip(controllerId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                     "UnregisterLifecycleListenerIncorrectParam: %{public}d", result);
        napi_create_int32(env, result, &retValue);
        return retValue;
    }
    controllerId = PARAM_NEGATIVE_1; // 非负整数
    result = OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterLifecycleListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterLifecycleListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterLifecycleListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllLifecycleListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_UnregisterAllLifecycleListeners(controllerId);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllLifecycleListenersOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllLifecycleListenersIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllLifecycleListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllLifecycleListenersIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllLifecycleListenersInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllLifecycleListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllLifecycleListenersInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterControlEventListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterControlEventListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterControlEventListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterControlEventListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    OH_PictureInPicture_RegisterControlEventListener(controllerId, WebPipControlEventCallBack);
    int32_t result = OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterControlEventListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UnregisterControlEventListener(controllerId, nullptr);
    if (result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM) {
        OH_PictureInPicture_DestroyPipConfig(&pipConfig);
        OH_PictureInPicture_DeletePip(controllerId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                     "UnregisterControlEventListenerIncorrectParam: %{public}d", result);
        napi_create_int32(env, result, &retValue);
        return retValue;
    }
    controllerId = PARAM_NEGATIVE_1; // 非负整数
    result = OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterControlEventListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterControlEventListener(controllerId, WebPipControlEventCallBack);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllControlEventListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_UnregisterAllControlEventListeners(controllerId);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllControlEventListenersIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllControlEventListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllControlEventListenersInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllControlEventListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterResizeListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterResizeListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value RegisterResizeListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "RegisterControlEventListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterResizeListenerOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    OH_PictureInPicture_RegisterResizeListener(controllerId, WebPipResizeCallback);
    int32_t result = OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterResizeListenerIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_UnregisterResizeListener(controllerId, nullptr);
    if (result != WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM) {
        OH_PictureInPicture_DestroyPipConfig(&pipConfig);
        OH_PictureInPicture_DeletePip(controllerId);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                     "UnregisterControlEventListenerIncorrectParam: %{public}d", result);
        napi_create_int32(env, result, &retValue);
        return retValue;
    }
    controllerId = PARAM_NEGATIVE_1; // 非负整数
    result = OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterResizeListenerInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterResizeListener(controllerId, WebPipResizeCallback);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterControlEventListenerInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllResizeListenersOkOrDeviceNotSupported(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_UnregisterAllResizeListeners(controllerId);
    result = result == OK || result == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
             OK : WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM;
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersOkOrDeviceNotSupported: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllResizeListenersIncorrectParam(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_NEGATIVE_1; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllResizeListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM ? WINDOW_MANAGER_ERRORCODE_INCORRECT_PARAM : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersIncorrectParam: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value UnregisterAllResizeListenersInternalError(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_0; // 非负整数
    int32_t result = OH_PictureInPicture_UnregisterAllResizeListeners(controllerId);
    result = result == WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR;
    result = result ? WINDOW_MANAGER_ERRORCODE_PIP_INTERNAL_ERROR : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "UnregisterAllControlEventListenersInternalError: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WindowManagerErrorCodePipRepeatedOperation(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0;
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40;
    uint32_t height = width * PARAM_2 / PARAM_3;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    OH_PictureInPicture_DestroyPipConfig(&pipConfig);
    int32_t result = OH_PictureInPicture_StartPip(controllerId);
    result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
              OH_PictureInPicture_StartPip(controllerId) : result;
    result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED ?
              OH_PictureInPicture_StartPip(controllerId) : result;
    OH_PictureInPicture_StopPip(controllerId);
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "WindowManagerErrorCodePipRepeatedOperation: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value WindowManagerErrorCodeIncorrectParam(napi_env env, napi_callback_info info)
{
    return CreatePipConfigIncorrectParam(env, info);
}

napi_value WindowManagerErrorCodeCreateFailed(napi_env env, napi_callback_info info)
{
    return StartPipPipCreateFailed(env, info);
}

napi_value WindowManagerErrorCodePipStateAbnormal(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_0; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId + PARAM_99);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    if (OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr) == WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED, &retValue);
        return retValue;
    }
    int32_t result = OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result = result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED && result == OK ?
              OH_PictureInPicture_StopPip(controllerId) : result;
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "WindowManagerErrorCodePipStateAbnormal: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value PictureInPicturePipStatePart1(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    PictureInPicture_PipConfig pipConfig;
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    uint32_t controllerId = PARAM_12; // 非负整数
    uint32_t* controllerIdPtr = &controllerId;
    uint32_t width = mt() % PARAM_26 * PARAM_10 + PARAM_40; // 正数
    uint32_t height = width * PARAM_2 / PARAM_3; // 正数
    OH_PictureInPicture_CreatePipConfig(&pipConfig);
    OH_PictureInPicture_SetPipMainWindowId(pipConfig, Window::g_mainWindowId);
    OH_PictureInPicture_SetPipTemplateType(pipConfig, PictureInPicture_PipTemplateType(PARAM_0));
    OH_PictureInPicture_SetPipRect(pipConfig, width, height);
    PictureInPicture_PipControlGroup pipControlGroup[] = {
        VIDEO_PLAY_FAST_FORWARD_BACKWARD
    };
    OH_PictureInPicture_SetPipControlGroup(pipConfig, pipControlGroup, PARAM_1);
    OH_PictureInPicture_SetPipNapiEnv(pipConfig, env);
    OH_PictureInPicture_CreatePip(pipConfig, controllerIdPtr);
    int32_t result = OH_PictureInPicture_RegisterLifecycleListener(controllerId, WebPipLifecycleCallBack);
    result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED && result == OK ?
              OH_PictureInPicture_StartPip(controllerId) : result;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "PictureInPicturePipStatePart1: %{public}d", result);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value PictureInPicturePipStatePart2(napi_env env, napi_callback_info info)
{
    napi_value retValue = PARAM_0;
    uint32_t controllerId = PARAM_12; // 非负整数
    int32_t result = OH_PictureInPicture_StopPip(controllerId);
    result != WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED && result == OK ?
              OH_PictureInPicture_UnregisterLifecycleListener(controllerId, WebPipLifecycleCallBack) : result;
    OH_PictureInPicture_DeletePip(controllerId);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "WindowPip",
                 "PictureInPicturePipStatePart2: %{public}d", result);
    retValue = CreatePipStateArray(env, info, PARAM_6, pipStateArray);
    for (int i = PARAM_0; i < PARAM_6; i++) {
        pipStateArray[i] = PictureInPicture_PipState(PARAM_NEGATIVE_1);
    }
    return retValue;
}

}