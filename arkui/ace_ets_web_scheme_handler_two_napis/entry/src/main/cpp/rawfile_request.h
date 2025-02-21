/**
 * * Copyright (c) 2024 Huawei Device Co., Ltd.
 * * Licensed under the Apache License, Version 2.0 (the "License");
 * * you may not use this file except in compliance with the License.
 * * You may obtain a copy of the License at
 * *
 * *     http://www.apache.org/licenses/LICENSE-2.0
 * *
 * * Unless required by applicable law or agreed to in writing, software
 * * distributed under the License is distributed on an "AS IS" BASIS,
 * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * * See the License for the specific language governing permissions and
 * * limitations under the License.   */
#ifndef TESTRAWFILE_RAWFILE_REQUEST_H
#define TESTRAWFILE_RAWFILE_REQUEST_H

#include <mutex>
#include <string>

#include <rawfile/raw_file_manager.h>
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"

class RawfileRequest {
public:
    RawfileRequest(const ArkWeb_ResourceRequest *resourceRequest, const ArkWeb_ResourceHandler *resourceHandler,
    const NativeResourceManager *resourceManager);
    
    ~RawfileRequest();
    
    void Start();
    void Stop();
    void ReadRawfileDataOnWorkerThread();
    
    const ArkWeb_ResourceHandler *resourceHandler() { return resourceHandler_; }
    const ArkWeb_ResourceRequest *resourceRequest() { return resourceRequest_; }
    const NativeResourceManager *resourceManager() { return resourceManager_; }
    ArkWeb_Response *response() { return response_; }
    ArkWeb_HttpBodyStream *stream() { return stream_; } 
    const std::string rawfilePath() { return rawfilePath_; }
    
    void DidReceiveResponse();
    void DidReceiveData(const uint8_t *buffer, int64_t bufLen);
    void DidFinish();
    void DidFailWithError(ArkWeb_NetError errorCode);
    
    bool httpBodyStreamIsEof() { return httpBodyStreamIsEof_; }
    bool httpBodyStreamIsInMemory() { return httpBodyStreamIsInMemory_; }
    bool httpBodyStreamIsChunked() { return httpBodyStreamIsChunked_; }
    uint64_t httpBodyStreamGetPosition() { return httpBodyStreamGetPosition_; }
    uint64_t httpBodyStreamGetSize() { return httpBodyStreamGetSize_; }
    int32_t httpBodyStreamInit() { return httpBodyStreamInit_; }
    int32_t httpBodyStreamSetUserData() { return httpBodyStreamSetUserData_; }
    int32_t httpBodyStreamSetReadCallback() { return httpBodyStreamSetReadCallback_;}
    int32_t resourceHandlerDestroy() { return resourceHandlerDestroy_; }
    int32_t resourceHandlerDidReceiveResponse() { return resourceHandlerDidReceiveResponse_; }
    int32_t resourceHandlerDidReceiveData() { return resourceHandlerDidReceiveData_; }
    int32_t resourceHandlerDidFinish() { return resourceHandlerDidFinish_; }
    int32_t resourceHandlerDidFailWithError() { return resourceHandlerDidFailWithError_; }
    
private:
    const ArkWeb_ResourceRequest *resourceRequest_{nullptr};
    const ArkWeb_ResourceHandler *resourceHandler_{nullptr};
    const NativeResourceManager *resourceManager_{nullptr};
    ArkWeb_Response *response_;
    bool stopped_{false};
    std::string rawfilePath_;
    ArkWeb_HttpBodyStream *stream_{nullptr};
    std::mutex mutex_;
    bool httpBodyStreamIsEof_{true};
    bool httpBodyStreamIsInMemory_{true};
    bool httpBodyStreamIsChunked_{true};
    uint64_t httpBodyStreamGetPosition_;
    uint64_t httpBodyStreamGetSize_;
    int32_t httpBodyStreamInit_;
    int32_t httpBodyStreamSetUserData_;
    int32_t httpBodyStreamSetReadCallback_;
    
    int32_t resourceHandlerDestroy_{-1};
    int32_t resourceHandlerDidReceiveResponse_{-1};
    int32_t resourceHandlerDidReceiveData_{-1};
    int32_t resourceHandlerDidFinish_{-1};
    int32_t resourceHandlerDidFailWithError_{-1};
};
#endif //TESTRAWFILE_RAWFILE_REQUEST_H