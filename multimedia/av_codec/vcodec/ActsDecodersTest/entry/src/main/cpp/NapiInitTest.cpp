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
#include "include/VideoDecoderApiTest.h"
#include "include/VideoDecoderFuncTest.h"

using namespace OHOS::Media;

// API Test case number enum
enum ApiTestCaseNumber {
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
    TEST_CASE_VP8_CAP_API_0001 = 12,
    TEST_CASE_VP9_CAP_API_0001 = 13,
    TEST_CASE_AV1_CAP_API_0001 = 14,
    TEST_CASE_RV30_CAP_API_0001 = 15,
    TEST_CASE_RV40_CAP_API_0001 = 16,
    TEST_CASE_MJPEG_CAP_API_0001 = 17,
    TEST_CASE_MSVIDEO1_CAP_API_0001 = 18,
    TEST_CASE_RAWVIDEO_CAP_API_0001 = 19,
    TEST_CASE_MPEG1_CAP_API_0001 = 20,
    TEST_CASE_WVC1_CAP_API_0001 = 21,
    TEST_CASE_WMV3_CAP_API_0001 = 22,
    TEST_CASE_DVVIDEO_CAP_API_0001 = 23,
    TEST_CASE_VP9_CAP_API_0013 = 24,
    TEST_CASE_AV1_CAP_API_0014 = 25,
    TEST_CASE_AV1_CAP_API_0015 = 26,
    TEST_CASE_WVC1_CAP_API_0016 = 27,
    TEST_CASE_AV1_CAP_API_0017 = 28,
    TEST_CASE_CAP_API_0018 = 29,
    TEST_CASE_CAP_API_0019 = 30,
    TEST_CASE_CAP_API_0020 = 31,
    TEST_CASE_CAP_API_0021 = 32,
    TEST_CASE_CAP_API_0022 = 33,
    TEST_CASE_CAP_API_0023 = 34,
    TEST_CASE_CAP_API_0024 = 35,
    TEST_CASE_CAP_API_0025 = 36,
    TEST_CASE_CAP_API_0026 = 37
};

// Function Test case number enum
enum FuncTestCaseNumber {
    TEST_CASE_VC1_FUNCTION_0001 = 0,
    TEST_CASE_MJPEG_FUNCTION_0003 = 1,
    TEST_CASE_MSVIDEO1_FUNCTION_0005 = 2,
    TEST_CASE_VC1_FUNCTION_0002 = 3,
    TEST_CASE_MJPEG_FUNCTION_0004 = 4,
    TEST_CASE_MSVIDEO1_FUNCTION_0006 = 5,
    TEST_CASE_VP8_FUNCTION_0007 = 6,
    TEST_CASE_VP9_FUNCTION_0008 = 7,
    TEST_CASE_VP9_FUNCTION_0009 = 8,
    TEST_CASE_VP9_FUNCTION_0010 = 9,
    TEST_CASE_VP9_FUNCTION_0011 = 10,
    TEST_CASE_AV1_FUNCTION_0012 = 11,
    TEST_CASE_AV1_FUNCTION_0013 = 12,
    TEST_CASE_AV1_FUNCTION_0015 = 13,
    TEST_CASE_AV1_FUNCTION_0016 = 14,
    TEST_CASE_VP9_FUNCTION_0019 = 15,
    TEST_CASE_VP9_FUNCTION_0020 = 16,
    TEST_CASE_VP8_FUNCTION_0021 = 17,
    TEST_CASE_CINEPAK_FUNCTION_0022 = 18
};

static napi_value CreateResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// Type definition for test function pointer
typedef int (*TestFunction)();

// API Test function lookup table
static const TestFunction API_TEST_FUNCTIONS[] = {
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
    VideoVp8DecCapApi0001,           // 12
    VideoVp9DecCapApi0001,           // 13
    VideoAv1DecCapApi0001,           // 14
    VideoRv30DecCapApi0001,          // 15
    VideoRv40DecCapApi0001,          // 16
    VideoMjpegDecCapApi0001,         // 17
    VideoMsvideo1DecCapApi0001,      // 18
    VideoRawvideoDecCapApi0001,      // 19
    VideoMpeg1DecCapApi0001,         // 20
    VideoWvc1DecCapApi0001,          // 21
    VideoWmv3DecCapApi0001,          // 22
    VideoDvvideoDecCapApi0001,       // 23
    VideoVp9DecCapApi0013,           // 24
    VideoAv1DecCapApi0014,           // 25
    VideoAv1DecCapApi0015,           // 26
    VideoWvc1DecCapApi0016,          // 27
    VideoAv1DecCapApi0017,           // 28
    VideoEncCapApi0018,              // 29
    VideoDecCapApi0019,              // 30
    VideoEncCapApi0020,              // 31
    VideoDecCapApi0021,              // 32
    VideoEncCapApi0022,              // 33
    VideoDecCapApi0023,              // 34
    VideoDecCapApi0024,              // 35
    VideoDecCapApi0025,              // 36
    VideoDecCapApi0026,              // 37
    VideoDecCapApi0027               // 38
};

// Function Test function lookup table
static const TestFunction FUNC_TEST_FUNCTIONS[] = {
    VideoVc1DecFunction0001,         // 0 - Buffer mode
    VideoMjpegDecFunction0003,       // 1 - Buffer mode
    VideoMsvideo1DecFunction0005,    // 2 - Buffer mode
    VideoVc1DecFunction0002,         // 3 - Surface mode
    VideoMjpegDecFunction0004,       // 4 - Surface mode
    VideoMsvideo1DecFunction0006,    // 5 - Surface mode
    VideoVp8DecFunction0007,         // 6
    VideoVp9DecFunction0008,         // 7
    VideoVp9DecFunction0009,         // 8
    VideoVp9DecFunction0010,         // 9
    VideoVp9DecFunction0011,         // 10
    VideoAv1DecFunction0012,         // 11
    VideoAv1DecFunction0013,         // 12
    VideoAv1DecFunction0015,         // 13
    VideoAv1DecFunction0016,         // 14
    VideoVp9DecFunction0019,         // 15
    VideoVp9DecFunction0020,         // 16
    VideoVp8DecFunction0021,         // 17
    VideoCinepakDecFunction0022      // 18
};

static const int32_t API_TEST_FUNCTION_COUNT = sizeof(API_TEST_FUNCTIONS) / sizeof(API_TEST_FUNCTIONS[0]);
static const int32_t FUNC_TEST_FUNCTION_COUNT = sizeof(FUNC_TEST_FUNCTIONS) / sizeof(FUNC_TEST_FUNCTIONS[0]);

static napi_value ApiTest(napi_env env, napi_callback_info info)
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

    if (caseNum < 0 || caseNum >= API_TEST_FUNCTION_COUNT) {
        napi_throw_type_error(env, nullptr, "Invalid API test case number");
        return CreateResultValue(env, -1);
    }

    int result = API_TEST_FUNCTIONS[caseNum]();
    return CreateResultValue(env, result);
}

struct FuncTestContext {
    napi_env env;
    napi_deferred deferred;
    int32_t caseNum;
    int result;
};

static void ExecuteFuncTest(napi_env env, void* data)
{
    FuncTestContext* context = static_cast<FuncTestContext*>(data);
    context->result = FUNC_TEST_FUNCTIONS[context->caseNum]();
}

static void CompleteFuncTest(napi_env env, napi_status status, void* data)
{
    FuncTestContext* context = static_cast<FuncTestContext*>(data);
    napi_value result;
    napi_create_int32(env, context->result, &result);
    napi_resolve_deferred(env, context->deferred, result);
    delete context;
}

static napi_value CreateErrorPromise(napi_env env)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);
    napi_value error;
    napi_create_int32(env, -1, &error);
    napi_reject_deferred(env, deferred, error);
    return promise;
}

static napi_value FuncTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return CreateErrorPromise(env);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        return CreateErrorPromise(env);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return CreateErrorPromise(env);
    }

    if (caseNum < 0 || caseNum >= FUNC_TEST_FUNCTION_COUNT) {
        return CreateErrorPromise(env);
    }

    FuncTestContext* context = new FuncTestContext();
    context->env = env;
    context->caseNum = caseNum;
    context->result = 0;

    napi_value promise;
    napi_create_promise(env, &context->deferred, &promise);

    napi_value resourceName;
    napi_create_string_utf8(env, "FuncTest", NAPI_AUTO_LENGTH, &resourceName);

    napi_async_work work;
    napi_create_async_work(env, nullptr, resourceName, ExecuteFuncTest, CompleteFuncTest, context, &work);
    napi_queue_async_work(env, work);

    return promise;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"apitest", nullptr, ApiTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"functest", nullptr, FuncTest, nullptr, nullptr, nullptr, napi_default, nullptr}
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
