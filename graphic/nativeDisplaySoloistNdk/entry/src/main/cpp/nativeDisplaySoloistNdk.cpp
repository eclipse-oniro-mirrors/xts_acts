/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <js_native_api.h>
#include "napi/native_api.h"
#include "native_display_soloist/native_display_soloist.h"
#include "hilog/log.h"

#define SUCCESS           0
#define FAIL              (-1)
#define FRAME_RATE_30_HZ  30
#define FRAME_RATE_60_HZ  60
#define FRAME_RATE_90_HZ  90
#define FRAME_RATE_120_HZ 120
#define SLEEP_TIME_US     100000
#define EXEC_SUCCESS      0
#define SOLOIST_ERROR     (-1)
 
static void OnVSync(long long timestamp, long long targetTimestamp, void* data)
{
}

static napi_value OHDisplaySoloistCreate001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    return result;
}

static napi_value OHDisplaySoloistStart001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist_FrameCallback callback = OnVSync;
    int32_t resultStart = OH_DisplaySoloist_Start(nullptr, callback, nullptr);
    if (resultStart == SOLOIST_ERROR) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDisplaySoloistStart002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    OH_DisplaySoloist_FrameCallback callback = OnVSync;
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    int32_t resultStart = OH_DisplaySoloist_Start(nativeDisplaySoloist, callback, nullptr);
    if (resultStart == EXEC_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    return result;
}

static napi_value OHDisplaySoloistSetExpectedFrameRateRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    DisplaySoloist_ExpectedRateRange validRange = { FRAME_RATE_30_HZ, FRAME_RATE_120_HZ, FRAME_RATE_60_HZ };
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if ((OH_DisplaySoloist_SetExpectedFrameRateRange(nullptr, &validRange) == SOLOIST_ERROR) ||
        (OH_DisplaySoloist_SetExpectedFrameRateRange(nativeDisplaySoloist, nullptr) == SOLOIST_ERROR)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    return result;
}

static napi_value OHDisplaySoloistSetExpectedFrameRateRange002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    DisplaySoloist_ExpectedRateRange invalidRange = { FRAME_RATE_30_HZ, FRAME_RATE_90_HZ, FRAME_RATE_120_HZ };
    int32_t resultRange = OH_DisplaySoloist_SetExpectedFrameRateRange(nullptr, &invalidRange);
    if (resultRange == SOLOIST_ERROR) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDisplaySoloistSetExpectedFrameRateRange003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    DisplaySoloist_ExpectedRateRange validRange = { FRAME_RATE_30_HZ, FRAME_RATE_120_HZ, FRAME_RATE_60_HZ };
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    int32_t resultRange = OH_DisplaySoloist_SetExpectedFrameRateRange(nativeDisplaySoloist, &validRange);
    if (resultRange == EXEC_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    return result;
}

static napi_value OHDisplaySoloistStop001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t resultStop = OH_DisplaySoloist_Stop(nullptr);
    if (resultStop == SOLOIST_ERROR) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDisplaySoloistStop002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    int32_t resultStop = OH_DisplaySoloist_Stop(nativeDisplaySoloist);
    if (resultStop == EXEC_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    return result;
}

static napi_value OHDisplaySoloistDestroy001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t resultDestroy = OH_DisplaySoloist_Destroy(nullptr);
    if (resultDestroy == SOLOIST_ERROR) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHDisplaySoloistDestroy002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_DisplaySoloist *nativeDisplaySoloist = nullptr;
    nativeDisplaySoloist = OH_DisplaySoloist_Create(false);
    if (nativeDisplaySoloist != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    int32_t resultDestroy = OH_DisplaySoloist_Destroy(nativeDisplaySoloist);
    if (resultDestroy == EXEC_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHDisplaySoloistCreate001", nullptr, OHDisplaySoloistCreate001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistStart001", nullptr, OHDisplaySoloistStart001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistStart002", nullptr, OHDisplaySoloistStart002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistSetExpectedFrameRateRange001", nullptr, OHDisplaySoloistSetExpectedFrameRateRange001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistSetExpectedFrameRateRange002", nullptr, OHDisplaySoloistSetExpectedFrameRateRange002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistSetExpectedFrameRateRange003", nullptr, OHDisplaySoloistSetExpectedFrameRateRange003,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistStop001", nullptr, OHDisplaySoloistStop001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistStop002", nullptr, OHDisplaySoloistStop002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistDestroy001", nullptr, OHDisplaySoloistDestroy001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHDisplaySoloistDestroy002", nullptr, OHDisplaySoloistDestroy002,
         nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativeDisplaySoloistNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }