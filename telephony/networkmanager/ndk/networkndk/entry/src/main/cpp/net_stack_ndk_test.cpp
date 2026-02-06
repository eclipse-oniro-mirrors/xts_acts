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
#include <bits/alltypes.h>
#include <fcntl.h>
#include <hilog/log.h>
#include <network/netstack/net_websocket.h>
#include <network/netstack/net_ssl/net_ssl_c.h>
#include <string>
#include <cstring>
#include <thread>
#include <iostream>
#include <fstream>

#define WEBSOCKET_ADDRESS "wss://ws.ifelse.io/"
#define WEBSOCKET_LOG_TAG "LogTagNetwork"
#define WEBSOCKET_LOG_DOMAIN 0x0000
#define MAX_DATA_LENGTH (4 * 1024 * 1024)
#define PARAM_INDEX_2 2
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11
#define SLEEP_TIME_3 3
#define DEFAULT_HOST_LEN 20

static const int CLOSE_RESULT_FROM_CLIENT_CODE = 1000;

static void OnOpen(struct WebSocket *client, WebSocket_OpenResult openResult)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnOpen");
}

static void OnMessage(struct WebSocket *client, char *data, uint32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnMessage");
}

static void OnError(struct WebSocket *client, WebSocket_ErrorResult error)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnError");
}

static void OnClose(struct WebSocket *client, WebSocket_CloseResult closeResult)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "WebSocket is OnClose");
}

// 根据路径和类型获取证书
void GetCertData(NetStack_CertBlob &cert, char *certPath, NetStack_CertType certType)
{
    cert.type = certType;
    std::ifstream file(certPath);
    if (!file.is_open()) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "GetCertData file is open fail");
        return;
    } else {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "GetCertData file is open success");
    }
    file.seekg(0, std::ios::end);
    int length = file.tellg();
    file.seekg(0, std::ios::beg);
    if (length <= 0) {
        OH_LOG_ERROR(LOG_APP, "GetCertData get length fail at line：%{public}d", __LINE__);
    }
    cert.size = length;
    char *buffer = new char[length];
    file.read(buffer, length);
    cert.data = new uint8_t[length];
    file.close();
    for (int i = 0; i < length; i++) {
        cert.data[i] = static_cast<uint8_t>(buffer[i]);
    }
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "cert size is： %{public}d", cert.size);
    delete[] buffer;
    buffer = nullptr;
}

static uint32_t TestCaseCertVerification(uint32_t index, char *pemCertPath, char *derCertPath)
{
    NetStack_CertBlob cert;
    NetStack_CertBlob caCert;
    uint32_t ret = -1;
    if (index == CASE_INDEX_1) {
        GetCertData(cert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        GetCertData(caCert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_2) {
        GetCertData(cert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_3) {
        GetCertData(caCert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(nullptr, &caCert);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetStack_CertVerification(nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        GetCertData(cert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_INVALID);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_6) {
        GetCertData(cert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        GetCertData(caCert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_7) {
        GetCertData(cert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    } else if (index == CASE_INDEX_8) {
        GetCertData(caCert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(nullptr, &caCert);
    } else if (index == CASE_INDEX_9) {
        GetCertData(cert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        GetCertData(caCert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_10) {
        GetCertData(cert, derCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        GetCertData(caCert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_PEM);
        ret = OH_NetStack_CertVerification(&cert, &caCert);
    } else if (index == CASE_INDEX_11) {
        GetCertData(cert, pemCertPath, NetStack_CertType::NETSTACK_CERT_TYPE_DER);
        ret = OH_NetStack_CertVerification(&cert, nullptr);
    }
    return ret;
}

// 校验证书
static napi_value OHNetStackCertVerification(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    char *pemCertPath = nullptr;
    size_t pemBufSize = 0;
    napi_get_value_string_utf8(env, args[1], pemCertPath, 0, &pemBufSize);
    if (pemBufSize > 0) {
        pemCertPath = new char[pemBufSize + 1]; // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[1], pemCertPath, pemBufSize + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_CertVerification: %{public}s", pemCertPath);
    }
    char *derCertPath = nullptr;
    size_t demBufSize  = 0;
    napi_get_value_string_utf8(env, args[PARAM_INDEX_2], derCertPath, 0, &demBufSize);
    if (demBufSize  > 0) {
        derCertPath = new char[demBufSize  + 1]; // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[PARAM_INDEX_2], derCertPath, demBufSize  + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_CertVerification: %{public}s", derCertPath);
    }
    uint32_t ret = -1;
    ret = TestCaseCertVerification(index, pemCertPath, derCertPath);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 构造
static napi_value OHWebSocketClientConstruct(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    WebSocket *client = nullptr;
    if (index == CASE_INDEX_1) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    } else if (index == CASE_INDEX_2) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, nullptr);
    } else if (index == CASE_INDEX_3) {
        client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, nullptr, nullptr);
    } else if (index == CASE_INDEX_4) {
        client = OH_WebSocketClient_Constructor(OnOpen, nullptr, nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        client = OH_WebSocketClient_Constructor(nullptr, nullptr, nullptr, nullptr);
    }
    int ret = 0;
    if (client == nullptr) {
        ret = 1;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 添加请求头
static napi_value OHWebSocketClientAddHeader(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        WebSocket_Header header;
        header.fieldName = "Content-Type";
        header.fieldValue = "application/json";
        header.next = nullptr;
        ret = OH_WebSocketClient_AddHeader(client, header);
    } else if (index == CASE_INDEX_2) {
        WebSocket_Header header;
        ret = OH_WebSocketClient_AddHeader(client, header);
    } else if (index == CASE_INDEX_3) {
        WebSocket_Header header;
        ret = OH_WebSocketClient_AddHeader(nullptr, header);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 开始链接
static napi_value OHWebSocketClientConnect(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    WebSocket_Header header;
    header.fieldName = "Content-Type";
    header.fieldValue = "application/json";
    header.next = nullptr;
    int ret = OH_WebSocketClient_AddHeader(client, header);
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    } else if (index == CASE_INDEX_2) {
        const char *url = "192.168.123.255";
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    } else if (index == CASE_INDEX_3) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(nullptr, url, client->requestOptions);
    } else if (index == CASE_INDEX_4) {
        const char *url = "";
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 发送消息
static napi_value OHWebSocketClientSend(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    napi_value result = nullptr;
    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    WebSocket_Header header;
    header.fieldName = "Content-Type";
    header.fieldValue = "application/json";
    header.next = nullptr;
    int ret = OH_WebSocketClient_AddHeader(client, header);
    const char *url = WEBSOCKET_ADDRESS;
    ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    const char *data = "hello world!";
    if (index == CASE_INDEX_1) {
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), std::strlen(data));
    } else if (index == CASE_INDEX_2) {
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), 0);
    } else if (index == CASE_INDEX_3) {
        ret = OH_WebSocketClient_Send(client, nullptr, 0);
    } else if (index == CASE_INDEX_4) {
        std::string data;
        data.resize(MAX_DATA_LENGTH + 1, 'a');
        int sendLength = data.size();
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data.c_str()), sendLength);
    }
    napi_create_int32(env, ret, &result);
    return result;
}

// 关闭链接
static napi_value OHWebSocketClientClose(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        std::this_thread::sleep_for(std::chrono::seconds(SLEEP_TIME_3));
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_2) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        const char *data = "hello world!";
        ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), std::strlen(data));
        std::this_thread::sleep_for(std::chrono::seconds(SLEEP_TIME_3));
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_3) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_4) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = -1;
        closeOption.reason = "";
        ret = OH_WebSocketClient_Close(client, closeOption);
    } else if (index == CASE_INDEX_5) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "test close";
        ret = OH_WebSocketClient_Close(nullptr, closeOption);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

// 销毁client
static napi_value OHWebSocketClientDestroy(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    WebSocket *client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = -1;
    if (index == CASE_INDEX_1) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_2) {
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_3) {
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        ret = OH_WebSocketClient_Destroy(client);
    } else if (index == CASE_INDEX_4) {
        const char *url = WEBSOCKET_ADDRESS;
        ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
        struct WebSocket_CloseOption closeOption;
        closeOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
        closeOption.reason = "close";
        ret = OH_WebSocketClient_Close(client, closeOption);
        ret = OH_WebSocketClient_Destroy(client);
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int32_t TestCaseGetPinSetForHostName(uint32_t index, const char *hostname)
{
    NetStack_CertificatePinning certPin;
    
    int32_t ret = -1;
    if (index == CASE_INDEX_1) {
        ret = OH_NetStack_GetPinSetForHostName(hostname, &certPin);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetStack_GetPinSetForHostName(nullptr, &certPin);
    } else if (index == CASE_INDEX_3) {
        ret = OH_NetStack_GetPinSetForHostName(hostname, nullptr);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetStack_GetPinSetForHostName(nullptr, nullptr);
    }
    
    if (ret == 0) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
            "certPin: %{public}s, %{public}d, %{public}d", certPin.publicKeyHash, certPin.kind, certPin.hashAlgorithm);

        if (certPin.publicKeyHash != nullptr) {
            free(certPin.publicKeyHash);
        }
    }

    return ret;
}

static napi_value OHNetStackGetPinSetForHostName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    char *hostname = nullptr;
    size_t hostnameSize = 0;
    napi_get_value_string_utf8(env, args[1], hostname, 0, &hostnameSize);
    if (hostnameSize > 0) {
        hostname = reinterpret_cast<char *>(malloc(hostnameSize + 1)); // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[1], hostname, hostnameSize + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OHNetStackGetPinSetForHostName: %{public}s", hostname);
    }

    int32_t ret = -1;
    ret = TestCaseGetPinSetForHostName(index, hostname);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static int32_t TestCaseGetCertificatesForHostName(uint32_t index, const char *hostname)
{
    NetStack_Certificates certs;
    
    int32_t ret = -1;
    if (index == CASE_INDEX_1) {
        ret = OH_NetStack_GetCertificatesForHostName(hostname, &certs);
    } else if (index == CASE_INDEX_2) {
        ret = OH_NetStack_GetCertificatesForHostName(nullptr, &certs);
    } else if (index == CASE_INDEX_3) {
        ret = OH_NetStack_GetCertificatesForHostName(hostname, nullptr);
    } else if (index == CASE_INDEX_4) {
        ret = OH_NetStack_GetCertificatesForHostName(nullptr, nullptr);
    }
    
    if (ret == 0) {
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
            "length: %{public}zu", certs.length);
        for (size_t i = 0; i < certs.length; ++i) {
            OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                "certPin: %{public}s",
                certs.content[i]);
        }
        
        OH_Netstack_DestroyCertificatesContent(&certs);
    }
    return ret;
}

static napi_value OHNetStackGetCertificatesForHostName(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    char *hostname = nullptr;
    size_t hostnameSize = 0;
    napi_get_value_string_utf8(env, args[1], hostname, 0, &hostnameSize);
    if (hostnameSize > 0) {
        hostname = reinterpret_cast<char *>(malloc(hostnameSize + 1)); // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[1], hostname, hostnameSize + 1, nullptr);
        OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OHNetStackGetCertificatesForHostName: %{public}s, %{public}d", hostname, index);
    }

    int32_t ret = -1;
    ret = TestCaseGetCertificatesForHostName(index, hostname);
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHNetStackGetPinSetForHostName2(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    char *hostname = nullptr;
    size_t hostnameSize = 0;
    status = napi_get_value_string_utf8(env, args[0], hostname, 0, &hostnameSize);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "Failed to get UTF-8 string");
        return nullptr;
    }
    if (hostnameSize > 0) {
        hostname = reinterpret_cast<char *>(malloc(hostnameSize + 1)); // 加一用于存储字符串结束符
        status = napi_get_value_string_utf8(env, args[0], hostname, hostnameSize + 1, nullptr);
        if (status != napi_ok) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                         "Failed to get UTF-8 string");
            return nullptr;
        }
    }

    NetStack_CertificatePinning pin;
    int32_t ret = OH_NetStack_GetPinSetForHostName(hostname, &pin);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_GetPinSetForHostName error, %{public}d", ret);
        return nullptr;
    }
    
    const char *pinContent = pin.publicKeyHash;
    if (pin.publicKeyHash == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "get empty pin");
        return nullptr;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                 "pin.kind = %{public}d, pin.hashAlgorithm = %{public}d", pin.kind, pin.hashAlgorithm);
    size_t length = strlen(pinContent);
    napi_value result = nullptr;
    napi_create_string_utf8(env, pinContent, length, &result);
    free(pin.publicKeyHash);
    
    return result;
}

static napi_value OHNetStackGetCertificatesForHostName2(napi_env env, napi_callback_info info)
{
    napi_status status;
    size_t argc = 1;
    napi_value args[1] = {};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char *hostname = nullptr;
    size_t hostnameSize = 0;
    napi_get_value_string_utf8(env, args[0], hostname, 0, &hostnameSize);
    if (hostnameSize > 0) {
        hostname = reinterpret_cast<char *>(malloc(hostnameSize + 1)); // 加一用于存储字符串结束符
        napi_get_value_string_utf8(env, args[0], hostname, hostnameSize + 1, nullptr);
    }

    NetStack_Certificates certs;
    int32_t ret = OH_NetStack_GetCertificatesForHostName(hostname, &certs);
    if (ret != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "OH_NetStack_GetCertificatesForHostName error, %{public}d", ret);
        return nullptr;
    }
    if (certs.length == 0) {
        OH_LOG_Print(LOG_APP, LOG_INFO, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "certs.length == 0");
        return nullptr;
    }
    
    napi_value jsArray = nullptr;
    status = napi_create_array_with_length(env, certs.length, &jsArray);
    if (status != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                     "Failed to create array");
        return nullptr;
    }
    const char *content = nullptr;
    napi_value result = nullptr;
    for (uint32_t i = 0; i < certs.length; ++i) {
            content = certs.content[i];
            napi_create_string_utf8(env, content, strlen(content), &result);
            napi_set_element(env, jsArray, i, result);
    }
    
    OH_Netstack_DestroyCertificatesContent(&certs);
    
    return jsArray;
}

static napi_value OHNetStackDestroyCertificatesContent(napi_env env, napi_callback_info info)
{
    const char *hostname = nullptr;
    
    hostname = "getonecert.com";
    NetStack_Certificates certs;
    OH_NetStack_GetCertificatesForHostName(hostname, &certs);
    OH_LOG_Print(LOG_APP, LOG_INFO, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                 "before destroy: content = %{public}p, length = %{public}zu", certs.content, certs.length);
    OH_Netstack_DestroyCertificatesContent(&certs);
    OH_LOG_Print(LOG_APP, LOG_INFO, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                 "after destroy: content = %{public}p, length = %{public}zu", certs.content, certs.length);

    hostname = "notexit.com";
    OH_NetStack_GetCertificatesForHostName(hostname, &certs);
    OH_LOG_Print(LOG_APP, LOG_INFO, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                 "before destroy: content = %{public}p, length = %{public}zu", certs.content, certs.length);
    OH_Netstack_DestroyCertificatesContent(&certs);
    OH_Netstack_DestroyCertificatesContent(&certs);
    OH_Netstack_DestroyCertificatesContent(&certs);
    OH_LOG_Print(LOG_APP, LOG_INFO, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG,
                 "after destroy: content = %{public}p, length = %{public}zu", certs.content, certs.length);
    return nullptr;
}

static napi_value OHNetStackIsCleartextPermitted(napi_env env, napi_callback_info info)
{
    bool isCleartextPermitted;
    int res = OH_Netstack_IsCleartextPermitted(&isCleartextPermitted);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

static napi_value OHNetStackIsCleartextPermittedByHostName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    char hostname[1024] = {0};
    size_t sizeT1;
    napi_get_value_string_utf8(env, args[0], hostname, DEFAULT_HOST_LEN, &sizeT1);
    bool isCleartextPermitted;
    int res = OH_Netstack_IsCleartextPermittedByHostName(hostname, &isCleartextPermitted);
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OHNetStackCertVerification", nullptr, OHNetStackCertVerification, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHWebSocketClientConstruct", nullptr, OHWebSocketClientConstruct, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHWebSocketClientAddHeader", nullptr, OHWebSocketClientAddHeader, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHWebSocketClientConnect", nullptr, OHWebSocketClientConnect, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHWebSocketClientSend", nullptr, OHWebSocketClientSend, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientClose", nullptr, OHWebSocketClientClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OHWebSocketClientDestroy", nullptr, OHWebSocketClientDestroy, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"OHNetStackGetPinSetForHostName", nullptr, OHNetStackGetPinSetForHostName, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"OHNetStackGetCertificatesForHostName", nullptr, OHNetStackGetCertificatesForHostName, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHNetStackGetPinSetForHostName2", nullptr, OHNetStackGetPinSetForHostName2, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHNetStackGetCertificatesForHostName2", nullptr, OHNetStackGetCertificatesForHostName2, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHNetStackDestroyCertificatesContent", nullptr, OHNetStackDestroyCertificatesContent, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHNetStackIsCleartextPermitted", nullptr, OHNetStackIsCleartextPermitted, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"OHNetStackIsCleartextPermittedByHostName", nullptr, OHNetStackIsCleartextPermittedByHostName,
         nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "testNetStackNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}

