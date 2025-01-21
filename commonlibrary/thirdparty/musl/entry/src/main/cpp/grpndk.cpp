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
    struct group *grp;
    struct group grpStorage;
    const char *groupName = "root";
    int getInfo = getgrnam_r(groupName, &grpStorage, buf, sizeof(buf), &grp);
    napi_value result = nullptr;
    napi_create_int32(env, getInfo, &result);
    return result;
}

static napi_value GetGroupList(napi_env env, napi_callback_info info)
{
    static int serverNgroups;
    static gid_t *server_groups;
    int ret;
    const char *serverUser = "root";
    struct passwd *pwd = getpwnam(serverUser);
    gid_t server_gid = pwd->pw_gid;
    ret = getgrouplist(serverUser, server_gid, nullptr, &serverNgroups);
    server_groups = (gid_t *)malloc(serverNgroups * sizeof(gid_t));
    ret = getgrouplist(serverUser, server_gid, server_groups, &serverNgroups);
    if (ret != FAIL) {
        ret = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value InitGroups(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    return result;
}
static napi_value Setgrent(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    struct group *getval = getgrent();
    napi_value result;
    if (getval == nullptr) {
        napi_create_int32(env, PARAM_0, &result);
    }
    if (errno != PARAM_0) {
        napi_create_int32(env, ONEVAL, &result);
    }
    char buf[MAX_NAMBER] = {PARAM_0};
    strcpy(buf, getval->gr_name);
    setgrent();
    getval = getgrent();
    if (getval == nullptr) {
        napi_create_int32(env, TWOVAL, &result);
    }
    if (strcmp(getval->gr_name, buf)) {
        napi_create_int32(env, THRVAL, &result);
    }
    if (errno == PARAM_0) {
        napi_create_int32(env, errno, &result);
    } else {
        napi_create_int32(env, MINUSONE, &result);
    }
    return result;
}

static napi_value EndGRent(napi_env env, napi_callback_info info)
{
    errno = NO_ERR;
    struct group *getgrent(void);
    setgrent();
    endgrent();
    napi_value result;
    napi_create_int32(env, errno, &result);
    return result;
}

static napi_value Getgrgid(napi_env env, napi_callback_info info)
{
    gid_t gid = PARAM_0;
    struct group *grp = getgrgid(gid);
    int resultValue = FAIL;
    if (grp) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Getgrgid_r(napi_env env, napi_callback_info info)
{
    char buf[512];
    gid_t gid = PARAM_0;
    struct group *grp;
    struct group grpStorage;

    int resultValue = getgrgid_r(gid, &grpStorage, buf, sizeof(buf), &grp);
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Getgrnam(napi_env env, napi_callback_info info)
{
    const char *groupName = "root";
    struct group *grp = getgrnam(groupName);

    int resultValue = FAIL;
    if (grp) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Getgrent(napi_env env, napi_callback_info info)
{
    int resultValue = FAIL;
    errno = NO_ERR;
    struct group *grp = nullptr;
    setgrent();
    grp = getgrent();
    if (grp != nullptr) {
        resultValue = SUCCESS;
    }

    if (errno == NO_ERR) {
        resultValue = SUCCESS;
    }
    endgrent();
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"setgrent", nullptr, Setgrent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGrNamR", nullptr, GetGrNamR, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getGroupList", nullptr, GetGroupList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initGroups", nullptr, InitGroups, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrgid", nullptr, Getgrgid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrgidR", nullptr, Getgrgid_r, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrnam", nullptr, Getgrnam, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"endgrent", nullptr, EndGRent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getgrent", nullptr, Getgrent, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "grp",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
