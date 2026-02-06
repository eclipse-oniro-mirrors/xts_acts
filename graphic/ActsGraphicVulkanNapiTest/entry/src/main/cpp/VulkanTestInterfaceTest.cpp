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

#include <cassert>
#include "VulkanTest.h"
#include "hilog/log.h"
#include "napi/native_api.h"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xD003200

const int TEST_CASE_0 = 0;
const int TEST_CASE_1 = 1;
const int TEST_CASE_2 = 2;
const int TEST_CASE_3 = 3;
const int TEST_CASE_4 = 4;
const int TEST_CASE_5 = 5;
#define ARGS_INDEX_ZERO 0
#define ARGS_SIZE 1

static napi_value createResultValue(napi_env env, bool success)
{
    napi_value result;
    napi_create_int32(env, success ? 0 : -1, &result);
    return result;
}

static napi_value vulkanTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "NAPI call failed");
        return createResultValue(env, false);
    }
    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return createResultValue(env, false);
    }

    int32_t caseNum = -1;
    status = napi_get_value_int32(env, args[0], &caseNum);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "NAPI call failed");
        return createResultValue(env, false);
    }

    int result;
    switch (caseNum) {
        case TEST_CASE_0:
            result = vulkan::loader::LoadBaseFuncPtrTest();
            break;
        case TEST_CASE_1:
            result = vulkan::loader::LoadInstanceFuncPtrTest();
            break;
        case TEST_CASE_2:
            result = vulkan::loader::VkEnumeratePhysicalDevicesTest();
            break;
        case TEST_CASE_3:
            result = vulkan::loader::VkCreateDeviceTest();
            break;
        case TEST_CASE_4:
            result = vulkan::loader::GetNativeBufferPropertiesOhosTest();
            break;
        case TEST_CASE_5:
            result = vulkan::loader::GetMemoryNativeBufferOhosTest();
            break;
        default:
            napi_throw_type_error(env, nullptr, "The range of case must be 0 to 5");
            return createResultValue(env, false);
    }
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "vulkanTest", nullptr, vulkanTest, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "graphic_vulkan_napi_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
