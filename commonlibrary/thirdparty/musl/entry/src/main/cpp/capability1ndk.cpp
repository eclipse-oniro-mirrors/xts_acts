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
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <linux/capability.h>
#include <node_api.h>
#include <sys/capability.h>
#include <unistd.h>
#include <uv.h>

#define PARAM_0 0
#define PARAM_1 1
#define FAIL (-1)
#define PARAM_UNNORMAL (-1)
#define ERRNO_0 0
#define ONEVAL 1

static napi_value CapGet(napi_env env, napi_callback_info info)
{
    size_t argc = ONEVAL;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    struct __user_cap_data_struct cap_data;
    errno = ERRNO_0;
    if (param == PARAM_0) {
        struct __user_cap_header_struct cap_header;
        cap_header.pid = getpid();
        cap_header.version = _LINUX_CAPABILITY_VERSION_1;
        ret = capget(&cap_header, &cap_data);
    } else {
        ret = capget(nullptr, &cap_data);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"capget", nullptr, CapGet, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "capability1ndk",
    .nm_register_func = Init,
    .nm_modname = "capability1ndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }