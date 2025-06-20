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
#include <cstring>
#include <fcntl.h>
#include <js_native_api.h>
#include <node_api.h>
#include <pthread.h>
#include <unistd.h>
#include <utmp.h>

#define ONEVAL 1
#define MINUSONE (-1)
#define PARAM_3 3
#define PARAM_8 8
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define PARAM_0777 0777

static napi_value Setutent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    napi_value result;
    setutent();
    getutent();
    endutent();
    if (errno == PARAM_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value Pututline(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct utmp utmp;
    time_t t;
    setutent();
    memset(&utmp, PARAM_0, sizeof(utmp));
    utmp.ut_type = RUN_LVL;
    utmp.ut_pid = ('#' << PARAM_8) + PARAM_3 + '0';
    time(&t);
    utmp.ut_time = static_cast<int>(t);
    struct utmp *ret = pututline(&utmp);
    napi_value result;
    if (ret == nullptr) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Getutent(napi_env env, napi_callback_info info)
{
    struct utmp *p = getutent();
    napi_value result;
    if (p == nullptr) {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    } else {
        napi_create_int32(env, PARAM_0, &result);
    }
    return result;
}

static napi_value Utmpname(napi_env env, napi_callback_info info)
{
    int fp = open("/data/storage/el2/base/files/Fzl.txt", O_RDONLY);
    write(fp, "/data/storage/el2/base/files/Fzl.txt", sizeof("/data/storage/el2/base/files/Fzl.txt"));
    close(fp);
    int ret = utmpname("/data/storage/el2/base/files/Fzl.txt");
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value LoginTty(napi_env env, napi_callback_info info)
{
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT, PARAM_0777);
    int returnValue = login_tty(fileDescribe);
    close(fileDescribe);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setutent", nullptr, Setutent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pututline", nullptr, Pututline, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getutent", nullptr, Getutent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"login_tty", nullptr, LoginTty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"utmpname", nullptr, Utmpname, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "utmp",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
