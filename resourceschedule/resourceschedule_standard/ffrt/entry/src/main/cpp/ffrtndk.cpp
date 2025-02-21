/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "hilog/log.h"
#include "c/task.h"
#include "c/type_def.h"
#include "c/condition_variable.h"
#include "c/mutex.h"
#include "c/queue.h"
#include "c/sleep.h"
#include <mutex>
#include <thread>
#include <string>
#include <unistd.h>
#include <pthread.h>

void OnePlusForTest(void* arg)
{
    (*static_cast<int*>(arg)) += 1;
}

void MultipleForTest(void* arg)
{
    (*static_cast<int*>(arg)) *= 10;
}

void SubForTest(void* arg)
{
    (*static_cast<int*>(arg)) -= 1;
}

void OnePlusSleepForTest(void* arg)
{
    ffrt_usleep(2000 * 1000);
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
        *t->ret = 1;
    }
    
    while (*t->a != 1) {
        ret = ffrt_cond_wait(t->cond, t->lock_);
        if (ret != ffrt_success) {
            *t->ret = 2;
        }
    }
    *t->b += 1;
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncWait2(void* arg)
{
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    
    while (*t->a != 1) {
        ret = ffrt_cond_wait(t->cond, t->lock_);
        if (ret != ffrt_success) {
            *t->ret = 2;
        }
    }
    *t->b += 1;
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncWaitTimeout(void* arg)
{
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    ts.tv_sec += 1;
    
    ret = ffrt_cond_timedwait(t->cond, t->lock_, &ts);
    *t->ret = ret;
    if (ret == ffrt_success) {
        *(t->a) *= 10;
    }
    ret = ffrt_mutex_unlock(t->lock_);
}

void FuncSignal(void* arg)
{
    ffrt_usleep(30000);
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    *(t->a) = 1;
    ret = ffrt_cond_signal(t->cond);
    if (ret != ffrt_success) {
        *t->ret = 2;
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncBroadcast(void* arg)
{
    ffrt_usleep(100000);
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    *(t->a) = 1;
    ret = ffrt_cond_broadcast(t->cond);
    if (ret != ffrt_success) {
        *t->ret = 2;
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncSignalApi(void* arg)
{
    ffrt_usleep(30000);
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    *(t->a) = 1;
    ret = ffrt_cond_signal(nullptr);
    if (ret != ffrt_error_inval) {
        *t->ret = 4;
    }
    ret = ffrt_cond_signal(t->cond);
    if (ret != ffrt_success) {
        *t->ret = 2;
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncBroadcastApi(void* arg)
{
    ffrt_usleep(100000);
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    *(t->a) = 1;
    ret = ffrt_cond_broadcast(nullptr);
    if (ret != ffrt_error_inval) {
        *t->ret = 4;
    }
    ret = ffrt_cond_broadcast(t->cond);
    if (ret != ffrt_success) {
        *t->ret = 2;
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncWaitApi(void* arg)
{
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    
    ret = ffrt_cond_wait(nullptr, t->lock_);
    if (ret != ffrt_error_inval) {
        *t->ret = 4;
    }
    ret = ffrt_cond_wait(t->cond, nullptr);
    if (ret != ffrt_error_inval) {
        *t->ret = 5;
    }
    while (*t->a != 1) {
        ret = ffrt_cond_wait(t->cond, t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 2;
    }
    }
    *t->b += 1;
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
    }
}

void FuncWaitTimeoutApi(void* arg)
{
    CvMutex* t = static_cast<CvMutex*>(arg);
    int ret = ffrt_mutex_lock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 1;
    }
    timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    ts.tv_sec += *t->dur;
    
    ret = ffrt_cond_timedwait(nullptr, t->lock_, &ts);
    if (ret != ffrt_error_inval) {
        *t->ret = 4;
    }
    ret = ffrt_cond_timedwait(t->cond, nullptr, &ts);
    if (ret != ffrt_error_inval) {
        *t->ret = 5;
    }
    ret = ffrt_cond_timedwait(t->cond, t->lock_, nullptr);
    if (ret != ffrt_error_inval) {
        *t->ret = 6;
    }
    clock_gettime(CLOCK_MONOTONIC, &ts);
    ts.tv_sec += *t->dur;
    ret = ffrt_cond_timedwait(t->cond, t->lock_, &ts);
    *t->ret = ret;
    if (ret == ffrt_success) {
        *(t->a) *= 10;
    }
    ret = ffrt_mutex_unlock(t->lock_);
    if (ret != ffrt_success) {
        *t->ret = 3;
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
    template<class CT>
    Function(ffrt_function_header_t h, CT&& c) : header(h), closure(std::forward<CT>(c)) {}
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
    auto f =
        new (p)function_type({ ExecFunctionWrapper<T>, DestroyFunctionWrapper<T>, { 0 } }, std::forward<T>(func));
    return reinterpret_cast<ffrt_function_header_t*>(f);
}

static napi_value ConditionVariableTest001(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    //验证ffrt_cond_signal唤醒一个wait功能是否正确
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncSignal(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 9;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableTest002(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 验证ffrt_cond_broadcast唤醒一个wait功能是否正确
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc3 = [&t]() { FuncBroadcast(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func3 = create_function_wrapper((FfrtFunc3));
    ffrt_submit_base(ffrt_func3, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 9;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableTest003(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 验证ffrt_cond_broadcast唤醒多个wait功能是否正确
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncWait2(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc3 = [&t]() { FuncBroadcast(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func3 = create_function_wrapper((FfrtFunc3));
    ffrt_submit_base(ffrt_func3, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 2) {
        resultEnd = 9;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableTest004(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 验证ffrt_cond_signal只能唤醒一个wait功能正确
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncWait2(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc3 = [&t]() { FuncSignal(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func3 = create_function_wrapper((FfrtFunc3));
    ffrt_task_handle_t task3 = ffrt_submit_h_base(ffrt_func3, nullptr, nullptr, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task3}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    ffrt_usleep(100000);
    if (*(t.b) != 1) {
        resultEnd = 10;
    }

    ffrt_func3 = create_function_wrapper((FfrtFunc3));
    ffrt_submit_base(ffrt_func3, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 2) {
        resultEnd = 9;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }

    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    ffrt_task_handle_destroy(task3);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableApiTest001(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    //验证ffrt_cond_init接口异常参数
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(nullptr, nullptr);
    if (ret != ffrt_error_inval) {
        resultEnd = 7;
    }
    ffrt_condattr_t attr;
    ret = ffrt_cond_init(&cond, &attr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 9;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncSignal(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 10;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableApiTest002(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    //验证ffrt_cond_signal接口异常参数
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncSignalApi(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 10;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableApiTest003(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 验证ffrt_cond_broadcast接口异常参数
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWait1(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc3 = [&t]() { FuncBroadcastApi(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func3 = create_function_wrapper((FfrtFunc3));
    ffrt_submit_base(ffrt_func3, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 10;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value ConditionVariableApiTest004(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    //验证ffrt_cond_wait接口异常参数
    ffrt_cond_t cond;
    int ret = ffrt_cond_init(&cond, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 7;
    }
    
    int a = 0;
    int b = 0;
    ffrt_mutex_t lock_;
    CvMutex t = {&cond, &a, &b, &lock_, nullptr, nullptr};
    ret = ffrt_mutex_init(&lock_, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 8;
    }
    
    std::function<void()>&& FfrtFunc1 = [&t]() { FuncWaitApi(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func1 = create_function_wrapper((FfrtFunc1));
    ffrt_submit_base(ffrt_func1, nullptr, nullptr, nullptr);
    std::function<void()>&& FfrtFunc2 = [&t]() { FuncSignal(static_cast<void*>(&t)); };
    ffrt_function_header_t* ffrt_func2 = create_function_wrapper((FfrtFunc2));
    ffrt_submit_base(ffrt_func2, nullptr, nullptr, nullptr);
    ffrt_wait();
    if (*(t.b) != 1) {
        resultEnd = 10;
    }
    if (t.ret != nullptr) {
        resultEnd = *(t.ret);
    }
    ffrt_cond_destroy(&cond);
    ffrt_mutex_destroy(&lock_);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value DelayCTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // 验证delay的set和get c接口
    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 5000);

    double t;
    auto start = std::chrono::high_resolution_clock::now();
    std::function<void()>&& OnePlusFunc = [&a]() { a += 1; };
    ffrt_task_handle_t task = ffrt_submit_h_base(create_function_wrapper(OnePlusFunc), {}, {}, &task_attr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> elapsed = end-start;
    t = elapsed.count();
    if (a != 1) {
        result = 1;
    }
    if (t <= 5000 || t >= 20000) {
        result = 2;
    }

    uint64_t delay = ffrt_task_attr_get_delay(&task_attr);
    if (delay != 5000) {
        result = 3;
    }
    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value FfrtYieldC0001(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    pthread_mutex_t lock;
    int ret = (pthread_mutex_init(&lock, nullptr));
    if (ret != 0) {
        result = 1;
    }
    std::function<void()>&& func1 = [&]() {
        while (true) {
            pthread_mutex_lock(&lock);
            if (x == 1) {
                pthread_mutex_unlock(&lock);
                return;
            } else {
                pthread_mutex_unlock(&lock);
                usleep(1000);
                ffrt_yield();
            }
        }
    };
    std::function<void()>&& func2 = [&]() {
        pthread_mutex_lock(&lock);
        x++;
        pthread_mutex_unlock(&lock);
    };
    ffrt_task_handle_t task = ffrt_submit_h_base(create_function_wrapper(func1), nullptr, nullptr, nullptr);
    for (int i = 0; i < 20; i++) {
        ffrt_submit_base(create_function_wrapper(func1), nullptr, nullptr, nullptr);
    }
    ffrt_submit_base(create_function_wrapper(func2), nullptr, nullptr, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    if (x != 1) {
        result = 7;
    }
    ffrt_wait();
    if (x != 1) {
        result = 8;
    }
    ffrt_task_handle_destroy(task);
    pthread_mutex_destroy(&lock);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value MutexAbnormalParamTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_mutex_t mtx;
    ffrt_mutexattr_t attr;
    int ret = ffrt_mutex_init(NULL, &attr);
    if (ret != ffrt_error_inval) {
        result = 1;
    }
    ret = ffrt_mutex_init(&mtx, &attr);
    if (ret != ffrt_error) {
        result = 2;
    }
    ret = ffrt_mutex_init(&mtx, nullptr);
    if (ret != ffrt_success) {
        result = 3;
    }
    ret = ffrt_mutex_destroy(NULL);
    if (ret != ffrt_error_inval) {
        result = 4;
    }
    ret = ffrt_mutex_destroy(&mtx);
    if (ret != ffrt_success) {
        result = 5;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value MutexAbnormalParamTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_mutex_t mtx;
    int ret = ffrt_mutex_init(&mtx, nullptr);
    if (ret != ffrt_success) {
        result = 1;
    }
    std::function<void()>&& func = [&]() {
        ret = ffrt_mutex_lock(NULL);
        if (ret != ffrt_error_inval) {
            result = 2;
        }
        ret = ffrt_mutex_lock(&mtx);
        ret = ffrt_mutex_unlock(NULL);
        if (ret != ffrt_error_inval) {
            result = 3;
        }
        ret = ffrt_mutex_trylock(NULL);
        if (ret != ffrt_error_inval) {
            result = 4;
        }
        ret = ffrt_mutex_trylock(&mtx);   // 没抢到锁
        if (ret != ffrt_error_busy) {
            result = 5;
        }
        ret = ffrt_mutex_destroy(NULL);
        if (ret != ffrt_error_inval) {
            result = 6;
        }
        ret = ffrt_mutex_unlock(&mtx);
        if (ret != ffrt_success) {
            result = 7;
        }
    };
    ffrt_submit_base(create_function_wrapper(func), nullptr, nullptr, nullptr);
    ffrt_wait();
    ret = ffrt_mutex_destroy(&mtx);
    if (ret != ffrt_success) {
        result = 8;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value MutexTest006(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    int x = 0;
    ffrt_mutex_t lock;
    int ret = ffrt_mutex_init(&lock, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 1;
    }
    std::function<void()>&& func1 = [&]() {
        ffrt_usleep(50 * 1000);
        int res = ffrt_mutex_lock(&lock);
        if (res != ffrt_success) {
            resultEnd = 2;
        }
        x = x * 2;
        res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 3;
        }
    };
    std::function<void()>&& func2 = [&]() {
        int res = ffrt_mutex_lock(&lock);
        if (res != ffrt_success) {
            resultEnd = 4;
        }
        ffrt_usleep(100 * 1000);
        x++;
        res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 5;
        }
    };
    ffrt_submit_base(create_function_wrapper(func1), nullptr, nullptr, nullptr);
    ffrt_submit_base(create_function_wrapper(func2), nullptr, nullptr, nullptr);
    ffrt_wait();
    if (x != 2) {
        resultEnd = 6;
    }
    ffrt_mutex_destroy(&lock);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value MutexTest007(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    int x = 0;
    ffrt_mutex_t lock;
    int ret = ffrt_mutex_init(&lock, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 1;
    }
    std::function<void()>&& func1 = [&]() {
        ffrt_usleep(50 * 1000);
        int res = ffrt_mutex_lock(&lock);
        if (res != ffrt_success) {
            resultEnd = 2;
        }
        x = x * 2;
        res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 3;
        }
    };
    std::function<void()>&& func2 = [&]() {
        int res = ffrt_mutex_lock(&lock);
        if (res != ffrt_success) {
            resultEnd = 4;
        }
        x++;
        res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 5;
        }
    };
    ffrt_submit_base(create_function_wrapper(func1), nullptr, nullptr, nullptr);
    ffrt_submit_base(create_function_wrapper(func2), nullptr, nullptr, nullptr);
    ffrt_wait();
    ffrt_mutex_destroy(&lock);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value MutexTest008(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    int x = 0;
    int y = 0;
    ffrt_mutex_t lock;
    int ret = ffrt_mutex_init(&lock, nullptr);
    if (ret != ffrt_success) {
        resultEnd = 1;
    }
    std::function<void()>&& func1 = [&]() {
        usleep(30 * 1000);
        while (ffrt_mutex_trylock(&lock)) {
            y++;
            usleep(20 * 1000);
        }
        x = x * 2;
        int res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 2;
        }
        return;
    };
    std::function<void()>&& func2 = [&]() {
        int res = ffrt_mutex_lock(&lock);
        if (res != ffrt_success) {
            resultEnd = 3;
        }
        usleep(100 * 1000);
        x++;
        res = ffrt_mutex_unlock(&lock);
        if (res != ffrt_success) {
            resultEnd = 4;
        }
    };
    ffrt_submit_base(create_function_wrapper(func1), nullptr, nullptr, nullptr);
    ffrt_submit_base(create_function_wrapper(func2), nullptr, nullptr, nullptr);
    ffrt_wait();
    if (x != 2) {
        resultEnd = 5;
    }
    if (y == 0) {
        resultEnd = 6;
    }
    ffrt_mutex_destroy(&lock);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value QueueApiTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_create接口type为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_max, "test_queue", &queue_attr);
    if (queue_handle != nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_create接口name为空
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, nullptr, &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", nullptr);
    if (queue_handle != nullptr) {
        result = 3;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    (void)ffrt_queue_attr_init(nullptr);
    sleep(1);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest005(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_destroy接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }
    
    int a = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(nullptr);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest006(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_qos接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(nullptr, static_cast<ffrt_qos_t>(ffrt_qos_utility));
    ffrt_qos_t qos = ffrt_queue_attr_get_qos(&queue_attr);
    if (qos != static_cast<int>(ffrt_qos_default)) {
        result = 2;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest007(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_qos接口qos为异常值
    // 设置qos为-1
    ffrt_queue_attr_t queue_attr;
    ffrt_queue_t queue_handle;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<ffrt_qos_t>(ffrt_qos_inherit));
    ffrt_qos_t ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != static_cast<int>(ffrt_qos_inherit)) {
        result = 1;
    }
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 2;
    }

    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    
    // 设置qos为-2
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<ffrt_qos_t>(-2));
    ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != static_cast<int>(ffrt_qos_inherit)) {
        result = 1;
    }
    queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    usleep(2000);
    ffrt_queue_wait(handle);
    if (a != 2) {
        result = 3;
    }

    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest008(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_get_qos接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_qos(&queue_attr, static_cast<ffrt_qos_t>(ffrt_qos_utility));
    ffrt_qos_t ret = ffrt_queue_attr_get_qos(nullptr);
    if (ret != static_cast<int>(ffrt_qos_default)) {
        result = 2;
    }
    ret = ffrt_queue_attr_get_qos(&queue_attr);
    if (ret != static_cast<int>(ffrt_qos_utility)) {
        result = 1;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest009(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_destroy接口queue为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);
    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(nullptr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest010(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_submit接口queue或f为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_queue_submit(nullptr, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, nullptr, nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a,
        ffrt_function_kind_queue), nullptr);

    sleep(1);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest011(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_submit_h接口queue或f为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(nullptr,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    if (handle != nullptr) {
        result = 1;
    }
    handle = ffrt_queue_submit_h(queue_handle, nullptr, nullptr);
    if (handle != nullptr) {
        result = 2;
    }
    handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest012(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_wait接口handle为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    int a = 0;
    ffrt_task_handle_t handle = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(nullptr);
    ffrt_queue_wait(handle);
    if (a != 1) {
        result = 1;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_task_handle_destroy(handle);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueApiTest013(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_cancel接口handle为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 1000000); // 设置任务1s后才执行
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), &task_attr);

    int ret = ffrt_queue_cancel(nullptr);
    if (ret != -1) {
        result = 1;
    }
    ret = ffrt_queue_cancel(task1);
    if (ret != 0) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }

    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1);

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 0) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个delay的未执行task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 1000000); // 设置任务1s后才执行
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), &task_attr);

    int ret = ffrt_queue_cancel(task1);
    if (ret != 0) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }

    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1);

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 0) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个执行中task,ffrt的sleep
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusSleepForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    usleep(2000);
    int ret = ffrt_queue_cancel(task1);
    if (ret != 1) {
        result = 2;
    }
    if (a != 0) {
        result = 3;
    }
    ffrt_task_handle_destroy(task1);
    if (a != 0) {
        result = 4;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    if (a != 1) {
        result = 5;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueCancelTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    // cancel一个已执行的task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);
    ffrt_task_handle_t task2 = ffrt_queue_submit_h(queue_handle,
        ffrt_create_function_wrapper(OnePlusSleepForTest, nullptr, &a, ffrt_function_kind_queue), nullptr);

    ffrt_queue_wait(task1);
    int ret = ffrt_queue_cancel(task1);
    if (ret != 1) {
        result = 2;
    }
    if (a != 1) {
        result = 3;
    }
    ffrt_queue_wait(task2);
    if (a != 2) {
        result = 4;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDelayTest001(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 验证delay时间的正确性，先提交一个非延时task，再提交一个delay 5s的task，再提交一个delay 2s的task
    int result = 0;
    ffrt_task_attr_t task_attr1;
    ffrt_task_attr_t task_attr2;
    (void)ffrt_task_attr_init(&task_attr1);
    (void)ffrt_task_attr_init(&task_attr2);
    ffrt_task_attr_set_delay(&task_attr1, 5000000);
    ffrt_task_attr_set_delay(&task_attr2, 2000000);

    std::function<void()>&& MultipleFunc = [&result]() { MultipleForTest(static_cast<void*>(&result)); };
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    ffrt_queue_submit(queue_handle, create_function_wrapper(MultipleFunc, ffrt_function_kind_queue), nullptr);
    double t;
    auto start = std::chrono::high_resolution_clock::now();
    std::function<void()>&& OnePlusFunc = [&result]() { OnePlusForTest(static_cast<void*>(&result)); };
    std::function<void()>&& OneSubFunc = [&result]() { SubForTest(static_cast<void*>(&result)); };
    ffrt_task_handle_t handle1 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(OneSubFunc, ffrt_function_kind_queue), &task_attr1);
    ffrt_task_handle_t handle2 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(OnePlusFunc, ffrt_function_kind_queue), &task_attr2);

    ffrt_queue_wait(handle2);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end-start;
    t = elapsed.count();
    if (result != 1) {
        resultEnd = 1;
    }
    if (t <= 2000 || t >= 3000) {
        resultEnd = 2;
    }

    ffrt_queue_wait(handle1);
    end = std::chrono::high_resolution_clock::now();
    elapsed = end-start;
    t = elapsed.count();
    if (result != 0) {
        resultEnd = 3;
    }
    if (t <= 5000 || t >= 6000) {
        resultEnd = 4;
    }
    ffrt_task_handle_destroy(handle1);
    ffrt_task_handle_destroy(handle2);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value QueueDelayTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    // 验证delay时间的正确性，提交一个delay 5ms的task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 5000); // 设置任务5ms后才执行

    double t;
    auto start = std::chrono::high_resolution_clock::now();
    std::function<void()>&& OnePlusFunc = [&a]() { OnePlusForTest((void *)(&a)); };
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(OnePlusFunc, ffrt_function_kind_queue), &task_attr);
    ffrt_queue_wait(task1);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> elapsed = end-start;
    t = elapsed.count();
    if (a != 1) {
        result = 1;
    }
    if (t <= 5000 || t >= 10000) {
        result = 2;
    }
    uint64_t delay = ffrt_task_attr_get_delay(&task_attr);
    if (delay != 5000) {
        result = 3;
    }
    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDelayTest005(napi_env env, napi_callback_info info)
{
    int result = 0;
    // 等待delay任务时提交一个task可以快速调度
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 5000000);
    std::function<void()>&& MultipleFunc = [&a]() { MultipleForTest(static_cast<void*>(&a)); };
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(MultipleFunc, ffrt_function_kind_queue), &task_attr);

    sleep(1);
    double t;
    auto start = std::chrono::high_resolution_clock::now();
    std::function<void()>&& OnePlusFunc = [&a]() { OnePlusForTest(static_cast<void*>(&a)); };
    ffrt_task_handle_t task2 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(OnePlusFunc, ffrt_function_kind_queue), nullptr);
    ffrt_queue_wait(task2);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end-start;
    t = elapsed.count();
    if (a != 1) {
        result = 1;
    }
    if (t >= 5) {
        result = 2;
    }

    ffrt_queue_wait(task1);
    if (a != 10) {
        result = 3;
    }
    uint64_t delay = ffrt_task_attr_get_delay(&task_attr);
    if (delay != 5000000) {
        result = 4;
    }
    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_timeout接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_timeout(nullptr, 10000);
    uint64_t time = ffrt_queue_attr_get_timeout(&queue_attr);
    if (time != 0) {
        result = 1;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 2;
    }
    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_get_timeout接口attr为异常值
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    uint64_t time = ffrt_queue_attr_get_timeout(nullptr);
    if (time != 0) {
        result = 1;
    }
    time = ffrt_queue_attr_get_timeout(&queue_attr);
    if (time != 10000) {
        result = 2;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest003(napi_env env, napi_callback_info info)
{
    int result = 0;
    // ffrt_queue_attr_set_callback接口attr为异常值
    int end = 0;
    std::function<void()> cbOne = [&end]() {
        end++;
    };
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_callback(nullptr, create_function_wrapper(cbOne, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest004(napi_env env, napi_callback_info info)
{
    int result = 0;
    int end = 0;
    std::function<void()> cbOne = [&end]() {
        end++;
    };
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_callback(&queue_attr, create_function_wrapper(cbOne, ffrt_function_kind_queue));
    ffrt_function_header_t* func = ffrt_queue_attr_get_callback(nullptr);
    if (func != nullptr) {
        result = 1;
    }
    func = ffrt_queue_attr_get_callback(&queue_attr);
    if (func == nullptr) {
        result = 2;
    }
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    if (queue_handle == nullptr) {
        result = 3;
    }

    // 销毁队列
    ffrt_queue_destroy(queue_handle);
    ffrt_queue_attr_destroy(&queue_attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value QueueDfxTest005(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    int x = 0;
    int end = 0;
    std::function<void()> cbOne = [&end]() {
        end++;
    };
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    ffrt_queue_attr_set_callback(&queue_attr, create_function_wrapper(cbOne, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    std::function<void()>&& basicFunc1 = [&] {
        x++;
        usleep(500 * 1000);
    };
    ffrt_task_handle_t handle = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(basicFunc1, ffrt_function_kind_queue), nullptr);
    ffrt_queue_wait(handle);
    if (x != 1) {
        resultEnd = 1;
    }
    if (end != 1) {
        resultEnd = 2;
    }
    
    std::function<void()>&& basicFunc2 = [&] {
        x++;
        ffrt_usleep(500 * 1000);
    };
    ffrt_task_handle_t handle1 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(basicFunc2, ffrt_function_kind_queue), nullptr);
    ffrt_queue_wait(handle1);
    if (x != 2) {
        resultEnd = 3;
    }
    if (end != 2) {
        resultEnd = 4;
    }

    ffrt_task_handle_destroy(handle);
    ffrt_task_handle_destroy(handle1);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value QueueDfxTest006(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    int x = 0;
    int end = 0;
    std::function<void()> cbOne = [&end]() {
        end++;
    };
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_attr_set_timeout(&queue_attr, 10000);
    ffrt_queue_attr_set_callback(&queue_attr, create_function_wrapper(cbOne, ffrt_function_kind_queue));
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    ffrt_task_handle_t handle[5];
    std::function<void()>&& basicFunc = [&] {
            x++;
    };
    for (int i = 0; i < 5; ++i) {
        handle[i] = ffrt_queue_submit_h(queue_handle,
            create_function_wrapper(basicFunc, ffrt_function_kind_queue), nullptr);
    }
    ffrt_queue_wait(handle[4]);
    if (x != 5) {
        resultEnd = 1;
    }
    if (end != 0) {
        resultEnd = 2;
    }
    for (int i = 0; i < 5; i++) {
        ffrt_task_handle_destroy(handle[i]);
    }
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value QueueTest001(napi_env env, napi_callback_info info)
{
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    int result = 0;
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(OnePlusForTest, nullptr, &result,
        ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(MultipleForTest, nullptr, &result,
        ffrt_function_kind_queue), nullptr);
    ffrt_queue_submit(queue_handle, ffrt_create_function_wrapper(SubForTest, nullptr, &result,
        ffrt_function_kind_queue), nullptr);
    napi_value flag = nullptr;
    sleep(2);
    napi_create_double(env, result, &flag);
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    return flag;
}

static napi_value QueueTest002(napi_env env, napi_callback_info info)
{
    const int maxNum = (int)ffrt_qos_user_initiated + 1;
    ffrt_queue_attr_t queue_attr[maxNum];
    ffrt_queue_t queue_handle[maxNum];
    for (int num = 0; num < maxNum; num++) {
        (void)ffrt_queue_attr_init(&queue_attr[num]);
        ffrt_queue_attr_set_qos(&queue_attr[num], num);
        queue_handle[num] = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr[num]);
    }
    
    int a = 0;
    int result[maxNum] = {0};
    ffrt_task_handle_t task[maxNum][10];
    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < maxNum; num++) {
            task[num][i] = ffrt_queue_submit_h(queue_handle[num],
                ffrt_create_function_wrapper(OnePlusForTest, NULL, &result[num], ffrt_function_kind_queue), nullptr);
        }
    }
    for (int num = 0; num < maxNum; num++) {
        ffrt_queue_wait(task[num][9]);
        HiLogPrint(LOG_APP, LOG_INFO, 1, "FFRT QUEUE", "result in queue %{public}d is %{public}d", num, result[num]);
        if (result[num] != 10) {
            a = 1;
        }
    }
    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < maxNum; num++) {
            ffrt_task_handle_destroy(task[num][i]);
        }
    }
    for (int num = 0; num < maxNum; num++) {
        HiLogPrint(LOG_APP, LOG_INFO, 1, "FFRT QUEUE", "qos in queue task %{public}d is %{public}d", num,
            ffrt_queue_attr_get_qos(&queue_attr[num]));
        if (ffrt_queue_attr_get_qos(&queue_attr[num]) != num) {
            a = 1;
        }
        ffrt_queue_attr_destroy(&queue_attr[num]);
        ffrt_queue_destroy(queue_handle[num]);
    }
    napi_value flag = nullptr;
    napi_create_double(env, a, &flag);
    return flag;
}

static napi_value QueueTest003(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // 创建多个相同qos队列，分别调度执行task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle[10];
    for (int num = 0; num < 10; num++) {
        queue_handle[num] = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);
    }

    int result[10] = {0};
    void *addr;
    ffrt_task_handle_t task[10][10];
    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < 10; num++) {
            addr = static_cast<void *>(&result[num]);
            std::function<void()> basicFunc = [=]() { OnePlusForTest(addr); };
            task[num][i] = ffrt_queue_submit_h(queue_handle[num],
                create_function_wrapper(basicFunc, ffrt_function_kind_queue), nullptr);
        }
    }
    for (int num = 0; num < 10; num++) {
        ffrt_queue_wait(task[num][9]);
        if (result[num] != 10) {
            resultEnd = num + 1;
        }
    }

    for (int i = 0; i < 10; i++) {
        for (int num = 0; num < 10; num++) {
            ffrt_task_handle_destroy(task[num][i]);
        }
    }

    ffrt_queue_attr_destroy(&queue_attr);
    for (int num = 0; num < 10; num++) {
        ffrt_queue_destroy(queue_handle[num]);
    }
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value QueueWaitTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    // wait一个delay的未执行task
    ffrt_queue_attr_t queue_attr;
    (void)ffrt_queue_attr_init(&queue_attr);
    ffrt_queue_t queue_handle = ffrt_queue_create(ffrt_queue_serial, "test_queue", &queue_attr);

    int a = 0;
    ffrt_task_attr_t task_attr;
    (void)ffrt_task_attr_init(&task_attr);
    ffrt_task_attr_set_delay(&task_attr, 1000000);
    std::function<void()>&& OnePlusFunc = [&a]() { OnePlusForTest(static_cast<void*>(&a)); };
    ffrt_task_handle_t task1 = ffrt_queue_submit_h(queue_handle,
        create_function_wrapper(OnePlusFunc, ffrt_function_kind_queue), &task_attr);
    
    ffrt_queue_wait(task1);
    if (a != 1) {
        result = 1;
    }
    
    ffrt_task_attr_destroy(&task_attr);
    ffrt_task_handle_destroy(task1);

    // 销毁队列
    ffrt_queue_attr_destroy(&queue_attr);
    ffrt_queue_destroy(queue_handle);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitAbnormalTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    std::function<void()>&& func = [&]() { x = x + 1;};
    const std::vector<ffrt_dependence_t> in_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> out_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t out{static_cast<uint32_t>(out_deps.size()), out_deps.data()};
    ffrt_function_header_t* ffrt_header_t = create_function_wrapper((func));

    ffrt_submit_base(nullptr, &in, &out, nullptr);
    ffrt_submit_h_base(nullptr, &in, &out, nullptr);
    ffrt_task_handle_destroy(nullptr);
    ffrt_submit_base(ffrt_header_t, &in, &out, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitBasicTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    std::function<void()>&& func = [&]() { x = x + 1;};
    const std::vector<ffrt_dependence_t> in_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> out_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t out{static_cast<uint32_t>(out_deps.size()), out_deps.data()};
    ffrt_function_header_t* ffrt_header_t = create_function_wrapper((func));
    ffrt_submit_base(ffrt_header_t, &in, &out, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitBasicTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 5 * 1000;
    int a = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    ffrt_submit_base(ffrt_create_function_wrapper(OnePlusForTest, NULL, &a), NULL, NULL, &attr);
    ffrt_wait();
    usleep(sleepTime);
    if (a != 1) {
        result = 3;
    }
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitInDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_task_attr_t attr1;
    ffrt_task_attr_init(&attr1);
    ffrt_task_attr_set_qos(&attr1, static_cast<int>(ffrt_qos_background));
    ffrt_task_attr_t attr2;
    ffrt_task_attr_init(&attr2);
    ffrt_task_attr_set_qos(&attr2, static_cast<int>(ffrt_qos_utility));
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, nullptr, &attr1);
    ffrt_submit_base(basic2Func_ht, &in2, nullptr, &attr2);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    ffrt_task_attr_destroy(&attr1);
    ffrt_task_attr_destroy(&attr2);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitInDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, nullptr, nullptr);
    ffrt_submit_base(basic2Func_ht, &in2, nullptr, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitOuDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_submit_base(basic1Func_ht, &in1, &ou1, nullptr);
    ffrt_submit_base(basic2Func_ht, &in2, &ou2, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 1;
    }
    if (y != 1) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitOuDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
        if (y != 0) {
            result = 1;
        }
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
        if (x != 1) {
            result = 2;
        }
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_submit_base(basic1Func_ht, nullptr, &ou1, nullptr);
    ffrt_submit_base(basic2Func_ht, nullptr, &ou2, nullptr);
    ffrt_wait();
    if (x != 1) {
        result = 3;
    }
    if (y != 1) {
        result = 4;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitIODependTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    int y = 0;
    int z = 0;
    std::function<void()>&& basic1Func = [&]() {
        ffrt_usleep(10 * 1000);
        x = x + 1;
    };
    std::function<void()>&& basic2Func = [&]() {
        ffrt_usleep(5 * 1000);
        y = y + 1;
    };
    std::function<void()>&& basic3Func = [&]() {
        z = x + y;
    };
    const std::vector<ffrt_dependence_t> in3_deps = {{ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t in3{static_cast<uint32_t>(in3_deps.size()), in3_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    const std::vector<ffrt_dependence_t> ou3_deps = {{ffrt_dependence_data, &z}};
    ffrt_deps_t ou3{static_cast<uint32_t>(ou3_deps.size()), ou3_deps.data()};
    ffrt_submit_base(create_function_wrapper(basic1Func), nullptr, &ou1, nullptr);
    ffrt_submit_base(create_function_wrapper(basic2Func), nullptr, &ou2, nullptr);
    ffrt_submit_base(create_function_wrapper(basic3Func), &in3, &ou3, nullptr);
    ffrt_wait();
    if (z != 2) {
        result = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitIODependTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    int y = 0;
    int z = 0;
    int t = 0;
    std::function<void()>&& basic1Func = [&]() {
        usleep(10 * 1000);
        x = x + 1;
        y = y + 1;
    };
    std::function<void()>&& basic2Func = [&]() {
        z = x * 5;
    };
    std::function<void()>&& basic3Func = [&]() {
        t = y * 10;
    };
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> in3_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t in3{static_cast<uint32_t>(in3_deps.size()), in3_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, &z}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    const std::vector<ffrt_dependence_t> ou3_deps = {{ffrt_dependence_data, &t}};
    ffrt_deps_t ou3{static_cast<uint32_t>(ou3_deps.size()), ou3_deps.data()};
    ffrt_submit_base(create_function_wrapper(basic1Func), nullptr, &ou1, nullptr);
    ffrt_submit_base(create_function_wrapper(basic2Func), &in2, &ou2, nullptr);
    ffrt_submit_base(create_function_wrapper(basic3Func), &in3, &ou3, nullptr);
    ffrt_wait();
    if (z != 5) {
        result = 1;
    }
    if (t != 10) {
        result = 2;
    }
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHIODependTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    int y = 0;
    int z = 0;
    std::function<void()>&& basic1Func = [&]() {
        ffrt_usleep(10 * 1000);
        x = x + 1;
    };
    std::function<void()>&& basic2Func = [&]() {
        ffrt_usleep(5 * 1000);
        y = y + 1;
    };
    std::function<void()>&& basic3Func = [&]() {
        z = x + y;
    };
    const std::vector<ffrt_dependence_t> in3_deps = {
        {ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t in3{static_cast<uint32_t>(in3_deps.size()), in3_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    const std::vector<ffrt_dependence_t> ou3_deps = {{ffrt_dependence_data, &z}};
    ffrt_deps_t ou3{static_cast<uint32_t>(ou3_deps.size()), ou3_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(
        create_function_wrapper(basic1Func), nullptr, &ou1, nullptr);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(
        create_function_wrapper(basic2Func), nullptr, &ou2, nullptr);
    ffrt_task_handle_t task3 = ffrt_submit_h_base(
        create_function_wrapper(basic3Func), &in3, &ou3, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task3}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    if (z != 2) {
        result = 1;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    ffrt_task_handle_destroy(task3);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHIODependTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    int y = 0;
    int z = 0;
    int t = 0;
    std::function<void()>&& basic1Func = [&]() {
        usleep(10 * 1000);
        x = x + 1;
        y = y + 1;
    };
    std::function<void()>&& basic2Func = [&]() {
        z = x * 5;
    };
    std::function<void()>&& basic3Func = [&]() {
        t = y * 10;
    };
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> in3_deps = {{ffrt_dependence_data, &y}};
    ffrt_deps_t in3{static_cast<uint32_t>(in3_deps.size()), in3_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, &x}, {ffrt_dependence_data, &y}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, &z}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    const std::vector<ffrt_dependence_t> ou3_deps = {{ffrt_dependence_data, &t}};
    ffrt_deps_t ou3{static_cast<uint32_t>(ou3_deps.size()), ou3_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(create_function_wrapper(basic1Func), nullptr, &ou1, nullptr);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(create_function_wrapper(basic2Func), &in2, &ou2, nullptr);
    ffrt_task_handle_t task3 = ffrt_submit_h_base(create_function_wrapper(basic3Func), &in3, &ou3, nullptr);
    const std::vector<ffrt_dependence_t> wait2_deps = {{ffrt_dependence_task, task2}};
    ffrt_deps_t wait2{static_cast<uint32_t>(wait2_deps.size()), wait2_deps.data()};
    ffrt_wait_deps(&wait2);
    if (z != 5) {
        result = 1;
    }
    const std::vector<ffrt_dependence_t> wait3_deps = {{ffrt_dependence_task, task3}};
    ffrt_deps_t wait3{static_cast<uint32_t>(wait3_deps.size()), wait3_deps.data()};
    ffrt_wait_deps(&wait3);
    if (t != 10) {
        result = 2;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    ffrt_task_handle_destroy(task3);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitIn0Ou0WaitNullTask1Test(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 30 * 1000;
    int x = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    std::function<void()>&& basicFunc = [&]() {
        if (x != 0) {
            result = 1;
        }
        usleep(sleepTime);
        x = x + 1;
    };
    ffrt_function_header_t* basicFunc_ht = create_function_wrapper((basicFunc));
    const std::vector<ffrt_dependence_t> in_deps = {};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> ou_deps = {};
    ffrt_deps_t ou{static_cast<uint32_t>(ou_deps.size()), ou_deps.data()};
    const std::vector<ffrt_dependence_t> wait_deps = {};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    const ffrt_deps_t *wait_null = nullptr;
    ffrt_submit_base(basicFunc_ht, &in, &ou, &attr);
    if (x != 0) {
        result = 2;
    }
    ffrt_wait_deps(wait_null);
    if (x != 0) {
        result = 3;
    }
    ffrt_wait_deps(&wait);
    if (x != 0) {
        result = 4;
    }
    ffrt_wait();
    if (x != 1) {
        result = 5;
    }
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHBasicTest001(napi_env env, napi_callback_info info)
{
    int result = 0;
    int x = 0;
    std::function<void()>&& func = [&]() { x = x + 1;};
    const std::vector<ffrt_dependence_t> in_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t in{static_cast<uint32_t>(in_deps.size()), in_deps.data()};
    const std::vector<ffrt_dependence_t> out_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t out{static_cast<uint32_t>(out_deps.size()), out_deps.data()};
    ffrt_function_header_t* ffrt_header_t = create_function_wrapper((func));
    ffrt_task_handle_t task = ffrt_submit_h_base(ffrt_header_t, &in, &out, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_data, &x}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    if (x != 1) {
        result = 1;
    }
    ffrt_task_handle_destroy(task);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHBasicTest002(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 5 * 1000;
    int a = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    ffrt_task_handle_t task = ffrt_submit_h_base(
        ffrt_create_function_wrapper(OnePlusForTest, NULL, &a), NULL, NULL, &attr);
    const std::vector<ffrt_dependence_t> wait_deps = {{ffrt_dependence_task, task}};
    ffrt_deps_t wait{static_cast<uint32_t>(wait_deps.size()), wait_deps.data()};
    ffrt_wait_deps(&wait);
    usleep(sleepTime);
    if (a != 1) {
        result = 3;
    }
    ffrt_task_attr_destroy(&attr);
    ffrt_task_handle_destroy(task);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHInDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_task_attr_t attr1;
    ffrt_task_attr_init(&attr1);
    ffrt_task_attr_set_qos(&attr1, static_cast<int>(ffrt_qos_background));
    ffrt_task_attr_t attr2;
    ffrt_task_attr_init(&attr2);
    ffrt_task_attr_set_qos(&attr2, static_cast<int>(ffrt_qos_utility));
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(basic1Func_ht, &in1, nullptr, &attr1);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(basic2Func_ht, &in2, nullptr, &attr2);
    const std::vector<ffrt_dependence_t> wait_deps1 = {{ffrt_dependence_task, task1}};
    ffrt_deps_t wait1{static_cast<uint32_t>(wait_deps1.size()), wait_deps1.data()};
    const std::vector<ffrt_dependence_t> wait_deps2 = {{ffrt_dependence_task, task2}};
    ffrt_deps_t wait2{static_cast<uint32_t>(wait_deps2.size()), wait_deps2.data()};
    ffrt_wait_deps(&wait1);
    if (x != 1) {
        result = 1;
    }
    ffrt_wait_deps(&wait2);
    if (y != 1) {
        result = 2;
    }
    ffrt_task_attr_destroy(&attr1);
    ffrt_task_attr_destroy(&attr2);
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHInDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(basic1Func_ht, &in1, nullptr, nullptr);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(basic2Func_ht, &in2, nullptr, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps1 = {{ffrt_dependence_task, task1}};
    ffrt_deps_t wait1{static_cast<uint32_t>(wait_deps1.size()), wait_deps1.data()};
    const std::vector<ffrt_dependence_t> wait_deps2 = {{ffrt_dependence_task, task2}};
    ffrt_deps_t wait2{static_cast<uint32_t>(wait_deps2.size()), wait_deps2.data()};
    ffrt_wait_deps(&wait1);
    if (x != 1) {
        result = 1;
    }
    ffrt_wait_deps(&wait2);
    if (y != 1) {
        result = 2;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHOuDependEmptyTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> in1_deps = {};
    ffrt_deps_t in1{static_cast<uint32_t>(in1_deps.size()), in1_deps.data()};
    const std::vector<ffrt_dependence_t> in2_deps = {};
    ffrt_deps_t in2{static_cast<uint32_t>(in2_deps.size()), in2_deps.data()};
    const std::vector<ffrt_dependence_t> ou1_deps = {};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(basic1Func_ht, &in1, &ou1, nullptr);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(basic2Func_ht, &in2, &ou2, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps1 = {{ffrt_dependence_task, task1}};
    ffrt_deps_t wait1{static_cast<uint32_t>(wait_deps1.size()), wait_deps1.data()};
    const std::vector<ffrt_dependence_t> wait_deps2 = {{ffrt_dependence_task, task2}};
    ffrt_deps_t wait2{static_cast<uint32_t>(wait_deps2.size()), wait_deps2.data()};
    ffrt_wait_deps(&wait1);
    if (x != 1) {
        result = 1;
    }
    ffrt_wait_deps(&wait2);
    if (y != 1) {
        result = 2;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value SubmitHOuDependNullptrTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    const uint32_t sleepTime = 10 * 1000;
    int x = 0;
    int y = 0;
    std::function<void()>&& basic1Func = [&]() {
        x = x + 1;
        usleep(sleepTime);
        if (y != 0) {
            result = 1;
        }
    };
    std::function<void()>&& basic2Func = [&]() {
        y = y + 1;
        usleep(sleepTime);
        if (x != 1) {
            result = 2;
        }
    };
    ffrt_function_header_t* basic1Func_ht = create_function_wrapper((basic1Func));
    ffrt_function_header_t* basic2Func_ht = create_function_wrapper((basic2Func));
    const std::vector<ffrt_dependence_t> ou1_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou1{static_cast<uint32_t>(ou1_deps.size()), ou1_deps.data()};
    const std::vector<ffrt_dependence_t> ou2_deps = {{ffrt_dependence_data, NULL}};
    ffrt_deps_t ou2{static_cast<uint32_t>(ou2_deps.size()), ou2_deps.data()};
    ffrt_task_handle_t task1 = ffrt_submit_h_base(basic1Func_ht, nullptr, &ou1, nullptr);
    ffrt_task_handle_t task2 = ffrt_submit_h_base(basic2Func_ht, nullptr, &ou2, nullptr);
    const std::vector<ffrt_dependence_t> wait_deps1 = {{ffrt_dependence_task, task1}};
    ffrt_deps_t wait1{static_cast<uint32_t>(wait_deps1.size()), wait_deps1.data()};
    const std::vector<ffrt_dependence_t> wait_deps2 = {{ffrt_dependence_task, task2}};
    ffrt_deps_t wait2{static_cast<uint32_t>(wait_deps2.size()), wait_deps2.data()};
    ffrt_wait_deps(&wait1);
    if (x != 1) {
        result = 3;
    }
    ffrt_wait_deps(&wait2);
    if (y != 1) {
        result = 4;
    }
    ffrt_task_handle_destroy(task1);
    ffrt_task_handle_destroy(task2);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}


static napi_value SleepForTest000(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // sleep 1ms，验证sleep时间的正确性
    double t;
    std::function<void()>&& func = [&]() {
        auto start = std::chrono::high_resolution_clock::now();
        ffrt_usleep(0);
        auto end = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double, std::milli> elapsed = end-start;
        t = elapsed.count();
    };
    ffrt_submit_base(create_function_wrapper(func), nullptr, nullptr, nullptr);
    ffrt_wait();
    if (t <= 0 || t > 10) {
        resultEnd = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value SleepForTest001(napi_env env, napi_callback_info info)
{
    int resultEnd = 0;
    // sleep 1ms，验证sleep时间的正确性
    double t;
    std::function<void()>&& func = [&]() {
        auto start = std::chrono::high_resolution_clock::now();
        ffrt_usleep(1000);
        auto end = std::chrono::high_resolution_clock::now();
        std::chrono::duration<double, std::milli> elapsed = end-start;
        t = elapsed.count();
    };
    ffrt_submit_base(create_function_wrapper(func), nullptr, nullptr, nullptr);
    ffrt_wait();
    if (t <= 1 || t > 10) {
        resultEnd = 1;
    }
    napi_value flag = nullptr;
    napi_create_double(env, resultEnd, &flag);
    return flag;
}

static napi_value TaskAttrAbnormalTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t attr;
    int ret = ffrt_task_attr_init(nullptr);
    if (ret != -1) {
        result = 1;
    }
    ret = ffrt_task_attr_init(&attr);
    ffrt_task_attr_set_qos(nullptr, static_cast<int>(ffrt_qos_default));
    ffrt_task_attr_set_name(nullptr, nullptr);
    ffrt_task_attr_set_delay(nullptr, 0);
    ffrt_qos_t ffrt_qos = ffrt_task_attr_get_qos(nullptr);
    if (ffrt_qos != ffrt_qos_default) {
        result = 2;
    }
    const char* name = ffrt_task_attr_get_name(nullptr);
    if (name != nullptr) {
        result = 3;
    }
    uint64_t delay = ffrt_task_attr_get_delay(nullptr);
    if (delay != 0) {
        result = 4;
    }
    ffrt_task_attr_destroy(nullptr);
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value TaskAttrQosIllegalTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    int minVal = static_cast<int>(ffrt_qos_inherit) - 1;
    ffrt_task_attr_set_qos(&attr, minVal);
    int queryVal = int(ffrt_task_attr_get_qos(&attr));
    if (queryVal != -1) {
        result = 1;
    }
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value TaskAttrQosQueryTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_get_qos(&attr);
    int ret = ffrt_task_attr_init(&attr);
    if (ret != 0) {
        result = 1;
    }
    int qosVal = ffrt_task_attr_get_qos(&attr);
    if (qosVal != ffrt_qos_default) {
        result = 2;
    }
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value TaskAttrSetNameTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t attr;
    (void)ffrt_task_attr_init(&attr);
    std::string name(ffrt_task_attr_get_name(&attr));
    if (name != "") {
        result = 1;
    }
    ffrt_task_attr_set_name(&attr, "Task Name");
    std::string reName(ffrt_task_attr_get_name(&attr));
    if (reName != "Task Name") {
        result = 2;
    }
    ffrt_task_attr_destroy(&attr);
    std::string desName(ffrt_task_attr_get_name(&attr));
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

static napi_value TaskAttrSetQosTest(napi_env env, napi_callback_info info)
{
    int result = 0;
    ffrt_task_attr_t attr;
    ffrt_task_attr_init(&attr);
    int minLevel = static_cast<int>(ffrt_qos_inherit);
    int maxLevel = static_cast<int>(ffrt_qos_user_initiated);
    for (int idx = minLevel; idx <= maxLevel; idx++) {
        ffrt_task_attr_set_qos(&attr, idx);
        int qosVal = int(ffrt_task_attr_get_qos(&attr));
        if (qosVal != idx) {
            result = idx + 2;
        }
    }
    ffrt_task_attr_destroy(&attr);
    napi_value flag = nullptr;
    napi_create_double(env, result, &flag);
    return flag;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "conditionVariableTest001", nullptr, ConditionVariableTest001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableTest002", nullptr, ConditionVariableTest002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableTest003", nullptr, ConditionVariableTest003, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableTest004", nullptr, ConditionVariableTest004, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableApiTest001", nullptr, ConditionVariableApiTest001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableApiTest002", nullptr, ConditionVariableApiTest002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableApiTest003", nullptr, ConditionVariableApiTest003, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "conditionVariableApiTest004", nullptr, ConditionVariableApiTest004, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "delayCTest001", nullptr, DelayCTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ffrtYieldC0001", nullptr, FfrtYieldC0001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "mutexAbnormalParamTest001", nullptr, MutexAbnormalParamTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "mutexAbnormalParamTest002", nullptr, MutexAbnormalParamTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "mutexTest006", nullptr, MutexTest006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "mutexTest007", nullptr, MutexTest007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "mutexTest008", nullptr, MutexTest008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest001", nullptr, QueueApiTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest002", nullptr, QueueApiTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest003", nullptr, QueueApiTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest004", nullptr, QueueApiTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest005", nullptr, QueueApiTest005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest006", nullptr, QueueApiTest006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest007", nullptr, QueueApiTest007, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest008", nullptr, QueueApiTest008, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest009", nullptr, QueueApiTest009, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest010", nullptr, QueueApiTest010, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest011", nullptr, QueueApiTest011, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest012", nullptr, QueueApiTest012, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueApiTest013", nullptr, QueueApiTest013, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest001", nullptr, QueueCancelTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest003", nullptr, QueueCancelTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueCancelTest004", nullptr, QueueCancelTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDelayTest001", nullptr, QueueDelayTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDelayTest002", nullptr, QueueDelayTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDelayTest005", nullptr, QueueDelayTest005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest001", nullptr, QueueDfxTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest002", nullptr, QueueDfxTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest003", nullptr, QueueDfxTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest004", nullptr, QueueDfxTest004, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest005", nullptr, QueueDfxTest005, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueDfxTest006", nullptr, QueueDfxTest006, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueTest001", nullptr, QueueTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueTest002", nullptr, QueueTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueTest003", nullptr, QueueTest003, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "queueWaitTest001", nullptr, QueueWaitTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitAbnormalTest", nullptr, SubmitAbnormalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitBasicTest001", nullptr, SubmitBasicTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitBasicTest002", nullptr, SubmitBasicTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitInDependEmptyTest", nullptr, SubmitInDependEmptyTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitInDependNullptrTest", nullptr, SubmitInDependNullptrTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitOuDependEmptyTest", nullptr, SubmitOuDependEmptyTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitOuDependNullptrTest", nullptr, SubmitOuDependNullptrTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitIODependTest001", nullptr, SubmitIODependTest001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitIODependTest002", nullptr, SubmitIODependTest002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitIn0Ou0WaitNullTask1Test", nullptr, SubmitIn0Ou0WaitNullTask1Test, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHBasicTest001", nullptr, SubmitHBasicTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitHBasicTest002", nullptr, SubmitHBasicTest002, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "submitHInDependEmptyTest", nullptr, SubmitHInDependEmptyTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHInDependNullptrTest", nullptr, SubmitHInDependNullptrTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHOuDependEmptyTest", nullptr, SubmitHOuDependEmptyTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHOuDependNullptrTest", nullptr, SubmitHOuDependNullptrTest, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHIODependTest001", nullptr, SubmitHIODependTest001, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "submitHIODependTest002", nullptr, SubmitHIODependTest002, nullptr, nullptr, nullptr,
            napi_default, nullptr },
        { "sleepForTest000", nullptr, SleepForTest000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "sleepForTest001", nullptr, SleepForTest001, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "taskAttrAbnormalTest", nullptr, TaskAttrAbnormalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "taskAttrQosIllegalTest", nullptr, TaskAttrQosIllegalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "taskAttrQosQueryTest", nullptr, TaskAttrQosQueryTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "taskAttrSetNameTest", nullptr, TaskAttrSetNameTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "taskAttrSetQosTest", nullptr, TaskAttrSetQosTest, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "ffrtndk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
