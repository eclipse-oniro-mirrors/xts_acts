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

#include "napi/native_api.h"
#include "ohaudio/native_audiocapturer.h"
#include "ohaudio/native_audiorenderer.h"
#include "ohaudio/native_audiostream_base.h"
#include "ohaudio/native_audiostreambuilder.h"
#include "ohaudio/native_audio_manager.h"
#include "ohaudio/native_audio_common.h"
#include "ohaudio/native_audio_routing_manager.h"
#include "ohaudio/native_audio_device_base.h"
#include "ohaudio/native_audio_session_manager.h"
#include "ohaudio/native_audio_resource_manager.h"
#include "ohaudio/native_audio_volume_manager.h"
#include "ohaudio/native_audio_stream_manager.h"
#include <cstdio>
#include <cstdlib>
#include <string>
#include <set>
#include <thread>
#include "hilog/log.h"

#define AUDIO_LOG_TAG "AUDIO_TAGLOG"
#define AUDIO_LOG_DOMAIN 0x4310

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, AUDIO_LOG_DOMAIN, AUDIO_LOG_TAG, \
fmt, ##__VA_ARGS__)

enum class TestResult {
    TEST_FAIL = 0,
    TEST_PASS = 1,
};

static napi_value AudioCapturer_RequestPlaybackStart_Callback_0007(napi_env env, napi_callback_info info)
{
    napi_value res;
    void *userData;
    OH_AudioStream_Result result = OH_AudioCapturer_RequestPlaybackCaptureStart(nullptr,
        nullptr, nullptr);
    if (result == AUDIOSTREAM_ERROR_INVALID_PARAM) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    } else {
        LOG("AudioCapturer_RequestPlaybackStart_Callback_0007 fail, result is: %{public}d", result);
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    }
    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "AudioCapturer_RequestPlaybackStart_Callback_0007", nullptr, AudioCapturer_RequestPlaybackStart_Callback_0007,
            nullptr, nullptr, nullptr, napi_default, nullptr },
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
    .nm_modname = "audiocapturerplaybacktest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
