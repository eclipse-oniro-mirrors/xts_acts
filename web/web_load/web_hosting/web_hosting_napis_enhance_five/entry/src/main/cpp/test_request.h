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
#ifndef ACE_ETS_WEB_NAPIS_TEST_REQUEST_H
#define ACE_ETS_WEB_NAPIS_TEST_REQUEST_H

#include <bits/alltypes.h>
#include <rawfile/raw_file_manager.h>
#include <web/arkweb_scheme_handler.h>
#include <string>


class TestRequest
{
    public:
    TestRequest(const ArkWeb_ResourceRequest* resourceRequest, const ArkWeb_ResourceHandler* resourceHandler,
                const NativeResourceManager* resourceManager);
    ~TestRequest();
    
    void Start();
    void Stop();
    void ReadRawfileDataOnWorkerThread();
    
    void DidReceiveResponse();
    void DidReceiveData(const uint8_t *buffer, int64_t bufLen);
    void DidFinish();
    void DidFailWithError(ArkWeb_NetError errorCode);
    
    const ArkWeb_ResourceHandler *resourceHandler() { return resourceHandler_; }
    const ArkWeb_ResourceRequest *resourceRequest() { return resourceRequest_; }
    const NativeResourceManager *resourceManager() { return resourceManager_; }
    ArkWeb_Response *response() { return response_; }
    ArkWeb_HttpBodyStream *stream() { return stream_; }
    const std::string rawfilePath() { return rawfilePath_; }
    const std::string url() { return url_; }
    const std::string method() { return method_; }
    const std::string referrer() { return referrer_; }
    
    bool isGetBodyStream() { return isGetBodyStream_; }
    int32_t header_size() { return header_size_; }
    bool hasHeader() { return hasHeader_; }
    bool isHeaderDestroy() { return isHeaderDestroy_; }
    bool hasGesture() { return hasGesture_; }
    bool isMainFrame() { return isMainFrame_; }
    bool isRedirect() { return isRedirect_; }
    int32_t resourceRequestDestroy() { return resourceRequestDestroy_; }
    
    const std::string rspUrl() { return rspUrl_; }
    int32_t rspNetError() { return rspNetError_; }
    int32_t rspStatus() { return rspStatus_; }
    const std::string rspStatusText() { return rspStatusText_; }
    const std::string rspMimeType() { return rspMimeType_; }
    const std::string rspCharSet() { return rspCharSet_; }
    const std::string rspHost() { return rspHost_; }
    
    int32_t setRspUrl() { return setRspUrl_; }
    int32_t setRspError() { return setRspError_; }
    int32_t setStatus() { return setStatus_; }
    int32_t setStatusText() { return setStatusText_; }
    int32_t setMimeType() { return setMimeType_; }
    int32_t setCharset() { return setCharset_; }
    int32_t setHeaderByName() { return setHeaderByName_; }
    
    int32_t rspResourceType() { return rspResourceType_; }
    const std::string rspFrameUrl() { return rspFrameUrl_; }
    
private:
    const ArkWeb_ResourceRequest* resourceRequest_{nullptr};
    const ArkWeb_ResourceHandler* resourceHandler_{nullptr};
    const NativeResourceManager* resourceManager_{nullptr};
    ArkWeb_Response* response_;
    bool stopped_{false};
    std::string rawfilePath_;
    std::string url_;
    std::string method_;
    std::string referrer_{"test"};
    ArkWeb_HttpBodyStream *stream_{nullptr};
    bool isGetBodyStream_{false};
    int32_t header_size_;
    bool hasHeader_{false};
    bool isHeaderDestroy_{false};
    bool hasGesture_{false};
    bool isMainFrame_{false};
    bool isRedirect_{false};
    int32_t resourceRequestDestroy_{-1};
    
    std::string rspUrl_{"test"};
    int32_t rspNetError_;
    int32_t rspStatus_;
    std::string rspStatusText_;
    std::string rspMimeType_;
    std::string rspCharSet_;
    std::string rspHost_{"test"};
    
    int32_t setRspUrl_{-1};
    int32_t setRspError_{-1};
    int32_t setStatus_{-1};
    int32_t setStatusText_{-1};
    int32_t setMimeType_{-1};
    int32_t setCharset_{-1};
    int32_t setHeaderByName_{-1};
    
    int32_t rspResourceType_{-100};
    std::string rspFrameUrl_{"test"};
};
    
    
#endif //ACE_ETS_WEB_NAPIS_TEST_REQUEST_H