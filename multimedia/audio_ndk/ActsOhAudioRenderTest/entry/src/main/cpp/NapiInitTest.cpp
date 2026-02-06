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
#include <array>
#include <functional>
#include "include/OhAudioRenderUnitTest.h"
#include "include/OhosCommonTest.h"
#include "napi/native_api.h"

// Async work data structure
struct AsyncWorkData {
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    std::function<int()> testFunction = nullptr;
    int result = -1;
};

// Execute async work in worker thread
static void ExecuteAsyncWork(napi_env env, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);
    if (workData->testFunction) {
        workData->result = workData->testFunction();
    }
}

// Complete async work in main thread
static void CompleteAsyncWork(napi_env env, napi_status status, void* data)
{
    AsyncWorkData* workData = static_cast<AsyncWorkData*>(data);

    napi_value result;
    napi_create_int32(env, workData->result, &result);

    if (workData->result == 0) {
        napi_resolve_deferred(env, workData->deferred, result);
    } else {
        napi_reject_deferred(env, workData->deferred, result);
    }

    napi_delete_async_work(env, workData->asyncWork);
    delete workData;
}

// Create async work helper
static napi_value CreateAsyncWork(napi_env env, std::function<int()> testFunc)
{
    napi_value promise;
    napi_deferred deferred;
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create promise");
        return nullptr;
    }

    AsyncWorkData* workData = new AsyncWorkData();
    workData->deferred = deferred;
    workData->testFunction = testFunc;

    napi_value resourceName;
    napi_create_string_utf8(env, "OhAudioRenderTest", NAPI_AUTO_LENGTH, &resourceName);

    status = napi_create_async_work(
        env, nullptr, resourceName, ExecuteAsyncWork, CompleteAsyncWork, workData, &workData->asyncWork);
    if (status != napi_ok) {
        delete workData;
        napi_throw_error(env, nullptr, "Failed to create async work");
        return nullptr;
    }

    status = napi_queue_async_work(env, workData->asyncWork);
    if (status != napi_ok) {
        napi_delete_async_work(env, workData->asyncWork);
        delete workData;
        napi_throw_error(env, nullptr, "Failed to queue async work");
        return nullptr;
    }

    return promise;
}

// Common argument and result constants.
static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

using AudioRenderTestFn = int (*)();

// Case number constants
enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5,
    CASE_NUM_6,
    CASE_NUM_7,
    CASE_NUM_8,
    CASE_NUM_9,
    CASE_NUM_10,
    CASE_NUM_11,
    CASE_NUM_12,
    CASE_NUM_13,
    CASE_NUM_14,
    CASE_NUM_15,
    CASE_NUM_16,
    CASE_NUM_17,
    CASE_NUM_18,
    CASE_NUM_19,
    CASE_NUM_20,
    CASE_NUM_21
};

// Category 1: Renderer Creation Test (2 cases)
static napi_value RendererCreationTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderGenerate001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderGenerate002;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

static std::function<int()> GetLifecycleTestFunction(int32_t caseNum)
{
    switch (caseNum) {
        case CASE_NUM_0:
            return Acts::AudioRender::OhAudioRenderStart001;
        case CASE_NUM_1:
            return Acts::AudioRender::OhAudioRenderStart002;
        case CASE_NUM_2:
            return Acts::AudioRender::OhAudioRenderPause001;
        case CASE_NUM_3:
            return Acts::AudioRender::OhAudioRenderPause002;
        case CASE_NUM_4:
            return Acts::AudioRender::OhAudioRenderStop001;
        case CASE_NUM_5:
            return Acts::AudioRender::OhAudioRenderStop002;
        case CASE_NUM_6:
            return Acts::AudioRender::OhAudioRenderFlush001;
        case CASE_NUM_7:
            return Acts::AudioRender::OhAudioRenderFlush002;
        case CASE_NUM_8:
            return Acts::AudioRender::OhAudioRenderRelease001;
        case CASE_NUM_9:
            return Acts::AudioRender::OhAudioRendererGetCurrentState001;
        case CASE_NUM_10:
            return Acts::AudioRender::OhAudioRendererGetCurrentState002;
        case CASE_NUM_11:
            return Acts::AudioRender::OhAudioRendererGetCurrentState003;
        case CASE_NUM_12:
            return Acts::AudioRender::OhAudioRendererGetCurrentState004;
        default:
            return []() { return RESULT_ERROR; };
    }
}

static napi_value LifecycleControlTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        std::function<int()> testFunc = GetLifecycleTestFunction(caseNum);
        return CreateAsyncWork(env, testFunc);
    });
}

// Category 3: Parameter Getter Test (10 cases)
static napi_value ParameterGetterTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderGetParameter001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderGetParameter002;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRenderGetSamplingRate001;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRenderGetSampleFormat;
                break;
            case CASE_NUM_4:
                testFunc = Acts::AudioRender::OhAudioRenderGetEncodingType001;
                break;
            case CASE_NUM_5:
                testFunc = Acts::AudioRender::OhAudioRenderGetRendererInfo001;
                break;
            case CASE_NUM_6:
                testFunc = Acts::AudioRender::OhAudioRendererGetRendererPrivacy001;
                break;
            case CASE_NUM_7:
                testFunc = Acts::AudioRender::OhAudioRendererGetRendererPrivacy002;
                break;
            case CASE_NUM_8:
                testFunc = Acts::AudioRender::OhAudioRendererGetChannelLayout001;
                break;
            case CASE_NUM_9:
                testFunc = Acts::AudioRender::OhAudioRendererGetEffectMode001;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 4: Volume Control Test (10 cases)
static napi_value VolumeControlTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderGetVolume001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderGetVolume002;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRenderGetVolume003;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRenderGetVolume004;
                break;
            case CASE_NUM_4:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolume001;
                break;
            case CASE_NUM_5:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolume002;
                break;
            case CASE_NUM_6:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolume003;
                break;
            case CASE_NUM_7:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolume004;
                break;
            case CASE_NUM_8:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolumeWithRamp001;
                break;
            case CASE_NUM_9:
                testFunc = Acts::AudioRender::OhAudioRenderSetVolumeWithRamp002;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 5: Mark Position Test (8 cases)
static napi_value MarkPositionTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderSetMarkPosition001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderSetMarkPosition002;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRenderSetMarkPosition003;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRenderSetMarkPosition004;
                break;
            case CASE_NUM_4:
                testFunc = Acts::AudioRender::OhAudioRenderSetMarkPosition005;
                break;
            case CASE_NUM_5:
                testFunc = Acts::AudioRender::OhAudioRenderCancelMark001;
                break;
            case CASE_NUM_6:
                testFunc = Acts::AudioRender::OhAudioRenderCancelMark002;
                break;
            case CASE_NUM_7:
                testFunc = Acts::AudioRender::OhAudioRenderCancelMark003;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 6: Underflow Detection Test (5 cases)
static napi_value UnderflowDetectionTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRendererGetUnderflowCount001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRendererGetUnderflowCount003;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRendererGetUnderflowCount004;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRendererGetUnderflowCount005;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 7: Write Data Callback Test (6 cases)
static napi_value WriteDataCallbackTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback002;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback003;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback004;
                break;
            case CASE_NUM_4:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback005;
                break;
            case CASE_NUM_5:
                testFunc = Acts::AudioRender::OhAudioRenderWriteDataCallback006;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 8: Loudness Gain Set Test (12 cases, note: gaps in numbering)
static napi_value LoudnessGainSetTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain006;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain007;
                break;
            case CASE_NUM_2:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain008;
                break;
            case CASE_NUM_3:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain010;
                break;
            case CASE_NUM_4:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain011;
                break;
            case CASE_NUM_5:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain012;
                break;
            case CASE_NUM_6:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain013;
                break;
            case CASE_NUM_7:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain014;
                break;
            case CASE_NUM_8:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain015;
                break;
            case CASE_NUM_9:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain017;
                break;
            case CASE_NUM_10:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain018;
                break;
            case CASE_NUM_11:
                testFunc = Acts::AudioRender::OhAudioRenderSetLoudnessGain019;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

// Category 10: Stream Manager Test (2 cases)
static napi_value StreamManagerTest(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);

        std::function<int()> testFunc;
        switch (caseNum) {
            case CASE_NUM_0:
                testFunc = Acts::AudioRender::OhAudioStreamManagerIsAcousticEchoCancelerSupported001;
                break;
            case CASE_NUM_1:
                testFunc = Acts::AudioRender::OhAudioStreamManagerIsAcousticEchoCancelerSupported002;
                break;
            default:
                testFunc = []() { return RESULT_ERROR; };
                break;
        }

        return CreateAsyncWork(env, testFunc);
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "RendererCreationTest", nullptr, RendererCreationTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "LifecycleControlTest", nullptr, LifecycleControlTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ParameterGetterTest", nullptr, ParameterGetterTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "VolumeControlTest", nullptr, VolumeControlTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "MarkPositionTest", nullptr, MarkPositionTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "UnderflowDetectionTest", nullptr, UnderflowDetectionTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "WriteDataCallbackTest", nullptr, WriteDataCallbackTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "LoudnessGainSetTest", nullptr, LoudnessGainSetTest, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "StreamManagerTest", nullptr, StreamManagerTest, nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "ohaudiorenderops",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
