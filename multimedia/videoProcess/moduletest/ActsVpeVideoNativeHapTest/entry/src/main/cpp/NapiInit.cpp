/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include <array>

#include "include/ApiTest.h"
#include "include/CommonTool.h"
#include "napi/native_api.h"

// 通用参数与返回码
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

using TestHandler = int (*)();

using namespace VpeVideo::Api;

struct GenericAsyncContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;

    int32_t caseNum;
    int result;

    const TestHandler* handlers;
    size_t handlerCount;
};

static int DispatchByCaseNum(int caseNum, const TestHandler* handlers, size_t count)
{
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= count) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

static void ExecuteGenericWork(napi_env env, void* data)
{
    (void)env;
    auto* context = static_cast<GenericAsyncContext*>(data);
    try {
        context->result = DispatchByCaseNum(context->caseNum, context->handlers, context->handlerCount);
    } catch (...) {
        context->result = RESULT_ERROR;
    }
}

static void CompleteGenericWork(napi_env env, napi_status status, void* data)
{
    (void)status;
    auto* context = static_cast<GenericAsyncContext*>(data);

    napi_value resultValue;
    napi_create_int32(env, context->result, &resultValue);

    napi_resolve_deferred(env, context->deferred, resultValue);
    napi_delete_async_work(env, context->work);

    delete context;
}

static napi_value CreateAsyncTest(napi_env env,
                                  napi_callback_info info,
                                  const TestHandler* handlers,
                                  size_t handlerCount,
                                  const char* resourceNameStr)
{
    int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= handlerCount) {
        napi_throw_error(env, nullptr, "Invalid case number");
        return nullptr;
    }

    napi_value promise;
    auto* context = new GenericAsyncContext();
    context->env = env;
    context->caseNum = caseNum;
    context->result = RESULT_ERROR;
    context->handlers = handlers;
    context->handlerCount = handlerCount;

    napi_create_promise(env, &context->deferred, &promise);

    napi_value resourceName;
    napi_create_string_utf8(env, resourceNameStr, NAPI_AUTO_LENGTH, &resourceName);
    napi_create_async_work(
        env, nullptr, resourceName, ExecuteGenericWork, CompleteGenericWork, context, &context->work);
    napi_queue_async_work(env, context->work);

    return promise;
}

// 将 ApiTest.h 中所有用例函数注册到一个处理数组中，按 caseNum 下标调用
static const std::array<TestHandler, 63> g_vpe_video_api_handlers = {
    VPE_VIDEO_API_TEST_0010, VPE_VIDEO_API_TEST_0020, VPE_VIDEO_API_TEST_0030, VPE_VIDEO_API_TEST_0040,
    VPE_VIDEO_API_TEST_0050, VPE_VIDEO_API_TEST_0060, VPE_VIDEO_API_TEST_0070, VPE_VIDEO_API_TEST_0080,
    VPE_VIDEO_API_TEST_0090, VPE_VIDEO_API_TEST_0100, VPE_VIDEO_API_TEST_0110, VPE_VIDEO_API_TEST_0120,
    VPE_VIDEO_API_TEST_0130, VPE_VIDEO_API_TEST_0140, VPE_VIDEO_API_TEST_0150, VPE_VIDEO_API_TEST_0160,
    VPE_VIDEO_API_TEST_0170, VPE_VIDEO_API_TEST_0180, VPE_VIDEO_API_TEST_0190, VPE_VIDEO_API_TEST_0200,
    VPE_VIDEO_API_TEST_0201, VPE_VIDEO_API_TEST_0210, VPE_VIDEO_API_TEST_0220, VPE_VIDEO_API_TEST_0230,
    VPE_VIDEO_API_TEST_0240, VPE_VIDEO_API_TEST_0250, VPE_VIDEO_API_TEST_0260, VPE_VIDEO_API_TEST_0270,
    VPE_VIDEO_API_TEST_0280, VPE_VIDEO_API_TEST_0290, VPE_VIDEO_API_TEST_0291, VPE_VIDEO_API_TEST_0300,
    VPE_VIDEO_API_TEST_0310, VPE_VIDEO_API_TEST_0320, VPE_VIDEO_API_TEST_0330, VPE_VIDEO_API_TEST_0340,
    VPE_VIDEO_API_TEST_0350, VPE_VIDEO_API_TEST_0360, VPE_VIDEO_API_TEST_0370, VPE_VIDEO_API_TEST_0380,
    VPE_VIDEO_API_TEST_0390, VPE_VIDEO_API_TEST_0400, VPE_VIDEO_API_TEST_0410, VPE_VIDEO_API_TEST_0420,
    VPE_VIDEO_API_TEST_0430, VPE_VIDEO_API_TEST_0440, VPE_VIDEO_API_TEST_0450, VPE_VIDEO_API_TEST_0460,
    VPE_VIDEO_API_TEST_0470, VPE_VIDEO_API_TEST_0480, VPE_VIDEO_API_TEST_0490, VPE_VIDEO_API_TEST_0500,
    VPE_VIDEO_API_TEST_0510, VPE_VIDEO_API_TEST_0520, VPE_VIDEO_API_TEST_0530, VPE_VIDEO_API_TEST_0540,
    VPE_VIDEO_API_TEST_0550, VPE_VIDEO_API_TEST_0560, VPE_VIDEO_API_TEST_0570, VPE_VIDEO_API_TEST_0580,
    VPE_VIDEO_API_TEST_0590, VPE_VIDEO_API_TEST_0591, VPE_VIDEO_API_TEST_0600,
};

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

// N-API 导出 TearDown，供测试框架在每个用例后调用
static napi_value TearDown(napi_env env, napi_callback_info info)
{
    (void)env;
    (void)info;
    TearDown();
    napi_value result;
    napi_create_int32(env, SUCCESS_CODE, &result);
    return result;
}

// 对外暴露的异步 N-API 接口，JS 侧通过传入 caseNum 选择具体用例
static napi_value Api_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env, info, g_vpe_video_api_handlers.data(), g_vpe_video_api_handlers.size(), "VPE_Video_Api_Test");
}

static const napi_property_descriptor g_vpeVideoDescriptors[] = {
    DECL_NAPI_DESC(Api_Test),
    DECL_NAPI_DESC(TearDown),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_vpeVideoDescriptors) / sizeof(g_vpeVideoDescriptors[0]), g_vpeVideoDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module g_vpeVideoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&g_vpeVideoModule);
}
