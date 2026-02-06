/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "DeviceTest.cpp"
#include "ModelTest.cpp"
#include "CompileTest.cpp"
#include "MemoryTest.cpp"
#include "ExecutorTest.cpp"

// Device test case constants
namespace DeviceTestCase {
constexpr int32_t DEVICE_ID_0100 = 0;
constexpr int32_t DEVICE_ID_0200 = 1;
constexpr int32_t DEVICE_ID_0300 = 2;
constexpr int32_t DEVICE_ID_0400 = 3;
constexpr int32_t DEVICE_NAME_0100 = 4;
constexpr int32_t DEVICE_NAME_0200 = 5;
constexpr int32_t DEVICE_NAME_0300 = 6;
constexpr int32_t DEVICE_TYPE_0100 = 8;
constexpr int32_t DEVICE_TYPE_0200 = 9;
constexpr int32_t DEVICE_TYPE_0300 = 10;
}

// Model test case constants
namespace ModelTestCase {
constexpr int32_t CREATE_MODEL_0100 = 0;
constexpr int32_t CREATE_MODEL_0200 = 1;
constexpr int32_t ADD_OPERAND_0100 = 2;
constexpr int32_t ADD_OPERAND_0200 = 3;
constexpr int32_t ADD_OPERAND_0300 = 4;
constexpr int32_t ADD_OPERAND_0400 = 5;
constexpr int32_t SET_OPERAND_VALUE_0100 = 6;
constexpr int32_t SET_OPERAND_VALUE_0200 = 7;
constexpr int32_t SET_OPERAND_VALUE_0300 = 8;
constexpr int32_t SET_OPERAND_VALUE_0400 = 9;
constexpr int32_t ADD_OPERATION_0100 = 10;
constexpr int32_t ADD_OPERATION_0200 = 11;
constexpr int32_t SPECIFY_INPUTS_AND_OUTPUTS_0100 = 12;
constexpr int32_t SPECIFY_INPUTS_AND_OUTPUTS_0200 = 13;
constexpr int32_t SPECIFY_INPUTS_AND_OUTPUTS_0300 = 14;
constexpr int32_t FINISH_0100 = 15;
constexpr int32_t DESTROY_0100 = 17;
constexpr int32_t DESTROY_0200 = 18;
}

// Compilation test case constants
namespace CompilationTestCase {
constexpr int32_t CREATE_0100 = 0;
constexpr int32_t CREATE_0200 = 1;
constexpr int32_t CREATE_0300 = 2;
constexpr int32_t SET_DEVICE_0100 = 3;
constexpr int32_t SET_DEVICE_0200 = 4;
constexpr int32_t SET_DEVICE_0300 = 5;
constexpr int32_t SET_CACHE_0100 = 6;
constexpr int32_t SET_CACHE_0200 = 7;
constexpr int32_t SET_CACHE_0300 = 8;
constexpr int32_t SET_CACHE_0400 = 9;
constexpr int32_t SET_CACHE_0500 = 10;
constexpr int32_t SET_CACHE_0600 = 11;
constexpr int32_t SET_CACHE_0700 = 12;
constexpr int32_t SET_CACHE_0800 = 13;
constexpr int32_t SET_PERFORMANCE_MODE_0100 = 14;
constexpr int32_t SET_PERFORMANCE_MODE_MOCK_0200 = 15;
constexpr int32_t SET_PERFORMANCE_MODE_0300 = 16;
constexpr int32_t SET_PERFORMANCE_MODE_0400 = 17;
constexpr int32_t SET_PERFORMANCE_MODE_0500 = 18;
constexpr int32_t SET_PERFORMANCE_MODE_0600 = 19;
constexpr int32_t SET_PERFORMANCE_MODE_0700 = 20;
constexpr int32_t SET_PERFORMANCE_MODE_0800 = 21;
constexpr int32_t SET_PERFORMANCE_MODE_0900 = 22;
constexpr int32_t SET_PRIORITY_0100 = 23;
constexpr int32_t SET_PRIORITY_0200 = 24;
constexpr int32_t SET_PRIORITY_0300 = 25;
constexpr int32_t SET_PRIORITY_0400 = 26;
constexpr int32_t SET_PRIORITY_0500 = 27;
constexpr int32_t SET_PRIORITY_0600 = 28;
constexpr int32_t SET_PRIORITY_0700 = 29;
constexpr int32_t SET_PRIORITY_0800 = 30;
constexpr int32_t ENABLE_FLOAT16_0100 = 31;
constexpr int32_t ENABLE_FLOAT16_0200 = 32;
constexpr int32_t ENABLE_FLOAT16_0300 = 33;
constexpr int32_t ENABLE_FLOAT16_0400 = 34;
constexpr int32_t BUILD_0100 = 35;
constexpr int32_t BUILD_0200 = 36;
constexpr int32_t DESTROY_0100 = 37;
constexpr int32_t DESTROY_0200 = 38;
}

// Memory test case constants
namespace MemoryTestCase {
constexpr int32_t CREATE_INPUT_MEMORY_0100 = 0;
constexpr int32_t CREATE_INPUT_MEMORY_0200 = 1;
constexpr int32_t CREATE_INPUT_MEMORY_0300 = 2;
constexpr int32_t CREATE_INPUT_MEMORY_0500 = 4;
constexpr int32_t CREATE_OUTPUT_MEMORY_0100 = 5;
constexpr int32_t CREATE_OUTPUT_MEMORY_0200 = 6;
constexpr int32_t CREATE_OUTPUT_MEMORY_0300 = 7;
constexpr int32_t CREATE_OUTPUT_MEMORY_0500 = 9;
constexpr int32_t DESTROY_INPUT_MEMORY_0100 = 10;
constexpr int32_t DESTROY_INPUT_MEMORY_0200 = 11;
constexpr int32_t DESTROY_INPUT_MEMORY_0300 = 12;
constexpr int32_t DESTROY_OUTPUT_MEMORY_0100 = 13;
constexpr int32_t DESTROY_OUTPUT_MEMORY_0200 = 14;
constexpr int32_t DESTROY_OUTPUT_MEMORY_0300 = 15;
}

// Executor test case constants
namespace ExecutorTestCase {
constexpr int32_t CREATE_0100 = 0;
constexpr int32_t CREATE_0200 = 1;
constexpr int32_t SET_INPUT_0100 = 2;
constexpr int32_t SET_INPUT_0200 = 3;
constexpr int32_t SET_INPUT_0300 = 4;
constexpr int32_t SET_INPUT_0400 = 5;
constexpr int32_t SET_INPUT_0500 = 6;
constexpr int32_t SET_INPUT_0600 = 7;
constexpr int32_t SET_INPUT_0700 = 8;
constexpr int32_t SET_OUTPUT_0100 = 12;
constexpr int32_t SET_OUTPUT_0200 = 13;
constexpr int32_t SET_OUTPUT_0300 = 14;
constexpr int32_t SET_OUTPUT_0400 = 15;
constexpr int32_t SET_OUTPUT_0500 = 16;
constexpr int32_t RUN_0100 = 17;
constexpr int32_t RUN_0200 = 18;
constexpr int32_t RUN_0300 = 19;
constexpr int32_t RUN_0400 = 20;
constexpr int32_t RUN_0600 = 22;
constexpr int32_t GET_OUTPUT_DIMENSIONS_0100 = 24;
constexpr int32_t DESTROY_0100 = 25;
constexpr int32_t DESTROY_0200 = 26;
constexpr int32_t COMBINE_0100 = 27;
constexpr int32_t COMBINE_0200 = 28;
constexpr int32_t COMBINE_0300 = 29;
constexpr int32_t COMBINE_0400 = 30;
constexpr int32_t COMBINE_0500 = 31;
}

static napi_value createResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// 辅助函数：解析NAPI参数获取测试用例编号
static int ParseTestCaseNumber(napi_env env, napi_callback_info info, int32_t *caseNum)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return -1;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return -1;
    }

    *caseNum = -1;
    status = napi_get_value_int32(env, args[0], caseNum);
    if (status != napi_ok) {
        return -1;
    }

    return 0;
}

// 辅助函数：执行编译测试用例（第一部分）
static int ExecuteCompilationTestPart1(int32_t caseNum)
{
    switch (caseNum) {
        case CompilationTestCase::CREATE_0100: return SubAiNnrtFuncNorthCompilationCreate0100();
        case CompilationTestCase::CREATE_0200: return SubAiNnrtFuncNorthCompilationCreate0200();
        case CompilationTestCase::CREATE_0300: return SubAiNnrtFuncNorthCompilationCreate0300();
        case CompilationTestCase::SET_DEVICE_0100: return SubAiNnrtFuncNorthCompilationSetDevice0100();
        case CompilationTestCase::SET_DEVICE_0200: return SubAiNnrtFuncNorthCompilationSetDevice0200();
        case CompilationTestCase::SET_DEVICE_0300: return SubAiNnrtFuncNorthCompilationSetDevice0300();
        case CompilationTestCase::SET_CACHE_0100: return SubAiNnrtFuncNorthCompilationSetCache0100();
        case CompilationTestCase::SET_CACHE_0200: return SubAiNnrtFuncNorthCompilationSetCache0200();
        case CompilationTestCase::SET_CACHE_0300: return SubAiNnrtFuncNorthCompilationSetCache0300();
        case CompilationTestCase::SET_CACHE_0400: return SubAiNnrtFuncNorthCompilationSetCache0400();
        case CompilationTestCase::SET_CACHE_0500: return SubAiNnrtFuncNorthCompilationSetCache0500();
        case CompilationTestCase::SET_CACHE_0600: return SubAiNnrtFuncNorthCompilationSetCache0600();
        case CompilationTestCase::SET_CACHE_0700: return SubAiNnrtFuncNorthCompilationSetCache0700();
        case CompilationTestCase::SET_CACHE_0800: return SubAiNnrtFuncNorthCompilationSetCache0800();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0100:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0100();
        case CompilationTestCase::SET_PERFORMANCE_MODE_MOCK_0200:
            return SubAiNnrtFuncNorthCompilationSetPerformanceModeMock0200();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0300:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0300();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0400:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0400();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0500:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0500();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0600:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0600();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0700:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0700();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0800:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0800();
        case CompilationTestCase::SET_PERFORMANCE_MODE_0900:
            return SubAiNnrtFuncNorthCompilationSetPerformanceMode0900();
        default: return TEST_CASE_NOT_FOUND;
    }
}

// 辅助函数：执行编译测试用例（第二部分）
static int ExecuteCompilationTestPart2(int32_t caseNum)
{
    switch (caseNum) {
        case CompilationTestCase::SET_PRIORITY_0100: return SubAiNnrtFuncNorthCompilationSetPriority0100();
        case CompilationTestCase::SET_PRIORITY_0200: return SubAiNnrtFuncNorthCompilationSetPriority0200();
        case CompilationTestCase::SET_PRIORITY_0300: return SubAiNnrtFuncNorthCompilationSetPriority0300();
        case CompilationTestCase::SET_PRIORITY_0400: return SubAiNnrtFuncNorthCompilationSetPriority0400();
        case CompilationTestCase::SET_PRIORITY_0500: return SubAiNnrtFuncNorthCompilationSetPriority0500();
        case CompilationTestCase::SET_PRIORITY_0600: return SubAiNnrtFuncNorthCompilationSetPriority0600();
        case CompilationTestCase::SET_PRIORITY_0700: return SubAiNnrtFuncNorthCompilationSetPriority0700();
        case CompilationTestCase::SET_PRIORITY_0800: return SubAiNnrtFuncNorthCompilationSetPriority0800();
        case CompilationTestCase::ENABLE_FLOAT16_0100: return SubAiNnrtFuncNorthCompilationEnableFloat160100();
        case CompilationTestCase::ENABLE_FLOAT16_0200: return SubAiNnrtFuncNorthCompilationEnableFloat160200();
        case CompilationTestCase::ENABLE_FLOAT16_0300: return SubAiNnrtFuncNorthCompilationEnableFloat160300();
        case CompilationTestCase::ENABLE_FLOAT16_0400: return SubAiNnrtFuncNorthCompilationEnableFloat160400();
        case CompilationTestCase::BUILD_0100: return SubAiNnrtFuncNorthCompilationBuild0100();
        case CompilationTestCase::BUILD_0200: return SubAiNnrtFuncNorthCompilationBuild0200();
        case CompilationTestCase::DESTROY_0100: return SubAiNnrtFuncNorthCompilationDestroy0100();
        case CompilationTestCase::DESTROY_0200: return SubAiNnrtFuncNorthCompilationDestroy0200();
        default: return TEST_CASE_NOT_FOUND;
    }
}

// 辅助函数：执行编译测试用例
static int ExecuteCompilationTestCase(int32_t caseNum)
{
    int result = ExecuteCompilationTestPart1(caseNum);
    if (result != TEST_CASE_NOT_FOUND) {
        return result;
    }
    return ExecuteCompilationTestPart2(caseNum);
}

// 辅助函数：执行内存测试用例
static int ExecuteMemoryTestCase(int32_t caseNum)
{
    switch (caseNum) {
        case MemoryTestCase::CREATE_INPUT_MEMORY_0100:
            return SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0100();
        case MemoryTestCase::CREATE_INPUT_MEMORY_0200:
            return SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0200();
        case MemoryTestCase::CREATE_INPUT_MEMORY_0300:
            return SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0300();
        case MemoryTestCase::CREATE_INPUT_MEMORY_0500:
            return SubAiNnrtFuncNorthExecutorMemoryCreateInputMemory0500();
        case MemoryTestCase::CREATE_OUTPUT_MEMORY_0100:
            return SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0100();
        case MemoryTestCase::CREATE_OUTPUT_MEMORY_0200:
            return SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0200();
        case MemoryTestCase::CREATE_OUTPUT_MEMORY_0300:
            return SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0300();
        case MemoryTestCase::CREATE_OUTPUT_MEMORY_0500:
            return SubAiNnrtFuncNorthExecutorMemoryCreateOutputMemory0500();
        case MemoryTestCase::DESTROY_INPUT_MEMORY_0100:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0100();
        case MemoryTestCase::DESTROY_INPUT_MEMORY_0200:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0200();
        case MemoryTestCase::DESTROY_INPUT_MEMORY_0300:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyInputMemory0300();
        case MemoryTestCase::DESTROY_OUTPUT_MEMORY_0100:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0100();
        case MemoryTestCase::DESTROY_OUTPUT_MEMORY_0200:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0200();
        case MemoryTestCase::DESTROY_OUTPUT_MEMORY_0300:
            return SubAiNnrtFuncNorthExecutorMemoryDestroyOutputMemory0300();
        default: return -1;
    }
}

// NAPI function for Device test cases
static napi_value nnrtDeviceTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case DeviceTestCase::DEVICE_ID_0100: result = SubAiNnrtFuncNorthDeviceDeviceId0100(); break;
        case DeviceTestCase::DEVICE_ID_0200: result = SubAiNnrtFuncNorthDeviceDeviceId0200(); break;
        case DeviceTestCase::DEVICE_ID_0300: result = SubAiNnrtFuncNorthDeviceDeviceId0300(); break;
        case DeviceTestCase::DEVICE_ID_0400: result = SubAiNnrtFuncNorthDeviceDeviceId0400(); break;
        case DeviceTestCase::DEVICE_NAME_0100: result = SubAiNnrtFuncNorthDeviceDeviceName0100(); break;
        case DeviceTestCase::DEVICE_NAME_0200: result = SubAiNnrtFuncNorthDeviceDeviceName0200(); break;
        case DeviceTestCase::DEVICE_NAME_0300: result = SubAiNnrtFuncNorthDeviceDeviceName0300(); break;
        case DeviceTestCase::DEVICE_TYPE_0100: result = SubAiNnrtFuncNorthDeviceDeviceType0100(); break;
        case DeviceTestCase::DEVICE_TYPE_0200: result = SubAiNnrtFuncNorthDeviceDeviceType0200(); break;
        case DeviceTestCase::DEVICE_TYPE_0300: result = SubAiNnrtFuncNorthDeviceDeviceType0300(); break;
        default:
            napi_throw_type_error(env, nullptr, "Invalid case number");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}

// NAPI function for Model test cases
static napi_value nnrtModelTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, -1);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case ModelTestCase::CREATE_MODEL_0100: result = SubAiNnrtFuncNorthModelCreateModel0100(); break;
        case ModelTestCase::CREATE_MODEL_0200: result = SubAiNnrtFuncNorthModelCreateModel0200(); break;
        case ModelTestCase::ADD_OPERAND_0100: result = SubAiNnrtFuncNorthModelAddOperand0100(); break;
        case ModelTestCase::ADD_OPERAND_0200: result = SubAiNnrtFuncNorthModelAddOperand0200(); break;
        case ModelTestCase::ADD_OPERAND_0300: result = SubAiNnrtFuncNorthModelAddOperand0300(); break;
        case ModelTestCase::ADD_OPERAND_0400: result = SubAiNnrtFuncNorthModelAddOperand0400(); break;
        case ModelTestCase::SET_OPERAND_VALUE_0100: result = SubAiNnrtFuncNorthModelSetOperandValue0100(); break;
        case ModelTestCase::SET_OPERAND_VALUE_0200: result = SubAiNnrtFuncNorthModelSetOperandValue0200(); break;
        case ModelTestCase::SET_OPERAND_VALUE_0300: result = SubAiNnrtFuncNorthModelSetOperandValue0300(); break;
        case ModelTestCase::SET_OPERAND_VALUE_0400: result = SubAiNnrtFuncNorthModelSetOperandValue0400(); break;
        case ModelTestCase::ADD_OPERATION_0100: result = SubAiNnrtFuncNorthModelAddOperation0100(); break;
        case ModelTestCase::ADD_OPERATION_0200: result = SubAiNnrtFuncNorthModelAddOperation0200(); break;
        case ModelTestCase::SPECIFY_INPUTS_AND_OUTPUTS_0100:
            result = SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0100();
            break;
        case ModelTestCase::SPECIFY_INPUTS_AND_OUTPUTS_0200:
            result = SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0200();
            break;
        case ModelTestCase::SPECIFY_INPUTS_AND_OUTPUTS_0300:
            result = SubAiNnrtFuncNorthModelSpecifyInputsAndOutputs0300();
            break;
        case ModelTestCase::FINISH_0100: result = SubAiNnrtFuncNorthModelFinish0100(); break;
        case ModelTestCase::DESTROY_0100: result = SubAiNnrtFuncNorthModelDestroy0100(); break;
        case ModelTestCase::DESTROY_0200: result = SubAiNnrtFuncNorthModelDestroy0200(); break;
        default:
            napi_throw_type_error(env, nullptr, "Invalid case number");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}

// NAPI function for Compile test cases
static napi_value nnrtCompileTest(napi_env env, napi_callback_info info)
{
    int32_t caseNum = -1;
    if (ParseTestCaseNumber(env, info, &caseNum) != 0) {
        return createResultValue(env, -1);
    }

    int result = ExecuteCompilationTestCase(caseNum);
    if (result == -1) {
        napi_throw_type_error(env, nullptr, "Invalid case number");
    }

    return createResultValue(env, result);
}

// NAPI function for Memory test cases
static napi_value nnrtMemoryTest(napi_env env, napi_callback_info info)
{
    int32_t caseNum = -1;
    if (ParseTestCaseNumber(env, info, &caseNum) != 0) {
        return createResultValue(env, -1);
    }

    int result = ExecuteMemoryTestCase(caseNum);
    if (result == -1) {
        napi_throw_type_error(env, nullptr, "Invalid case number");
    }

    return createResultValue(env, result);
}

// NAPI function for Executor test cases
static napi_value nnrtExecutorTest(napi_env env, napi_callback_info info)
{
    int32_t caseNum = -1;
    if (ParseTestCaseNumber(env, info, &caseNum) != 0) {
        return createResultValue(env, -1);
    }

    int result;
    switch (caseNum) {
        case ExecutorTestCase::CREATE_0100: result = SubAiNnrtFuncNorthExecutorCreate0100(); break;
        case ExecutorTestCase::CREATE_0200: result = SubAiNnrtFuncNorthExecutorCreate0200(); break;
        case ExecutorTestCase::SET_INPUT_0100: result = SubAiNnrtFuncNorthExecutorSetInput0100(); break;
        case ExecutorTestCase::SET_INPUT_0200: result = SubAiNnrtFuncNorthExecutorSetInput0200(); break;
        case ExecutorTestCase::SET_INPUT_0300: result = SubAiNnrtFuncNorthExecutorSetInput0300(); break;
        case ExecutorTestCase::SET_INPUT_0400: result = SubAiNnrtFuncNorthExecutorSetInput0400(); break;
        case ExecutorTestCase::SET_INPUT_0500: result = SubAiNnrtFuncNorthExecutorSetInput0500(); break;
        case ExecutorTestCase::SET_INPUT_0600: result = SubAiNnrtFuncNorthExecutorSetInput0600(); break;
        case ExecutorTestCase::SET_INPUT_0700: result = SubAiNnrtFuncNorthExecutorSetInput0700(); break;
        case ExecutorTestCase::SET_OUTPUT_0100: result = SubAiNnrtFuncNorthExecutorSetOutput0100(); break;
        case ExecutorTestCase::SET_OUTPUT_0200: result = SubAiNnrtFuncNorthExecutorSetOutput0200(); break;
        case ExecutorTestCase::SET_OUTPUT_0300: result = SubAiNnrtFuncNorthExecutorSetOutput0300(); break;
        case ExecutorTestCase::SET_OUTPUT_0400: result = SubAiNnrtFuncNorthExecutorSetOutput0400(); break;
        case ExecutorTestCase::SET_OUTPUT_0500: result = SubAiNnrtFuncNorthExecutorSetOutput0500(); break;
        case ExecutorTestCase::RUN_0100: result = SubAiNnrtFuncNorthExecutorRun0100(); break;
        case ExecutorTestCase::RUN_0200: result = SubAiNnrtFuncNorthExecutorRun0200(); break;
        case ExecutorTestCase::RUN_0300: result = SubAiNnrtFuncNorthExecutorRun0300(); break;
        case ExecutorTestCase::RUN_0400: result = SubAiNnrtFuncNorthExecutorRun0400(); break;
        case ExecutorTestCase::RUN_0600: result = SubAiNnrtFuncNorthExecutorRun0600(); break;
        case ExecutorTestCase::GET_OUTPUT_DIMENSIONS_0100:
            result = SubAiNnrtFuncNorthExecutorGetOutputDimensions0100();
            break;
        case ExecutorTestCase::DESTROY_0100: result = SubAiNnrtFuncNorthExecutorDestroy0100(); break;
        case ExecutorTestCase::DESTROY_0200: result = SubAiNnrtFuncNorthExecutorDestroy0200(); break;
        case ExecutorTestCase::COMBINE_0100: result = SubAiNnrFuncNorthExecutorCombine0100(); break;
        case ExecutorTestCase::COMBINE_0200: result = SubAiNnrtFuncNorthExecutorCombine0200(); break;
        case ExecutorTestCase::COMBINE_0300: result = SubAiNnrtFuncNorthExecutorCombine0300(); break;
        case ExecutorTestCase::COMBINE_0400: result = SubAiNnrtFuncNorthExecutorCombine0400(); break;
        case ExecutorTestCase::COMBINE_0500: result = SubAiNnrtFuncNorthExecutorCombine0500(); break;
        default:
            napi_throw_type_error(env, nullptr, "Invalid case number");
            return createResultValue(env, -1);
    }

    return createResultValue(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"nnrtDeviceTest", nullptr, nnrtDeviceTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nnrtModelTest", nullptr, nnrtModelTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nnrtCompileTest", nullptr, nnrtCompileTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nnrtMemoryTest", nullptr, nnrtMemoryTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"nnrtExecutorTest", nullptr, nnrtExecutorTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nnrt_function_v2_0_interface_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
