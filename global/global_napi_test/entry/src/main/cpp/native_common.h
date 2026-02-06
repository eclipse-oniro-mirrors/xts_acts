/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

#ifndef RESOURCE_MANAGER_ADDON_H
#define RESOURCE_MANAGER_ADDON_H

#include <memory>
#include <string>

#include "napi/native_api.h"
#include "rawfile/raw_file_manager.h"

namespace OHOS {
namespace Global {
namespace Resource {
class NdkAddon {
public:
    static napi_value Init(napi_env env, napi_value exports);

private:
    static napi_value GetResourceManager(napi_env env, napi_callback_info info);
    static napi_async_execute_callback TestRawFileExecute();
};

struct NdkAsyncContext {
    napi_async_work work_;

    std::string path_;

    typedef napi_value (*CreateNapiValue)(napi_env env, NdkAsyncContext &context);
    CreateNapiValue createValueFunc_;
    std::string value_;

    std::unique_ptr<char[]> mediaData;
    long len_;

    napi_deferred deferred_;
    napi_ref callbackRef_;

    std::string errMsg_;
    int success_;

    NativeResourceManager* ndk_;

    NdkAsyncContext() : work_(nullptr), createValueFunc_(nullptr), deferred_(nullptr),
        callbackRef_(nullptr), success_(true), ndk_(nullptr) {}

    void SetErrorMsg(const std::string &msg);
};
} // namespace Resource
} // namespace Global
} // namespace OHOS
#endif