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
#define NO_ERRORS 0
#define CHMOD 777

static napi_value InotifyAddWatch(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/";
    int ret = inotify_add_watch(ERROR, path, IN_ALL_EVENTS);
    if (ret != ERROR) {
        ret = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value InotifyRmWatch(napi_env env, napi_callback_info info)
{
    int ret = inotify_rm_watch(ERROR, ERROR);
    if (ret != ERROR) {
        ret = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
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
    .nm_modname = "libinotify1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }