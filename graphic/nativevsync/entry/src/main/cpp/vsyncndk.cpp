/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <ctime>
#include <native_vsync.h>

#define SUCCESS 0
#define FAIL (-1)
#define PARAM_0 0
#define TIMEOUT_FIVE 10

static bool g_flag = false;
static void OnVSync(long long timestamp, void *data) { g_flag = true; }

static napi_value OHNativeVSyncCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    if (nativeVSync != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
        OH_NativeVSync_Destroy(nativeVSync);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeVSyncCreateFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    unsigned int length = 0;
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(nullptr, length);
    if (nativeVSync != nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrame(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    OH_NativeVSync_FrameCallback callback = OnVSync;
    int ret = OH_NativeVSync_RequestFrame(nativeVSync, callback, nullptr);
    if (ret == SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrameFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = OH_NativeVSync_RequestFrame(nullptr, nullptr, nullptr);
    if (ret != SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHNativeVSyncRequestFrameFTwo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    int ret = OH_NativeVSync_RequestFrame(nativeVSync, nullptr, nullptr);
    if (ret != SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncGetPeriod(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char name[] = "test";
    OH_NativeVSync *nativeVSync = OH_NativeVSync_Create(name, sizeof(name));
    OH_NativeVSync_FrameCallback callback = OnVSync;
    OH_NativeVSync_RequestFrame(nativeVSync, callback, nullptr);
    time_t startTime = time(PARAM_0);
    double diffTime = 0;
    while (!g_flag && diffTime < TIMEOUT_FIVE) {
        time_t curTime = time(PARAM_0);
        diffTime = difftime(curTime, startTime);
    }
    long long period = 0;
    int ret = OH_NativeVSync_GetPeriod(nativeVSync, &period);
    if (ret == SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    if (nativeVSync) {
        OH_NativeVSync_Destroy(nativeVSync);
    }
    return result;
}

static napi_value OHNativeVSyncGetPeriodFOne(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    long long period = 0;
    int ret = OH_NativeVSync_GetPeriod(nullptr, &period);
    if (ret != SUCCESS) {
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
        {"oHNativeVSyncCreate", nullptr, OHNativeVSyncCreate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncCreateFOne", nullptr, OHNativeVSyncCreateFOne, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncRequestFrame", nullptr, OHNativeVSyncRequestFrame, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeVSyncRequestFrameFOne", nullptr, OHNativeVSyncRequestFrameFOne, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncRequestFrameFTwo", nullptr, OHNativeVSyncRequestFrameFTwo, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeVSyncGetPeriod", nullptr, OHNativeVSyncGetPeriod, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeVSyncGetPeriodFOne", nullptr, OHNativeVSyncGetPeriodFOne, nullptr, nullptr, nullptr, napi_default,
         nullptr},
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
    .nm_modname = "media",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
