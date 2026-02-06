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
#define PARAM_100 100
#define PARAM_0 0

static napi_value Iconv(napi_env env, napi_callback_info info)
{
    iconv_t cd;
    char buf[PARAM_100];
    char *inbuf = static_cast<char *>(malloc(sizeof("hello,world!")));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    char *outbuf = buf;
    size_t inlen = strlen(inbuf);
    size_t outlen;
    size_t r;
    const char *bad = "bad-codeset";
    cd = iconv_open(bad, bad);
    cd = iconv_open("UTF-8", "UTF-8");
    errno = PARAM_0;
    outlen = PARAM_0;
    r = iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    outlen = sizeof buf;
    r = iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    napi_value result = nullptr;
    iconv_close(cd);
    napi_create_int32(env, r, &result);
    return result;
}

static napi_value IconvOpen(napi_env env, napi_callback_info info)
{
    iconv_t cd;
    char buf[PARAM_100];
    char *inbuf = static_cast<char *>(malloc(sizeof("hello,world!")));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    char *outbuf = buf;
    size_t inlen = strlen(inbuf);
    size_t outlen;
    const char *bad = "bad-codeset";
    cd = iconv_open(bad, bad);
    cd = iconv_open("UTF-8", "UTF-8");
    errno = PARAM_0;
    outlen = PARAM_0;
    iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    outlen = sizeof buf;
    iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    napi_value result = nullptr;
    if (cd == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NO_ERR, &result);
    }
    iconv_close(cd);
    return result;
}

static napi_value IconvClose(napi_env env, napi_callback_info info)
{
    iconv_t cd;
    char buf[PARAM_100];
    char *inbuf = static_cast<char *>(malloc(sizeof("hello,world!")));
    memcpy(inbuf, "hello,world!", sizeof("hello,world!"));
    char *outbuf = buf;
    size_t inlen = strlen(inbuf);
    size_t outlen;
    const char *bad = "bad-codeset";
    cd = iconv_open(bad, bad);
    cd = iconv_open("UTF-8", "UTF-8");
    errno = PARAM_0;
    outlen = PARAM_0;
    iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    outlen = sizeof buf;
    iconv(cd, &inbuf, &inlen, &outbuf, &outlen);
    int ret = iconv_close(cd);
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
