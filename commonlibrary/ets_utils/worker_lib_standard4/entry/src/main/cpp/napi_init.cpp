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

#include "napi/native_api.h"
#include <cstdint>
#include <pthread.h>
#include <unistd.h>
#include <random>
#include <vector>
#include <mutex>
#include <map>
#include <condition_variable>
#include <chrono>
#include <hilog/log.h>
#define LOG_PRINT_DOMAIN 0xFF00
#define APP_LOG_DOMAIN 0x0001
constexpr const char *APP_LOG_TAG = "JSThreadCountTest";
#define SAMPLE_LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define SAMPLE_LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define SAMPLE_LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))
#define SAMPLE_LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, APP_LOG_TAG, __VA_ARGS__))


struct ThreadParam {
    uint32_t runtime = 0;
    std::function<void(int32_t)> requestResultCallback;
};
std::mutex g_threadInfoMutex;
std::map<pthread_t, std::condition_variable*> g_threadInfoMap;

#define NUM_50MS 50000
#define MIN_RUN 200
#define MAX_RUN 25000
#define NUM_1000 1000

static void *CreateArkRuntimeFunc(void *arg)
{
    ThreadParam* param = (ThreadParam*)arg;
    
    uint32_t runtime = ((ThreadParam*)arg)->runtime;
    
    SAMPLE_LOGI("NAPI: CreateArkRuntimeFunc, runtime %{public}d", runtime);
    
    std::string threadname = "Ark_";
    threadname += std::to_string(runtime);
    pthread_setname_np(pthread_self(), threadname.c_str());
    napi_env env;
    napi_status ret = napi_create_ark_runtime(&env);
    if (ret != napi_ok) {
        SAMPLE_LOGE("NAPI: napi_create_ark_runtime failed");
        param->requestResultCallback(0);
        delete ((ThreadParam*)arg);
        return nullptr;
    }
    SAMPLE_LOGE("NAPI: requestResultCallback 1");
    param->requestResultCallback(1);
    delete ((ThreadParam*)arg);
    
    std::mutex mutexlock;
    std::condition_variable condition;
    std::unique_lock<std::mutex> lock(mutexlock);
    {
        std::lock_guard<std::mutex> lock(g_threadInfoMutex);
        g_threadInfoMap[pthread_self()] = &condition;
    }
    SAMPLE_LOGI("NAPI: g_threadInfoMap add %{public}p", &condition);
    condition.wait_for(lock, std::chrono::microseconds(runtime*NUM_1000));
    napi_destroy_ark_runtime(&env);
    {
        std::lock_guard<std::mutex> lock(g_threadInfoMutex);
        auto iter = g_threadInfoMap.find(pthread_self());
        if (iter != g_threadInfoMap.end()) {
            g_threadInfoMap.erase(iter);
        }
    }
    SAMPLE_LOGI("NAPI: CreateArkRuntimeFunc exit");
    return nullptr;
}

static pthread_t CreateArkRuntime(uint32_t runtime)
{
    ThreadParam* param = new ThreadParam{runtime};
    int32_t requestRet = -1;
    param->requestResultCallback = [ &requestRet ] (int32_t ret) {
        requestRet = ret;
    };
    pthread_t tid;
    pthread_create(&tid, nullptr, CreateArkRuntimeFunc, param);
    usleep(NUM_50MS);
    SAMPLE_LOGI("NAPI: requestRet %{public}d", requestRet);
    if (requestRet == 0) {
        return 0;
    } else {
        return tid;
    }
}

static bool DeleteArkRuntime(pthread_t tid)
{
    std::lock_guard<std::mutex> lock(g_threadInfoMutex);
    auto iter = g_threadInfoMap.find(tid);
    if (iter != g_threadInfoMap.end()) {
        SAMPLE_LOGI("NAPI: find thread. notify exit %{public}p", iter->second);
        if (iter->second) {
            iter->second->notify_all();
        }
        return true;
    } else {
        SAMPLE_LOGI("NAPI: not find thread. notify exit");
        return false;
    }
}

static napi_value AddArkRuntime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    uint32_t time = 0;
    napi_get_value_uint32(env, args[0], &time);
    
    pthread_t threadid = CreateArkRuntime(time);
    napi_value result = nullptr;
    napi_create_int64(env, (int64_t)threadid, &result);
    return result;
}

static napi_value DeleteArkRuntime(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    int64_t tid = 0;
    napi_get_value_int64(env, args[0], &tid);
    
    bool ret = DeleteArkRuntime(static_cast<pthread_t>(tid));
    
    napi_value sum;
    napi_create_int32(env, ret, &sum);
    return sum;
}

static napi_value GetRandom(napi_env env, napi_callback_info info)
{
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> distrib(MIN_RUN, MAX_RUN);
    int32_t randomNumber = distrib(gen);
    napi_value result;
    napi_create_int32(env, randomNumber, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) 
{
    SAMPLE_LOGI("NAPI: Init");
    napi_property_descriptor desc[] = {
        {"AddArkRuntime", nullptr, AddArkRuntime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DeleteArkRuntime", nullptr, DeleteArkRuntime, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetRandom", nullptr, GetRandom, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    SAMPLE_LOGI("NAPI: RegisterEntryModule");
    napi_module_register(&demoModule);
}
