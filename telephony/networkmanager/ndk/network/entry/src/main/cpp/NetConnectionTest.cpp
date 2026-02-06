/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "native_common.h"
#include <network/netmanager/net_connection.h>
#include <network/netmanager/net_connection_type.h>
#include <network/netstack/net_websocket_type.h>
#include <network/netstack/net_websocket.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
#include <network/netstack/net_ssl/net_ssl_c_type.h>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <string>
#include <algorithm>
#include <fstream>
#include <vector>
#include <iterator>
using namespace std;

static const uint32_t MAX_NAME_LENGTH = 1024;
static const uint32_t DEFAULT_HOST_LEN = 20;
static const uint32_t DEFAULT_SERV_LEN = 30;
static const uint32_t MAX_BUFFER_SIZE = 128;
static const uint32_t MAX_ARG_COUNT = 8;
static const uint32_t TIMEOUT_3000 = 3000;
static const uint32_t CASE_INDEX_1 = 1;
static const uint32_t CASE_INDEX_2 = 2;
static const uint32_t CASE_INDEX_3 = 3;
static const uint32_t CASE_INDEX_4 = 4;
static const uint32_t CASE_INDEX_5 = 5;
static const uint32_t CASE_INDEX_6 = 6;
static const uint32_t CASE_INDEX_7 = 7;
static const uint32_t CASE_INDEX_8 = 8;
static const uint32_t CASE_INDEX_9 = 9;
static const uint32_t CASE_INDEX_10 = 10;
static const uint32_t CASE_INDEX_11 = 11;
static const uint32_t CASE_INDEX_12 = 12;
static const uint32_t CASE_INDEX_13 = 13;
static const uint32_t CASE_INDEX_14 = 14;
static const uint32_t DURATION = 15;

static const int32_t INVALID_STATUS = -1;
static const uint32_t NETMANAGER_EXT_SUCCESS = 0;
static const uint32_t NETMANAGER_ERR_PERMISSION_DENIED = 201;
static const uint32_t NETMANAGER_ERR_PARAMETER_ERROR = 401;
static const uint32_t OK = 0;
static const uint32_t PERMISSION_DENIED = 201;
static const uint32_t PARAMETER_ERROR = 401;
static const uint32_t OPERATION_FAILED = 2100002;
static const uint32_t INTERNAL_ERROR = 2100003;
static const uint32_t CALLBACK_REG_TRY_AGAIN_ERROR = 2100008;
static const uint32_t REQ_NUMBER_OVERLOAD = 2101022;

static const uint32_t CERT_REVOKED = 2305023;
static const uint32_t INVALID_CA = 2305024;
static const uint32_t CERT_UNTRUST = 2305027;
static const uint32_t MEMORY_OVERFLOW = 2305999;

static std::string GetString(napi_env env, napi_callback_info info, uint32_t index)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char output[MAX_BUFFER_SIZE] = {0};
    size_t size = 0;
    napi_get_value_string_utf8(env, args[index], output, MAX_BUFFER_SIZE, &size);
    return std::string(output);
}

static int32_t GetInt(napi_env env, napi_callback_info info, uint32_t index)
{
    size_t argc = MAX_ARG_COUNT;
    napi_value args[MAX_ARG_COUNT] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t ret = -1;
    napi_get_value_int32(env, args[index], &ret);
    return ret;
}

napi_value NetConn_HasDefaultNet(napi_env env, napi_callback_info info)
{
    int32_t hasDefaultNet;
    int32_t returnValue = OH_NetConn_HasDefaultNet(&hasDefaultNet);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetDefaultNet(napi_env env, napi_callback_info info)
{
    NetConn_NetHandle netHandle;
    int32_t returnValue = OH_NetConn_GetDefaultNet(&netHandle);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_IsDefaultNetMetered(napi_env env, napi_callback_info info)
{
    int32_t isMetered;
    int32_t returnValue = OH_NetConn_IsDefaultNetMetered(&isMetered);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetConnectionProperties(napi_env env, napi_callback_info info)
{
    NetConn_ConnectionProperties netProp;
    NetConn_NetHandle netHandle;
    OH_NetConn_GetDefaultNet(&netHandle);
    int32_t returnValue = OH_NetConn_GetConnectionProperties(&netHandle, &netProp);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetNetCapabilities(napi_env env, napi_callback_info info)
{
    NetConn_NetHandle netHandle;
    OH_NetConn_GetDefaultNet(&netHandle);
    NetConn_NetCapabilities netCapacities;
    int32_t returnValue = OH_NetConn_GetNetCapabilities(&netHandle, &netCapacities);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetAddrInfo(napi_env env, napi_callback_info info)
{
    std::string host = GetString(env, info, 0);
    std::string serv = GetString(env, info, 1);
    struct addrinfo *res = nullptr;
    int32_t returnValue = OH_NetConn_GetAddrInfo(const_cast<char*>(host.c_str()),
        const_cast<char*>(serv.c_str()), nullptr, &res, 0);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetAllNets(napi_env env, napi_callback_info info)
{
    NetConn_NetHandleList netHandles;
    int32_t returnValue = OH_NetConn_GetAllNets(&netHandles);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_SetPacUrl(napi_env env, napi_callback_info info)
{
    std::string pacUrl = GetString(env, info, 0);
    int32_t returnValue = -1;
    if (pacUrl.empty()) {
        returnValue = OH_NetConn_SetPacUrl(nullptr);
    } else {
        returnValue = OH_NetConn_SetPacUrl(const_cast<char*>(pacUrl.c_str()));
    }
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_GetPacUrl(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    char tmpBuffer[MAX_BUFFER_SIZE];
    char *pac = tmpBuffer;
    if (index == 0) {
        pac = nullptr;
    }
    int32_t returnValue = OH_NetConn_GetPacUrl(pac);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

void MyNetCapabilitiesChange(NetConn_NetHandle *netHandle, NetConn_NetCapabilities *netCapabilities)
{
    return;
}

napi_value NetConn_NetCapabilities_netCaps(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    NetConn_NetHandle netHandle;
    NetConn_NetCapabilities netCapabilities = {};
    int32_t val = CASE_INDEX_1;
    switch (index) {
        case CASE_INDEX_1:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_MMS;
            break;
        case CASE_INDEX_2:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_NOT_METERED;
            break;
        case CASE_INDEX_3:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_INTERNET;
            break;
        case CASE_INDEX_4:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_NOT_VPN;
            break;
        case CASE_INDEX_5:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_VALIDATED;
            break;
        case CASE_INDEX_6:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_PORTAL;
            break;
        case CASE_INDEX_7:
            val = NetConn_NetCap::NETCONN_NET_CAPABILITY_CHECKING_CONNECTIVITY;
            break;
        case CASE_INDEX_8:
            netCapabilities.linkUpBandwidthKbps = MAX_NAME_LENGTH;
            break;
        case CASE_INDEX_9:
            netCapabilities.linkDownBandwidthKbps = MAX_NAME_LENGTH;
            break;
        case CASE_INDEX_10:
            netCapabilities.netCaps[0] = NetConn_NetCap::NETCONN_NET_CAPABILITY_VALIDATED;
            break;
        case CASE_INDEX_11:
            netCapabilities.netCapsSize = 0;
            break;
        default:
            break;
    }
    OH_NetConn_NetCapabilitiesChange capabilitiesChangeFunc = MyNetCapabilitiesChange;
    capabilitiesChangeFunc(&netHandle, &netCapabilities);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

static void OnOpen(struct WebSocket *client, WebSocket_OpenResult openResult)
{
    return;
}

static void OnMessage(struct WebSocket *client, char *data, uint32_t length)
{
    return;
}

static void OnError(struct WebSocket *client, WebSocket_ErrorResult error)
{
    return;
}

static void OnClose(struct WebSocket *client, WebSocket_CloseResult closeResult)
{
    return;
}

napi_value WebSocket_Close_Result(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    struct WebSocket *client = new WebSocket();
    if (index == CASE_INDEX_1) {
        client->onClose = OnClose;
        WebSocket_CloseResult closeResult = {
            .code = 0,
        };
        client->onClose(client, closeResult);
    } else {
        client->onClose = OnClose;
        WebSocket_CloseResult closeResult = {
            .code = 0,
            .reason = "ok",
        };
        client->onClose(client, closeResult);
    }

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    delete client;
    return result;
}

napi_value WebSocket_Error_Result(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    struct WebSocket *client = new WebSocket();
    client->onError = OnError;
    if (index == CASE_INDEX_1) {
        WebSocket_ErrorResult errorResult = {
            .errorCode = 0,
        };
        client->onError(client, errorResult);
    } else {
        WebSocket_ErrorResult errorResult = {
            .errorCode = 0,
            .errorMessage = "ok",
        };
        client->onError(client, errorResult);
    }

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    delete client;
    return result;
}

napi_value WebSocket_Open_Result(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    struct WebSocket *client = new WebSocket();
    client->onOpen = OnOpen;
    if (index == CASE_INDEX_1) {
        WebSocket_OpenResult openResult = {
            .code = 0,
        };
        client->onOpen(client, openResult);
    } else {
        WebSocket_OpenResult openResult = {
            .code = 0,
            .reason = "OK",
        };
        client->onOpen(client, openResult);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    delete client;
    return result;
}

napi_value WebSocket_Request_Options(napi_env env, napi_callback_info info)
{
    struct WebSocket *client = new WebSocket();
    WebSocket_RequestOptions options;
    struct WebSocket_Header header = {
        .fieldName = "Content-Type",
        .fieldValue = "application/json",
        .next = nullptr,
    };
    options.headers = &header;
    client->requestOptions = options;
    int32_t returnValue = OH_WebSocketClient_AddHeader(client, header);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    delete client;
    return result;
}

napi_value Web_Socket(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    struct WebSocket *client = new WebSocket();
    WebSocket_RequestOptions options;
    struct WebSocket_Header header = {
        .fieldName = "Content-Type",
        .fieldValue = "application/json",
        .next = nullptr,
    };
    options.headers = &header;
    client->requestOptions = options;
    if (index == CASE_INDEX_1) {
        client->onOpen = OnOpen;
    } else if (index == CASE_INDEX_2) {
        client->onMessage = OnMessage;
    } else if (index == CASE_INDEX_3) {
        client->onError = OnError;
    } else {
        client->onClose = OnClose;
    }
    int32_t returnValue = OH_WebSocketClient_AddHeader(client, header);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    delete client;
    return result;
}

static int32_t ReadSocketError(int32_t errCode)
{
    switch (errCode) {
        case WEBSOCKET_OK:
            break;
        case E_BASE:
            break;
        case WEBSOCKET_CLIENT_NULL:
            break;
        case WEBSOCKET_CLIENT_NOT_CREATED:
            break;
        case WEBSOCKET_CONNECTION_ERROR:
            break;
        case WEBSOCKET_CONNECTION_PARSE_URL_ERROR:
            break;
        case WEBSOCKET_CONNECTION_NO_MEMORY:
            break;
        case WEBSOCKET_CONNECTION_CLOSED_BY_PEER:
            break;
        case WEBSOCKET_DESTROYED:
            break;
        case WEBSOCKET_PROTOCOL_ERROR:
            break;
        case WEBSOCKET_SEND_NO_MEMORY:
            break;
        case WEBSOCKET_SEND_DATA_NULL:
            break;
        case WEBSOCKET_DATA_LENGTH_EXCEEDED:
            break;
        case WEBSOCKET_QUEUE_LENGTH_EXCEEDED:
            break;
        case WEBSOCKET_NO_CLIENT_CONTEXT:
            break;
        case WEBSOCKET_NO_HEADER_CONTEXT:
            break;
        case WEBSOCKET_HEADER_EXCEEDED:
            break;
        case WEBSOCKET_NO_CONNECTION:
            break;
        case WEBSOCKET_NO_CONNECTION_CONTEXT:
            break;
    }
    return errCode;
}

napi_value Web_Socket_ErrCode(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    struct WebSocket *client = new WebSocket();
    struct WebSocket_Header header;
    header.fieldName = "Content-Type";
    header.fieldValue = "application/json";
    header.next = nullptr;
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        //returnValue is  WEBSOCKET_OK
        returnValue = OH_WebSocketClient_AddHeader(client, header);
    } else if (index == CASE_INDEX_2) {
        //returnValue is  WEBSOCKET_CLIENT_NULL
        returnValue = OH_WebSocketClient_AddHeader(nullptr, header);
    } else if (index == CASE_INDEX_3) {
        //returnValue is  WEBSOCKET_CLIENT_NOT_CREATED
        returnValue = OH_WebSocketClient_Connect(client, url.c_str(), client->requestOptions);
    } else if (index == CASE_INDEX_4) {
        //returnValue is  WEBSOCKET_SEND_DATA_NULL
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
        returnValue = OH_WebSocketClient_Connect(client, url.c_str(), client->requestOptions);
        returnValue = OH_WebSocketClient_AddHeader(client, header);
        returnValue = OH_WebSocketClient_Send(client, nullptr, 0);
    }
    returnValue = ReadSocketError(returnValue);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetStack_Certificate_PinningKind(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    NetStack_CertificatePinning pin;
    pin.kind = NetStack_CertificatePinningKind::PUBLIC_KEY;
    int32_t returnValue = OH_NetStack_GetPinSetForHostName(url.c_str(), &pin);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == MEMORY_OVERFLOW) {
        returnValue = MEMORY_OVERFLOW;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetStack_Hash_Algorithm(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    NetStack_CertificatePinning pin;
    pin.kind = NetStack_CertificatePinningKind::PUBLIC_KEY;
    pin.hashAlgorithm = NetStack_HashAlgorithm::SHA_256;
    int32_t returnValue = OH_NetStack_GetPinSetForHostName(url.c_str(), &pin);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == MEMORY_OVERFLOW) {
        returnValue = MEMORY_OVERFLOW;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Public_KeyHash(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    NetStack_CertificatePinning pin;
    pin.kind = NetStack_CertificatePinningKind::PUBLIC_KEY;
    pin.hashAlgorithm = NetStack_HashAlgorithm::SHA_256;
    pin.publicKeyHash = nullptr;
    int32_t returnValue = OH_NetStack_GetPinSetForHostName(url.c_str(), &pin);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == MEMORY_OVERFLOW) {
        returnValue = MEMORY_OVERFLOW;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetStack_IsCleartextPermitted(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int returnValue = -1;
    if (index == CASE_INDEX_1) {
        bool isCleartextPermitted;
        returnValue = OH_Netstack_IsCleartextPermitted(&isCleartextPermitted);
    } else {
        returnValue = OH_Netstack_IsCleartextPermitted(nullptr);
    }
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value NetStack_IsCleartextPermittedByHostName(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int returnValue = -1;
    bool isCleartextPermitted;
    if (index == CASE_INDEX_1) {
        returnValue = OH_Netstack_IsCleartextPermittedByHostName(url.c_str(), &isCleartextPermitted);
    } else {
        returnValue = OH_Netstack_IsCleartextPermittedByHostName(nullptr, &isCleartextPermitted);
    }
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value NetConn_Net_Specifier(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string identifier = GetString(env, info, 1);
    NetConn_NetSpecifier specifier;
    NetConn_NetConnCallback netConnCallback;
    uint32_t timeout = 1;
    uint32_t callbackId = 1;
    int32_t returnValue = -1;
    specifier.bearerPrivateIdentifier = strdup(identifier.c_str());
    if (index == CASE_INDEX_1) {
        specifier.caps.bearerTypes[0] = NetConn_NetBearerType::NETCONN_BEARER_BLUETOOTH;
        specifier.caps.bearerTypesSize = 1;
    } else if (index == CASE_INDEX_2) {
        specifier.caps.bearerTypes[0] = NetConn_NetBearerType::NETCONN_BEARER_ETHERNET;
        specifier.caps.bearerTypesSize = 1;
    } else {
        specifier.caps.bearerTypes[0] = NetConn_NetBearerType::NETCONN_BEARER_VPN;
        specifier.caps.bearerTypesSize = 1;
        returnValue = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, timeout, &callbackId);
        callbackId++;
    }
    returnValue = OH_NetConn_RegisterNetConnCallback(&specifier, &netConnCallback, timeout, &callbackId);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    } else if (returnValue == REQ_NUMBER_OVERLOAD) {
        returnValue = REQ_NUMBER_OVERLOAD;
    } else if (returnValue == CALLBACK_REG_TRY_AGAIN_ERROR) {
        returnValue = CALLBACK_REG_TRY_AGAIN_ERROR;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value NetConn_Net_Addr(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string address = GetString(env, info, 1);
    NetConn_NetAddr netAddr;
    if (index == CASE_INDEX_1) {
        netAddr.family = AF_INET;
    } else if (index == CASE_INDEX_2) {
        netAddr.prefixlen = 1;
    } else if (index == CASE_INDEX_3) {
        netAddr.port = 1;
    } else {
        std::copy(address.c_str(), address.c_str() +  address.size() - 1, std::begin(netAddr.address));
    }
    NetConn_ConnectionProperties netProperty;
    netProperty.netAddrList[0] = netAddr;
    netProperty.netAddrListSize = 1;
    NetConn_NetHandle netHandle;
    OH_NetConn_GetDefaultNet(&netHandle);
    int32_t returnValue = OH_NetConn_GetConnectionProperties(&netHandle, &netProperty);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_RouteConn(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string iface = GetString(env, info, 1);
    NetConn_Route route;
    NetConn_NetAddr netAddr;
    if (index == CASE_INDEX_1) {
        std::copy(iface.c_str(), iface.c_str() +  iface.size() - 1, std::begin(route.iface));
    } else if (index == CASE_INDEX_2) {
        route.destination = netAddr;
    } else if (index == CASE_INDEX_3) {
        route.gateway = netAddr;
    } else if (index == CASE_INDEX_4) {
        route.hasGateway = 0;
    } else {
        route.isDefaultRoute = 0;
    }
    NetConn_ConnectionProperties netProperty;
    netProperty.routeList[0] = route;
    netProperty.routeListSize = 1;
    NetConn_NetHandle netHandle;
    OH_NetConn_GetDefaultNet(&netHandle);
    int32_t returnValue = OH_NetConn_GetConnectionProperties(&netHandle, &netProperty);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_Http_Proxy(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string host = GetString(env, info, 1);
    NetConn_HttpProxy httpProxy;
    if (index == CASE_INDEX_1) {
        std::copy(host.c_str(), host.c_str() +  host.size() - 1, std::begin(httpProxy.host));
    } else if (index == CASE_INDEX_2) {
        std::copy(host.c_str(), host.c_str() +  host.size() - 1, std::begin(httpProxy.exclusionList[0]));
        httpProxy.exclusionListSize = 1;
    } else if (index == CASE_INDEX_3) {
        httpProxy.exclusionListSize = 0;
    } else {
        httpProxy.port = 0;
    }
    int32_t returnValue = OH_NetConn_GetDefaultHttpProxy(&httpProxy);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_Connection_Properties(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string ifaceName = GetString(env, info, 1);
    NetConn_ConnectionProperties netProperty;
    NetConn_NetAddr netAddr;
    NetConn_NetAddr dnsAddr;
    NetConn_Route route;
    NetConn_HttpProxy httpProxy;
    if (index == CASE_INDEX_1) {
        std::copy(ifaceName.c_str(), ifaceName.c_str() +  ifaceName.size() - 1, std::begin(netProperty.ifaceName));
    } else if (index == CASE_INDEX_2) {
        std::copy(ifaceName.c_str(), ifaceName.c_str() +  ifaceName.size() - 1, std::begin(netProperty.domain));
    } else if (index == CASE_INDEX_3) {
        std::copy(ifaceName.c_str(), ifaceName.c_str() +  ifaceName.size() - 1, std::begin(netProperty.tcpBufferSizes));
    } else if (index == CASE_INDEX_4) {
        netProperty.mtu = 0;
    } else if (index == CASE_INDEX_5) {
        netProperty.netAddrList[0] = netAddr;
        netProperty.netAddrListSize = 1;
    } else if (index == CASE_INDEX_6) {
        netProperty.netAddrListSize = 0;
    } else if (index == CASE_INDEX_7) {
        netProperty.dnsList[0] = dnsAddr;
        netProperty.dnsListSize = 1;
    } else if (index == CASE_INDEX_8) {
        netProperty.dnsListSize = 0;
    } else if (index == CASE_INDEX_9) {
        netProperty.routeList[0] = route;
        netProperty.routeListSize = 1;
    } else if (index == CASE_INDEX_10) {
        netProperty.routeListSize = 0;
    } else {
        netProperty.httpProxy = httpProxy;
    }
    NetConn_NetHandle netHandle;
    OH_NetConn_GetDefaultNet(&netHandle);
    int32_t returnValue = OH_NetConn_GetConnectionProperties(&netHandle, &netProperty);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_NetHandle_List(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    NetConn_NetHandle netHandle;
    NetConn_NetHandleList netHandleList;
    if (index == CASE_INDEX_1) {
        netHandleList.netHandles[0] = netHandle;
    } else {
        netHandleList.netHandles[0] = netHandle;
        netHandleList.netHandleListSize = 1;
    }
    int32_t returnValue = OH_NetConn_GetAllNets(&netHandleList);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

int DnsResolver(const char *host, const char *serv, const struct addrinfo *hint, struct addrinfo **res)
{
    return 0;
}

napi_value Register_DnsResolver(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        returnValue = OH_NetConn_RegisterDnsResolver(nullptr);
    } else if (index == CASE_INDEX_2) {
        returnValue = OHOS_NetConn_RegisterDnsResolver(nullptr);
    }
    if (returnValue == NETMANAGER_EXT_SUCCESS) {
        returnValue = NETMANAGER_EXT_SUCCESS;
    } else if (returnValue == NETMANAGER_ERR_PERMISSION_DENIED) {
        returnValue = NETMANAGER_ERR_PERMISSION_DENIED;
    } else if (returnValue == NETMANAGER_ERR_PARAMETER_ERROR) {
        returnValue = NETMANAGER_ERR_PARAMETER_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Unregister_DnsResolver(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        returnValue = OHOS_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_2) {
        OHOS_NetConn_RegisterDnsResolver(DnsResolver);
        returnValue = OHOS_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_3) {
        returnValue = OH_NetConn_UnregisterDnsResolver();
    } else if (index == CASE_INDEX_4) {
        OHOS_NetConn_RegisterDnsResolver(DnsResolver);
        returnValue = OH_NetConn_UnregisterDnsResolver();
    }
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Register_DetCallback(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        NetConn_NetConnCallback netConnCallback = {
            .onNetCapabilitiesChange = MyNetCapabilitiesChange,
        };
        uint32_t callbackId;
        returnValue = OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, &callbackId);
    } else if (index == CASE_INDEX_2) {
        NetConn_NetConnCallback netConnCallback = {
            .onNetCapabilitiesChange = MyNetCapabilitiesChange,
        };
        uint32_t callbackId;
        returnValue = OH_NetConn_RegisterDefaultNetConnCallback(&netConnCallback, &callbackId);
        returnValue = OH_NetConn_UnregisterNetConnCallback(callbackId);
    }
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    } else if (returnValue == REQ_NUMBER_OVERLOAD) {
        returnValue = REQ_NUMBER_OVERLOAD;
    } else if (returnValue == CALLBACK_REG_TRY_AGAIN_ERROR) {
        returnValue = CALLBACK_REG_TRY_AGAIN_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetCon_QueryProResult(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string dest = GetString(env, info, 1);
    char *destination = const_cast<char *>(dest.c_str());
    NetConn_ProbeResultInfo* probeResultPtr = nullptr;
    NetConn_ProbeResultInfo probeResultInfo;
    int32_t duration = -1;
    if (index == CASE_INDEX_1) {
        destination = nullptr;
        probeResultPtr = nullptr;
    } else {
        probeResultPtr = &probeResultInfo;
        duration = DURATION;
    }
    int32_t returnValue = OH_NetConn_QueryProbeResult(destination, duration, probeResultPtr);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_QueryTrRout(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string dest = GetString(env, info, 1);
    char *destination = nullptr;
    NetConn_TraceRouteOption* optionPtr = nullptr;
    NetConn_TraceRouteOption option;
    NetConn_TraceRouteInfo* traceRouteInfoPtr = nullptr;
    NetConn_TraceRouteInfo traceRouteInfo;
    if (index == CASE_INDEX_1) {
        destination = nullptr;
        optionPtr = nullptr;
        traceRouteInfoPtr = nullptr;
    } else {
        destination = const_cast<char *>(dest.c_str());
        optionPtr = &option;
        traceRouteInfoPtr = &traceRouteInfo;
    }
    int32_t returnValue = OH_NetConn_QueryTraceRoute(destination, optionPtr, traceRouteInfoPtr);
    if (returnValue == OK) {
        returnValue = OK;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_FreeDnsResult(napi_env env, napi_callback_info info)
{
    std::string host = GetString(env, info, 0);
    std::string serv = GetString(env, info, 1);
    struct addrinfo *res = nullptr;
    int32_t returnValue = OH_NetConn_GetAddrInfo(const_cast<char*>(host.c_str()),
        const_cast<char*>(serv.c_str()), nullptr, &res, 0);
    if (res != nullptr) {
        returnValue = OH_NetConn_FreeDnsResult(res);
    }
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value NetConn_BindSocket(napi_env env, napi_callback_info info)
{
    int32_t socketFd = GetInt(env, info, 0);
    struct addrinfo *res = nullptr;
    NetConn_NetHandle netHandle;
    int32_t returnValue = OH_NetConn_BindSocket(socketFd, &netHandle);
    if (returnValue == PERMISSION_DENIED) {
        returnValue = PERMISSION_DENIED;
    } else if (returnValue == PARAMETER_ERROR) {
        returnValue = PARAMETER_ERROR;
    } else if (returnValue == OPERATION_FAILED) {
        returnValue = OPERATION_FAILED;
    } else if (returnValue == INTERNAL_ERROR) {
        returnValue = INTERNAL_ERROR;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static bool load_cert_blob(const char* filename, NetStack_CertBlob* certBlob)
{
    if (filename == nullptr || certBlob == nullptr) {
        return false;
    }
    try {
        std::ifstream file(filename, std::ios::binary);
        if (!file) {
            return false;
        }
        std::vector<uint8_t> buffer(
            (std::istreambuf_iterator<char>(file)),
            std::istreambuf_iterator<char>()
        );
        
        uint8_t* data = new uint8_t[buffer.size() + 1];
        std::copy(buffer.begin(), buffer.end(), data);
        data[buffer.size()] = '\0';
        
        certBlob->type = NetStack_CertType::NETSTACK_CERT_TYPE_PEM;
        certBlob->size = static_cast<uint32_t>(buffer.size());
        certBlob->data = data;
        return true;
    } catch (...) {
        return false;
    }
}

napi_value CertVerification(napi_env env, napi_callback_info info)
{
    std::string servCert = GetString(env, info, 0);
    std::string caCert = GetString(env, info, 1);
    NetStack_CertBlob servBlob;
    bool bServStatus = load_cert_blob(servCert.c_str(), &servBlob);
    NetStack_CertBlob caBlob;
    bool bCaStatus = load_cert_blob(caCert.c_str(), &caBlob);
    int32_t returnValue = -1;
    if (bServStatus && bCaStatus) {
        returnValue = OH_NetStack_CertVerification(&servBlob, &caBlob);
        if (returnValue == OK) {
            returnValue = OK;
        } else if (returnValue == CERT_REVOKED) {
            returnValue = CERT_REVOKED;
        } else if (returnValue == INVALID_CA) {
            returnValue = INVALID_CA;
        } else if (returnValue == CERT_UNTRUST) {
            returnValue = CERT_UNTRUST;
        }
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value GetCertificatesHost(napi_env env, napi_callback_info info)
{
    std::string hostname = GetString(env, info, 0);
    NetStack_Certificates certs;
    int32_t returnValue = OH_NetStack_GetCertificatesForHostName(hostname.c_str(), &certs);
    if (returnValue == OK) {
        returnValue = OK;
    } else if (returnValue == MEMORY_OVERFLOW) {
        returnValue = MEMORY_OVERFLOW;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static void RegisterNetConnProperties(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NetConn_HasDefaultNet", nullptr, NetConn_HasDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_GetDefaultNet", nullptr, NetConn_GetDefaultNet, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_IsDefaultNetMetered", nullptr, NetConn_IsDefaultNetMetered, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"NetConn_GetConnectionProperties", nullptr, NetConn_GetConnectionProperties, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"NetConn_GetNetCapabilities", nullptr, NetConn_GetNetCapabilities, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"NetConn_GetAddrInfo", nullptr, NetConn_GetAddrInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_GetAllNets", nullptr, NetConn_GetAllNets, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_SetPacUrl", nullptr, NetConn_SetPacUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_NetCapabilities_netCaps", nullptr, NetConn_NetCapabilities_netCaps, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"NetConn_GetPacUrl", nullptr, NetConn_GetPacUrl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSocket_Close_Result", nullptr, WebSocket_Close_Result, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSocket_Error_Result", nullptr, WebSocket_Error_Result, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSocket_Open_Result", nullptr, WebSocket_Open_Result, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"WebSocket_Request_Options", nullptr, WebSocket_Request_Options, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Web_Socket", nullptr, Web_Socket, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Web_Socket_ErrCode", nullptr, Web_Socket_ErrCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetStack_Certificate_PinningKind", nullptr, NetStack_Certificate_PinningKind, nullptr, nullptr,
         nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static void RegisterRemainingProperties(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"NetStack_Hash_Algorithm", nullptr, NetStack_Hash_Algorithm, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Public_KeyHash", nullptr, Public_KeyHash, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetStack_IsCleartextPermittedByHostName", nullptr, NetStack_IsCleartextPermittedByHostName, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"NetStack_IsCleartextPermitted", nullptr, NetStack_IsCleartextPermitted, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"NetConn_Net_Specifier", nullptr, NetConn_Net_Specifier, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_Net_Addr", nullptr, NetConn_Net_Addr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_RouteConn", nullptr, NetConn_RouteConn, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_Http_Proxy", nullptr, NetConn_Http_Proxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_Connection_Properties", nullptr, NetConn_Connection_Properties, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"NetConn_NetHandle_List", nullptr, NetConn_NetHandle_List, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Register_DnsResolver", nullptr, Register_DnsResolver, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Unregister_DnsResolver", nullptr, Unregister_DnsResolver, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Register_DetCallback", nullptr, Register_DetCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetCon_QueryProResult", nullptr, NetCon_QueryProResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_QueryTrRout", nullptr, NetConn_QueryTrRout, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_FreeDnsResult", nullptr, NetConn_FreeDnsResult, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"NetConn_BindSocket", nullptr, NetConn_BindSocket, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CertVerification", nullptr, CertVerification, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetCertificatesHost", nullptr, GetCertificatesHost, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
}

static napi_value Init(napi_env env, napi_value exports)
{
    RegisterNetConnProperties(env, exports);
    RegisterRemainingProperties(env, exports);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "netconnectiontest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
