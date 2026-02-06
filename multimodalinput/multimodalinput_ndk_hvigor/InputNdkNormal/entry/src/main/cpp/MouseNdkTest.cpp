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
#include "napi/native_api.h"
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include "hilog/log.h"
#include <bits/alltypes.h>
#include <thread>
#include <iostream>

#undef LOG_TAG
#define LOG_TAG "MMI"

const int GLOBAL_RESMGR = 0xFF00;
const char *TAG = "[SensorCapiSample]";

static napi_value GetPointerLocation1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayX;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_DEVICE_NO_POINTER || retResult == INPUT_APP_NOT_FOCUSED) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation2(napi_env env, napi_callback_info info)
{
    napi_value result;

    double displayX;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(nullptr, &displayX, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation3(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayY;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, nullptr, &displayY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0300 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation4(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t displayId;
    double displayX;
    Input_Result retResult = OH_Input_GetPointerLocation(&displayId, &displayX, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0400 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value GetPointerLocation5(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_GetPointerLocation(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetPointerLocation_0500 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value RequestInjection1(napi_env env, napi_callback_info info)
{
    napi_value result;

    auto fnCallBack = [](Input_InjectionStatus authorizedStatus) {
        OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RequestInjection_0100 authorizedStatus:%{public}d", authorizedStatus);
    };
    Input_Result retResult = OH_Input_RequestInjection(fnCallBack);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RequestInjection_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == 801 || retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_INJECTION_AUTHORIZING || retResult == INPUT_INJECTION_AUTHORIZED_OTHERS) ? 1 : 0, &result);
    return result;
}

static napi_value QueryAuthorizedStatus1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_InjectionStatus status;
    Input_Result retResult = OH_Input_QueryAuthorizedStatus(&status);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryAuthorizedStatus_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        ((retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION) &&
        (status == UNAUTHORIZED || status == AUTHORIZING)) ? 1 : 0, &result);
    return result;
}

static napi_value InjectMouseEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalX(mouseEvent, 100);
    OH_Input_SetMouseEventGlobalY(mouseEvent, 100);
    int32_t retResult = OH_Input_InjectMouseEventGlobal(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (mouseEvent != nullptr && retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value InjectMouseEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalX(mouseEvent, 100);
    int32_t globalX = OH_Input_GetMouseEventGlobalX(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0200 globalX:%{public}d", globalX);
    napi_create_int32(env, (mouseEvent != nullptr && globalX == 100) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

static napi_value InjectMouseEventGlobal3(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_MouseEvent* mouseEvent = OH_Input_CreateMouseEvent();
    OH_Input_SetMouseEventGlobalY(mouseEvent, 100);
    int32_t globalY = OH_Input_GetMouseEventGlobalY(mouseEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectMouseEventGlobal_0300 globalY:%{public}d", globalY);
    napi_create_int32(env, (mouseEvent != nullptr && globalY == 100) ? 1 : 0, &result);
    OH_Input_DestroyMouseEvent(&mouseEvent);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetPointerLocation1", nullptr, GetPointerLocation1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPointerLocation2", nullptr, GetPointerLocation2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPointerLocation3", nullptr, GetPointerLocation3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPointerLocation4", nullptr, GetPointerLocation4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPointerLocation5", nullptr, GetPointerLocation5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RequestInjection1", nullptr, RequestInjection1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QueryAuthorizedStatus1", nullptr, QueryAuthorizedStatus1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectMouseEventGlobal1", nullptr, InjectMouseEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectMouseEventGlobal2", nullptr, InjectMouseEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectMouseEventGlobal3", nullptr, InjectMouseEventGlobal3, nullptr, nullptr, nullptr, napi_default, nullptr},

    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libmousendk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}