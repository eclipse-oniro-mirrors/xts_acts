
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
#include <network/netstack/net_http.h>
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <string>
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
static const uint32_t CASE_INDEX_9 = 9;
static const uint32_t CASE_INDEX_10 = 10;
static const uint32_t CASE_INDEX_11 = 11;
static const uint32_t CASE_INDEX_12 = 12;
static const uint32_t CASE_INDEX_13 = 13;
static const uint32_t CASE_INDEX_14 = 14;
static const uint16_t PORT = 8080;

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

napi_value Http_CreateHeaders(napi_env env, napi_callback_info info)
{
    Http_Headers *header = OH_Http_CreateHeaders();
    int32_t returnValue = header == nullptr ? -1 : 0;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_SetHeaderValue(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    Http_Headers *header = OH_Http_CreateHeaders();
    if (index == CASE_INDEX_1) {
        returnValue = OH_Http_SetHeaderValue(header, nullptr, nullptr);
    } else if (index == CASE_INDEX_2) {
        returnValue = OH_Http_SetHeaderValue(header, "key", nullptr);
    } else if (index == CASE_INDEX_3) {
        returnValue = OH_Http_SetHeaderValue(header, "key", "value");
    } else if (index == CASE_INDEX_4) {
        returnValue = OH_Http_SetHeaderValue(nullptr, nullptr, nullptr);
    } else if (index == CASE_INDEX_5) {
        returnValue = OH_Http_SetHeaderValue(nullptr, "key", nullptr);
    } else if (index == CASE_INDEX_6) {
        returnValue = OH_Http_SetHeaderValue(nullptr, "key", "value");
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_GetHeaderValue(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    Http_Headers *header = OH_Http_CreateHeaders();
    int setValue = OH_Http_SetHeaderValue(header, "key", "value");
    if (index == CASE_INDEX_1) {
        Http_HeaderValue *headValue = OH_Http_GetHeaderValue(header, nullptr);
        returnValue = headValue == nullptr ? 0 : -1;
    } else if (index == CASE_INDEX_2) {
        Http_HeaderValue *headValue = OH_Http_GetHeaderValue(header, "key");
        returnValue = headValue == nullptr ? -1 : 0;
    } else if (index == CASE_INDEX_3) {
        Http_HeaderValue *headValue = OH_Http_GetHeaderValue(nullptr, nullptr);
        returnValue = headValue == nullptr ? 0 : -1;
    } else if (index == CASE_INDEX_4) {
        Http_HeaderValue *headValue = OH_Http_GetHeaderValue(nullptr, "key");
        returnValue = headValue == nullptr ? 0 : -1;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_GetHeaderEntries(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        Http_Headers *header = OH_Http_CreateHeaders();
        OH_Http_SetHeaderValue(header, "key", "val");
        returnValue = OH_Http_GetHeaderEntries(header) == nullptr ? -1 : 0;
    } else {
        returnValue = OH_Http_GetHeaderEntries(nullptr) == nullptr ? 0 : -1;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_DestroyHeaderEntries(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        Http_Headers *header = OH_Http_CreateHeaders();
        OH_Http_SetHeaderValue(header, "key", "val");
        Http_HeaderEntry *headerEntries = OH_Http_GetHeaderEntries(header);
        OH_Http_DestroyHeaderEntries(&headerEntries);
    } else {
        OH_Http_GetHeaderEntries(nullptr);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_CreateRequest(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    int32_t returnValue = 0;
    if (url.empty()) {
        Http_Request *request = OH_Http_CreateRequest(nullptr);
        returnValue = request == nullptr ? 0 : -1;
    } else {
        Http_Request *request = OH_Http_CreateRequest(url.c_str());
        returnValue = request == nullptr ? -1 : 0;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static void ResponseCallback(struct Http_Response *response, uint32_t errCode)
{
    return;
}

napi_value Http_RequestRequest(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = nullptr;
    int returnValue = 0;
    Http_EventsHandler handler;
    if (index == CASE_INDEX_1) {
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        Http_ResponseCallback callback = ResponseCallback;
        returnValue = OH_Http_Request(request, callback, handler);
    } else if (index == CASE_INDEX_2) {
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        returnValue = OH_Http_Request(request, nullptr, handler);
    } else if (index == CASE_INDEX_3) {
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        returnValue = OH_Http_Request(nullptr, nullptr, handler);
    } else if (index == CASE_INDEX_4) {
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        Http_ResponseCallback callback = ResponseCallback;
        returnValue = OH_Http_Request(nullptr, callback, handler);
    }
    if (request->options != nullptr) {
        free(request->options);
        request->options = nullptr;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Destroy(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        OH_Http_Destroy(nullptr);
    } else {
        Http_Request *request = OH_Http_CreateRequest(url.c_str());
        OH_Http_Destroy(&request);
    }

    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_ErrCodeErrCode(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    if (index == CASE_INDEX_1) {
        Http_Request *request = OH_Http_CreateRequest(url.c_str());
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        Http_ResponseCallback callback = ResponseCallback;
        Http_EventsHandler handler;
        request->options->method = "GET";
        returnValue = OH_Http_Request(request, callback, handler);
    } else if (index == CASE_INDEX_2) {
        returnValue = OH_Http_SetHeaderValue(nullptr, nullptr, "test");
    } else if (index == CASE_INDEX_3) {
        Http_ResponseCallback callback = ResponseCallback;
        Http_Request *request = OH_Http_CreateRequest(url.c_str());
        Http_EventsHandler handler;
        returnValue = OH_Http_Request(nullptr, callback, handler);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static void ResponseBuffer(struct Http_Response *response, uint32_t errCode)
{
    if (response == nullptr) {
        return;
    }
    const char* buffer = response->body.buffer;
}

static void ResponseLength(struct Http_Response *response, uint32_t errCode)
{
    if (response == nullptr) {
        return;
    }
    uint32_t length = response->body.length;
}

napi_value Http_BufferBuffer(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    int32_t returnValue = 0;
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseLength;
    Http_EventsHandler handler;
    char buffer[MAX_BUFFER_SIZE];
    Http_Response response;
    response.body.length = MAX_BUFFER_SIZE;
    response.body.buffer = buffer;
    unsigned int errCode = 0;
    callback(&response, errCode);
    
    request->options->method = "GET";
    free(request->options);
    OH_Http_Destroy(&request);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Address_FamilyType(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    if (index == CASE_INDEX_1) {
        request->options->addressFamily = Http_AddressFamilyType::HTTP_ADDRESS_FAMILY_DEFAULT;
    } else if (index == CASE_INDEX_2) {
        request->options->addressFamily = Http_AddressFamilyType::HTTP_ADDRESS_FAMILY_ONLY_V4;
    } else if (index == CASE_INDEX_3) {
        request->options->addressFamily = Http_AddressFamilyType::HTTP_ADDRESS_FAMILY_ONLY_V6;
    }
    free(request->options);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Http_Protocol(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    Http_ResponseCallback callback = ResponseCallback;
    Http_Request *req = OH_Http_CreateRequest(url.c_str());
    req->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_EventsHandler handler;
    if (index == CASE_INDEX_1) {
        req->options->httpProtocol = Http_HttpProtocol::OH_HTTP_NONE;
    } else if (index == CASE_INDEX_2) {
        req->options->httpProtocol = Http_HttpProtocol::OH_HTTP1_1;
    } else if (index == CASE_INDEX_3) {
        req->options->httpProtocol = Http_HttpProtocol::OH_HTTP2;
    } else if (index == CASE_INDEX_4) {
        req->options->httpProtocol = Http_HttpProtocol::OH_HTTP3;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    free(req->options);
    return result;
}

napi_value Http_Cert_Type(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    std::string key = GetString(env, info, 2);
    int32_t returnValue = 0;
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    const char* clientCertTest = key.c_str();
    request->options->clientCert = (Http_ClientCert *)calloc(1, sizeof(Http_ClientCert));
    request->options->clientCert->certPath = strdup(clientCertTest);
    request->options->clientCert->keyPassword = strdup(clientCertTest);
    request->options->clientCert->keyPath = strdup(clientCertTest);
    if (index == CASE_INDEX_1) {
        request->options->clientCert->type = Http_CertType::OH_HTTP_PEM;
    } else if (index == CASE_INDEX_2) {
        request->options->clientCert->type = Http_CertType::OH_HTTP_DER;
    } else if (index == CASE_INDEX_3) {
        request->options->clientCert->type = Http_CertType::OH_HTTP_P12;
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Header_Value(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t returnValue = 0;
    std::string url = GetString(env, info, 0);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_Headers *headers = OH_Http_CreateHeaders();
    const char *key1 = "testKey1";
    const char *value1 = "testValue1";
    const char *key2 = "testKey1";
    const char *value2 = "testValue1";
    uint32_t ret = OH_Http_SetHeaderValue(headers, key1, value1);
    ret = OH_Http_SetHeaderValue(headers, key2, value2);
    Http_HeaderValue *headValue = OH_Http_GetHeaderValue(headers, key1);
    while (headValue) {
        std::string val = headValue->value;
        headValue = headValue->next;
    }
    free(request->options);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Header_Entry(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t returnValue = 0;
    std::string url = GetString(env, info, 0);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    Http_Headers *headers = OH_Http_CreateHeaders();
    const char *key1 = "testKey1";
    const char *value1 = "testValue1";
    const char *key2 = "testKey1";
    const char *value2 = "testValue1";
    uint32_t ret = OH_Http_SetHeaderValue(headers, key1, value1);
    ret = OH_Http_SetHeaderValue(headers, key2, value2);
    if (headers != nullptr) {
        Http_HeaderEntry *entries = OH_Http_GetHeaderEntries(headers);
        Http_HeaderValue *headerValue;
        Http_HeaderEntry *delEntries = entries;
        while (entries != nullptr) {
            headerValue = entries->value;
            std::string key = entries->key;
            while (headerValue != nullptr && entries->key != nullptr) {
                headerValue = headerValue->next;
            }
            entries = entries->next;
        }
    }
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Client_Cert(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    const char* clientCertTest = "test";
    Http_ClientCert clientCert;
    request->options->clientCert = &clientCert;
    request->options->clientCert->certPath = strdup(clientCertTest);
    request->options->clientCert->keyPassword = strdup(clientCertTest);
    request->options->clientCert->keyPath = strdup(clientCertTest);
    request->options->clientCert->type = Http_CertType::OH_HTTP_P12;
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    free(request->options);
    return result;
}

napi_value Http_Proxy_Type(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    int32_t returnValue = 0;
    Http_Proxy httpProxy;
    if (index == CASE_INDEX_1) {
        httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_NOT_USE;
    } else if (index == CASE_INDEX_2) {
        httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_SYSTEM;
    } else if (index == CASE_INDEX_3) {
        httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_CUSTOM;
    }
    request->options->httpProxy = &httpProxy;
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    free(request->options);
    return result;
}

napi_value Http_Custom_Proxy(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    int32_t returnValue = 0;
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_Proxy httpProxy;
    httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_CUSTOM;
    request->options->httpProxy = &httpProxy;
    if (index == CASE_INDEX_1) {
        httpProxy.customProxy.host = "host test";
    } else if (index == CASE_INDEX_2) {
        httpProxy.customProxy.host = "host test";
        httpProxy.customProxy.port = PORT;
    } else if (index == CASE_INDEX_3) {
        httpProxy.customProxy.host = "host test";
        httpProxy.customProxy.port = PORT;
        httpProxy.customProxy.exclusionLists = "exclusionLists test";
    }
    free(request->options);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_ProxyProxy(napi_env env, napi_callback_info info)
{
    std::string url = GetString(env, info, 0);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    
    Http_Proxy httpProxy;
    std::fill_n(reinterpret_cast<unsigned char*>(&httpProxy), sizeof(httpProxy), '\0');
    httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_CUSTOM;
    request->options->httpProxy = &httpProxy;
    httpProxy.customProxy.host = "host test";
    napi_value result = nullptr;
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    free(request->options);
    return result;
}

napi_value Http_Performance_Timing(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    const double timering = 5.5;
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseBuffer;
    Http_EventsHandler handler;
    char buffer[MAX_BUFFER_SIZE];
    Http_Response response;
    Http_PerformanceTiming* performanceTiming = (Http_PerformanceTiming *)calloc(1, sizeof(Http_PerformanceTiming));
    if (index == CASE_INDEX_1) {
        performanceTiming->dnsTiming = timering;
    } else if (index == CASE_INDEX_2) {
        performanceTiming->tcpTiming = timering;
    } else if (index == CASE_INDEX_3) {
        performanceTiming->tlsTiming = timering;
    } else if (index == CASE_INDEX_4) {
        performanceTiming->firstSendTiming = timering;
    }
    performanceTiming->firstSendTiming = timering;
    performanceTiming->firstReceiveTiming = timering;
    performanceTiming->totalFinishTiming = timering;

    performanceTiming->redirectTiming = timering;
    response.performanceTiming = performanceTiming;
    unsigned int errCode = 0;
    callback(&response, errCode);
    
    request->options->method = "GET";
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    free(request->options);
    free(performanceTiming);
    OH_Http_Destroy(&request);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Request_Option(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    Http_Proxy httpProxy;
    if (index == CASE_INDEX_1) {
        request->options->method = "GET";
    } else if (index == CASE_INDEX_2) {
        request->options->priority = 1;
    } else if (index == CASE_INDEX_3) {
        request->options->headers = OH_Http_CreateHeaders();
        OH_Http_SetHeaderValue(request->options->headers, "key", "value");
    } else if (index == CASE_INDEX_4) {
        request->options->readTimeout = 0;
    } else if (index == CASE_INDEX_5) {
        request->options->connectTimeout = 0;
    } else if (index == CASE_INDEX_6) {
        request->options->httpProtocol = Http_HttpProtocol::OH_HTTP1_1;
    } else if (index == CASE_INDEX_7) {
        httpProxy.proxyType = Http_ProxyType::HTTP_PROXY_CUSTOM;
        httpProxy.customProxy.host = "host test";
        httpProxy.customProxy.port = PORT;
        httpProxy.customProxy.exclusionLists = "exclusionLists test";
        request->options->httpProxy = &httpProxy;
    } else if (index == CASE_INDEX_8) {
        request->options->caPath = "capath test";
    } else if (index == CASE_INDEX_9) {
        request->options->resumeFrom = 0;
    } else if (index == CASE_INDEX_10) {
        request->options->resumeTo = 0;
    } else if (index == CASE_INDEX_11) {
        request->options->clientCert = (Http_ClientCert *)calloc(1, sizeof(Http_ClientCert));
        request->options->clientCert->certPath = strdup("certPath test");
        request->options->clientCert->type = Http_CertType::OH_HTTP_PEM;
        request->options->clientCert->keyPassword = strdup("keyPassword test");
    } else if (index == CASE_INDEX_12) {
        request->options->dnsOverHttps = "dnsOverHttps test";
    } else if (index == CASE_INDEX_13) {
    } else if (index == CASE_INDEX_14) {
        request->options->addressFamily = Http_AddressFamilyType::HTTP_ADDRESS_FAMILY_ONLY_V4;
    }
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

static void DelResponse(struct Http_Response **response)
{
    return;
}

napi_value Http_Resps(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    Http_ResponseCallback callback = ResponseBuffer;
    Http_EventsHandler handler;
    char buffer[MAX_BUFFER_SIZE];
    Http_Response response;
    Http_PerformanceTiming performanceTiming;
    if (index == CASE_INDEX_1) {
        response.body.buffer = buffer;
        response.body.length = MAX_BUFFER_SIZE;
    } else if (index == CASE_INDEX_2) {
        response.responseCode = Http_ResponseCode::OH_HTTP_OK;
    } else if (index == CASE_INDEX_3) {
        response.headers = OH_Http_CreateHeaders();
    } else if (index == CASE_INDEX_4) {
        response.cookies = strdup("response cookies");
    } else if (index == CASE_INDEX_5) {
        response.performanceTiming = &performanceTiming;
    } else if (index == CASE_INDEX_6) {
        response.destroyResponse = DelResponse;
        callback(&response, response.responseCode);
    }
    request->options->method = "GET";
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    free(request->options);
    OH_Http_Destroy(&request);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_Req(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    if (index == CASE_INDEX_1) {
        request->requestId = 1;
    } else if (index == CASE_INDEX_2) {
        request->url = strdup(url.c_str());
    } else {
        request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
        request->options->method = "GET";
        request->options->priority = 1;
        request->options->headers = OH_Http_CreateHeaders();
        request->options->readTimeout = 0;
    }
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    OH_Http_Destroy(&request);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

void OnProgressCallback(uint64_t totalSize, uint64_t transferredSize)
{
    return;
}

void OnHeaderReceiveCallback(Http_Headers *headers)
{
    return;
}

void OnDataEndCallback(void)
{
    return;
}

napi_value Http_Events_Handler(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    std::string url = GetString(env, info, 1);
    Http_Request *request = OH_Http_CreateRequest(url.c_str());
    Http_ResponseCallback callback = ResponseCallback;
    Http_EventsHandler handler;
    if (index == CASE_INDEX_1) {
        handler.onDataReceive = nullptr;
    } else if (index == CASE_INDEX_2) {
        handler.onUploadProgress = OnProgressCallback;
    } else if (index == CASE_INDEX_3) {
        handler.onDownloadProgress = OnProgressCallback;
    } else if (index == CASE_INDEX_4) {
        handler.onHeadersReceive = OnHeaderReceiveCallback;
    } else if (index == CASE_INDEX_5) {
        handler.onDataEnd = OnDataEndCallback;
    } else {
        handler.onCanceled = OnDataEndCallback;
    }
    int32_t returnValue = OH_Http_Request(request, callback, handler);
    OH_Http_Destroy(&request);
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, returnValue, &result));
    return result;
}

napi_value Http_DestroyHeaders(napi_env env, napi_callback_info info)
{
    int32_t index = GetInt(env, info, 0);
    if (index == CASE_INDEX_1) {
        Http_Headers *header = OH_Http_CreateHeaders();
        OH_Http_DestroyHeaders(&header);
    } else {
        OH_Http_DestroyHeaders(nullptr);
    }
    napi_value result = nullptr;
    NAPI_CALL(env, napi_create_int32(env, 0, &result));
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"Http_CreateHeaders", nullptr, Http_CreateHeaders, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_SetHeaderValue", nullptr, Http_SetHeaderValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_GetHeaderValue", nullptr, Http_GetHeaderValue, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_GetHeaderEntries", nullptr, Http_GetHeaderEntries, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_DestroyHeaderEntries", nullptr, Http_DestroyHeaderEntries, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"Http_CreateRequest", nullptr, Http_CreateRequest, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"Http_RequestRequest", nullptr, Http_RequestRequest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Destroy", nullptr, Http_Destroy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_ErrCodeErrCode", nullptr, Http_ErrCodeErrCode, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_BufferBuffer", nullptr, Http_BufferBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Address_FamilyType", nullptr, Http_Address_FamilyType, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Http_Protocol", nullptr, Http_Http_Protocol, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Cert_Type", nullptr, Http_Cert_Type, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Header_Value", nullptr, Http_Header_Value, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Header_Entry", nullptr, Http_Header_Entry, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Client_Cert", nullptr, Http_Client_Cert, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Proxy_Type", nullptr, Http_Proxy_Type, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Custom_Proxy", nullptr, Http_Custom_Proxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_ProxyProxy", nullptr, Http_ProxyProxy, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Performance_Timing", nullptr, Http_Performance_Timing, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Request_Option", nullptr, Http_Request_Option, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Resps", nullptr, Http_Resps, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Req", nullptr, Http_Req, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_Events_Handler", nullptr, Http_Events_Handler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Http_DestroyHeaders", nullptr, Http_DestroyHeaders, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nethttptest",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
