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
#include "napi/native_api.h"
#include <cstdint>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <native_window/graphic_error_code.h>
#include <native_buffer/native_buffer.h>
#include "ace/xcomponent/native_interface_xcomponent.h"
#include "ExternalWindowTest.h"
#include "nativewindow.h"
#define SUCCESS 0
#define CONSTANT_100000 100000
#define CONSTANT_60 60
#define CONSTANT_2999 2999
void addExternalWindowTest1(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"testOHScalingModeToWindow", nullptr, testOHScalingModeToWindow,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHScalingModeCrop", nullptr, testOHScalingModeCrop,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOHScalingModeNoCrop", nullptr, testOHScalingModeNoCrop,
             nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyRedPrimaryY", nullptr, testOhMetakeyRedPrimaryY,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyGreenPrimaryX", nullptr, testOhMetakeyGreenPrimaryX,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyGreenPrimaryY", nullptr, testOhMetakeyGreenPrimaryY,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyBluePrimaryX", nullptr, testOhMetakeyBluePrimaryX,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyBluePrimaryY", nullptr, testOhMetakeyBluePrimaryY,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyWhitePrimaryX", nullptr, testOhMetakeyWhitePrimaryX,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyWhitePrimaryY", nullptr, testOhMetakeyWhitePrimaryY,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyMaxLuminance", nullptr, testOhMetakeyMaxLuminance,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyMinLuminance", nullptr, testOhMetakeyMinLuminance,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyMaxContentLightLevel", nullptr, testOhMetakeyMaxContentLightLevel,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyMaxFrameAverageLightLevel", nullptr, testOhMetakeyMaxFrameAverageLightLevel,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testOhMetakeyHdrVivid", nullptr, testOhMetakeyHdrVivid,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowWTParcelSuccess", nullptr, testNativeWindowWTParcelSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowWTParcelInvalidArguments", nullptr, testNativeWindowWTParcelInvalidArguments,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowRFParcelSuccess", nullptr, testNativeWindowRFParcelSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowRFParcelInvalidArguments", nullptr, testNativeWindowRFParcelInvalidArguments,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowWindowHandleOptSetTimeOut", nullptr, testNativeWindowWindowHandleOptSetTimeOut,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowWindowHandleOptGetTimeOut", nullptr, testNativeWindowWindowHandleOptGetTimeOut,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addExternalWindowTest(std::vector<napi_property_descriptor>& descData)
{
    addExternalWindowTest1(descData);
    descData.push_back({"testNativeWindowGLFlushedBufferV2Success", nullptr, testNativeWindowGLFlushedBufferV2Success,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGLFBufferV2InvalidArguments", nullptr,
        testNativeWindowGLFBufferV2InvalidArguments, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowSetColorSpaceSuccess", nullptr, testNativeWindowSetColorSpaceSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowSetColorSpaceInvalidArguments", nullptr,
        testNativeWindowSetColorSpaceInvalidArguments, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGetColorSpaceInvalidArguments", nullptr,
        testNativeWindowGetColorSpaceInvalidArguments, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowSetMVSuccess", nullptr, testNativeWindowSetMVSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowSetMVInvalidArguments", nullptr, testNativeWindowSetMVInvalidArguments,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGetMVSuccess", nullptr, testNativeWindowGetMVSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGetMVInvalidArguments", nullptr, testNativeWindowGetMVInvalidArguments,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGetMVUnsupported", nullptr, testNativeWindowGetMVUnsupported,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowCleanCacheInvalidArguments", nullptr,
        testNativeWindowCleanCacheInvalidArguments, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowCleanCacheConsumerDisconnected", nullptr,
        testNativeWindowCleanCacheConsumerDisconnected, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID", nullptr,
        testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value testOHScalingModeToWindow(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    uint32_t sequence = 1000;
    int32_t res = OH_NativeWindow_NativeWindowSetScalingMode(nullptr, sequence, OH_SCALING_MODE_SCALE_TO_WINDOW);
    delete initNative;
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOHScalingModeCrop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    uint32_t sequence = 1000;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetScalingMode(nullptr, sequence, OH_SCALING_MODE_SCALE_CROP);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOHScalingModeNoCrop(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    uint32_t sequence = 1000;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetScalingMode(nullptr, sequence, OH_SCALING_MODE_NO_SCALE_CROP);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyRedPrimaryY(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_RED_PRIMARY_Y, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyGreenPrimaryX(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_GREEN_PRIMARY_X, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyGreenPrimaryY(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_GREEN_PRIMARY_Y, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyBluePrimaryX(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_BLUE_PRIMARY_X, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyBluePrimaryY(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_BLUE_PRIMARY_Y, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyWhitePrimaryX(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_WHITE_PRIMARY_X, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyWhitePrimaryY(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_WHITE_PRIMARY_Y, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyMaxLuminance(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_MAX_LUMINANCE, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyMinLuminance(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_MIN_LUMINANCE, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyMaxContentLightLevel(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_MAX_CONTENT_LIGHT_LEVEL, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyMaxFrameAverageLightLevel(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_MAX_FRAME_AVERAGE_LIGHT_LEVEL, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testOhMetakeyHdrVivid(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow *initNative = new InitNativeWindow();
    uint32_t sequence = 1000;
    const OHHDRMetaData metaData[] = {{OH_METAKEY_HDR_VIVID, 0}};
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowSetMetaData(nullptr, sequence, sizeof(metaData), metaData);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeWindowWTParcelSuccess(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t res = OH_NativeWindow_WriteToParcel(nativeWindow, parcel);
    napi_create_int32(env, res == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowWTParcelInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_WriteToParcel(nativeWindow, nullptr);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowRFParcelSuccess(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OH_NativeWindow_WriteToParcel(nativeWindow, parcel);
    int32_t res = OH_NativeWindow_ReadFromParcel(parcel, &nativeWindow);
    napi_create_int32(env, res == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowRFParcelInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_ReadFromParcel(nullptr, nullptr);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowWindowHandleOptSetTimeOut(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t flag;
    int32_t timeout = 5000;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, SET_TIMEOUT, &timeout);
    delete initNative;
    napi_create_int32(env, res, &result);
    return result;
}

napi_value testNativeWindowWindowHandleOptGetTimeOut(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t timeout = 5000;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, GET_TIMEOUT, &timeout);
    delete initNative;
    napi_create_int32(env, res, &result);
    return result;
}
napi_value testNativeWindowGLFlushedBufferV2Success(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    int32_t ret = OH_NativeWindow_GetLastFlushedBufferV2(nativeWindow, &nativeWindowBuffer, &fenceFd, matrix);
    delete initNative;
    napi_create_int32(env, ret == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGLFBufferV2InvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    float matrix[16];
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    int32_t ret = OH_NativeWindow_GetLastFlushedBufferV2(nullptr, &nativeWindowBuffer, &fenceFd, matrix);
    delete initNative;
    napi_create_int32(env, ret == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGLFlushedBufferV2BUFFERSTATEINVALID(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    float matrix[16];
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeImage* image = OH_ConsumerSurface_Create();
    OHNativeWindow* nativeImageWindow = OH_NativeImage_AcquireNativeWindow(image);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeImageWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeImageWindow, &buffer, &fenceFd);
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeImageWindow, buffer, fenceFd, region);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &buffer, &fenceFd);
    ret = OH_NativeImage_ReleaseNativeWindowBuffer(image, buffer, fenceFd);
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeImageWindow, &buffer, &fenceFd);
    ret = OH_NativeWindow_GetLastFlushedBufferV2(nativeImageWindow, &buffer, &fenceFd, matrix);
    napi_create_int32(env, ret == NATIVE_ERROR_BUFFER_STATE_INVALID ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowSetColorSpaceSuccess(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    Region::Rect rect{
        .x = 0x100,
        .y = 0x100,
        .w = 0x100,
        .h = 0x100,
    };
    Region region{.rects = &rect};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, region);
    int32_t res = OH_NativeWindow_SetColorSpace(nativeWindow, OH_COLORSPACE_NONE);
    delete initNative;
    napi_create_int32(env, res == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowSetColorSpaceInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_SetColorSpace(nullptr, static_cast<OH_NativeBuffer_ColorSpace>(CONSTANT_100000));
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGetColorSpaceInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fenceFd;
    int32_t res = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fenceFd);
    OH_NativeBuffer_ColorSpace colorSpace;
    res = OH_NativeWindow_GetColorSpace(nullptr, &colorSpace);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowSetMVSuccess(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t xValue = CONSTANT_2999;
    uint8_t metaData[CONSTANT_60];
    int32_t res = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, xValue, metaData);
    napi_create_int32(env, res == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowSetMVInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t xValue = CONSTANT_2999;
    int32_t res = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, xValue, NULL);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGetMVSuccess(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t bufferSize;
    uint8_t *buffer;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t xValue = CONSTANT_2999;
    uint8_t metaData[CONSTANT_60];
    int32_t res = OH_NativeWindow_SetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, xValue, metaData);
    res = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_DYNAMIC_METADATA, &bufferSize, &buffer);
    napi_create_int32(env, res == NATIVE_ERROR_OK ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGetMVInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, NULL, NULL);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowGetMVUnsupported(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t ret1;
    uint8_t *ret2;
    int32_t res = OH_NativeWindow_GetMetadataValue(nativeWindow, OH_HDR_METADATA_TYPE, &ret1, &ret2);
    napi_create_int32(env, res == NATIVE_ERROR_UNSUPPORTED ? 0 : 1, &result);
    return result;
}

napi_value testNativeWindowCleanCacheInvalidArguments(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_CleanCache(nullptr);
    delete initNative;
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS ? 0 : -1, &result);
    return result;
}

napi_value testNativeWindowCleanCacheConsumerDisconnected(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitNativeWindow* initNative = new InitNativeWindow();
    OHNativeWindow *nativeWindow = nullptr;
    nativeWindow = initNative->returnNativeWindow();
    int32_t res = OH_NativeWindow_CleanCache(nativeWindow);
    delete initNative;
    napi_create_int32(env, res == NATIVE_ERROR_CONSUMER_DISCONNECTED ? 0 : 1, &result);
    return result;
}