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
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <utmp.h>
#include <uv.h>

#define FALSE 0
#define TRUE 1
#define ERROR (-1)
#define TWO 2
#define ONE 1
#define NO_ERRORS 0
#define CHMOD 777

static napi_value InotifyInit(napi_env env, napi_callback_info info)
{
    int ret = inotify_init();
    napi_value result = nullptr;
    if (ret != ERROR) {
        ret = NO_ERRORS;
    }
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value InotifyInit1(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    int in_cloexec = TRUE;
    int inNonblock = TWO;
    napi_get_value_int32(env, args[0], &valueZero);

    if (valueZero == in_cloexec) {
        valueZero = IN_CLOEXEC;
    }
    if (valueZero == inNonblock) {
        valueZero = IN_NONBLOCK;
    }
    int fd = inotify_init1(valueZero);
    if (fd >= NO_ERRORS) {
        fd = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, fd, &result);
    return result;
}

static napi_value InotifyAddWatch(napi_env env, napi_callback_info info)
{
    errno = FALSE;
    int fd = inotify_init();
    char path[] = "/data/storage/el2/base/files/";
    int wd = ERROR;
    chmod(path, CHMOD);
    if (fd != ERROR) {
        wd = inotify_add_watch(fd, path, IN_ALL_EVENTS);
        inotify_rm_watch(fd, wd);
    }
    if (wd != ERROR) {
        wd = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, wd, &result);
    return result;
}

static napi_value InotifyRmWatch(napi_env env, napi_callback_info info)
{
    errno = FALSE;
    int fd = inotify_init();
    char path[] = "/data/storage/el2/base/files/";
    int wd = ERROR;
    chmod(path, CHMOD);
    if (fd != ERROR) {
        wd = inotify_add_watch(fd, path, IN_ALL_EVENTS);
        wd = inotify_rm_watch(fd, wd);
    }
    if (wd != ERROR) {
        wd = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, wd, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"inotifyInit", nullptr, InotifyInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inotifyInit1", nullptr, InotifyInit1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inotifyAddWatch", nullptr, InotifyAddWatch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inotifyRmWatch", nullptr, InotifyRmWatch, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libinotify",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
