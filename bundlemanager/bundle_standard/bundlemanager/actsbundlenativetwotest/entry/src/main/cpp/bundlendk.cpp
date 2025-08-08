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
#include "bundle/native_interface_bundle.h"

#include <cstdio>
#include <cstdlib>
#include <js_native_api_types.h>

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
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

static napi_value IsDebugMode(napi_env env, napi_callback_info info)
{
    bool isBool = false;
    OH_NativeBundle_IsDebugMode(&isBool);
    napi_value sum;
    napi_get_boolean(env, isBool, &sum);
    return sum;
}


static napi_value GetModuleMetadata(napi_env env, napi_callback_info info)
{
    size_t moduleCount = 0;
    OH_NativeBundle_ModuleMetadata* modules = OH_NativeBundle_GetModuleMetadata(&moduleCount);
    if (modules == nullptr || moduleCount == 0) {
        napi_throw_error(env, nullptr, "No metadata found");
        return nullptr;
    }

    napi_value result;
    napi_create_array(env, &result);

    for (size_t i = 0; i < moduleCount; i++) {
        napi_value moduleObj;
        napi_create_object(env, &moduleObj);

        napi_value moduleName;
        napi_create_string_utf8(env, modules[i].moduleName, NAPI_AUTO_LENGTH, &moduleName);
        napi_set_named_property(env, moduleObj, "moduleName", moduleName);

        napi_value metadataArray;
        napi_create_array(env, &metadataArray);

        for (size_t j = 0; j < modules[i].metadataArraySize; j++) {
            napi_value metadataObj;
            napi_create_object(env, &metadataObj);

            napi_value name;
            napi_value value;
            napi_value resource;
            
            napi_create_string_utf8(env, modules[i].metadataArray[j].name, NAPI_AUTO_LENGTH, &name);
            napi_create_string_utf8(env, modules[i].metadataArray[j].value, NAPI_AUTO_LENGTH, &value);
            napi_create_string_utf8(env, modules[i].metadataArray[j].resource, NAPI_AUTO_LENGTH, &resource);

            napi_set_named_property(env, metadataObj, "name", name);
            napi_set_named_property(env, metadataObj, "value", value);
            napi_set_named_property(env, metadataObj, "resource", resource);

            napi_set_element(env, metadataArray, j, metadataObj);
        }

        napi_set_named_property(env, moduleObj, "metadata", metadataArray);
        napi_set_element(env, result, i, moduleObj);
    }

    for (size_t i = 0 ; i < moduleCount; i++) {
        free(modules[i].moduleName);
        for (size_t j = 0; j < modules[i].metadataArraySize; j++) {
            free(modules[i].metadataArray[j].name);
            free(modules[i].metadataArray[j].value);
            free(modules[i].metadataArray[j].resource);
        }
        free(modules[i].metadataArray);
    }
    free(modules);
    return result;
}

static napi_value GetCurrentApplicationInfo(napi_env env, napi_callback_info info)
{
    OH_NativeBundle_ApplicationInfo nativeApplicationInfo = OH_NativeBundle_GetCurrentApplicationInfo();
    napi_value result = nullptr;
    napi_create_object(env, &result);
    napi_value bundleName;
    napi_create_string_utf8(env, nativeApplicationInfo.bundleName, NAPI_AUTO_LENGTH, &bundleName);
    napi_set_named_property(env, result, "bundleName", bundleName);
    napi_value fingerprint;
    napi_create_string_utf8(env, nativeApplicationInfo.fingerprint, NAPI_AUTO_LENGTH, &fingerprint);
    napi_set_named_property(env, result, "fingerprint", fingerprint);
    free(nativeApplicationInfo.bundleName);
    free(nativeApplicationInfo.fingerprint);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "IsDebugMode", nullptr, IsDebugMode, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "GetModuleMetadata", nullptr, GetModuleMetadata, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getCurrentApplicationInfo", nullptr, GetCurrentApplicationInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    // 模块对外接口注册函数
    .nm_register_func = Init,
    // 自定义模块
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
