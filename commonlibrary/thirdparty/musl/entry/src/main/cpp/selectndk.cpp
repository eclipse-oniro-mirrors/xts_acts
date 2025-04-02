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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cstdio>
#include <cstring>
#include <sys/select.h>
#include <sys/stat.h>
#include <sys/uio.h>
#include <unistd.h>

#define ONEVAL 1
#define MINUSONE (-1)
#define PARAM_1 1
#define PARAM_5 5
#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define TEN 10
#define TEST_MODE 0666

static napi_value Select(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    fd_set rfds;
    struct timeval tv;
    FD_ZERO(&rfds);
    FD_SET(PARAM_0, &rfds);
    int first = PARAM_0;
    napi_value result;
    napi_get_value_int32(env, args[0], &first);
    if (first == PARAM_0) {
        tv.tv_sec = PARAM_0;
        tv.tv_usec = PARAM_0;
        napi_create_double(env, MINUSONE, &result);
    } else {
        tv.tv_sec = PARAM_5;
        tv.tv_usec = PARAM_0;
        int retval = select(ONEVAL, &rfds, nullptr, nullptr, &tv);
        napi_create_int32(env, retval, &result);
    }
    return result;
}
static napi_value PSelect(napi_env env, napi_callback_info info)
{
    fd_set set = {PARAM_0};
    struct timespec timeout = {PARAM_0};
    timeout.tv_sec = PARAM_5;
    timeout.tv_nsec = PARAM_0;
    FD_ZERO(&set);
    FD_SET(STDOUT_FILENO, &set);
    int ret = FAIL;
    napi_value result = nullptr;
    ret = pselect(STDOUT_FILENO + PARAM_1, nullptr, &set, nullptr, &timeout, nullptr);
    if (ret != PARAM_1) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"select", nullptr, Select, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pSelect", nullptr, PSelect, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "select",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
