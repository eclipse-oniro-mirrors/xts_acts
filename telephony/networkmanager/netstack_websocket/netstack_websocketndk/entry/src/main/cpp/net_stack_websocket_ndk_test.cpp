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
#include "hilog/log.h"
#include "napi/native_api.h"
#include <network/netstack/net_websocket.h>
#include <cstring>
#include <csignal>
#include <cstring>

#define WEBSOCKET_LOG_TAG "websocket XTS"
#define WEBSOCKET_LOG_DOMAIN 0xD0015B0


static const int CLOSE_RESULT_FROM_CLIENT_CODE = 1000;


static void OnOpen(struct WebSocket *client, WebSocket_OpenResult openResult)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OnOpen");
}

static void OnMessage(struct WebSocket *client, char *data, uint32_t length)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OnMessage ,data=：%{public}s", data);
}

static void OnError(struct WebSocket *client, WebSocket_ErrorResult error)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OnError");
}

static void OnClose(struct WebSocket *client, WebSocket_CloseResult closeResult)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OnClose");
}

static napi_value OHWebSocketClientConstruct(napi_env env, napi_callback_info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientConstruct start");
    int ret;
    struct WebSocket *client = new WebSocket();
    const char *url = "www.baidu.com";
    client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    ret = OH_WebSocketClient_Connect(client, url, client->requestOptions);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebSocketClientAddHeader(napi_env env, napi_callback_info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientAddHeader start");
    napi_value result = nullptr;
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "test case begin:TestConnet");
    struct WebSocket *client = new WebSocket();
    struct WebSocket_Header header1;
    header1.fieldName = "Content-Type";
    header1.fieldValue = "application/json";
    header1.next = nullptr;
    client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = OH_WebSocketClient_AddHeader(client, header1);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebSocketClientConnect(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientConnect start");
    struct WebSocket *client = new WebSocket();
    const char *url1 = "www.baidu.com";
    client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    int ret = OH_WebSocketClient_Connect(client, url1, client->requestOptions);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebSocketClientSend(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientSend start");
    napi_value result = nullptr;
    struct WebSocket *client = new WebSocket();
    client = OH_WebSocketClient_Constructor(OnOpen, OnMessage, OnError, OnClose);
    const char *data = "Hello, world!";
    int sendLength = std::strlen(data);
    int ret = OH_WebSocketClient_Send(client, const_cast<char *>(data), sendLength);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebSocketClientClose(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientClose start");
    napi_value result = nullptr;
    struct WebSocket *client = new WebSocket();
    struct WebSocket_CloseOption CloseOption;
    CloseOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
    CloseOption.reason = " ";
    int ret = OH_WebSocketClient_Close(client, CloseOption);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebSocketClientDestroy(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_DEBUG, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG, "OHWebSocketClientDestroy start");
    napi_value result = nullptr;
    struct WebSocket *client = new WebSocket();
    struct WebSocket_CloseOption CloseOption;
    CloseOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
    CloseOption.reason = " ";
    int ret = OH_WebSocketClient_Destroy(client);
    napi_create_int32(env, ret, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
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
    .nm_modname = "testNetStackWebsocketNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
