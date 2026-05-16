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
#include <functional>
#include <string>
#include <vector>
#include "include/FuncTest.h"
#include "napi/native_api.h"

using TestFunction = std::function<int()>;

// HdrCodec Function Tests (0010-0080, index 0-7)
static const std::vector<TestFunction> g_hdrFuncTests = {
    Acts::HdrCodec::HdrFunc0010,
    Acts::HdrCodec::HdrFunc0020,
    Acts::HdrCodec::HdrFunc0030,
    Acts::HdrCodec::HdrFunc0040,
    Acts::HdrCodec::HdrFunc0050,
    Acts::HdrCodec::HdrFunc0060,
    Acts::HdrCodec::HdrFunc0070,
    Acts::HdrCodec::HdrFunc0080,
};

struct AsyncWorkData {
    napi_env env;
    napi_deferred deferred;
    napi_async_work work;
    const std::vector<TestFunction>* tests;
    int testCaseIndex;
    int result;
};

static void ExecuteWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    int idx = workData->testCaseIndex;
    const std::vector<TestFunction>& tests = *workData->tests;
    if (idx >= 0 && idx < static_cast<int>(tests.size()) && tests[idx] != nullptr) {
        workData->result = tests[idx]();
    } else {
        workData->result = -1;
    }
}

static void CompleteWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    napi_value result;
    napi_create_int32(env, workData->result, &result);
    napi_resolve_deferred(env, workData->deferred, result);
    napi_delete_async_work(env, workData->work);
    delete workData;
}

static napi_value HdrFuncTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    int32_t caseNum = -1;
    napi_status status;
    napi_valuetype valuetype;

    if ((status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr)) != napi_ok ||
        napi_typeof(env, args[0], &valuetype) != napi_ok || valuetype != napi_number ||
        (status = napi_get_value_int32(env, args[0], &caseNum)) != napi_ok) {
        napi_throw_error(env, nullptr, "Invalid argument");
        return nullptr;
    }

    napi_value promise;
    napi_deferred deferred;
    if ((status = napi_create_promise(env, &deferred, &promise)) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    AsyncWorkData* workData = new AsyncWorkData();
    workData->env = env;
    workData->deferred = deferred;
    workData->tests = &g_hdrFuncTests;
    workData->testCaseIndex = caseNum;
    workData->result = -1;

    napi_value workName;
    napi_create_string_utf8(env, "HdrFuncTest", NAPI_AUTO_LENGTH, &workName);

    status = napi_create_async_work(env, nullptr, workName, ExecuteWork, CompleteWork, workData, &workData->work);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    status = napi_queue_async_work(env, workData->work);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->work);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

static napi_property_descriptor g_hdrCodecDescriptors[] = {
    { "HdrFuncTest", nullptr, HdrFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_hdrCodecDescriptors) / sizeof(g_hdrCodecDescriptors[0]), g_hdrCodecDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module hdrcodecModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "hdrcodec",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterHdrCodecModule(void)
{
    napi_module_register(&hdrcodecModule);
}
