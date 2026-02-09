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
 
#include "napi_async_call.h"
#include "js_native_api_types.h"
namespace NdkTest {
void ContextBase::SetAction(
    napi_env env, napi_callback_info info, ExecuteAction exec, OutputAction output)
{
    env_ = env;
    napi_value self = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, &self, nullptr);
    output_ = std::move(output);
    exec_ = std::move(exec);
    napi_create_reference(env, self, 1, &self_);
}
 
ContextBase::~ContextBase()
{
    if (env_ == nullptr) {
        return;
    }
    if (work_ != nullptr) {
        napi_delete_async_work(env_, work_);
        work_ = nullptr;
    }
    napi_delete_reference(env_, self_);
    env_ = nullptr;
}
 
napi_value AsyncCall::Async(napi_env env, std::shared_ptr<ContextBase> context)
{
    napi_value promise = nullptr;
    napi_create_promise(env, &context->defer_, &promise);
    context->keep_ = context;
    napi_value resource = nullptr;
    napi_create_string_utf8(env, "NdkTest", NAPI_AUTO_LENGTH, &resource);
    napi_create_async_work(env, nullptr, resource, AsyncCall::OnExecute, AsyncCall::OnComplete,
        reinterpret_cast<void *>(context.get()), &context->work_);
    auto status = napi_queue_async_work_with_qos(env, context->work_, napi_qos_user_initiated);
    if (status != napi_ok) {
        napi_get_undefined(env, &promise);
        napi_reject_deferred(env, context->defer_, promise);
    }
    return promise;
}
 
void AsyncCall::OnExecute(napi_env env, void *data)
{
    ContextBase *context = reinterpret_cast<ContextBase *>(data);
    if (context == nullptr || context->exec_ == nullptr) {
        return;
    }
    context->execCode_ = context->exec_();
    context->exec_ = nullptr;
}
 
void AsyncCall::OnComplete(napi_env env, napi_status status, void *data)
{
    ContextBase *context = reinterpret_cast<ContextBase *>(data);
    if (context == nullptr || context->output_ == nullptr) {
        return;
    }
    context->output_(env, context->result_);
    context->output_ = nullptr;
    napi_resolve_deferred(env, context->defer_, context->result_);
    context->keep_.reset();
}
}