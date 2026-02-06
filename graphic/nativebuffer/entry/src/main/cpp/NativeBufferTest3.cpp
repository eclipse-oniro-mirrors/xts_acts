/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "NativeBufferTest.h"
#include "napi/native_api.h"
#include <IPCKit/ipc_cparcel.h>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include "common/log_common.h"

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

static OH_NativeBuffer *getBuffer()
{
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(&config);
    return buffer;
}

napi_value OHNativeBufferIsSupportedNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = 0x100;
    config.height = 0x100;
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    bool isSupported = false;
    int32_t ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (isSupported != true) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferIsSupportedNull01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = 0;
    config.height = 0x100;
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    bool isSupported = false;
    int32_t ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    config.width = 0x100;
    config.height = 0;
    ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    config.height = 0x100;
    config.format = static_cast<int32_t>(0);
    ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != true) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferIsSupportedNull02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = 0x100;
    config.height = 0x100;
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    bool isSupported = false;
    int32_t ret = OH_NativeBuffer_IsSupported(config, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferIsSupportedAbnormal01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = -1;
    config.height = 0x100;
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    bool isSupported = false;
    int32_t ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    config.width = 0x100;
    config.height = -1;
    ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    config.height = 0x100;
    config.format = static_cast<int32_t>(-1);
    ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferIsSupportedAbnormal02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = 0x100;
    config.height = 0x100;
     // NATIVEBUFFER_PIXEL_FMT_BUTT = 0X7FFFFFFF 非法值的起点
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_BUTT);
    bool isSupported = false;
    int32_t ret = OH_NativeBuffer_IsSupported(config, &isSupported);
    if (ret != 0 || isSupported != false) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferIsSupportedMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config;
    config.width = 0x100;
    config.height = 0x100;
    config.format = static_cast<int32_t>(NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    bool isSupported = false;
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t ret = OH_NativeBuffer_IsSupported(config, &isSupported);
        if (ret != 0 || isSupported != true) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAndGetConfilgNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    OH_NativeBuffer_Config testConfig = {};
    int32_t ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer, &virAddr, &testConfig);
    if (ret != 0 || testConfig.width != config.width || testConfig.height != config.height || testConfig.format !=
        config.format || testConfig.usage != config.usage) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAndGetConfilgNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    OH_NativeBuffer_Config testConfig = {};
    int32_t ret = OH_NativeBuffer_MapAndGetConfig(nullptr, &virAddr, &testConfig);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer, nullptr, &testConfig);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer, &virAddr, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAndGetConfilgMultipleCalls01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    OH_NativeBuffer_Config testConfig = {};
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer, &virAddr, &testConfig);
        if (ret != 0 || testConfig.width != config.width || testConfig.height != config.height || testConfig.format !=
            config.format || testConfig.usage != config.usage) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAndGetConfilgMultipleCalls02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config1 = {
        .width = 0x001,
        .height = 0x001,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer1 = OH_NativeBuffer_Alloc(&config1);
    if (nativeBuffer1 == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Config config2 = {
        .width = 0x001,
        .height = 0x001,
        .format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer2 = OH_NativeBuffer_Alloc(&config2);
    if (nativeBuffer2 == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    uint32_t TARGET_USAGE = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer1, &virAddr, &config1);
        if (ret != 0 || config1.width != NUMBER_0X001 || config1.height != NUMBER_0X001 || config1.format !=
            NATIVEBUFFER_PIXEL_FMT_RGBA_8888 || (config1.usage & TARGET_USAGE) != TARGET_USAGE) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer2, &virAddr, &config2);
        if (ret != 0 || config2.width != NUMBER_0X001 || config2.height != NUMBER_0X001 || config2.format !=
            NATIVEBUFFER_PIXEL_FMT_BGRA_8888 || (config2.usage & TARGET_USAGE) != TARGET_USAGE) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer1);
    OH_NativeBuffer_Unreference(nativeBuffer2);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAll(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    int32_t ret = OH_NativeBuffer_Map(nativeBuffer, &virAddr);
    if (ret != 0 || virAddr == nullptr) {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Planes outPlanes;
    ret = OH_NativeBuffer_MapPlanes(nativeBuffer, &virAddr, &outPlanes);
    if (ret != 0 || virAddr == nullptr) {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Config testConfig = {};
    ret = OH_NativeBuffer_MapAndGetConfig(nativeBuffer, &virAddr, &testConfig);
    if (ret != 0 || testConfig.width != config.width || testConfig.height != config.height ||
        testConfig.format != config.format || testConfig.usage != config.usage) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = -1;
    ret = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, &virAddr);
    if (ret == 0 || virAddr != nullptr) {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapAndUnmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    void *virAddr = nullptr;
    OH_NativeBuffer_MapAndGetConfig(nativeBuffer, &virAddr, &config);
    int32_t ret = OH_NativeBuffer_Unmap(nativeBuffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferWriteToParcelNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t ret = OH_NativeBuffer_WriteToParcel(nativeBuffer, parcel);
    if (ret != 0 || parcel == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_IPCParcel_Destroy(parcel);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferWriteToParcelNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t ret = OH_NativeBuffer_WriteToParcel(nullptr, parcel);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeBuffer_WriteToParcel(nativeBuffer, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferReadFromParcelNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config1 = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        .stride = 1024
    };
    OH_NativeBuffer *nativeBuffer1 = OH_NativeBuffer_Alloc(&config1);
    OH_NativeBuffer_GetConfig(nativeBuffer1, &config1);
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t ret = OH_NativeBuffer_WriteToParcel(nativeBuffer1, parcel);
    if (ret != 0 || parcel == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer *nativeBuffer2 = nullptr;
    ret = OH_NativeBuffer_ReadFromParcel(parcel, &nativeBuffer2);
    if (ret != 0 || nativeBuffer2 == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    LOGE("OHNativeBufferReadFromParcelNormal OH_NativeBuffer_ReadFromParcel ret = %{public}d", ret);
    OH_NativeBuffer_Config config2 = {};
    OH_NativeBuffer_GetConfig(nativeBuffer2, &config2);
    if (config1.width != config2.width || config1.height != config2.height || config1.format != config2.format ||
        config1.usage != config2.usage || config1.stride != config2.stride) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer1);
    OH_NativeBuffer_Unreference(nativeBuffer2);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferReadFromParcelNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = nullptr;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t ret = OH_NativeBuffer_ReadFromParcel(nullptr, &nativeBuffer);
    if (ret == 0 || nativeBuffer != nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeBuffer_ReadFromParcel(parcel, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferReadFromParcelAbnnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 序列化数据异常
    OH_NativeBuffer_Config config = {
        .width = 0,
        .height = 0,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        .stride = 256
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer != nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t ret = OH_NativeBuffer_WriteToParcel(nativeBuffer, parcel);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeBuffer_ReadFromParcel(parcel, &nativeBuffer);
    if (ret != NATIVE_ERROR_UNKNOWN) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferWriteAndReadParcelMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    for (int i = 0; i < NUMBER_10; i++) {
        int32_t ret = OH_NativeBuffer_WriteToParcel(nativeBuffer, parcel);
        if (ret != 0 || parcel == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        ret = OH_NativeBuffer_ReadFromParcel(parcel, &nativeBuffer);
        if (ret != 0 || nativeBuffer == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}