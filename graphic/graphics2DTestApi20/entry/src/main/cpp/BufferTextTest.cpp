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
#include <multimedia/player_framework/native_avbuffer.h>
#include <GLES3/gl3.h>
#include <native_image/native_image.h>
#include <common/native_common.h>

void addBufferTextTest1(std::vector<napi_property_descriptor>& descData)
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
    descData.push_back({"nativeBufferPlanesSuccess", nullptr, OH_NativeBuffer_PlanesSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"nativeBufferPlaneCount", nullptr, OH_NativeBuffer_PlaneCount,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"nativeBuffer_PlaneOffset", nullptr, OH_NativeBuffer_PlaneOffset,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"nativeBuffer_PlaneColumnStride", nullptr, OH_NativeBuffer_PlaneColumnStride,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"nativeBuffer_PlaneRowStride", nullptr, OH_NativeBuffer_PlaneRowStride,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"nativeBuffer_PlanesSuccess2", nullptr, OH_NativeBuffer_PlanesSuccess2,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}
void addBufferTextTest(std::vector<napi_property_descriptor>& descData)
{
    addBufferTextTest1(descData);
    descData.push_back({"textUndefinedGlyphDisplayDEFAULT", nullptr, OH_Drawing_TextUndefinedGlyphDisplayDEFAULT,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"textUndefinedGlyphDisplayTOFU", nullptr, OH_Drawing_TextUndefinedGlyphDisplayTOFU,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandle", nullptr, BufferHandleSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleWidth", nullptr, BufferHandleWidth,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleStride", nullptr, BufferHandleStride,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleHeight", nullptr, BufferHandleHeight,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleFormat", nullptr, BufferHandleFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleUsage", nullptr, BufferHandleUsage,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleKey", nullptr, BufferHandleKey, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandlePhyAddr", nullptr, BufferHandlePhyAddr,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleReserveFds", nullptr, BufferHandleReserveFds,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleReserveInts", nullptr, BufferHandleReserveInts,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"BufferHandleReserve", nullptr, BufferHandleReserve,
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
    if (buffer == nullptr) {
        napi_create_int32(env, NATIVE_ERROR_INVALID_ARGUMENTS, &result);
        return result;
    }
    int32_t res = OH_NativeBuffer_SetColorSpace(buffer, OH_COLORSPACE_DISPLAY_BT2020_PQ);
    OH_NativeBuffer_ColorSpace colorSpace;
    res = OH_NativeBuffer_GetColorSpace(buffer, &colorSpace);
    napi_create_int32(env, res == NATIVE_ERROR_OK || res != NATIVE_ERROR_INVALID_ARGUMENTS ||
                      res != NATIVE_ERROR_BUFFER_STATE_INVALID, &result);
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
    if (buffer == nullptr) {
        napi_create_int32(env, NATIVE_ERROR_INVALID_ARGUMENTS, &result);
        return result;
    }
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    int32_t res = OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, size, metadata);
    
    napi_create_int32(env, res == NATIVE_ERROR_OK || res != NATIVE_ERROR_INVALID_ARGUMENTS ||
                      res != NATIVE_ERROR_BUFFER_STATE_INVALID, &result);
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
    if (buffer == nullptr) {
        napi_create_int32(env, NATIVE_ERROR_INVALID_ARGUMENTS, &result);
        return result;
    }
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    OH_NativeBuffer_SetMetadataValue(buffer, OH_HDR_STATIC_METADATA, size, metadata);
    int32_t res = OH_NativeBuffer_GetMetadataValue(buffer, OH_HDR_STATIC_METADATA, &size, &metadata);
    napi_create_int32(env, res == NATIVE_ERROR_OK || res != NATIVE_ERROR_INVALID_ARGUMENTS ||
                      res != NATIVE_ERROR_BUFFER_STATE_INVALID, &result);
    return result;
}

 napi_value OH_NativeBuffer_GetMetadataValueFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t size = 10;
    uint8_t *metadata = new uint8_t(size);
    int32_t res = OH_NativeBuffer_GetMetadataValue(nullptr, OH_HDR_STATIC_METADATA, &size, &metadata);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS || res != NATIVE_ERROR_UNSUPPORTED, &result);
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
napi_value BufferHandleSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    // 获取生产者NativeWindow
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    auto w = handle->width;
    auto stride =  handle->stride;
    auto h = handle->height;
    auto f =  handle->format;
    auto u = handle->usage;
    Region region{nullptr, 0};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_DetachContext(nativeImage);
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value BufferHandleWidth(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);

    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;

    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);

    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->width == width, &result);
    return result;
}
napi_value BufferHandleStride(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    // 获取生产者NativeWindow
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t stride = 3200;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->stride >= 0, &result);
    return result;
}

napi_value BufferHandleHeight(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->height == height, &result);
    return result;
}

napi_value BufferHandleFormat(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    // 获取生产者NativeWindow
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t format = 12;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);

    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;

    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);

    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->format == format, &result);
    return result;
}

napi_value BufferHandleUsage(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t width = 800;
    int32_t height = 600;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    uint64_t usage = 9;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->usage == usage, &result);
    return result;
}

napi_value BufferHandleKey(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->key == 0, &result);
    return result;
}

napi_value BufferHandlePhyAddr(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->phyAddr >= 0, &result);
    return result;
}

napi_value BufferHandleReserveFds(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->reserveFds >= 0, &result);
    return result;
}

napi_value BufferHandleReserveInts(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->reserveInts >= 0, &result);
    return result;
}

napi_value BufferHandleReserve(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId;
    glGenTextures(1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 800;
    int32_t height = 600;
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(buffer);
    NAPI_ASSERT(env, handle != nullptr, "");
    napi_create_int32(env, handle->reserve != nullptr, &result);
    return result;
}
OH_NativeBuffer_Planes newPlanes()
{
    OH_NativeBuffer_Planes p;
    p.planeCount = sizeof(p.planes) / sizeof(OH_NativeBuffer_Plane);
    for (int i = 0; i < p.planeCount; i++) {
        p.planes[i].columnStride = 0;
        p.planes[i].offset = 0;
        p.planes[i].rowStride = 0;
    }
    return p;
}
napi_value OH_NativeBuffer_PlanesSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);
    
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer *nativebuffer = nullptr;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t err1 = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativebuffer);
    OH_NativeBuffer_Config bufferConfig;
    OH_NativeBuffer_Planes ww = newPlanes();
    void *addr = nullptr;
    int wee = OH_NativeBuffer_MapPlanes(nativebuffer, &addr, &ww);
    napi_create_int32(env, ww.planeCount == pCount, &result);
    return result;
}
napi_value OH_NativeBuffer_PlaneCount(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);
    
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer *nativebuffer = nullptr;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t err1 = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativebuffer);
    OH_NativeBuffer_Config bufferConfig;
    OH_NativeBuffer_Planes ww = newPlanes();
    void *addr = nullptr;
    int wee = OH_NativeBuffer_MapPlanes(nativebuffer, &addr, &ww);
    napi_create_int32(env, ww.planeCount == pCount, &result);
    return result;
}
napi_value OH_NativeBuffer_PlaneOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);
    
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer *nativebuffer = nullptr;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t err1 = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativebuffer);
    OH_NativeBuffer_Config bufferConfig;
    OH_NativeBuffer_Planes ww = newPlanes();
    void *addr = nullptr;
    int wee = OH_NativeBuffer_MapPlanes(nativebuffer, &addr, &ww);
    napi_create_int32(env, ww.planes[0].offset == 0, &result);
    return result;
}
napi_value OH_NativeBuffer_PlaneColumnStride(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);
    
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer *nativebuffer = nullptr;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t err1 = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativebuffer);
    OH_NativeBuffer_Config bufferConfig;
    OH_NativeBuffer_Planes ww = newPlanes();
    void *addr = nullptr;
    int wee = OH_NativeBuffer_MapPlanes(nativebuffer, &addr, &ww);
    napi_create_int32(env, ww.planes[0].columnStride == 0, &result);
    return result;
}
napi_value OH_NativeBuffer_PlaneRowStride(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    NAPI_ASSERT(env, nativeImage != nullptr, "");
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);
    
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer *nativebuffer = nullptr;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t err1 = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativebuffer);
    OH_NativeBuffer_Config bufferConfig;
    OH_NativeBuffer_Planes ww = newPlanes();
    void *addr = nullptr;
    int wee = OH_NativeBuffer_MapPlanes(nativebuffer, &addr, &ww);
    napi_create_int32(env, ww.planes[0].rowStride == 0, &result);
    return result;
}
napi_value OH_NativeBuffer_PlanesSuccess2(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeBuffer_Config config;
    config.width = 100; // 100 pixels
    config.height = 100; // 100 pixels
    config.format = 12; // format 12
    config.usage = (1ULL << 0);
    
    OH_NativeBuffer* buffer = OH_NativeBuffer_Alloc(&config);
    if (buffer == nullptr) {
        napi_create_int32(env, NATIVE_ERROR_INVALID_ARGUMENTS, &result);
        return result;
    }
    int32_t err0 = OH_NativeBuffer_GetSeqNum(buffer);
    
    void *getVirAddr;
    OH_NativeBuffer_Planes outPlanes;
    int32_t err1 = OH_NativeBuffer_MapPlanes(buffer, &getVirAddr, &outPlanes);
    int32_t err2 = napi_create_int32(env, true, &result);
    return result;
}