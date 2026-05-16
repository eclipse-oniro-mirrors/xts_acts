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

#include <js_native_api.h>
#include <js_native_api_types.h>
#include <linux/capability.h>
#include <node_api.h>
#include <sys/capability.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define FAIL (-1)

static napi_value Capset(napi_env env, napi_callback_info info)
{
    struct __user_cap_header_struct cap_header;
    struct __user_cap_data_struct cap_data;
    //Test syscall encapsulation interface
    cap_header.pid = getpid();
    cap_header.version = _LINUX_CAPABILITY_VERSION_1;
    int ret = FAIL;
    if (capget(&cap_header, &cap_data) >= PARAM_0) {
        __u32 cap_mask = PARAM_0;
        cap_mask |= (PARAM_1 << CAP_NET_BIND_SERVICE);
        cap_data.effective = cap_mask;
        cap_data.permitted = cap_mask;
        cap_data.inheritable = PARAM_0;
        if (capset(&cap_header, &cap_data) >= PARAM_0) {
            ret = PARAM_1;
        }
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {{"capset", nullptr, Capset, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "capabilityndk",
    .nm_register_func = Init,
    .nm_modname = "capabilityndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }