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

#include "callback.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <iostream>
#include <map>
#include <mutex>
#include <queue>
#include <sstream>

static const int GLOBAL_NETSTACK = 0xFF00;
static const char *TAG = "[netstack]";

static std::mutex g_queueMutex;
static std::mutex g_callbackMapMutex;
static std::queue<CallbackData> g_callbackQueue;
static std::map<std::string, ThreadSafeCallback> g_threadSafeCallbackMap = { };

static void ExecuteCallback(napi_env env, napi_value jsCallback, void *context, void *data)
{
    if (!data) {
        return;
    }
    CallbackData *callbackData = static_cast<CallbackData *>(data);
    napi_value jsJsonData;
    napi_create_string_utf8(env, callbackData->jsonData.c_str(), NAPI_AUTO_LENGTH, &jsJsonData);
    napi_value jsInterceptorName;
    napi_create_string_utf8(env, callbackData->interceptorName.c_str(), NAPI_AUTO_LENGTH, &jsInterceptorName);
    const int argc = 2;
    napi_value args[argc] = { jsJsonData, jsInterceptorName };
    napi_value jsResult;
    napi_call_function(env, nullptr, jsCallback, argc, args, &jsResult);
    delete callbackData;
}

static void CleanupCallback(napi_env env, void *data, void *hint) { }

void RegisterThreadSafeCallback(std::string callbackName, napi_env env, napi_value jsCallback)
{
    if (callbackName.empty() || !env || !jsCallback) {
        return;
    }
    napi_threadsafe_function tsfn = nullptr;
    napi_value async_resource_name = nullptr;
    napi_status status = napi_create_string_utf8(env, "InterceptorCallback", NAPI_AUTO_LENGTH, &async_resource_name);
    if (status != napi_ok) {
        printf("napi_create_string_utf8 failed: %d\n", status);
        return;
    }
    status = napi_create_threadsafe_function(
        env, jsCallback, nullptr, async_resource_name, 0, 1, nullptr, CleanupCallback, nullptr, ExecuteCallback, &tsfn);
    if (status != napi_ok) {
        printf("napi_create_threadsafe_function failed: %d\n", status);
        return;
    }
    if (tsfn) {
        g_threadSafeCallbackMap[callbackName] = { env, jsCallback, tsfn };
    }
}

void UnregisterThreadSafeCallback(std::string callbackName)
{
    if (callbackName.empty()) {
        return;
    }
    auto result = g_threadSafeCallbackMap.find(callbackName);
    if (result != g_threadSafeCallbackMap.end()) {
        if (result->second.tsfn) {
            napi_release_threadsafe_function(result->second.tsfn, napi_tsfn_release);
        }
        g_threadSafeCallbackMap.erase(callbackName);
    }
}

ThreadSafeCallback GetThreadSafeCallback(std::string callbackName)
{
    if (callbackName.empty()) {
        return { nullptr, nullptr, nullptr };
    }
    auto result = g_threadSafeCallbackMap.find(callbackName);
    if (result != g_threadSafeCallbackMap.end()) {
        return result->second;
    }
    return { nullptr, nullptr, nullptr };
}

void InitMainThreadRunner()
{
    printf("InitMainThreadRunner called\n");
}

void CallJsCallbackOnMainThread(const CallbackData &data)
{
    ThreadSafeCallback callback = GetThreadSafeCallback(data.callbackName);
    if (callback.tsfn) {
        CallbackData *callbackData = new CallbackData(data);
        napi_status status = napi_call_threadsafe_function(callback.tsfn, callbackData, napi_tsfn_blocking);
        if (status != napi_ok) {
            printf("napi_call_threadsafe_function failed: %d\n", status);
            delete callbackData;
        }
    } else {
        printf("Thread-safe callback not initialized, cannot call JS callback\n");
    }
}

static void BuildHeadersJson(std::stringstream &jsonStream, OH_Http_Interceptor_Headers *headers)
{
    bool firstHeader = true;
    OH_Http_Interceptor_Headers *header = headers;
    while (header != nullptr) {
        if (header->data) {
            if (!firstHeader) {
                jsonStream << ",";
            }
            jsonStream << "{\"data\":\"" << header->data << "\"}";
            firstHeader = false;
        }
        header = header->next;
    }
}

static void BuildPerformanceTimingJson(std::stringstream &jsonStream, const Http_PerformanceTiming &timing)
{
    jsonStream << "\"dnsTiming\":" << timing.dnsTiming << ",";
    jsonStream << "\"tcpTiming\":" << timing.tcpTiming << ",";
    jsonStream << "\"tlsTiming\":" << timing.tlsTiming << ",";
    jsonStream << "\"firstSendTiming\":" << timing.firstSendTiming << ",";
    jsonStream << "\"firstReceiveTiming\":" << timing.firstReceiveTiming << ",";
    jsonStream << "\"totalFinishTiming\":" << timing.totalFinishTiming << ",";
    jsonStream << "\"redirectTiming\":" << timing.redirectTiming;
}

static std::string BuildRequestJson(OH_Http_Interceptor_Request *request)
{
    std::stringstream jsonStream;
    jsonStream << "{";
    bool hasContent = false;
    
    if (request && request->url.buffer) {
        jsonStream << "\"url\":{\"buffer\":\"" << request->url.buffer;
        jsonStream << "\",\"length\":" << request->url.length << "}";
        hasContent = true;
    }
    
    if (request && request->method.buffer) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"method\":{\"buffer\":\"" << request->method.buffer;
        jsonStream << "\",\"length\":" << request->method.length << "}";
        hasContent = true;
    }
    
    if (request && request->body.buffer) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"body\":{\"buffer\":\"" << request->body.buffer;
        jsonStream << "\",\"length\":" << request->body.length << "}";
        hasContent = true;
    }
    
    if (request && request->headers) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"headers\":[";
        BuildHeadersJson(jsonStream, request->headers);
        jsonStream << "]";
    }
    
    jsonStream << "}";
    return jsonStream.str();
}

InterceptorCallbackResult CallJsFunctionWithRequest(
    std::string &callbackName, OH_Http_Interceptor_Request *request, const char *interceptorName)
{
    InterceptorCallbackResult result;
    result.interceptorName = interceptorName;
    result.requestJson = BuildRequestJson(request);
    CallbackData data;
    data.callbackName = callbackName;
    data.jsonData = result.requestJson;
    data.interceptorName = result.interceptorName;
    data.isRequest = true;
    CallJsCallbackOnMainThread(data);
    return result;
}

static std::string BuildResponseJson(OH_Http_Interceptor_Response *response)
{
    std::stringstream jsonStream;
    jsonStream << "{";
    bool hasContent = false;
    
    if (response) {
        jsonStream << "\"responseCode\":" << response->responseCode;
        hasContent = true;
    }
    
    if (response && response->body.buffer) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"body\":{\"buffer\":\"" << response->body.buffer;
        jsonStream << "\",\"length\":" << response->body.length << "}";
        hasContent = true;
    }
    
    if (response && response->headers) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"headers\":[";
        BuildHeadersJson(jsonStream, response->headers);
        jsonStream << "]";
        hasContent = true;
    }
    
    if (response) {
        if (hasContent) {
            jsonStream << ",";
        }
        jsonStream << "\"performanceTiming\":{";
        BuildPerformanceTimingJson(jsonStream, response->performanceTiming);
        jsonStream << "}";
    }
    
    jsonStream << "}";
    return jsonStream.str();
}

InterceptorCallbackResult CallJsFunctionWithResponse(
    std::string &callbackName, OH_Http_Interceptor_Response *response, const char *interceptorName)
{
    InterceptorCallbackResult result;
    result.interceptorName = interceptorName;
    result.responseJson = BuildResponseJson(response);
    CallbackData data;
    data.callbackName = callbackName;
    data.jsonData = result.responseJson;
    data.interceptorName = result.interceptorName;
    data.isRequest = false;
    CallJsCallbackOnMainThread(data);
    return result;
}