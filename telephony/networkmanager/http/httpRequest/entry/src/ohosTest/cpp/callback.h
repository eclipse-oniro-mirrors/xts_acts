/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#ifndef CALLBACK_H
#define CALLBACK_H
#include "napi/native_api.h"
#include "network/netstack/http_interceptor.h"
#include <map>
#include <string>

// 回调数据结构体
typedef struct CallbackData {
    std::string callbackName;
    std::string jsonData;
    std::string interceptorName;
    bool isRequest;
} CallbackData;

// 线程安全回调结构体
typedef struct ThreadSafeCallback {
    napi_env env { nullptr };
    napi_value jsCallback { nullptr };
    napi_threadsafe_function tsfn { nullptr };
} ThreadSafeCallback;

typedef struct Callback {
    napi_env env { nullptr };
    napi_value jsCallback { nullptr };
} Callback;

void RegisterCallback(std::string callbackName, Callback callback);
void UnregisterCallback(std::string callbackName);
Callback GetCallback(std::string callbackName);
void CallJsFunction(std::string &callbackName);

// 线程安全回调相关函数
void RegisterThreadSafeCallback(std::string callbackName, napi_env env, napi_value jsCallback);
void UnregisterThreadSafeCallback(std::string callbackName);
ThreadSafeCallback GetThreadSafeCallback(std::string callbackName);

// 定义返回结构
typedef struct InterceptorCallbackResult {
    std::string requestJson;
    std::string responseJson;
    std::string interceptorName;
} InterceptorCallbackResult;

// 初始化主线程 EventRunner 和 EventHandler
void InitMainThreadRunner();

// 在主线程中调用 JS 回调函数
void CallJsCallbackOnMainThread(const CallbackData &data);

InterceptorCallbackResult CallJsFunctionWithRequest(
    std::string &callbackName, OH_Http_Interceptor_Request *request, const char *interceptorName);
InterceptorCallbackResult CallJsFunctionWithResponse(
    std::string &callbackName, OH_Http_Interceptor_Response *response, const char *interceptorName);
#endif // CALLBACK_H