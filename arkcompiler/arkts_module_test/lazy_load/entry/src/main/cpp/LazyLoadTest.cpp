/**
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

#include <cstddef>
#include <cstring>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_TAG "MY_TAG"
#include "hilog/log.h"
#include "napi/native_api.h"

static napi_value LoadModuleWithInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    napi_value argName = args[0];
    napi_value argPath = args[1];
    char name[255] = {0};
    size_t nameLen = 0;
    napi_get_value_string_utf8(env, argName, name, sizeof(name), &nameLen);
    char path[255] = {0};
    size_t pathLen = 0;
    napi_get_value_string_utf8(env, argPath, path, sizeof(path), &pathLen);
    
    napi_value result;
    napi_status status;
    OH_LOG_ERROR(LOG_APP, "napi_load_module_with_info CPP name %{public}s", name);
    OH_LOG_ERROR(LOG_APP, "napi_load_module_with_info CPP path %{public}s", path);
    if (pathLen == 0) {
        status = napi_load_module_with_info(env, name, "", &result);
    } else {
        status = napi_load_module_with_info(env, name, path, &result);
    }
    OH_LOG_ERROR(LOG_APP, "napi_load_module_with_info CPP status %{public}d", status);
    if (status != napi_ok) {
        return nullptr;
    }
    return result;
}

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

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "loadModuleWithInfo", nullptr, LoadModuleWithInfo, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    OH_LOG_ERROR(LOG_APP, "lazy xts CPP Init");
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
    OH_LOG_ERROR(LOG_APP, "lazy xts CPP RegisterEntryModule");
}