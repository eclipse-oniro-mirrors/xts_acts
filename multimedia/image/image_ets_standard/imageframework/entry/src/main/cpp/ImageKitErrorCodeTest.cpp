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

#include "ImageKitErrorCodeTest.h"
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_shadow_layer.h>
#include <native_drawing/drawing_shader_effect.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_record_cmd.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_font.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

static constexpr uint32_t NUM_100 = 720;
static constexpr uint32_t NUM_720 = 720;
static constexpr uint32_t NUM_960 = 960;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_4 = 4;
static constexpr uint32_t NUM_255 = 255;
static constexpr float  NUM_1_5 = 1.5;


napi_value OH_PixelmapNative_AntiAliasingLevel_NONE(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    Image_ErrorCode errCode = OH_PixelmapNative_ScaleWithAntiAliasing(pixelMapNative, x, y,
        OH_PixelmapNative_AntiAliasing_HIGH);
    napi_create_int32(env, errCode == IMAGE_SUCCESS, &result);
    return result;
}

napi_value OH_PixelmapNative_AntiAliasingLevel_LOW(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    Image_ErrorCode errCode = OH_PixelmapNative_ScaleWithAntiAliasing(pixelMapNative, x, y,
        OH_PixelmapNative_AntiAliasing_LOW);
    napi_create_int32(env, errCode == IMAGE_SUCCESS, &result);
    return result;
}
napi_value OH_PixelmapNative_AntiAliasingLevel_MEDIUM(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    Image_ErrorCode errCode = OH_PixelmapNative_ScaleWithAntiAliasing(pixelMapNative, x, y,
        OH_PixelmapNative_AntiAliasing_MEDIUM);
    napi_create_int32(env, errCode == IMAGE_SUCCESS, &result);
    return result;
}
napi_value OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    OH_Pixelmap_HdrMetadataValue* value = new OH_Pixelmap_HdrMetadataValue;
    Image_ErrorCode errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_STATIC_METADATA, &value);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    OH_Pixelmap_HdrMetadataValue* value = new OH_Pixelmap_HdrMetadataValue;
    Image_ErrorCode errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_DYNAMIC_METADATA, &value);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    OH_Pixelmap_HdrMetadataValue* value = new OH_Pixelmap_HdrMetadataValue;
    Image_ErrorCode errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &value);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value Image_ErrorCode_IMAGE_DMA_NOT_EXIST(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    OH_Pixelmap_HdrMetadataValue* value = new OH_Pixelmap_HdrMetadataValue;
    Image_ErrorCode errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &value);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrMetadataType_NONE(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_NONE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}
napi_value OH_Pixelmap_HdrMetadataType_BASE(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_BASE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrMetadataType_GAINMAP(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_GAINMAP;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrMetadataType_ALTERNATE(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_displayPrimariesX(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.displayPrimariesX[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata  staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_displayPrimariesY(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.displayPrimariesY[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_whitePointX(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.whitePointX = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_whitePointY(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.whitePointY = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_maxLuminance(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.maxLuminance = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_minLuminance(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.minLuminance = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.maxContentLightLevel = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->staticMetadata.maxFrameAverageLightLevel = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrStaticMetadata staticMetadata = pvalue2->staticMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}
napi_value OH_Pixelmap_HdrDynamicMetadata_data(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->dynamicMetadata.data = nullptr;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrDynamicMetadata dynamicMetadata = pvalue2->dynamicMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrDynamicMetadata_length(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->dynamicMetadata.length = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrDynamicMetadata dynamicMetadata = pvalue2->dynamicMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_writerVersion(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.writerVersion = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_miniVersion(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.miniVersion = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.gainmapChannelNum = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.useBaseColorFlag = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_baseHeadroom(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.baseHeadroom = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.alternateHeadroom = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapMax(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.gainmapMax[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_gainmapMin(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.gainmapMin[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_gamma(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.gamma[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

napi_value OH_Pixelmap_HdrGainmapMetadata_baselineOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.baselineOffset[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}
napi_value OH_Pixelmap_HdrGainmapMetadata_alternateOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    float x = NUM_1_5;
    float y = NUM_1_5;
    uint32_t width = NUM_100;
    uint32_t height = NUM_100;
    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    OH_PixelmapNative *pixelMapNative = nullptr;
    uint8_t* data = new uint8_t[NUM_100 * NUM_100 * NUM_4];
    size_t dataLength = NUM_100 * NUM_100 * NUM_4;
    for (int i = 0; i < dataLength; ++i) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    
    OH_Pixelmap_HdrMetadataValue* pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_ALTERNATE;
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, pvalue);
    OH_Pixelmap_HdrMetadataValue* pvalue2 = new OH_Pixelmap_HdrMetadataValue;
    pvalue2->gainmapMetadata.alternateOffset[0] = 0;
    errCode = OH_PixelmapNative_GetMetadata(pixelMapNative, HDR_GAINMAP_METADATA, &pvalue2);
    OH_Pixelmap_HdrGainmapMetadata gainmapMetadata = pvalue2->gainmapMetadata;
    napi_create_int32(env, errCode == IMAGE_DMA_NOT_EXIST, &result);
    return result;
}

void CreateEmptyPixelmapImageKit(OH_PixelmapNative** pixelMap, int32_t width, int32_t height, int format)
{
    OH_Pixelmap_InitializationOptions* options = nullptr;
    (void)OH_PixelmapInitializationOptions_Create(&options);
    (void)OH_PixelmapInitializationOptions_SetWidth(options, width);
    (void)OH_PixelmapInitializationOptions_SetHeight(options, height);
    (void)OH_PixelmapInitializationOptions_SetPixelFormat(options, format);
    (void)OH_PixelmapNative_CreateEmptyPixelmap(options, pixelMap);
}

napi_value PixelFormat_RGB_565(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_RGB_565);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_RGB_888(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_RGB_888);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_ALPHA_8(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_ALPHA_8);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_RGBA_F16(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_RGBA_F16);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_NV21(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_NV21);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_NV12(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_NV12);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_RGBA_1010102(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_RGBA_1010102);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_YCBCR_P010(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_YCBCR_P010);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}

napi_value PixelFormat_YCRCB_P010(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_PixelmapNative* srcImg = nullptr;
    CreateEmptyPixelmapImageKit(&srcImg, NUM_720, NUM_960, PIXEL_FORMAT_YCRCB_P010);
    bool res = (srcImg != nullptr);
    napi_create_int32(env, res, &result);
    return result;
}


napi_value JSImageImageAllocatorModeDmaCode(napi_env env, napi_callback_info info)
{
    IMAGE_ALLOCATOR_MODE allocator = IMAGE_ALLOCATOR_MODE_DMA;
    OH_PixelmapNative *pixelmap;
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
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errCode = OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops, allocator, &pixelmap);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageImageAllocatorModeSharedMemoryCode(napi_env env, napi_callback_info info)
{
    IMAGE_ALLOCATOR_MODE allocator = IMAGE_ALLOCATOR_MODE_SHARED_MEMORY;
    OH_PixelmapNative *pixelmap;
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
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errCode = OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops, allocator, &pixelmap);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapAlphaTypeOpaqueCode(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap;
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
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_OPAQUE);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapAlphaTypeUnpremultipliedCode(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelmap;
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
    uint8_t data[] = {255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255, 255, 255, 0, 255};
    // 16 means data length
    size_t dataLength = 16;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, ops, &pixelmap);
    Image_ErrorCode errCode = OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapHdrMetadataValueTypeCode(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_HdrMetadataValue value = {
        .type = HDR_METADATA_TYPE_NONE
    };
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(nullptr, HDR_METADATA_TYPE, &value);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapHdrMetadataValueStaticMetadataCode(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_HdrMetadataValue value;
    value.staticMetadata = {};
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(nullptr, HDR_METADATA_TYPE, &value);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapHdrMetadataValueDynamicMetadataCode(napi_env env, napi_callback_info info)
{
    uint8_t my_data[] = {0x01, 0x02, 0x03};
    OH_Pixelmap_HdrMetadataValue value;
    value.dynamicMetadata = {
        .data = my_data,
        .length = sizeof(my_data)
    };
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(nullptr, HDR_METADATA_TYPE, &value);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImagePixelmapHdrMetadataValueGainmapMetadataCode(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_HdrMetadataValue value;
    value.gainmapMetadata = {
        .writerVersion = 0
    };
    Image_ErrorCode errCode = OH_PixelmapNative_SetMetadata(nullptr, HDR_METADATA_TYPE, &value);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}