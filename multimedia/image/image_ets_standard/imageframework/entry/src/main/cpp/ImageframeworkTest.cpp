/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "imageframeworkTest.h"
#include <cstdlib>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/video_processing_engine/image_processing.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#define DRAW_COLORBLUE 0xFF0000FF
#define DOUBLE_NUM_05 0.5
constexpr int8_t ARGB_8888_BYTES = 4;
const int IMAGE_SIZE = 512;
const int HEIGHT = 300;
const int WIDTH = 200;
const int OPTION1 = 3;
const int OPTION2 = 2;
const double DEGREES_90 = 90.0;
uint8_t *g_pixData = nullptr;
constexpr uint32_t DEFAULT_WIDTH = 3840;
constexpr uint32_t DEFAULT_HEIGHT = 2160;
constexpr uint32_t PIX_SIZE = DEFAULT_WIDTH * DEFAULT_HEIGHT * 4;
OH_Pixelmap_InitializationOptions *g_createOpts_RGBA = nullptr;
napi_value PixelmapNativeOpacitySuccess(napi_env env, napi_callback_info info)
{
    uint8_t data[960000];
    size_t dataSize = 960000;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
    OH_PixelmapNative_Rotate(pixelmap, DEGREES_90);
    const float opacityValue = 0.2;
    Image_ErrorCode returnValue = OH_PixelmapNative_Opacity(pixelmap, opacityValue);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeOpacity(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    float rate = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_Opacity(pixelMap, rate);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeScaleSuccess(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    uint8_t data[960000];
    size_t dataSize = 960000;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
    OH_PixelmapNative_Rotate(pixelmap, DEGREES_90);
    const float opacityValue = 0.2;
    OH_PixelmapNative_Opacity(pixelmap, opacityValue);
    Image_ErrorCode returnValue = OH_PixelmapNative_Scale(pixelmap, 0.8, 1.0);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeScale(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    float x = 0;
    float y = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_Scale(pixelMap, x, y);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeScaleWithAntiAliasing(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    float x = 0;
    float y = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_ScaleWithAntiAliasing(
        pixelMap, x, y, OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_NONE);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value CreateScaledPixelMap(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *dstPixelmap = nullptr;
    OH_PixelmapNative *srcPixelmap = nullptr;
    float scaleX = 1.5; // Scale up by 150%
    float scaleY = 1.5; // Scale up by 150%
    Image_ErrorCode returnValue = OH_PixelmapNative_CreateScaledPixelMap(srcPixelmap, &dstPixelmap, scaleX, scaleY);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value Translate(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    float x = 0;
    float y = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_Translate(pixelMap, x, y);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeRotateSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, IMAGE_SIZE);
    OH_PixelmapInitializationOptions_SetHeight(options, IMAGE_SIZE);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_RGBA_1010102);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    OH_PixelmapNative_Scale(pixelmap, 2, 2); // 2: scale size
    Image_ErrorCode returnValue = OH_PixelmapNative_Rotate(pixelmap, 64.0);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeRotate(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    float angle = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_Rotate(pixelMap, angle);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeFlipSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, IMAGE_SIZE);
    OH_PixelmapInitializationOptions_SetHeight(options, IMAGE_SIZE);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_RGBA_1010102);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    OH_PixelmapNative_Scale(pixelmap, 2, 2);  // 2: scale size
    OH_PixelmapNative_Rotate(pixelmap, 64.0); // 64.0: rotate angle
    uint32_t byteCount = 0;
    OH_PixelmapNative_GetByteCount(pixelmap, &byteCount);
    uint32_t allocByteCount = 0;
    OH_PixelmapNative_GetAllocationByteCount(pixelmap, &allocByteCount);
    Image_ErrorCode returnValue = OH_PixelmapNative_Flip(pixelmap, 0, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeFlip(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    bool horizontal = 0;
    bool vertical = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_Flip(pixelMap, horizontal, vertical);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeCrop(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    Image_Region *region = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_Crop(pixelMap, region);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeReleaseSuccess(napi_env env, napi_callback_info info)
{
    uint32_t imageWidth = 500;
    uint32_t imageHeight = 500;
    OH_Pixelmap_InitializationOptions *createOps = nullptr;
    OH_PixelmapInitializationOptions_Create(&createOps);
    OH_PixelmapInitializationOptions_SetWidth(createOps, imageWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOps, imageHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOps, OPTION1);
    OH_PixelmapInitializationOptions_SetSrcPixelFormat(createOps, OPTION1);
    OH_PixelmapInitializationOptions_SetAlphaType(createOps, OPTION2);
    size_t bufferSize = imageWidth * imageHeight * 4;
    void *bitmapAddr = malloc(bufferSize);
    if (bitmapAddr == nullptr) {
    }
    for (int i = 0; i < imageWidth * imageHeight; i++) {
        ((uint32_t *)bitmapAddr)[i] = DRAW_COLORBLUE;
    }
    OH_PixelmapNative *pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap((uint8_t *)bitmapAddr, bufferSize, createOps, &pixelMapNative);
    Image_ErrorCode returnValue = OH_PixelmapNative_Release(pixelMapNative);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeRelease(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_Release(pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value CreateScaledPixelMapWithAntiAliasing(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_Pixelmap_ImageInfo *srcImageInfoBefore = nullptr;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);
    OH_PixelmapNative *dstPixelmap = nullptr;
    float scaleX = DOUBLE_NUM_05;
    float scaleY = DOUBLE_NUM_05;
    Image_ErrorCode returnValue = OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing(
        srcPixelmap, &dstPixelmap, scaleX, scaleY,
        OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_HIGH);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeDestroySuccess(napi_env env, napi_callback_info info)
{
    size_t dataSize = ARGB_8888_BYTES;
    uint8_t data[] = {0x01, 0x02, 0x03, 0xFF}; // Example ARGB data
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, 1);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, 1);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    Image_ErrorCode returnValue = OH_PixelmapNative_Destroy(&pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeDestroy(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_Destroy(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeConvertAlphaFormat(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *srcpixelmap = nullptr;
    OH_PixelmapNative *dstpixelmap = nullptr;
    const bool isPremul = false;
    Image_ErrorCode returnValue = OH_PixelmapNative_ConvertAlphaFormat(srcpixelmap, dstpixelmap, isPremul);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeCreateEmptyPixelmapSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeCreateEmptyPixelmap(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapNative **pixelmap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_CreateEmptyPixelmap(options, pixelmap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeCreateEmptyPixelmapUsingAllocator(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue =
        OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetMetadata(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_Pixelmap_HdrMetadataValue **value = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetMetadata(pixelmapNative, HDR_METADATA_TYPE, value);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeSetMetadata(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_Pixelmap_HdrMetadataValue *value = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_SetMetadata(pixelmapNative, HDR_METADATA_TYPE, value);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetNativeBuffer(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmapNative = nullptr;
    OH_NativeBuffer **nativeBUffer = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetNativeBuffer(pixelmapNative, nativeBUffer);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetColorSpaceNative(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *getColorSpaceNative = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetColorSpaceNative(pixelmap, &getColorSpaceNative);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeSetColorSpaceNative(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *setColorSpaceNative = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_SetColorSpaceNative(pixelmap, setColorSpaceNative);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeSetMemoryName(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap = nullptr;
    char name[] = "testName";
    Image_ErrorCode returnValue = OH_PixelmapNative_SetMemoryName(pixelmap, name, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetByteCountSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    uint32_t byteCount = 0; // Initialize byteCount to 0
    Image_ErrorCode returnValue = OH_PixelmapNative_GetByteCount(pixelmap, &byteCount);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetByteCount(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_GetByteCount(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetAllocationByteCountSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    uint32_t byteCount = 0; // Initialize byteCount to 0
    OH_PixelmapNative_GetByteCount(pixelmap, &byteCount);
    uint32_t allocByteCount = 0; // Initialize allocByteCount to 0
    Image_ErrorCode returnValue = OH_PixelmapNative_GetAllocationByteCount(pixelmap, &allocByteCount);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetAllocationByteCount(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_GetAllocationByteCount(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeAccessPixelsSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &srcPixelmap);
    void *dstPixelmap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_AccessPixels(srcPixelmap, &dstPixelmap);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeAccessPixels(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_AccessPixels(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeUnaccessPixelsSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &srcPixelmap);
    Image_ErrorCode returnValue = OH_PixelmapNative_UnaccessPixels(srcPixelmap);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeUnaccessPixels(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_UnaccessPixels(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing *instance = nullptr;
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingDestroySuccess(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing *instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Destroy(instance);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingDestroy(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Destroy(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingSetParameterSuccess(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_SetParameter(instance, parameter);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingSetParameter(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_SetParameter(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingGetParameterSuccess(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing* instance = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    OH_AVFormat* parameter = nullptr;
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_GetParameter(instance, parameter);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingGetParameter(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_GetParameter(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
void CreateEmptyPixelmap(OH_PixelmapNative** pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}
napi_value ImageProcessingConvertColorSpaceValue(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_ConvertColorSpace(instance, srcImg, dstImg);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingConvertColorSpace(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_ConvertColorSpace(nullptr, nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingComposeValue(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Compose(instance, srcImg, gainmap, dstImg);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingCompose(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Compose(nullptr, nullptr, nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingDecomposeValue(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* gainmap = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Decompose(instance, srcImg, dstImg, gainmap);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingDecompose(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_PixelmapNative *dst_gain_pixelMap_RGBA = nullptr;
    OH_PixelmapNative_CreatePixelmap(g_pixData, PIX_SIZE, g_createOpts_RGBA, &dst_gain_pixelMap_RGBA);
    ImageProcessing_ErrorCode returnValue =
        OH_ImageProcessing_Decompose(nullptr, nullptr, nullptr, dst_gain_pixelMap_RGBA);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingGenerateMetadataValue(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_GenerateMetadata(instance, srcImg);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingGenerateMetadata(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_GenerateMetadata(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingEnhanceDetailValue(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    OH_ImageProcessing* instance = nullptr;
    OH_PixelmapNative* srcImg = nullptr;
    OH_PixelmapNative* dstImg = nullptr;
    OH_ImageProcessing_Create(&instance, IMAGE_PROCESSING_TYPE_DETAIL_ENHANCER);
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_EnhanceDetail(instance, srcImg, dstImg);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingEnhanceDetail(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_GenerateMetadata(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value ImageProcessingCreateInstance(napi_env env, napi_callback_info info)
{
    OH_ImageProcessing_InitializeEnvironment();
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_Create(nullptr,
        IMAGE_PROCESSING_TYPE_METADATA_GENERATION);
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_ERROR_INVALID_INSTANCE) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageProcessingDeinitializeEnvironment(napi_env env, napi_callback_info info)
{
    ImageProcessing_ErrorCode returnValue = OH_ImageProcessing_DeinitializeEnvironment();
    int ret = -1;
    if (returnValue == IMAGE_PROCESSING_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapScaleWithAntiAliasingNone(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t returnValue = OH_PixelMap_ScaleWithAntiAliasing(p, 1, 2, OH_PixelMap_AntiAliasing_NONE);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapScaleWithAntiAliasingLow(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t returnValue = OH_PixelMap_ScaleWithAntiAliasing(p, 1, 2, OH_PixelMap_AntiAliasing_LOW);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapScaleWithAntiAliasingMedium(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t returnValue = OH_PixelMap_ScaleWithAntiAliasing(p, 1, 2, OH_PixelMap_AntiAliasing_MEDIUM);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}