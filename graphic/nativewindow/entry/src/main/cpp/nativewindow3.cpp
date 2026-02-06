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
#include <cstdint>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_buffer/native_buffer.h>
#include "nativewindow.h"
#include "ace/xcomponent/native_interface_xcomponent.h"
#include <string>

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
#define CONSTANT_40001000 40001000
#define CONSTANT_50002000 50002000
#define CONSTANT_50102000 50102000
#define CONSTANT_41211000 41211000
#define CONSTANT_40601000 40601000
#define CONSTANT_41210000 41210000
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
    if (flag1 != CONSTANT_40001000 && flag2 != CONSTANT_40001000 && flag3 != CONSTANT_40001000) {
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
    if (flag1 != CONSTANT_40001000 && flag2 != CONSTANT_40001000 && flag3 != CONSTANT_40001000) {
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
    if (flag1 != CONSTANT_40001000 && flag2 != CONSTANT_40001000 && flag3 != CONSTANT_40001000) {
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
    if (flag1 != CONSTANT_40001000 && flag2 != CONSTANT_40001000) {
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
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    napi_create_int32(env, flag, &result);
    if (flag != CONSTANT_41211000) {
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
    if (ret != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 3. invoke 2 times cleancache
    int32_t flag = OH_NativeWindow_CleanCache(nativeWindow);
    flag = OH_NativeWindow_CleanCache(nativeWindow);
    if (flag != 0) {
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
    if (ret != CONSTANT_40001000) {
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
    if (flag != 0) {
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
    if (ret != CONSTANT_40601000) {
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
    if (flag != 0) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    
    // 6. release buffer
    ret = windowBuffer->ReleaseBuffer();
    if (ret != CONSTANT_41210000) {
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
    if (flag != 0) {
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
        if (flag != 0) {
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
        if (flag != 0) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
