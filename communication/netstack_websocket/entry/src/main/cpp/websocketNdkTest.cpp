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
#include "net_websocket.h"
#include <cstring>
#include <csignal>
#include <cstring>

#define WEBSOCKET_LOG_TAG "websocket XTS"
#define WEBSOCKET_LOG_DOMAIN 0xD0015B0

static const int CLOSE_RESULT_FROM_CLIENT_CODE = 1000;

static constexpr OHOS::HiviewDFX::HiLogLabel LABEL = {LOG_CORE, WEBSOCKET_LOG_DOMAIN, WEBSOCKET_LOG_TAG};

static void OnOpen(struct WebSocket *client, WebSocket_OpenResult openResult)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OnOpen");
}

static void OnMessage(struct WebSocket *client, char *data, uint32_t length)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OnMessage ,data=：%{public}s", data);
}

static void OnError(struct WebSocket *client, WebSocket_ErrorResult error)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OnError");
}

static void OnClose(struct WebSocket *client, WebSocket_CloseResult closeResult)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OnClose");
}

static napi_value OHWebsocketClientConstruct(napi_env env, napi_callback_info)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebsocketClientConstruct start");
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
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebSocketClientAddHeader start");
    napi_value result = nullptr;
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "test case begin:TestConnet");
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
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebSocketClientConnect start");
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
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebSocketClientSend start");
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
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebSocketClientClose start");
    napi_value result = nullptr;
    struct WebSocket *client = new WebSocket();
    struct WebSocket_CloseOption CloseOption;
    CloseOption.code = CLOSE_RESULT_FROM_CLIENT_CODE;
    CloseOption.reason = " ";
    int ret = OH_WebSocketClient_Close(client, CloseOption);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHWebsocketClientDestroy(napi_env env, napi_callback_info info)
{
    OHOS::HiviewDFX::HiLog::Debug(LABEL, "OHWebsocketClientDestroy start");
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
        {"oHWebsocketClientConstruct", nullptr, OHWebsocketClientConstruct, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHWebSocketClientAddHeader", nullptr, OHWebSocketClientAddHeader, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHWebSocketClientConnect", nullptr, OHWebSocketClientConnect, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHWebSocketClientSend", nullptr, OHWebSocketClientSend, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHWebSocketClientClose", nullptr, OHWebSocketClientClose, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHWebsocketClientDestroy", nullptr, OHWebsocketClientDestroy, nullptr, nullptr, nullptr, napi_default,
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
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}