/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <resolv.h>

#define MAXDNAME_A 1025
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
#define PARAM_UNNORMAL (-1)
#define RETURN_0 0
#define FAILD (-1)
#define ERRON_0 0
#define SIZE_10 10
#define SIZE_100 100
#define SIZE_1024 1024
#define SIZE_4096 4096
#define SIZE_8192 8192
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define BUFSIZ 1024

static napi_value ResInit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int resultValue = res_init();

    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value ResMkquery(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    const int op = QUERY;
    const int cla = C_IN;
    const char dname[] = "www.example.com";
    const unsigned char *data = (const unsigned char *)"";
    unsigned char buf[SIZE_1024] = {PARAM_0};

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        resultValue = res_mkquery(op, dname, cla, T_ANY + PARAM_1, data, PARAM_0, nullptr, nullptr, PARAM_0);
    } else {
        int ret = res_mkquery(op, dname, cla, T_TXT, data, PARAM_0, nullptr, buf, sizeof(buf));
        if (ret > PARAM_0) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value ResQuery(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param = PARAM_0;
    napi_get_value_int32(env, args[0], &param);

    const char dname[] = "www.baidu.com";
    const int cla = C_IN;
    const int type = T_TXT;
    unsigned char buf[PARAM_1] = {PARAM_0};

    int resultValue = FAILD;
    if (param == PARAM_UNNORMAL) {
        resultValue = res_query(dname, cla, type, buf, sizeof(buf));
    } else {
        int ret = res_query(dname, cla, T_ANY + 1, buf, sizeof(buf));
        if (ret > PARAM_0) {
            resultValue = RETURN_0;
        }
    }

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value ResQuerydomain(napi_env env, napi_callback_info info)
{
    const char name[] = "www";
    const char domain[] = "baidu.com";
    const int cla = C_IN;
    const int type = T_TXT;
    unsigned char buf[PARAM_1] = {PARAM_0};

    int resultValue = res_querydomain(name, domain, cla, type, buf, sizeof(buf));

    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value ResSend(napi_env env, napi_callback_info info)
{
    const int op = QUERY;
    const int cla = C_IN;
    const int type = T_TXT;
    const char dname[] = "www.example.com";
    const unsigned char *data = (const unsigned char *)"";
    int resultValue = FAIL;
    unsigned char buf[BUFSIZ] = {0};
    unsigned char answer[512];
    int value = res_mkquery(op, dname, cla, type, data, PARAM_0, nullptr, buf, sizeof(buf));
    int ret = res_send(buf, value, answer, sizeof(answer));
    if (ret >= NO_ERR) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value ResSearch(napi_env env, napi_callback_info info)
{
    char name[] = "www.baidu.com";
    int cla = C_IN;
    unsigned char answer[MAXDNAME_A] = {PARAM_0};
    int ret = res_search(name, cla, T_TXT, answer, sizeof(answer));
    int resultValue = FAIL;
    if (ret >= NO_ERR) {
        resultValue = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}

static napi_value Dn_expand(napi_env env, napi_callback_info info)
{
    int backParam = PARAM_0;
    const char domain[] = "www.testohos.com";
    unsigned char buff[MAXDNAME_A] = {0};
    unsigned char *bufPtr = buff;
    int ret = dn_comp(domain, bufPtr, MAXDNAME_A, nullptr, nullptr);
    if (ret != PARAM_UNNORMAL) {
        char expandDn[MAXDNAME_A];
        const unsigned char *eomorig = buff + MAXDNAME_A;
        backParam = dn_expand(buff, eomorig, buff, expandDn, MAXDNAME_A);
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"resInit", nullptr, ResInit, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"dn_expand", nullptr, Dn_expand, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resMkquery", nullptr, ResMkquery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resQuery", nullptr, ResQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resSearch", nullptr, ResSearch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resQuerydomain", nullptr, ResQuerydomain, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resSend", nullptr, ResSend, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "resolv",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
