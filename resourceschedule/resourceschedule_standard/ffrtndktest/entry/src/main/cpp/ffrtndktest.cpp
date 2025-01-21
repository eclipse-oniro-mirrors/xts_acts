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

#define FAIL (-1)
#define SUCCESS 0
#define PARAM_0 0
#define SLEEPTIME (20000 * 300)

typedef struct {
    ffrt_function_header_t header;
    ffrt_function_t func;
    ffrt_function_t after_func;
    void* arg;
} CFunction;

static void FfrtExecFunctionWrapper(void* t)
{
    CFunction* f = static_cast<CFunction*>(t);
    if (f->func) {
        f->func(f->arg);
    }
}

static void FfrtDestroyFunctionWrapper(void* t)
{
    CFunction* f = static_cast<CFunction*>(t);
    if (f->after_func) {
        f->after_func(f->arg);
    }
}

#define FFRT_STATIC_ASSERT(cond, msg) int x(int static_assertion_##msg[(cond) ? 1 : -1])
static inline ffrt_function_header_t* ffrt_create_function_wrapper(const ffrt_function_t func,
    const ffrt_function_t after_func, void* arg, ffrt_function_kind_t kind_t = ffrt_function_kind_general)
{
    FFRT_STATIC_ASSERT(sizeof(CFunction) <= ffrt_auto_managed_function_storage_size,
        size_of_function_must_be_less_than_ffrt_auto_managed_function_storage_size);
    CFunction* f = static_cast<CFunction*>(ffrt_alloc_auto_managed_function_storage_base(kind_t));
    f->header.exec = FfrtExecFunctionWrapper;
    f->header.destroy = FfrtDestroyFunctionWrapper;
    f->func = func;
    f->after_func = after_func;
    f->arg = arg;
    return reinterpret_cast<ffrt_function_header_t*>(f);
}

void OnePlusForTest(void* arg)
{
    ffrt_usleep(SLEEPTIME);
    uint64_t taskGetId = ffrt_this_task_get_id();
    (*static_cast<uint64_t*>(arg)) = taskGetId;
}

void OnePlusForTestQos(void* arg)
{
    ffrt_usleep(SLEEPTIME);
    int qosVal = ffrt_this_task_update_qos(static_cast<ffrt_qos_t>(ffrt_qos_utility));
    (*static_cast<int*>(arg)) = qosVal;
}

static napi_value FfrtThisTaskGetId(napi_env env, napi_callback_info info)
{
    ffrt_queue_attr_t queue_attr;
    ffrt_queue_t queue_handle;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<ffrt_qos_t>(ffrt_qos_background));
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    uint64_t pos;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(
        queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr,
                                     &pos, ffrt_function_kind_queue),
        nullptr);
    ffrt_queue_wait(handle);
    int taskId = FAIL;
    if (pos != (uint64_t)PARAM_0) {
        taskId = PARAM_0;
    }
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value result = nullptr;
    napi_create_int32(env, taskId, &result);
    return result;
}

static napi_value FfrtThisTaskUpdateQos(napi_env env, napi_callback_info info)
{
    ffrt_queue_attr_t queue_attr;
    ffrt_queue_t queue_handle;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<ffrt_qos_t>(ffrt_qos_default));
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    int pos = FAIL;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(
        queue_handle,
        ffrt_create_function_wrapper(OnePlusForTestQos, nullptr,
                                     &pos, ffrt_function_kind_queue),
        nullptr);
    ffrt_queue_wait(handle);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
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
