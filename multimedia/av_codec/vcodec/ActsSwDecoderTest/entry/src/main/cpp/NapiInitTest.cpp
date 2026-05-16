/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <cstddef>
#include <cstdint>
#include "include/ActsApiTest.h"
#include "include/ActsFuncTest.h"
#include "include/ActsStateTest.h"
#include "napi/native_api.h"

namespace {
constexpr int32_t RESULT_ERROR = -1;
// G.CNS.02: case index constants to avoid magic numbers
constexpr int K_IDX0 = 0;
constexpr int K_IDX1 = 1;
constexpr int K_IDX2 = 2;
constexpr int K_IDX3 = 3;
constexpr int K_IDX4 = 4;
constexpr int K_IDX5 = 5;
constexpr int K_IDX6 = 6;
constexpr int K_IDX7 = 7;
constexpr int K_IDX8 = 8;
constexpr int K_IDX9 = 9;
constexpr int K_IDX10 = 10;
constexpr int K_IDX11 = 11;
constexpr int K_IDX12 = 12;
constexpr int K_IDX13 = 13;
constexpr int K_IDX14 = 14;
constexpr int K_IDX15 = 15;
constexpr int K_IDX16 = 16;
constexpr int K_IDX17 = 17;
constexpr int K_IDX18 = 18;
constexpr int K_IDX19 = 19;
constexpr int K_IDX20 = 20;
constexpr int K_IDX21 = 21;
constexpr int K_IDX22 = 22;
constexpr int K_IDX23 = 23;
constexpr int K_IDX24 = 24;
constexpr int K_IDX25 = 25;
constexpr int K_IDX26 = 26;
constexpr int K_IDX27 = 27;
constexpr int K_IDX28 = 28;
constexpr int K_IDX29 = 29;
constexpr int K_IDX30 = 30;
constexpr int K_IDX31 = 31;
constexpr int K_IDX32 = 32;
constexpr int K_IDX33 = 33;
constexpr int K_IDX34 = 34;
constexpr int K_IDX35 = 35;
constexpr int K_IDX36 = 36;
constexpr int K_IDX37 = 37;
constexpr int K_IDX38 = 38;
constexpr int K_IDX39 = 39;
constexpr int K_IDX40 = 40;
constexpr int K_IDX41 = 41;
constexpr int K_IDX42 = 42;
constexpr int K_IDX43 = 43;
constexpr int K_IDX44 = 44;
constexpr int K_IDX45 = 45;
constexpr int K_IDX46 = 46;
constexpr int K_IDX47 = 47;
constexpr int K_IDX48 = 48;
constexpr int K_IDX49 = 49;
constexpr int K_IDX50 = 50;

static int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultVal)
{
    size_t argc = 1;
    napi_value args[1];
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc <= index) {
        return defaultVal;
    }
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, args[index], &type) != napi_ok || type != napi_number) {
        return defaultVal;
    }
    int32_t value = 0;
    if (napi_get_value_int32(env, args[index], &value) != napi_ok) {
        return defaultVal;
    }
    return value;
}

using SwdecRunner = int (*)(int32_t);
using SwdecCaseFn = int (*)();

// Table-driven dispatch reduces function length and cyclomatic complexity (G.FUD.05 / complexity rules).
static const std::array<SwdecCaseFn, 30> kSwdecIllegalParaRunners = { {
    Acts::SwDecoder::VideoSwdecIllegalPara0100, Acts::SwDecoder::VideoSwdecIllegalPara0200,
    Acts::SwDecoder::VideoSwdecIllegalPara3300, Acts::SwDecoder::VideoSwdecIllegalPara1800,
    Acts::SwDecoder::VideoSwdecIllegalPara0300, Acts::SwDecoder::VideoSwdecIllegalPara0400,
    Acts::SwDecoder::VideoSwdecIllegalPara0500, Acts::SwDecoder::VideoSwdecIllegalPara1400,
    Acts::SwDecoder::VideoSwdecIllegalPara5000, Acts::SwDecoder::VideoSwdecIllegalPara5100,
    Acts::SwDecoder::VideoSwdecIllegalPara0600, Acts::SwDecoder::VideoSwdecIllegalPara0700,
    Acts::SwDecoder::VideoSwdecIllegalPara0800, Acts::SwDecoder::VideoSwdecIllegalPara0900,
    Acts::SwDecoder::VideoSwdecIllegalPara1000, Acts::SwDecoder::VideoSwdecIllegalPara1100,
    Acts::SwDecoder::VideoSwdecIllegalPara4100, Acts::SwDecoder::VideoSwdecIllegalPara1500,
    Acts::SwDecoder::VideoSwdecIllegalPara1200, Acts::SwDecoder::VideoSwdecIllegalPara1600,
    Acts::SwDecoder::VideoSwdecIllegalPara1700, Acts::SwDecoder::VideoSwdecIllegalPara2200,
    Acts::SwDecoder::VideoSwdecIllegalPara2500, Acts::SwDecoder::VideoSwdecIllegalPara2600,
    Acts::SwDecoder::VideoSwdecIllegalPara2700, Acts::SwDecoder::VideoSwdecIllegalPara2800,
    Acts::SwDecoder::VideoSwdecIllegalPara2900, Acts::SwDecoder::VideoSwdecIllegalPara3000,
    Acts::SwDecoder::VideoSwdecIllegalPara3100, Acts::SwDecoder::VideoSwdecIllegalPara3200,
} };

static const std::array<SwdecCaseFn, 51> kSwdecCapApiRunners = { {
    Acts::SwDecoder::VideoSwdecCapApi0100, Acts::SwDecoder::VideoSwdecCapApi0300, Acts::SwDecoder::VideoSwdecCapApi0400,
    Acts::SwDecoder::VideoSwdecCapApi0500, Acts::SwDecoder::VideoSwdecCapApi0600, Acts::SwDecoder::VideoSwdecCapApi0700,
    Acts::SwDecoder::VideoSwdecCapApi0800, Acts::SwDecoder::VideoSwdecCapApi0900, Acts::SwDecoder::VideoSwdecCapApi1000,
    Acts::SwDecoder::VideoSwdecCapApi3100, Acts::SwDecoder::VideoSwdecCapApi3200, Acts::SwDecoder::VideoSwdecCapApi3300,
    Acts::SwDecoder::VideoSwdecCapApi3400, Acts::SwDecoder::VideoSwdecCapApi3500, Acts::SwDecoder::VideoSwdecCapApi3600,
    Acts::SwDecoder::VideoSwdecCapApi3700, Acts::SwDecoder::VideoSwdecCapApi3800, Acts::SwDecoder::VideoSwdecCapApi3900,
    Acts::SwDecoder::VideoSwdecCapApi4000, Acts::SwDecoder::VideoSwdecCapApi4100, Acts::SwDecoder::VideoSwdecCapApi4200,
    Acts::SwDecoder::VideoSwdecCapApi4300, Acts::SwDecoder::VideoSwdecCapApi4400, Acts::SwDecoder::VideoSwdecCapApi4500,
    Acts::SwDecoder::VideoSwdecCapApi4600, Acts::SwDecoder::VideoSwdecCapApi4700, Acts::SwDecoder::VideoSwdecCapApi4800,
    Acts::SwDecoder::VideoSwdecCapApi4900, Acts::SwDecoder::VideoSwdecCapApi5000, Acts::SwDecoder::VideoSwdecCapApi5100,
    Acts::SwDecoder::VideoSwdecCapApi5200, Acts::SwDecoder::VideoSwdecCapApi5300, Acts::SwDecoder::VideoSwdecCapApi9400,
    Acts::SwDecoder::VideoSwdecCapApi5400, Acts::SwDecoder::VideoSwdecCapApi5500, Acts::SwDecoder::VideoSwdecCapApi5600,
    Acts::SwDecoder::VideoSwdecCapApi5700, Acts::SwDecoder::VideoSwdecCapApi5800, Acts::SwDecoder::VideoSwdecCapApi5900,
    Acts::SwDecoder::VideoSwdecCapApi6000, Acts::SwDecoder::VideoSwdecCapApi6100, Acts::SwDecoder::VideoSwdecCapApi6200,
    Acts::SwDecoder::VideoSwdecCapApi6300, Acts::SwDecoder::VideoSwdecCapApi6400, Acts::SwDecoder::VideoSwdecCapApi6500,
    Acts::SwDecoder::VideoSwdecCapApi6600, Acts::SwDecoder::VideoSwdecCapApi6700, Acts::SwDecoder::VideoSwdecCapApi6800,
    Acts::SwDecoder::VideoSwdecCapApi6900, Acts::SwDecoder::VideoSwdecCapApi7000, Acts::SwDecoder::VideoSwdecCapApi7100,
} };

static const std::array<SwdecCaseFn, 35> kSwdecStateRunners = { {
    Acts::SwDecoder::VideoSwdecState0100, Acts::SwDecoder::VideoSwdecState0101, Acts::SwDecoder::VideoSwdecState0200,
    Acts::SwDecoder::VideoSwdecState0300, Acts::SwDecoder::VideoSwdecState0400, Acts::SwDecoder::VideoSwdecState0500,
    Acts::SwDecoder::VideoSwdecState0600, Acts::SwDecoder::VideoSwdecState0700, Acts::SwDecoder::VideoSwdecState0800,
    Acts::SwDecoder::VideoSwdecState0900, Acts::SwDecoder::VideoSwdecState1000, Acts::SwDecoder::VideoSwdecState1100,
    Acts::SwDecoder::VideoSwdecState1200, Acts::SwDecoder::VideoSwdecState1300, Acts::SwDecoder::VideoSwdecState1400,
    Acts::SwDecoder::VideoSwdecState1500, Acts::SwDecoder::VideoSwdecState1600, Acts::SwDecoder::VideoSwdecState1700,
    Acts::SwDecoder::VideoSwdecState1800, Acts::SwDecoder::VideoSwdecState1900, Acts::SwDecoder::VideoSwdecState2000,
    Acts::SwDecoder::VideoSwdecState2100, Acts::SwDecoder::VideoSwdecState2200, Acts::SwDecoder::VideoSwdecState2300,
    Acts::SwDecoder::VideoSwdecState2400, Acts::SwDecoder::VideoSwdecState2500, Acts::SwDecoder::VideoSwdecState2600,
    Acts::SwDecoder::VideoSwdecState2700, Acts::SwDecoder::VideoSwdecState2800, Acts::SwDecoder::VideoSwdecState2900,
    Acts::SwDecoder::VideoSwdecState3000, Acts::SwDecoder::VideoSwdecState3100, Acts::SwDecoder::VideoSwdecState3200,
    Acts::SwDecoder::VideoSwdecState3300, Acts::SwDecoder::VideoSwdecState3400,
} };

struct AsyncTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    SwdecRunner runner = nullptr;
    int32_t testCaseIndex = -1;
    int result = RESULT_ERROR;
};

static void ExecuteAsyncWork(napi_env /*env*/, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    try {
        if (workData->runner != nullptr) {
            workData->result = workData->runner(workData->testCaseIndex);
        } else {
            workData->result = RESULT_ERROR;
        }
    } catch (...) {
        workData->result = RESULT_ERROR;
    }
}

static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    napi_value resultValue;
    (void)napi_create_int32(env, workData->result, &resultValue);
    if (status == napi_cancelled) {
        napi_reject_deferred(env, workData->deferred, resultValue);
    } else {
        napi_resolve_deferred(env, workData->deferred, resultValue);
    }
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

static napi_value RunTestAsync(napi_env env, napi_callback_info info, SwdecRunner runner, const char* resourceName)
{
    int32_t caseIndex = GetInt32Arg(env, info, 0, RESULT_ERROR);
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        return nullptr;
    }
    AsyncTestData* workData = new AsyncTestData();
    workData->deferred = deferred;
    workData->runner = runner;
    workData->testCaseIndex = caseIndex;

    napi_value resName;
    if (napi_create_string_utf8(env, resourceName, NAPI_AUTO_LENGTH, &resName) != napi_ok) {
        delete workData;
        return nullptr;
    }
    napi_status createStatus = napi_create_async_work(
        env, nullptr, resName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (createStatus != napi_ok) {
        delete workData;
        return nullptr;
    }
    if (napi_queue_async_work(env, workData->asyncWork) != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        return nullptr;
    }
    return promise;
}

// SwdecFuncCreateTest: 1 case (0200)
static int DispatchSwdecFuncCreateTest(int32_t caseNum)
{
    if (caseNum != 0) {
        return RESULT_ERROR;
    }
    return Acts::SwDecoder::VideoSwdecFunction0200();
}

// SwdecFuncNdkTest: 12 cases (0300..1600)
static int DispatchSwdecFuncNdkTest(int32_t caseNum)
{
    switch (caseNum) {
        case K_IDX0:
            return Acts::SwDecoder::VideoSwdecFunction0300();
        case K_IDX1:
            return Acts::SwDecoder::VideoSwdecFunction0400();
        case K_IDX2:
            return Acts::SwDecoder::VideoSwdecFunction0700();
        case K_IDX3:
            return Acts::SwDecoder::VideoSwdecFunction0800();
        case K_IDX4:
            return Acts::SwDecoder::VideoSwdecFunction4000();
        case K_IDX5:
            return Acts::SwDecoder::VideoSwdecFunction1000();
        case K_IDX6:
            return Acts::SwDecoder::VideoSwdecFunction1100();
        case K_IDX7:
            return Acts::SwDecoder::VideoSwdecFunction1200();
        case K_IDX8:
            return Acts::SwDecoder::VideoSwdecFunction1300();
        case K_IDX9:
            return Acts::SwDecoder::VideoSwdecFunction1400();
        case K_IDX10:
            return Acts::SwDecoder::VideoSwdecFunction1500();
        case K_IDX11:
            return Acts::SwDecoder::VideoSwdecFunction1600();
        default:
            return RESULT_ERROR;
    }
}

// SwdecSync264Test: 3 cases (0010, 0020, 0040)
static int DispatchSwdecSync264Test(int32_t caseNum)
{
    switch (caseNum) {
        case K_IDX0:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0010();
        case K_IDX1:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0020();
        case K_IDX2:
            return Acts::SwDecoder::VideoDecodeSyncSw264Func0040();
        default:
            return RESULT_ERROR;
    }
}

// SwdecBlankFrameTest: 1 case (0010)
static int DispatchSwdecBlankFrameTest(int32_t caseNum)
{
    if (caseNum != 0) {
        return RESULT_ERROR;
    }
    return Acts::SwDecoder::VideoSwdecodeBlankFrame0010();
}

static napi_value SwdecFuncCreateTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecFuncCreateTest, "SwdecFuncCreateTest");
}

static napi_value SwdecFuncNdkTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecFuncNdkTest, "SwdecFuncNdkTest");
}

static napi_value SwdecSync264Test(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecSync264Test, "SwdecSync264Test");
}

static napi_value SwdecBlankFrameTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecBlankFrameTest, "SwdecBlankFrameTest");
}

// SwdecApiIllegalParaTest: 30 cases (0-29)
static int DispatchSwdecApiIllegalParaTest(int32_t caseNum)
{
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= kSwdecIllegalParaRunners.size()) {
        return RESULT_ERROR;
    }
    return kSwdecIllegalParaRunners[static_cast<size_t>(caseNum)]();
}

// SwdecApiTest: 12 cases (0-11)
static int DispatchSwdecApiTest(int32_t caseNum)
{
    switch (caseNum) {
        case K_IDX0:
            return Acts::SwDecoder::VideoSwdecApi0100();
        case K_IDX1:
            return Acts::SwDecoder::VideoSwdecApi0200();
        case K_IDX2:
            return Acts::SwDecoder::VideoSwdecApi0300();
        case K_IDX3:
            return Acts::SwDecoder::VideoSwdecApi0400();
        case K_IDX4:
            return Acts::SwDecoder::VideoSwdecApi0500();
        case K_IDX5:
            return Acts::SwDecoder::VideoSwdecApi0600();
        case K_IDX6:
            return Acts::SwDecoder::VideoSwdecApi0700();
        case K_IDX7:
            return Acts::SwDecoder::VideoSwdecApi0800();
        case K_IDX8:
            return Acts::SwDecoder::VideoSwdecApi0900();
        case K_IDX9:
            return Acts::SwDecoder::VideoSwdecApi1000();
        case K_IDX10:
            return Acts::SwDecoder::VideoSwdecApi1100();
        case K_IDX11:
            return Acts::SwDecoder::VideoSwdecApi1200();
        default:
            return RESULT_ERROR;
    }
}

// SwdecCapApiTest: 51 cases (0-50)
static int DispatchSwdecCapApiTest(int32_t caseNum)
{
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= kSwdecCapApiRunners.size()) {
        return RESULT_ERROR;
    }
    return kSwdecCapApiRunners[static_cast<size_t>(caseNum)]();
}

// SwdecOtherCodecIllegalTest: 3 cases (0-2)
static int DispatchSwdecOtherCodecIllegalTest(int32_t caseNum)
{
    switch (caseNum) {
        case K_IDX0:
            return Acts::SwDecoder::VideoMpeg2SwdecIllegalPara0700();
        case K_IDX1:
            return Acts::SwDecoder::VideoMpeg4SwdecIllegalPara0700();
        case K_IDX2:
            return Acts::SwDecoder::VideoH263SwdecIllegalPara0700();
        default:
            return RESULT_ERROR;
    }
}

static napi_value SwdecApiIllegalParaTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecApiIllegalParaTest, "SwdecApiIllegalParaTest");
}

static napi_value SwdecApiTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecApiTest, "SwdecApiTest");
}

static napi_value SwdecCapApiTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecCapApiTest, "SwdecCapApiTest");
}

static napi_value SwdecOtherCodecIllegalTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecOtherCodecIllegalTest, "SwdecOtherCodecIllegalTest");
}

// SwdecStateTest: 35 cases (0-34)
static int DispatchSwdecStateTest(int32_t caseNum)
{
    if (caseNum < 0 || static_cast<size_t>(caseNum) >= kSwdecStateRunners.size()) {
        return RESULT_ERROR;
    }
    return kSwdecStateRunners[static_cast<size_t>(caseNum)]();
}

static napi_value SwdecStateTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, DispatchSwdecStateTest, "SwdecStateTest");
}

static napi_property_descriptor g_swdecDescriptors[] = {
    { "SwdecFuncCreateTest", nullptr, SwdecFuncCreateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecFuncNdkTest", nullptr, SwdecFuncNdkTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecSync264Test", nullptr, SwdecSync264Test, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecBlankFrameTest", nullptr, SwdecBlankFrameTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecApiIllegalParaTest", nullptr, SwdecApiIllegalParaTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecApiTest", nullptr, SwdecApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecCapApiTest", nullptr, SwdecCapApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "SwdecOtherCodecIllegalTest",
      nullptr,
      SwdecOtherCodecIllegalTest,
      nullptr,
      nullptr,
      nullptr,
      napi_default,
      nullptr },
    { "SwdecStateTest", nullptr, SwdecStateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_swdecDescriptors) / sizeof(g_swdecDescriptors[0]), g_swdecDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module swdecoderTestModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "swdecoder_test",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&swdecoderTestModule);
}
