/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <hilog/log.h>
#include <network/netmanager/net_connection.h>
#include <network/netmanager/net_connection_type.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
#include <string>
#include <cstdint>
#include <network/netstack/net_http.h>
#include <network/netstack/net_http_type.h>
#include <chrono>
#include <thread>

#define NETWORK_LOG_TAG "LogTagNetwork"
#define NETWORK_LOG_DOMAIN 0x0000
#define DEFAULT_HOST_LEN 20
#define DEFAULT_SERV_LEN 30
#define PARAM_INDEX_0 0
#define PARAM_INDEX_1 1
#define PARAM_INDEX_2 2
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define TIMEOUT_3000 3000

// 通过netId获取DNS结果。
static napi_value OHNetConnGetAddrInfo(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char host[DEFAULT_HOST_LEN] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[PARAM_INDEX_0], host, DEFAULT_HOST_LEN, &sizeT1);
    char serv[DEFAULT_SERV_LEN] = {0};
    napi_get_value_string_utf8(env, args[PARAM_INDEX_1], serv, DEFAULT_SERV_LEN, &sizeT1);
    int netid = 0;
    napi_get_value_int32(env, args[PARAM_INDEX_2], &netid);

    struct addrinfo *res = nullptr;
    int status = OH_NetConn_GetAddrInfo(host, serv, nullptr, &res, netid);
    napi_value result = nullptr;
    napi_create_int32(env, status, &result);
    return result;
}

// 释放DNS结果
static napi_value OHNetConnFreeDnsResult(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct addrinfo *res = nullptr;
    int ret = -1;
    char *host = const_cast<char*>("www.baidu.com");
    char *serv = const_cast<char*>("https");
    char *noHost = const_cast<char*>("");
    if (index == CASE_INDEX_1) {
        OH_NetConn_GetAddrInfo(host, serv, nullptr, &res, 0);
        ret = OH_NetConn_FreeDnsResult(res);
    } else if (index == CASE_INDEX_2) {
        OH_NetConn_GetAddrInfo(noHost, serv, nullptr, &res, 0);
        ret = OH_NetConn_FreeDnsResult(res);
    } else if (index == CASE_INDEX_3) {
        ret = OH_NetConn_FreeDnsResult(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询所有激活的数据网络。
static napi_value OHNetConnGetAllNets(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_NetHandleList netHandles;
        ret = OH_NetConn_GetAllNets(&netHandles);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_GetAllNets(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询是否有默认激活的数据网络。
static napi_value OHNetConnHasDefaultNet(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        int flag = 999;
        ret = OH_NetConn_HasDefaultNet(&flag);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_HasDefaultNet(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询默认网络是否按流量计费。
static napi_value OHNetConnIsDefaultNetMetered(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        int flag = 999;
        ret = OH_NetConn_IsDefaultNetMetered(&flag);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_IsDefaultNetMetered(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 获取激活的默认的数据网络。
static napi_value OHNetConnGetDefaultNet(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_NetHandle netHandle;
        ret = OH_NetConn_GetDefaultNet(&netHandle);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_GetDefaultNet(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询某个数据网络的链路信息。
static napi_value OHNetConnGetConnectionProperties(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_ConnectionProperties netProp;
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_GetConnectionProperties(&netHandle, &netProp);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_GetConnectionProperties(&netHandle, nullptr);
    } else if (index == CASE_INDEX_3) {
        NetConn_ConnectionProperties netProp;
        ret = OH_NetConn_GetConnectionProperties(nullptr, &netProp);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetConn_GetConnectionProperties(nullptr, nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询某个网络的能力集。
static napi_value OHNetConnGetNetCapabilities(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        NetConn_NetCapabilities netCapacities;
        ret = OH_NetConn_GetNetCapabilities(&netHandle, &netCapacities);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_GetNetCapabilities(&netHandle, nullptr);
    } else if (index == CASE_INDEX_3) {
        NetConn_NetCapabilities netCapacities;
        ret = OH_NetConn_GetNetCapabilities(nullptr, &netCapacities);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetConn_GetNetCapabilities(nullptr, nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 查询默认的网络代理。
static napi_value OHNetConnGetDefaultHttpProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_HttpProxy httpProxy;
        ret = OH_NetConn_GetDefaultHttpProxy(&httpProxy);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_GetDefaultHttpProxy(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 自定义 DNS 解析器
int MyCustomDnsResolver(const char *host, const char *serv, const struct addrinfo *hint, struct addrinfo **res)
{
    return 0;
}

// 注册自定义 DNS 解析器
static napi_value OHOSNetConnRegisterDnsResolver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_CustomDnsResolver customResolver = MyCustomDnsResolver;
        ret = OHOS_NetConn_RegisterDnsResolver(customResolver);
    } else if (index == CASE_INDEX_2) {
        ret = OHOS_NetConn_RegisterDnsResolver(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注册自定义 DNS 解析器
static napi_value OHNetConnRegisterDnsResolver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_CustomDnsResolver customResolver = MyCustomDnsResolver;
        ret = OH_NetConn_RegisterDnsResolver(customResolver);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_RegisterDnsResolver(nullptr);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 取消注册自定义 DNS 解析器。
static napi_value OHOSNetConnUnregisterDnsResolver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_CustomDnsResolver customResolver = MyCustomDnsResolver;
        ret = OHOS_NetConn_RegisterDnsResolver(customResolver);
        ret = OHOS_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_2) {
        ret = OHOS_NetConn_RegisterDnsResolver(nullptr);
        ret = OHOS_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_3) {
        ret = OHOS_NetConn_UnregisterDnsResolver();
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 取消注册自定义 DNS 解析器。
static napi_value OHNetConnUnregisterDnsResolver(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_CustomDnsResolver customResolver = MyCustomDnsResolver;
        ret = OH_NetConn_RegisterDnsResolver(customResolver);
        ret = OH_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_RegisterDnsResolver(nullptr);
        ret = OH_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_3) {
        ret = OH_NetConn_UnregisterDnsResolver();
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHNetConnBindSocket(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_BindSocket(netHandle.netId, &netHandle);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_BindSocket(netHandle.netId, nullptr);
    } else if (index == CASE_INDEX_3) {
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        ret = OH_NetConn_BindSocket(-1, &netHandle);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetConn_BindSocket(-1, nullptr);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注册监听网络状态变化的回调。
static napi_value OHNetConnRegisterNetConnCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        ret = OH_NetConn_RegisterNetConnCallback(nullptr, &netConnCallback, 0, &callbackId);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetSpecifier specifier{};
        uint32_t callbackId;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, nullptr, 0, &callbackId);
    } else if (index == CASE_INDEX_3) {
        NetConn_NetConnCallback netConnCallback{};
        NetConn_NetSpecifier specifier{};
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, nullptr);
    } else if (index == CASE_INDEX_4) {
        NetConn_NetSpecifier specifier{};
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        NetConn_NetHandle netHandle;
        OH_NetConn_GetDefaultNet(&netHandle);
        OH_NetConn_GetNetCapabilities(&netHandle, &specifier.caps);
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_5) {
        NetConn_NetSpecifier specifier{};
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        specifier.caps.bearerTypesSize = 1;
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_CELLULAR;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注册监听网络状态变化的回调，测试Timeout参数。
static napi_value OHNetConnRegisterNetConnCallbackTimeout(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);
    NetConn_NetConnCallback netConnCallback{};
    uint32_t callbackId;
    int ret = -1;
    NetConn_NetSpecifier specifier{};
    specifier.caps.bearerTypesSize = 1;
    if (index == CASE_INDEX_1) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_CELLULAR;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, TIMEOUT_3000, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_2) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_CELLULAR;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, UINT32_MAX, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_3) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_4) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, TIMEOUT_3000, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_5) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, UINT32_MAX, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_6) {
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        char *wifi = const_cast<char*>("wifi");
        specifier.bearerPrivateIdentifier = wifi;
        ret = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, UINT32_MAX, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注册监听默认网络状态变化的回调。
static napi_value OHNetConnRegisterDefaultNetConnCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        uint32_t callbackId;
        ret = OH_NetConn_RegisterDefaultNetConnCallback(nullptr, &callbackId);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetConnCallback netConnCallback{};
        ret = OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, nullptr);
    } else if (index == CASE_INDEX_3) {
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        ret = OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注销监听网络状态变化的回调。
static napi_value OHNetConnUnregisterNetConnCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        const uint32_t callbackId = 99999;
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        (void)OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, &callbackId);
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_3) {
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        (void)OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, &callbackId);
        OH_NetConn_UnregisterNetConnCallback(callbackId);
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_4) {
        NetConn_NetSpecifier specifier{};
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        specifier.caps.bearerTypesSize = 1;
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_CELLULAR;
        OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, &callbackId);
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_5) {
        NetConn_NetSpecifier specifier{};
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        specifier.caps.bearerTypesSize = 1;
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, 0, &callbackId);
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    } else if (index == CASE_INDEX_6) {
        NetConn_NetSpecifier specifier{};
        NetConn_NetConnCallback netConnCallback{};
        uint32_t callbackId;
        specifier.caps.bearerTypesSize = 1;
        specifier.caps.bearerTypes[0] = NETCONN_BEARER_WIFI;
        OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, TIMEOUT_3000, &callbackId);
        ret = OH_NetConn_UnregisterNetConnCallback(callbackId);
    }

    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 设置应用代理配置信息。
static napi_value OHNetConnSetAppHttpProxy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        NetConn_HttpProxy httpProxy;
        OH_NetConn_GetDefaultHttpProxy(&httpProxy);
        ret = OH_NetConn_SetAppHttpProxy(&httpProxy);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetConn_SetAppHttpProxy(nullptr);
    } else if (index == CASE_INDEX_3) {
        NetConn_HttpProxy httpProxy;
        OH_NetConn_GetDefaultHttpProxy(&httpProxy);
        ret = OH_NetConn_SetAppHttpProxy(&httpProxy);
        ret = OH_NetConn_SetAppHttpProxy(&httpProxy);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 自定义 应用代理信息变化 回调。
void HandleHttpProxyChange(NetConn_HttpProxy *proxy)
{
    return;
}

// 注册自定义 代理配置信息变化 回调。
static napi_value OHNetConnRegisterAppHttpProxyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, &callbackId);
    } else if (index == CASE_INDEX_2) {
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, nullptr);
    } else if (index == CASE_INDEX_3) {
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(nullptr, &callbackId);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetConn_RegisterAppHttpProxyCallback(nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        NetConn_HttpProxy httpProxy;
        OH_NetConn_GetDefaultHttpProxy(&httpProxy);
        ret = OH_NetConn_SetAppHttpProxy(&httpProxy);
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, &callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 注销自定义 代理配置信息变化 回调。
static napi_value OHNetConnUnregisterAppHttpProxyCallback(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[PARAM_INDEX_0], &index);

    int ret = -1;
    if (index == CASE_INDEX_1) {
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, &callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
    } else if (index == CASE_INDEX_2) {
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(nullptr, &callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
    } else if (index == CASE_INDEX_3) {
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, &callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
        NetConn_HttpProxy httpProxy;
        OH_NetConn_GetDefaultHttpProxy(&httpProxy);
        ret = OH_NetConn_SetAppHttpProxy(&httpProxy);
    } else if (index == CASE_INDEX_4) {
        OH_NetConn_AppHttpProxyChange proxyChange = HandleHttpProxyChange;
        uint32_t callbackId;
        ret = OH_NetConn_RegisterAppHttpProxyCallback(proxyChange, &callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackId);
    } else if (index == CASE_INDEX_5) {
        uint32_t callbackIdNotExist = 20202020;
        OH_NetConn_UnregisterAppHttpProxyCallback(callbackIdNotExist);
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 获取pacurl
static napi_value OHNetConnGetPacUrl(napi_env env, napi_callback_info info)
{
    char pacUrl[100];
    int res = OH_NetConn_GetPacUrl(pacUrl);
    std::string a = std::string(pacUrl);
    napi_value result = nullptr;
    napi_create_string_utf8(env, a.c_str(), a.length(), &result);
    return result;
}
// 设置pacurl
static napi_value OHNetConnSetPacUrl(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    char pacUrl[1024] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], pacUrl, DEFAULT_HOST_LEN, &sizeT1);
    
    int res = OH_NetConn_SetPacUrl(pacUrl);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

Http_Request *request = nullptr;

void Http_SampleResponseCallback(Http_Response *response, uint32_t errCode)
{
    if (response == nullptr) {
        return;
    }
    if (errCode != 0) {
        response->destroyResponse(&response);
        return;
    }
    if (response->headers != nullptr) {
        Http_HeaderEntry *entries = OH_Http_GetHeaderEntries(response->headers);
        
        Http_HeaderValue *headerValue;
        Http_HeaderEntry *delEntries = entries;
        while (entries != nullptr) {
            headerValue = entries->value;
            while (headerValue != nullptr && entries->key != nullptr) {
                headerValue = headerValue->next;
            }
            entries = entries->next;
        }
    }
    response->destroyResponse(&response);
}

void Http_SampleOnDataReceiveCallback(const char *data, size_t length) 
{
    if (data == NULL) {
        return;
    }
    return;
}

void Http_SampleOnUploadProgressCallback(uint64_t totalSize, uint64_t transferredSize)
{
    return;
}

void Http_SampleOnDownloadProgressCallback(uint64_t totalSize, uint64_t transferredSize)
{
    return;
}

void Http_SampleOnHeaderReceiveCallback(Http_Headers *headers)
{
    if (headers != nullptr) {
        Http_HeaderEntry *entries = OH_Http_GetHeaderEntries(headers);
        
        Http_HeaderValue *headerValue;
        Http_HeaderEntry *delEntries = entries;
        while (entries != nullptr) {
            headerValue = entries->value;
            while (headerValue != nullptr && entries->key != nullptr) {
                headerValue = headerValue->next;
            }
            entries = entries->next;
        }
        OH_Http_DestroyHeaderEntries(&delEntries);
        OH_Http_DestroyHeaders(&headers);
    }
}

void Http_SampleOnEndCallback()
{ 
    return; 
}

void Http_SampleOnCancelCallback()
{ 
    return; 
}

static napi_value CallHttpClientApi(napi_env env, napi_callback_info info)
{
    napi_value res;

    const char *senddata = "https://www.baidu.com";
    
    Http_Request *request = OH_Http_CreateRequest(senddata);
        OH_LOG_INFO(LOG_APP, "success %{public}s tests", request->url);
    if (request == nullptr) {
        return 0;
    }
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    if (request->options == nullptr) {
        return 0;
    }
    request->options->method = NET_HTTP_METHOD_GET;
    Http_Headers *headers = OH_Http_CreateHeaders();
    if (headers == nullptr) {
        return 0;
    }
    const char *key = "testKey";
    const char *key1 = "testKey1";
    const char *value1 = "testValue1";
    const char *value2 = "testValue2";
    uint32_t ret = OH_Http_SetHeaderValue(headers, key1, value1);
    ret = OH_Http_SetHeaderValue(headers, key, value2);
    request->options->headers = headers;

    Http_Proxy proxy;
    (void)memset(&proxy, 0, sizeof(Http_Proxy));
    proxy.proxyType = HTTP_PROXY_NOT_USE;
    (void)memset(&proxy.customProxy, 0, sizeof(Http_CustomProxy));
    request->options->httpProxy = &proxy;
    Http_EventsHandler eventsHandler;
    eventsHandler.onDataReceive = Http_SampleOnDataReceiveCallback;
    eventsHandler.onCanceled = Http_SampleOnCancelCallback;
    eventsHandler.onDataEnd = Http_SampleOnEndCallback;
    eventsHandler.onDownloadProgress = Http_SampleOnDownloadProgressCallback;
    eventsHandler.onUploadProgress = Http_SampleOnUploadProgressCallback;
    eventsHandler.onHeadersReceive = Http_SampleOnHeaderReceiveCallback;
    int status = OH_Http_Request(request, Http_SampleResponseCallback, eventsHandler);
    if (status != 0) {
        return 0;
    }
    OH_Http_DestroyHeaders(&headers);
    free(request->options);
    napi_value result = nullptr;
    napi_create_int32(env, status, &result);
    return result;
}

static napi_value OHHttpGetHeaderValue(napi_env env, napi_callback_info info)
{
    Http_Headers *headers = OH_Http_CreateHeaders();
    const char *key = "testKey";
    const char *value = "testValue";
    uint32_t res = OH_Http_SetHeaderValue(headers, key, value);
    Http_HeaderValue *headValue = OH_Http_GetHeaderValue(headers, key);
    OH_Http_DestroyHeaders(&headers);

    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value OHNetStackIsCleartextCfgByComponent(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char component[1024] = {0};
    size_t size_t1;
    napi_get_value_string_utf8(env, args[0], component, DEFAULT_HOST_LEN, &size_t1);

    bool isComponetCfg;
    int res = OH_Netstack_IsCleartextCfgByComponent(component, &isComponetCfg);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OHQueryProbeResult_destination_nullptr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char pacUrl[1024] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], pacUrl, DEFAULT_HOST_LEN, &sizeT1);
    NetConn_ProbeResultInfo probeResultInfo = {};
    int res = OH_NetConn_QueryProbeResult(nullptr, 10, &probeResultInfo);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OHQueryProbeResult_int(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char pacUrl[1024] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], pacUrl, DEFAULT_HOST_LEN, &sizeT1);
    NetConn_ProbeResultInfo probeResultInfo = {};
    int res = OH_NetConn_QueryProbeResult(pacUrl, 10, &probeResultInfo);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OHQueryTraceRoute(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char pacUrl[1024] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], pacUrl, DEFAULT_HOST_LEN, &sizeT1);
    NetConn_TraceRouteInfo traceRouteInfo[30] = {};
    NetConn_TraceRouteOption traceoption = {30, NETCONN_PACKETS_ICMP};
    int res = OH_NetConn_QueryTraceRoute(pacUrl, &traceoption, traceRouteInfo);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

EXTERN_C_START
static napi_property_descriptor net_group[] = {
    {"CallHttpClientApi", nullptr, CallHttpClientApi, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHHttpGetHeaderValue", nullptr, OHHttpGetHeaderValue, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnGetAddrInfo", nullptr, OHNetConnGetAddrInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnFreeDnsResult", nullptr, OHNetConnFreeDnsResult, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnGetAllNets", nullptr, OHNetConnGetAllNets, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnHasDefaultNet", nullptr, OHNetConnHasDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnIsDefaultNetMetered", nullptr, OHNetConnIsDefaultNetMetered, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHNetConnGetDefaultNet", nullptr, OHNetConnGetDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnGetConnectionProperties", nullptr, OHNetConnGetConnectionProperties, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHNetConnGetNetCapabilities", nullptr, OHNetConnGetNetCapabilities, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHNetConnGetDefaultHttpProxy", nullptr, OHNetConnGetDefaultHttpProxy, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHOSNetConnRegisterDnsResolver", nullptr, OHOSNetConnRegisterDnsResolver, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHOSNetConnUnregisterDnsResolver", nullptr, OHOSNetConnUnregisterDnsResolver, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHNetConnRegisterDnsResolver", nullptr, OHNetConnRegisterDnsResolver, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHNetConnUnregisterDnsResolver", nullptr, OHNetConnUnregisterDnsResolver, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHNetConnBindSocket", nullptr, OHNetConnBindSocket, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnSetAppHttpProxy", nullptr, OHNetConnSetAppHttpProxy, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHNetConnRegisterAppHttpProxyCallback", nullptr, OHNetConnRegisterAppHttpProxyCallback, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnUnregisterAppHttpProxyCallback", nullptr, OHNetConnUnregisterAppHttpProxyCallback, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnRegisterNetConnCallback", nullptr, OHNetConnRegisterNetConnCallback, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHNetConnRegisterNetConnCallbackTimeout", nullptr, OHNetConnRegisterNetConnCallbackTimeout, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHNetConnRegisterDefaultNetConnCallback", nullptr, OHNetConnRegisterDefaultNetConnCallback, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnUnregisterNetConnCallback", nullptr, OHNetConnUnregisterNetConnCallback, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHNetConnGetPacUrl", nullptr, OHNetConnGetPacUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetConnSetPacUrl", nullptr, OHNetConnSetPacUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHNetStackIsCleartextCfgByComponent", nullptr, OHNetStackIsCleartextCfgByComponent, nullptr, nullptr,
     nullptr, napi_default, nullptr},
};

static napi_property_descriptor ping_group[] = {
    {"OHQueryProbeResult_destination_nullptr", nullptr, OHQueryProbeResult_destination_nullptr, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHQueryProbeResult_int", nullptr, OHQueryProbeResult_int, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHQueryTraceRoute", nullptr, OHQueryTraceRoute, nullptr, nullptr, nullptr, napi_default, nullptr},
};

static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(net_group) / sizeof(net_group[0]), net_group);
    napi_define_properties(env, exports, sizeof(ping_group) / sizeof(ping_group[0]), ping_group);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "testNetConnectNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

