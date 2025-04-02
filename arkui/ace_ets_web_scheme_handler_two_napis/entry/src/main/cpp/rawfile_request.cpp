/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *
 * http://www.apache.org/licenses/LICENSE-2.0
 * *   * Unless required by applicable law or agreed to in writing, software
 * * distributed under the License is distributed on an "AS IS" BASIS,
 * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * * See the License for the specific language governing permissions and
 * * limitations under the License.
 * */
#include "rawfile_request.h"
#include "threads.h"
#include "hilog/log.h"
#include "rawfile/raw_file.h"
#include "rawfile/raw_file_manager.h"
#undef LOG_TAG 
#define LOG_TAG "ss-handler"

namespace {

    uint8_t buffer[1024];
    cnd_t http_body_cnd;
    mtx_t http_body_mtx;
    const int BUFF_LEN = 1000;
    const int DO_NOT_FOUND = 404;
    const int DO_OK = 200;
    // HttpBodyStream的读回调。
    void ReadCallback(const ArkWeb_HttpBodyStream *httpBodyStream, uint8_t *buffer, int bytesRead) {
        OH_LOG_INFO(LOG_APP, "read http body back.");
        bool isEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream);
        if (!isEof && bytesRead != 0) {
            memset(buffer, 0, BUFF_LEN);
            OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, BUFF_LEN);
        } else {
            RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebHttpBodyStream_GetUserData(httpBodyStream);
    
            if (rawfileRequest) {
                rawfileRequest->ReadRawfileDataOnWorkerThread();
            }
        }
    }

    int ReadHttpBodyOnWorkerThread(void *userData) {
        memset(buffer, 0, BUFF_LEN);
        ArkWeb_HttpBodyStream *httpBodyStream = (ArkWeb_HttpBodyStream *)userData;
        OH_ArkWebHttpBodyStream_Read(httpBodyStream, buffer, BUFF_LEN);
        return 0;
    }

    int ReadRawfileOnWorkerThread(void *userData) {
        RawfileRequest *rawfileRequest = (RawfileRequest *)userData;
        if (rawfileRequest) {
            rawfileRequest->ReadRawfileDataOnWorkerThread();
        }
        return 0;
    }

    // ArkWeb_HttpBodyStream的初始化回调。
    void InitCallback(const ArkWeb_HttpBodyStream *httpBodyStream, ArkWeb_NetError result) {
        OH_LOG_INFO(LOG_APP, "init http body stream done %{public}d.", result);
        bool isChunked = OH_ArkWebHttpBodyStream_IsChunked(httpBodyStream);
        OH_LOG_INFO(LOG_APP, "http body stream is chunked %{public}d.", isChunked);
        ReadHttpBodyOnWorkerThread((void *)httpBodyStream);
    }

    const int blockSize = 1024 * 8;

} 

RawfileRequest::RawfileRequest(const ArkWeb_ResourceRequest *resourceRequest,
                               const ArkWeb_ResourceHandler *resourceHandler,
                               const NativeResourceManager *resourceManager)
    : resourceRequest_(resourceRequest), resourceHandler_(resourceHandler), resourceManager_(resourceManager) {}

RawfileRequest::~RawfileRequest() {}

void RawfileRequest::Start() {
    OH_LOG_INFO(LOG_APP, "start a rawfile request.");
    // 接口覆盖
    char *url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest_, &url);

    // 接口覆盖
    char *method;
    OH_ArkWebResourceRequest_GetMethod(resourceRequest_, &method);
    
    std::string urlStr(url);
    std::size_t position = urlStr.rfind('/');
    if (position != std::string::npos) {
        rawfilePath_ = urlStr.substr(position + 1);
    }
    OH_ArkWeb_ReleaseString(url);
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ReleaseString.");

    OH_ArkWeb_CreateResponse(&response_);
    // 接口覆盖
    OH_ArkWebResourceRequest_GetHttpBodyStream(resourceRequest(), &stream_);

    if (rawfilePath_ == "xhrError") {
        DidFailWithError(ARKWEB_ERR_FILE_NOT_FOUND);
        return;
    }
    if (stream_) {
        OH_LOG_ERROR(LOG_APP, "have http body stream");
        httpBodyStreamSetUserData_ = OH_ArkWebHttpBodyStream_SetUserData(stream_, this);

        ArkWeb_HttpBodyStreamReadCallback callback = ReadCallback;
        ArkWeb_HttpBodyStreamInitCallback initCallBack = InitCallback;

        httpBodyStreamSetReadCallback_ = OH_ArkWebHttpBodyStream_SetReadCallback(stream_, callback);
        httpBodyStreamInit_ = OH_ArkWebHttpBodyStream_Init(stream_, initCallBack);

        OH_LOG_ERROR(LOG_APP, "OH_ArkWebHttpBodyStream_SetUserData %{public}d", httpBodyStreamSetUserData_);
        OH_LOG_ERROR(LOG_APP, "OH_ArkWebHttpBodyStream_SetReadCallback %{public}d", httpBodyStreamSetUserData_);
        OH_LOG_ERROR(LOG_APP, "OH_ArkWebHttpBodyStream_Init %{public}d", httpBodyStreamInit_);

    } else {
        ReadRawfileOnWorkerThread(reinterpret_cast<void * >(this));
    }
}

// 在worker线程中读取rawfile，并通过ResourceHandler返回给Web内核。
void RawfileRequest::ReadRawfileDataOnWorkerThread() {
    OH_LOG_INFO(LOG_APP, "read rawfile in worker thread.");
    const struct UrlInfo {
        std::string resource;
        std::string mimeType;
    } urlInfos[] = {{"test.html", "text/html"},
                    {"video.html", "text/html"},
                    {"isolated.html", "text/html"},
                    {"csp_bypassing.html", "text/html"},
                    {"post_data.html", "text/html"},
                    {"chunked_post_stream.html", "text/html"},
                    {"local.html", "text/html"},
                    {"service_worker.html", "text/html"},
                    {"csp_script.js", "text/javascript"},
                    {"sw.js", "text/javascript"},
                    {"isolated_script.js", "text/javascript"},
                    {"local_script.js", "text/javascript"},
                    {"test.mp4", "video/mp4"},
                    {"xhr", "application/json"}};

    if (!resourceManager()) {
        OH_LOG_ERROR(LOG_APP, "read rawfile error, resource manager is nullptr.");
        return;
    }

    RawFile *rawfile = OH_ResourceManager_OpenRawFile(resourceManager(), rawfilePath().c_str());
    OH_LOG_INFO(LOG_APP, "read OH_ResourceManager_OpenRawFile %{public}s", rawfilePath().c_str());

    if (!rawfile) {
        OH_LOG_INFO(LOG_APP, "read OH_ArkWebResponse_SetStatus %{public}d", DO_NOT_FOUND);
        OH_ArkWebResponse_SetStatus(response(), DO_NOT_FOUND);
    } else {
        OH_LOG_INFO(LOG_APP, "read OH_ArkWebResponse_SetStatus %{public}d", DO_OK);
        OH_ArkWebResponse_SetStatus(response(), DO_OK);
    }
    for (auto &urlInfo : urlInfos) {
        if (urlInfo.resource == rawfilePath()) {
            OH_ArkWebResponse_SetMimeType(response(), urlInfo.mimeType.c_str());
            break;
        }
    }

    OH_ArkWebResponse_SetCharset(response(), "UTF-8");

    long len = OH_ResourceManager_GetRawFileSize(rawfile);
    OH_ArkWebResponse_SetHeaderByName(response(), "content-length", std::to_string(len).c_str(), false);
    OH_ArkWebResponse_SetHeaderByName(response(), "Access-Control-Allow-Origin", "*", false);

    char *url;
    OH_ArkWebResponse_GetUrl(response(), &url);
    std::string rspUrl1(url);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetUrl %{public}s ", rspUrl1.c_str());

    DidReceiveResponse();

    long consumed = 0;
    uint8_t buffer[blockSize];
    while (true) {
        int ret = OH_ResourceManager_ReadRawFile(rawfile, buffer, blockSize);
        OH_LOG_INFO(LOG_APP, "read rawfile %{public}d bytes.", ret);
        if (ret == 0) {
            break;
        }
        consumed += ret;
        OH_ResourceManager_SeekRawFile(rawfile, consumed, 0);
        DidReceiveData(buffer, ret);
        memset(buffer, 0, blockSize);
    }
    OH_ResourceManager_CloseRawFile(rawfile);
    DidFinish();
}

void RawfileRequest::Stop() {
    OH_LOG_INFO(LOG_APP, "stop the rawfile request.");
    stopped_ = true;
    if (response_) {
        OH_ArkWeb_DestroyResponse(response_);
    }

    OH_ArkWebResourceRequest_Destroy(resourceRequest_);

    resourceHandlerDestroy_ = OH_ArkWebResourceHandler_Destroy(resourceHandler_);

    httpBodyStreamIsEof_ = OH_ArkWebHttpBodyStream_IsEof(stream_);
    httpBodyStreamIsInMemory_ = OH_ArkWebHttpBodyStream_IsInMemory(stream_);
    httpBodyStreamIsChunked_ = OH_ArkWebHttpBodyStream_IsChunked(stream_);
    httpBodyStreamGetPosition_ = OH_ArkWebHttpBodyStream_GetPosition(stream_);
    httpBodyStreamGetSize_ = OH_ArkWebHttpBodyStream_GetSize(stream_);

    OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_IsEof %{public}d", httpBodyStreamIsEof_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_IsInMemory %{public}d", httpBodyStreamIsInMemory_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_IsChunked %{public}d", httpBodyStreamIsChunked_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_GetPosition %{public}lu", httpBodyStreamGetPosition_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebHttpBodyStream_GetSize %{public}lu", httpBodyStreamGetSize_);

    OH_ArkWebResourceRequest_DestroyHttpBodyStream(stream_);

}

void RawfileRequest::DidReceiveResponse(){
    OH_LOG_INFO(LOG_APP, "did receive response.");

    if (!stopped_) {
        // 接口覆盖
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveResponse start.");
        resourceHandlerDidReceiveResponse_ = OH_ArkWebResourceHandler_DidReceiveResponse(resourceHandler_, response_);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveResponse end %{public}d.", resourceHandlerDidReceiveResponse_);
    }
}

void RawfileRequest::DidReceiveData(const uint8_t *buffer, int64_t bufLen) {
    OH_LOG_INFO(LOG_APP, "did receive data.");

    if (!stopped_) {
        // 接口覆盖
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveData start.");
        resourceHandlerDidReceiveData_ = OH_ArkWebResourceHandler_DidReceiveData(resourceHandler_, buffer, bufLen);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveData end %{public}d.", resourceHandlerDidReceiveData_);
    }
}

void RawfileRequest::DidFinish() {
    OH_LOG_INFO(LOG_APP, "did finish.");

    if (!stopped_) {
        // 接口覆盖
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidFinish start.");
        resourceHandlerDidFinish_ = OH_ArkWebResourceHandler_DidFinish(resourceHandler_);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidFinish end %{public}d.", resourceHandlerDidFinish_);
    }
}

void RawfileRequest::DidFailWithError(ArkWeb_NetError errorCode) {
    OH_LOG_INFO(LOG_APP, "did finish with error %{public}d.", errorCode);
    if (!stopped_) {
        // 接口覆盖
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidFailWithError start.");
        resourceHandlerDidFailWithError_ = OH_ArkWebResourceHandler_DidFailWithError(resourceHandler_, errorCode);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidFailWithError end. %{public}d", resourceHandlerDidFailWithError_);
    }
}