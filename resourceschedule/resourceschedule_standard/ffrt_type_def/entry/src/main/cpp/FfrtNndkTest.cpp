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

#include <cstdio>
#include <ffrt/fiber.h>
#include "napi/native_api.h"
#include "ffrt/shared_mutex.h"
#include "ffrt/task.h"
#include "ffrt/type_def.h"
#include "ffrt/condition_variable.h"
#include "ffrt/mutex.h"
#include "ffrt/queue.h"
#include "ffrt/sleep.h"
#include "ffrt/loop.h"
#include "ffrt/timer.h"
#include "fiber_utils.h"

const int ERR_CODE_1 = 1;
const int ERR_CODE_2 = 2;
const int ERR_CODE_3 = 3;

void ForffrtFiberInitTest(void* arg)
{
    (*static_cast<int*>(arg)) += 1;
}

typedef struct {
    ffrt_cond_t* cond;
    int* a;
    int* b;
    ffrt_mutex_t* lock_;
    int* dur;
    int* ret;
} CvMutex;

void FuncWait1(void* arg)
{
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = ERR_CODE_1;
    }
    
    while (*t->a != 1) {
        ret = ffrt_cond_wait(t->cond, t->lock_);
        if (ret != ffrt_success) {
            *t->ret = ERR_CODE_2;
        }
    }
    *t->b += 1;
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = ERR_CODE_3;
    }
}

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

template<class T>
struct Function {
    ffrt_function_header_t header;
    T closure;
};

template<class T>
void ExecFunctionWrapper(void* t)
{
    auto f = reinterpret_cast<Function<std::decay_t<T>>*>(t);
    f->closure();
}

template<class T>
void DestroyFunctionWrapper(void* t)
{
    auto f = reinterpret_cast<Function<std::decay_t<T>>*>(t);
    f->closure = nullptr;
}

template<class T>
static inline ffrt_function_header_t* create_function_wrapper(T&& func,
    ffrt_function_kind_t kind = ffrt_function_kind_general)
{
    using function_type = Function<std::decay_t<T>>;
    auto p = ffrt_alloc_auto_managed_function_storage_base(kind);
    auto f = new (p)function_type;
    f->header.exec = ExecFunctionWrapper<T>;
    f->header.destroy = DestroyFunctionWrapper<T>;
    f->closure = std::forward<T>(func);
    return reinterpret_cast<ffrt_function_header_t*>(f);
}

static napi_value ffrt_fiber_initTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_fiber_t* fiber;
    size_t size = 0;
    int result = ffrt_fiber_init(fiber, ForffrtFiberInitTest, nullptr, nullptr, size);
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_rwlockattr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_rwlock_t* rwlock;
    ffrt_rwlockattr_t attr;
    int result = ffrt_rwlock_init(rwlock, &attr);
    napi_create_int32(env, result == (ffrt_error || ffrt_error_nomem || ffrt_error_timedout) ? 1 : 0, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_reserveTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_cond_t cond;
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    std::function<void()>&& ffrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrtFunc1Wrapper = create_function_wrapper((ffrtFunc1));
    ffrtFunc1Wrapper->reserve[0] = ffrtFunc1Wrapper->reserve[1];
    int result = ffrtFunc1Wrapper->reserve[0] == ffrtFunc1Wrapper->reserve[1] ? 1 : 0;
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_task_attr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    int a = 0;
    ffrt_task_attr_t task_attr;
    task_attr.storage[0] = ffrt_task_attr_storage_size;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 1);
    int result = ffrt_task_attr_get_delay(&task_attr);
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_queue_attr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_queue_attr_t queue_attr;
    queue_attr.storage[0] = ffrt_queue_attr_storage_size;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_max, "test_queue", &queue_attr);
    int result = queue_handle == nullptr ? 0 :1;
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_condattr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_cond_t cond;
    ffrt_condattr_t attr;
    attr.storage = ffrt_cond_storage_size;
    cond.storage[0] = ffrt_fiber_storage_size;
    int result = ffrt_cond_init(&cond, &attr);
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_mutexattr_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_mutexattr_t attr;
    ffrt_mutex_t mtx;
    attr.storage = ffrt_mutex_storage_size;
    mtx.storage[0] = ffrt_mutex_storage_size;
    int result = ffrt_mutexattr_init(&attr);
    napi_create_int32(env, result, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_rwlockattrTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_rwlock_t rwlock;
    ffrt_rwlockattr_t attr;
    attr.storage = ffrt_auto_managed_function_storage_size;
    rwlock.storage[0] = ffrt_rwlock_storage_size;
    int result = ffrt_rwlock_init(&rwlock, &attr);
    napi_create_int32(env, result == ffrt_error_inval ? 1 : 0, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_mutex_typeTest1(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    int result = ffrt_mutexattr_settype(NULL, ffrt_mutex_normal);
    napi_create_int32(env, result == ffrt_error_inval ? 1 : 0, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_mutex_typeTest2(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    int result = ffrt_mutexattr_settype(NULL, ffrt_mutex_default);
    napi_create_int32(env, result == ffrt_error_inval ? 1 : 0, &resultEnd);
    return resultEnd;
}

static napi_value ffrt_fiber_tTest(napi_env env, napi_callback_info info)
{
    napi_value resultEnd;
    ffrt_fiber_t fiber;
    fiber.storage[0] = ffrt_fiber_storage_size;
    size_t size = 0;
    int result = ffrt_fiber_init(&fiber, ForffrtFiberInitTest, nullptr, nullptr, size);
    napi_create_int32(env, result == ffrt_error_inval ? 1 : 0, &resultEnd);
    return resultEnd;
}

napi_property_descriptor desc[] = {
    {"ffrt_fiber_initTest", nullptr, ffrt_fiber_initTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ffrt_rwlockattr_tTest", nullptr, ffrt_rwlockattr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ffrt_reserveTest", nullptr, ffrt_reserveTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_task_attr_tTest", nullptr, ffrt_task_attr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_queue_attr_tTest", nullptr, ffrt_queue_attr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_condattr_tTest", nullptr, ffrt_condattr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_mutexattr_tTest", nullptr, ffrt_mutexattr_tTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_rwlockattrTest", nullptr, ffrt_rwlockattrTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_mutex_typeTest1", nullptr, ffrt_mutex_typeTest1, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_mutex_typeTest2", nullptr, ffrt_mutex_typeTest2, nullptr, nullptr, nullptr, napi_default, nullptr },
    {"ffrt_fiber_tTest", nullptr, ffrt_fiber_tTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
