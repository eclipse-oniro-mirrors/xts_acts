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
#include <GLES2/gl2.h>
#include <bits/alltypes.h>
#include <cstddef>
#include <native_buffer/buffer_common.h>
#include <native_buffer/native_buffer.h>
#include <climits>
#include <native_image/native_image.h>
#include <sys/types.h>
#include <vector>
#include <hilog/log.h>
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

#define SUCCESS 0
#define FAIL (-1)
#define NUMBER_MINUS_1 (-1)
#define NUMBER_0 0
#define NUMBER_1 1
#define NUMBER_2 2
#define NUMBER_3 3
#define NUMBER_4 4
#define NUMBER_5 5
#define NUMBER_6 6
#define NUMBER_7 7
#define NUMBER_8 8
#define NUMBER_9 9
#define NUMBER_10 10
#define NUMBER_11 11
#define NUMBER_12 12
#define NUMBER_13 13
#define NUMBER_14 14
#define NUMBER_15 15
#define NUMBER_16 16
#define NUMBER_17 17
#define NUMBER_18 18
#define NUMBER_19 19
#define NUMBER_20 20
#define NUMBER_32 32
#define NUMBER_50 50
#define NUMBER_60 60
#define NUMBER_500 500
#define NUMBER_1000 1000
#define NUMBER_1001 1001
#define NUMBER_1002 1002
#define NUMBER_2001 2001
#define NUMBER_2002 2002
#define NUMBER_2999 2999
#define NUMBER_3000 3000
#define NUMBER_3001 3001
#define NUMBER_3002 3002
#define NUMBER_3003 3003
#define NUMBER_4001 4001
#define NUMBER_4002 4002
#define NUMBER_4003 4003
#define NUMBER_5001 5001
#define NUMBER_5002 5002
#define NUMBER_5003 5003
#define NUMBER_6001 6001
#define NUMBER_6002 6002
#define NUMBER_6003 6003
#define NUMBER_7001 7001
#define NUMBER_7002 7002
#define NUMBER_8001 8001
#define NUMBER_8002 8002
#define NUMBER_8003 8003
#define NUMBER_10000 10000
#define NUMBER_100000000 100000000
#define NUMBER_40001000 40001000
#define NUMBER_50002000 50002000
#define NUMBER_50007000 50007000
#define NUMBER_50102000 50102000
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
static napi_value OHNativeBufferAlloc(napi_env env, napi_callback_info info)
{

    napi_value result = nullptr;
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();
    if (buffer != nullptr) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}
static napi_value OHNativeBufferAllocAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = OH_NativeBuffer_Alloc(nullptr);

    if (buffer != nullptr) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}
static napi_value OHNativeBufferReference(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferReferenceAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    int32_t ret = OH_NativeBuffer_Reference(nullptr);
    if (ret == 0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value OHNativeBufferUnreference(napi_env env, napi_callback_info info)
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

static napi_value OHNativeBufferUnreferenceAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;

    int32_t ret = OH_NativeBuffer_Unreference(nullptr);
    if (ret == 0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeBufferGetConfig(napi_env env, napi_callback_info info)
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
            backInfo = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}

static napi_value OHNativeBufferMap(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferMapAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    void *virAddr = nullptr;
    int32_t ret = OH_NativeBuffer_Map(nullptr, &virAddr);
    if (ret == 0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value OHNativeBufferUnmap(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferUnmapAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    int32_t ret = OH_NativeBuffer_Unmap(nullptr);
    if (ret == 0) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}
static napi_value OHNativeBufferGetSeqNum(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    OH_NativeBuffer *buffer = getBuffer();

    if (buffer != nullptr) {
        uint32_t id = OH_NativeBuffer_GetSeqNum(buffer);
        if (id > 0) {
            backInfo = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    OH_NativeBuffer_Unreference(buffer);
    return result;
}
static napi_value OHNativeBufferGetSeqNumAbnormal(napi_env env, napi_callback_info info)
{
    int backInfo = FAIL;
    uint32_t id = OH_NativeBuffer_GetSeqNum(nullptr);
    if (id > 0 && id != UINT_MAX) {
        backInfo = SUCCESS;
    }
    napi_value result = nullptr;
    napi_create_int32(env, backInfo, &result);
    return result;
}

static napi_value OHNativeBufferAllocNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer *ptr = OH_NativeBuffer_Alloc(nullptr);
    if (ptr == nullptr) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
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
            napi_create_int32(env, SUCCESS, &result);
        }
        napi_set_element(env, result, index, resultIndex);
    }
}
static napi_value OHNativeBufferAllocNormal(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferAllocAbormal(napi_env env, napi_callback_info info)
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
            napi_create_int32(env, SUCCESS, &result);
        }
        napi_set_element(env, result, index, resultIndex);
    }
    return result;
}

static napi_value OHNativeBufferAllocMuch(napi_env env, napi_callback_info info)
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
            napi_create_int32(env, SUCCESS, &result);
        }
    }
    for (uint32_t index = 0; index < NUMBER_500; index++) {
        OH_NativeBuffer_Unreference(bufferArr[index]);
    }
    return result;
}

static napi_value OHNativeBufferFromNativeWindowBufferNullptr(napi_env env, napi_callback_info info)
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
    int32_t width_ = 0x100;
    int32_t height_ = 0x100;
    ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width_, height_);
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
static napi_value OHNativeBufferFromNativeWindowBufferNormal(napi_env env, napi_callback_info info)
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
    int32_t width_ = 0x100;
    int32_t height_ = 0x100;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width_, height_);
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
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, NUMBER_1, result1);

    ret = OH_NativeBuffer_FromNativeWindowBuffer(nativeWindowBuffer, &buffer);
    napi_create_int32(env, ret, &result1);
    napi_set_element(env, result, NUMBER_2, result1);
    OH_NativeBuffer_Unreference(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&_image);
    return result;
}

static napi_value OHNativeBufferGetConfigNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_NativeBuffer_Config *nativeBufferConfig = nullptr;
    OH_NativeBuffer_GetConfig(nullptr, nativeBufferConfig);
    // 怎么做判断？
    if (nativeBufferConfig != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }

    return result;
}

static napi_value OHNativeBufferGetConfigNormal(napi_env env, napi_callback_info info)
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
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

static napi_value OHNativeBufferGetSeqNumNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t ret = OH_NativeBuffer_GetSeqNum(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value OHNativeBufferGetSeqNumNormal(napi_env env, napi_callback_info info)
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
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}
static napi_value OHNativeBuffeMapNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t ret = OH_NativeBuffer_Map(nullptr, nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNativeBufferMapNormal(napi_env env, napi_callback_info info)
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
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}
static napi_value OHNativeBuffeMapPlanesNullptr(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferMapPlanesAbNormal(napi_env env, napi_callback_info info)
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
    if (ret != NUMBER_50007000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    } else {
        napi_create_int32(env, ret, &result);
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

static napi_value OHNativeBufferMapPlanesNormal(napi_env env, napi_callback_info info)
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
        if (ret != SUCCESS) {
            napi_create_int32(env, NUMBER_1000 * (i + 1) + NUMBER_1, &result);
            return result;
        } else {
            napi_create_int32(env, SUCCESS, &result);
        }
        OH_NativeBuffer_Unreference(nativeBuffer);
    }
    return result;
}
static napi_value OHNativeBuffeReferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Reference(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNativeBuffeUnreferenceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Unreference(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNativeBufferReferenceNormal(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferReferenceMax(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferUnreferenceNormal(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, ret, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}
static napi_value OHNativeBuffeUnmapNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeBuffer_Unmap(nullptr);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNativeBufferUnmapNormal(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferGetColorSpaceFirst(napi_env env, napi_callback_info info)
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
    if (ret != NUMBER_50002000 && ret != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static napi_value OHNativeBufferSetColorSpaceNormal(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value OHNativeBufferSetColorSpaceNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_ColorSpace colorSpace = OH_NativeBuffer_ColorSpace::OH_COLORSPACE_ADOBERGB_LIMIT;
    int32_t ret = OH_NativeBuffer_SetColorSpace(nullptr, colorSpace);
    napi_create_int32(env, ret, &result);
    return result;
}
static napi_value OHNativeBufferSetColorSpaceAbnormal(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferGetColorSpaceNullptr(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferGetMetadataValueFirst(napi_env env, napi_callback_info info)
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
    if (ret != NUMBER_50002000 && ret != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeBuffer_Unreference(nativeBuffer);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    X = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    X = 1;
    metaData[0] = static_cast<uint8_t>(0);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_3002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_3003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_60;
    uint8_t metaData[NUMBER_60];
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_4003, &result);
        return result;
    }
    X = NUMBER_2999;
    uint8_t metaData2[X];
    for (int i = 0; i < X; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData2);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_5003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetDynamicMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_3000;
    uint8_t metaData[NUMBER_60];
    uint8_t metaData3[X];
    for (int i = 0; i < X; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData3);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    X = NUMBER_3001;
    uint8_t metaData4[X];
    for (int i = 0; i < X; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData4);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7002, &result);
        return result;
    }
    X = NUMBER_10000;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, X, metaData);
    if (flag == 0) {
        napi_create_int32(env, NUMBER_8001, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value OHNativeBufferSetDynamicMetadataValue(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static napi_value OHNativeBufferSetMetadataValueTimes(napi_env env, napi_callback_info info)
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
            napi_create_int32(env, SUCCESS, &result);
        }
    }
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    X = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    X = 1;
    metaData[0] = static_cast<uint8_t>(0);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_3002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_3003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_60;
    uint8_t metaData[NUMBER_60];
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_4002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_4003, &result);
        return result;
    }
    X = NUMBER_2999;
    uint8_t metaData2[X];
    for (int i = 0; i < X; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData2);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_5002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_5003, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetStaticMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_3000;
    uint8_t metaData[NUMBER_60];
    uint8_t metaData3[X];
    for (int i = 0; i < X; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData3);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_6002, &result);
        return result;
    }
    if (bufferSize != X) {
        napi_create_int32(env, NUMBER_6003, &result);
        return result;
    }
    X = NUMBER_3001;
    uint8_t metaData4[X];
    for (int i = 0; i < X; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData4);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, &bufferSize, &buffer);
    if (flag != 0) {
        napi_create_int32(env, NUMBER_7002, &result);
        return result;
    }
    X = NUMBER_10000;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_STATIC_METADATA, X, metaData);
    if (flag == 0) {
        napi_create_int32(env, NUMBER_8001, &result);
        return result;
    }
    delete[] buffer;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value OHNativeBufferSetStaticMetadataValue(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue1(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_MINUS_1;
    uint8_t metaData[NUMBER_60];
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_1001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_1002, &result);
        return result;
    }
    // 2. X=0 set调用失败 get调用失败
    X = 0;
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_2001, &result);
        return result;
    }
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, &bufferSize, &buffer);
    if (flag != NUMBER_50002000 && flag != NUMBER_50102000) {
        napi_create_int32(env, NUMBER_2002, &result);
        return result;
    }
    // 3. X=1 set调用成功 get调用成功 两者一致
    X = 1;
    metaData[0] = static_cast<uint8_t>(X);
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData);
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue2(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_4;
    uint8_t metaData[NUMBER_60];
    // 4. X=60 set调用成功 get调用成功 两者一致
    for (int i = 0; i < X; ++i) {
        metaData[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData);
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
    X = NUMBER_2999;
    uint8_t metaData2[X];
    for (int i = 0; i < X; ++i) {
        metaData2[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData2);
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue3(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    int32_t X = NUMBER_3000;
    uint8_t metaData3[X];
    for (int i = 0; i < X; ++i) {
        metaData3[i] = static_cast<uint8_t>(i);
    }
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData3);
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
    
    X = NUMBER_3001;
    uint8_t metaData4[X];
    for (int i = 0; i < X; ++i) {
        metaData4[i] = static_cast<uint8_t>(i);
    }
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData4);
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeBufferSetMetadataValue4(napi_env env, OH_NativeBuffer *nativeBuffer)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    uint8_t metaData[NUMBER_60];
    int32_t X = NUMBER_100000000;
    auto flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_METADATA_TYPE, X, metaData);
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value OHNativeBufferSetMetadataValue(napi_env env, napi_callback_info info)
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
static napi_value OHNativeBufferSetNullMetadataValue(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferSetMetadataValueNullptr(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferGetMetadataValueAbnormal(napi_env env, napi_callback_info info)
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
static napi_value OHNativeBufferGetMetadataValueNullptr(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
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
    // 1.
    flag = OH_NativeBuffer_SetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, NUMBER_60, buffer);
    if (flag != 0) {
        napi_create_int32(env, flag, &result);
        return result;
    }
    // 2.
    flag = OH_NativeBuffer_GetMetadataValue(nullptr, OH_HDR_DYNAMIC_METADATA, &ret1, &ret2);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_2, &result);
        return result;
    }
    // 3.
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, nullptr, &ret2);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_3, &result);
        return result;
    }
    // 4.
    flag = OH_NativeBuffer_GetMetadataValue(nativeBuffer, OH_HDR_DYNAMIC_METADATA, &ret1, nullptr);
    if (flag != NUMBER_40001000) {
        napi_create_int32(env, NUMBER_4, &result);
        return result;
    }
    delete[] buffer;
    OH_NativeBuffer_Unreference(nativeBuffer);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value NativeBufferInit(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHNativeBufferAlloc", nullptr, OHNativeBufferAlloc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferReference", nullptr, OHNativeBufferReference, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferUnreference", nullptr, OHNativeBufferUnreference, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferGetConfig", nullptr, OHNativeBufferGetConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferMap", nullptr, OHNativeBufferMap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferUnmap", nullptr, OHNativeBufferUnmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferGetSeqNum", nullptr, OHNativeBufferGetSeqNum, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferAllocAbnormal", nullptr, OHNativeBufferAllocAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferReferenceAbnormal", nullptr, OHNativeBufferReferenceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferUnreferenceAbnormal", nullptr, OHNativeBufferUnreferenceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferMapAbnormal", nullptr, OHNativeBufferMapAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferUnmapAbnormal", nullptr, OHNativeBufferUnmapAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferGetSeqNumAbnormal", nullptr, OHNativeBufferGetSeqNumAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferAllocNullptr", nullptr, OHNativeBufferAllocNullptr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferAllocNormal", nullptr, OHNativeBufferAllocNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(napi_property_descriptor), desc);
    return exports;
}

napi_value NativeBufferInit2(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"oHNativeBufferAllocAbormal", nullptr, OHNativeBufferAllocAbormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferAllocMuch", nullptr, OHNativeBufferAllocMuch, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferFromNativeWindowBufferNullptr", nullptr, OHNativeBufferFromNativeWindowBufferNullptr, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferFromNativeWindowBufferNormal", nullptr, OHNativeBufferFromNativeWindowBufferNormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferGetConfigNullptr", nullptr, OHNativeBufferGetConfigNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferGetConfigNormal", nullptr, OHNativeBufferGetConfigNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferGetSeqNumNullptr", nullptr, OHNativeBufferGetSeqNumNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferGetSeqNumNormal", nullptr, OHNativeBufferGetSeqNumNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBuffeMapNullptr", nullptr, OHNativeBuffeMapNullptr, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBufferMapNormal", nullptr, OHNativeBufferMapNormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHNativeBuffeMapPlanesNullptr", nullptr, OHNativeBuffeMapPlanesNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferMapPlanesAbNormal", nullptr, OHNativeBufferMapPlanesAbNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferMapPlanesNormal", nullptr, OHNativeBufferMapPlanesNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBuffeReferenceNullptr", nullptr, OHNativeBuffeReferenceNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBuffeUnreferenceNullptr", nullptr, OHNativeBuffeUnreferenceNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferReferenceNormal", nullptr, OHNativeBufferReferenceNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferReferenceMax", nullptr, OHNativeBufferReferenceMax, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferUnreferenceNormal", nullptr, OHNativeBufferUnreferenceNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(napi_property_descriptor), desc);
    return exports;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    NativeBufferInit(env, exports);
    NativeBufferInit2(env, exports);
    napi_property_descriptor desc[] = {
        {"oHNativeBuffeUnmapNullptr", nullptr, OHNativeBuffeUnmapNullptr, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferUnmapNormal", nullptr, OHNativeBufferUnmapNormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"oHNativeBufferGetColorSpaceFirst", nullptr, OHNativeBufferGetColorSpaceFirst, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetColorSpaceNormal", nullptr, OHNativeBufferSetColorSpaceNormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetColorSpaceNullptr", nullptr, OHNativeBufferSetColorSpaceNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetColorSpaceAbnormal", nullptr, OHNativeBufferSetColorSpaceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferGetColorSpaceNullptr", nullptr, OHNativeBufferGetColorSpaceNullptr, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferGetMetadataValueFirst", nullptr, OHNativeBufferGetMetadataValueFirst, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetDynamicMetadataValue", nullptr, OHNativeBufferSetDynamicMetadataValue, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferSetMetadataValueTimes", nullptr, OHNativeBufferSetMetadataValueTimes, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetStaticMetadataValue", nullptr, OHNativeBufferSetStaticMetadataValue, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferSetMetadataValue", nullptr, OHNativeBufferSetMetadataValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetNullMetadataValue", nullptr, OHNativeBufferSetNullMetadataValue, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHNativeBufferSetMetadataValueNullptr", nullptr, OHNativeBufferSetMetadataValueNullptr, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferGetMetadataValueAbnormal", nullptr, OHNativeBufferGetMetadataValueAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"oHNativeBufferGetMetadataValueNullptr", nullptr, OHNativeBufferGetMetadataValueNullptr, nullptr, nullptr,
         nullptr, napi_default, nullptr},
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
    .nm_modname = "nativebuffer",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); };
