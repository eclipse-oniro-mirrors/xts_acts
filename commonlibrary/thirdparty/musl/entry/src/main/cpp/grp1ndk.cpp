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
#include <cstring>
#include <grp.h>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <malloc.h>
#include <net/if.h>
#include <sys/inotify.h>
#include <unistd.h>
#include <utmp.h>
#include <uv.h>

#define ONEVAL 1
#define MINUSONE (-1)
#define TWOVAL 2
#define THRVAL 3
#define MAX_NAMBER 1024
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define PARAM_0 0
#define TEN 10
#define ERRON_0 0

static napi_value GetGrNamR(napi_env env, napi_callback_info info)
{
    char buf[512];
    struct group grp;
    struct group *grpResult;
    int ret = getgrnam_r("invalid_name", &grp, buf, sizeof(buf), &grpResult);

    if (ret != PARAM_0 || grpResult == nullptr) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value GetGroupList(napi_env env, napi_callback_info info)
{
    static int ngroups;
    struct passwd *pwd;
    const char *user = "root";
    pwd = getpwnam(user);
    int ret = getgrouplist(user, pwd->pw_gid, nullptr, &ngroups);
    if (ret != PARAM_0) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getgrgid(napi_env env, napi_callback_info info)
{
    gid_t gid = MINUSONE;
    struct group *grp = getgrgid(gid);
    int ret = PARAM_0;
    if (grp == nullptr) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getgrgid_r(napi_env env, napi_callback_info info)
{
    char buf[512];
    gid_t gid = MINUSONE;
    struct group grp;
    struct group *grpResult;
    int ret = getgrgid_r(gid, &grp, buf, sizeof(buf), &grpResult);

    if (ret != PARAM_0 || grpResult == nullptr) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Getgrnam(napi_env env, napi_callback_info info)
{
    struct group *grp = getgrnam("invalid_name");
    int ret = PARAM_0;
    if (grp == nullptr) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getGrNamR", nullptr, GetGrNamR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGroupList", nullptr, GetGroupList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrgid", nullptr, Getgrgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrgidR", nullptr, Getgrgid_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrnam", nullptr, Getgrnam, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "grp1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
