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
#include "BufferTextTest.h"

#include <native_buffer/native_buffer.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_text_global.h>
#include <native_window/graphic_error_code.h>
#include <native_drawing/drawing_text_font_descriptor.h>
#include <native_window/buffer_handle.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>
#include <GLES2/gl2ext.h>
#include <native_image/native_image.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_font_collection.h>

void addBufferTextTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"getColorSpaceSuccess", nullptr, OH_NativeBuffer_GetColorSpaceSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getColorSpaceFail", nullptr, OH_NativeBuffer_GetColorSpaceFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"setMetadataValueSuccess", nullptr, OH_NativeBuffer_SetMetadataValueSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"setMetadataValueFail", nullptr, OH_NativeBuffer_SetMetadataValueFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getMetadataValueSuccess", nullptr, OH_NativeBuffer_GetMetadataValueSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getMetadataValueFail", nullptr, OH_NativeBuffer_GetMetadataValueFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"runBufferGlyphsSuccess", nullptr, OH_Drawing_RunBufferGlyphsSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"runBufferPosSuccess", nullptr, OH_Drawing_RunBufferPosSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"runBufferUtf8textSuccess", nullptr, OH_Drawing_RunBufferUtf8textSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"runBufferClustersSuccess", nullptr, OH_Drawing_RunBufferClustersSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"systemFontTypeSuccess", nullptr, OH_Drawing_SystemFontTypeSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"textUndefinedGlyphDisplayDEFAULT", nullptr, OH_Drawing_TextUndefinedGlyphDisplayDEFAULT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"textUndefinedGlyphDisplayTOFU", nullptr, OH_Drawing_TextUndefinedGlyphDisplayTOFU,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}

 napi_value OH_NativeBuffer_GetColorSpaceSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = 12,
        .usage = (1ULL << 0) | (1ULL << 1) |  (1ULL << 3),
    };
    OH_NativeBuffer* buffer = OH_NativeBuffer_Alloc(&config);
    int32_t res = OH_NativeBuffer_SetColorSpace(buffer, OH_COLORSPACE_BT709_LIMIT);
    OH_NativeBuffer_ColorSpace colorSpace;
    res = OH_NativeBuffer_GetColorSpace(buffer, &colorSpace);
    napi_create_int32(env, res != NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeBuffer_GetColorSpaceFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    
    OH_NativeBuffer_ColorSpace colorSpace;
    int32_t res = OH_NativeBuffer_GetColorSpace(nullptr, &colorSpace);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}
 napi_value OH_NativeBuffer_SetMetadataValueSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    
        OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = 12,
        .usage = (1ULL << 0) | (1ULL << 1) | (1ULL << 3) | (1ULL << 4) | (1ULL << 5) | (1ULL << 6)|(1ULL << 7),
    };
    OH_NativeBuffer* buffer = OH_NativeBuffer_Alloc(&config);
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    int32_t res = OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, size, metadata);
    napi_create_int32(env, res != NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeBuffer_SetMetadataValueFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    int32_t res = OH_NativeBuffer_SetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, size, metadata);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeBuffer_GetMetadataValueSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
        OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = 12,
        .usage = (1ULL << 0) | (1ULL << 1) |  (1ULL << 3),
    };
    OH_NativeBuffer* buffer = OH_NativeBuffer_Alloc(&config);
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, size, metadata);
    int32_t res = OH_NativeBuffer_GetMetadataValue(buffer, OH_HDR_STATIC_METADATA, &size, &metadata);
    napi_create_int32(env, res != NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeBuffer_GetMetadataValueFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    int32_t res = OH_NativeBuffer_GetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, &size, &metadata);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

napi_value OH_Drawing_RunBufferGlyphsSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_TextBlobBuilder* textBlobBuilder = OH_Drawing_TextBlobBuilderCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    int32_t count = 1;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    const OH_Drawing_RunBuffer* rbuff = OH_Drawing_TextBlobBuilderAllocRunPos(textBlobBuilder, font, count, rect);
    napi_create_int32(env, rbuff->glyphs != nullptr, &result);
    return result;
}
napi_value OH_Drawing_RunBufferPosSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_TextBlobBuilder* textBlobBuilder = OH_Drawing_TextBlobBuilderCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    int32_t count = 1;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    const OH_Drawing_RunBuffer* rbuff = OH_Drawing_TextBlobBuilderAllocRunPos(textBlobBuilder, font, count, rect);
    napi_create_int32(env, rbuff->pos != nullptr, &result);
    return result;
}

napi_value OH_Drawing_RunBufferUtf8textSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_TextBlobBuilder* textBlobBuilder = OH_Drawing_TextBlobBuilderCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    const char* str = "HellWorld";
    OH_Drawing_FontFeatures* fontFeatures = OH_Drawing_FontFeaturesCreate();
    float textWidth = 10;
    OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, fontFeatures, &textWidth);
    int32_t count = 1;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    const OH_Drawing_RunBuffer* rbuff = OH_Drawing_TextBlobBuilderAllocRunPos(textBlobBuilder, font, count, rect);
    napi_create_int32(env, rbuff->utf8text == nullptr, &result);
    return result;
}
napi_value OH_Drawing_RunBufferClustersSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_TextBlobBuilder* textBlobBuilder = OH_Drawing_TextBlobBuilderCreate();
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    const char* str = "HellWorld";
    OH_Drawing_FontFeatures* fontFeatures = OH_Drawing_FontFeaturesCreate();
    float textWidth = 10;
    OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, fontFeatures, &textWidth);
    
    int32_t count = 1;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    const OH_Drawing_RunBuffer* rbuff = OH_Drawing_TextBlobBuilderAllocRunPos(textBlobBuilder, font, count, rect);
    napi_create_int32(env, rbuff->clusters == nullptr, &result);
    return result;
}

napi_value OH_Drawing_SystemFontTypeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_SystemFontType fontType = INSTALLED;
    OH_Drawing_Array* fullNameArray = OH_Drawing_GetSystemFontFullNamesByType(GENERIC);
    size_t index = 1;
    const OH_Drawing_String* pfstr = OH_Drawing_GetSystemFontFullNameByIndex(fullNameArray, index);
    OH_Drawing_FontDescriptor* pful = OH_Drawing_GetFontDescriptorByFullName(pfstr, fontType);
    napi_create_int32(env, pful == nullptr, &result);
    return result;
}

napi_value OH_Drawing_TextUndefinedGlyphDisplayDEFAULT(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_DEFAULT);
    napi_create_int32(env, true, &result);
    return result;
}
napi_value OH_Drawing_TextUndefinedGlyphDisplayTOFU(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_SetTextUndefinedGlyphDisplay(TEXT_NO_GLYPH_USE_TOFU);
    napi_create_int32(env, true, &result);
    return result;
}