/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include "web/native_interface_arkweb.h"


static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);
    
    if (argc != 2) {
        napi_throw_type_error(env, nullptr, "Expected 2 arguments");
        return nullptr;
    }

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

napi_value test_ndk_setActiveWebEngineVersion(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value result = nullptr;
    size_t argc = 1;
    napi_value argv[1];
    int webEngineVersion;
 
    napi_get_cb_info(env, info, &argc, argv, &thisVar, nullptr);
    
    if (argc != 1) {
        napi_throw_error(env, nullptr, "Invalid number of arguments. Expected 1.");
        return nullptr; // 返回 nullptr 是 N-API 的约定，表示错误已抛出
    }
    
    napi_status status = napi_get_value_int32(env, argv[0], &webEngineVersion);
    if(status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return nullptr;
    }
    
    OH_NativeArkWeb_SetActiveWebEngineVersion(static_cast<ArkWebEngineVersion>(webEngineVersion));
    return result;
} 

napi_value test_ndk_setActiveWebEngineVersionEvergreen(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ArkWebEngineVersion::ARKWEB_EVERGREEN);
    return nullptr;
} 

napi_value test_ndk_setActiveWebEngineVersionEvergreen114(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ArkWebEngineVersion::ARKWEB_M114);
    return nullptr;
} 

napi_value test_ndk_setActiveWebEngineVersionEvergreen132(napi_env env, napi_callback_info info)
{
    OH_NativeArkWeb_SetActiveWebEngineVersion(ArkWebEngineVersion::ARKWEB_M132);
    return nullptr;
} 

static napi_value IsActiveWebEngineEvergreen_c(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool isEvergreen = OH_NativeArkWeb_IsActiveWebEngineEvergreen();
    napi_get_boolean(env, isEvergreen, &result);
    return result;
}

napi_value test_ndk_getActiveWebEngineVersion(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int return_value = static_cast<int>(OH_NativeArkWeb_GetActiveWebEngineVersion());
    napi_create_int32(env, return_value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "test_ndk_setActiveWebEngineVersion", nullptr, test_ndk_setActiveWebEngineVersion, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "test_ndk_getActiveWebEngineVersion", nullptr, test_ndk_getActiveWebEngineVersion, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "test_ndk_setActiveWebEngineVersionEvergreen", nullptr, test_ndk_setActiveWebEngineVersionEvergreen, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "test_ndk_setActiveWebEngineVersionEvergreen114", nullptr, test_ndk_setActiveWebEngineVersionEvergreen114, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "test_ndk_setActiveWebEngineVersionEvergreen132", nullptr, test_ndk_setActiveWebEngineVersionEvergreen132, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsActiveWebEngineEvergreen_c", nullptr, IsActiveWebEngineEvergreen_c, nullptr, nullptr, nullptr, napi_default, nullptr },
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




