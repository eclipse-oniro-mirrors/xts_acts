/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <c/queue.h>
#include <c/sleep.h>
#include <c/task.h>
#include <ffrt.h>
#define FAIL (-1)
#define SUCCESS 0
#define PARAM_100 100

inline void OnePlusForTest(void* arg)
{
    *(uint64_t*)arg = ffrt_this_task_get_id();
}

inline void OnePlusForTestQos(void* arg)
{
    *(int*)arg = ffrt_this_task_update_qos(ffrt_qos_background);
    *(int*)arg += PARAM_100;
}
template<class T>
struct function {
    ffrt_function_header_t header;
    T closure;
};

template<class T>
void exec_function_wrapper(void* t)
{
    auto f = reinterpret_cast<function<std::decay_t<T>>*>(t);
    f->closure();
}

template<class T>
void destroy_function_wrapper(void* t)
{
    auto f = reinterpret_cast<function<std::decay_t<T>>*>(t);
    f->closure = nullptr;
}
template<class T>
inline ffrt_function_header_t* create_function_wrapper(T&& func,
    ffrt_function_kind_t kind = ffrt_function_kind_general)
{
    using function_type = function<std::decay_t<T>>;

    auto p = ffrt_alloc_auto_managed_function_storage_base(kind);
    auto f = new (p)function_type;
    f->header.exec = exec_function_wrapper<T>;
    f->header.destroy = destroy_function_wrapper<T>;
    f->closure = std::forward<T>(func);
    return reinterpret_cast<ffrt_function_header_t*>(f);
}
static napi_value FfrtThisTaskGetId(napi_env env, napi_callback_info info)
{
    uint64_t taskId = SUCCESS;
    std::function<void()>&& GetPidFunc = [&taskId]() { OnePlusForTest((void *)(&taskId)); };
    ffrt_submit_base(create_function_wrapper(GetPidFunc), nullptr, nullptr, nullptr);
    ffrt_wait();
    napi_value result = nullptr;
    napi_create_int32(env, taskId != SUCCESS, &result);
    return result;
}

static napi_value FfrtThisTaskUpdateQos(napi_env env, napi_callback_info info)
{
    int pos = FAIL;
    std::function<void()>&& UpdateQosFunc = [&pos]() { OnePlusForTestQos((void *)(&pos)); };
    ffrt_submit_base(create_function_wrapper(UpdateQosFunc), nullptr, nullptr, nullptr);
    ffrt_wait();
    napi_value result = nullptr;
    napi_create_int32(env, pos, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"ffrtThisTaskGetId", nullptr, FfrtThisTaskGetId, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ffrtThisTaskUpdateQos", nullptr, FfrtThisTaskUpdateQos, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ffrtndk1test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
	
extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
