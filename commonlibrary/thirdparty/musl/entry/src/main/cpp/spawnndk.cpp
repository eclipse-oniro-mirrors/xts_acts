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

#include <cerrno>
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <spawn.h>
#include <sys/stat.h>
#include <unistd.h>

#define FAIL 0
#define SUCCESS 1
#define PARAM_0 0
#define PARAM_0777 0777

static napi_value PosixSpawnAttrGetflags(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t attr;
    posix_spawnattr_init(&attr);
    short flags = PARAM_0;
    int resultinfo = posix_spawnattr_getflags(&attr, &flags);
    napi_value result = nullptr;
    napi_create_int32(env, resultinfo, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddclose(napi_env env, napi_callback_info info)
{
    posix_spawn_file_actions_t param;
    posix_spawn_file_actions_init(&param);
    int ret = posix_spawn_file_actions_addclose(&param, SUCCESS);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawn(napi_env env, napi_callback_info info)
{
    pid_t Pid = PARAM_0;
    Pid = getpid();
    posix_spawnattr_t spawnAttributes;
    posix_spawnattr_init(&spawnAttributes);
    errno = FAIL;
    int backInfo = FAIL;
    char **Environ = environ;
    const char *CommandCStr = "posix delete -i 1024";
    const char *argv[] = {"sh", "-c", CommandCStr, nullptr};
    char filepath[] = "/data/storage/el2/base/files/fzl.txt";
    int fileDescribe = open(filepath, O_CREAT, PARAM_0777);
    posix_spawn(&Pid, filepath, nullptr, &spawnAttributes, (char *const *)argv, Environ);
    close(fileDescribe);
    napi_value result = nullptr;
    if (errno == FAIL) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value PosixSpawnP(napi_env env, napi_callback_info info)
{
    pid_t Pid = PARAM_0;
    Pid = getpid();
    posix_spawnattr_t spawnAttributes = {PARAM_0};
    posix_spawnattr_init(&spawnAttributes);
    errno = FAIL;
    int backInfo = FAIL;
    char **Environ = environ;
    const char *CommandCStr = nullptr;
    const char *argv[] = {"sh", "-c", CommandCStr, nullptr};
    char filepath[] = "/data/storage/el2/base/files/fzl.txt";
    int fileDescribe = open(filepath, O_CREAT, PARAM_0777);
    posix_spawnp(&Pid, filepath, nullptr, &spawnAttributes, (char *const *)argv, Environ);
    napi_value result = nullptr;
    close(fileDescribe);
    if (errno == FAIL) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddDup2(napi_env env, napi_callback_info info)
{
    posix_spawn_file_actions_t param;
    posix_spawn_file_actions_init(&param);
    int ret = posix_spawn_file_actions_adddup2(&param, SUCCESS, SUCCESS);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddOpen(napi_env env, napi_callback_info info)
{
    errno = FAIL;
    int returnValue = FAIL;
    posix_spawn_file_actions_t param;
    posix_spawn_file_actions_init(&param);
    int fileDescribe = open("/data/storage/el2/base/files/fzl.txt", O_CREAT, PARAM_0777);
    posix_spawn_file_actions_addopen(&param, fileDescribe, "/data/storage/el2/base/files/fzl.txt", O_CREAT, S_IXGRP);
    napi_value result = nullptr;
    if (errno == FAIL) {
        returnValue = SUCCESS;
    }
    close(fileDescribe);
    napi_create_int32(env, returnValue, &result);
    return result;
}

extern "C" int __fstat_time64(int, struct stat *);
static napi_value PosixSpawnFileActionsDestory(napi_env env, napi_callback_info info)
{
    posix_spawn_file_actions_t param;
    posix_spawn_file_actions_init(&param);
    int ret = posix_spawn_file_actions_destroy(&param);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsInit(napi_env env, napi_callback_info info)
{
    posix_spawn_file_actions_t param;
    int returnValue = posix_spawn_file_actions_init(&param);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrDestory(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    param.__flags = SUCCESS;
    param.__pgrp = SUCCESS;
    param.__prio = SUCCESS;
    param.__pol = SUCCESS;
    posix_spawnattr_init(&param);
    int returnValue = posix_spawnattr_destroy(&param);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrGetpGroup(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    pid_t pid;
    pid = getpid();
    posix_spawnattr_init(&param);
    int returnValue = posix_spawnattr_getpgroup(&param, &pid);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSchedParam(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    struct sched_param *secondParam = nullptr;
    int returnValue = posix_spawnattr_getschedparam(&param, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSchedPolicy(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    int *secondParam = nullptr;
    int returnValue = posix_spawnattr_getschedpolicy(&param, secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSigDefault(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    sigset_t secondParam;
    int returnValue = posix_spawnattr_getsigdefault(&param, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSigMask(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    sigset_t secondParam;
    int returnValue = posix_spawnattr_getsigmask(&param, &secondParam);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrInit(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    int returnValue = posix_spawnattr_init(&param);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetFlags(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    int returnValue = posix_spawnattr_setflags(&param, SUCCESS);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSigDefault(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    sigset_t paramSecond;
    int returnValue = posix_spawnattr_setsigdefault(&param, &paramSecond);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSigMask(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    sigset_t paramSecond;
    int returnValue = posix_spawnattr_setsigmask(&param, &paramSecond);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSchedPolicy(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    int paramSecond = SUCCESS;
    int returnValue = posix_spawnattr_setschedpolicy(&param, paramSecond);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSchedParam(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    sched_param *paramSecond;
    int returnValue = posix_spawnattr_setschedparam(&param, paramSecond);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value PosixSpawnAttrSetPGroup(napi_env env, napi_callback_info info)
{
    posix_spawnattr_t param;
    posix_spawnattr_init(&param);
    pid_t pid;
    pid = getpid();
    int returnValue = posix_spawnattr_setpgroup(&param, pid);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"posixSpawnAttrGetFlags", nullptr, PosixSpawnAttrGetflags, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnFileActionsAddClose", nullptr, PosixSpawnFileActionsAddclose, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"posixSpawn", nullptr, PosixSpawn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnFileActionsAdddup2", nullptr, PosixSpawnFileActionsAddDup2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsAddopen", nullptr, PosixSpawnFileActionsAddOpen, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsDestroy", nullptr, PosixSpawnFileActionsDestory, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsInit", nullptr, PosixSpawnFileActionsInit, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrDestroy", nullptr, PosixSpawnAttrDestory, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrGetpGroup", nullptr, PosixSpawnAttrGetpGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrGetSchedParam", nullptr, PosixSpawnAttrGetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrGetSchedPolicy", nullptr, PosixSpawnAttrGetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrGetSigDefault", nullptr, PosixSpawnAttrGetSigDefault, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrGetSigMask", nullptr, PosixSpawnAttrGetSigMask, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrInit", nullptr, PosixSpawnAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrSetFlags", nullptr, PosixSpawnAttrSetFlags, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnP", nullptr, PosixSpawnP, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrSetSigDefault", nullptr, PosixSpawnAttrSetSigDefault, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrSetSigMask", nullptr, PosixSpawnAttrSetSigMask, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrSetSchedPolicy", nullptr, PosixSpawnAttrSetSchedPolicy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrSetSchedParam", nullptr, PosixSpawnAttrSetSchedParam, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrSetPGroup", nullptr, PosixSpawnAttrSetPGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libspawnndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }