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
#include "napi/native_api.h"

static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

static constexpr size_t CSC_TEST_HANDLER_COUNT = 5;
static constexpr size_t COMPOSE_TEST_HANDLER_COUNT = 6;
static constexpr size_t INVALID_INSTANCE_TEST_HANDLER_COUNT = 3;

using ImageTestFn = int (*)();
using TestHandler = ImageTestFn;

int DispatchByCaseNum(int caseNum, const TestHandler* handlers, size_t count)
{
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= count) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
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

static int32_t GetInt32Arg(napi_env env, napi_callback_info info, int index, int defaultVal)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc == 0) {
        return defaultVal;
    }
    int32_t val = defaultVal;
    napi_get_value_int32(env, args[index], &val);
    return val;
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

// ColorSpaceConversion tests: 0010~0050
static const TestHandler g_cscTestHandlers[CSC_TEST_HANDLER_COUNT] = {
    VpeImageApiTest0010,
    VpeImageApiTest0020,
    VpeImageApiTest0030,
    VpeImageApiTest0040,
    VpeImageApiTest0050,
};

// Composition/Decomposition/GenerateMetadata tests: 0060~0110
static const TestHandler g_composeTestHandlers[COMPOSE_TEST_HANDLER_COUNT] = {
    VpeImageApiTest0060,
    VpeImageApiTest0070,
    VpeImageApiTest0080,
    VpeImageApiTest0090,
    VpeImageApiTest0100,
    VpeImageApiTest0110,
};

// InvalidInstance tests: 0120~0140
static const TestHandler g_invalidInstanceTestHandlers[INVALID_INSTANCE_TEST_HANDLER_COUNT] = {
    VpeImageApiTest0120,
    VpeImageApiTest0130,
    VpeImageApiTest0140,
};

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static napi_value Image_CscTest(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env, info, g_cscTestHandlers, CSC_TEST_HANDLER_COUNT, "Image_CscTest");
}

static napi_value Image_ComposeTest(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env, info, g_composeTestHandlers, COMPOSE_TEST_HANDLER_COUNT, "Image_ComposeTest");
}

static napi_value Image_InvalidInstanceTest(napi_env env, napi_callback_info info)
{
    return CreateAsyncTest(
        env, info, g_invalidInstanceTestHandlers, INVALID_INSTANCE_TEST_HANDLER_COUNT,
        "Image_InvalidInstanceTest");
}

static const napi_property_descriptor g_imageTestDescriptors[] = {
    DECL_NAPI_DESC(Image_CscTest),
    DECL_NAPI_DESC(Image_ComposeTest),
    DECL_NAPI_DESC(Image_InvalidInstanceTest),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_imageTestDescriptors) / sizeof(g_imageTestDescriptors[0]),
                           g_imageTestDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module imagetestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "imagetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&imagetestModule);
}
