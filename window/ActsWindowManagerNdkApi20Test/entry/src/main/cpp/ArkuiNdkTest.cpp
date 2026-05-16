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


#include "AbilityKit/ability_runtime/application_context.h"
#include "common/Common.h"
#include "napi/native_api.h"
#include <arkui/native_node_napi.h>
#include <cstdint>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <window_manager/oh_display_info.h>
#include <window_manager/oh_display_manager.h>
#define ON_CLICK_EVENT_ID 6001
#define ON_CLICK_EVENT_ID2 6015
#define ON_CLICK_EVENT_ID3 6016
#define ON_CLICK_EVENT_ID4 6017
#define ON_CLICK_EVENT_ID5 6018
#define SIZE_200 200
#define SIZE_300 300
#define COLOR_GREEN 0xFF00FF00
#define COLOR_BLUE 0xFF0000FF
#define LOG_PRINT_DOMAIN 0xFF00
#include <window_manager/oh_display_manager.h>
static napi_value GetDefaultDisplayRotation0(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_0) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation1(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_90) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation2(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_180) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation3(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    NativeDisplayManager_ErrorCode ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_270) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait0(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_PORTRAIT) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value DisplayManagerPortrait1(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_LANDSCAPE) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait2(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_PORTRAIT_INVERTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait3(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_LANDSCAPE_INVERTED) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait4(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (ret == DISPLAY_MANAGER_UNKNOWN) {
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"GetDefaultDisplayRotation0", nullptr, GetDefaultDisplayRotation0, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetDefaultDisplayRotation1", nullptr, GetDefaultDisplayRotation1, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetDefaultDisplayRotation2", nullptr, GetDefaultDisplayRotation2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"GetDefaultDisplayRotation3", nullptr, GetDefaultDisplayRotation3, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"DisplayManagerPortrait0", nullptr, DisplayManagerPortrait0, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DisplayManagerPortrait1", nullptr, DisplayManagerPortrait1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DisplayManagerPortrait2", nullptr, DisplayManagerPortrait2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DisplayManagerPortrait3", nullptr, DisplayManagerPortrait3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DisplayManagerPortrait4", nullptr, DisplayManagerPortrait4, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "osaccountndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
