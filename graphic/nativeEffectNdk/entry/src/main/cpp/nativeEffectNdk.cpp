/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <js_native_api.h>
#include "napi/native_api.h"
#include "native_effect/effect_filter.h"
#include "native_effect/effect_types.h"
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "multimedia/image_framework/image_pixel_map_mdk.h"
#include "hilog/log.h"

#define SUCCESS 0
#define FAIL (-1)
#define DOUBLE_NUM_05 0.5
#define DOUBLE_NUM_15 1.5
#define ARR_NUM_0 0
#define ARR_NUM_1 1
#define ARR_NUM_2 2
#define ARR_NUM_3 3
#define UNAUTHORIZED 401

namespace {
    constexpr int8_t ARGB_8888_BYTES = 4;
}

static void CreatePixelMap(OH_PixelmapNative*** pixelmap)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    // 2 means alphaType
    OH_PixelmapInitializationOptions_SetAlphaType(ops, 2);
    // 4 means height
    OH_PixelmapInitializationOptions_SetHeight(ops, 4);
    // 4 means width
    OH_PixelmapInitializationOptions_SetWidth(ops, 4);
    // 4 means pixelFormat
    OH_PixelmapInitializationOptions_SetPixelFormat(ops, 4);
    // 255 means rgba data
    uint8_t data[] = {
        255, 255, 0, 255,
        255, 255, 0, 255,
        255, 255, 0, 255,
        255, 255, 0, 255
    };
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, *pixelmap);
}

static napi_value OHFilterCreateEffect(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_CreateEffect(*pixMap, &filter);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterCreateEffect001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    if ((OH_Filter_CreateEffect(nullptr, &filter) != EffectErrorCode::EFFECT_SUCCESS) ||
        (OH_Filter_CreateEffect(*pixMap, nullptr) != EffectErrorCode::EFFECT_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterInvert(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Invert(nullptr);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterInvert001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Invert(filter);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterBlur(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Blur(filter, 0.5f);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterBlur001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Blur(nullptr, 0.5);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterGrayScale(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_GrayScale(filter);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterGrayScale001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_GrayScale(nullptr);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterBrighten(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Brighten(filter, 0.5);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterBrighten001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    EffectErrorCode effectErrorCode = OH_Filter_Brighten(nullptr, 0.5);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterSetColorMatrix(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    OH_Filter_ColorMatrix matrix {
        -1.0, 0, 0, 0, 1,
        0, -1.0, 0, 0, 1,
        0, 0, -1.0, 0, 1,
        0, 0, 0, 1, 0
    };
    EffectErrorCode effectErrorCode = OH_Filter_SetColorMatrix(filter, &matrix);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterSetColorMatrix001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    OH_Filter_ColorMatrix matrix {
        -1.0, 0, 0, 0, 1,
        0, -1.0, 0, 0, 1,
        0, 0, -1.0, 0, 1,
        0, 0, 0, 1, 0
    };
    EffectErrorCode effectErrorCode = OH_Filter_SetColorMatrix(nullptr, &matrix);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterGetEffectPixelMap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    OH_Filter_Invert(filter);
    OH_PixelmapNative *pixelMap1 = nullptr;
    EffectErrorCode effectErrorCode = OH_Filter_GetEffectPixelMap(filter, &pixelMap1);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_Filter_Release(filter);
    OH_PixelmapNative_Release(*pixMap);
    OH_PixelmapNative_Release(pixelMap1);
    return result;
}

static napi_value OHFilterRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    OH_Filter_Invert(filter);
    EffectErrorCode effectErrorCode = OH_Filter_Release(filter);
    if (effectErrorCode == EffectErrorCode::EFFECT_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterRelease001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    OH_Filter_CreateEffect(*pixMap, &filter);
    OH_Filter_Invert(filter);
    EffectErrorCode effectErrorCode = OH_Filter_Release(nullptr);
    if (effectErrorCode == EffectErrorCode::EFFECT_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHFilterBlurWithTileMode001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *pixmap = nullptr;
    /** pixmap is necessary, otherwize can not create pixelmap*/
    OH_PixelmapNative **pixMap = &pixmap;
    CreatePixelMap(&pixMap);
    OH_Filter *filter = nullptr;
    if ((OH_Filter_CreateEffect(*pixMap, &filter) == EFFECT_SUCCESS) &&
        (OH_Filter_BlurWithTileMode(filter, 0.5f, CLAMP) == EFFECT_SUCCESS) &&
        (OH_Filter_BlurWithTileMode(nullptr, DOUBLE_NUM_05, CLAMP) == EFFECT_BAD_PARAMETER) &&
        (OH_Filter_Release(filter) == EFFECT_SUCCESS)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_PixelmapNative_Release(*pixMap);
    return result;
}

static napi_value OHPixelmapNativeCreateScaledPixelMap001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_Pixelmap_ImageInfo *srcImageInfoBefore = nullptr;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);

    OH_PixelmapNative *dstPixelmap = nullptr;
    float scaleX = DOUBLE_NUM_15;
    float scaleY = DOUBLE_NUM_15;
    Image_ErrorCode ret = OH_PixelmapNative_CreateScaledPixelMap(srcPixelmap, &dstPixelmap, scaleX, scaleY);
    if (ret == IMAGE_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_Pixelmap_ImageInfo *srcImageInfoBefore = nullptr;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);

    OH_PixelmapNative *dstPixelmap = nullptr;
    float scaleX = DOUBLE_NUM_05;
    float scaleY = DOUBLE_NUM_05;
    Image_ErrorCode ret = OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing(srcPixelmap, &dstPixelmap,
        scaleX, scaleY, OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_HIGH);
    if (ret == IMAGE_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapNativeGetByteCount001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode ret = OH_PixelmapNative_CreateEmptyPixelmap(options, &pixelmap);
    if (ret == IMAGE_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    uint32_t byteCount = 0;
    ret = OH_PixelmapNative_GetByteCount(pixelmap, &byteCount);
    if (ret == IMAGE_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    uint32_t allocByteCount = 0;
    ret = OH_PixelmapNative_GetAllocationByteCount(pixelmap, &allocByteCount);
    if ((ret == IMAGE_SUCCESS) && (byteCount == ARGB_8888_BYTES) && (allocByteCount >= byteCount)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    return result;
}

static napi_value OHPixelmapNativeAccessPixels001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &srcPixelmap);
    void *dstPixelmap = nullptr;
    Image_ErrorCode ret = OH_PixelmapNative_AccessPixels(srcPixelmap, &dstPixelmap);
    if (ret == IMAGE_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapNativeUnaccessPixels001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, 1);
    OH_PixelmapInitializationOptions_SetHeight(options, 1);
    OH_PixelmapNative *srcPixelmap = nullptr;
    OH_PixelmapNative_CreateEmptyPixelmap(options, &srcPixelmap);
    Image_ErrorCode ret = OH_PixelmapNative_UnaccessPixels(srcPixelmap);
    if (ret == IMAGE_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapInitializationOptionsEditable001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    bool editable = false;
    OH_PixelmapInitializationOptions_GetEditable(ops, &editable);
    if (editable == true) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_PixelmapInitializationOptions_SetEditable(ops, false);
    OH_PixelmapInitializationOptions_GetEditable(ops, &editable);
    if ((editable == false) && (OH_PixelmapInitializationOptions_SetEditable(nullptr, true) == UNAUTHORIZED) &&
        (OH_PixelmapInitializationOptions_SetEditable(nullptr, false) == UNAUTHORIZED) &&
        (OH_PixelmapInitializationOptions_GetEditable(nullptr, &editable) == UNAUTHORIZED)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_PixelmapInitializationOptions_Release(ops);
    return result;
}

static napi_value OHPixelmapNativeDestroy001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    size_t dataSize = ARGB_8888_BYTES;
    uint8_t data[] = {0x01, 0x02, 0x03, 0xFF};
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, 1);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, 1);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    if (errCode == IMAGE_SUCCESS) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_PixelmapNative_Destroy(&pixelMap);
    if ((pixelMap == nullptr) && (OH_PixelmapNative_Destroy(nullptr) == UNAUTHORIZED)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_PixelmapInitializationOptions_Release(createOpts);
    return result;
}

static napi_value OHPixelmapImageInfoGetAlphaMode001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    int32_t alphaMode = 0;
    Image_ErrorCode ret = OH_PixelmapImageInfo_GetAlphaMode(imageInfo, &alphaMode);
    if (ret == IMAGE_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapNativeCreatePixelmapUsingAllocator001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode ret = OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataLength, ops,
        IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
    if (ret == IMAGE_BAD_PARAMETER) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

static napi_value OHPixelmapNativeCreateEmptyPixelmapUsingAllocator001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode ret = OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops,
        IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
    if (ret == IMAGE_BAD_PARAMETER) {
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
        {"oHFilterCreateEffect", nullptr, OHFilterCreateEffect, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterCreateEffect001", nullptr, OHFilterCreateEffect001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterInvert", nullptr, OHFilterInvert, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterInvert001", nullptr, OHFilterInvert001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBlur", nullptr, OHFilterBlur, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBlur001", nullptr, OHFilterBlur001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterGrayScale", nullptr, OHFilterGrayScale, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterGrayScale001", nullptr, OHFilterGrayScale001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBrighten", nullptr, OHFilterBrighten, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBrighten001", nullptr, OHFilterBrighten001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterSetColorMatrix", nullptr, OHFilterSetColorMatrix, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterSetColorMatrix001", nullptr, OHFilterSetColorMatrix001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterGetEffectPixelMap", nullptr, OHFilterGetEffectPixelMap, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterRelease", nullptr, OHFilterRelease, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterRelease001", nullptr, OHFilterRelease001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHFilterBlurWithTileMode001", nullptr, OHFilterBlurWithTileMode001, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"oHPixelmapNativeCreateScaledPixelMap001", nullptr, OHPixelmapNativeCreateScaledPixelMap001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001", nullptr,
         OHPixelmapNativeCreateScaledPixelMapWithAntiAliasing001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeGetByteCount001", nullptr, OHPixelmapNativeGetByteCount001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeAccessPixels001", nullptr, OHPixelmapNativeAccessPixels001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeUnaccessPixels001", nullptr, OHPixelmapNativeUnaccessPixels001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapInitializationOptionsEditable001", nullptr, OHPixelmapInitializationOptionsEditable001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeDestroy001", nullptr, OHPixelmapNativeDestroy001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapImageInfoGetAlphaMode001", nullptr, OHPixelmapImageInfoGetAlphaMode001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeCreatePixelmapUsingAllocator001", nullptr, OHPixelmapNativeCreatePixelmapUsingAllocator001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHPixelmapNativeCreateEmptyPixelmapUsingAllocator001", nullptr,
         OHPixelmapNativeCreateEmptyPixelmapUsingAllocator001,
         nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "nativeEffectNdk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }