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

#include <csignal>
#include <cstdio>
#include <dirent.h>
#include <fcntl.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <spawn.h>
#include <sys/stat.h>
#include <unistd.h>

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_256 256
#define PARAM_MINUS_1 (-1)
#define BAD_FD (-1)

static napi_value PosixSpawn(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    pid_t pid;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        posix_spawnattr_init(&attr);
        const char *argv[] = {"sh", "-c", "echo", nullptr};
        ret = posix_spawn(&pid, "/bin/sh", nullptr, &attr, (char *const *)argv, nullptr);
        posix_spawnattr_destroy(&attr);
    } else {
        ret = posix_spawn(&pid, "unexitfile", nullptr, nullptr, nullptr, nullptr);
    }

    if (ret != SUCCESS) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddclose(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    posix_spawn_file_actions_t actions;
    posix_spawn_file_actions_init(&actions);
    if (param == PARAM_0) {
        int p[2];
        pipe(p);
        ret = posix_spawn_file_actions_addclose(&actions, p[0]);
        close(p[1]);
        close(p[0]);
    } else {
        ret = posix_spawn_file_actions_addclose(&actions, BAD_FD);
    }
    posix_spawn_file_actions_destroy(&actions);
    if (ret != PARAM_0) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddDup2(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    posix_spawn_file_actions_t actions;
    if (param == PARAM_0) {
        posix_spawn_file_actions_init(&actions);
        ret = posix_spawn_file_actions_adddup2(&actions, SUCCESS, SUCCESS);
        posix_spawn_file_actions_destroy(&actions);
    } else {
        ret = posix_spawn_file_actions_adddup2(&actions, BAD_FD, BAD_FD);
    }
    if (ret != SUCCESS) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsAddOpen(napi_env env, napi_callback_info info)
{
    char path[] = "/data/storage/el2/base/files/fzl.txt";
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    posix_spawn_file_actions_t actions;
    if (param == PARAM_0) {
        int fd = open(path, O_CREAT);
        posix_spawn_file_actions_init(&actions);
        ret = posix_spawn_file_actions_addopen(&actions, fd, path, O_CREAT, S_IXGRP);
        posix_spawn_file_actions_destroy(&actions);
        close(fd);
        remove(path);
    } else {
        ret = posix_spawn_file_actions_addopen(&actions, BAD_FD, path, O_CREAT, S_IXGRP);
    }
    if (ret != SUCCESS) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsDestroy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawn_file_actions_t actions;
        posix_spawn_file_actions_init(&actions);
        ret = posix_spawn_file_actions_destroy(&actions);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnFileActionsInit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawn_file_actions_t actions;
        ret = posix_spawn_file_actions_init(&actions);
        posix_spawn_file_actions_destroy(&actions);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrDestroy(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        posix_spawnattr_init(&attr);
        ret = posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrGetflags(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    posix_spawnattr_t attr;
    if (param == PARAM_0) {
        short flags = PARAM_0;
        posix_spawnattr_init(&attr);
        posix_spawnattr_setflags(&attr, POSIX_SPAWN_RESETIDS);
        ret = posix_spawnattr_getflags(&attr, &flags);
        posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrGetpGroup(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t spawnattr;
        pid_t group = PARAM_MINUS_1;
        posix_spawnattr_init(&spawnattr);
        ret = posix_spawnattr_getpgroup(&spawnattr, &group);
        posix_spawnattr_destroy(&spawnattr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSigDefault(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t spawnattr;
        sigset_t sigset;
        posix_spawnattr_init(&spawnattr);
        ret = posix_spawnattr_getsigdefault(&spawnattr, &sigset);
        posix_spawnattr_destroy(&spawnattr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrGetSigMask(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t spawnattr;
        sigset_t mask;
        posix_spawnattr_init(&spawnattr);
        ret = posix_spawnattr_getsigmask(&spawnattr, &mask);
        posix_spawnattr_destroy(&spawnattr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrInit(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        ret = posix_spawnattr_init(&attr);
        posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrSetFlags(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    posix_spawnattr_t spawnattr;
    posix_spawnattr_init(&spawnattr);
    if (param == PARAM_0) {
        ret = posix_spawnattr_setflags(&spawnattr, POSIX_SPAWN_RESETIDS);
    } else {
        ret = posix_spawnattr_setflags(&spawnattr, PARAM_256);
    }
    posix_spawnattr_destroy(&spawnattr);
    if (ret != PARAM_0) {
        ret = FAIL;
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrSetPGroup(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        pid_t group = PARAM_MINUS_1;
        posix_spawnattr_init(&attr);
        ret = posix_spawnattr_setpgroup(&attr, group);
        posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSigDefault(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        sigset_t sigset;
        sigemptyset(&sigset);
        sigaddset(&sigset, SIGCHLD);
        posix_spawnattr_init(&attr);
        ret = posix_spawnattr_setsigdefault(&attr, &sigset);
        posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnAttrSetSigMask(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret = FAIL;
    if (param == PARAM_0) {
        posix_spawnattr_t attr;
        sigset_t sigset;
        sigemptyset(&sigset);
        sigaddset(&sigset, SIGCHLD);
        posix_spawnattr_init(&attr);
        ret = posix_spawnattr_setsigmask(&attr, &sigset);
        posix_spawnattr_destroy(&attr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value PosixSpawnP(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    int ret;
    pid_t pid;
    if (param == PARAM_0) {
        pid = getpid();
        posix_spawnattr_t attr;
        posix_spawnattr_init(&attr);
        const char *argv[] = {"echo", "hello", nullptr};
        ret = posix_spawnp(&pid, "echo", nullptr, &attr, (char *const *)argv, nullptr);
        posix_spawnattr_destroy(&attr);
    } else {
        ret = posix_spawn(&pid, "unexitfile", nullptr, nullptr, nullptr, nullptr);
    }

    if (ret != SUCCESS) {
        ret = FAIL;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"posixSpawn", nullptr, PosixSpawn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnFileActionsAddClose", nullptr, PosixSpawnFileActionsAddclose, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"posixSpawnFileActionsAdddup2", nullptr, PosixSpawnFileActionsAddDup2, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsAddopen", nullptr, PosixSpawnFileActionsAddOpen, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsDestroy", nullptr, PosixSpawnFileActionsDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnFileActionsInit", nullptr, PosixSpawnFileActionsInit, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrDestroy", nullptr, PosixSpawnAttrDestroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrGetFlags", nullptr, PosixSpawnAttrGetflags, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrGetpGroup", nullptr, PosixSpawnAttrGetpGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrGetSigDefault", nullptr, PosixSpawnAttrGetSigDefault, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrGetSigMask", nullptr, PosixSpawnAttrGetSigMask, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrInit", nullptr, PosixSpawnAttrInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrSetFlags", nullptr, PosixSpawnAttrSetFlags, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrSetPGroup", nullptr, PosixSpawnAttrSetPGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"posixSpawnAttrSetSigDefault", nullptr, PosixSpawnAttrSetSigDefault, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnAttrSetSigMask", nullptr, PosixSpawnAttrSetSigMask, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"posixSpawnP", nullptr, PosixSpawnP, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = "spawnndk1",
    .nm_register_func = Init,
    .nm_modname = "libspawnndk1",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }