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
#include <cstdarg>
#include <syslog.h>
#define PARAM_0 0
#define ONEVAL (-1)
#define ONEVALS 1
#define SUCCESS 1
#define FAIL (-1)
#define NO_ERR 0
#define ERRON_0 0

static napi_value Openlog(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    const char param[] = "MyMsgMARK";
    openlog(param, LOG_PID, NO_ERR);
    int ret = FAIL;
    if (errno == NO_ERR) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Setlogmask(napi_env env, napi_callback_info info)
{
    int result = setlogmask(PARAM_0);

    if (result != setlogmask(result)) {
        napi_value result;
        napi_create_int32(env, ONEVAL, &result);
        return result;
    } else {
        napi_value result;
        napi_create_int32(env, PARAM_0, &result);
        return result;
    }
}

static napi_value Syslog(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int priority = LOG_USER;
    const char param[] = "MyMsgMARK";
    char message[] = "Hello, syslog!";
    openlog(param, LOG_PID, NO_ERR);
    syslog(priority, "%s", message);
    int ret = ONEVAL;
    if (errno == PARAM_0) {
        ret = ONEVALS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setlogmask", nullptr, Setlogmask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"openlog", nullptr, Openlog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"syslog", nullptr, Syslog, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "syslog",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
