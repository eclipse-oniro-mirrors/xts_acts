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
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <js_native_api_types.h>
#include <poll.h>
#include <sys/stat.h>
#include <unistd.h>

#define TEST_AT_FDCWD (-100)
#define TEST_ERROR_AT_FDCWD 100

#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TEN 10
#define TEST_FIFO_MODE 0666
#define TVSEC 1
#define TVNSEC 0
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_0777 0777
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
#define PARAM_100000000 100000000
#define PARAM_1000 1000

static napi_value Poll(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    errno = ERRON_0;
    ret = poll(nullptr, PARAM_0, PARAM_1);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value Ppoll(napi_env env, napi_callback_info info)
{
    int ret = PARAM_0;
    int fd = open("ppoll_function_file", O_RDWR | O_CREAT, PARAM_0777);
    struct pollfd pollfds[] = {{.fd = fd, .events = POLLIN, .revents = PARAM_0}};
    struct timespec timeout = {PARAM_0};
    timeout.tv_sec = TVSEC;
    timeout.tv_nsec = TVNSEC;
    ret = ppoll(pollfds, PARAM_1, &timeout, nullptr);
    close(fd);
    int res = access("ppoll_function_file", F_OK);
    if (res != PARAM_UNNORMAL) {
        remove("ppoll_function_file");
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value PollChk(napi_env env, napi_callback_info info)
{
    int fd[2];
    pipe(fd);

    int pollChk = PARAM_0;
    int pid = fork();
    if (pid == PARAM_UNNORMAL) {
    } else if (pid == PARAM_0) {
        close(fd[0]);
        const char *message = "";
        write(fd[1], message, strlen(message) + 1);
        close(fd[1]);
        _exit(PARAM_0);
    } else {
        close(fd[1]);
        struct pollfd buf[2] = {{fd[0], POLLIN, PARAM_0}, {fd[0], POLLIN, PARAM_0}};
        int ts = PARAM_1000;
        pollChk = __poll_chk(buf, PARAM_1, ts, buf[0].fd);
        char buff;
        while (read(fd[0], &buff, PARAM_1) > PARAM_0)
            ;
        close(fd[0]);
    }

    napi_value result = nullptr;
    napi_create_int32(env, pollChk, &result);
    return result;
}

static napi_value PpollChk(napi_env env, napi_callback_info info)
{
    int fd[2];
    pipe(fd);

    int pollChk = PARAM_0;
    int pid = fork();
    if (pid == PARAM_UNNORMAL) {
    } else if (pid == PARAM_0) {
        close(fd[0]);
        const char *message = "";
        write(fd[1], message, strlen(message) + 1);
        close(fd[1]);
        _exit(PARAM_0);
    } else {
        close(fd[1]);
        struct pollfd buf[2] = {{fd[0], POLLIN, PARAM_0}, {fd[0], POLLIN, PARAM_0}};
        struct timespec ts = {.tv_nsec = PARAM_100000000};
        pollChk = __ppoll_chk(buf, PARAM_1, &ts, nullptr, buf[0].fd);
        char buff;
        while (read(fd[0], &buff, PARAM_1) > PARAM_0)
            ;
        close(fd[0]);
    }

    napi_value result = nullptr;
    napi_create_int32(env, pollChk, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"poll", nullptr, Poll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ppoll", nullptr, Ppoll, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"pollchk", nullptr, PollChk, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ppollchk", nullptr, PpollChk, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "poll",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
