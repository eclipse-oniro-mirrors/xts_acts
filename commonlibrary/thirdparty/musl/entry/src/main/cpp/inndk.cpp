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

#include <arpa/inet.h>
#include <dirent.h>
#include <js_native_api.h>
#include <netinet/in.h>
#include <node_api.h>
#include <syslog.h>

#define SUCCESS 1
#define FAIL (-1)
#define FALSE (-1)
#define RETURN_0 0
#define FAILD (-1)
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_0x1234 0x1234
#define PARAM_0x3412 0x3412
#define PARAM_0X7F000001 0x7f000001
#define PARAM_0X12345678 0x12345678

static napi_value Ntohl(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    uint32_t hl = PARAM_0X12345678;
    napi_value result = nullptr;
    uint32_t ret = ntohl(hl);
    napi_create_uint32(env, ret, &result);
    return result;
}

static napi_value Ntohs(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int value0;
    napi_get_value_int32(env, args[0], &value0);
    uint16_t hs = PARAM_0x1234;
    napi_value result = nullptr;
    uint16_t ret = ntohs(hs);
    napi_create_uint32(env, ret, &result);
    return result;
}
static napi_value Htonl(napi_env env, napi_callback_info info)
{
    const uint32_t IP = PARAM_0X7F000001;
    uint32_t ret = htonl(IP);
    int addr2 = inet_addr("127.0.0.1");
    napi_value result;
    if (ret == addr2) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}
static const uint16_t LE = PARAM_0x1234;
static const uint16_t BE = PARAM_0x3412;
static napi_value Htons(napi_env env, napi_callback_info info)
{
    uint32_t ret = htons(LE);
    napi_value result;
    if (ret == BE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FALSE, &result);
    }
    return result;
}

static napi_value In6addrAny(napi_env env, napi_callback_info info)
{
    int resultValue = FAILD;
    const struct in6_addr in6addr_any = IN6ADDR_ANY_INIT;
    if (sizeof(in6addr_any) >= PARAM_0) {
        resultValue = RETURN_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

static napi_value In6addrLoopback(napi_env env, napi_callback_info info)
{
    int resultValue = FAILD;
    const struct in6_addr in6addr_loopback = IN6ADDR_LOOPBACK_INIT;
    if (sizeof(in6addr_loopback) >= PARAM_0) {
        resultValue = RETURN_0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ntohl", nullptr, Ntohl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ntohs", nullptr, Ntohs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"htonl", nullptr, Htonl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"htons", nullptr, Htons, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"in6addrAny", nullptr, In6addrAny, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"in6addrLoopback", nullptr, In6addrLoopback, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "in",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
