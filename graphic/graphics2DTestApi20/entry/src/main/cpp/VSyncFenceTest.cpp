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

#include "VSyncFenceTest.h"
#include <native_effect/effect_filter.h>
#include <fcntl.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_vsync/native_vsync.h>
#include <native_vsync/graphic_error_code.h>
#include <native_fence/native_fence.h>
#include <filemanagement/environment/oh_environment.h>

void addVSyncFenceTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"requestFrameSuccess", nullptr, OH_NativeVSync_RequestFrameSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"requestFrameInvalue", nullptr, OH_NativeVSync_RequestFrameInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"NativeVSyncDVSyncSwitchSuccess", nullptr, OH_NativeVSync_DVSyncSwitchSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"NativeVSyncDVSyncSwitchInvalue", nullptr, OH_NativeVSync_DVSyncSwitchInvalue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceIsValidTrue", nullptr, OH_NativeFence_IsValidTrue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceIsValidFalse", nullptr, OH_NativeFence_IsValidFalse,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceWaitTrue", nullptr, OH_NativeFence_WaitTrue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceWaitFalse", nullptr, OH_NativeFence_WaitFalse,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceWaitForeverTrue", nullptr, OH_NativeFence_WaitForeverTrue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceWaitForeverFalse", nullptr, OH_NativeFence_WaitForeverFalse,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceCloseTrue", nullptr, OH_NativeFence_CloseTrue,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fenceCloseFalse", nullptr, OH_NativeFence_CloseFalse,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"setExpectedFrameRateRangeSuccess", nullptr, OH_NativeVSync_SetExpectedFrameRateRangeSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"setExpectedFrameRateRangeNull", nullptr, OH_NativeVSync_SetExpectedFrameRateRangeNull,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

 napi_value OH_NativeVSync_RequestFrameSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeVSync* nativeVsync = OH_NativeVSync_Create("Test", 4);
    OH_NativeVSync_FrameCallback callback = [](long long timestamp, void *data) {};
    void* data = nullptr;
    int32_t res = OH_NativeVSync_RequestFrame(nativeVsync, callback, data);
    int32_t res2 = OH_NativeVSync_DVSyncSwitch(nativeVsync, true);
    napi_create_int32(env, res == NATIVE_ERROR_OK, &result);
    return result;
}
 napi_value OH_NativeVSync_RequestFrameInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeVSync* nativeVsync = nullptr;
    OH_NativeVSync_FrameCallback callback = [](long long timestamp, void *data) {};
    void* data = nullptr;
    int32_t res = OH_NativeVSync_RequestFrame(nativeVsync, callback, data);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeVSync_DVSyncSwitchSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeVSync* nativeVsync = OH_NativeVSync_Create("Test", 4);
    OH_NativeVSync_FrameCallback callback = [](long long timestamp, void *data) {};
    void* data = nullptr;
    int32_t res = OH_NativeVSync_DVSyncSwitch(nativeVsync, true);
    napi_create_int32(env, res == NATIVE_ERROR_OK, &result);
    return result;
}
 napi_value OH_NativeVSync_DVSyncSwitchInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeVSync* nativeVsync = nullptr;
    int32_t res = OH_NativeVSync_DVSyncSwitch(nativeVsync, true);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeFence_IsValidTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = 1;
    bool res = OH_NativeFence_IsValid(1);
    napi_create_int32(env, res, &result);
    return result;
}

 napi_value OH_NativeFence_IsValidFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    bool res = OH_NativeFence_IsValid(fenceFd);
    napi_create_int32(env, res == false, &result);
    return result;
}

 napi_value OH_NativeFence_WaitTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = 1;
    uint32_t TIMEOUT_MS = 1000;
    bool res = OH_NativeFence_Wait(fenceFd, TIMEOUT_MS);
    napi_create_int32(env, res, &result);
    return result;
}

 napi_value OH_NativeFence_WaitFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    uint32_t TIMEOUT_MS = 1000;
    bool res = OH_NativeFence_Wait(fenceFd, TIMEOUT_MS);
    napi_create_int32(env, res == false, &result);
    return result;
}

 napi_value OH_NativeFence_WaitForeverTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = 1;
    uint32_t TIMEOUT_MS = 1000;
    bool res = OH_NativeFence_WaitForever(fenceFd);
    napi_create_int32(env, res, &result);
    return result;
}

 napi_value OH_NativeFence_WaitForeverFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    uint32_t TIMEOUT_MS = 1000;
    bool res = OH_NativeFence_WaitForever(fenceFd);
    napi_create_int32(env, res == false, &result);
    return result;
}

 napi_value OH_NativeFence_CloseTrue(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = 1;
    uint32_t TIMEOUT_MS = 1000;
    OH_NativeFence_Close(fenceFd);
    napi_create_int32(env, true, &result);
    return result;
}

 napi_value OH_NativeFence_CloseFalse(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    uint32_t TIMEOUT_MS = 1000;
    OH_NativeFence_Close(fenceFd);
    napi_create_int32(env, true, &result);
    return result;
}
 napi_value OH_NativeVSync_SetExpectedFrameRateRangeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    char name[] = "test";
    OH_NativeVSync* nativeVsync = OH_NativeVSync_Create(name, sizeof(name));
    OH_NativeVSync_ExpectedRateRange range = {30, 60, 30};
    int res = OH_NativeVSync_SetExpectedFrameRateRange(nativeVsync, &range);
    napi_create_int32(env, res == NATIVE_ERROR_OK, &result);
    return result;
}
 napi_value OH_NativeVSync_SetExpectedFrameRateRangeNull(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t fenceFd = -1;
    OH_NativeVSync* nativeVsync = nullptr;
    OH_NativeVSync_ExpectedRateRange* range = nullptr;
    int res = OH_NativeVSync_SetExpectedFrameRateRange(nativeVsync, range);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}