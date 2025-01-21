/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain firstParam copy of the License at
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
#include <arpa/inet.h>
#include <cerrno>
#include <clocale>
#include <cmath>
#include <csignal>
#include <cstdio>
#include <cstring>
#include <dlfcn.h>
#include <fcntl.h>
#include <info/application_target_sdk_version.h>
#include <info/fatal_message.h>
#include <js_native_api_types.h>
#include <libgen.h>
#include <linux/quota.h>
#include <mntent.h>
#include <netdb.h>
#include <netinet/ether.h>
#include <pthread.h>
#include <regex.h>
#include <resolv.h>
#include <sched.h>
#include <sys/epoll.h>
#include <sys/eventfd.h>
#include <sys/file.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/xattr.h>
#include <syslog.h>
#include <threads.h>
#include <unistd.h>
#include <utmp.h>

#define NAMELEN 16
#define NSEC_PER_SEC 1000000000
#define NSEC_PER_100MS 100000000
#define NSEC_PER_MSEC 1000000
#define US_PER_S 1000000
#define MS_PER_S 1000
#define SLEEP_100_MS 100
#define DELAY_TIME_100_MS 100
#define SLEEP_50_MS 50
#define SLEEP_20_MS 20
#define MAXDNAME_A 1025
#define INIT (-1)
#define SUCCESS 0
#define NO_ERROR 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_5 5
#define PARAM_2 2
#define PARAM_32 32
#define PARAM_64 64
#define PARAM_10 10
#define PARAM_100 100
#define PARAM_256 256
#define PARAM_0777 0777
#define PARAM_64 64
#define PARAM_1024 1024
#define PARAM_8192 8192
#define SPNUM 1
#define MINUSONE (-1)
#define MINUSTWO (-2)
#define FAILD (-1)
#define PARAM_UNNORMAL (-1)
#define SIZE_10 10
#define TEST_MODE 0666
#define BUF_SIZE (100)
#define PORT 2288
#define PORT_2 2289
#ifndef tls_mod_off_t
#define tls_mod_off_t size_t
#define PARAM_72 72
#endif

extern "C" int __fstatat_time64(int, const char *__restrict, struct stat *__restrict, int);
extern "C" int __aeabi_atexit(void *obj, void (*func)(void *), void *d);
extern "C" uintptr_t __gnu_Unwind_Find_exidx(uintptr_t pc, int *pcount);

static napi_value FStatAt_time64(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_256;
    size_t strResult = PARAM_0;
    char ptr[length];
    napi_get_value_string_utf8(env, args[0], ptr, length, &strResult);
    int backParam = PARAM_UNNORMAL;
    struct stat st;
    int fd = open(ptr, O_RDWR | O_CREAT, TEST_MODE);
    lseek(fd, PARAM_0, SEEK_SET);
    backParam = __fstatat_time64(AT_FDCWD, ptr, &st, PARAM_0);
    close(fd);
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}


void exitFunc(void *arg){};
static napi_value Aeabiatexit(napi_env env, napi_callback_info info)
{
    int32_t var = PARAM_0;
    int backInfo = __aeabi_atexit(&var, exitFunc, nullptr);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value Gnuunwindfindexidx(napi_env env, napi_callback_info info)
{
    uintptr_t pc = PARAM_10;
    int32_t pcount = PARAM_32;
    int32_t backInfo = __gnu_Unwind_Find_exidx(pc, &pcount);
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"__fstatat_time64", nullptr, FStatAt_time64, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"aeabiatexit", nullptr, Aeabiatexit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gnuunwindfindexidx", nullptr, Gnuunwindfindexidx, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "libotherstestndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
