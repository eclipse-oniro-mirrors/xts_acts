/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "include/AudioStreamBuilderTest.h"

using namespace OHOS::AudioStandard;

// Test case number constants
enum TestCaseNumber {
    TEST_CASE_CREATE_001 = 0,
    TEST_CASE_CREATE_002 = 1,
    TEST_CASE_DESTROY_001 = 2,
    TEST_CASE_SET_PARAMETER_001 = 3,
    TEST_CASE_SET_PARAMETER_002 = 4,
    TEST_CASE_SET_PARAMETER_003 = 5,
    TEST_CASE_SET_PARAMETER_004 = 6,
    TEST_CASE_SET_PARAMETER_005 = 7,
    TEST_CASE_SET_PARAMETER_006 = 8,
    TEST_CASE_SET_PARAMETER_007 = 9,
    TEST_CASE_SET_PARAMETER_008 = 10,
    TEST_CASE_SET_PARAMETER_009 = 11,
    TEST_CASE_SET_PARAMETER_010 = 12,
    TEST_CASE_SET_PARAMETER_011 = 13,
    TEST_CASE_SET_PARAMETER_012 = 14,
    TEST_CASE_SET_PARAMETER_013 = 15,
    TEST_CASE_SET_PARAMETER_014 = 16,
    TEST_CASE_SET_PARAMETER_015 = 17,
    TEST_CASE_SET_PARAMETER_016 = 18,
    TEST_CASE_SET_PARAMETER_017 = 19,
    TEST_CASE_SET_PARAMETER_018 = 20,
    TEST_CASE_SET_PARAMETER_019 = 21,
    TEST_CASE_SET_PARAMETER_020 = 22,
    TEST_CASE_SET_RENDERER_PRIVACY_001 = 23,
    TEST_CASE_SET_RENDERER_PRIVACY_002 = 24,
    TEST_CASE_SET_RENDERER_PRIVACY_003 = 25,
    TEST_CASE_SET_SAMPLE_FORMAT_001 = 26,
    TEST_CASE_SET_SAMPLE_FORMAT_002 = 27,
    TEST_CASE_SET_SAMPLE_FORMAT_003 = 28,
    TEST_CASE_SET_SAMPLE_FORMAT_004 = 29,
    TEST_CASE_SET_SAMPLE_FORMAT_005 = 30,
    TEST_CASE_SET_LATENCY_MODE_001 = 31,
    TEST_CASE_SET_CAPTURER_INFO_001 = 32,
    TEST_CASE_SET_CAPTURER_INFO_002 = 33,
    TEST_CASE_SET_RENDERER_INFO_001 = 34,
    TEST_CASE_SET_RENDERER_INFO_002 = 35,
    TEST_CASE_SET_RENDERER_INFO_003 = 36,
    TEST_CASE_SET_CHANNEL_LAYOUT_001 = 37,
    TEST_CASE_SET_WRITE_DATA_WITH_METADATA_CALLBACK_001 = 38,
    TEST_CASE_SET_INTERRUPT_MODE_001 = 39,
    TEST_CASE_SET_INTERRUPT_MODE_002 = 40,
    TEST_CASE_SET_INTERRUPT_MODE_003 = 41,
    TEST_CASE_SET_INTERRUPT_MODE_006 = 42,
    TEST_CASE_SET_RENDERER_INTERRUPT_MODE_004 = 43,
    TEST_CASE_SET_RENDERER_INTERRUPT_MODE_005 = 44,
    TEST_CASE_SET_RENDERER_WRITE_DATA_CALLBACK_001 = 45,
    TEST_CASE_SET_RENDERER_WRITE_DATA_CALLBACK_002 = 46,
    TEST_CASE_SET_RENDERER_WRITE_DATA_CALLBACK_003 = 47,
    TEST_CASE_SET_RENDERER_WRITE_DATA_CALLBACK_004 = 48
};

static napi_value CreateResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// Type definition for test function pointer
typedef int (*TestFunction)();

// Test function lookup table
static const TestFunction TEST_FUNCTIONS[] = {
    OhAudioStreamBuilderCreate001,  // 0
    OhAudioStreamBuilderCreate002,  // 1
    OhAudioStreamBuilderDestroy001,  // 2
    OhAudioStreamBuilderSetParameter001,  // 3
    OhAudioStreamBuilderSetParameter002,  // 4
    OhAudioStreamBuilderSetParameter003,  // 5
    OhAudioStreamBuilderSetParameter004,  // 6
    OhAudioStreamBuilderSetParameter005,  // 7
    OhAudioStreamBuilderSetParameter006,  // 8
    OhAudioStreamBuilderSetParameter007,  // 9
    OhAudioStreamBuilderSetParameter008,  // 10
    OhAudioStreamBuilderSetParameter009,  // 11
    OhAudioStreamBuilderSetParameter010,  // 12
    OhAudioStreamBuilderSetParameter011,  // 13
    OhAudioStreamBuilderSetParameter012,  // 14
    OhAudioStreamBuilderSetParameter013,  // 15
    OhAudioStreamBuilderSetParameter014,  // 16
    OhAudioStreamBuilderSetParameter015,  // 17
    OhAudioStreamBuilderSetParameter016,  // 18
    OhAudioStreamBuilderSetParameter017,  // 19
    OhAudioStreamBuilderSetParameter018,  // 20
    OhAudioStreamBuilderSetParameter019,  // 21
    OhAudioStreamBuilderSetParameter020,  // 22
    OhAudioStreamBuilderSetRendererPrivacy001,  // 23
    OhAudioStreamBuilderSetRendererPrivacy002,  // 24
    OhAudioStreamBuilderSetRendererPrivacy003,  // 25
    OhAudioStreamBuilderSetSampleFormat001,  // 26
    OhAudioStreamBuilderSetSampleFormat002,  // 27
    OhAudioStreamBuilderSetSampleFormat003,  // 28
    OhAudioStreamBuilderSetSampleFormat004,  // 29
    OhAudioStreamBuilderSetSampleFormat005,  // 30
    OhAudioStreamBuilderSetLatencyMode001,  // 31
    OhAudioStreamBuilderSetCapturerInfo001,  // 32
    OhAudioStreamBuilderSetCapturerInfo002,  // 33
    OhAudioStreamBuilderSetRendererInfo001,  // 34
    OhAudioStreamBuilderSetRendererInfo002,  // 35
    OhAudioStreamBuilderSetRendererInfo003,  // 36
    OhAudioStreamBuilderSetChannelLayout001,  // 37
    OhAudioStreamBuilderSetWriteDataWithMetadataCallback001,  // 38
    OhAudioStreamBuilderSetInterruptMode001,  // 39
    OhAudioStreamBuilderSetInterruptMode002,  // 40
    OhAudioStreamBuilderSetInterruptMode003,  // 41
    OhAudioStreamBuilderSetInterruptMode006,  // 42
    OhAudioStreamBuilderSetRendererInterruptMode004,  // 43
    OhAudioStreamBuilderSetRendererInterruptMode005,  // 44
    OhAudioStreamBuilderSetRendererWriteDataCallback001,  // 45
    OhAudioStreamBuilderSetRendererWriteDataCallback002,  // 46
    OhAudioStreamBuilderSetRendererWriteDataCallback003,  // 47
    OhAudioStreamBuilderSetRendererWriteDataCallback004  // 48
};

static const int32_t TEST_FUNCTION_COUNT = sizeof(TEST_FUNCTIONS) / sizeof(TEST_FUNCTIONS[0]);

static napi_value AudioStreamBuilderTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return CreateResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return CreateResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return CreateResultValue(env, -1);
    }

    // Validate test case number and execute corresponding test function
    if (caseNum < 0 || caseNum >= TEST_FUNCTION_COUNT) {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
        return CreateResultValue(env, -1);
    }

    int result = TEST_FUNCTIONS[caseNum]();
    return CreateResultValue(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"audioStreamBuilderTest", nullptr, AudioStreamBuilderTest,
            nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "audio_stream_builder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
