/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *
 * http://www.apache.org/licenses/LICENSE-2.0
 * *
 * * Unless required by applicable law or agreed to in writing, software
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
#include <thread>
#include <string>

#undef LOG_TAG
#define LOG_TAG "ss-handler"


namespace {


uint8_t g_buffer[1024];
cnd_t g_httpBodyCnd;
mtx_t g_httpBodyMtx;
uint8_t* g_readBuffer;

int32_t g_setAsyncReadCallback = -1;
int32_t g_asyncRead = -1;
int32_t g_asyncReadMore = -1;
int32_t g_asyncReadCallback = -1;

int g_workerPid = -1;
int g_asyncPid = -1;
bool g_httpBodyStreamNullptr = false;
int g_bufLen = 10;

// HttpBodyStream的读回调。
void ReadCallback(const ArkWeb_HttpBodyStream  *httpBodyStream, uint8_t* bufferData, int bytesRead)
{
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_asyncPid = static_cast<int>(hashValue);
    OH_LOG_INFO(LOG_APP, "ReadCallback async thread id :%{public}d", g_asyncPid);
    OH_LOG_INFO(LOG_APP, "ReadCallback read http body back.");
    OH_LOG_INFO(LOG_APP, "ReadCallback data :%{public}s", (char *)bufferData);
    g_readBuffer = bufferData;
    g_asyncReadCallback = 1;
    OH_LOG_INFO(LOG_APP, "ReadCallback g_asyncReadCallback :%{public}d", g_asyncReadCallback);
    const int bufferLength = 10;
    bool isEof = OH_ArkWebHttpBodyStream_IsEof(httpBodyStream);
    if (!isEof && bytesRead != 0) {
        std::fill_n(bufferData, bufferLength, 0);
        OH_LOG_INFO(LOG_APP, "ReadCallback OH_ArkWebHttpBodyStream_AsyncRead start");
        OH_ArkWebHttpBodyStream_AsyncRead(httpBodyStream, bufferData, bufferLength);
        g_asyncReadMore = 1;
        OH_LOG_INFO(LOG_APP, "ReadCallback g_asyncReadMore :%{public}d", g_asyncReadMore);
        OH_LOG_INFO(LOG_APP, "ReadCallback OH_ArkWebHttpBodyStream_AsyncRead end");
    } else {
        OH_LOG_INFO(LOG_APP, "ReadCallback RawfileRequest OH_ArkWebHttpBodyStream_GetUserData");
        RawfileRequest *rawfileRequest = (RawfileRequest *)OH_ArkWebHttpBodyStream_GetUserData(httpBodyStream);
        if (rawfileRequest) {
            OH_LOG_INFO(LOG_APP, "ReadCallback RawfileRequest ReadDataOnWorkerThread start");
            rawfileRequest->ReadDataOnWorkerThread();
            cnd_signal(&g_httpBodyCnd);
        }
    }
}

int ReadHttpBodyOnWorkerThread(void* userData)
{
    const int bufferLength = 10;
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread start.");
    std::size_t hashValue = std::hash<std::thread::id>()(std::this_thread::get_id());
    g_workerPid = static_cast<int>(hashValue);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread thread id :%{public}d", g_workerPid);
    std::fill_n(g_buffer, bufferLength, 0);
    ArkWeb_HttpBodyStream *httpBodyStream = (ArkWeb_HttpBodyStream *)userData;

    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread g_httpBodyStreamNullptr :%{public}d", g_httpBodyStreamNullptr);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread g_bufLen :%{public}d", g_bufLen);
    if (g_httpBodyStreamNullptr) {
        OH_ArkWebHttpBodyStream_AsyncRead(nullptr, g_buffer, bufferLength);
    } else {
        OH_ArkWebHttpBodyStream_AsyncRead(httpBodyStream, g_buffer, g_bufLen);
    }
    g_asyncRead = 1;
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread g_asyncRead :%{public}d", g_asyncRead);
    OH_LOG_INFO(LOG_APP, "ReadHttpBodyOnWorkerThread OH_ArkWebHttpBodyStream_AsyncRead end");
    if (cnd_init(&g_httpBodyCnd) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "Failed to initialize condition variable httpBodyCnd");
        return -1;
    }
    if (mtx_init(&g_httpBodyMtx, mtx_plain) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "Failed to initialize mutex httpBodyMtx");
        return -1;
    }
    if (cnd_wait(&g_httpBodyCnd, &g_httpBodyMtx) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "Failed to initialize cnd_wait httpBodyCnd httpBodyMtx");
        return -1;
    }
    return 0;
}

int ReadRawfileOnWorkerThread(void* userData)
{
    OH_LOG_INFO(LOG_APP, "ReadRawfileOnWorkerThread start.");
    RawfileRequest* rawfileRequest = (RawfileRequest *)userData;
    if (rawfileRequest) {
        rawfileRequest->ReadRawfileThread();
    }
    return 0;
}

// ArkWeb_HttpBodyStream的初始化回调。
void InitCallback(const ArkWeb_HttpBodyStream *httpBodyStream, ArkWeb_NetError result)
{
    OH_LOG_INFO(LOG_APP, "init http body stream done %{public}d.", result);
    bool isChunked = OH_ArkWebHttpBodyStream_IsChunked(httpBodyStream);
    OH_LOG_INFO(LOG_APP, "http body stream is chunked %{public}d.", isChunked);
    thrd_t th;
    if (thrd_create(&th, ReadHttpBodyOnWorkerThread, (void *)httpBodyStream) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "create thread failed.");
        return;
    }

    if (thrd_detach(th) != thrd_success) {
        OH_LOG_ERROR(LOG_APP, "detach thread failed.");
    }
}

const int BLOCK_SIZE = 1024 * 8;


}  // namespace

RawfileRequest::RawfileRequest(const ArkWeb_ResourceRequest *resourceRequest,
                               const ArkWeb_ResourceHandler *resourceHandler,
                               const NativeResourceManager* resourceManager)
    : resourceRequest_(resourceRequest),
    resourceHandler_(resourceHandler),
    resourceManager_(resourceManager) {}


RawfileRequest::~RawfileRequest() {}

int RawfileRequest::SetAsyncReadCallback()
{
    return g_setAsyncReadCallback;
}

int RawfileRequest::AsyncRead()
{
    return g_asyncRead;
}

int RawfileRequest::AsyncReadMore()
{
    return g_asyncReadMore;
}

int RawfileRequest::AsyncReadCallback()
{
    return g_asyncReadCallback;
}

std::string RawfileRequest::ReadBufferValue()
{
    if (g_readBuffer) {
        return std::string(reinterpret_cast<char *>(g_readBuffer));
    }
    return "";
}

int RawfileRequest::ThreadIdEqual()
{
    if (g_workerPid == g_asyncPid) {
        return -1;
    }
    return 1;
}

void RawfileRequest::Start()
{
    OH_LOG_INFO(LOG_APP, "RawfileRequest start a rawfile request.");
    g_setAsyncReadCallback = -1;
    g_asyncRead = -1;
    g_asyncReadMore = -1;
    g_asyncReadCallback = -1;
    g_readBuffer = nullptr;
    g_workerPid = -1;
    g_asyncPid = -1;
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  httpBodyStreamNullptr_ :%{public}d", httpBodyStreamNullptr_);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  bufLen :%{public}d", bufLen_);
    g_httpBodyStreamNullptr = httpBodyStreamNullptr_;
    g_bufLen = bufLen_;
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  g_httpBodyStreamNullptr :%{public}d", g_httpBodyStreamNullptr);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  g_bufLen :%{public}d", g_bufLen);

    char* url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest_, &url);
    std::string urlStr(url);
    std::size_t position = urlStr.rfind('/');
    if (position != std::string::npos) {
        rawfilePath_ = urlStr.substr(position + 1);
    }
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  url :%{public}s", url);
    OH_LOG_INFO(LOG_APP, "RawfileRequest Start  rawfilePath_ :%{public}s", rawfilePath_.c_str());
    OH_ArkWeb_ReleaseString(url);

    OH_ArkWeb_CreateResponse(&response_);
    OH_ArkWebResourceRequest_GetHttpBodyStream(resourceRequest(), &stream_);
    if (stream_) {
        OH_LOG_ERROR(LOG_APP, "RawfileRequest Start have http body stream");
        OH_ArkWebHttpBodyStream_SetUserData(stream_, this);
        ArkWeb_HttpBodyStreamAsyncReadCallback httpBodyStreamAsyncReadCallback = ReadCallback;
        OH_ArkWebHttpBodyStream_SetAsyncReadCallback(stream_, httpBodyStreamAsyncReadCallback);
        g_setAsyncReadCallback = 1;
        OH_LOG_INFO(LOG_APP, "RawfileRequest Start  g_setAsyncReadCallback :%{public}d", g_setAsyncReadCallback);
        OH_LOG_INFO(LOG_APP, "RawfileRequest Start OH_ArkWebHttpBodyStream_SetAsyncReadCallback end");
        OH_ArkWebHttpBodyStream_Init(stream_, InitCallback);
    } else {
        OH_LOG_ERROR(LOG_APP, "RawfileRequest ReadRawfileOnWorkerThread start.");
        thrd_t th;
        if (thrd_create(&th, ReadRawfileOnWorkerThread, static_cast<void*>(this)) != thrd_success) {
            OH_LOG_ERROR(LOG_APP, "RawfileRequest Start ReadRawfileOnWorkerThread create thread failed.");
            return;
        }

        if (thrd_detach(th) != thrd_success) {
            OH_LOG_ERROR(LOG_APP, "RawfileRequest Start detach thread failed.");
        }
    }
}

// 在worker线程中读取rawfile，并通过ResourceHandler返回给Web内核。
void RawfileRequest::ReadDataOnWorkerThread()
{
    const int httpOk = 200;
    OH_LOG_INFO(LOG_APP, "ReadDataOnWorkerThread read rawfile in worker thread.");
    OH_ArkWebResponse_SetError(response(), ARKWEB_NET_OK);
    OH_ArkWebResponse_SetStatus(response(), httpOk);
    OH_ArkWebResponse_SetCharset(response(), "UTF-8");
    OH_ArkWebResponse_SetMimeType(response(), "text/html");
    DidReceiveResponse();
    const int dataSize = 100;
    DidReceiveData(g_readBuffer, dataSize);
    DidFinish();
}

const struct UrlInfo {
    std::string resource;
    std::string mimeType;
} URL_INFOS[] = {
    {"test.html", "text/html"},
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
    {"xhr", "application/json"}
};

// 在worker线程中读取rawfile，并通过ResourceHandler返回给Web内核。
void RawfileRequest::ReadRawfileThread()
{
    OH_LOG_INFO(LOG_APP, "ReadRawfileThread read rawfile in worker thread.");

    if (!resourceManager()) {
        OH_LOG_ERROR(LOG_APP, "read rawfile error, resource manager is nullptr.");
        return;
    }

    RawFile *rawfile = OH_ResourceManager_OpenRawFile(resourceManager(), rawfilePath().c_str());
    if (!rawfile) {
        OH_LOG_INFO(LOG_APP, "ReadRawfileThread OH_ArkWebResponse_SetStatus 404.");
        const int httpNotFound = 404;
        OH_ArkWebResponse_SetStatus(response(), httpNotFound);
    } else {
        OH_LOG_INFO(LOG_APP, "ReadRawfileThread OH_ArkWebResponse_SetStatus 200.");
        const int httpOk = 200;
        OH_ArkWebResponse_SetStatus(response(), httpOk);
    }

    for (auto &urlInfo : URL_INFOS) {
        if (urlInfo.resource == rawfilePath()) {
            OH_ArkWebResponse_SetMimeType(response(), urlInfo.mimeType.c_str());
            break;
        }
    }
    OH_ArkWebResponse_SetCharset(response(), "UTF-8");

    long len = OH_ResourceManager_GetRawFileSize(rawfile);
    OH_ArkWebResponse_SetHeaderByName(response(), "content-length", std::to_string(len).c_str(), false);
    DidReceiveResponse();

    long consumed = 0;
    uint8_t buffer[BLOCK_SIZE];
    while (consumed < len) {
        int ret = OH_ResourceManager_ReadRawFile(rawfile, buffer, BLOCK_SIZE);
        OH_LOG_INFO(LOG_APP, "read rawfile %{public}d bytes.", ret);
        if (ret == 0) {
            break;
        }
        consumed += ret;
        OH_ResourceManager_SeekRawFile(rawfile, consumed, 0);
        DidReceiveData(buffer, ret);
        std::fill_n(buffer, BLOCK_SIZE, 0);
    }

    OH_ResourceManager_CloseRawFile(rawfile);
    DidFinish();
}

void RawfileRequest::Stop()
{
    OH_LOG_INFO(LOG_APP, "stop the rawfile request.");
    std::lock_guard<std::mutex> guard(mutex_);
    stopped_ = true;
    if (response_) {
        OH_ArkWeb_DestroyResponse(response_);
    }
    OH_ArkWebResourceRequest_Destroy(resourceRequest_);
    OH_ArkWebResourceHandler_Destroy(resourceHandler_);
}


void RawfileRequest::DidReceiveResponse()
{
    OH_LOG_INFO(LOG_APP, "did receive response.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidReceiveResponse(resourceHandler_, response_);
    }
}

void RawfileRequest::DidReceiveData(const uint8_t *buffer, int64_t bufLen)
{
    OH_LOG_INFO(LOG_APP, "did receive data.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidReceiveData(resourceHandler_, buffer, bufLen);
    }
}

void RawfileRequest::DidFinish()
{
    OH_LOG_INFO(LOG_APP, "did finish.");
    std::lock_guard<std::mutex> guard(mutex_);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidFinish(resourceHandler_);
    }
}

void RawfileRequest::DidFailWithError(ArkWeb_NetError errorCode)
{
    OH_LOG_INFO(LOG_APP, "did finish with error %{public}d.", errorCode);
    if (!stopped_) {
        OH_ArkWebResourceHandler_DidFailWithError(resourceHandler_, errorCode);
    }
}