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
#include "common/native_common.h"
#include "napi/native_api.h"
#include <cerrno>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <sys/sendfile.h>
#include <unistd.h>

#define TEST_MODE 0666
#define PARAM_0 0
#define PARAM_1 1
#define ONEVAL 1
#define MINUSONE (-1)
#define ERRON_0 0

static napi_value Sendfile(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueFirst = PARAM_0;
    napi_get_value_int32(env, args[0], &valueFirst);
    off_t off = PARAM_0;
    napi_value result = nullptr;
    if (valueFirst == PARAM_0) {
        int fromfd = open("/data/storage/el2/base/files/test1.txt", O_RDONLY);
        int tofd = open("/data/storage/el2/base/files/test2.txt", O_WRONLY | O_CREAT, TEST_MODE);
        int senval = sendfile(tofd, fromfd, &off, ONEVAL);
        napi_create_int32(env, senval, &result);
    } else {
        int fromfd = MINUSONE;
        int tofd = MINUSONE;
        int senval = sendfile(tofd, fromfd, &off, ONEVAL);
        napi_create_int32(env, senval, &result);
    }
    return result;
}

static napi_value Sendfile64(napi_env env, napi_callback_info info)
{
    char fromFile[] = "/data/storage/el2/base/files/test_send_file1.txt";
    char toFile[] = "/data/storage/el2/base/files/test_send_file2.txt";
    char text[] = "test sendfile64";
    int len = strlen(text);
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);

    size_t value;
    if (param == PARAM_0) {
        int fromfd = open(fromFile, O_CREAT | O_RDWR);
        int tofd = open(toFile, O_CREAT | O_RDWR);
        write(fromfd, text, len);
        lseek(fromfd, PARAM_0, SEEK_SET);
        value = sendfile64(tofd, fromfd, nullptr, len);
        close(fromfd);
        close(tofd);
        remove(fromFile);
        remove(toFile);
    } else {
        int fromfd = MINUSONE;
        int tofd = MINUSONE;
        value = sendfile64(tofd, fromfd, nullptr, len);
    }

    int ret;
    if (value == len) {
        ret = ONEVAL;
    } else {
        ret = MINUSONE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"sendfile", nullptr, Sendfile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"sendfile64", nullptr, Sendfile64, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "sendfile",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
