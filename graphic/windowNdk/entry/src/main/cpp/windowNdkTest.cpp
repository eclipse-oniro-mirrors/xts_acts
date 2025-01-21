/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "window_manager/oh_window_comm.h"
#include "window_manager/oh_window_event_filter.h"
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include <bits/alltypes.h>
#include <hilog/log.h>

static int keyCode1 = -1;
static bool filterESC(Input_KeyEvent *event){
    auto keyCode = OH_Input_GetKeyEventKeyCode(event);
    auto actionTime = OH_Input_GetKeyEventActionTime(event);
    auto action = OH_Input_GetKeyEventAction(event);
    return keyCode == keyCode1;
}

static napi_value filterKeyCode(napi_env env, napi_callback_info info){
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr, nullptr);
    
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    int32_t keyCode;
    napi_get_value_int32(env, args[1], &keyCode);
    keyCode1 = keyCode;
    auto result = OH_NativeWindowManager_RegisterKeyEventFilter(windowId, filterESC);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}
static napi_value unFilterKeyCode(napi_env env, napi_callback_info info) {
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc,  args,nullptr,nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    
    int32_t windowId;
    napi_get_value_int32(env, args[0], &windowId);
    
    auto result = OH_NativeWindowManager_UnregisterKeyEventFilter(windowId);
    napi_value res;
    napi_create_int32(env, result, &res);
    return res;
}




EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"filterKeyCode", nullptr, filterKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"unFilterKeyCode", nullptr, unFilterKeyCode, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
