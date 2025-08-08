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

#include "napi/native_api.h"
#include <climits>
#include <fcntl.h>
#include <sys/ipc.h>
#include <unistd.h>

#define SUCCESS 1
#define FAIL (-1)
#define NOERROR 0
#define PARAM_0777 0777

static napi_value Ftok(napi_env env, napi_callback_info info)
{
    int value = FAIL;
    int fp = open("/data/storage/el2/base/files/Fzl.txt", O_CREAT, PARAM_0777);
    key_t ret = ftok("/data/storage/el2/base/files/Fzl.txt", SUCCESS);
    if (ret != FAIL) {
        value = SUCCESS;
    }
    close(fp);
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ftok", nullptr, Ftok, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "ipc",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }