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

#include "napi/native_api.h"
#include "include/ApiTest.h"
#include "include/ConfigureTest.h"
#include "include/GetparamTest.h"
#include "include/StateTest.h"
#include "include/TemporalTest.h"
#include "include/Func2Test.h"
#include "include/FuncTest.h"
#include "include/FuncTest2.h"
#include "include/SetparamTest.h"
#include <vector>
#include <functional>
#include <thread>
#include <chrono>
#include <mutex>

using TestFunction = std::function<int()>;

// 异步测试执行上下文
struct AsyncTestContext {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    const std::vector<TestFunction>* functions;
    int32_t testIndex;
    std::function<void()> tearDown;
    int result;
};

// 异步执行回调（在工作线程中执行）
static void ExecuteTestAsync(napi_env env, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);
    context->result = -1;

    if (context->testIndex >= 0 &&
        context->testIndex < static_cast<int32_t>(context->functions->size())) {
        context->result = (*context->functions)[context->testIndex]();
    }
}

// 异步完成回调（在主线程中执行）
static void CompleteTestAsync(napi_env env, napi_status status, void* data)
{
    AsyncTestContext* context = static_cast<AsyncTestContext*>(data);

    if (status != napi_ok) {
        napi_value error;
        napi_create_string_utf8(env, "Async test execution failed", NAPI_AUTO_LENGTH, &error);
        napi_reject_deferred(env, context->deferred, error);
    } else {
        // 清理资源
        if (context->tearDown) {
            context->tearDown();
        }

        // 返回结果
        napi_value result;
        napi_create_int32(env, context->result, &result);
        napi_resolve_deferred(env, context->deferred, result);
    }

    // 清理异步工作
    napi_delete_async_work(env, context->work);
    delete context;
}

// 通用异步测试执行包装函数
static napi_value RunTestAsync(napi_env env,
                               const std::vector<TestFunction>& functions,
                               int32_t testIndex,
                               std::function<void()> tearDown)
{
    napi_value promise;
    napi_deferred deferred;
    napi_create_promise(env, &deferred, &promise);

    AsyncTestContext* context = new AsyncTestContext{
        env,
        deferred,
        nullptr,
        &functions,
        testIndex,
        tearDown,
        -1
    };

    napi_value resourceName;
    napi_create_string_utf8(env, "VideoEncoderTest", NAPI_AUTO_LENGTH, &resourceName);

    napi_create_async_work(env, nullptr, resourceName,
        ExecuteTestAsync,
        CompleteTestAsync,
        context,
        &context->work);

    napi_queue_async_work(env, context->work);

    return promise;
}

// ==================== ApiTest Module ====================
static std::vector<TestFunction> GetApiTestFunctionsPart1()
{
    return {
        VideoEncodeIllegalPara0100Test, VideoEncodeIllegalPara0200Test,
        VideoEncodeIllegalPara0300Test, VideoEncodeIllegalPara0400Test,
        VideoEncodeIllegalPara0500Test, VideoEncodeIllegalPara0600Test,
        VideoEncodeIllegalPara0700Test, VideoEncodeIllegalPara0800Test,
        VideoEncodeIllegalPara0900Test, VideoEncodeIllegalPara1100Test,
        VideoEncodeIllegalPara1400Test, VideoEncodeIllegalPara1500Test,
        VideoEncodeIllegalPara1600Test, VideoEncodeIllegalPara1700Test,
        VideoEncodeIllegalPara1800Test, VideoEncodeIllegalPara1900Test,
        VideoEncodeIllegalPara2000Test, VideoEncodeIllegalPara2100Test,
        VideoEncodeIllegalPara2200Test, VideoEncodeIllegalPara2300Test,
        VideoEncodeIllegalPara2500Test, VideoEncodeIllegalPara2600Test,
        VideoEncodeIllegalPara2700Test, VideoEncodeIllegalPara2800Test,
        VideoEncodeIllegalPara2900Test
    };
}

static std::vector<TestFunction> GetApiTestFunctionsPart2()
{
    return {
        VideoEncodeApi0100Test, VideoEncodeApi3100Test, VideoEncodeApi0200Test,
        VideoEncodeApi0300Test, VideoEncodeApi0400Test, VideoEncodeApi0500Test,
        VideoEncodeApi0600Test, VideoEncodeApi0700Test, VideoEncodeApi0800Test,
        VideoEncodeApi0900Test, VideoEncodeApi1000Test, VideoEncodeApi1100Test,
        VideoEncodeApi1200Test, VideoEncodeApi1300Test, VideoEncodeApi1400Test,
        VideoEncodeApi1410Test, VideoEncodeSyncApi0010Test, VideoEncodeSyncApi0040Test,
        VideoEncodeSyncApi0050Test, VideoEncodeSyncApi0060Test, VideoEncodeSyncApi0070Test,
        VideoEncodeSyncApi0080Test
    };
}

static const std::vector<TestFunction>& GetApiTestFunctions()
{
    static std::vector<TestFunction> functions;
    if (functions.empty()) {
        auto part1 = GetApiTestFunctionsPart1();
        auto part2 = GetApiTestFunctionsPart2();
        functions.insert(functions.end(), part1.begin(), part1.end());
        functions.insert(functions.end(), part2.begin(), part2.end());
    }
    return functions;
}

static napi_value RunApiTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetApiTestFunctions(), testIndex, TestTearDownApi);
}

// ==================== FuncTest Module (前66个函数) ====================
static std::vector<TestFunction> GetFuncTestPart1()
{
    return {
    VideoEncodeFunction0100Test,
    // VideoEncodeFunction0200Test,  // DISABLED: Uses SURF_INPUT
    VideoEncodeFunction0300Test,
    // VideoEncodeFunction0400Test,  // DISABLED: Uses GetVideoSupportedPixelFormats
    // VideoEncodeFunction0500Test,  // DISABLED: Uses SURF_INPUT - causes hang
    // VideoEncodeFunction0600Test,  // DISABLED: Uses SURF_INPUT
    VideoEncodeFunction0700Test,
    VideoEncodeFunction0800Test,
    VideoEncodeFunction0810Test,
    VideoEncodeFunction0900Test,
    VideoEncodeFunction1000Test,
    // VideoEncodeFunction1100Test,  // DISABLED: Uses GetVideoSupportedPixelFormats
    // VideoEncodeFunction1200Test,  // Function does not exist in header
    // VideoEncodeFunction1300Test,  // DISABLED: Uses GetVideoSupportedPixelFormats
    // VideoEncodeFunction1400Test,  // DISABLED: Uses GetVideoSupportedPixelFormats
    // VideoEncodeFunction1500Test,  // DISABLED: Uses GetVideoSupportedPixelFormats
    VideoEncodeFunction1600Test,
    VideoEncodeFunction1700Test,
    VideoEncodeFunction1800Test,
    VideoEncodeFunction2000Test
    };
}

static std::vector<TestFunction> GetFuncTestPart2a()
{
    return {
    VideoEncodeCapability0100Test,
    VideoEncodeCapability0200Test,
    VideoEncodeCapability0300Test,
    VideoEncodeCapability0400Test,
    VideoEncodeCapability0500Test,
    VideoEncodeCapability9900Test,
    VideoEncodeCapability0600Test,
    VideoEncodeCapability0700Test,
    VideoEncodeCapability0800Test,
    VideoEncodeCapability0900Test,
    VideoEncodeCapability1000Test,
    VideoEncodeCapability1100Test,
    VideoEncodeCapability1200Test,
    VideoEncodeCapability1300Test,
    VideoEncodeCapability1310Test,
    VideoEncodeCapability1400Test,
    VideoEncodeCapability1500Test,
    VideoEncodeCapability1700Test,
    VideoEncodeCapability1800Test,
    VideoEncodeCapability1900Test,
    VideoEncodeCapability8400Test,
    VideoEncodeCapability8500Test,
    VideoEncodeCapability8600Test,
    VideoEncodeCapability2000Test,
    VideoEncodeCapability2100Test,
    VideoEncodeCapability2200Test,
    VideoEncodeCapability2300Test,
    VideoEncodeCapability2400Test,
    VideoEncodeCapability2500Test
    };
}

static std::vector<TestFunction> GetFuncTestPart2b()
{
    return {
    VideoEncodeCapability2700Test,
    VideoEncodeCapability2800Test,
    VideoEncodeCapability3100Test,
    VideoEncodeCapability3200Test,
    VideoEncodeCapability3300Test,
    VideoEncodeCapability3400Test,
    VideoEncodeCapability3500Test,
    VideoEncodeCapability3600Test,
    VideoEncodeCapability3700Test,
    VideoEncodeCapability3800Test,
    VideoEncodeCapability3900Test,
    VideoEncodeCapability4100Test,
    VideoEncodeCapability4200Test,
    VideoEncodeCapability4300Test,
    VideoEncodeCapability4500Test,
    VideoEncodeCapability4600Test,
    VideoEncodeCapability4800Test,
    VideoEncodeCapability4900Test,
    VideoEncodeCapability9800Test
    };
}

static const std::vector<TestFunction>& GetFuncTestFunctions()
{
    static std::vector<TestFunction> functions;
    if (functions.empty()) {
        auto part1 = GetFuncTestPart1();
        auto part2a = GetFuncTestPart2a();
        auto part2b = GetFuncTestPart2b();
        functions.insert(functions.end(), part1.begin(), part1.end());
        functions.insert(functions.end(), part2a.begin(), part2a.end());
        functions.insert(functions.end(), part2b.begin(), part2b.end());
    }
    return functions;
}

static napi_value RunFuncTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetFuncTestFunctions(), testIndex, TestTearDownFunc);
}

// ==================== FuncTest2 Module (后67个函数) ====================
static std::vector<TestFunction> GetFuncTest2Part1()
{
    return {
    VideoEncodeCapability5100Test,
    VideoEncodeCapability5200Test,
    VideoEncodeCapability5300Test,
    VideoEncodeCapability5400Test,
    VideoEncodeCapability5500Test,
    VideoEncodeCapability5600Test,
    VideoEncodeCapability5700Test,
    VideoEncodeCapability5800Test,
    VideoEncodeCapability5900Test,
    VideoEncodeCapability6000Test,
    VideoEncodeCapability6100Test,
    VideoEncodeCapability6200Test,
    VideoEncodeCapability6300Test,
    VideoEncodeCapability6400Test,
    VideoEncodeCapability6500Test,
    VideoEncodeCapability6600Test,
    VideoEncodeCapability6700Test,
    VideoEncodeCapability6800Test,
    VideoEncodeCapability6900Test,
    VideoEncodeCapability7000Test,
    VideoEncodeCapability7100Test,
    VideoEncodeCapability7200Test,
    VideoEncodeCapability7300Test,
    VideoEncodeCapability7400Test,
    VideoEncodeCapability7500Test,
    VideoEncodeCapability7600Test,
    VideoEncodeCapability7700Test,
    VideoEncodeCapability7800Test,
    VideoEncodeCapability7900Test,
    VideoEncodeCapability8000Test,
    VideoEncodeCapability8100Test,
    VideoEncodeCapability8200Test,
    VideoEncodeCapability8300Test
    };
}

static std::vector<TestFunction> GetFuncTest2Part2()
{
    return {
    VideoEncodeHevcCapability0100Test,
    VideoEncodeHevcCapability0200Test,
    VideoEncodeHevcCapability0300Test,
    VideoEncodeHevcCapability0400Test,
    VideoEncodeHevcCapability0500Test,
    VideoEncodeHevcCapability0600Test,
    VideoEncodeHevcCapability0700Test,
    VideoEncodeHevcCapability5200Test,
    VideoEncodeHevcCapability5300Test,
    VideoEncodeHevcCapability5400Test,
    VideoEncodeHevcCapability0800Test,
    VideoEncodeHevcCapability0900Test,
    VideoEncodeHevcCapability1000Test,
    VideoEncodeHevcCapability1100Test,
    VideoEncodeHevcCapability1200Test,
    VideoEncodeHevcCapability1300Test,
    VideoEncodeHevcCapability1400Test,
    VideoEncodeHevcCapability1500Test,
    VideoEncodeHevcCapability1600Test,
    VideoEncodeHevcCapability1700Test,
    VideoEncodeHevcCapability1900Test,
    VideoEncodeHevcCapability2000Test,
    VideoEncodeHevcCapability2100Test,
    VideoEncodeHevcCapability2200Test,
    VideoEncodeHevcCapability2300Test,
    VideoEncodeHevcCapability2400Test,
    VideoEncodeHevcCapability2500Test,
    VideoEncodeHevcCapability2600Test,
    VideoEncodeHevcCapability2700Test,
    VideoEncodeHevcCapability2800Test,
    VideoEncodeHevcCapability2900Test,
    VideoEncodeHevcCapability3000Test
    };
}

static const std::vector<TestFunction>& GetFuncTest2Functions()
{
    static std::vector<TestFunction> functions;
    if (functions.empty()) {
        auto part1 = GetFuncTest2Part1();
        auto part2 = GetFuncTest2Part2();
        functions.insert(functions.end(), part1.begin(), part1.end());
        functions.insert(functions.end(), part2.begin(), part2.end());
    }
    return functions;
}

static napi_value RunFuncTest2(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetFuncTest2Functions(), testIndex, TestTearDownFunc2);
}

// ==================== ConfigureTest Module ====================
static const std::vector<TestFunction>& GetConfigureTestFunctions()
{
    static const std::vector<TestFunction> functions = {
    VideoEncodeHevcCapability1800Test,
    VideoEncodeCapability4000Test,
    VideoEncodeCapability4400Test,
    VideoEncodeCapability4410Test,
    VideoEncodeCapability4700Test,
    VideoEncodeCapability4710Test,
    VideoEncodeCapability5000Test,
    VideoEncodeCapability5010Test,
    };
    return functions;
}

static napi_value RunConfigureTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetConfigureTestFunctions(), testIndex, TestTearDownConfigure);
}

// ==================== GetparamTest Module ====================
static const std::vector<TestFunction>& GetGetparamTestFunctions()
{
    // 只保留不使用 SURF_INPUT 的测试函数（HAP 模式下 Surface API 不完整）
    static const std::vector<TestFunction> functions = {
    VideoEncodeMseQp0100Test,
    VideoEncodeMseQp0300Test,
    };
    return functions;
}

static napi_value RunGetparamTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetGetparamTestFunctions(), testIndex, TestTearDownGetparam);
}

// ==================== SetparamTest Module ====================
static std::vector<TestFunction> GetSetparamTestPart1()
{
    return {
    RESET_BITRATE_001Test,
    RESET_BITRATE_002Test,
    RESET_BITRATE_003Test,
    RESET_BITRATE_004Test,
    RESET_BITRATE_005Test,
    RESET_BITRATE_006Test,
    RESET_BITRATE_007Test,
    RESET_BITRATE_008Test,
    RESET_BITRATE_009Test,
    RESET_BITRATE_010Test,
    RESET_BITRATE_011Test,
    RESET_BITRATE_012Test,
    RESET_FRAMERATE_001Test,
    RESET_FRAMERATE_012Test,
    RESET_FRAMERATE_013Test,
    RESET_FRAMERATE_014Test,
    RESET_FRAMERATE_002Test,
    RESET_FRAMERATE_003Test,
    RESET_FRAMERATE_004Test,
    RESET_FRAMERATE_005Test,
    RESET_FRAMERATE_006Test,
    RESET_FRAMERATE_007Test,
    RESET_FRAMERATE_008Test,
    RESET_FRAMERATE_009Test,
    RESET_FRAMERATE_010Test,
    RESET_FRAMERATE_011Test
    };
}

static std::vector<TestFunction> GetSetparamTestPart2()
{
    return {
    RESET_QP_001Test, RESET_QP_002Test, RESET_QP_003Test, RESET_QP_004Test, RESET_QP_005Test,
    RESET_QP_006Test, RESET_QP_007Test, RESET_QP_008Test, RESET_QP_009Test, RESET_QP_010Test,
    RESET_QP_011Test, RESET_QP_012Test, RESET_QP_013Test, RESET_QP_014Test, SET_PROFILE_001Test,
    SET_PROFILE_002Test, SET_PROFILE_003Test, SET_PROFILE_004Test, SET_PROFILE_005Test,
    SET_RANGE_FLAG_001Test, SET_RANGE_FLAG_002Test, SET_COLORSPACE_001Test, SET_COLORSPACE_002Test,
    SET_FORCE_IDR_001Test, SET_FORCE_IDR_002Test, COLORSPACE_CONFIG_001Test, COLORSPACE_CONFIG_002Test,
    COLORSPACE_CONFIG_003Test, COLORSPACE_CONFIG_004Test, COLORSPACE_CONFIG_005Test,
    COLORSPACE_CONFIG_006Test, COLORSPACE_CONFIG_ADD_001Test, COLORSPACE_CONFIG_ADD_002Test,
    COLORSPACE_CONFIG_ADD_003Test, COLORSPACE_CONFIG_ADD_004Test, COLORSPACE_CONFIG_ADD_005Test,
    COLORSPACE_CONFIG_ADD_006Test, COLORSPACE_CONFIG_ADD_007Test, COLORSPACE_CONFIG_ADD_008Test,
    COLORSPACE_CONFIG_ADD_009Test, COLORSPACE_CONFIG_ADD_010Test, COLORSPACE_CONFIG_ADD_011Test,
    COLORSPACE_CONFIG_ADD_012Test, FRAMENUM_JUDGMENT_001Test, FRAMENUM_JUDGMENT_002Test
    };
}

static const std::vector<TestFunction>& GetSetparamTestFunctions()
{
    static std::vector<TestFunction> functions;
    if (functions.empty()) {
        auto part1 = GetSetparamTestPart1();
        auto part2 = GetSetparamTestPart2();
        functions.insert(functions.end(), part1.begin(), part1.end());
        functions.insert(functions.end(), part2.begin(), part2.end());
    }
    return functions;
}

static napi_value RunSetparamTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetSetparamTestFunctions(), testIndex, TestTearDownSetparam);
}

// ==================== StateTest Module ====================
static const std::vector<TestFunction>& GetStateTestFunctions()
{
    static const std::vector<TestFunction> functions = {
    VideoEncodeState0100Test,
    VideoEncodeState0101Test,
    VideoEncodeState0200Test,
    VideoEncodeState0300Test,
    VideoEncodeState0400Test,
    VideoEncodeState0500Test,
    VideoEncodeState0600Test,
    VideoEncodeState0700Test,
    VideoEncodeState0800Test,
    VideoEncodeState0900Test,
    VideoEncodeState1000Test,
    VideoEncodeState1100Test,
    VideoEncodeState1200Test,
    VideoEncodeState1300Test,
    VideoEncodeState1400Test,
    VideoEncodeState1500Test,
    VideoEncodeState1600Test,
    VideoEncodeState1700Test,
    VideoEncodeState1800Test,
    VideoEncodeState1900Test,
    VideoEncodeState2000Test,
    VideoEncodeState2100Test,
    VideoEncodeState2200Test,
    VideoEncodeState2300Test,
    VideoEncodeState2400Test,
    VideoEncodeState2500Test,
    VideoEncodeState2600Test,
    VideoEncodeState2700Test,
    VideoEncodeState2800Test,
    VideoEncodeState2900Test,
    VideoEncodeState3000Test,
    VideoEncodeState3100Test,
    VideoEncodeState3200Test,
    VideoEncodeState3300Test,
    VideoEncodeState3400Test,
    VideoEncodeState3500Test,
    VideoEncodeState3600Test,
    VideoEncodeState3700Test,
    VideoEncodeState3800Test,
    VideoEncodeState3900Test,
    VideoEncodeState4000Test,
    };
    return functions;
}

static napi_value RunStateTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetStateTestFunctions(), testIndex, TestTearDownState);
}

// ==================== TemporalTest Module ====================
static const std::vector<TestFunction>& GetTemporalTestFunctions()
{
    // 只保留不使用 SURF_INPUT 的测试函数（HAP 模式下 Surface API 不完整）
    static const std::vector<TestFunction> functions = {
    VideoTemporalEncodeApi0020Test,
    VideoTemporalEncodeApi0030Test,
    VideoTemporalEncodeFunction0010Test,
    VideoTemporalEncodeFunction0020Test,
    VideoTemporalEncodeFunction0100Test,
    VideoTemporalEncodeFunction0140Test,
    VideoUniformlyEncodeFunction0100Test,
    VideoUniformlyEncodeFunction0200Test,
    VideoUniformlyEncodeFunction0300Test,
    VideoUniformlyEncodeFunction0400Test,
    VideoUniformlyEncodeFunction0500Test,
    };
    return functions;
}

static napi_value RunTemporalTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetTemporalTestFunctions(), testIndex, nullptr);
}

// ==================== Func2Test Module ====================
static std::vector<TestFunction> GetFunc2TestPart1()
{
    return {
    VideoEncodeHevcCapability3100Test,
    VideoEncodeHevcCapability3200Test,
    VideoEncodeHevcCapability3300Test,
    VideoEncodeHevcCapability3400Test,
    VideoEncodeHevcCapability3500Test,
    VideoEncodeHevcCapability3600Test,
    VideoEncodeHevcCapability3700Test,
    VideoEncodeHevcCapability3800Test,
    VideoEncodeHevcCapability3900Test,
    VideoEncodeHevcCapability4000Test,
    VideoEncodeHevcCapability4100Test,
    VideoEncodeHevcCapability4200Test,
    VideoEncodeHevcCapability4300Test,
    VideoEncodeHevcCapability4400Test,
    VideoEncodeHevcCapability4500Test,
    VideoEncodeHevcCapability4600Test,
    VideoEncodeHevcCapability4700Test,
    VideoEncodeHevcCapability4800Test,
    VideoEncodeHevcCapability4900Test,
    VideoEncodeHevcCapability5000Test,
    VideoEncodeHevcCapability5100Test,
    VideoEncodeCapability8700Test,
    VideoEncodeCapability8800Test,
    VideoEncodeCapability8900Test,
    VideoEncodeCapability9000Test
    };
}

static std::vector<TestFunction> GetFunc2TestPart2()
{
    return {
    VideoEncodeHevcCapability5500Test,
    VideoEncodeHevcCapability5600Test,
    VideoEncodeHevcCapability5700Test,
    VideoEncodeHevcCapability5800Test,
    VideoEncodeHevcCapability5900Test,
    VideoEncodeSyncFunc0010Test,
    VideoEncodeSyncFunc0020Test,
    VideoEncodeSyncFunc0030Test,
    VideoEncodeSyncFunc0040Test,
    VideoEncodeSyncFunc0050Test,
    VideoEncodeSyncFunc0070Test,
    VideoEncodeSyncFunc0080Test,
    VideoEncodeSyncFunc0090Test,
    VideoEncodeSyncFunc0100Test,
    VideoEncodeSyncFunc0110Test,
    VideoEncodeSyncFunc0120Test,
    VideoEncodeSyncFunc0130Test,
    VideoEncodeSyncFunc0140Test,
    VideoEncodeSyncFunc0150Test,
    VideoEncodeSyncFunc0160Test,
    VideoEncodeSyncFunc0210Test,
    VideoEncodeSyncFunc0220Test,
    VideoEncodeSyncFunc0230Test,
    VideoEncodeSyncFunc0240Test,
    VideoEncodeSyncFunc0360Test,
    VideoEncodeSyncFunc0370Test,
    VideoEncodeSyncFunc0380Test,
    VideoEncodeSyncFunc0390Test,
    VideoEncodeSyncFunc0400Test,
    VideoEncodeSyncFunc0410Test,
    VideoEncodeRgba10101020010Test,
    VideoEncodeRgba10101020020Test,
    VideoEncodeRgba10101020030Test,
    VideoEncodeRgba10101020040Test,
    VideoEncodeRgba10101020110Test,
    VideoEncodeRgba10101020130Test,
    VideoEncodeRgba10101020150Test,
    VideoEncodeRgba10101020170Test,
    VideoEncodeRgba10101020180Test,
    VideoEncodeRgba10101020190Test,
    VideoEncodeSyncFormat0010Test
    };
}

static const std::vector<TestFunction>& GetFunc2TestFunctions()
{
    static std::vector<TestFunction> functions;
    if (functions.empty()) {
        auto part1 = GetFunc2TestPart1();
        auto part2 = GetFunc2TestPart2();
        functions.insert(functions.end(), part1.begin(), part1.end());
        functions.insert(functions.end(), part2.begin(), part2.end());
    }
    return functions;
}

static napi_value RunFunc2Test(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    int32_t testIndex = 0;
    napi_get_value_int32(env, args[0], &testIndex);

    return RunTestAsync(env, GetFunc2TestFunctions(), testIndex, nullptr);
}

static napi_value InitTests(napi_env env, napi_callback_info info)
{
    InitApiTest();
    InitConfigureTest();
    InitGetparamTest();
    InitStateTest();
    InitTemporalTest();
    InitFunc2Test();
    InitFuncTest();
    InitFuncTest2();
    InitSetparamTest();

    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "initTests", nullptr, InitTests, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runApiTest", nullptr, RunApiTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFuncTest", nullptr, RunFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFuncTest2", nullptr, RunFuncTest2, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runConfigureTest", nullptr, RunConfigureTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runGetparamTest", nullptr, RunGetparamTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runSetparamTest", nullptr, RunSetparamTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runStateTest", nullptr, RunStateTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runTemporalTest", nullptr, RunTemporalTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "runFunc2Test", nullptr, RunFunc2Test, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "vcodec_encoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
