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
#include "ApiTest.h"
#include "CommonTool.h"
#include "Func2Test.h"
#include "FuncTest.h"
#include "Hwh265Hdr2sdrTest.h"
#include "StateTest.h"
#include "napi/native_api.h"

using namespace OHOS::Media;

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int ARG_INDEX_1 = 1;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

// Handler count constants for std::array sizes (avoid magic numbers).
static constexpr size_t HWH265_HDR2SDR_COUNT = 1;
static constexpr size_t API_TEST_COUNT = 133;
static constexpr size_t FUNC2_TEST_COUNT = 48;
static constexpr size_t FUNC_TEST_COUNT = 24;
static constexpr size_t STATE_TEST_COUNT = 43;
static constexpr size_t PREPARE_FUNC_COUNT = 4;

using TestHandler = int (*)();

using PrepareFn = void (*)();

int DispatchByCaseNum(int caseNum, const TestHandler* handlers, size_t count)
{
    if (caseNum < 0 || caseNum >= count) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

int DispatchByCaseNum(int caseNum, const PrepareFn* handlers, size_t count)
{
    if (caseNum < 0 || caseNum >= count) {
        return RESULT_ERROR;
    }
    if (handlers[caseNum] != nullptr) {
        handlers[caseNum]();
    }
    return SUCCESS_CODE;
}

struct GenericAsyncContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;

    int32_t caseNum;
    int result;

    const TestHandler* handlers;
    size_t handlerCount;
};

static void ExecuteGenericWork(napi_env env, void* data)
{
    auto* context = static_cast<GenericAsyncContext*>(data);
    try {
        context->result = DispatchByCaseNum(context->caseNum, context->handlers, context->handlerCount);
    } catch (...) {
        context->result = RESULT_ERROR;
    }
}

static void CompleteGenericWork(napi_env env, napi_status status, void* data)
{
    auto* context = static_cast<GenericAsyncContext*>(data);

    napi_value resultValue;
    napi_create_int32(env, context->result, &resultValue);

    napi_resolve_deferred(env, context->deferred, resultValue);
    napi_delete_async_work(env, context->work);

    delete context;
}

static napi_value CreatePrepareFunc(napi_env env, napi_callback_info info, const PrepareFn* handlers, size_t count)
{
    int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
    if (caseNum < 0 || caseNum >= count) {
        napi_throw_error(env, nullptr, "Invalid case number");
        return nullptr;
    }
    int resultCode = DispatchByCaseNum(caseNum, handlers, count);
    napi_value result;
    napi_create_int32(env, resultCode, &result);
    return result;
}

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_api_prepare_fun = { ApiTest::SetUpTestCase,
                                                                             nullptr,
                                                                             ApiTest::SetUp,
                                                                             ApiTest::TearDown };

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_func2_prepare_fun = { Func2Test::SetUpTestCase,
                                                                               nullptr,
                                                                               nullptr,
                                                                               nullptr };

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_func_prepare_fun = { FuncTest::SetUpTestCase,
                                                                              nullptr,
                                                                              nullptr,
                                                                              nullptr };

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_state_prepare_fun = { nullptr,
                                                                               nullptr,
                                                                               StateTest::SetUp,
                                                                               StateTest::TearDown };

static napi_value CreateAsyncTest(napi_env env,
                                  napi_callback_info info,
                                  const TestHandler* handlers,
                                  size_t handlerCount,
                                  const char* resourceNameStr)
{
    int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
    if (caseNum < 0 || caseNum >= handlerCount) {
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

static const std::array<TestHandler, HWH265_HDR2SDR_COUNT> g_hwh265_hdr_Handlers = { HEVC_HW_HDR2SDR_FUNC_002 };

static const std::array<TestHandler, API_TEST_COUNT> g_api_test_Handlers = {
    VIDEO_HWDEC_ILLEGAL_PARA_0100, VIDEO_HWDEC_ILLEGAL_PARA_0200, VIDEO_HWDEC_ILLEGAL_PARA_3300,
    VIDEO_HWDEC_ILLEGAL_PARA_1800, VIDEO_HWDEC_ILLEGAL_PARA_0300, VIDEO_HWDEC_ILLEGAL_PARA_0400,
    VIDEO_HWDEC_ILLEGAL_PARA_0500, VIDEO_HWDEC_ILLEGAL_PARA_1400, VIDEO_HWDEC_ILLEGAL_PARA_5000,
    VIDEO_HWDEC_ILLEGAL_PARA_5100, VIDEO_HWDEC_ILLEGAL_PARA_0600, VIDEO_HWDEC_ILLEGAL_PARA_0700,
    VIDEO_HWDEC_ILLEGAL_PARA_0800, VIDEO_HWDEC_ILLEGAL_PARA_0900, VIDEO_HWDEC_ILLEGAL_PARA_1000,
    VIDEO_HWDEC_ILLEGAL_PARA_1100, VIDEO_HWDEC_ILLEGAL_PARA_4100, VIDEO_HWDEC_ILLEGAL_PARA_1500,
    VIDEO_HWDEC_ILLEGAL_PARA_1200, VIDEO_HWDEC_ILLEGAL_PARA_1300, VIDEO_HWDEC_ILLEGAL_PARA_1600,
    VIDEO_HWDEC_ILLEGAL_PARA_1700, VIDEO_HWDEC_ILLEGAL_PARA_2200, VIDEO_HWDEC_ILLEGAL_PARA_2500,
    VIDEO_HWDEC_ILLEGAL_PARA_2600, VIDEO_HWDEC_ILLEGAL_PARA_2700, VIDEO_HWDEC_ILLEGAL_PARA_2800,
    VIDEO_HWDEC_ILLEGAL_PARA_2900, VIDEO_HWDEC_ILLEGAL_PARA_3000, VIDEO_HWDEC_ILLEGAL_PARA_3100,
    VIDEO_HWDEC_ILLEGAL_PARA_3200, VIDEO_HWDEC_API_0100,          VIDEO_HWDEC_API_0200,
    VIDEO_HWDEC_API_0300,          VIDEO_HWDEC_API_0400,          VIDEO_HWDEC_API_0500,
    VIDEO_HWDEC_API_0600,          VIDEO_HWDEC_API_0700,          VIDEO_HWDEC_API_0800,
    VIDEO_HWDEC_API_0900,          VIDEO_HWDEC_API_1000,          VIDEO_HWDEC_API_1100,
    VIDEO_HWDEC_API_1200,          VIDEO_HWDEC_CAP_API_0100,      VIDEO_HWDEC_CAP_API_0200,
    VIDEO_HWDEC_CAP_API_0300,      VIDEO_HWDEC_CAP_API_0400,      VIDEO_HWDEC_CAP_API_0500,
    VIDEO_HWDEC_CAP_API_0600,      VIDEO_HWDEC_CAP_API_0700,      VIDEO_HWDEC_CAP_API_0800,
    VIDEO_HWDEC_CAP_API_0900,      VIDEO_HWDEC_CAP_API_1000,      VIDEO_HWDEC_CAP_API_3100,
    VIDEO_HWDEC_CAP_API_3200,      VIDEO_HWDEC_CAP_API_3300,      VIDEO_HWDEC_CAP_API_3400,
    VIDEO_HWDEC_CAP_API_3500,      VIDEO_HWDEC_CAP_API_3600,      VIDEO_HWDEC_CAP_API_3700,
    VIDEO_HWDEC_CAP_API_3800,      VIDEO_HWDEC_CAP_API_3900,      VIDEO_HWDEC_CAP_API_4000,
    VIDEO_HWDEC_CAP_API_4100,      VIDEO_HWDEC_CAP_API_4200,      VIDEO_HWDEC_CAP_API_4300,
    VIDEO_HWDEC_CAP_API_4400,      VIDEO_HWDEC_CAP_API_4500,      VIDEO_HWDEC_CAP_API_4600,
    VIDEO_HWDEC_CAP_API_4700,      VIDEO_HWDEC_CAP_API_4800,      VIDEO_HWDEC_CAP_API_4900,
    VIDEO_HWDEC_CAP_API_5000,      VIDEO_HWDEC_CAP_API_1700,      VIDEO_HWDEC_CAP_API_5100,
    VIDEO_HWDEC_CAP_API_5200,      VIDEO_HWDEC_CAP_API_5300,      VIDEO_HWDEC_CAP_API_9400,
    VIDEO_HWDEC_CAP_API_5400,      VIDEO_HWDEC_CAP_API_5500,      VIDEO_HWDEC_CAP_API_5600,
    VIDEO_HWDEC_CAP_API_5700,      VIDEO_HWDEC_CAP_API_1600,      VIDEO_HWDEC_CAP_API_5800,
    VIDEO_HWDEC_CAP_API_5900,      VIDEO_HWDEC_CAP_API_6000,      VIDEO_HWDEC_CAP_API_6100,
    VIDEO_HWDEC_CAP_API_6200,      VIDEO_HWDEC_CAP_API_6300,      VIDEO_HWDEC_CAP_API_6400,
    VIDEO_HWDEC_CAP_API_6500,      VIDEO_HWDEC_CAP_API_6600,      VIDEO_HWDEC_CAP_API_6700,
    VIDEO_HWDEC_CAP_API_6800,      VIDEO_HWDEC_CAP_API_6900,      VIDEO_HWDEC_CAP_API_7000,
    VIDEO_HWDEC_CAP_API_7100,      VIDEO_HWDEC_CAP_API_1200,      VIDEO_HWDEC_CAP_API_7200,
    VIDEO_HWDEC_CAP_API_7300,      VIDEO_HWDEC_CAP_API_7400,      VIDEO_HWDEC_CAP_API_7500,
    VIDEO_HWDEC_CAP_API_1300,      VIDEO_HWDEC_CAP_API_7600,      VIDEO_HWDEC_CAP_API_7700,
    VIDEO_HWDEC_CAP_API_7800,      VIDEO_HWDEC_CAP_API_7900,      VIDEO_HWDEC_CAP_API_8000,
    VIDEO_HWDEC_CAP_API_1400,      VIDEO_HWDEC_CAP_API_8100,      VIDEO_HWDEC_CAP_API_8200,
    VIDEO_HWDEC_CAP_API_8300,      VIDEO_HWDEC_ATTIME_API_0010,   VIDEO_DECODE_SYNC_API_0010,
    VIDEO_DECODE_SYNC_API_0020,    VIDEO_DECODE_SYNC_API_0030,    VIDEO_DECODE_SYNC_API_0040,
    VIDEO_DECODE_SYNC_API_0050,    VIDEO_DECODE_SYNC_API_0060,    VIDEO_DECODE_SYNC_API_0070,
    VIDEO_DECODE_SYNC_API_0080,    VIDEO_HWDEC_FORMAT_API_0010,   VIDEO_HWDEC_FORMAT_API_0020,
    VIDEO_HWDEC_API_ADD_0010,      VIDEO_HWDEC_API_ADD_0020,      VIDEO_HWDEC_API_ADD_0030,
    VIDEO_HWDEC_API_ADD_0040,      VIDEO_HWDEC_API_ADD_0050,      VIDEO_HWDEC_API_ADD_0060,
    VIDEO_HWDEC_API_ADD_0070,      VIDEO_HWDEC_API_ADD_0080,      VIDEO_HWDEC_API_ADD_0090,
    VIDEO_HWDEC_API_ADD_0100
};

static const std::array<TestHandler, FUNC2_TEST_COUNT> g_func2_test_Handlers = {
    VIDEO_DECODE_SYNC_FUNC_0010,
    VIDEO_DECODE_SYNC_FUNC_0020,
    VIDEO_DECODE_SYNC_FUNC_0030,
    VIDEO_DECODE_SYNC_FUNC_0040,
    VIDEO_DECODE_SYNC_FUNC_0050,
    VIDEO_DECODE_SYNC_FUNC_0060,
    VIDEO_DECODE_SYNC_FUNC_0070,
    VIDEO_DECODE_SYNC_FUNC_0080,
    VIDEO_DECODE_SYNC_FUNC_0090,
    VIDEO_DECODE_SYNC_FUNC_0100,
    VIDEO_DECODE_SYNC_FUNC_0110,
    VIDEO_DECODE_SYNC_FUNC_0120,
    VIDEO_DECODE_SYNC_FUNC_0130,
    VIDEO_DECODE_SYNC_FUNC_0140,
    VIDEO_DECODE_SYNC_FUNC_0150,
    VIDEO_DECODE_SYNC_FUNC_0160,
    VIDEO_DECODE_SYNC_FUNC_0170,
    VIDEO_DECODE_SYNC_HW264_FUNC_0010,
    VIDEO_DECODE_SYNC_HW264_FUNC_0020,
    VIDEO_DECODE_SYNC_HW265_FUNC_0010,
    VIDEO_DECODE_SYNC_HW265_FUNC_0020,
    VIDEO_DECODE_SYNC_HW265_FUNC_0040,
    VIDEO_DECODE_SYNC_HW266_FUNC_0010,
    VIDEO_DECODE_SYNC_HW266_FUNC_0020,
    VIDEO_DECODE_SYNC_HW266_FUNC_0040,
    VIDEO_DECODE_SYNC_HW264_LOWLATENCY_FUNC_0010,
    VIDEO_DECODE_SYNC_HW265_LOWLATENCY_FUNC_0010,
    VIDEO_DECODE_SYNC_HW266_LOWLATENCY_FUNC_0010,
    VIDEO_DECODE_H264_BLANK_FRAME_0010,
    VIDEO_DECODE_H265_BLANK_FRAME_0020,
    VIDEO_DECODE_H266_BLANK_FRAME_0030,
    VIDEO_DECODE_LOW_LATENCY_0001,
    VIDEO_DECODE_LOW_LATENCY_0002,
    VIDEO_DECODE_LOW_LATENCY_0003,
    VIDEO_DECODE_LOW_LATENCY_0004,
    VIDEO_DECODE_LOW_LATENCY_0005,
    VIDEO_DECODE_LOW_LATENCY_0006,
    VIDEO_DECODE_LOW_LATENCY_0007,
    VIDEO_DECODE_LOW_LATENCY_0008,
    VIDEO_DECODE_LOW_LATENCY_0009,
    VIDEO_HWDEC_PIXE_FORMAT_0030,
    VIDEO_DECODE_TRANSFORM_0010,
    VIDEO_DECODE_TRANSFORM_0020,
    VIDEO_DECODE_RESOLUTION_0010,
    VIDEO_DECODE_ANOTHER_0010,
    VIDEO_CAPABILITY_CONFIG_0010,
    VIDEO_CAPABILITY_CONFIG_0020,
    VIDEO_CAPABILITY_CONFIG_0030
};

static const std::array<TestHandler, FUNC_TEST_COUNT> g_func_test_Handlers = {
    VIDEO_HWDEC_FUNCTION_0200, VIDEO_HWDEC_FUNCTION_0300, VIDEO_HWDEC_FUNCTION_0400, VIDEO_HWDEC_FUNCTION_0700,
    VIDEO_HWDEC_FUNCTION_0800, VIDEO_HWDEC_FUNCTION_0900, VIDEO_HWDEC_FUNCTION_1000, VIDEO_HWDEC_FUNCTION_1100,
    VIDEO_HWDEC_FUNCTION_1200, VIDEO_HWDEC_FUNCTION_1300, VIDEO_HWDEC_FUNCTION_1400, VIDEO_HWDEC_FUNCTION_1600,
    VIDEO_HWDEC_FUNCTION_1700, SURF_CHANGE_FUNC_001,      SURF_CHANGE_FUNC_002,      SURF_CHANGE_FUNC_003,
    SURF_CHANGE_FUNC_004,      OUTPUT_DECS_FUNC_001,      OUTPUT_DECS_FUNC_002,      OUTPUT_DECS_FUNC_003,
    OUTPUT_DECS_FUNC_004,      OUTPUT_DECS_FUNC_005,      OUTPUT_DECS_FUNC_006,      OUTPUT_DECS_FUNC_007
};

static const std::array<TestHandler, STATE_TEST_COUNT> g_state_test_Handlers = {
    VIDEO_HWDEC_STATE_0100, VIDEO_HWDEC_STATE_0101, VIDEO_HWDEC_STATE_0200, VIDEO_HWDEC_STATE_0300,
    VIDEO_HWDEC_STATE_0400, VIDEO_HWDEC_STATE_0500, VIDEO_HWDEC_STATE_0600, VIDEO_HWDEC_STATE_0700,
    VIDEO_HWDEC_STATE_0800, VIDEO_HWDEC_STATE_0900, VIDEO_HWDEC_STATE_1000, VIDEO_HWDEC_STATE_1100,
    VIDEO_HWDEC_STATE_1200, VIDEO_HWDEC_STATE_1300, VIDEO_HWDEC_STATE_1400, VIDEO_HWDEC_STATE_1500,
    VIDEO_HWDEC_STATE_1600, VIDEO_HWDEC_STATE_1700, VIDEO_HWDEC_STATE_1800, VIDEO_HWDEC_STATE_1900,
    VIDEO_HWDEC_STATE_2000, VIDEO_HWDEC_STATE_2100, VIDEO_HWDEC_STATE_2200, VIDEO_HWDEC_STATE_2300,
    VIDEO_HWDEC_STATE_2400, VIDEO_HWDEC_STATE_2500, VIDEO_HWDEC_STATE_2600, VIDEO_HWDEC_STATE_2700,
    VIDEO_HWDEC_STATE_2800, VIDEO_HWDEC_STATE_2900, VIDEO_HWDEC_STATE_3000, VIDEO_HWDEC_STATE_3100,
    VIDEO_HWDEC_STATE_3200, VIDEO_HWDEC_STATE_3300, VIDEO_HWDEC_STATE_3400, VIDEO_HWDEC_STATE_3500,
    VIDEO_HWDEC_STATE_3600, VIDEO_HWDEC_STATE_3700, VIDEO_HWDEC_STATE_3800, VIDEO_HWDEC_STATE_3900,
    VIDEO_HWDEC_STATE_4000, VIDEO_HWDEC_STATE_4100, VIDEO_HWDEC_STATE_4200
};

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static napi_value Hwh265_Hdr2sdr_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env, info, g_hwh265_hdr_Handlers.data(), g_hwh265_hdr_Handlers.size(), "Hwh265_Hdr2sdr_Test");
}

static napi_value Api_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(env, info, g_api_test_Handlers.data(), g_api_test_Handlers.size(), "Api_Test");
}

static napi_value Func2_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(env, info, g_func2_test_Handlers.data(), g_func2_test_Handlers.size(), "Func2_Test");
}

static napi_value Func_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(env, info, g_func_test_Handlers.data(), g_func_test_Handlers.size(), "Func_Test");
}

static napi_value State_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(env, info, g_state_test_Handlers.data(), g_state_test_Handlers.size(), "State_Test");
}

static napi_value Api_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_api_prepare_fun.data(), g_api_prepare_fun.size());
}

static napi_value Func2_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_func2_prepare_fun.data(), g_func2_prepare_fun.size());
}

static napi_value Func_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_func_prepare_fun.data(), g_func_prepare_fun.size());
}

static napi_value State_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_state_prepare_fun.data(), g_state_prepare_fun.size());
}

static const napi_property_descriptor g_audioEncoderDescriptors[] = {
    DECL_NAPI_DESC(Hwh265_Hdr2sdr_Test), DECL_NAPI_DESC(Api_Test),          DECL_NAPI_DESC(Func2_Test),
    DECL_NAPI_DESC(Func_Test),           DECL_NAPI_DESC(State_Test),        DECL_NAPI_DESC(Api_Test_Prepare),
    DECL_NAPI_DESC(Func2_Test_Prepare),  DECL_NAPI_DESC(Func_Test_Prepare), DECL_NAPI_DESC(State_Test_Prepare),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_audioEncoderDescriptors) / sizeof(g_audioEncoderDescriptors[0]),
                           g_audioEncoderDescriptors);
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
