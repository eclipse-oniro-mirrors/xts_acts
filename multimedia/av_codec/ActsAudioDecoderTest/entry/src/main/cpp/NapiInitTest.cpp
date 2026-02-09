/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/CommonToolTest.h"
#include "include/NullCheckTest.h"
#include "include/ParamCheckTest.h"
#include "include/StatusCheckTest.h"
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
    CASE_NUM_51,
    CASE_NUM_52,
    CASE_NUM_53,
    CASE_NUM_54,
    CASE_NUM_55,
    CASE_NUM_56,
    CASE_NUM_57,
    CASE_NUM_58,
    CASE_NUM_59,
    CASE_NUM_60,
    CASE_NUM_61,
    CASE_NUM_62,
    CASE_NUM_63,
    CASE_NUM_64,
    CASE_NUM_65,
    CASE_NUM_66,
    CASE_NUM_67,
};

using AudioDecoderFn = int (*)();

template <size_t N> int DispatchByCaseNum(int caseNum, const std::array<AudioDecoderFn, N>& handlers)
{
    if (caseNum < CASE_NUM_0 || caseNum >= static_cast<int>(N) || handlers[caseNum] == nullptr) {
        return RESULT_ERROR;
    }
    return handlers[caseNum]();
}

static napi_value NULL_CHECK(napi_env env, napi_callback_info info)
{
    const int nullCheckFuncSize = 31;
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<AudioDecoderFn, nullCheckFuncSize> handlers = {
            Acts::AudioDecoder::NULL_CHECK_001, Acts::AudioDecoder::NULL_CHECK_002, Acts::AudioDecoder::NULL_CHECK_003,
            Acts::AudioDecoder::NULL_CHECK_004, Acts::AudioDecoder::NULL_CHECK_005, Acts::AudioDecoder::NULL_CHECK_006,
            Acts::AudioDecoder::NULL_CHECK_007, Acts::AudioDecoder::NULL_CHECK_008, Acts::AudioDecoder::NULL_CHECK_009,
            Acts::AudioDecoder::NULL_CHECK_010, Acts::AudioDecoder::NULL_CHECK_011, Acts::AudioDecoder::NULL_CHECK_012,
            Acts::AudioDecoder::NULL_CHECK_013, Acts::AudioDecoder::NULL_CHECK_014, Acts::AudioDecoder::NULL_CHECK_015,
            Acts::AudioDecoder::NULL_CHECK_016, Acts::AudioDecoder::NULL_CHECK_017, Acts::AudioDecoder::NULL_CHECK_018,
            Acts::AudioDecoder::NULL_CHECK_019, Acts::AudioDecoder::NULL_CHECK_020, Acts::AudioDecoder::NULL_CHECK_021,
            Acts::AudioDecoder::NULL_CHECK_022, Acts::AudioDecoder::NULL_CHECK_023, Acts::AudioDecoder::NULL_CHECK_024,
            Acts::AudioDecoder::NULL_CHECK_025, Acts::AudioDecoder::NULL_CHECK_026, Acts::AudioDecoder::NULL_CHECK_027,
            Acts::AudioDecoder::NULL_CHECK_028, Acts::AudioDecoder::NULL_CHECK_029, Acts::AudioDecoder::NULL_CHECK_030,
            Acts::AudioDecoder::NULL_CHECK_031,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value PARAM_CHECK(napi_env env, napi_callback_info info)
{
    const int paramCheckFuncSize = 28;
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        static const std::array<AudioDecoderFn, paramCheckFuncSize> handlers = {
            Acts::AudioDecoder::PARAM_CHECK_001, Acts::AudioDecoder::PARAM_CHECK_002,
            Acts::AudioDecoder::PARAM_CHECK_003, Acts::AudioDecoder::PARAM_CHECK_004,
            Acts::AudioDecoder::PARAM_CHECK_005, Acts::AudioDecoder::PARAM_CHECK_006,
            Acts::AudioDecoder::PARAM_CHECK_007, Acts::AudioDecoder::PARAM_CHECK_008,
            Acts::AudioDecoder::PARAM_CHECK_011, Acts::AudioDecoder::PARAM_CHECK_012,
            Acts::AudioDecoder::PARAM_CHECK_013, Acts::AudioDecoder::PARAM_CHECK_014,
            Acts::AudioDecoder::PARAM_CHECK_016, Acts::AudioDecoder::PARAM_CHECK_017,
            Acts::AudioDecoder::PARAM_CHECK_021, Acts::AudioDecoder::PARAM_CHECK_022,
            Acts::AudioDecoder::PARAM_CHECK_023, Acts::AudioDecoder::PARAM_CHECK_024,
            Acts::AudioDecoder::PARAM_CHECK_025, Acts::AudioDecoder::PARAM_CHECK_026,
            Acts::AudioDecoder::PARAM_CHECK_027, Acts::AudioDecoder::PARAM_CHECK_028,
            Acts::AudioDecoder::PARAM_CHECK_029, Acts::AudioDecoder::PARAM_CHECK_030,
            Acts::AudioDecoder::PARAM_CHECK_031, Acts::AudioDecoder::PARAM_CHECK_032,
            Acts::AudioDecoder::PARAM_CHECK_033, Acts::AudioDecoder::PARAM_CHECK_034,
        };
        int result = DispatchByCaseNum(caseNum, handlers);
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

struct StatusCheckAsyncContext {
    napi_env env;
    napi_async_work work;
    napi_deferred deferred;
    int32_t caseNum;
    int result;
    static const int statusCheckFuncSize = 68;
    static const std::array<AudioDecoderFn, statusCheckFuncSize> handlers;
};

const std::array<AudioDecoderFn, StatusCheckAsyncContext::statusCheckFuncSize> StatusCheckAsyncContext::handlers = {
    Acts::AudioDecoder::STATUS_CHECK_001, Acts::AudioDecoder::STATUS_CHECK_002, Acts::AudioDecoder::STATUS_CHECK_003,
    Acts::AudioDecoder::STATUS_CHECK_004, Acts::AudioDecoder::STATUS_CHECK_005, Acts::AudioDecoder::STATUS_CHECK_006,
    Acts::AudioDecoder::STATUS_CHECK_007, Acts::AudioDecoder::STATUS_CHECK_008, Acts::AudioDecoder::STATUS_CHECK_009,
    Acts::AudioDecoder::STATUS_CHECK_010, Acts::AudioDecoder::STATUS_CHECK_011, Acts::AudioDecoder::STATUS_CHECK_012,
    Acts::AudioDecoder::STATUS_CHECK_013, Acts::AudioDecoder::STATUS_CHECK_014, Acts::AudioDecoder::STATUS_CHECK_015,
    Acts::AudioDecoder::STATUS_CHECK_016, Acts::AudioDecoder::STATUS_CHECK_017, Acts::AudioDecoder::STATUS_CHECK_018,
    Acts::AudioDecoder::STATUS_CHECK_019, Acts::AudioDecoder::STATUS_CHECK_020, Acts::AudioDecoder::STATUS_CHECK_021,
    Acts::AudioDecoder::STATUS_CHECK_022, Acts::AudioDecoder::STATUS_CHECK_023, Acts::AudioDecoder::STATUS_CHECK_024,
    Acts::AudioDecoder::STATUS_CHECK_025, Acts::AudioDecoder::STATUS_CHECK_026, Acts::AudioDecoder::STATUS_CHECK_027,
    Acts::AudioDecoder::STATUS_CHECK_028, Acts::AudioDecoder::STATUS_CHECK_029, Acts::AudioDecoder::STATUS_CHECK_030,
    Acts::AudioDecoder::STATUS_CHECK_031, Acts::AudioDecoder::STATUS_CHECK_032, Acts::AudioDecoder::STATUS_CHECK_033,
    Acts::AudioDecoder::STATUS_CHECK_034, Acts::AudioDecoder::STATUS_CHECK_035, Acts::AudioDecoder::STATUS_CHECK_036,
    Acts::AudioDecoder::STATUS_CHECK_037, Acts::AudioDecoder::STATUS_CHECK_038, Acts::AudioDecoder::STATUS_CHECK_039,
    Acts::AudioDecoder::STATUS_CHECK_040, Acts::AudioDecoder::STATUS_CHECK_041, Acts::AudioDecoder::STATUS_CHECK_042,
    Acts::AudioDecoder::STATUS_CHECK_043, Acts::AudioDecoder::STATUS_CHECK_044, Acts::AudioDecoder::STATUS_CHECK_045,
    Acts::AudioDecoder::STATUS_CHECK_046, Acts::AudioDecoder::STATUS_CHECK_047, Acts::AudioDecoder::STATUS_CHECK_048,
    Acts::AudioDecoder::STATUS_CHECK_049, Acts::AudioDecoder::STATUS_CHECK_050, Acts::AudioDecoder::STATUS_CHECK_051,
    Acts::AudioDecoder::STATUS_CHECK_052, Acts::AudioDecoder::STATUS_CHECK_053, Acts::AudioDecoder::STATUS_CHECK_054,
    Acts::AudioDecoder::STATUS_CHECK_055, Acts::AudioDecoder::STATUS_CHECK_056, Acts::AudioDecoder::STATUS_CHECK_057,
    Acts::AudioDecoder::STATUS_CHECK_058, Acts::AudioDecoder::STATUS_CHECK_059, Acts::AudioDecoder::STATUS_CHECK_060,
    Acts::AudioDecoder::STATUS_CHECK_061, Acts::AudioDecoder::STATUS_CHECK_062, Acts::AudioDecoder::STATUS_CHECK_063,
    Acts::AudioDecoder::STATUS_CHECK_064, Acts::AudioDecoder::STATUS_CHECK_065, Acts::AudioDecoder::STATUS_CHECK_066,
    Acts::AudioDecoder::STATUS_CHECK_067, Acts::AudioDecoder::STATUS_CHECK_068,
};

static void ExecuteStatusCheckWork(napi_env env, void* data)
{
    StatusCheckAsyncContext* context = static_cast<StatusCheckAsyncContext*>(data);
    try {
        context->result = DispatchByCaseNum(context->caseNum, StatusCheckAsyncContext::handlers);
    } catch (...) {
        context->result = RESULT_ERROR;
    }
}

static void CompleteStatusCheckWork(napi_env env, napi_status status, void* data)
{
    StatusCheckAsyncContext* context = static_cast<StatusCheckAsyncContext*>(data);
    napi_value resultValue;
    napi_create_int32(env, context->result, &resultValue);
    napi_resolve_deferred(env, context->deferred, resultValue);
    napi_delete_async_work(env, context->work);
    delete context;
}

static napi_value STATUS_CHECK(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        if (caseNum < CASE_NUM_0 || caseNum >= StatusCheckAsyncContext::statusCheckFuncSize) {
            napi_throw_error(env, nullptr, "Invalid case number");
            return nullptr;
        }

        napi_value promise;
        StatusCheckAsyncContext* context = new StatusCheckAsyncContext();
        context->env = env;
        context->caseNum = caseNum;
        context->result = RESULT_ERROR;

        napi_create_promise(env, &context->deferred, &promise);

        napi_value resourceName;
        napi_create_string_utf8(env, "STATUS_CHECK", NAPI_AUTO_LENGTH, &resourceName);

        napi_create_async_work(
            env, nullptr, resourceName, ExecuteStatusCheckWork, CompleteStatusCheckWork, context, &context->work);
        napi_queue_async_work(env, context->work);

        return promise;
    });
}

inline napi_property_descriptor MakeNapiDesc(const char* name, napi_callback cb)
{
    return { name, nullptr, cb, nullptr, nullptr, nullptr, napi_default, nullptr };
}

#define DECL_NAPI_DESC(fn) /* NOLINT(G.PRE.02-CPP) */ MakeNapiDesc(#fn, fn)

static const napi_property_descriptor g_mindsporeDescriptors[] = {
    DECL_NAPI_DESC(NULL_CHECK),
    DECL_NAPI_DESC(PARAM_CHECK),
    DECL_NAPI_DESC(STATUS_CHECK),
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
