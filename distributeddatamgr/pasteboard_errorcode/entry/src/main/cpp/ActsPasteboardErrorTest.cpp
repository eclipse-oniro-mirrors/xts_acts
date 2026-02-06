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
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include "database/pasteboard/oh_pasteboard.h"
#include "database/pasteboard/oh_pasteboard_err_code.h"

static int g_callbackValue;
static constexpr int UPDATE_VALUE = 1;
void ContextFinalizeFunc(void* context) {};
void CallbackFunc(void* context, Pasteboard_NotifyType type)
{
    g_callbackValue = UPDATE_VALUE;
}
static napi_value PasteboardRemoteDC(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pasteboard* pasteboard = OH_Pasteboard_Create();
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    OH_PasteboardObserver_SetData(observer, nullptr, CallbackFunc, ContextFinalizeFunc);
    int resRepeat = OH_Pasteboard_Subscribe(pasteboard, NOTIFY_REMOTE_DATA_CHANGE, observer);
    napi_create_int32(env, resRepeat == ERR_OK ? 0 : -1, &result);
    OH_Pasteboard_Destroy(pasteboard);
    OH_PasteboardObserver_Destroy(observer);
    return result;
}

static napi_value PasteboardDestroySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PasteboardObserver* observer = OH_PasteboardObserver_Create();
    int32_t ret = OH_PasteboardObserver_Destroy(observer);
    napi_create_int32(env, ret == ERR_OK ? 0 : -1, &result);
    return result;
}

static napi_value PasteboardDestroyError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_PasteboardObserver_Destroy(nullptr);
    napi_create_int32(env, ret == ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value PasteboardGetDataSourceInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    int len = 100;
    char source[100];
    int res = OH_Pasteboard_GetDataSource(nullptr, source, len);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value PasteboardSetDataInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    int res = OH_Pasteboard_SetData(nullptr, nullptr);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static napi_value PasteboardClearDataInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    int res = OH_Pasteboard_ClearData(nullptr);
    napi_create_int32(env, res == ERR_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"PasteboardRemoteDC", nullptr, PasteboardRemoteDC,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PasteboardDestroySuccess", nullptr, PasteboardDestroySuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PasteboardDestroyError", nullptr, PasteboardDestroyError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PasteboardGetDataSourceInvalidParameter",
            nullptr, PasteboardGetDataSourceInvalidParameter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PasteboardSetDataInvalidParameter",
            nullptr, PasteboardSetDataInvalidParameter, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PasteboardClearDataInvalidParameter",
            nullptr, PasteboardClearDataInvalidParameter, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "pasteboarderrorcode",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
