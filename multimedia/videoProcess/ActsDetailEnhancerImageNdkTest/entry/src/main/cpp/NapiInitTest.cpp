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
#include "DetailEnhancerImageNdkUnitTest.cpp"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

// Case number constants to replace magic numbers in switch statements.
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21,
    CASE_NUM_22,
    CASE_NUM_23,
    CASE_NUM_24,
    CASE_NUM_25,
    CASE_NUM_26,
    CASE_NUM_27,
    CASE_NUM_28,
    CASE_NUM_29,
    CASE_NUM_30,
    CASE_NUM_31,
    CASE_NUM_32,
    CASE_NUM_33,
    CASE_NUM_34,
    CASE_NUM_35,
    CASE_NUM_36,
    CASE_NUM_37,
    CASE_NUM_38,
    CASE_NUM_39,
    CASE_NUM_40,
    CASE_NUM_41,
    CASE_NUM_42,
    CASE_NUM_43,
    CASE_NUM_44,
    CASE_NUM_45,
    CASE_NUM_46,
    CASE_NUM_47,
    CASE_NUM_48,
    CASE_NUM_49,
    CASE_NUM_50,
};

using TestFn = int (*)();

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<TestFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

static napi_value VpeImageTest(napi_env env, napi_callback_info info)
{
    const int nullCheckFuncSize = 51;
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<TestFn, nullCheckFuncSize> handlers = {
            OHOS::Media::VideoProcessingEngine::VpeImageNdk01,   OHOS::Media::VideoProcessingEngine::VpeImageNdk02,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk03,   OHOS::Media::VideoProcessingEngine::VpeImageNdk04,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk05,   OHOS::Media::VideoProcessingEngine::VpeImageNdk06,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk07,   OHOS::Media::VideoProcessingEngine::VpeImageNdk08,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk09,   OHOS::Media::VideoProcessingEngine::VpeImageNdk10,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk11,   OHOS::Media::VideoProcessingEngine::VpeImageNdk112,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk113, OHOS::Media::VideoProcessingEngine::VpeImageNdk114,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk115, OHOS::Media::VideoProcessingEngine::VpeImageNdk12,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk13,   OHOS::Media::VideoProcessingEngine::VpeImageNdk14,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk15,   OHOS::Media::VideoProcessingEngine::VpeImageNdk16,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk17,   OHOS::Media::VideoProcessingEngine::VpeImageNdk18,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk19,   OHOS::Media::VideoProcessingEngine::VpeImageNdk20,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk21,   OHOS::Media::VideoProcessingEngine::VpeImageNdk22,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk23,   OHOS::Media::VideoProcessingEngine::VpeImageNdk24,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk25,   OHOS::Media::VideoProcessingEngine::VpeImageNdk26,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk27,   OHOS::Media::VideoProcessingEngine::VpeImageNdk28,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk29,   OHOS::Media::VideoProcessingEngine::VpeImageNdk30,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk31,   OHOS::Media::VideoProcessingEngine::VpeImageNdk32,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk33,   OHOS::Media::VideoProcessingEngine::VpeImageNdk34,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk35,   OHOS::Media::VideoProcessingEngine::VpeImageNdk36,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk37,   OHOS::Media::VideoProcessingEngine::VpeImageNdk38,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk39,   OHOS::Media::VideoProcessingEngine::VpeImageNdk40,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk41,   OHOS::Media::VideoProcessingEngine::VpeImageNdk42,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk43,   OHOS::Media::VideoProcessingEngine::VpeImageNdk44,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk45,   OHOS::Media::VideoProcessingEngine::VpeImageNdk46,
            OHOS::Media::VideoProcessingEngine::VpeImageNdk47
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
    DECL_NAPI_DESC(VpeImageTest),
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
