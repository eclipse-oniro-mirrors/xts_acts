/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "common/napi_helper.cpp"
#include "napi/native_api.h"
#include <sys/statvfs.h>
#define ONE 1
#define TWO 2
#define PATH "/data/storage/el2/base/files"
#define PARAM_0 0
#define PARAM_1 1

static napi_value Statvfs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[0], &value);
    int intValue = PARAM_0;
    struct statvfs sb;
    if (value == ONE) {
        intValue = statvfs(PATH, &sb);
    } else if (value == TWO) {
        intValue = statvfs(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, intValue, &result);
    return result;
}
static napi_value Statvfs64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int value;
    napi_get_value_int32(env, args[0], &value);
    int intValue = PARAM_0;
    struct statvfs64 sb;
    if (value == ONE) {
        intValue = statvfs(PATH, &sb);
    } else if (value == TWO) {
        intValue = statvfs(nullptr, &sb);
    }
    napi_value result = nullptr;
    napi_create_int32(env, intValue, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"statvfs", nullptr, Statvfs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"statvfs64", nullptr, Statvfs64, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "statvfs",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
