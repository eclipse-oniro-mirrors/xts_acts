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
 
#ifndef RDB_JS_NAPI_ASYNC_CALL_H
#define RDB_JS_NAPI_ASYNC_CALL_H
 
#include <atomic>
#include <functional>
#include <memory>
#include "napi/native_api.h"
 
namespace NdkTest {
using OutputAction = std::function<void(napi_env, napi_value &)>;
using ExecuteAction = std::function<int()>;
 
class ContextBase {
public:
    void SetAction(napi_env env, napi_callback_info info, ExecuteAction exec, OutputAction output);
    virtual ~ContextBase();
 
    napi_env env_ = nullptr;
    const char *fun = nullptr;
 
    napi_ref self_ = nullptr;
    napi_deferred defer_ = nullptr;
    napi_async_work work_ = nullptr;
 
    int execCode_ = 0;
    OutputAction output_ = nullptr;
    ExecuteAction exec_ = nullptr;
    napi_value result_ = nullptr;
    std::shared_ptr<ContextBase> keep_;
};
 
class AsyncCall final {
public:
    static napi_value Async(napi_env env, std::shared_ptr<ContextBase> context);
 
private:
    static void OnExecute(napi_env env, void *data);
    static void OnComplete(napi_env env, napi_status status, void *data);
};
} // namespace NdkTest
#endif