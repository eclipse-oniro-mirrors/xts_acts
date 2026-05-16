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
#include "DialogGetStateTest.h"
#include "DialogTest.h"
#include "DragAndDropTest.h"
#include "DragAndDrop1Test.h"
#include "DragAndDrop2Test.h"
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
#define PARAM_0 0
#define LOG_PRINT_DOMAIN 0xFF00
#include "DialogGetStateTest.h"
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
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation1(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_90) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation2(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_180) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value GetDefaultDisplayRotation3(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Rotation displayRotation;
    NativeDisplayManager_ErrorCode ret = OH_NativeDisplayManager_GetDefaultDisplayRotation(&displayRotation);
    if (displayRotation == DISPLAY_MANAGER_ROTATION_270) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
// 获取屏幕的旋转方向
static napi_value DisplayManagerPortrait0(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_PORTRAIT) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

static napi_value DisplayManagerPortrait1(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_LANDSCAPE) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait2(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_PORTRAIT_INVERTED) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait3(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (displayOrientation == DISPLAY_MANAGER_LANDSCAPE_INVERTED) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}
static napi_value DisplayManagerPortrait4(napi_env env, napi_callback_info info)
{
    NativeDisplayManager_Orientation displayOrientation;
    int32_t ret = OH_NativeDisplayManager_GetDefaultDisplayOrientation(&displayOrientation);
    if (ret == DISPLAY_MANAGER_UNKNOWN) {
        // 错误处理
        napi_value napiRet;
        napi_create_int32(env, ret, &napiRet);
        return napiRet;
    }
    // 错误处理
    napi_value napiRet;
    napi_create_int32(env, ret, &napiRet);
    return napiRet;
}

napi_property_descriptor desc[] = {
    {"DialogDismissBackPress", nullptr, DialogDismissBackPress, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DialogDismissCloseButton", nullptr, DialogDismissCloseButton, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"DialogDismissTouchOutside", nullptr, DialogDismissTouchOutside, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"DialogDismissSlideDown", nullptr, DialogDismissSlideDown, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DialogModelTest_001", nullptr, DialogModelTest_001, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DialogModelTest_002", nullptr, DialogModelTest_002, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DialogModelTest_003", nullptr, DialogModelTest_003, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    {"DragAndDropTest01", nullptr, DragAndDropTest01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest02", nullptr, DragAndDropTest02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest101", nullptr, DragAndDropTest101, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest102", nullptr, DragAndDropTest102, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest201", nullptr, DragAndDropTest201, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest202", nullptr, DragAndDropTest202, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest203", nullptr, DragAndDropTest203, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest204", nullptr, DragAndDropTest204, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest205", nullptr, DragAndDropTest205, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest206", nullptr, DragAndDropTest206, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest207", nullptr, DragAndDropTest207, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest208", nullptr, DragAndDropTest208, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest209", nullptr, DragAndDropTest209, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest210", nullptr, DragAndDropTest210, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest211", nullptr, DragAndDropTest211, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest212", nullptr, DragAndDropTest212, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest213", nullptr, DragAndDropTest213, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest214", nullptr, DragAndDropTest214, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest215", nullptr, DragAndDropTest215, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest216", nullptr, DragAndDropTest216, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest217", nullptr, DragAndDropTest217, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest218", nullptr, DragAndDropTest218, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest219", nullptr, DragAndDropTest219, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest220", nullptr, DragAndDropTest220, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest221", nullptr, DragAndDropTest221, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest222", nullptr, DragAndDropTest222, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest223", nullptr, DragAndDropTest223, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest224", nullptr, DragAndDropTest224, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest225", nullptr, DragAndDropTest225, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest226", nullptr, DragAndDropTest226, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest227", nullptr, DragAndDropTest227, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest228", nullptr, DragAndDropTest228, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest229", nullptr, DragAndDropTest229, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest230", nullptr, DragAndDropTest230, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest231", nullptr, DragAndDropTest231, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest232", nullptr, DragAndDropTest232, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest233", nullptr, DragAndDropTest233, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest234", nullptr, DragAndDropTest234, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest235", nullptr, DragAndDropTest235, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest236", nullptr, DragAndDropTest236, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest237", nullptr, DragAndDropTest237, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest238", nullptr, DragAndDropTest238, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest239", nullptr, DragAndDropTest239, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest240", nullptr, DragAndDropTest240, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest241", nullptr, DragAndDropTest241, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest242", nullptr, DragAndDropTest242, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest243", nullptr, DragAndDropTest243, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest244", nullptr, DragAndDropTest244, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"DragAndDropTest245", nullptr, DragAndDropTest245, nullptr, nullptr, nullptr, napi_default, nullptr}
};
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
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
