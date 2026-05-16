/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "napi/native_api.h"
#include "include/FuncTest.h"
#include "include/VideodecApi11Sample.h"
#include <iostream>
#include <vector>
#include <functional>

using TestFunction = std::function<int()>;

struct AsyncWorkData {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    int testCase;          // 测试用例编号
    int result;            // 执行结果
    std::string errorMsg;  // 错误信息
};

static const std::vector<TestFunction> funcTestFunctions = {
    VideoDecodeSyncSs265Func0010Test,
    VideoDecodeSyncSs265Func0020Test,
    VideoSwdecH265BlankFrame0010Test,
    VideoSwdecH265Speed0010Test,
    VideoSwdecH265Speed0020Test,
    VideoSwdecH265Speed0030Test,
    VideoSwdecH265Speed0040Test,
    VideoSwdecH265Speed0050Test,
    VideoSwdecH265Speed0060Test,
    VideoSwdecH265Speed0070Test,
    VideoSwdecH265Speed0080Test,
    VideoSwdecH265Speed0090Test
};

static void ExecuteWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    try {
        // 检查测试用例合法性并执行
        if (workData->testCase >= 0 && workData->testCase < static_cast<int>(funcTestFunctions.size()) &&
            funcTestFunctions[workData->testCase] != nullptr) {
            workData->result = funcTestFunctions[workData->testCase]();
        } else {
            workData->errorMsg = "Invalid test case number";
            workData->result = -1;
        }
    } catch (const std::exception& e) {
        workData->errorMsg = e.what();
        workData->result = -1;
    } catch (...) {
        workData->errorMsg = "Unknown error occurred";
        workData->result = -1;
    }
}

// 异步任务完成回调
static void CompleteWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    
    // 先检查异步任务本身是否执行成功
    if (status != napi_ok) {
        napi_reject_deferred(env, workData->deferred, nullptr);
        goto cleanup;
    }

    // 根据执行结果处理Promise
    if (!workData->errorMsg.empty()) {
        // 有错误，reject Promise
        napi_value error;
        napi_create_string_utf8(env, workData->errorMsg.c_str(), NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, workData->deferred, error);
    } else {
        // 执行成功，resolve Promise
        napi_value result;
        napi_create_int32(env, workData->result, &result);
        napi_resolve_deferred(env, workData->deferred, result);
    }

cleanup:
    // 清理异步任务资源
    napi_delete_async_work(env, workData->work);
    delete workData;
}

// 封装NAPI异常捕获的工具函数（参考示例逻辑）
template <typename Func>
static napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_value error;
        napi_create_string_utf8(env, e.what(), NAPI_AUTO_LENGTH, &error);
        napi_throw(env, error);
        return nullptr;
    } catch (...) {
        napi_value error;
        napi_create_string_utf8(env, "Unknown error", NAPI_AUTO_LENGTH, &error);
        napi_throw(env, error);
        return nullptr;
    }
}

// 异步版本的RunFuncTest
static napi_value RunFuncTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [env, info]() {
        size_t argc = 1;
        napi_value args[1];
        napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        if (status != napi_ok || argc < 1) {
            throw std::runtime_error("Missing or invalid arguments");
        }

        // 检查参数类型是否为数字
        napi_valuetype valuetype;
        napi_typeof(env, args[0], &valuetype);
        if (valuetype != napi_number) {
            throw std::runtime_error("Argument must be a number");
        }

        // 获取测试用例编号
        int32_t testCase = -1;
        status = napi_get_value_int32(env, args[0], &testCase);
        if (status != napi_ok) {
            throw std::runtime_error("Failed to get test case number");
        }

        // 创建Promise
        napi_value promise;
        napi_deferred deferred;
        napi_create_promise(env, &deferred, &promise);

        // 初始化异步任务数据
        AsyncWorkData* workData = new AsyncWorkData();
        workData->env = env;
        workData->deferred = deferred;
        workData->testCase = testCase;
        workData->result = -1;

        // 创建异步任务
        napi_value workName;
        napi_create_string_utf8(env, "FuncTestAsyncWork", NAPI_AUTO_LENGTH, &workName);
        napi_create_async_work(env, nullptr, workName, ExecuteWork, CompleteWork, workData, &workData->work);

        // 入队执行异步任务
        napi_queue_async_work(env, workData->work);

        return promise;
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "runFuncTest", nullptr, RunFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr }
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
