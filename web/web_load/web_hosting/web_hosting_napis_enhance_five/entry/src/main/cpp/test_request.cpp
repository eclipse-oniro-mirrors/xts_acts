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

#include <bits/alltypes.h>
#include <hilog/log.h>
#include "test_request.h"

#undef LOG_DOMAIN

#undef LOG_TAG

#define LOG_DOMAIN 0x0000

#define LOG_TAG "webtest"

namespace {
    const int blockSize = 1024 * 8;
    const int SUCCESS = 200;
    const int NET_NOT_FOUND = 404;

    int ReadRawfileOnWorkerThread(void *userData) {
        TestRequest* testRequest = (TestRequest *)userData;
        if (testRequest) {
            testRequest->ReadRawfileDataOnWorkerThread();
        }
        return 0;
    }
}

TestRequest::TestRequest(const ArkWeb_ResourceRequest *resourceRequest, const ArkWeb_ResourceHandler *resourceHandler,
                         const NativeResourceManager *resourceManager)
    : resourceRequest_(resourceRequest), resourceHandler_(resourceHandler), resourceManager_(resourceManager) {}

TestRequest::~TestRequest() {}

void TestRequest::ReadRawfileDataOnWorkerThread()
{
    RawFile *rawfile = OH_ResourceManager_OpenRawFile(resourceManager(), rawfilePath().c_str());
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod rawfilePath_ %{public}s", rawfilePath().c_str());

    setRspUrl_ = OH_ArkWebResponse_SetUrl(response(), "");
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetUrl %{public}d", setRspUrl_);

    setRspError_ = OH_ArkWebResponse_SetError(response(), ARKWEB_NET_OK);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetError %{public}d", setRspError_);

    if (!rawfile) {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod rawfilePath_ 404");
        setStatus_ = OH_ArkWebResponse_SetStatus(response(), NET_NOT_FOUND);
        setStatusText_ = OH_ArkWebResponse_SetStatusText(response(), "not found");
    }
    else {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod rawfilePath_ 200");
        setStatus_ = OH_ArkWebResponse_SetStatus(response(), SUCCESS);
        setStatusText_ = OH_ArkWebResponse_SetStatusText(response(), "ok");
    }
    setMimeType_ = OH_ArkWebResponse_SetMimeType(response(), "text/javascript");
    setCharset_ = OH_ArkWebResponse_SetCharset(response(), "UTF-8");
    long len = OH_ResourceManager_GetRawFileSize(rawfile);

    setHeaderByName_ = OH_ArkWebResponse_SetHeaderByName(response(), "content-length", std::to_string(len).c_str(), false);

    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_SetHeaderByName %{public}s", std::to_string(len).c_str());

    // 返回响应头
    int32_t ret = OH_ArkWebResourceHandler_DidReceiveResponse(resourceHandler(), response());
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveResponse %{public}d", ret);
    
    // 下面要返回响应体
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
        int is_success = OH_ArkWebResourceHandler_DidReceiveData(resourceHandler(), buffer, ret);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceHandler_DidReceiveData. %{public}d", is_success);
        
        memset(buffer, 0, blockSize);
    }
    // 关闭资源。
    OH_ResourceManager_CloseRawFile(rawfile);
    OH_ArkWebResourceHandler_DidFinish(resourceHandler());
    
    //
    char *url;
    OH_ArkWebResponse_GetUrl(response(), &url);
    std::string rspUrl1(url);
    rspUrl_ = rspUrl1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetUrl %{public}d", *url);
    
    int32_t netError1 = OH_ArkWebResponse_GetError(response());
    rspNetError_ = netError1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetError %{public}d", netError1);
    
    int32_t Status = OH_ArkWebResponse_GetStatus(response());
    rspStatus_ = Status;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetStatus %{public}d", Status);
    
    char *statusText;
    OH_ArkWebResponse_GetStatusText(response(), &statusText);
    std::string rspStatusText1(statusText);
    rspStatusText_ = rspStatusText1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetStatusText %{public}d", *statusText);
    
    char *mimeType;
    OH_ArkWebResponse_GetMimeType(response(), &mimeType);
    std::string rspMimeType1(mimeType);
    rspMimeType_ = rspMimeType1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetMimeType %{public}d", *mimeType);
    
    char *charset;
    OH_ArkWebResponse_GetCharset(response(), &charset);
    std::string rspCharSet1(charset);
    rspCharSet_ = rspCharSet1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetCharset %{public}d", *charset);
    
    char *host;
    OH_ArkWebResponse_GetHeaderByName(response(), "Host", &host);
    std::string rspHost1(host);
    rspHost_ = rspHost1;
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResponse_GetHeaderByName %{public}d", *host);
}

void TestRequest::Start()
{
    char *url;
    OH_ArkWebResourceRequest_GetUrl(resourceRequest_, &url);
    
    std::string urlStr1(url);
    url_ = urlStr1;
    
    // 获取一个rawfile
    std::string urlStr(url);
    std::size_t position = urlStr.rfind('/');
    
    if (position != std::string::npos) {
        rawfilePath_ = urlStr.substr(position + 1);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod position != std::string::npos %{public}s", urlStr.c_str());
    }
    
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetUrl %{public}x", *url);
    OH_ArkWeb_ReleaseString(url);
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_ReleaseString %{public}x", *url);
    
    rspResourceType_ = OH_ArkWebResourceRequest_GetResourceType(resourceRequest_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetResourceType %{public}d", rspResourceType_);
    
    char *frameUrl;
    OH_ArkWebResourceRequest_GetFrameUrl(resourceRequest_, &frameUrl);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetFrameUrl %{public}x", *frameUrl);
    std::string frameUrl1(frameUrl);
    rspFrameUrl_ = frameUrl1;

    
    char *method;
    OH_ArkWebResourceRequest_GetMethod(resourceRequest_, &method);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod %{public}x", *method);
    std::string method1(method);
    method_ = method1;
    
    char *referrer;
    OH_ArkWebResourceRequest_GetReferrer(resourceRequest_, &referrer);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetReferrer %{public}x", *referrer);
    std::string referrer1(referrer);
    referrer_ = referrer1;
    
    hasGesture_ = OH_ArkWebResourceRequest_HasGesture(resourceRequest_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_HasGesture %{public}d", hasGesture_);
    
    isMainFrame_ = OH_ArkWebResourceRequest_IsMainFrame(resourceRequest_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_IsMainFrame %{public}d", isMainFrame_);
    
    isRedirect_ = OH_ArkWebResourceRequest_IsRedirect(resourceRequest_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_IsRedirect %{public}d", isRedirect_);
    
    ArkWeb_RequestHeaderList* headerList;
    
    OH_ArkWebResourceRequest_GetRequestHeaders(resourceRequest_, &headerList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetRequestHeaders ");
    
    int32_t headerListSize = OH_ArkWebRequestHeaderList_GetSize(headerList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebRequestHeaderList_GetSize %{public}d", headerListSize);
    header_size_ = headerListSize;
    
    for (int i = 0; i < headerListSize; i++) {
        char *key;
        char *value;
        OH_ArkWebRequestHeaderList_GetHeader(headerList, i, &key, &value);
        OH_LOG_INFO(LOG_APP, "OH_ArkWebRequestHeaderList_GetHeader key: %{public}s value: %{public}s.", key, value);
        hasHeader_ = true;
    }
    
    OH_ArkWebRequestHeaderList_Destroy(headerList);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebRequestHeaderList_Destroy Start");
    
    headerList = nullptr;
    int32_t headerListSize1 = OH_ArkWebRequestHeaderList_GetSize(headerList);
    if (headerListSize1 <= 0) {
        isHeaderDestroy_ = true;
    }
    OH_LOG_INFO(LOG_APP, "OH_ArkWebRequestHeaderList_Destroy %{public}d", isHeaderDestroy_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebRequestHeaderList_Destroy %{public}d", headerListSize1);    
    
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod rawfilePath_ %{public}s", urlStr.c_str()); 
    
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetMethod rawfilePath_ %{public}s", rawfilePath_.c_str()); 
    
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_CreateResponse before %{public}p", response_); 
    OH_ArkWeb_CreateResponse(&response_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_CreateResponse after %{public}p", response_); 
    
    OH_ArkWebResourceRequest_GetHttpBodyStream(resourceRequest(), &stream_);
    isGetBodyStream_ = true;
    
    if (stream_) {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetHttpBodyStream true");
    } else {
        OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_GetHttpBodyStream true");
    }
    
    ReadRawfileOnWorkerThread(reinterpret_cast<void*>(this));
}

void TestRequest::Stop()
{
    // 销毁ArkWeb_ResourceRequest对象。
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_Destroy start");
    resourceRequestDestroy_ = OH_ArkWebResourceRequest_Destroy(resourceRequest_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWebResourceRequest_Destroy end %{public}d", resourceRequestDestroy_);
    
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_DestroyResponse Before %{public}p", response_);
    OH_ArkWeb_DestroyResponse(response_);
    response_ = nullptr;
    int afterStatus = OH_ArkWebResponse_GetStatus(response_);
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_DestroyResponse afterStatus %{public}d", afterStatus);
    OH_LOG_INFO(LOG_APP, "OH_ArkWeb_DestroyResponse After %{public}p", response_);
}
