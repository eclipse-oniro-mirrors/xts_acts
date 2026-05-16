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

#include <functional>
#include <string>
#include <vector>
#include "include/ActsAudioDecEncNativeTest.h"
#include "include/ActsCodecFormatNativeTest.h"
#include "include/ActsVideoDecEncNativeTest.h"
#include "napi/native_api.h"

using TestFunction = std::function<int()>;

// AudioDecEncFuncTest group: Audio Dec/Enc Function Tests (0100-0700, index 0-6)
static const std::vector<TestFunction> g_audioDecEncFuncTests = {
    SubMultimediaMediaAudioDecEncFunction0100, SubMultimediaMediaAudioDecEncFunction0200,
    SubMultimediaMediaAudioDecEncFunction0300, SubMultimediaMediaAudioDecEncFunction0400,
    SubMultimediaMediaAudioDecEncFunction0500, SubMultimediaMediaAudioDecEncFunction0600,
    SubMultimediaMediaAudioDecEncFunction0700,
};

// CodecFormatFuncTest group: Codec Format (native media API) Tests (0100-0300, index 0-2)
static const std::vector<TestFunction> g_codecFormatTests = {
    SubMultimediaMediaCodecFormat0100,
    SubMultimediaMediaCodecFormat0200,
    SubMultimediaMediaCodecFormat0300,
};

// VideoDecEncFuncTest group: Video Dec/Enc Function Tests (0100-0700, index 0-6)
static const std::vector<TestFunction> g_videoDecEncFuncTests = {
    SubMultimediaMediaVideoDecEncFunction0100, SubMultimediaMediaVideoDecEncFunction0200,
    SubMultimediaMediaVideoDecEncFunction0300, SubMultimediaMediaVideoDecEncFunction0400,
    SubMultimediaMediaVideoDecEncFunction0500, SubMultimediaMediaVideoDecEncFunction0600,
    SubMultimediaMediaVideoDecEncFunction0700,
};

// Async work data: carries all state needed across Execute and Complete callbacks
struct AsyncTestData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    const std::vector<TestFunction>* tests = nullptr;
    int testCaseIndex = -1;
    int result = -1;
};

// Execute callback: runs on NAPI worker thread, never on the JS main thread
static void ExecuteAsyncWork(napi_env /*env*/, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    try {
        int idx = workData->testCaseIndex;
        const std::vector<TestFunction>& tests = *workData->tests;
        if (idx >= 0 && idx < static_cast<int>(tests.size()) && tests[idx] != nullptr) {
            workData->result = tests[idx]();
        } else {
            workData->result = -1;
        }
    } catch (...) {
        workData->result = -1;
    }
}

// Complete callback: runs back on the JS main thread after Execute finishes
static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncTestData* workData = static_cast<AsyncTestData*>(data);
    napi_value resultValue;
    napi_create_int32(env, workData->result, &resultValue);
    if (status == napi_cancelled) {
        napi_reject_deferred(env, workData->deferred, resultValue);
    } else {
        napi_resolve_deferred(env, workData->deferred, resultValue);
    }
    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// Common async entry: parse index arg → create Promise → queue async work → return Promise
static napi_value RunTestAsync(napi_env env,
                               napi_callback_info info,
                               const std::vector<TestFunction>& tests,
                               const char* resourceName)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc < 1) {
        napi_throw_error(env, nullptr, "Missing argument");
        return nullptr;
    }

    napi_valuetype valuetype;
    napi_typeof(env, args[0], &valuetype);
    if (valuetype != napi_number) {
        napi_throw_type_error(env, nullptr, "Argument must be a number");
        return nullptr;
    }

    int32_t caseIndex = -1;
    napi_get_value_int32(env, args[0], &caseIndex);

    napi_value promise;
    napi_deferred deferred;
    if (napi_create_promise(env, &deferred, &promise) != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    AsyncTestData* workData = new AsyncTestData();
    workData->deferred = deferred;
    workData->tests = &tests;
    workData->testCaseIndex = static_cast<int>(caseIndex);

    napi_value resName;
    napi_create_string_utf8(env, resourceName, NAPI_AUTO_LENGTH, &resName);

    napi_status createStatus = napi_create_async_work(
        env, nullptr, resName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (createStatus != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    napi_status queueStatus = napi_queue_async_work(env, workData->asyncWork);
    if (queueStatus != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

static napi_value AudioDecEncFuncTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_audioDecEncFuncTests, "AudioDecEncFuncTest");
}

static napi_value CodecFormatFuncTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_codecFormatTests, "CodecFormatFuncTest");
}

static napi_value VideoDecEncFuncTest(napi_env env, napi_callback_info info)
{
    return RunTestAsync(env, info, g_videoDecEncFuncTests, "VideoDecEncFuncTest");
}

static napi_property_descriptor g_mediaDescriptors[] = {
    { "AudioDecEncFuncTest", nullptr, AudioDecEncFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "CodecFormatFuncTest", nullptr, CodecFormatFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "VideoDecEncFuncTest", nullptr, VideoDecEncFuncTest, nullptr, nullptr, nullptr, napi_default, nullptr },
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(
        env, exports, sizeof(g_mediaDescriptors) / sizeof(g_mediaDescriptors[0]), g_mediaDescriptors);
    return exports;
}
EXTERN_C_END

static napi_module mediacppstandardModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "mediacppstandard_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&mediacppstandardModule);
}
