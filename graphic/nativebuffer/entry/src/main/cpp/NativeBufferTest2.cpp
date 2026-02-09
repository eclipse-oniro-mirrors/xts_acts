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

#include "napi/native_api.h"
#include <GLES2/gl2.h>
#include <bits/alltypes.h>
#include <cstddef>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <climits>
#include <native_image/native_image.h>
#include <sys/types.h>
#include <thread>
#include <chrono>
#include <unistd.h>
#include <vector>
#include <hilog/log.h>
#include "NativeBufferTest.h"

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

napi_value OHNativeBufferAlloc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();
    if (buffer != nullptr) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferAllocAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(nullptr);

    if (buffer != nullptr) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferReference(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();
    if (buffer != nullptr) {
        int32_t ret = OH_NativeBuffer_Reference(buffer);
        backInfo = ret;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferReferenceAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    int32_t ret = OH_NativeBuffer_Reference(nullptr);
    if (ret == 0) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

napi_value OHNativeBufferUnreference(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();

    if (buffer != nullptr) {
        int32_t ret = OH_NativeBuffer_Unreference(buffer);
        backInfo = ret;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferUnreferenceAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;

    int32_t ret = OH_NativeBuffer_Unreference(nullptr);
    if (ret == 0) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

napi_value OHNativeBufferGetConfig(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();
    if (buffer != nullptr) {
        OH_NativeBuffer_Config checkConfig = {};
        checkConfig.width = 0x0;
        checkConfig.height = 0x0;
        checkConfig.format = 0x0;
        checkConfig.usage = 0x0;
        OH_NativeBuffer_GetConfig(buffer, &checkConfig);
        if (&checkConfig != nullptr) {
            backInfo = NATIVE_ERROR_OK;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferMap(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();

    if (buffer != nullptr) {
        void *virAddr = nullptr;
        int32_t ret = OH_NativeBuffer_Map(buffer, &virAddr);
        backInfo = ret;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferMapAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    void *virAddr = nullptr;
    int32_t ret = OH_NativeBuffer_Map(nullptr, &virAddr);
    if (ret == 0) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

napi_value OHNativeBufferUnmap(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();

    if (buffer != nullptr) {
        int32_t ret = OH_NativeBuffer_Unmap(buffer);
        backInfo = ret;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferUnmapAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    int32_t ret = OH_NativeBuffer_Unmap(nullptr);
    if (ret == 0) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

napi_value OHNativeBufferGetSeqNum(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();

    if (buffer != nullptr) {
        uint32_t id = OH_NativeBuffer_GetSeqNum(buffer);
        if (id > 0) {
            backInfo = NATIVE_ERROR_OK;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

napi_value OHNativeBufferGetSeqNumAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    uint32_t id = OH_NativeBuffer_GetSeqNum(nullptr);
    if (id > 0 && id != UINT_MAX) {
        backInfo = NATIVE_ERROR_OK;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

napi_value OHNativeBufferAllocNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *ptr = OH_NativeBuffer_Alloc(nullptr);
    if (ptr == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    }
    return result;
}

void nativeBufferConfigArrTest(napi_env &env, napi_value &result,
    std::vector<OH_NativeBuffer_Config> &nativeBufferConfigArr)
{
    for (uint32_t index = 0; index < NUMBER_7; index++) {
        OH_NativeBuffer *ptr = OH_NativeBuffer_Alloc(&nativeBufferConfigArr[index]);
        napi_value resultIndex = nullptr;
        if (ptr == NULL) {
            napi_create_int32(env, FAIL, &resultIndex);
        } else {
            napi_create_int32(env, NATIVE_ERROR_OK, &result);
        }
        napi_set_element(env, result, index, resultIndex);
    }
}

napi_value OHNativeBufferAllocNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_7, &result);
    std::vector<OH_NativeBuffer_Config> nativeBufferConfigArr = {
        {
            .width = 0x100,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0x7FFFFFFF,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_RGBA_5658,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_BGRA_5551,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0x7FFFFFFE,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_YUV_422_I,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
            .stride = 0,
        }, {
            .width = 0x100,
            .height = 0x7FFFFFFF,
            .format = NATIVEBUFFER_PIXEL_FMT_CLUT4,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
            .stride = 1,
        }, {
            .width = 0x100,
            .height = 0,
            .format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
            .stride = 0x7FFFFFFF,
        }, {
            .width = 0x100,
            .height = 0x7FFFFFFE,
            .format = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }
    };

    nativeBufferConfigArrTest(env, result, nativeBufferConfigArr);
    return result;
}

napi_value OHNativeBufferAllocAbormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_7, &result);
    std::vector<OH_NativeBuffer_Config> nativeBufferConfigArr = {
        {
            .width = - 0x100,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0x100,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_BGRA_5551,
            .usage = -1,
        }, {
            .width = 0x100,
            .height = 0x100,
            .format = -1,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0x100,
            .height = -0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_CLUT4,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        }, {
            .width = 0x100,
            .height = 0x100,
            .format = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
            .stride = -100,
        }
    };

    for (uint32_t index = 0; index < nativeBufferConfigArr.size(); index++) {
        OH_NativeBuffer *ptr = OH_NativeBuffer_Alloc(&nativeBufferConfigArr[index]);
        napi_value resultIndex = nullptr;
        if (ptr == NULL) {
            napi_create_int32(env, FAIL, &resultIndex);
        } else {
            napi_create_int32(env, NATIVE_ERROR_OK, &result);
        }
        napi_set_element(env, result, index, resultIndex);
    }
    return result;
}

napi_value OHNativeBufferAllocMuch(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *bufferArr[NUMBER_500];
    for (uint32_t index = 0; index < NUMBER_500; index++) {
        bufferArr[index] = OH_NativeBuffer_Alloc(&nativeBufferConfig);
        if (bufferArr[index] == nullptr) {
            napi_create_int32(env, FAIL, &result);
            break;
        } else {
            napi_create_int32(env, NATIVE_ERROR_OK, &result);
        }
    }
    for (uint32_t index = 0; index < NUMBER_500; index++) {
        OH_NativeBuffer_Unreference(bufferArr[index]);
    }
    return result;
}

napi_value OHNativeBufferFromNativeWindowBufferNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_2, &result);
    napi_value result1 = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(nullptr, &buffer);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, usage);
    int fenceFd = NUMBER_MINUS_1;
    int ret0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);

    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, nullptr);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_1, result1);
    OH_NativeBuffer_Unreference(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&_image);
    return result;
}

// 失败
napi_value OHNativeBufferFromNativeWindowBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    napi_value result1 = nullptr;
    OH_NativeBuffer *buffer = nullptr;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;

    GLuint textureId;
    glGenTextures(1, &textureId);
    auto _image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(_image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, usage);
    int fenceFd = NUMBER_MINUS_1;
    int ret0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &buffer);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);

    // nativeWindowBuffer和nativeBuffer是否一致 一致返回success,失败返回fail
    if (buffer != nullptr) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, NUMBER_1, result1);

    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &buffer);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_2, result1);
    OH_NativeBuffer_Unreference(buffer);
    OH_NativeImage_Destroy(&_image);
    return result;
}

napi_value OHNativeBufferGetConfigNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_NativeBuffer_Config *nativeBufferConfig = nullptr;
    OH_NativeBuffer_GetConfig(nullptr, nativeBufferConfig);
    // 怎么做判断？
    if (nativeBufferConfig != nullptr) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }

    return result;
}

napi_value OHNativeBufferGetConfigNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_Config nativeBufferConfig2;
    OH_NativeBuffer_GetConfig(nativeBuffer, &nativeBufferConfig2);

    // 手动比较 nativeBufferConfig 和 nativeBufferConfig2 的成员
    bool areEqual = true;
    if (nativeBufferConfig.width != nativeBufferConfig2.width) {
        areEqual = false;
    } else if (nativeBufferConfig.height != nativeBufferConfig2.height) {
        areEqual = false;
    } else if (nativeBufferConfig.format != nativeBufferConfig2.format) {
        areEqual = false;
    } else if (nativeBufferConfig.usage != nativeBufferConfig2.usage) {
        areEqual = false;
    }

    if (areEqual) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetSeqNumNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t ret = OH_NativeBuffer_GetSeqNum(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBufferGetSeqNumNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    uint32_t ret = 0;
    ret = OH_NativeBuffer_GetSeqNum(nativeBuffer);
    if (ret > 0 && ret != UINT_MAX) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBuffeMapNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t ret = OH_NativeBuffer_Map(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBufferMapNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    //
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    void *virAddr = nullptr;
    uint32_t ret = OH_NativeBuffer_Map(nativeBuffer, &virAddr);
    if (virAddr != nullptr) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBuffeMapPlanesNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_create_array_with_length(env, NUMBER_2, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    void *virAddr = nullptr;
    OH_NativeBuffer_Planes outPlanes;
    int32_t ret = OH_NativeBuffer_MapPlanes(nullptr, &virAddr, &outPlanes);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);
    ret = OH_NativeBuffer_MapPlanes(nativeBuffer, &virAddr, nullptr);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_1, result1);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferMapPlanesAbNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    void *virAddr = nullptr;
    OH_NativeBuffer_Planes outPlanes;
    int32_t ret = OH_NativeBuffer_MapPlanes(nativeBuffer, &virAddr, &outPlanes);
    if (ret != NATIVE_ERROR_HDI_ERROR) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    } else {
        napi_create_int32(env, ret, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferMapPlanesNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    OH_NativeBuffer_Format format[] = {
        NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
        NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP,
        NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P,
        NATIVEBUFFER_PIXEL_FMT_YCRCB_420_P
    };
    for (int i = 0; i < sizeof(format) / sizeof(format[0]); i++) {
        OH_NativeBuffer_Config nativeBufferConfig = {
            .width = 0x100,
            .height = 0x100,
            .format = format[i],
            .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
        };
        OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
        void *virAddr = nullptr;
        OH_NativeBuffer_Planes outPlanes;
        int32_t ret = OH_NativeBuffer_MapPlanes(nativeBuffer, &virAddr, &outPlanes);
        if (ret != NATIVE_ERROR_OK) {
            napi_create_int32(env, NUMBER_1000 * (i + 1) + NUMBER_1, &result);
            return result;
        } else {
            napi_create_int32(env, NATIVE_ERROR_OK, &result);
        }
        OH_NativeBuffer_Unreference(nativeBuffer);
    }
    return result;
}

napi_value OHNativeBufferMapPlanesNormal1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_3, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    void *virAddr = nullptr;
    OH_NativeBuffer_Planes outPlanes;
    int32_t ret = OH_NativeBuffer_MapPlanes(nativeBuffer, &virAddr, &outPlanes);
    if (outPlanes.planeCount == NUMBER_3 && outPlanes.planes[NUMBER_0].offset == NUMBER_0 &&
        outPlanes.planes[NUMBER_0].rowStride == NUMBER_1 && outPlanes.planes[NUMBER_0].columnStride == NUMBER_256 &&
        outPlanes.planes[NUMBER_1].offset == NUMBER_65536 && outPlanes.planes[NUMBER_1].rowStride == NUMBER_2 &&
        outPlanes.planes[NUMBER_1].columnStride == NUMBER_256 && outPlanes.planes[NUMBER_2].offset == NUMBER_65537 &&
        outPlanes.planes[NUMBER_2].rowStride == NUMBER_2 && outPlanes.planes[NUMBER_2].columnStride  == NUMBER_256) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, NUMBER_1000, &result);
        return result;
    } else {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBuffeReferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Reference(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBuffeUnreferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Unreference(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBufferReferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    int32_t ret = OH_NativeBuffer_Reference(nativeBuffer);
    napi_create_int32(env, ret, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferReferenceMax(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    for (uint32_t index = 0; index < NUMBER_1000; index++) {
        int32_t ret = OH_NativeBuffer_Reference(nativeBuffer);
        napi_create_int32(env, ret, &result);
        if (ret != 0) {
            break;
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferUnreferenceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    int32_t ret = OH_NativeBuffer_Unreference(nativeBuffer);
    if (ret != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBuffeUnmapNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Unmap(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBufferUnmapNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    int32_t ret = OH_NativeBuffer_Unmap(nativeBuffer);
    napi_create_int32(env, ret, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetColorSpaceFirst(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_ColorSpace colorSpace;
    int32_t ret = OH_NativeBuffer_GetColorSpace(nativeBuffer, &colorSpace);
    if (ret != NATIVE_ERROR_UNKNOWN && ret != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetColorSpaceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    for (uint32_t index = 0; index < sizeof(OH_NativeBuffer_ColorSpace); index++) {
        OH_NativeBuffer_ColorSpace colorSpace1 = static_cast<OH_NativeBuffer_ColorSpace>(index);
        OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
        int32_t ret = OH_NativeBuffer_SetColorSpace(nativeBuffer, colorSpace1);
        if (ret != 0) {
            napi_create_int32(env, NUMBER_1000 * index + NUMBER_1, &result);
            return result;
        }
        OH_NativeBuffer_ColorSpace colorspace;
        ret = OH_NativeBuffer_GetColorSpace(nativeBuffer, &colorspace);
        if (ret != 0) {
            napi_create_int32(env, NUMBER_1000 * index + NUMBER_2, &result);
            return result;
        }
        if (colorspace != colorSpace1) {
            napi_create_int32(env, NUMBER_1000 * index + NUMBER_3, &result);
            return result;
        }
        OH_NativeBuffer_Unreference(nativeBuffer);
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_ColorSpace colorSpace = OH_NativeBuffer_ColorSpace::OH_COLORSPACE_ADOBERGB_LIMIT;
    int32_t ret = OH_NativeBuffer_SetColorSpace(nullptr, colorSpace);
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value OHNativeBufferSetColorSpaceAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_ColorSpace colorSpace = (OH_NativeBuffer_ColorSpace)(-10);
    int32_t ret = OH_NativeBuffer_SetColorSpace(nativeBuffer, colorSpace);
    napi_create_int32(env, ret, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_create_array_with_length(env, NUMBER_4, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_ColorSpace colorSpace = OH_NativeBuffer_ColorSpace::OH_COLORSPACE_ADOBERGB_LIMIT;
    int32_t ret = OH_NativeBuffer_SetColorSpace(nativeBuffer, colorSpace);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);
    ret = OH_NativeBuffer_GetColorSpace(nullptr, &colorSpace);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_1, result1);
    ret = OH_NativeBuffer_GetColorSpace(nativeBuffer, nullptr);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_2, result1);
    OH_NativeBuffer_ColorSpace colorSpaceGet;
    ret = OH_NativeBuffer_GetColorSpace(nativeBuffer, &colorSpaceGet);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_3, result1);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetMetadataValueFirst(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = OH_NativeBuffer_MetadataKey::OH_HDR_DYNAMIC_METADATA;
    int32_t size = 0;
    uint8_t *metadata = nullptr;
    int32_t ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer, metadataKey, &size, &metadata);
    if (ret != NATIVE_ERROR_UNKNOWN && ret != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    x = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    x = 1;
    metaData[0] = static_cast<uint8_t>(0);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_3002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_3003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_60;
    uint8_t metaData[NUMBER_60];
    for (int i = 0; i < x; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_4003, &result);
        return result;
    }
    x = NUMBER_2999;
    uint8_t metaData2[x];
    for (int i = 0; i < x; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData2);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_5003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_3000;
    uint8_t metaData[NUMBER_60];
    uint8_t metaData3[x];
    for (int i = 0; i < x; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData3);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    x = NUMBER_3001;
    uint8_t metaData4[x];
    for (int i = 0; i < x; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData4);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7002, &result);
        return result;
    }
    x = NUMBER_10000;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, x, metaData);
    if (flag == 0) {
        napi_create_int32(env, NUMBER_8001, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = OH_NativeBuffer_MetadataKey::OH_HDR_DYNAMIC_METADATA;

    result = OHNativeBufferSetDynamicMetadataValue1(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetDynamicMetadataValue2(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetDynamicMetadataValue3(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }

    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValueTimes(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = OH_NativeBuffer_MetadataKey::OH_HDR_DYNAMIC_METADATA;
    int32_t size = NUMBER_60;
    uint8_t metadata = NUMBER_2;
    for (uint32_t index = 0; index < NUMBER_50; index++) {
        int32_t ret = OH_NativeBuffer_SetMetadataValue(nativeBuffer, metadataKey, size, &metadata);
        if (ret != 0) {
            napi_create_int32(env, ret, &result);
            break;
        }
        int32_t size2 = 0;
        uint8_t *metadata2 = nullptr;
        ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer, metadataKey, &size2, &metadata2);
        if (ret != 0) {
            napi_create_int32(env, ret, &result);
            break;
        }
        if (size != size2) {
            napi_create_int32(env, FAIL, &result);
            break;
        } else {
            napi_create_int32(env, NATIVE_ERROR_OK, &result);
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    x = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    x = 1;
    metaData[0] = static_cast<uint8_t>(0);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_3002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_3003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_60;
    uint8_t metaData[NUMBER_60];
    for (int i = 0; i < x; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_4003, &result);
        return result;
    }
    x = NUMBER_2999;
    uint8_t metaData2[x];
    for (int i = 0; i < x; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData2);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_5003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_3000;
    uint8_t metaData[NUMBER_60];
    uint8_t metaData3[x];
    for (int i = 0; i < x; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData3);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6002, &result);
        return result;
    }
    if (bufferSize != x) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    x = NUMBER_3001;
    uint8_t metaData4[x];
    for (int i = 0; i < x; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData4);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7002, &result);
        return result;
    }
    x = NUMBER_10000;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, x, metaData);
    if (flag == 0) {
        napi_create_int32(env, NUMBER_8001, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_20, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    result = OHNativeBufferSetStaticMetadataValue1(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetStaticMetadataValue2(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetStaticMetadataValue3(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }

    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    // 2. x=0 set调用失败 get调用失败
    x = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != NATIVE_ERROR_UNKNOWN && flag != NATIVE_ERROR_UNSUPPORTED) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    // 3. x=1 set调用成功 get调用成功 两者一致
    x = 1;
    metaData[0] = static_cast<uint8_t>(x);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_3002, &result);
        return result;
    }
    if (bufferSize != NUMBER_4) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_4;
    uint8_t metaData[NUMBER_60];
    // 4. x=60 set调用成功 get调用成功 两者一致
    for (int i = 0; i < x; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4002, &result);
        return result;
    }
    if (bufferSize != NUMBER_4) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    x = NUMBER_2999;
    uint8_t metaData2[x];
    for (int i = 0; i < x; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData2);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5002, &result);
        return result;
    }
    if (bufferSize != NUMBER_4) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t x = NUMBER_3000;
    uint8_t metaData3[x];
    for (int i = 0; i < x; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData3);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6002, &result);
        return result;
    }
    if (bufferSize != NUMBER_4) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    
    x = NUMBER_3001;
    uint8_t metaData4[x];
    for (int i = 0; i < x; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData4);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7002, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue4(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[NUMBER_60];
    int32_t x = NUMBER_100000000;
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, x, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_8001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_8002, &result);
        return result;
    }
    if (bufferSize != NUMBER_4) {
        napi_create_int32(env, NUMBER_8003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_20, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    
    result = OHNativeBufferSetMetadataValue1(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetMetadataValue2(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetMetadataValue3(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }
    result = OHNativeBufferSetMetadataValue4(env, nativeBuffer);
    if (result != NULL) {
        return result;
    }

    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetNullMetadataValue(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = (OH_NativeBuffer_MetadataKey)(NUMBER_MINUS_1);
    int32_t size = NUMBER_60;
    uint8_t metadata = NUMBER_2;
    int32_t ret = OH_NativeBuffer_SetMetadataValue(nativeBuffer, metadataKey, size, &metadata);
    napi_create_int32(env, ret, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferSetMetadataValueNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_create_array_with_length(env, NUMBER_2, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = OH_NativeBuffer_MetadataKey::OH_HDR_METADATA_TYPE;
    int32_t size = NUMBER_60;
    uint8_t metadata = NUMBER_2;
    int32_t ret = OH_NativeBuffer_SetMetadataValue(nullptr, metadataKey, size, &metadata);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);
    ret = OH_NativeBuffer_SetMetadataValue(nativeBuffer, metadataKey, size, nullptr);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_1, result1);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetMetadataValueAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_create_array_with_length(env, NUMBER_2, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    OH_NativeBuffer_MetadataKey metadataKey = OH_NativeBuffer_MetadataKey::OH_HDR_METADATA_TYPE;
    int32_t size = NUMBER_60;
    uint8_t *metadata = nullptr;
    int32_t ret = OH_NativeBuffer_GetMetadataValue(nullptr, metadataKey, &size, &metadata);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_0, result1);
    ret = OH_NativeBuffer_GetMetadataValue(nativeBuffer, metadataKey, &size, nullptr);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_1, result1);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferGetMetadataValueNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, NUMBER_6, &result);
    OH_NativeBuffer_Config nativeBufferConfig = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&nativeBufferConfig);
    int32_t flag;
    uint8_t *buffer = new uint8_t[NUMBER_60];
    int32_t ret1;
    uint8_t *ret2;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, NUMBER_60, buffer);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, &ret1, &ret2);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_2, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, nullptr, &ret2);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_3, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &ret1, nullptr);
    if (flag != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, NUMBER_4, &result);
        return result;
    }
    delete[] buffer;
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferY8Y16USAGEandAlloc(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_Config Config = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_Y8,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA
                 | NATIVEBUFFER_USAGE_MEM_MMZ_CACHE,
    };
    OH_NativeBuffer_Config Config1 = {
        .width = 0x100,
        .height = 0x100,
        .format = NATIVEBUFFER_PIXEL_FMT_Y16,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA
                 | NATIVEBUFFER_USAGE_MEM_MMZ_CACHE,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&Config);
    OH_NativeBuffer *nativeBuffer1 = OH_NativeBuffer_Alloc(&Config1);
    OH_NativeBuffer_Config Config2;
    OH_NativeBuffer_Config Config3;
    OH_NativeBuffer_GetConfig(nativeBuffer, &Config2);
    OH_NativeBuffer_GetConfig(nativeBuffer1, &Config3);
    if (Config.format == Config2.format && Config1.format == Config3.format && Config.usage == Config2.usage &&
        Config1.usage == Config3.usage) {
        napi_create_int32(env, NATIVE_ERROR_OK, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferMapWaitFence0ms(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = pipefds[0];
    if (fenceFd < 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipeWriteFd = pipefds[1];
    std::thread signalThread([pipeWriteFd]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(0));
        char signal = '1';
        write(pipeWriteFd, &signal, 1);
        close(pipeWriteFd);
    });
    void *virAddr = nullptr;
    auto start = std::chrono::steady_clock::now();
    int32_t errorCode = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, &virAddr);
    auto end = std::chrono::steady_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    if (virAddr == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (errorCode != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    signalThread.join();
    close(fenceFd);
    OH_NativeBuffer_Unmap(nativeBuffer);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapWaitFence100ms(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = pipefds[0];
    if (fenceFd < 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipeWriteFd = pipefds[1];
    std::thread signalThread([pipeWriteFd]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(NUMBER_100));
        char signal = '1';
        write(pipeWriteFd, &signal, 1);
        close(pipeWriteFd);
    });
    void *virAddr = nullptr;
    auto start = std::chrono::steady_clock::now();
    int32_t errorCode = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, &virAddr);
    auto end = std::chrono::steady_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    if (virAddr == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (errorCode != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (duration < NUMBER_100 || duration > NUMBER_200) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    signalThread.join();
    close(fenceFd);
    OH_NativeBuffer_Unmap(nativeBuffer);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapWaitFence5000ms(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = pipefds[0];
    if (fenceFd < 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipeWriteFd = pipefds[1];
    std::thread signalThread([pipeWriteFd]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(NUMBER_5000));
        char signal = '1';
        write(pipeWriteFd, &signal, 1);
        close(pipeWriteFd);
    });
    void *virAddr = nullptr;
    auto start = std::chrono::steady_clock::now();
    int32_t errorCode = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, &virAddr);
    auto end = std::chrono::steady_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    if (virAddr == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    if (errorCode != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    signalThread.join();
    close(fenceFd);
    OH_NativeBuffer_Unmap(nativeBuffer);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapWaitFenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = pipefds[0];
    if (fenceFd < 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipeWriteFd = pipefds[1];
    std::thread signalThread([pipeWriteFd]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(NUMBER_100));
        char signal = '1';
        write(pipeWriteFd, &signal, 1);
        close(pipeWriteFd);
    });
    void *virAddr = nullptr;
    int32_t errorCode1 = OH_NativeBuffer_MapWaitFence(nullptr, fenceFd, &virAddr);
    if (errorCode1 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t errorCode2 = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, nullptr);
    if (errorCode2 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    signalThread.join();
    close(fenceFd);
    OH_NativeBuffer_Unmap(nativeBuffer);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferMapWaitFenceAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipefds[2];
    if (pipe(pipefds) == -1) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = pipefds[0];
    if (fenceFd < 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int pipeWriteFd = pipefds[1];
    std::thread signalThread([pipeWriteFd]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(NUMBER_100));
        char signal = '1';
        write(pipeWriteFd, &signal, 1);
        close(pipeWriteFd);
    });
    void *virAddr = nullptr;
    int32_t errorCode1 = OH_NativeBuffer_MapWaitFence(nativeBuffer, -1, &virAddr);
    if (errorCode1 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t errorCode2 = OH_NativeBuffer_MapWaitFence(nativeBuffer, 0xFFFFFFFF+1, nullptr);
    if (errorCode2 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    signalThread.join();
    close(fenceFd);
    OH_NativeBuffer_Unmap(nativeBuffer);
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValueEnumTraversal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_MetadataType hdr_type[] = {
        OH_VIDEO_HDR_HLG,
        OH_VIDEO_HDR_HDR10,
        OH_VIDEO_HDR_VIVID,
        OH_IMAGE_HDR_VIVID_DUAL,
        OH_IMAGE_HDR_VIVID_SINGLE,
        OH_IMAGE_HDR_ISO_DUAL,
        OH_IMAGE_HDR_ISO_SINGLE
    };
    for (int i = 0; i <= sizeof(hdr_type) / sizeof(hdr_type[0]) - 1; i++) {
        int32_t bufferSize;
        uint8_t *metadata;
        uint8_t type = hdr_type[i];
        int32_t errorCode = OH_NativeBuffer_SetMetadataValue(
            nativeBuffer, OH_HDR_METADATA_TYPE, sizeof(OH_NativeBuffer_MetadataType), &type);
        if (errorCode != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &metadata);
        if (*metadata != type) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    uint8_t type = OH_NativeBuffer_MetadataType::OH_VIDEO_NONE;
    int32_t errorCode = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, sizeof(uint8_t), &type);
    if (errorCode != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValueREGION(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *nativeBuffer = getBuffer();
    if (nativeBuffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t len = NUMBER_60;
    uint8_t metaData[len];
    for (int i = 0; i < len; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    int32_t flag = OH_NativeBuffer_SetMetadataValue(
        nativeBuffer, OH_REGION_OF_INTEREST_METADATA, len, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OHNativeErrorCodeCover(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_ASSERT(env, NATIVE_ERROR_OK == ERRORCODE_0, "");
    NAPI_ASSERT(env, NATIVE_ERROR_MEM_OPERATION_ERROR == ERRORCODE_30001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_INVALID_ARGUMENTS == ERRORCODE_40001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_PERMISSION == ERRORCODE_40301000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_BUFFER == ERRORCODE_40601000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_CONSUMER == ERRORCODE_41202000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NOT_INIT == ERRORCODE_41203000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_CONNECTED == ERRORCODE_41206000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_STATE_INVALID == ERRORCODE_41207000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_IN_CACHE == ERRORCODE_41208000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_QUEUE_FULL == ERRORCODE_41209000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_NOT_IN_CACHE == ERRORCODE_41210000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_DISCONNECTED == ERRORCODE_41211000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_NO_LISTENER_REGISTERED == ERRORCODE_41212000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_UNSUPPORTED == ERRORCODE_50102000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_UNKNOWN == ERRORCODE_50002000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_HDI_ERROR == ERRORCODE_50007000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BINDER_ERROR == ERRORCODE_50401000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_EGL_STATE_UNKNOWN == ERRORCODE_60001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_EGL_API_FAILED == ERRORCODE_60002000, "");
    napi_create_int32(env, NATIVE_ERROR_OK, &result);
    return result;
}