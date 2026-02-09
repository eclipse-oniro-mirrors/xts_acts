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

#ifndef WEB_ERROR_CODE_WEBREQUESTTEST_H
#define WEB_ERROR_CODE_WEBREQUESTTEST_H

#include <bits/alltypes.h>
#include <mutex>
#include <string>

#include <rawfile/raw_file_manager.h>
#include "web/arkweb_scheme_handler.h"
#include "web/arkweb_net_error_list.h"

class WebRequestTest {
public:
    WebRequestTest(const ArkWeb_ResourceRequest *resourceRequest,
                   const ArkWeb_ResourceHandler *resourceHandler,
                   const NativeResourceManager* resourceManager);
    ~WebRequestTest();

    void Start();
    void Stop();
    void ReadRawfileThread();
    void ReadDataOnWorkerThread();

    const ArkWeb_ResourceHandler *resourceHandler() { return resourceHandler_; }
    const ArkWeb_ResourceRequest *resourceRequest() { return resourceRequest_; }
    const NativeResourceManager *resourceManager() { return resourceManager_; }
    ArkWeb_Response *response() { return response_; }
    ArkWeb_HttpBodyStream *stream() { return stream_; }
    const std::string RawfilePath() { return rawfilePath_; }
    int32_t GetAsyncReadCallback();
    int32_t AsyncRead();
    int32_t AsyncReadMore();
    int32_t AsyncReadCallback();
    std::string ReadBufferValue();
    int32_t ThreadIdEqual();
    bool httpBodyStreamNullptr_;
    int bufLen_;

    void DidReceiveResponse();
    void DidReceiveData(const uint8_t *buffer, int64_t bufLen);
    void DidFinish();
    void DidFailWithError(ArkWeb_NetError errorCode);
    void DidFailWithErrorV2(ArkWeb_NetError errorCode, bool completeIfNoResponse);

private:
    const ArkWeb_ResourceRequest *resourceRequest_{nullptr};
    const ArkWeb_ResourceHandler *resourceHandler_{nullptr};
    const NativeResourceManager *resourceManager_{nullptr};
    ArkWeb_Response *response_;
    bool stopped_{false};
    std::string rawfilePath_;
    ArkWeb_HttpBodyStream *stream_{nullptr};
    std::mutex mutex_;
};

#endif //WEB_ERROR_CODE_WEBREQUESTTEST_H
