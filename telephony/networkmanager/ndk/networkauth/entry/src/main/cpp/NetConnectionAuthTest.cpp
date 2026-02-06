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
#include <thread>
#include <chrono>
#include "native_common.h"
#include <network/netmanager/net_connection.h>
#include <network/netmanager/net_connection_type.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
#include <network/netstack/net_http.h>
#include <network/netstack/net_http_type.h>
#include <network/netstack/net_websocket_type.h>
#include <network/netstack/net_websocket.h>

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <cstring>
#include <string>
#include <thread>
using namespace std;

static const uint32_t MAX_BUFFER_SIZE = 128;
static const uint32_t MAX_ARG_COUNT = 8;
static const uint32_t CASE_INDEX_1 = 1;
static const uint32_t CASE_INDEX_2 = 2;
static const uint32_t CASE_INDEX_3 = 3;
static const uint32_t CASE_INDEX_4 = 4;
static const uint32_t CASE_INDEX_5 = 5;
static const uint32_t CASE_INDEX_6 = 6;
static const uint32_t CASE_INDEX_7 = 7;
static const uint32_t CASE_INDEX_8 = 8;
static const uint32_t CLOSE_STATUS_NORMAL = 1000;
static int32_t g_sleepSecs = 1;
static int32_t g_maxHeaderLen = 8192;
static int32_t g_maxDataLength = (4 * 1024 * 1024);

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

static uint32_t ReadResponseOne(uint32_t responseCode)
{
    switch (responseCode) {
        case OH_HTTP_OK:
            break;
        case OH_HTTP_CREATED:
            break;
        case OH_HTTP_ACCEPTED:
            break;
        case OH_HTTP_NON_AUTHORITATIVE_INFO:
            break;
        case OH_HTTP_NO_CONTENT:
            break;
        case OH_HTTP_RESET:
            break;
        case OH_HTTP_PARTIAL:
            break;
        case OH_HTTP_MULTI_CHOICE:
            break;
        case OH_HTTP_MOVED_PERM:
            break;
        case OH_HTTP_MOVED_TEMP:
            break;
        case OH_HTTP_SEE_OTHER:
            break;
        case OH_HTTP_NOT_MODIFIED:
            break;
        case OH_HTTP_USE_PROXY:
            break;
        default:
            return 0;
    }
    return responseCode;
}

static uint32_t ReadResponseTwo(uint32_t responseCode)
{
    switch (responseCode) {
        case OH_HTTP_BAD_REQUEST:
            break;
        case OH_HTTP_UNAUTHORIZED:
            break;
        case OH_HTTP_PAYMENT_REQUIRED:
            break;
        case OH_HTTP_FORBIDDEN:
            break;
        case OH_HTTP_NOT_FOUND:
            break;
        case OH_HTTP_BAD_METHOD:
            break;
        case OH_HTTP_NOT_ACCEPTABLE:
            break;
        case OH_HTTP_PROXY_AUTH:
            break;
        case OH_HTTP_CLIENT_TIMEOUT:
            break;
        case OH_HTTP_CONFLICT:
            break;
        case OH_HTTP_GONE:
            break;
        case OH_HTTP_LENGTH_REQUIRED:
            break;
        default:
            return 0;
    }
    return responseCode;
}

static uint32_t ReadResponseThree(uint32_t responseCode)
{
    switch (responseCode) {
        case OH_HTTP_PRECON_FAILED:
            break;
        case OH_HTTP_ENTITY_TOO_LARGE:
            break;
        case OH_HTTP_REQUEST_TOO_LONG:
            break;
        case OH_HTTP_UNSUPPORTED_TYPE:
            break;
        case OH_HTTP_RANGE_NOT_MET:
            break;
        case OH_HTTP_INTERNAL_ERROR:
            break;
        case OH_HTTP_NOT_IMPLEMENTED:
            break;
        case OH_HTTP_BAD_GATEWAY:
            break;
        case OH_HTTP_UNAVAILABLE:
            break;
        case OH_HTTP_GATEWAY_TIMEOUT:
            break;
        case OH_HTTP_VERSION:
            break;
        default:
            return 0;
    }
    return responseCode;
}

static uint32_t ReadHttpReqCodeOne(uint32_t errorCode)
{
    switch (errorCode) {
        case OH_HTTP_RESULT_OK:
            break;
        case OH_HTTP_PARAMETER_ERROR:
            break;
        case OH_HTTP_PERMISSION_DENIED:
            break;
        case OH_HTTP_NETSTACK_E_BASE:
            break;
        case OH_HTTP_UNSUPPORTED_PROTOCOL:
            break;
        case OH_HTTP_INVALID_URL:
            break;
        case OH_HTTP_RESOLVE_PROXY_FAILED:
            break;
        case OH_HTTP_RESOLVE_HOST_FAILED:
            break;
        case OH_HTTP_CONNECT_SERVER_FAILED:
            break;
        case OH_HTTP_INVALID_SERVER_RESPONSE:
            break;
        case OH_HTTP_ACCESS_REMOTE_DENIED:
            break;
        case OH_HTTP_HTTP2_FRAMING_ERROR:
            break;
        default:
            return 0;
    }
    return errorCode;
}

static uint32_t ReadHttpReqCodeTwo(uint32_t errorCode)
{
    switch (errorCode) {
        case OH_HTTP_TRANSFER_PARTIAL_FILE:
            break;
        case OH_HTTP_WRITE_DATA_FAILED:
            break;
        case OH_HTTP_UPLOAD_FAILED:
            break;
        case OH_HTTP_OPEN_LOCAL_DATA_FAILED:
            break;
        case OH_HTTP_OUT_OF_MEMORY:
            break;
        case OH_HTTP_OPERATION_TIMEOUT:
            break;
        case OH_HTTP_TOO_MANY_REDIRECTIONS:
            break;
        case OH_HTTP_SERVER_RETURNED_NOTHING:
            break;
        case OH_HTTP_SEND_DATA_FAILED:
            break;
        case OH_HTTP_RECEIVE_DATA_FAILED:
            break;
        default:
            return 0;
    }
    return errorCode;
}

static uint32_t ReadHttpReqCodeThree(uint32_t errorCode)
{
    switch (errorCode) {
        case OH_HTTP_SSL_CERTIFICATE_ERROR:
            break;
        case OH_HTTP_SSL_CIPHER_USED_ERROR:
            break;
        case OH_HTTP_INVALID_SSL_PEER_CERT:
            break;
        case OH_HTTP_INVALID_ENCODING_FORMAT:
            break;
        case OH_HTTP_FILE_TOO_LARGE:
            break;
        case OH_HTTP_REMOTE_DISK_FULL:
            break;
        case OH_HTTP_REMOTE_FILE_EXISTS:
            break;
        case OH_HTTP_SSL_CA_NOT_EXIST:
            break;
        case OH_HTTP_REMOTE_FILE_NOT_FOUND:
            break;
        case OH_HTTP_AUTHENTICATION_ERROR:
            break;
        case OH_HTTP_ACCESS_DOMAIN_NOT_ALLOWED:
            break;
        case OH_HTTP_UNKNOWN_ERROR:
            break;
        default:
            return 0;
    }
    return errorCode;
}

static uint32_t ReadHttpReqCode(uint32_t errorCode)
{
    uint32_t ret = ReadHttpReqCodeOne(errorCode);
    if (ret != 0) {
        return ret;
    }
    
    ret = ReadHttpReqCodeTwo(errorCode);
    if (ret != 0) {
        return ret;
    }
    
    return ReadHttpReqCodeThree(errorCode);
}

static uint32_t ReadResponseCode(uint32_t responseCode)
{
    uint32_t ret = ReadResponseOne(responseCode);
    if (ret != 0) {
        return ret;
    }
    ret = ReadResponseTwo(responseCode);
    if (ret != 0) {
        return ret;
    }
    return ReadResponseThree(responseCode);
}

static void ResponseCallback(struct Http_Response *response, uint32_t errCode)
{
    if (response == nullptr) {
        return;
    }
    if (ReadHttpReqCode(errCode) != 0) {
        return;
    }
    if (ReadResponseCode(response->responseCode) != 0) {
        return;
    }
}

napi_value Http_RequestRequest(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    int32_t returnValue = 0;
    Http_EventsHandler handler;
    if (index == CASE_INDEX_1 || index == CASE_INDEX_2) {
        returnValue = OH_Http_Request(request, ResponseCallback, handler);
    } else if (index == CASE_INDEX_3) {
        returnValue = OH_Http_Request(request, ResponseCallback, handler);
        std::this_thread::sleep_for(std::chrono::seconds(g_sleepSecs));
    } else if (index == CASE_INDEX_4) {
        returnValue = OH_Http_Request(request, ResponseCallback, handler);
        std::this_thread::sleep_for(std::chrono::seconds(g_sleepSecs));
    } else if (index == CASE_INDEX_5) {
        Http_RequestOptions reqOptions;
        request->options = &reqOptions;
        reqOptions.method = NET_HTTP_METHOD_POST;
        returnValue = OH_Http_Request(request, ResponseCallback, handler);
        std::this_thread::sleep_for(std::chrono::seconds(g_sleepSecs));
    } else {
        returnValue = ReadResponseCode(index);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

void HttpOnUploadProgress(uint64_t totalSize, uint64_t transferredSize)
{
    return;
}

void HttpOnDownloadProgress(uint64_t totalSize, uint64_t transferredSize)
{
    return;
}

void HttpOnEndCall()
{
    return;
}

void HttpOnCancel()
{
    return;
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

static napi_value Web_Socket(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    struct WebSocket *websocket = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    if (index == CASE_INDEX_1) {
        WebSocket_CloseOption CloseOptions;
        CloseOptions.code = CLOSE_STATUS_NORMAL;
        CloseOptions.reason = "";
        returnValue = OH_WebSocketClient_Close(websocket, CloseOptions);
    } else if (index == CASE_INDEX_2) {
        returnValue = OH_WebSocketClient_Destroy(websocket);
    } else if (index == CASE_INDEX_3) {
        struct WebSocket_RequestOptions options;
        WebSocket_Header header;
        header.fieldName = strdup("0");
        header.fieldValue = strdup("0");
        options.headers = &header;
        WebSocket_Header* tail = &header;
        for (int32_t i = 0; i <= g_maxHeaderLen; i++) {
            WebSocket_Header* tmpHeader = new WebSocket_Header();
            tmpHeader->fieldName = strdup(std::to_string(i+1).c_str());
            tmpHeader->fieldValue = strdup(std::to_string(i+1).c_str());
            tail->next = tmpHeader;
            tail = tmpHeader;
        }
        tail->next = nullptr;
        returnValue = OH_WebSocketClient_Connect(websocket, url.c_str(), options);
    } else if (index == CASE_INDEX_4) {
        returnValue = OH_WebSocketClient_Connect(websocket, url.c_str(), websocket->requestOptions);
    } else if (index == CASE_INDEX_5) {
        WebSocket_Header header;
        header.fieldName = "Content-Type";
        header.fieldValue = "application/json";
        header.next = nullptr;
        OH_WebSocketClient_AddHeader(websocket, header);
        OH_WebSocketClient_Connect(websocket, url.c_str(), websocket->requestOptions);
        std::string data;
        data.resize(g_maxDataLength + 1, 'a');
        int sendLength = data.size();
        returnValue = OH_WebSocketClient_Send(websocket, const_cast<char *>(data.c_str()), sendLength);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Http_RequestRequest", nullptr, Http_RequestRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Web_Socket", nullptr, Web_Socket, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "netconnectionauthtest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
