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
#include "include/AudioCapTest.h"
#include "napi/native_api.h"
#include <exception>
#include "include/CapTest.h"

constexpr int ARG_INDEX = 0;
constexpr int DEFAULT_ARG = -1;

enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
};


int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue);

inline int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    return GetInt32ArgImpl(env, info, index, defaultValue);
}
int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    size_t argc = index + 1;
    napi_value args[index + 1];

    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc <= index) {
        napi_throw_type_error(env, nullptr, "Argument missing");
        return defaultValue;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[index], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return defaultValue;
    }

    int32_t result = defaultValue;
    status = napi_get_value_int32(env, args[index], &result);
    if (status != napi_ok) {
        napi_throw_type_error(env, nullptr, "Value is not int32");
        return defaultValue;
    }

    return result;
}


template <typename Func> napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_throw_error(env, nullptr, e.what());
    } catch (...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}

napi_value AudioCapAbility1(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_001();
                break;
            case CASE_NUM_1:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_002();
                break;
            case CASE_NUM_2:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_003();
                break;
            case CASE_NUM_3:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_004();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value AudioCapAbility2(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_005();
                break;
            case CASE_NUM_1:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_006();
                break;
            case CASE_NUM_2:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_007();
                break;
            case CASE_NUM_3:
                result =OHOS::Media::AUDIO_CAPABILITY_TEST_008();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value VideoTemporalEncode1(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0010();
                break;
            case CASE_NUM_1:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0011();
                break;
            case CASE_NUM_2:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0012();
                break;
            case CASE_NUM_3:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0013();
                break;
            case CASE_NUM_4:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0014();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value VideoTemporalEncode2(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0015();
                break;
            case CASE_NUM_1:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0016();
                break;
            case CASE_NUM_2:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0017();
                break;
            case CASE_NUM_3:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0018();
                break;
            case CASE_NUM_4:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0019();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value VideoTemporalEncode3(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0020();
                break;
            case CASE_NUM_1:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0021();
                break;
            case CASE_NUM_2:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0022();
                break;
            case CASE_NUM_3:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0023();
                break;
            case CASE_NUM_4:
                result =OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0024();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

napi_value VideoTemporalEncode4(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result;
        switch (caseNum) {
            case CASE_NUM_0:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0025();
                break;
            case CASE_NUM_1:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0026();
                break;
            case CASE_NUM_2:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0027();
                break;
            case CASE_NUM_3:
                result = OHOS::Media::VIDEO_TEMPORAL_ENCODE_API_0028();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AudioCapAbility1", nullptr, AudioCapAbility1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AudioCapAbility2", nullptr, AudioCapAbility2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoTemporalEncode1", nullptr, VideoTemporalEncode1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoTemporalEncode2", nullptr, VideoTemporalEncode2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoTemporalEncode3", nullptr, VideoTemporalEncode3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"VideoTemporalEncode4", nullptr, VideoTemporalEncode4, nullptr, nullptr, nullptr, napi_default, nullptr},
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
