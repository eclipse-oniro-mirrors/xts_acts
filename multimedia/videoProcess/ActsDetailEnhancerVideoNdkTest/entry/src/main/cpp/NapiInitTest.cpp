/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
#include "include/DetailEnhancerVideoNdkUnitTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

enum CaseNum {
    CASE_NUM_0 = 0,
};

using TestFn = int (*)();

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<TestFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

static napi_value VpeVideoTest(napi_env env, napi_callback_info info)
{
    const int videoNdkFuncSize = 37; // Total 37 test functions
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<TestFn, videoNdkFuncSize> handlers = {
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk01,   // index 0
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk02,   // index 1
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk03,   // index 2
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk05,   // index 3
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk06,   // index 4
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk07,   // index 5
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk08,   // index 6
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk09,   // index 7
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk10,   // index 8
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk11,   // index 9
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk12,   // index 10
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk13,   // index 11
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk14,   // index 12
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk15,   // index 13
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk16,   // index 14
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk17,   // index 15
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk18,   // index 16
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk19,   // index 17
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk20,   // index 18
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk21,   // index 19
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk22,   // index 20
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk23,   // index 21
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk24,   // index 22
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk25,   // index 23
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk26,   // index 24
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk27,   // index 25
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk28,   // index 26
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk29,   // index 27
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk30,   // index 28
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk31,   // index 29
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk32,   // index 30
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk33,   // index 31
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk34,   // index 32
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk342, // index 33
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk35,   // index 34
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk37,   // index 35
            OHOS::Media::VideoProcessingEngine::VpeVideoNdk38,   // index 36
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_mindsporeDescriptors[] = {
    DECL_NAPI_DESC(VpeVideoTest),
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env,
                           exports,
                           sizeof(g_mindsporeDescriptors) / sizeof(g_mindsporeDescriptors[CASE_NUM_0]),
                           g_mindsporeDescriptors);
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
