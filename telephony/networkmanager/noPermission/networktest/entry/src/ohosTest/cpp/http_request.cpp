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

#include "http_request.h"
// HTTP 请求核心头文件
#include "network/netstack/net_http.h"
// 日志头文件（调试用，适配3.2版本）
#include <hilog/log.h>


// 日志宏定义
static const int GLOBAL_HTTP_NETSTACK = 0xFF00;
static const char *HTTP_TAG = "netstack";

static void TestResponseCallback(struct Http_Response *response, uint32_t errCode)
{
    (void)response;
    (void)errCode;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "TestResponseCallback function called!");
}

void THttpOnDataReceiveCallback(const char *data, size_t length)
{
    (void)data;
    (void)length;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttpOnDataReceiveCallback function called!");
}

void THttpOnProgressCallback(uint64_t totalSize, uint64_t transferredSize)
{
    (void)totalSize;
    (void)transferredSize;
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttpOnProgressCallback function called!");
}

void THttpOnHeaderReceiveCallback(Http_Headers *headers)
{
    OH_Http_DestroyHeaders(&headers);
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttpOnHeaderReceiveCallback function called!");
}

void(THttpOnVoidCallback)(void)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, GLOBAL_HTTP_NETSTACK, HTTP_TAG, "THttpOnVoidCallback function called!");
}

/**
 * 发起HTTP GET请求
 * @param url 请求URL（如"http://www.example.com/api"）
 * @return 成功返回0，失败返回-1
 */
int32_t SendHttpGetRequest(const char *url)
{
    Http_Request *request = OH_Http_CreateRequest(url);
    if (request == nullptr) {
        return -1;
    }
    request->options = (Http_RequestOptions *)calloc(1, sizeof(Http_RequestOptions));
    if (request->options == nullptr) {
        return -1;
    }
    Http_ResponseCallback callback = TestResponseCallback;
    Http_EventsHandler handler = { 0 };

    /** Callback function when the response body is received */
    handler.onDataReceive = THttpOnDataReceiveCallback;
    /** Callback function during uploading */
    handler.onUploadProgress = THttpOnProgressCallback;
    /** Callback function during downloading */
    handler.onDownloadProgress = THttpOnProgressCallback;
    /** Callback function when a header is received */
    handler.onHeadersReceive = THttpOnHeaderReceiveCallback;
    /** Callback function at the end of the transfer */
    handler.onDataEnd = THttpOnVoidCallback;
    /** Callback function when a request is canceled */
    handler.onCanceled = THttpOnVoidCallback;

    Http_Headers *header = OH_Http_CreateHeaders();
    OH_Http_SetHeaderValue(header, "Accept", "application/json");
    OH_Http_SetHeaderValue(header, "aaaaa", "11111");
    request->options->headers = header;
    if (header == nullptr) {
        return -1;
    }
    auto ret = OH_Http_Request(request, callback, handler);
    return ret;
}
