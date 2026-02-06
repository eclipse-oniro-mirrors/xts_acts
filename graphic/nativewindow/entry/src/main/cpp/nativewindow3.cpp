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

#include "nativewindow.h"
#include "napi/native_api.h"
#include <map>
#include <cstdint>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>
#include "ace/xcomponent/native_interface_xcomponent.h"
#include "common/log_common.h"

#define SUCCESS 0
#define FAIL (-1)

#define CONSTANT_2147483647 2147483647
#define CONSTANT_2147483648 2147483648
#define CONSTANT_NEG_2147483647 (-2147483647)
#define CONSTANT_NEG_2147483648 (-2147483648)
#define CONSTANT_NEG_9223372036854775807 (9223372036854775807)
#define CONSTANT_NEG_9223372036854775808 (-9223372036854775808)


#define CONSTANT_0 0
#define CONSTANT_1 1
#define CONSTANT_2 2
#define CONSTANT_3 3
#define CONSTANT_4 4
#define CONSTANT_5 5
#define CONSTANT_6 6
#define CONSTANT_7 7
#define CONSTANT_8 8
#define CONSTANT_60 60
#define CONSTANT_2999 2999
#define CONSTANT_3000 3000
#define CONSTANT_3001 3001
#define CONSTANT_998899 998899
#define CONSTANT_100 100
#define CONSTANT_1000 1000
#define CONSTANT_10000 10000
#define CONSTANT_100000 100000
#define CONSTANT_1000000 1000000
#define CONSTANT_10000000 10000000
#define CONSTANT_100000000 100000000
#define CONSTANT_1000000000 1000000000
#define CONSTANT_1999999 1999999
#define CONSTANT_99999999 99999999
#define CONSTANT_99999999999999999 99999999999999999
#define CONSTANT_999999999999999999 999999999999999999
#define CONSTANT_41201000 41201000
#define CONSTANT_500 500


napi_value testNativeWindowCreateNativeWindow(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = OH_NativeWindow_CreateNativeWindow(nullptr);
    if (nativeWindow == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    }
    napi_create_int32(env, FAIL, &result);
    return result;
}

napi_value testNativeWindowNativeWindowSetSetScalingMode(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    uint32_t sequence = 1000;
    int32_t flag1 = OH_NativeWindow_NativeWindowSetScalingMode(nullptr, sequence, OH_SCALING_MODE_FREEZE);
    int32_t flag2 =
        OH_NativeWindow_NativeWindowSetScalingMode(nativeWindow, sequence, static_cast<OHScalingMode>(CONSTANT_100));
    int32_t flag3 = OH_NativeWindow_NativeWindowSetScalingMode(nativeWindow, 0, OH_SCALING_MODE_FREEZE);
    if (flag1 != NATIVE_ERROR_INVALID_ARGUMENTS && flag2 != NATIVE_ERROR_INVALID_ARGUMENTS &&
        flag3 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowSetMetaData(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    uint32_t sequence = 1000;
    int32_t size = 0;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_RED_PRIMARY_X, 0}};
    int32_t flag1 = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    int32_t flag2 = OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, sequence, sizeof(metaData), nullptr);
    int32_t flag3 = OH_NativeWindow_NativeWindowSetMetaData(nativeWindow, 0, sizeof(metaData), metaData);
    if (flag1 != NATIVE_ERROR_INVALID_ARGUMENTS && flag2 != NATIVE_ERROR_INVALID_ARGUMENTS &&
        flag3 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowNativeWindowSetMetaDataSet(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    uint32_t sequence = 1000;
    int32_t size = 0;
    OHHDRMetadataKey key = OHHDRMetadataKey::OH_METAKEY_HDR10_PLUS;
    const uint8_t metaData[] = {0};
    int32_t flag1 = OH_NativeWindow_NativeWindowSetMetaDataSet(nullptr, sequence, key, sizeof(metaData), metaData);
    int32_t flag2 = OH_NativeWindow_NativeWindowSetMetaDataSet(nativeWindow, sequence, key, sizeof(metaData), nullptr);
    int32_t flag3 = OH_NativeWindow_NativeWindowSetMetaDataSet(
        nativeWindow, sequence, static_cast<OHHDRMetadataKey>(CONSTANT_100), sizeof(metaData), metaData);
    if (flag1 != NATIVE_ERROR_INVALID_ARGUMENTS && flag2 != NATIVE_ERROR_INVALID_ARGUMENTS &&
        flag3 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_1000, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static OHExtDataHandle *AllocOHExtDataHandle(uint32_t reserveInts)
{
    size_t handleSize = sizeof(OHExtDataHandle) + (sizeof(int32_t) * reserveInts);
    OHExtDataHandle *handle = static_cast<OHExtDataHandle *>(malloc(handleSize));
    if (handle == nullptr) {
        return nullptr;
    }
    handle->fd = -1;
    handle->reserveInts = reserveInts;
    for (uint32_t i = 0; i < reserveInts; i++) {
        handle->reserve[i] = -1;
    }
    return handle;
}

napi_value testNativeWindowNativeWindowSetTunnelHandle(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    uint32_t reserveInts = 1;
    OHExtDataHandle *handle = AllocOHExtDataHandle(reserveInts);
    int32_t flag1 = OH_NativeWindow_NativeWindowSetTunnelHandle(nullptr, handle);
    int32_t flag2 = OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, nullptr);
    if (flag1 != NATIVE_ERROR_INVALID_ARGUMENTS && flag2 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_1000, &result);
        return result;
    }
    int32_t flag3 = OH_NativeWindow_NativeWindowSetTunnelHandle(nativeWindow, handle);
    if (flag3 != SUCCESS) {
        napi_create_int32(env, CONSTANT_10000, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheBeforeBufferRequested(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1. create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    // 2. cleancache 2 times
    int32_t flag0 = OH_NativeWindow_CleanCache(nullptr);
    if (flag0 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    napi_create_int32(env, flag, &result);
    if (flag != NATIVE_ERROR_CONSUMER_DISCONNECTED) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheWhenBufferRequested(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1. create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    // 2.  invoke OH_NativeWindow_NativeWindowRequestBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 3. invoke 2 times cleancache
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    if (flag != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 4.  invoke OH_NativeWindow_NativeWindowFlushBuffer
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, ret, &result);
        return result;
    }
 
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheWhenBufferFlushed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1.  create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    // 2.  invoke OH_NativeWindow_NativeWindowRequestBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }

    // 3.  invoke OH_NativeWindow_NativeWindowFlushBuffer
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 4. invoke 2 times cleancache
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    if (flag != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 5.  invoke OH_NativeImage_AcquireNativeWindowBuffer
    OH_NativeImage* nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    ret = OH_NativeImage_AcquireNativeWindowBuffer(nativeImage, &nativeWindowBuffer, &fenceFd);
    if (ret != NATIVE_ERROR_NO_BUFFER) {
        napi_create_int32(env, ret, &result);
        return result;
    }
  
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheWhenBufferAcquired(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1.  create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    OH_NativeImage* nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    RoundWindowBuffer* windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    
    int32_t ret = windowBuffer->ProduceBuffer();
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // AcquireBuffer
    ret = windowBuffer->AcquireBuffer();
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 5. invoke 2 times cleancache
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    if (flag != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 6. release buffer
    ret = windowBuffer->ReleaseBuffer();
    if (ret != NATIVE_ERROR_BUFFER_NOT_IN_CACHE) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    delete windowBuffer;
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheWhenBufferReleased(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1.  create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    OH_NativeImage* nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    RoundWindowBuffer* windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    
    int32_t ret = windowBuffer->ProduceBuffer();
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    ret = windowBuffer->ConsumerBuffer();
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // invoke 2 times cleancache
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    if (flag != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    delete windowBuffer;
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheLoopWhenBufferRequested(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1.  create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    // 2. RequestBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    int32_t flag = 0;
    for (int i = 0; i < CONSTANT_10000; i++) {
        flag = OH_NativeWindow_CleanCache(nativeWindow);
        if (flag != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanCacheLoopWhenBufferFlushed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1.  create native window
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    
    // 2. RequestBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 3. FlushBuffer
    Region::Rect rect{
        .x = 0x50,
        .y = 0x50,
        .w = 0x50,
        .h = 0x50,
    };
    Region region{.rects = &rect};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    int32_t flag = 0;
    for (int i = 0; i < CONSTANT_10000; i++) {
        flag = OH_NativeWindow_CleanCache(nativeWindow);
        if (flag != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferAbNormalPra(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // 1.  create native window
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }

    // 2.PreAllocBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int32_t ret1 = OH_NativeWindow_PreAllocBuffers(nullptr, 3);
    NAPI_ASSERT(env, ret1 != NATIVE_ERROR_OK, "ret1 == NATIVE_ERROR_OK");
    int32_t ret2 = OH_NativeWindow_PreAllocBuffers(nativeWindow, NULL);
    if (ret1 != NATIVE_ERROR_INVALID_ARGUMENTS || ret2 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_2, &result);
        return result;
    }

    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferAbNormalPra2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    std::map<int32_t, std::int32_t> myMap;
    myMap[0] = 0;
    myMap[0] = CONSTANT_100;
    myMap[CONSTANT_100] = 0;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    for (const auto &pair : myMap) {
//        std::cout << pair.first << ": " << pair.second << std::endl;
        OH_NativeImage *image = OH_ConsumerSurface_Create();
        OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
        int32_t ret1 =
            OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, pair.first, pair.second);
        int32_t ret2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE, usage);
        if (ret1 != 0 || ret2 != 0) {
            napi_create_int32(env, CONSTANT_1, &result);
            return result;
        }
        // buffer的width或height为0
        int32_t ret3 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
        if (ret3 != NATIVE_ERROR_INVALID_ARGUMENTS) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        OH_NativeWindow_DestroyNativeWindow(nativeWindow);
        OH_NativeImage_Destroy(&image);
    }
    // 不设置buffer的width或height
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    int32_t ret = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferBufferCnt(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t bufferCnt[] = {1, 2, 3, 10, static_cast<int32_t>(4294967295)};
    int32_t errBufferCnt[] = {0, static_cast<int32_t>(4294967296)};

    // 异常bufferCnt校验
    for (int i = 0; i < sizeof(errBufferCnt) / sizeof(0); i++) {
        // 1.  create native window
        InitNativeWindow *initNative = new InitNativeWindow();
        OHNativeWindow *nativeWindow = nullptr;
        nativeWindow = initNative->returnNativeWindow();
        if (nativeWindow == nullptr) {
            napi_create_int32(env, CONSTANT_998899, &result);
            return result;
        }
        int32_t ret = OH_NativeWindow_PreAllocBuffers(nativeWindow, errBufferCnt[i]);
        if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        delete initNative;
    }
    // 正常bufferCnt校验
    for (int i = 0; i < sizeof(bufferCnt) / sizeof(0); i++) {
        // 1.  create native window
        InitNativeWindow *initNative = new InitNativeWindow();
        OHNativeWindow *nativeWindow = nullptr;
        nativeWindow = initNative->returnNativeWindow();
        if (nativeWindow == nullptr) {
            napi_create_int32(env, CONSTANT_998899, &result);
            return result;
        }
        int32_t ret = OH_NativeWindow_PreAllocBuffers(nativeWindow, bufferCnt[i]);
        if (ret != NATIVE_ERROR_OK) {
            napi_create_int32(env, CONSTANT_3, &result);
            return result;
        }
        delete initNative;
    }

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.  create native window
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeWindow == nullptr || nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    std::vector<OHNativeWindowBuffer *> WindowBufferArr;
    RoundWindowBuffer *windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    // 先调用3次requestBuffer，申请出最大数量buffer再调用PreAllocBuffer
    for (int i = 0; i < CONSTANT_3; i++) {
        OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
        int32_t ret1 = windowBuffer->RequestBuffer(&nativeWindowBuffer, CONSTANT_1);
        if (ret1 != 0) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        WindowBufferArr.push_back(nativeWindowBuffer);
    }
    int32_t ret2 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    // flushBuffer1次后PreAllocBuffer
    int32_t ret = windowBuffer->FlushBuffer(WindowBufferArr[CONSTANT_0]);
    int32_t ret3 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    // flushBuffer2次后PreAllocBuffer
    ret = windowBuffer->FlushBuffer(WindowBufferArr[CONSTANT_1]);
    ret = windowBuffer->FlushBuffer(WindowBufferArr[CONSTANT_2]);
    int32_t ret4 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    if (ret2 != NATIVE_ERROR_BUFFER_QUEUE_FULL || ret3 != NATIVE_ERROR_BUFFER_QUEUE_FULL ||
        ret4 != NATIVE_ERROR_BUFFER_QUEUE_FULL) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferDetachAttach(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.  create native window
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeWindow == nullptr || nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    std::vector<OHNativeWindowBuffer *> WindowBufferArr;
    RoundWindowBuffer *windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    // 先调用3次requestBuffer，申请出最大数量buffer再调用PreAllocBuffer
    for (int i = 0; i < CONSTANT_3; i++) {
        OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
        int32_t ret1 = windowBuffer->RequestBuffer(&nativeWindowBuffer, CONSTANT_1);
        if (ret1 != 0) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        WindowBufferArr.push_back(nativeWindowBuffer);
    }
    // Detach1个buffer后PreAlloc
    int32_t ret2 = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_0]);
    int32_t ret3 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    if (ret2 != 0 || ret3 != 0) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    // 再次 Detach2个buffer后PreAlloc
    int32_t ret4 = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_1]);
    int32_t ret5 = OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_2]);
    int32_t ret6 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    // buffer队列已满再次PreAlloc
    int32_t ret7 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_1);
    if (ret4 != NATIVE_ERROR_OK || ret5 != NATIVE_ERROR_OK || ret6 != NATIVE_ERROR_OK ||
        ret7 != NATIVE_ERROR_BUFFER_QUEUE_FULL) {
        napi_create_int32(env, CONSTANT_4, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferDetachAttach02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.  create native window
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeWindow == nullptr || nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    std::vector<OHNativeWindowBuffer *> WindowBufferArr;
    RoundWindowBuffer *windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    // 先调用3次requestBuffer，申请出最大数量buffer再调用PreAllocBuffer
    for (int i = 0; i < CONSTANT_3; i++) {
        OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
        int32_t ret1 = windowBuffer->RequestBuffer(&nativeWindowBuffer, CONSTANT_1);
        if (ret1 != 0) {
            napi_create_int32(env, CONSTANT_2, &result);
            return result;
        }
        WindowBufferArr.push_back(nativeWindowBuffer);
    }
    // Attach 3个buffer后PreAlloc
    OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_0]);
    OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_1]);
    OH_NativeWindow_NativeWindowDetachBuffer(nativeWindow, WindowBufferArr[CONSTANT_2]);
    OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, WindowBufferArr[CONSTANT_0]);
    OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, WindowBufferArr[CONSTANT_1]);
    OH_NativeWindow_NativeWindowAttachBuffer(nativeWindow, WindowBufferArr[CONSTANT_2]);
    int32_t ret8 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    if (ret8 != NATIVE_ERROR_BUFFER_QUEUE_FULL) {
        napi_create_int32(env, CONSTANT_3, &result);
        return result;
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowPreAllocBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.  create native window
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = initNative->returnNativeImage();
    if (nativeWindow == nullptr || nativeImage == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    RoundWindowBuffer *windowBuffer = new RoundWindowBuffer(nativeImage, nativeWindow);
    int32_t ret1 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_1);
    int32_t ret2 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_2);
    int32_t ret3 = OH_NativeWindow_PreAllocBuffers(nativeWindow, CONSTANT_3);
    if (ret1 != NATIVE_ERROR_OK || ret2 != NATIVE_ERROR_OK || ret3 != NATIVE_ERROR_BUFFER_QUEUE_FULL) {
        napi_create_int32(env, CONSTANT_1, &result);
        return result;
    }
    int32_t callNum = 1000;
    for (int i = 0; i < callNum; i++) {
        // 先调用PreAllocBuffer，再调用requestBuffer
        int32_t ret4 = windowBuffer->ProduceBuffer();
        int32_t ret5 = windowBuffer->ConsumerBuffer();
        if (ret4 != 0 || ret5 != 0) {
            napi_create_int32(env, CONSTANT_2 * CONSTANT_1000 + callNum, &result);
            return result;
        }
    }
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowCleanBufferUsage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    // 1.  create native window
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OH_NativeImage *image = nullptr;
    image = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    if (nativeWindow == nullptr) {
        napi_create_int32(env, CONSTANT_998899, &result);
        return result;
    }
    uint64_t usage = 0;
    int32_t ret1 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_USAGE, &usage);
    usage &= ~NATIVEBUFFER_USAGE_CPU_READ;
    int32_t ret2 = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_USAGE, &usage);
    if (ret1 != 0 && ret2 != 0) {
        napi_create_int32(env, CONSTANT_998899 - 1, &result);
        return result;
    }
    // 2.  invoke OH_NativeWindow_NativeWindowRequestBuffer
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    // 3.  invoke OH_NativeWindow_NativeWindowFlushBuffer
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    // 4.  invoke OH_NativeImage_AcquireNativeWindowBuffer
    ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&image);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowLockBufferNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnlockAndFlushBufferAbnormal01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnlockAndFlushBufferAbnormal03(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnlockAndFlushBufferAbnormal02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnlockAndFlushBufferAbnormal04(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowLockBufferNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nullptr, region, &buffer);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnLockAndFlushBufferNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    int32_t ret = OH_NativeWindow_UnlockAndFlushBuffer(nullptr);
    napi_create_int32(env, ret, &result);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value testNativeWindowLockBufferUpdateArea(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x200,
        .y = 0x200,
        .w = 0x200,
        .h = 0x200,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowLockBufferUpperLimit(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindowBuffer *buffer1 = nullptr;
    OHNativeWindowBuffer *buffer2 = nullptr;
    OHNativeWindowBuffer *buffer3 = nullptr;
    OHNativeWindowBuffer *buffer4 = nullptr;
    OH_NativeImage *nativeImage = OH_ConsumerSurface_Create();
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{.x = 0x100, .y = 0x100, .w = 0x100, .h = 0x100};
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer1);
    OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer2);
    OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer3);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer4);
    if (ret != NATIVE_ERROR_NO_BUFFER) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int fenceFd = -1;
    OH_NativeImage_AcquireNativeWindowBuffer(nativeImage, &buffer1, &fenceFd);
    OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage, buffer1, fenceFd);
    OH_NativeImage_AcquireNativeWindowBuffer(nativeImage, &buffer2, &fenceFd);
    OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage, buffer2, fenceFd);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(nativeImage, &buffer3, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage, buffer3, fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowLockBufferMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer1 = nullptr;
    OHNativeWindowBuffer *buffer2 = nullptr;
    OH_NativeImage *nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x200,
        .y = 0x200,
        .w = 0x200,
        .h = 0x200,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int32_t ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer1);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer2);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowUnLockAndFlushBufferMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    int32_t ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value testNativeWindowLockAndUnLockAndRequest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t width = 0x100;
    int32_t height = 0x100;
    OHNativeWindow *nativeWindow = nullptr;
    OHNativeWindowBuffer *buffer = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    nativeImage = OH_ConsumerSurface_Create();
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_BUFFER_GEOMETRY, width, height);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect, .rectNumber = CONSTANT_1};
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != CONSTANT_41201000) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_LockBuffer(nativeWindow, region, &buffer);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeWindow_UnlockAndFlushBuffer(nativeWindow);
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
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
    napi_create_int32(env, SUCCESS, &result);
    return result;
}