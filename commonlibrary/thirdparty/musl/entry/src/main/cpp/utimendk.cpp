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
#include <cstdlib>
#include <ctime>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <unistd.h>
#include <utime.h>
#include <utmp.h>
#include <uv.h>

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define SIZE_64 64
#define PARAM_0777 0777

static napi_value Utime(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    struct utimbuf ubuf;
    struct stat statinfo;
    int toCppResult = FAIL;

    size_t length = SIZE_64, stresult = PARAM_0;
    char strTemp[length];
    napi_get_value_string_utf8(env, args[0], strTemp, length, &stresult);

    int fd = open(strTemp, O_CREAT, PARAM_0777);

    close(fd);

    stat(strTemp, &statinfo);
    ubuf.modtime = PARAM_0;
    time(&ubuf.actime);
    if (utime(strTemp, &ubuf) == PARAM_0) {
        stat(strTemp, &statinfo);
        if (statinfo.st_mtim.tv_sec == PARAM_0) {
            toCppResult = PARAM_1;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, toCppResult, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"utime", nullptr, Utime, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "utime",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
