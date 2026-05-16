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
#include "include/CommonToolTest.h"
#include "napi/native_api.h"
#include "include/BframeFuncTest.h"
#include "include/PostSqrFuncTest.h"
#include "include/PtsApiTest.h"
#include "include/RoiFuncTest.h"
#include "include/SqrFuncTest.h"

using namespace OHOS::Media;

static constexpr int ARG_INDEX = 0;
static constexpr int ARG_INDEX_1 = 1;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

static constexpr size_t BFRAME_FUNC_TEST_COUNT = 6;
static constexpr size_t POST_SQR_FUNC_TEST_COUNT = 9;
static constexpr size_t PTS_API_TEST_COUNT = 6;
static constexpr size_t ROI_FUNC_TEST_COUNT = 10;
static constexpr size_t SQR_FUNC_TEST_COUNT = 14;
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

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_bframe_prepare_fun = {BframeFuncTest::SetUpTestCase,
    nullptr,
    nullptr,
    BframeFuncTest::TearDown
};

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_postSqr_prepare_fun = {PostSqrFuncTest::SetUpTestCase,
    nullptr,
    nullptr,
    PostSqrFuncTest::TearDown
};

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_ptsApi_prepare_fun = {PtsApiTest::SetUpTestCase,
    nullptr,
    nullptr,
    PtsApiTest::TearDown
};

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_roi_prepare_fun = {RoiFuncTest::SetUpTestCase,
    nullptr,
    nullptr,
    RoiFuncTest::TearDown
};

static const std::array<PrepareFn, PREPARE_FUNC_COUNT> g_sqr_prepare_fun = {SqrFuncTest::SetUpTestCase,
    nullptr,
    nullptr,
    SqrFuncTest::TearDown
};

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

static const std::array<TestHandler, BFRAME_FUNC_TEST_COUNT> g_bframeFunc_test_Handlers = {
    VIDEO_HW_ENCODE_B_FUNC_001, VIDEO_HW_ENCODE_B_FUNC_002,
    VIDEO_HW_ENCODE_B_FUNC_003, VIDEO_HW_ENCODE_B_FUNC_004,
    VIDEO_HW_ENCODE_B_FUNC_005, VIDEO_HW_ENCODE_B_FUNC_006
};

static const std::array<TestHandler, POST_SQR_FUNC_TEST_COUNT> g_postSqrFunc_test_Handlers = {
    VIDEO_HW_ENCODE_FUNC_SQR_001, VIDEO_HW_ENCODE_FUNC_SQR_002,
    VIDEO_HW_ENCODE_FUNC_SQR_003, VIDEO_HW_ENCODE_FUNC_SQR_004,
    VIDEO_HW_ENCODE_FUNC_SQR_005, VIDEO_HW_ENCODE_FUNC_SQR_006,
    VIDEO_HW_ENCODE_FUNC_SQR_007, VIDEO_HW_ENCODE_FUNC_SQR_008,
    VIDEO_HW_ENCODE_FUNC_SQR_009
};

static const std::array<TestHandler, PTS_API_TEST_COUNT> g_ptsApi_test_Handlers = {
    VIDEO_HW_ENCODE_PTS_FUNC_001, VIDEO_HW_ENCODE_PTS_FUNC_002,
    VIDEO_HW_ENCODE_PTS_FUNC_003, VIDEO_HW_ENCODE_PTS_FUNC_004,
    VIDEO_HW_ENCODE_PTS_FUNC_005, VIDEO_HW_ENCODE_PTS_FUNC_006
};

static const std::array<TestHandler, ROI_FUNC_TEST_COUNT> g_roiFunc_test_Handlers = {
    VIDEO_HW_ENCODE_ROI_FUNC_001, VIDEO_HW_ENCODE_ROI_FUNC_002,
    VIDEO_HW_ENCODE_ROI_FUNC_003, VIDEO_HW_ENCODE_ROI_FUNC_004,
    VIDEO_HW_ENCODE_ROI_FUNC_005, VIDEO_HW_ENCODE_ROI_FUNC_006,
    VIDEO_HW_ENCODE_ROI_FUNC_007, VIDEO_HW_ENCODE_ROI_FUNC_008,
    VIDEO_HW_ENCODE_ROI_FUNC_009, VIDEO_HW_ENCODE_ROI_FUNC_010
};

static const std::array<TestHandler, SQR_FUNC_TEST_COUNT> g_sqrFunc_test_Handlers = {
    VIDEO_HW_ENCODE_SQR_FUNC_001, VIDEO_HW_ENCODE_SQR_FUNC_002,
    VIDEO_HW_ENCODE_SQR_FUNC_003, VIDEO_HW_ENCODE_SQR_FUNC_004,
    VIDEO_HW_ENCODE_SQR_FUNC_005, VIDEO_HW_ENCODE_SQR_FUNC_006,
    VIDEO_HW_ENCODE_SQR_FUNC_007, VIDEO_HW_ENCODE_SQR_FUNC_008,
    VIDEO_HW_ENCODE_SQR_FUNC_009, VIDEO_HW_ENCODE_SQR_FUNC_010,
    VIDEO_HW_ENCODE_SQR_FUNC_011, VIDEO_HW_ENCODE_SQR_FUNC_012,
    VIDEO_HW_ENCODE_SQR_FUNC_013, VIDEO_HW_ENCODE_SQR_FUNC_014
};

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static napi_value Bframe_Func_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_bframeFunc_test_Handlers.data(),
        g_bframeFunc_test_Handlers.size(),
        "Bframe_Func_Test");
}

static napi_value Post_Sqr_Func_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_postSqrFunc_test_Handlers.data(),
        g_postSqrFunc_test_Handlers.size(),
        "Post_Sqr_Func_Test");
}

static napi_value Pts_Api_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_ptsApi_test_Handlers.data(),
        g_ptsApi_test_Handlers.size(),
        "Pts_Api_Test");
}

static napi_value Roi_Func_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_roiFunc_test_Handlers.data(),
        g_roiFunc_test_Handlers.size(),
        "Roi_Func_Test");
}

static napi_value Sqr_Func_Test(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env,
        info,
        g_sqrFunc_test_Handlers.data(),
        g_sqrFunc_test_Handlers.size(),
        "Sqr_Func_Test");
}

static napi_value Bframe_Func_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_bframe_prepare_fun.data(), g_bframe_prepare_fun.size());
}

static napi_value Post_Sqr_Func_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_postSqr_prepare_fun.data(), g_postSqr_prepare_fun.size());
}

static napi_value Pts_Api_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_ptsApi_prepare_fun.data(), g_ptsApi_prepare_fun.size());
}

static napi_value Roi_Func_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_roi_prepare_fun.data(), g_roi_prepare_fun.size());
}

static napi_value Sqr_Func_Test_Prepare(napi_env env, napi_callback_info info)
{
    return CreatePrepareFunc(env, info, g_sqr_prepare_fun.data(), g_sqr_prepare_fun.size());
}

static const napi_property_descriptor g_audioEncoderDescriptors[] = {
    DECL_NAPI_DESC(Bframe_Func_Test),
    DECL_NAPI_DESC(Post_Sqr_Func_Test),
    DECL_NAPI_DESC(Pts_Api_Test),
    DECL_NAPI_DESC(Roi_Func_Test),
    DECL_NAPI_DESC(Sqr_Func_Test),
    DECL_NAPI_DESC(Bframe_Func_Test_Prepare),
    DECL_NAPI_DESC(Post_Sqr_Func_Test_Prepare),
    DECL_NAPI_DESC(Pts_Api_Prepare),
    DECL_NAPI_DESC(Roi_Func_Test_Prepare),
    DECL_NAPI_DESC(Sqr_Func_Test_Prepare)
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(g_audioEncoderDescriptors) / sizeof(g_audioEncoderDescriptors[0]),
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
