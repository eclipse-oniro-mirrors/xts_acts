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

#include "global_http_interceptor.h"
#include "callback.h"
#include <hilog/log.h>
#include <string>

static const int GLOBAL_NETSTACK = 0xFF00;
static const char *TAG = "[netstack]";

char *MallocCString(const std::string &origin)
{
    if (origin.empty()) {
        return nullptr;
    }
    auto len = origin.length() + 1;
    char *res = static_cast<char *>(malloc(sizeof(char) * len));
    if (res == nullptr) {
        return nullptr;
    }
    return std::char_traits<char>::copy(res, origin.c_str(), len);
}

void LogHeader(OH_Http_Interceptor_Headers *headers)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---------------------header begin---------------------");
    while (headers != nullptr) {
        if (headers->data != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "%{public}s", headers->data);
        }
        headers = headers->next;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---------------------header end---------------------");
}

void PrintRequestInfo(OH_Http_Interceptor_Request *request, bool isModifyInterceptor = false)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "-----PrintRequestInfo Begin-----");
    if (request != nullptr) {
        if (request->url.buffer != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "url = %{public}s", request->url.buffer);
        }
        if (request->method.buffer != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "method = %{public}s", request->method.buffer);
        }
        if (request->body.buffer != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "body = %{public}s", request->body.buffer);
        }
        if (request->headers != nullptr) {
            LogHeader(request->headers);
        }
    }

    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "-----PrintRequestInfo End-----");
}

void PrintResponseInfo(OH_Http_Interceptor_Response *response)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "-----PrintResponseInfo Begin-----");
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "responseCode = %{public}d", response->responseCode);
        if (response->body.buffer != nullptr) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "body = %{public}s", response->body.buffer);
        }
        if (response->headers != nullptr) {
            LogHeader(response->headers);
        }

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "dns: %lf", response->performanceTiming.dnsTiming);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "tcp: %lf", response->performanceTiming.tcpTiming);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "tls: %lf", response->performanceTiming.tlsTiming);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "snd: %lf", response->performanceTiming.firstSendTiming);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "rcv: %lf", response->performanceTiming.firstReceiveTiming);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "tot: %lf", response->performanceTiming.totalFinishTiming);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "rdr: %lf", response->performanceTiming.redirectTiming);
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "-----PrintResponseInfo End-----");
    }
}

OH_Interceptor_Result g_request_group0_modify_url_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group0_modify_url---");
        if (request->url.buffer) {
            std::string newurl = "http://www.baidu.com";
            (void)free((void *)request->url.buffer);
            request->url.buffer = MallocCString(newurl);
            request->url.length = newurl.length();
            *isModified = 1;
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group0_modify_url_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group0_modify_url_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group0_modify_url_interceptor = {
    .groupId = 0,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_request_group0_modify_url_interceptor_handler,
};

OH_Interceptor_Result g_request_group1_modify_method_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group1_modify_method---");
        if (request->method.buffer) {
            std::string method = std::string(request->method.buffer, request->method.length);
            (void)free((void *)request->method.buffer);
            method = "POST";
            request->method.buffer = MallocCString(method);
            request->method.length = method.length();
            *isModified = 1;
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group1_modify_method_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group1_modify_method_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group1_modify_method_interceptor = {
    .groupId = 1,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_request_group1_modify_method_interceptor_handler,
};

OH_Interceptor_Result g_request_group2_modify_body_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group2_modify_body---");
        if (request->body.buffer) {
            std::string body = std::string(request->body.buffer, request->body.length);
            (void)free((void *)request->body.buffer);
            body = "g_request_group2_modify_body_interceptor_handler";
            request->body.buffer = MallocCString(body);
            request->body.length = body.length();
            *isModified = 1;
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group2_modify_body_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group2_modify_body_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group2_modify_body_interceptor = {
    .groupId = 2,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_request_group2_modify_body_interceptor_handler,
};

OH_Interceptor_Result g_request_group3_modify_headers_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group3_modify_headers---");
        if (request->headers) {
            OH_Http_Interceptor_Headers *header = request->headers;
            if (header != nullptr && header->data != nullptr) {
                free(header->data);
                std::string data = "CCCCC:33333";
                header->data = MallocCString(data);
                *isModified = 1;
            }
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group3_modify_headers_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group3_modify_headers_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group3_modify_headers_interceptor = {
    .groupId = 3,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_request_group3_modify_headers_interceptor_handler,
};

OH_Interceptor_Result g_request_group4_modify_abort_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group4_modify_abort---");
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group4_modify_abort_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group4_modify_abort_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
        return OH_ABORT;
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group4_modify_abort_interceptor = {
    .groupId = 4,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_request_group4_modify_abort_interceptor_handler,
};

//////////////////////////////////readonly request interceptor/////////////////////////////////////
OH_Interceptor_Result g_request_group10_readonly_url_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group10_readonly_url---");
        if (request->url.buffer) {
            std::string url = "www.sina.com";
            (void)free((void *)request->url.buffer);
            request->url.buffer = MallocCString(url);
            request->url.length = url.length();
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group10_readonly_url_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group10_readonly_url_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group10_readonly_url_interceptor = {
    .groupId = 10,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_request_group10_readonly_url_interceptor_handler,
};

OH_Interceptor_Result g_request_group11_readonly_method_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group11_readonly_method---");
        if (request->method.buffer) {
            std::string method = "GET";
            (void)free((void *)request->method.buffer);
            request->method.buffer = MallocCString(method);
            request->method.length = method.length();
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group11_readonly_method_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group11_readonly_method_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group11_readonly_method_interceptor = {
    .groupId = 11,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_request_group11_readonly_method_interceptor_handler,
};

OH_Interceptor_Result g_request_group12_readonly_headers_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group12_readonly_headers---");
        if (request->headers) {
            OH_Http_Interceptor_Headers *header = request->headers;
            if (header != nullptr && header->data != nullptr) {
                std::string data = "FFFFF:4444444";
                free(header->data);
                header->data = MallocCString(data);
            }
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group12_readonly_headers_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group12_readonly_headers_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group12_readonly_headers_interceptor = {
    .groupId = 12,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_request_group12_readonly_headers_interceptor_handler,
};

OH_Interceptor_Result g_request_group13_readonly_body_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group13_readonly_body---");
        if (request->body.buffer) {
            std::string body = "g_request_group13_readonly_body_interceptor_handler";
            free((void *)request->body.buffer);
            request->body.buffer = MallocCString(body);
            request->body.length = body.length();
        }
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group13_readonly_body_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group13_readonly_body_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_request_group13_readonly_body_interceptor = {
    .groupId = 13,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_request_group13_readonly_body_interceptor_handler,
};

OH_Interceptor_Result g_request_group14_readonly_abort_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (request != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---request_group14_readonly_all---");
        PrintRequestInfo(request);
        std::string callbackName = "g_request_group14_readonly_abort_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithRequest(callbackName, request, "g_request_group14_readonly_abort_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Request JSON: %{public}s", result.requestJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_ABORT;
}

static OH_Http_Interceptor g_request_group14_readonly_abort_interceptor = {
    .groupId = 14,
    .stage = OH_STAGE_REQUEST,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_request_group14_readonly_abort_interceptor_handler,
};

OH_Http_Interceptor *GetRequestInterceptorByGroupId(int32_t groupId)
{
    switch (groupId) {
        case REQUEST_GROUP0_MODIFY_URL:
            return &g_request_group0_modify_url_interceptor;
        case REQUEST_GROUP1_MODIFY_METHOD:
            return &g_request_group1_modify_method_interceptor;
        case REQUEST_GROUP2_MODIFY_BODY:
            return &g_request_group2_modify_body_interceptor;
        case REQUEST_GROUP3_MODIFY_HEADERS:
            return &g_request_group3_modify_headers_interceptor;
        case REQUEST_GROUP4_MODIFY_ABORT:
            return &g_request_group4_modify_abort_interceptor;
        case REQUEST_GROUP10_READONLY_URL:
            return &g_request_group10_readonly_url_interceptor;
        case REQUEST_GROUP11_READONLY_METHOD:
            return &g_request_group11_readonly_method_interceptor;
        case REQUEST_GROUP12_READONLY_HEADERS:
            return &g_request_group12_readonly_headers_interceptor;
        case REQUEST_GROUP13_READONLY_BODY:
            return &g_request_group13_readonly_body_interceptor;
        case REQUEST_GROUP14_READONLY_ABORT:
            return &g_request_group14_readonly_abort_interceptor;
        default:
            break;
    }
    return nullptr;
}

OH_Interceptor_Result g_response_group0_modify_body_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group0_modify_body---");
        if (response->body.buffer) {
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group0_modify_body1---");
            std::string body = "response_body_modify";
            free((void *)response->body.buffer);
            response->body.buffer = MallocCString(body);
            response->body.length = body.length();
            *isModified = 1;
        }
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group0_modify_body_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group0_modify_body_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group0_modify_body_interceptor = {
    .groupId = 0,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_response_group0_modify_body_interceptor_handler,
};

OH_Interceptor_Result g_response_group1_modify_responseCode_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group1_modify_responseCode---");
        response->responseCode = OH_HTTP_FORBIDDEN;
        *isModified = 1;
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group1_modify_responseCode_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group1_modify_responseCode_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group1_modify_responseCode_interceptor = {
    .groupId = 1,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_response_group1_modify_responseCode_interceptor_handler,
};

OH_Interceptor_Result g_response_group2_modify_headers_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group2_modify_headers---");
        if (response->headers) {
            OH_Http_Interceptor_Headers *tmp = response->headers;
            if (tmp != nullptr && tmp->data != nullptr) {
                free((void *)tmp->data);
                std::string data = "DDDDDDD:6666666";
                tmp->data = MallocCString(data);
                *isModified = 1;
            }
        }
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group2_modify_headers_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group2_modify_headers_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group2_modify_headers_interceptor = {
    .groupId = 2,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_response_group2_modify_headers_interceptor_handler,
};

OH_Interceptor_Result g_response_group3_modify_abort_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group3_modify_abort---");
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group3_modify_abort_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group3_modify_abort_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_ABORT;
}

static OH_Http_Interceptor g_response_group3_modify_abort_interceptor = {
    .groupId = 3,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_MODIFY_NETWORK_KIT,
    .enabled = 1,
    .handler = g_response_group3_modify_abort_interceptor_handler,
};

////////////////////////////////readonly response interceptor/////////////////////////////
OH_Interceptor_Result g_response_group10_readonly_body_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group10_readonly_body---");
        if (response->body.buffer) {
            std::string body = "g_response_group10_readonly_body_interceptor_handler";
            free((void *)response->body.buffer);
            response->body.buffer = MallocCString(body);
            response->body.length = body.length();
            PrintResponseInfo(response);
            std::string callbackName = "g_response_group10_readonly_body_interceptor";
            InterceptorCallbackResult result =
                CallJsFunctionWithResponse(callbackName, response, "g_response_group10_readonly_body_interceptor");

            OH_LOG_Print(
                LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
            OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s",
                result.interceptorName.c_str());
        }
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group10_readonly_body_interceptor = {
    .groupId = 10,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_response_group10_readonly_body_interceptor_handler,
};

OH_Interceptor_Result g_response_group11_readonly_responseCode_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group11_readonly_responseCode---");
        response->responseCode = OH_HTTP_NOT_FOUND;
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group11_readonly_responseCode_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group11_readonly_responseCode_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group11_readonly_responseCode_interceptor = {
    .groupId = 11,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_response_group11_readonly_responseCode_interceptor_handler,
};

OH_Interceptor_Result g_response_group12_readonly_headers_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group12_readonly_headers---");
    if (response != nullptr) {
        if (response->headers) {
            OH_Http_Interceptor_Headers *tmp = response->headers;
            if (tmp != nullptr && tmp->data != nullptr) {
                std::string data = "GGGGGGGGG:888888888";
                free(tmp->data);
                tmp->data = MallocCString(data);
            }
        }
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group12_readonly_headers_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group12_readonly_headers_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_CONTINUE;
}

static OH_Http_Interceptor g_response_group12_readonly_headers_interceptor = {
    .groupId = 12,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_response_group12_readonly_headers_interceptor_handler,
};

OH_Interceptor_Result g_response_group13_readonly_abort_interceptor_handler(
    OH_Http_Interceptor_Request *request, OH_Http_Interceptor_Response *response, int32_t *isModified)
{
    if (response != nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "---response_group13_readonly_abort---");
        PrintResponseInfo(response);
        std::string callbackName = "g_response_group13_readonly_abort_interceptor";
        InterceptorCallbackResult result =
            CallJsFunctionWithResponse(callbackName, response, "g_response_group13_readonly_abort_interceptor");

        OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Response JSON: %{public}s", result.responseJson.c_str());
        OH_LOG_Print(
            LOG_APP, LOG_INFO, GLOBAL_NETSTACK, TAG, "Interceptor Name: %{public}s", result.interceptorName.c_str());
    }
    return OH_ABORT;
}

static OH_Http_Interceptor g_response_group13_readonly_abort_interceptor = {
    .groupId = 13,
    .stage = OH_STAGE_RESPONSE,
    .type = OH_TYPE_READ_ONLY,
    .enabled = 1,
    .handler = g_response_group13_readonly_abort_interceptor_handler,
};

static OH_Http_Interceptor *GetResponseInterceptorByGroupId(int32_t groupId)
{
    switch (groupId) {
        case RESPONSE_GROUP0_MODIFY_BODY:
            return &g_response_group0_modify_body_interceptor;
        case RESPONSE_GROUP1_MODIFY_RESPONSE_CODE:
            return &g_response_group1_modify_responseCode_interceptor;
        case RESPONSE_GROUP2_MODIFY_HEADERS:
            return &g_response_group2_modify_headers_interceptor;
        case RESPONSE_GROUP3_MODIFY_ABORT:
            return &g_response_group3_modify_abort_interceptor;
        case RESPONSE_GROUP10_READONLY_BODY:
            return &g_response_group10_readonly_body_interceptor;
        case RESPONSE_GROUP11_READONLY_RESPONSE_CODE:
            return &g_response_group11_readonly_responseCode_interceptor;
        case RESPONSE_GROUP12_READONLY_HEADERS:
            return &g_response_group12_readonly_headers_interceptor;
        case RESPONSE_GROUP13_READONLY_ABORT:
            return &g_response_group13_readonly_abort_interceptor;
        default:
            break;
    }
    return nullptr;
}

int32_t AddReadOnlyRequestInterceptor(int32_t groupId, int32_t enabled)
{
    OH_Http_Interceptor *interceptor = GetRequestInterceptorByGroupId(groupId);
    if (interceptor != nullptr) {
        interceptor->enabled = enabled;
    }
    return OH_Http_AddReadOnlyInterceptor(interceptor);
}
int32_t AddReadOnlyResponseInterceptor(int32_t groupId, int32_t enabled)
{
    OH_Http_Interceptor *interceptor = GetResponseInterceptorByGroupId(groupId);
    if (interceptor != nullptr) {
        interceptor->enabled = enabled;
    }
    return OH_Http_AddReadOnlyInterceptor(interceptor);
}
int32_t AddWritableRequestInterceptor(int32_t groupId, int32_t enabled)
{
    OH_Http_Interceptor *interceptor = GetRequestInterceptorByGroupId(groupId);
    if (interceptor != nullptr) {
        interceptor->enabled = enabled;
    }
    return OH_Http_AddWritableInterceptor(interceptor);
}

int32_t AddWritableResponseInterceptor(int32_t groupId, int32_t enabled)
{
    OH_Http_Interceptor *interceptor = GetResponseInterceptorByGroupId(groupId);
    if (interceptor != nullptr) {
        interceptor->enabled = enabled;
    }
    return OH_Http_AddWritableInterceptor(interceptor);
}

int32_t StopAllInterceptor(int32_t groupId)
{
    return OH_Http_StopAllInterceptors(groupId);
}
int32_t StartAllInterceptor(int32_t groupId)
{
    return OH_Http_StartAllInterceptors(groupId);
}
int32_t RemoveAllInterceptor(int32_t groupId)
{
    return OH_Http_RemoveAllInterceptors(groupId);
}

int32_t RemoveRequestInterceptor(int32_t groupId)
{
    OH_Http_Interceptor *interceptor = GetRequestInterceptorByGroupId(groupId);
    return OH_Http_RemoveInterceptor(interceptor);
}

int32_t RemoveResponseInterceptor(int32_t groupId)
{
    OH_Http_Interceptor *interceptor = GetResponseInterceptorByGroupId(groupId);
    return OH_Http_RemoveInterceptor(interceptor);
}