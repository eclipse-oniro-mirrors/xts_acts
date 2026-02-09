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


#include "napi/native_api.h"
#include "include/VideoDecoderFuncTest.h"

using namespace OHOS::Media;

// Test case number enum
enum TestCaseNumber {
    // API Tests
    TEST_CASE_VC1_CAP_API_0001 = 0,
    TEST_CASE_VC1_CAP_API_0002 = 1,
    TEST_CASE_VC1_CAP_API_0003 = 2,
    TEST_CASE_VC1_CAP_API_0004 = 3,
    TEST_CASE_VC1_CAP_API_0005 = 4,
    TEST_CASE_VC1_CAP_API_0006 = 5,
    TEST_CASE_VC1_CAP_API_0007 = 6,
    TEST_CASE_VC1_CAP_API_0008 = 7,
    TEST_CASE_MSVIDEO1_CAP_API_0009 = 8,
    TEST_CASE_MSVIDEO1_CAP_API_0010 = 9,
    TEST_CASE_MSVIDEO1_CAP_API_0011 = 10,
    TEST_CASE_MSVIDEO1_CAP_API_0012 = 11,
    // Function Tests (Buffer mode only, Surface mode tests disabled)
    TEST_CASE_VC1_FUNCTION_0001 = 12,
    // TEST_CASE_VC1_FUNCTION_0002 = 13,  // Surface mode - disabled
    TEST_CASE_MJPEG_FUNCTION_0003 = 13,
    // TEST_CASE_MJPEG_FUNCTION_0004 = 15,  // Surface mode - disabled
    TEST_CASE_MSVIDEO1_FUNCTION_0005 = 14
    // TEST_CASE_MSVIDEO1_FUNCTION_0006 = 17  // Surface mode - disabled
};

static napi_value CreateResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// Type definition for test function pointer
typedef int (*TestFunction)();

// Test function lookup table (Surface mode tests removed)
static const TestFunction TEST_FUNCTIONS[] = {
    VideoVc1DecCapApi0001,           // 0
    VideoVc1DecCapApi0002,           // 1
    VideoVc1DecCapApi0003,           // 2
    VideoVc1DecCapApi0004,           // 3
    VideoVc1DecCapApi0005,           // 4
    VideoVc1DecCapApi0006,           // 5
    VideoVc1DecCapApi0007,           // 6
    VideoVc1DecCapApi0008,           // 7
    VideoMsvideo1DecCapApi0009,      // 8
    VideoMsvideo1DecCapApi0010,      // 9
    VideoMsvideo1DecCapApi0011,      // 10
    VideoMsvideo1DecCapApi0012,      // 11
    VideoVc1DecFunction0001,         // 12 - Buffer mode
    // VideoVc1DecFunction0002,      // 13 - Surface mode (disabled)
    VideoMjpegDecFunction0003,       // 13 - Buffer mode
    // VideoMjpegDecFunction0004,    // 15 - Surface mode (disabled)
    VideoMsvideo1DecFunction0005     // 14 - Buffer mode
    // VideoMsvideo1DecFunction0006  // 17 - Surface mode (disabled)
};

static const int32_t TEST_FUNCTION_COUNT = sizeof(TEST_FUNCTIONS) / sizeof(TEST_FUNCTIONS[0]);

static napi_value VideoDecoderTest(napi_env env, napi_callback_info info)
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
        {"videoDecoderTest", nullptr, VideoDecoderTest,
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
    .nm_modname = "decoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
