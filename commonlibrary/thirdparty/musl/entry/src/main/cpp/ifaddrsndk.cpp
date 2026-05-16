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
#include <cerrno>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <utmp.h>
#include <uv.h>
#include <hilog/log.h>

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFEFE
#define LOG_TAG "MUSL_LIBCTEST"

static napi_value Getifaddrs(napi_env env, napi_callback_info info)
{
    struct ifaddrs *ifc;
    napi_value result = nullptr;
    errno = 0;
    int ret = getifaddrs(&ifc);
    if (ret != NO_ERR) {
        OH_LOG_INFO(LOG_APP, "Getifaddrs getifaddrs failed: ret %{public}d errno : %{public}d", ret, errno);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, ret, &result);
    freeifaddrs(ifc);
    return result;
}
static napi_value Freeifaddrs(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    errno = NO_ERR;
    struct ifaddrs *ifc;
    int res = getifaddrs(&ifc);
    if (res != NO_ERR) {
        OH_LOG_INFO(LOG_APP, "Freeifaddrs getifaddrs failed: res %{public}d errno : %{public}d", res, errno);
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    freeifaddrs(ifc);
    int ret = FAIL;
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getIfAddrs", nullptr, Getifaddrs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"freeIfAddrs", nullptr, Freeifaddrs, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libifaddrs",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
