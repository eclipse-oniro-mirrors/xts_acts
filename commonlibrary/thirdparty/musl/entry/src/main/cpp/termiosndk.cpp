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
#include <cstdlib>
#include <cstring>
#include <fcntl.h>
#include <termios.h>
#include <unistd.h>

#define FAIL (-1)
#define PARAM_0 0
#define PARAM_1 1
#define SUCCESS 1
#define ERRON_0 0
#define PARAM_0xff 0xff

#define PATH "/data/storage/el2/base/files"

static napi_value Tcdrain(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;

    if (valueFirst == PARAM_0) {
        result = tcdrain(PARAM_0);
    } else {
        char path[] = PATH;
        int fileDescribe;
        fileDescribe = open(path, O_RDWR | O_NONBLOCK);
        result = tcdrain(fileDescribe);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
static napi_value Tcflow(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;
    const char *text = "Hello";

    if (valueFirst == PARAM_0) {
        result = tcflow(FAIL, TCOON);
    } else {
        int fd = open(PATH, O_CREAT | O_NOCTTY);
        grantpt(fd);
        unlockpt(fd);
        char *returnValue = ptsname(fd);
        int fileDescribe = open(returnValue, O_CREAT | O_NOCTTY);
        write(fileDescribe, text, strlen(text));
        result = tcflow(fileDescribe, TCOON);
        close(fd);
        close(fileDescribe);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Tcflush(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;
    if (valueFirst == PARAM_0) {
        result = tcflush(FAIL, FAIL);
    } else {
        int fd = open(PATH, O_RDWR | O_NOCTTY);
        grantpt(fd);
        unlockpt(fd);
        char *returnValue = ptsname(fd);
        int fileDescribe = open(returnValue, O_RDWR | O_NOCTTY);
        result = tcflush(fileDescribe, TCOON);
        close(fd);
        close(fileDescribe);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
static napi_value Tcgetattr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;

    if (valueFirst == PARAM_0) {
        result = tcgetattr(FAIL, nullptr);
    } else {
        struct termios tio = {};
        result = tcgetattr(STDIN_FILENO, &tio);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Tcgetsid(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;

    if (valueFirst == PARAM_0) {
        pid_t sid;
        sid = tcgetsid(FAIL);
        result = sid;
    } else {
        errno = ERRON_0;
        pid_t sid;
        sid = tcgetsid(STDIN_FILENO);
        result = sid;
    }

    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Tcsendbreak(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;

    if (valueFirst == PARAM_0) {
        result = tcsendbreak(FAIL, PARAM_0);
    } else {
        result = tcsendbreak(STDIN_FILENO, PARAM_0);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}
static napi_value Tcsetattr(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst;
    napi_get_value_int32(env, args[0], &valueFirst);
    int result = PARAM_0;
    const cc_t veof = (cc_t)0x07;

    if (valueFirst == PARAM_0) {
        result = tcsetattr(FAIL, FAIL, nullptr);
    } else {
        struct termios tio = {};
        tio.c_cc[VEOF] = veof;
        result = tcsetattr(STDIN_FILENO, TCSAFLUSH, &tio);
        tcgetattr(STDIN_FILENO, &tio);
    }
    napi_value results = nullptr;
    napi_create_int32(env, result, &results);
    return results;
}

static napi_value Cfsetispeed(napi_env env, napi_callback_info info)
{
    struct termios term;
    speed_t returnValue = cfsetispeed(&term, 1);
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

static napi_value Cfsetospeed(napi_env env, napi_callback_info info)
{
    struct termios term;
    speed_t value = cfsetospeed(&term, 1);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Cfmakeraw(napi_env env, napi_callback_info info)
{
    struct termios t;
    errno = ERRON_0;
    memset(&t, PARAM_0xff, sizeof(t));
    int ret = FAIL;
    cfmakeraw(&t);
    if (errno == PARAM_0) {
        ret = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value Cfgetispeed(napi_env env, napi_callback_info info)
{
    struct termios t = {};
    int value = FAIL;
    cfsetispeed(&t, B1200);
    speed_t ret = cfgetispeed(&t);
    if (ret >= PARAM_0) {
        value = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Cfgetospeed(napi_env env, napi_callback_info info)
{
    struct termios t = {};
    int value = FAIL;
    cfsetospeed(&t, B1200);
    speed_t ret = cfgetospeed(&t);
    if (ret >= PARAM_0) {
        value = SUCCESS;
    }
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Cfsetspeed(napi_env env, napi_callback_info info)
{
    struct termios t = {};
    int value = cfsetspeed(&t, B1200);
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"tcdrain", nullptr, Tcdrain, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcflow", nullptr, Tcflow, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcflush", nullptr, Tcflush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcgetattr", nullptr, Tcgetattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcgetsid", nullptr, Tcgetsid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcsendbreak", nullptr, Tcsendbreak, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"tcsetattr", nullptr, Tcsetattr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfsetispeed", nullptr, Cfsetispeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfsetospeed", nullptr, Cfsetospeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfmakeraw", nullptr, Cfmakeraw, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfgetispeed", nullptr, Cfgetispeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfgetospeed", nullptr, Cfgetospeed, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"cfsetspeed", nullptr, Cfsetspeed, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "termios",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
