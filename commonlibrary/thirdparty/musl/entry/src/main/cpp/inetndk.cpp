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
#include <arpa/inet.h>
#include <cstdlib>
#include <cstring>
#include <ifaddrs.h>
#include <js_native_api_types.h>
#include <net/if.h>
#include <netdb.h>
#include <sys/inotify.h>
#include <utmp.h>

#define STRLENGTH 64
#define FALSE 0
#define TRUE 1
#define ERROR (-1)
#define PORT 9000
#define DEFAULT_VALUE 0
#define ONE 1
#define PARAM_0 0
#define PARAM_1 1
#define PARAM_2 2
static napi_value InetAddr(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    in_addr_t ret = PARAM_0;
    if (valueZero == PARAM_0) {
        ret = inet_addr("10.1.59.80");
    }
    if (valueZero == PARAM_1) {
        ret = inet_addr("192.168.1.100");
    }
    if (valueZero == PARAM_2) {
        ret = inet_addr("192.168.100.1");
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value InetAton(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    int ret = FALSE;
    struct sockaddr_in adr_inet;
    memset(&adr_inet, FALSE, sizeof(adr_inet));
    adr_inet.sin_family = AF_INET;
    uint16_t port = PORT;
    adr_inet.sin_port = htons(port);
    if (valueZero == PARAM_0) {
        ret = inet_aton("192.168.100.1", &adr_inet.sin_addr);
    }
    if (valueZero == PARAM_1) {
        ret = inet_aton("192.168.1.100", &adr_inet.sin_addr);
    }
    if (valueZero == PARAM_2) {
        ret = inet_aton("10.1.59.80", &adr_inet.sin_addr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value InetLnaof(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr addr;
    addr.s_addr = valueZero;

    in_addr_t ret = inet_lnaof(addr);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value InetMakeaddr(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr inp;
    inp.s_addr = valueZero;
    struct in_addr new_inp = inet_makeaddr(inet_netof(inp), inet_lnaof(inp));
    napi_value result = nullptr;
    napi_create_int32(env, new_inp.s_addr, &result);
    return result;
}

static napi_value InetNetof(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr inp;
    inp.s_addr = valueZero;
    in_addr_t addr = inet_netof(inp);
    napi_value result = nullptr;
    napi_create_int32(env, addr, &result);
    return result;
}
static napi_value InetNetwork(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    in_addr_t addr = FALSE;
    if (valueZero == PARAM_0) {
        addr = inet_network("10.1.59.80");
    }
    if (valueZero == PARAM_1) {
        addr = inet_network("192.168.100.1");
    }
    if (valueZero == PARAM_2) {
        addr = inet_network("192.168.1.100");
    }
    napi_value result = nullptr;
    napi_create_int32(env, addr, &result);
    return result;
}
static napi_value InetNtoa(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr inp;
    inp.s_addr = valueZero;
    char *ret = inet_ntoa(inp);
    napi_value result = nullptr;
    napi_create_string_utf8(env, ret, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value InetNtop(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr inp;
    inp.s_addr = valueZero;
    char buf[20] = {DEFAULT_VALUE};
    const char *ret = inet_ntop(AF_INET, &inp, buf, sizeof(buf));
    int flag = ERROR;
    if (ret != nullptr) {
        flag = TRUE;
    }
    napi_value result = nullptr;
    napi_create_int32(env, flag, &result);
    return result;
}

static napi_value InetPton(napi_env env, napi_callback_info info)
{
    size_t argc = ONE;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int valueZero;
    napi_get_value_int32(env, args[0], &valueZero);
    struct in_addr inp;
    inp.s_addr = valueZero;
    char buf[20] = {DEFAULT_VALUE};
    int ret = inet_pton(AF_INET, buf, &inp);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"inetAddr", nullptr, InetAddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetAton", nullptr, InetAton, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetLnaof", nullptr, InetLnaof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetMakeaddr", nullptr, InetMakeaddr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetNetof", nullptr, InetNetof, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetNetwork", nullptr, InetNetwork, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetNtoa", nullptr, InetNtoa, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetNtop", nullptr, InetNtop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"inetPton", nullptr, InetPton, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "libinet",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
