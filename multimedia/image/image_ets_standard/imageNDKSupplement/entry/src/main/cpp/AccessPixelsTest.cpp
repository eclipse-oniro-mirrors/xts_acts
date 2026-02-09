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

#include <cstdint>
#include <hilog/log.h>
#include <js_native_api.h>
#include <native_buffer/native_buffer.h>
#include <iostream>
#include <multimedia/image_framework/image_pixel_map_napi.h>
#include "multimedia/image_framework/image/image_common.h"
#include "multimedia/image_framework/image/pixelmap_native.h"
#include <CommonUtilsTest.h>
#include "utils/PixelmapHelperTest.h"
#include "AccessPixelsTest.h"
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageAccessPixelsNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6

#define OPTION_WIDTH_SMALL 4
#define OPTION_HEIGHT_SMALL 6
#define OPTION_PIXEL_FORMAT_SMALL 3
#define OPTION_ALPHA_ZERO 0
#define OPTION_SET_WIDTH 6
#define OPTION_SET_HEIGHT 4

namespace {
    constexpr size_t SIZE_ZERO = 0;
    constexpr size_t SIZE_ONE = 1;
    constexpr size_t SIZE_TWO = 2;
    constexpr size_t SIZE_THREE = 3;
    constexpr size_t DEFAULT_STRING_SIZE = 64;
    constexpr uint32_t ARGS_FIRST = 0;
    constexpr uint32_t ARGS_SECOND = 1;
    constexpr uint32_t ARGS_THIRD = 2;
    constexpr uint32_t INVALID_FRAME_COUNT = 0;
    constexpr int8_t INT8_FALSE = 0;
    constexpr int8_t INT8_TRUE = 1;
    constexpr int32_t DEFAULT_INDEX = 0;
}
typedef struct {
    uint32_t x;
    uint32_t y;
    uint32_t width;
    uint32_t height;
};
napi_value CreatePixelMapSuppTest(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;

    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_SMALL;
    createOps.height = OPTION_HEIGHT_SMALL;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT_SMALL;
    createOps.alphaType = OPTION_ALPHA_ZERO;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }

    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    free(buff);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        return udfVar;
    }
    return pixelMap;
}

napi_value TestAccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    
    void* addrPtr = nullptr;
    int32_t res = OHOS::Media::OH_AccessPixels(env, CreatePixelMapSuppTest(env, info), &addrPtr);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value TestUnAccessPixels(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    
    int32_t res = OHOS::Media::OH_UnAccessPixels(env, CreatePixelMapSuppTest(env, info));
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value PixelmapNativeGetNativeBuffer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_NativeBuffer **nativeBUffer = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetNativeBuffer(pixelmapNative, nativeBUffer);
    napi_value ret;
    napi_create_int32(env, returnValue, &ret);
    return ret;
}

napi_value PixelmapNativeGetNativeBufferNotExist(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    
    OH_PixelmapNative *pixelmapNative = nullptr;
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *srcPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &srcPixelmap);
    
    OH_NativeBuffer_Config config {
        .width = 256,
        .height = 256,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888,
        .usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE,
    };
    OH_NativeBuffer *nativeBuffer = OH_NativeBuffer_Alloc(&config);
    Image_ErrorCode returnValue = OH_PixelmapNative_GetNativeBuffer(srcPixelmap, &nativeBuffer);
    napi_value ret;
    napi_create_int32(env, returnValue, &ret);
    return ret;
}

napi_value TestImageScale(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);

    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *srcPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &srcPixelmap);

    OH_PixelmapNative *dstPixelmap = nullptr;
    OH_Pixelmap_ImageInfo *srcImageInfoBefore;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);
    float scaleX = 1.5;
    float scaleY = 1.5;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing(
            srcPixelmap, &dstPixelmap, scaleX, scaleY,
            OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_HIGH);
        break;
    default:
        errCode = IMAGE_UNKNOWN_ERROR;
        break;
    }
    if (dstPixelmap != nullptr) {
        OH_PixelmapNative_Release(dstPixelmap);
    }
    if (srcPixelmap != nullptr && srcPixelmap != dstPixelmap) {
        OH_PixelmapNative_Release(srcPixelmap);
    }
    OH_PixelmapInitializationOptions_Release(createOpts);
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}

Image_PositionArea* ImagePositionArea_Create(uint32_t regionX, uint32_t regionY,
                                             uint32_t regionWidth, uint32_t regionHeight,
                                             uint32_t srcImageWidth, uint32_t srcImageHeight)
{
    if (regionX + regionWidth > srcImageWidth || regionY + regionHeight > srcImageHeight ||
        regionWidth == 0 || regionHeight == 0) {
        std::cerr << "ImagePositionArea_Create: invalid region (out of bounds or zero size)" << std::endl;
        return nullptr;
    }
    Image_PositionArea* area = static_cast<Image_PositionArea*>(malloc(sizeof(Image_PositionArea)));
    if (area == nullptr) {
        std::cerr << "ImagePositionArea_Create: malloc area failed" << std::endl;
        return nullptr;
    }
    
    uint32_t stride = regionWidth * 4;
    size_t pixelsSize = stride * regionHeight;
    
    uint8_t* pixels = static_cast<uint8_t*>(malloc(pixelsSize));
    if (pixels == nullptr) {
        std::cerr << "ImagePositionArea_Create: malloc pixels failed" << std::endl;
        free(area);
        return nullptr;
    }
    memset(pixels, 0, pixelsSize);
    
    area->pixels = pixels;
    area->pixelsSize = pixelsSize;
    area->offset = 0;
    area->stride = stride;
    area->region.x = regionX;
    area->region.y = regionY;
    area->region.width = regionWidth;
    area->region.height = regionHeight;

    return area;
}

OH_PixelmapNative* OH_PixelmapNative_CreateBGRA(uint32_t width, uint32_t height)
{
    if (width == 0 || height == 0) {
        LOGE("OH_PixelmapNative_CreateBGRA: width/height is zero (w=%u, h=%u)", width, height);
        return nullptr;
    }
    
    size_t dataSize = width * height * 4;
    uint8_t* data = static_cast<uint8_t*>(malloc(dataSize));
    if (data == nullptr) {
        LOGE("OH_PixelmapNative_CreateBGRA: malloc data failed (size=%zu)", dataSize);
        return nullptr;
    }
    for (size_t i = 0; i < dataSize; i++) {
        data[i] = static_cast<uint8_t>((i + 1) % 256);
    }
    
    OH_Pixelmap_InitializationOptions *createOpts = nullptr;
    Image_ErrorCode err = OH_PixelmapInitializationOptions_Create(&createOpts);
    if (err != IMAGE_SUCCESS || createOpts == nullptr) {
        LOGE("OH_PixelmapInitializationOptions_Create failed (err=%d)", err);
        free(data);
        return nullptr;
    }
    
    OH_PixelmapInitializationOptions_SetWidth(createOpts, width);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    err = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);

    LOGI("OH_PixelmapNative_CreateBGRA success (w=%u, h=%u)", width, height);
    return pixelmap;
}
Image_ErrorCode PixelmapNativeWritePixelsToArea()
{
    OH_PixelmapNative *pixelmap = OH_PixelmapNative_CreateBGRA(1080, 1920);
    Image_PositionArea *area = ImagePositionArea_Create(10, 10, 100, 200, 1080, 1920);
    Image_ErrorCode result = OH_PixelmapNative_WritePixelsToArea(pixelmap, area);
    return result;
}

napi_value PixelmapNativeWritePixelsToArea(napi_env env, napi_callback_info info)
{
    Image_ErrorCode result = ::PixelmapNativeWritePixelsToArea();
    
    napi_value jsResult = nullptr;
    if (result == IMAGE_SUCCESS) {
        napi_get_boolean(env, true, &jsResult);
    } else {
        napi_get_boolean(env, false, &jsResult);
    }

    return jsResult;
}
