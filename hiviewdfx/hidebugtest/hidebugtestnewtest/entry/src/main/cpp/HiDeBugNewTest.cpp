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
#include "hidebug/hidebug.h"
#include "hidebug/hidebug_type.h"
#include "hicollie/hicollie.h"
#include <string>
#include "hilog/log.h"
#include <cstdint>
#include <iomanip>
#include <thread>
#include <future>
#include <vector>
std::vector<uint32_t> tids;

namespace {
constexpr auto LOG_PRINT_DOMAIN = 0xFF00;
std::atomic_bool s {true} ;
std::mutex mutex;
}

void ThreadBlock(){
    while (s.load()){
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    };
}

__attribute__((noinline)) void StackDepth(int i) {
    if (i == 0 ){
        ThreadBlock();
        return;
    }
    return StackDepth(i-1);
}


static napi_value ClearThreads(napi_env env, napi_callback_info info){
    s.store(false);
    tids.clear();
    return nullptr;
}

static napi_value GetNativeMemInfoTrue(napi_env env, napi_callback_info info)
{
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfoWithCache(&nativeMemInfo, true);
    napi_value memInfo;
    napi_create_object(env, &memInfo);

    napi_value pss;
    napi_create_bigint_uint64(env, nativeMemInfo.pss, &pss);
    napi_set_named_property(env, memInfo, "pss", pss);

    napi_value rss;
    napi_create_bigint_uint64(env, nativeMemInfo.rss, &rss);
    napi_set_named_property(env, memInfo, "rss", rss);

    napi_value sharedDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedDirty, &sharedDirty);
    napi_set_named_property(env, memInfo, "sharedDirty", sharedDirty);

    napi_value privateDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.privateDirty, &privateDirty);
    napi_set_named_property(env, memInfo, "privateDirty", privateDirty);

    napi_value sharedClean;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedClean, &sharedClean);
    napi_set_named_property(env, memInfo, "sharedClean", sharedClean);

    napi_value privateClean;
    napi_create_bigint_uint64(env, nativeMemInfo.privateClean, &privateClean);
    napi_set_named_property(env, memInfo, "privateClean", privateClean);

    napi_value vss;
    napi_create_bigint_uint64(env, nativeMemInfo.vss, &vss);
    napi_set_named_property(env, memInfo, "vss", vss);
    return memInfo;
}

static napi_value GetNativeMemInfoFalse(napi_env env, napi_callback_info info)
{
    HiDebug_NativeMemInfo nativeMemInfo;
    OH_HiDebug_GetAppNativeMemInfoWithCache(&nativeMemInfo, false);
    napi_value memInfo;
    napi_create_object(env, &memInfo);

    napi_value pss;
    napi_create_bigint_uint64(env, nativeMemInfo.pss, &pss);
    napi_set_named_property(env, memInfo, "pss", pss);

    napi_value rss;
    napi_create_bigint_uint64(env, nativeMemInfo.rss, &rss);
    napi_set_named_property(env, memInfo, "rss", rss);

    napi_value sharedDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedDirty, &sharedDirty);
    napi_set_named_property(env, memInfo, "sharedDirty", sharedDirty);

    napi_value privateDirty;
    napi_create_bigint_uint64(env, nativeMemInfo.privateDirty, &privateDirty);
    napi_set_named_property(env, memInfo, "privateDirty", privateDirty);

    napi_value sharedClean;
    napi_create_bigint_uint64(env, nativeMemInfo.sharedClean, &sharedClean);
    napi_set_named_property(env, memInfo, "sharedClean", sharedClean);

    napi_value privateClean;
    napi_create_bigint_uint64(env, nativeMemInfo.privateClean, &privateClean);
    napi_set_named_property(env, memInfo, "privateClean", privateClean);

    napi_value vss;
    napi_create_bigint_uint64(env, nativeMemInfo.vss, &vss);
    napi_set_named_property(env, memInfo, "vss", vss);
    return memInfo;
}

static napi_value GetGraphicMemSummaryC(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int interval = 0;
    napi_get_value_int32(env, args[0], &interval);
    bool isUndefine = false;
    if (argc > 1) {
        napi_get_value_bool(env, args[1], &isUndefine);
    }
    HiDebug_GraphicsMemorySummary memorySummary{};
    HiDebug_ErrorCode retCode = HIDEBUG_SUCCESS;
    if (isUndefine) {
        retCode = OH_HiDebug_GetGraphicsMemorySummary(interval, nullptr);
    } else {
        retCode = OH_HiDebug_GetGraphicsMemorySummary(interval, &memorySummary);
    }
    if (retCode != HIDEBUG_SUCCESS) {
        napi_throw_error(env, std::to_string(retCode).c_str(), "hidebug OH_HiDebug_GetGraphicsMemorySummary error");
        return nullptr;
    }
    napi_value memInfo;
    napi_create_object(env, &memInfo);
    napi_value gl;
    napi_create_bigint_uint64(env, memorySummary.gl, &gl);
    napi_set_named_property(env, memInfo, "gl", gl);

    napi_value graph;
    napi_create_bigint_uint64(env, memorySummary.graph, &graph);
    napi_set_named_property(env, memInfo, "graph", graph);

    return memInfo;
}


static napi_value StartErrStack(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
            .tids = tids.data(),
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = 100,
            .duration = 10000,
            .reserved = 0,
        };
        int code = OH_HiDebug_RequestThreadLiteSampling(&config, nullptr);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}d",code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}

static napi_value StartErrConfig(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        int code = OH_HiDebug_RequestThreadLiteSampling(nullptr, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            // 打印最后一部分
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
            }

        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks 11 %{public}d", code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}


static napi_value StartErrConfigtid(napi_env env, napi_callback_info info) {
    std::promise<int> resultPromise;
    std::future<int> resultFuture = resultPromise.get_future();
    std::thread([resultPromise = std::move(resultPromise)]() mutable {
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
//            .tids = tids.data(),
            .tids = nullptr,
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = 100,
            .duration = 3000,
            .reserved = 0,
        };
        int code = OH_HiDebug_RequestThreadLiteSampling(&config, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            // 打印最后一部分
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}s",
                             stacks.substr(start, end - start).data());
            }

        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks %{public}d",code );
        resultPromise.set_value(code);
    }).detach();
    int code = resultFuture.get();
    napi_value sum;
    napi_create_double(env, code, &sum);
    return sum;
}

static napi_value Start(napi_env env, napi_callback_info info) {
    napi_value sum;
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);

    int32_t value1;
    napi_get_value_int32(env, args[1], &value1);
        static int count = 0;
        HiDebug_ProcessSamplerConfig config{
            .tids = tids.data(),
            .size = static_cast<uint32_t>(tids.size()),
            .frequency = static_cast<uint32_t>(value0),
            .duration = static_cast<uint32_t>(value1),
            .reserved = 0,
        };
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get params  %{public}d  %{public}d", value0,value1 );
        auto code = OH_HiDebug_RequestThreadLiteSampling(&config, [](const char *stack) {
            std::string stacks(stack);
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks start %{public}lu",
                             stacks.size());
            if (stacks.empty()) {
                return;
            }
            size_t start = 0;
            size_t end = 0;
            while ((end = stacks.find('\n', start)) != std::string::npos) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks in %{public}s",
                             stacks.substr(start, end - start).data());
                start = end + 1;
            }
            if (start < stacks.size()) {
                 OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get stacks end %{public}s",
                             stacks.substr(start, end - start).data());
            }
        });
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "Get Errcode done %{public}d", code );
    napi_create_double(env, code, &sum);
    return sum;
    return nullptr;
}

static  napi_value AddThread(napi_env env, napi_callback_info info) {
    s.store(true);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t value0;
    napi_get_value_int32(env, args[0], &value0);
    std::thread ([value0]{
        auto tid = gettid();
        {
            std::lock_guard<std::mutex> guard(mutex);
            tids.emplace_back(tid);
        }
        StackDepth(value0);
        {
            std::lock_guard<std::mutex> guard(mutex);
            tids.clear();
            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestTag", "clear tid done" );
        }
    }).detach();
    return nullptr;
}

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}

static napi_value CHECK_HIDEBUG_NO_PERMISSION(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_NO_PERMISSION == 11400103;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HIDEBUG_TRACE_ABNORMAL(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_TRACE_ABNORMAL == 11400104;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS == 11400200;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HIDEBUG_NOT_SUPPORTED(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_NOT_SUPPORTED == 11400300;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HIDEBUG_UNDER_SAMPLING(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_UNDER_SAMPLING == 11400301;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HIDEBUG_RESOURCE_UNAVAILABLE(napi_env env, napi_callback_info info){
    bool res =  HiDebug_ErrorCode::HIDEBUG_RESOURCE_UNAVAILABLE == 11400302;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}
static napi_value CHECK_HICOLLIE_REMOTE_FAILED(napi_env env, napi_callback_info info){
    bool res =  HiCollie_ErrorCode::HICOLLIE_REMOTE_FAILED == 29800002;
    napi_value ret = nullptr;
    napi_get_boolean(env, res, &ret);
    return ret;
}


static napi_value CHECK_ThreadCpuUsage(napi_env env, napi_callback_info info){
    napi_value result;
    HiDebug_ThreadCpuUsagePtr threadCpuUsage = OH_HiDebug_GetAppThreadCpuUsage() ;
    if(threadCpuUsage == nullptr){
      napi_create_int32(env, 0, &result);
      return result;
    }else{
      napi_create_int32(env, 1, &result);
      return result;
    }
}
static napi_value CHECK_OH_HiDebug_GetDefaultMallocDispatchTable(napi_env env, napi_callback_info info){

    napi_value result;
    HiDebug_MallocDispatch* original = (HiDebug_MallocDispatch*)OH_HiDebug_GetDefaultMallocDispatchTable();
    if(original == nullptr){
      napi_create_int32(env, 0, &result);
      return result;
    }else{
      napi_create_int32(env, 1, &result);
      return result;
    }
}
static napi_value CHECK_OH_HiDebug_CreateBacktraceObject(napi_env env, napi_callback_info info){

    napi_value result;
    HiDebug_Backtrace_Object backtraceObject = OH_HiDebug_CreateBacktraceObject();
    if(backtraceObject == nullptr){
      napi_create_int32(env, 0, &result);
      return result;
    }else{
      napi_create_int32(env, 1, &result);
      return result;
    }
}

static napi_value TestSetCrashObjType(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t objType;
    napi_get_value_int32(env, args[0], &objType);
    uint64_t crashObj;
    char data[] = "test set crashObject"; //长度64
    if (objType == HIDEBUG_CRASHOBJ_STRING) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_STRING, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_64B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_64B, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_256B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_256B, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_1024B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_1024B, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_2048B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_2048B, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_4096B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_4096B, data);
        OH_HiDebug_ResetCrashObj(crashObj);
    } else {
        napi_value input;
        napi_create_int32(env, -1, &input);
        napi_throw_error(env, std::to_string(objType).c_str(), "hidebug SetCrashObj error, input is error");
        return input;
    }
    if (std::to_string(crashObj).c_str() == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        napi_throw_error(env, std::to_string(crashObj).c_str(), "hidebug SetCrashObj error, result is error");
        return result;
    }
    napi_value ret;
    napi_create_bigint_uint64(env, crashObj, &ret);
    return ret;
}

static napi_value TestSetCrashObjAddr(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t objType;
    napi_get_value_int32(env, args[0], &objType);
    uint64_t crashObj;
    if (objType == HIDEBUG_CRASHOBJ_STRING) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_STRING, nullptr);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_64B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_64B, nullptr);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_256B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_256B, nullptr);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_1024B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_1024B, nullptr);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_2048B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_2048B, nullptr);
    } else if (objType == HIDEBUG_CRASHOBJ_MEMORY_4096B) {
        crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_MEMORY_4096B, nullptr);
    } else {
        napi_value input;
        napi_create_int32(env, -1, &input);
        napi_throw_error(env, std::to_string(objType).c_str(), "hidebug SetCrashObj error, input is error");
        return input;
    }
    if (std::to_string(crashObj).c_str() == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        napi_throw_error(env, std::to_string(crashObj).c_str(), "hidebug SetCrashObj error, result is error");
        return result;
    }
    napi_value ret;
    napi_create_bigint_uint64(env, crashObj, &ret);
    return ret;
}

static napi_value CheckSetCrashObj(napi_env env, napi_callback_info info)
{
    napi_value result;
    char data[] = "test set crashObject";
    uint64_t crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_STRING, data);
    if (std::to_string(crashObj).c_str() == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    } else {
        napi_create_int32(env, 1, &result);
        return result;
    }
}

static napi_value TestSetCrashObjAddrLen(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);
    int32_t addrLen;
    napi_get_value_int32(env, args[0], &addrLen);
    uint64_t crashObj;
    std::string str = "test set crashObject addr length";
    const int KB = 1024;
    str.resize(addrLen * KB, '0');
    crashObj = OH_HiDebug_SetCrashObj(HiDebug_CrashObjType::HIDEBUG_CRASHOBJ_STRING, (void*)str.c_str());
    OH_HiDebug_ResetCrashObj(crashObj);
    if (std::to_string(crashObj).c_str() == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        napi_throw_error(env, std::to_string(crashObj).c_str(), "hidebug SetCrashObj error, result is error");
        return result;
    }
    napi_value ret;
    napi_create_bigint_uint64(env, crashObj, &ret);
    return ret;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getNativeMemInfoTrue", nullptr, GetNativeMemInfoTrue, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getNativeMemInfoFalse", nullptr, GetNativeMemInfoFalse, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "getGraphicMemSummaryC", nullptr, GetGraphicMemSummaryC, nullptr, nullptr, nullptr, napi_default, nullptr },
        {"addthread", nullptr, AddThread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearthreads", nullptr, ClearThreads, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"start", nullptr, Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrstack", nullptr, StartErrStack, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrconfig", nullptr, StartErrConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"starterrconfigtid", nullptr, StartErrConfigtid, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_TRACE_ABNORMAL", nullptr, CHECK_HIDEBUG_TRACE_ABNORMAL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_NO_PERMISSION", nullptr, CHECK_HIDEBUG_NO_PERMISSION, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS", nullptr, CHECK_HIDEBUG_INVALID_SYMBOLIC_PC_ADDRESS, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_NOT_SUPPORTED", nullptr, CHECK_HIDEBUG_NOT_SUPPORTED, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_UNDER_SAMPLING", nullptr, CHECK_HIDEBUG_UNDER_SAMPLING, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HIDEBUG_RESOURCE_UNAVAILABLE", nullptr, CHECK_HIDEBUG_RESOURCE_UNAVAILABLE, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_HICOLLIE_REMOTE_FAILED", nullptr, CHECK_HICOLLIE_REMOTE_FAILED, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_ThreadCpuUsage", nullptr, CHECK_ThreadCpuUsage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_OH_HiDebug_GetDefaultMallocDispatchTable", nullptr, CHECK_OH_HiDebug_GetDefaultMallocDispatchTable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CHECK_OH_HiDebug_CreateBacktraceObject", nullptr, CHECK_OH_HiDebug_CreateBacktraceObject, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "testSetCrashObjType", nullptr, TestSetCrashObjType, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testSetCrashObjAddr", nullptr, TestSetCrashObjAddr, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "checkSetCrashObj", nullptr, CheckSetCrashObj, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "testSetCrashObjAddrLen", nullptr, TestSetCrashObjAddrLen, nullptr, nullptr, nullptr, napi_default, nullptr },
        
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
    napi_module_register(&demoModule);
}
