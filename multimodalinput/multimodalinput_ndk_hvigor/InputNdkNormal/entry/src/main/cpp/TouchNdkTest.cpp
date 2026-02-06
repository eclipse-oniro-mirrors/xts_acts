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

static napi_value QueryMaxTouchPoints1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_QueryMaxTouchPoints(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value QueryMaxTouchPoints2(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t count;
    int32_t minCount = -1;
    int32_t maxCount = 10;
    Input_Result retResult = OH_Input_QueryMaxTouchPoints(&count);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && (count >= minCount && count <= maxCount)) ? 1 : 0, &result);
    return result;
}

static napi_value InjectTouchEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    OH_Input_SetTouchEventAction(touchEvent, 1);
    int32_t retResult = OH_Input_InjectTouchEventGlobal(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (touchEvent != nullptr && retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    int32_t globalX = OH_Input_GetTouchEventGlobalX(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0200 globalX:%{public}d", globalX);
    napi_create_int32(env, (touchEvent != nullptr && globalX == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal3(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    int32_t globalY = OH_Input_GetTouchEventGlobalY(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0300 globalY:%{public}d", globalY);
    napi_create_int32(env, (touchEvent != nullptr && globalY == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value AxisEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalX(axisEvent, 100);
    int32_t globalX;
    Input_Result retResult = OH_Input_GetAxisEventGlobalX(axisEvent, &globalX);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalX == 100 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value AxisEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalY(axisEvent, 99);
    int32_t globalY;
    Input_Result retResult = OH_Input_GetAxisEventGlobalY(axisEvent, &globalY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalY == 99 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"QueryMaxTouchPoints1", nullptr, QueryMaxTouchPoints1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QueryMaxTouchPoints2", nullptr, QueryMaxTouchPoints2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal1", nullptr, InjectTouchEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal2", nullptr, InjectTouchEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal3", nullptr, InjectTouchEventGlobal3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal1", nullptr, AxisEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal2", nullptr, AxisEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libtouchndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}