/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include <functional>
#include <string>
#include <vector>
#include "include/FuncTest.h"
#include "napi/native_api.h"

using TestFunction = std::function<int()>;

// VideoDecodeSyncSwMpeg2FuncTest group: SYNC FUNC 分类（0010/0020/0040）
static const std::vector<TestFunction> g_syncSwMpeg2FuncTests = {
    VideoDecodeSyncSwMpeg2Func0010,
    VideoDecodeSyncSwMpeg2Func0020,
    VideoDecodeSyncSwMpeg2Func0040,
};

// VideoDecodeBlankFrameTest group: BLANK FRAME 分类（0010）
static const std::vector<TestFunction> g_blankFrameTests = {
    VideoDecodeBlankFrame0010,
};

// VideoDecodeBlankAddTest group: BLANK ADD 分类（0010）
static const std::vector<TestFunction> g_blankAddTests = {
    VideoDecodeBlankAdd0010,
};

// 异步工作数据结构
struct AsyncMpeg2TestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    const std::vector<TestFunction>* tests = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// 在工作线程执行测试（不阻塞主线程）
static void ExecuteMpeg2AsyncWork(napi_env env, void* data)
{
    AsyncMpeg2TestData* workData = static_cast<AsyncMpeg2TestData*>(data);
    int idx = workData->testCaseIndex;
    const std::vector<TestFunction>& tests = *workData->tests;
    if (idx >= 0 && idx < static_cast<int>(tests.size()) && tests[idx] != nullptr) {
        workData->result = tests[idx]();
    } else {
        workData->result = -1;
    }
}

// 完成回调（回到主线程，处理 Promise）
static void CompleteMpeg2AsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncMpeg2TestData* workData = static_cast<AsyncMpeg2TestData*>(data);
    napi_value result;
    napi_create_int32(env, workData->result, &result);
    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// 通用异步执行入口：取参数 → 创建 Promise → 队列异步工作 → 返回 Promise
static napi_value RunTestAsync(napi_env env,
                               napi_callback_info info,
                               const std::vector<TestFunction>& tests,
                               const char* resourceName)
{
    size_t argc = 1;
    napi_value args[1];
    napi_valuetype valuetype;
    int32_t caseNum = -1;
    napi_status status;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    AsyncMpeg2TestData* workData = new AsyncMpeg2TestData();
    workData->deferred = deferred;
    workData->tests = &tests;
    workData->testCaseIndex = caseNum;

    napi_value resName;
    napi_create_string_utf8(env, resourceName, NAPI_AUTO_LENGTH, &resName);

    status = napi_create_async_work(
        env, nullptr, resName, ExecuteMpeg2AsyncWork, CompleteMpeg2AsyncWork, workData, &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

static napi_value VideoDecodeSyncSwMpeg2FuncTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_syncSwMpeg2FuncTests, "VideoDecodeSyncSwMpeg2FuncTest");
}

static napi_value VideoDecodeBlankFrameTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_blankFrameTests, "VideoDecodeBlankFrameTest");
}

static napi_value VideoDecodeBlankAddTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_blankAddTests, "VideoDecodeBlankAddTest");
}

static napi_property_descriptor g_mpeg2Descriptors[] = {
    { "VideoDecodeSyncSwMpeg2FuncTest",
      nullptr,
      VideoDecodeSyncSwMpeg2FuncTest,
      nullptr,
      nullptr,
      nullptr,
      napi_default,
      nullptr },
    { "VideoDecodeBlankFrameTest",
      nullptr,
      VideoDecodeBlankFrameTest,
      nullptr,
      nullptr,
      nullptr,
      napi_default,
      nullptr },
    { "VideoDecodeBlankAddTest", nullptr, VideoDecodeBlankAddTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_mpeg2Descriptors) / sizeof(g_mpeg2Descriptors[0]), g_mpeg2Descriptors);
    return exports;
}
EXTERN_C_END

static napi_module mpeg2swdecoderModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "mpeg2swdecoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&mpeg2swdecoderModule);
}
