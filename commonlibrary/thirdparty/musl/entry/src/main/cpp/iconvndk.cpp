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
#include <iconv.h>
#include <js_native_api.h>
#include <malloc.h>
#include <node_api.h>

#define BUFF_SIZE 1024
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)

static napi_value Iconv(napi_env env, napi_callback_info info)
{
    int ret;
    size_t inLen = sizeof("hello,world!");
    size_t outLen = sizeof("hello,world!");
    char *outbuf = static_cast<char *>(malloc(sizeof("hello,world!")));
    char *inbuf = static_cast<char *>(malloc(sizeof("hello,world!")));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    iconv_t there = iconv_open("GBK", "UTF-8");
    errno = NO_ERR;
    ret = iconv(there, &inbuf, &inLen, &outbuf, &outLen);
    iconv_close(there);
    free(outbuf);
    free(inbuf);
    napi_value result = nullptr;
    if (ret == NO_ERR) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value IconvOpen(napi_env env, napi_callback_info info)
{
    size_t inLen = BUFF_SIZE;
    size_t outLen = BUFF_SIZE;
    char *outbuf = static_cast<char *>(malloc(BUFF_SIZE));
    char *inbuf = static_cast<char *>(malloc(BUFF_SIZE));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    iconv_t there = iconv_open("GBK", "UTF-8");
    iconv(there, &inbuf, &inLen, &outbuf, &outLen);
    iconv_close(there);
    free(outbuf);
    free(inbuf);
    napi_value result = nullptr;
    if (there == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

static napi_value IconvClose(napi_env env, napi_callback_info info)
{
    int ret;
    size_t inLen = BUFF_SIZE;
    size_t outLen = BUFF_SIZE;
    char *outbuf = static_cast<char *>(malloc(BUFF_SIZE));
    char *inbuf = static_cast<char *>(malloc(BUFF_SIZE));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    iconv_t there = iconv_open("GBK", "UTF-8");
    ret = iconv(there, &inbuf, &inLen, &outbuf, &outLen);
    ret = iconv_close(there);
    free(outbuf);
    free(inbuf);
    napi_value result = nullptr;
    if (ret == FAIL) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"iconv", nullptr, Iconv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iconvOpen", nullptr, IconvOpen, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"iconvClose", nullptr, IconvClose, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "wchar",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
