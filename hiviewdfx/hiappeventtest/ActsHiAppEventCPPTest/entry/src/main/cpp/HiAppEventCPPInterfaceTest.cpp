/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
#include "HiAppEventCPPTest.cpp"
#include <string>
#include <unordered_map>

// 测试用例编号常量
namespace TestCaseNumbers {
    constexpr int ERROR_RESULT = -1;
    constexpr size_t ARGC_COUNT = 1;
}

// 测试函数指针类型
using TestFunction = int (*)();

// 测试用例映射表 - 键是测试用例编号，值是对应的测试函数
static const std::unordered_map<int, TestFunction> testCaseMap = {
    {100, DfxDftHiviewKitHiAppEventNative0100},
    {200, DfxDftHiviewKitHiAppEventNative0200},
    {300, DfxDftHiviewKitHiAppEventNative0300},
    {400, DfxDftHiviewKitHiAppEventNative0400},
    {500, DfxDftHiviewKitHiAppEventNative0500},
    {800, DfxDftHiviewKitHiAppEventNative0800},
    {900, DfxDftHiviewKitHiAppEventNative0900},
    {1000, DfxDftHiviewKitHiAppEventNative1000},
    {1100, DfxDftHiviewKitHiAppEventNative1100},
    {1200, DfxDftHiviewKitHiAppEventNative1200},
    {1300, DfxDftHiviewKitHiAppEventNative1300},
    {1400, DfxDftHiviewKitHiAppEventNative1400},
    {1500, DfxDftHiviewKitHiAppEventNative1500},
    {1600, DfxDftHiviewKitHiAppEventNative1600},
    {1700, DfxDftHiviewKitHiAppEventNative1700},
    {1800, DfxDftHiviewKitHiAppEventNative1800},
    {1900, DfxDftHiviewKitHiAppEventNative1900},
    {2100, DfxDftHiviewKitHiAppEventNative2100},
    {2200, DfxDftHiviewKitHiAppEventNative2200},
    {2300, DfxDftHiviewKitHiAppEventNative2300},
    {2400, DfxDftHiviewKitHiAppEventNative2400},
    {2500, DfxDftHiviewKitHiAppEventNative2500},
    {2700, DfxDftHiviewKitHiAppEventNative2700},
    {2800, DfxDftHiviewKitHiAppEventNative2800},
    {2900, DfxDftHiviewKitHiAppEventNative2900},
    {3000, DfxDftHiviewKitHiAppEventNative3000},
    {3100, DfxDftHiviewKitHiAppEventNative3100},
    {3200, DfxDftHiviewKitHiAppEventNative3200},
    {3300, DfxDftHiviewKitHiAppEventNative3300},
    {3400, DfxDftHiviewKitHiAppEventNative3400},
    {3500, DfxDftHiviewKitHiAppEventNative3500},
    {3600, DfxDftHiviewKitHiAppEventNative3600},
    {3700, DfxDftHiviewKitHiAppEventNative3700},
    {3800, DfxDftHiviewKitHiAppEventNative3800},
    {3900, DfxDftHiviewKitHiAppEventNative3900},
    {4000, DfxDftHiviewKitHiAppEventNative4000},
    {4100, DfxDftHiviewKitHiAppEventNative4100},
    {4200, DfxDftHiviewKitHiAppEventNative4200},
    {4300, DfxDftHiviewKitHiAppEventNative4300},
    {4400, DfxDftHiviewKitHiAppEventNative4400},
    {4500, DfxDftHiviewKitHiAppEventNative4500}
};

// 创建返回值
static napi_value CreateResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

// 验证参数
static bool ValidateArguments(napi_env env, napi_callback_info info, int32_t& caseNum)
{
    size_t argc = TestCaseNumbers::ARGC_COUNT;
    napi_value args[TestCaseNumbers::ARGC_COUNT];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        return false;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return false;
    }

    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        return false;
    }
    return true;
}

// 执行测试用例
static int ExecuteTestCase(int caseNum)
{
    auto it = testCaseMap.find(caseNum);
    if (it != testCaseMap.end()) {
        return it->second();
    }
    return TestCaseNumbers::ERROR_RESULT;
}

// 主测试函数
static napi_value hiAppEventTest(napi_env env, napi_callback_info info)
{
    int32_t caseNum = TestCaseNumbers::ERROR_RESULT;

    // 验证参数
    if (!ValidateArguments(env, info, caseNum)) {
        return CreateResultValue(env, TestCaseNumbers::ERROR_RESULT);
    }

    // 执行测试用例
    int result = ExecuteTestCase(caseNum);
    // 检查测试用例是否有效
    if (result == TestCaseNumbers::ERROR_RESULT &&
        testCaseMap.find(caseNum) == testCaseMap.end()) {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
    }

    return CreateResultValue(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"hiAppEventTest", nullptr, hiAppEventTest, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "hi_app_event_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
