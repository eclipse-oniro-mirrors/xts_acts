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
#include <cerrno>
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <pwd.h>
#include <sys/inotify.h>
#include <unistd.h>

#define ONEVAL 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define MINUSTHR (-3)
#define MAX_NAMBER 1024
#define TEST_BUFFER_SIZE 256
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0

static napi_value Getpwent(napi_env env, napi_callback_info info)
{
    struct passwd *p = getpwent();
    napi_value result = nullptr;
    if (p != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value Setpwent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct passwd *getval = getpwent();
    napi_value result;
    if (getval == nullptr) {
        napi_create_int32(env, MINUSONE, &result);
    }
    if (errno != PARAM_0) {
        napi_create_int32(env, errno, &result);
    }
    char buf[MAX_NAMBER] = {0};
    strcpy(buf, getval->pw_name);
    setpwent();
    getval = getpwent();
    if (getval == nullptr) {
        napi_create_int32(env, MINUSTWO, &result);
    }
    if (strcmp(getval->pw_name, buf)) {
        napi_create_int32(env, MINUSTHR, &result);
    }
    if (errno == PARAM_0) {
        napi_create_int32(env, errno, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}
static napi_value Getpwnam(napi_env env, napi_callback_info info)
{
    struct passwd *pw = nullptr;
    errno = ERRON_0;
    pw = getpwnam("root");
    napi_value result = nullptr;
    if (pw != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value EndPwEnt(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    int backResult = PARAM_0;
    endpwent();
    napi_value result = nullptr;
    napi_create_int32(env, backResult, &result);
    return result;
}

static napi_value GetpwnamR(napi_env env, napi_callback_info info)
{
    struct passwd pwd = {PARAM_0};
    struct passwd *p = nullptr;
    char buf[TEST_BUFFER_SIZE] = {PARAM_0};
    memset(&buf, PARAM_0, sizeof buf);
    getpwnam_r("root", &pwd, buf, TEST_BUFFER_SIZE, &p);
    napi_value result;
    if (p != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value GetpwuidR(napi_env env, napi_callback_info info)
{
    struct passwd pw = {PARAM_0};
    struct passwd *res = nullptr;
    char buf[TEST_BUFFER_SIZE];

    int ret = getpwuid_r(getuid(), &pw, buf, sizeof(buf), &res);
    napi_value result;
    if (ret != MINUSONE) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value Getpwuid(napi_env env, napi_callback_info info)
{
    struct passwd *ret = nullptr;
    errno = ERRON_0;
    ret = getpwuid(getuid());
    napi_value result = nullptr;
    if (ret != nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        if (errno == ERRON_0) {
            napi_create_int32(env, PARAM_0, &result);
        } else {
            napi_create_int32(env, PARAM_UNNORMAL, &result);
        }
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setpwent", nullptr, Setpwent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endpwent", nullptr, EndPwEnt, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpwent", nullptr, Getpwent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpwnam", nullptr, Getpwnam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpwnamR", nullptr, GetpwnamR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpwuid", nullptr, Getpwuid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getpwuidR", nullptr, GetpwuidR, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "pwd",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
