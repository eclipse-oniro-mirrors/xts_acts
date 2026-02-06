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
#include "include/FuncTest.h"
#include <vector>
#include <functional>

using TestFunction = std::function<int()>;

static const std::vector<TestFunction> funcTestFunctions = {
    VideoDecodeSyncSw263Func0010Test,
    VideoDecodeSyncSw263Func0020Test,
    VideoDecodeSyncSw263Func0040Test,
    VideoDecodeSw263BlankFrame0010Test
};

static napi_value CreateResultValue(napi_env env, int result)
{
    napi_value resultValue;
    napi_create_int32(env, result, &resultValue);
    return resultValue;
}

static napi_value RunFuncTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        return CreateResultValue(env, -1);
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return CreateResultValue(env, -1);
    }

    int32_t testCase = -1;
    status = napi_get_value_int32(env, args[0], &testCase);
    if (status != napi_ok) {
        return CreateResultValue(env, -1);
    }

    int result = -1;
    if (testCase >= 0 && testCase < static_cast<int>(funcTestFunctions.size())
        && funcTestFunctions[testCase] != nullptr) {
        result = funcTestFunctions[testCase]();
    } else {
        napi_throw_type_error(env, nullptr, "Invalid test case number");
        return CreateResultValue(env, -1);
    }

    return CreateResultValue(env, result);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "runFuncTest", nullptr, RunFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "h263swdecoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
