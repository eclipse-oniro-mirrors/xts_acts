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
#include <arpa/nameser.h>
#include <cerrno>
#include <cstddef>
#include <cstring>
#include <js_native_api_types.h>
#include <stdint.h>
#include <sys/inotify.h>
#include <unistd.h>

#define PARAM_0 0
#define PARAM_1 1
#define PARAM_3 3
#define PARAM_0x0 0x0
#define RETURN_0 0
#define FAILD (-1)
#define NO_ERR 0
#define TEST_DNS_HEAD 12
#define TEST_SKIP_SIZE 4
#define SKIPRR_RESULT 17
#define PARAM_UNNORMAL (-1)
#define ERRON_0 0
static unsigned char msg[] = "\x71\x79\x81\x80\x00\x01"
                             "\x00\x02\x00\x04\x00\x04\x03\x77\x77\x77\x03\x61\x62\x63\x03\x63"
                             "\x6f\x6d\x00\x00\x01\x00\x01\xc0\x0c\x00\x05\x00\x01\x00\x00\x02"
                             "\xe8\x00\x02\xc0\x10\xc0\x10\x00\x01\x00\x01\x00\x00\x02\xe9\x00"
                             "\x04\x0a\xb5\x84\xfa\xc0\x10\x00\x02\x00\x01\x00\x00\xda\xeb\x00"
                             "\x0d\x06\x73\x65\x6e\x73\x30\x31\x03\x64\x69\x67\xc0\x14\xc0\x10"
                             "\x00\x02\x00\x01\x00\x00\xda\xeb\x00\x09\x06\x73\x65\x6e\x73\x30"
                             "\x32\xc0\x4e\xc0\x10\x00\x02\x00\x01\x00\x00\xda\xeb\x00\x09\x06"
                             "\x6f\x72\x6e\x73\x30\x31\xc0\x4e\xc0\x10\x00\x02\x00\x01\x00\x00"
                             "\xda\xeb\x00\x09\x06\x6f\x72\x6e\x73\x30\x32\xc0\x4e\xc0\x75\x00"
                             "\x01\x00\x01\x00\x00\x7a\x36\x00\x04\x0a\xbb\xbd\x2c\xc0\x8a\x00"
                             "\x01\x00\x01\x00\x00\x1b\x96\x00\x04\x0a\xbb\xbe\x2c\xc0\x47\x00"
                             "\x01\x00\x01\x00\x00\x92\xb1\x00\x04\x0a\xb5\x86\x10\xc0\x60\x00"
                             "\x01\x00\x01\x00\x00\x92\xb1\x00\x04\x0a\xb5\x87\xc7";

extern unsigned ns_get16(const unsigned char *);
extern unsigned long ns_get32(const unsigned char *);
extern void ns_put16(unsigned, unsigned char *);
extern void ns_put32(unsigned long, unsigned char *);
extern int ns_initparse(const unsigned char *, int, ns_msg *);
extern int ns_parserr(ns_msg *, ns_sect, int, ns_rr *);
extern int ns_skiprr(const unsigned char *, const unsigned char *, ns_sect, int);
extern int ns_name_uncompress(const unsigned char *, const unsigned char *, const unsigned char *, char *, size_t);

static napi_value NsGet16(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    unsigned char com[] = "com";
    ns_get16(com);
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value NsGet32(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    unsigned char com[] = "com";
    ns_get32(com);
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value NsPut16(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    unsigned char com[] = "com";
    ns_put16(NS_ALG_DSA, com);
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value NsPut32(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    unsigned char com[] = "com";
    ns_put32(NS_ALG_DSA, com);
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value NsNameUnCompress(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    unsigned char com[] = "com";
    unsigned char comp[10] = {0};
    char exp[10] = {0};
    ns_name_uncompress(com, com + PARAM_3, comp, exp, MAXDNAME);
    napi_value result;
    if (errno == ERRON_0) {
        napi_create_int32(env, PARAM_0, &result);
    } else {
        napi_create_int32(env, PARAM_UNNORMAL, &result);
    }
    return result;
}

static napi_value NsParsErr(napi_env env, napi_callback_info info)
{
    errno = ERRON_0;
    ns_msg handle = {nullptr};
    ns_rr rr;
    ns_initparse(msg, sizeof(msg) - PARAM_1, &handle);
    memset(&rr, PARAM_0x0, sizeof(ns_rr));
    int ret = ns_parserr(&handle, ns_s_qd, PARAM_0, &rr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value NsInitParse(napi_env env, napi_callback_info info)
{
    ns_msg handle = {nullptr};
    int ret = ns_initparse(msg, sizeof(msg) - PARAM_1, &handle);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NsSkiPrr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    unsigned char *ptr = msg + TEST_DNS_HEAD;
    unsigned char *eom = msg + sizeof(msg) - PARAM_1;
    int ret;
    ns_sect sec = ns_s_qd;
    ret = ns_skiprr(ptr, eom, sec, PARAM_1);
    if (ret == SKIPRR_RESULT) {
        napi_create_int32(env, NO_ERR, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }
    return result;
}

static napi_value NsFlagdata(napi_env env, napi_callback_info info)
{
    struct _ns_flagdata nf;
    napi_value result = nullptr;
    if (sizeof(nf) >= PARAM_0) {
        napi_create_int32(env, RETURN_0, &result);
    } else {
        napi_create_int32(env, FAILD, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nsGet16", nullptr, NsGet16, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsGet32", nullptr, NsGet32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsPut16", nullptr, NsPut16, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsPut32", nullptr, NsPut32, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsInitParse", nullptr, NsInitParse, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsNameUnCompress", nullptr, NsNameUnCompress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsParsErr", nullptr, NsParsErr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsSkiPrr", nullptr, NsSkiPrr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nsFlagdata", nullptr, NsFlagdata, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libifaddrs",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
