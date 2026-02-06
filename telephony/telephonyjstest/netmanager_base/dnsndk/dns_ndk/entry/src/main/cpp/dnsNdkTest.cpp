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
#include <network/netmanager/net_connection.h>
#include <network/netmanager/net_connection_type.h>
#include <netdb.h>
#include <cstring>
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "NetManagerNDK"

#define DEFAULT_HOST_LEN 20
#define DEFAULT_SERV_LEN 30
#define HOST_POS 0
#define SERV_POS 1
#define NETID_POS 2

static napi_value GetAddrInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value ret;
    int status = 0;
    int neterrno = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    char host[DEFAULT_HOST_LEN] = {0};
    size_t result;
    napi_get_value_string_utf8(env, args[HOST_POS], host, DEFAULT_HOST_LEN, &result);

    char serv[DEFAULT_SERV_LEN] = {0};
    napi_get_value_string_utf8(env, args[SERV_POS], serv, DEFAULT_SERV_LEN, &result);

    int netid = 0;
    napi_get_value_int32(env, args[NETID_POS], &netid);

    struct addrinfo *res = nullptr;
    status = OH_NetConn_GetAddrInfo(host, nullptr, nullptr, &res, netid);
    if (status == 0) {
        status = OH_NetConn_FreeDnsResult(res);
    }
    
    neterrno = status;
    napi_create_int32(env, neterrno, &ret);
    return ret;
}

int DnsResolver(const char *host, const char *serv, const struct addrinfo *hint, struct addrinfo **res)
{
    return 0;
}

static napi_value RegisterDnsResolver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value ret;
    int neterrno = 0;

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int function = 0;
    napi_get_value_int32(env, args[0], &function);

    if (function == 0) {
        neterrno = OHOS_NetConn_RegisterDnsResolver(DnsResolver);
        napi_create_int32(env, neterrno, &ret);
        OHOS_NetConn_UnregisterDnsResolver();
        return ret;
    }

    if (function == 1) {
        neterrno = OHOS_NetConn_RegisterDnsResolver(nullptr);
        napi_create_int32(env, neterrno, &ret);
        OHOS_NetConn_UnregisterDnsResolver();
        return ret;
    }

    napi_create_int32(env, neterrno, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getaddrinfo", nullptr, GetAddrInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"registerdnsresolver", nullptr, RegisterDnsResolver, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
