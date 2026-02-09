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
#include "RectFontTest.h"
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_round_rect.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_pen.h>
void addRectTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"rectGetArraySizeSuccess", nullptr, OH_Drawing_RectGetArraySizeSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"rectGetArraySizeFail", nullptr, OH_Drawing_RectGetArraySizeFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"rectGetArrayElementSuccess", nullptr, OH_Drawing_RectGetArrayElementSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"rectGetArrayElementFail", nullptr, OH_Drawing_RectGetArrayElementFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"rectDestroyArraySuccess", nullptr, OH_Drawing_RectDestroyArraySuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"rectDestroyArrayFail", nullptr, OH_Drawing_RectDestroyArrayFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"roundRectOffsetSuccess", nullptr, OH_Drawing_RoundRectOffsetSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"roundRectOffsetFail", nullptr, OH_Drawing_RoundRectOffsetFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}
void AddFontTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"fontMeasureSingleCharacterWithFeaturesSuccess", nullptr,
        OH_Drawing_FontMeasureSingleCharacterWithFeaturesSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontMeasureSingleCharacterWithFeaturesFail", nullptr,
        OH_Drawing_FontMeasureSingleCharacterWithFeaturesFail, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontMeasureTextSuccess", nullptr, OH_Drawing_FontMeasureTextSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontMeasureTextFail", nullptr, OH_Drawing_FontMeasureTextFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontMeasureTextWithBrushOrPenFail", nullptr, OH_Drawing_FontMeasureTextWithBrushOrPenFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetWidthsBoundsFail", nullptr, OH_Drawing_FontGetWidthsBoundsFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetPosSuccess", nullptr, OH_Drawing_FontGetPosSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetPosFail", nullptr, OH_Drawing_FontGetPosFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetSpacingSuccess", nullptr, OH_Drawing_FontGetSpacingSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetSpacingFail", nullptr, OH_Drawing_FontGetSpacingFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetBoundsFail", nullptr, OH_Drawing_FontGetBoundsFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetPathForGlyphSuccess", nullptr, OH_Drawing_FontGetPathForGlyphSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetPathForGlyphFail", nullptr, OH_Drawing_FontGetPathForGlyphFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetTextPathSuccess", nullptr, OH_Drawing_FontGetTextPathSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontGetTextPathFail", nullptr, OH_Drawing_FontGetTextPathFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontFeaturesCreateSuccess", nullptr, OH_Drawing_FontFeaturesCreateSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontFeaturesAddFeatureSuccess", nullptr, OH_Drawing_FontFeaturesAddFeatureSuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontFeaturesAddFeatureFail", nullptr, OH_Drawing_FontFeaturesAddFeatureFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontFeaturesDestroySuccess", nullptr, OH_Drawing_FontFeaturesDestroySuccess,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"fontFeaturesDestroyFail", nullptr, OH_Drawing_FontFeaturesDestroyFail,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

 napi_value OH_Drawing_RectGetArraySizeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    OH_Drawing_Array* arr = OH_Drawing_RectCreateArray(size);
    size_t arraySize = 0;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RectGetArraySize(arr, &arraySize);
    napi_create_int32(env,  errCode == OH_DRAWING_SUCCESS && arraySize == size, &result);
    
    return result;
}
 napi_value OH_Drawing_RectGetArraySizeFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t arraySize = 0;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RectGetArraySize(nullptr, &arraySize);
    napi_create_int32(env,  errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}
 napi_value OH_Drawing_RectGetArrayElementSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    OH_Drawing_Array* rectArray = OH_Drawing_RectCreateArray(size);
    size_t index = 0;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* prect = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_ErrorCode errCode = OH_Drawing_RectGetArrayElement(rectArray, index, &prect);
    napi_create_int32(env,  errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
 napi_value OH_Drawing_RectGetArrayElementFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    OH_Drawing_Array* rectArray = OH_Drawing_RectCreateArray(size);
    size_t index = 0;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* prect = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_ErrorCode errCode = OH_Drawing_RectGetArrayElement(nullptr, index, &prect);
    napi_create_int32(env,  errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

 napi_value OH_Drawing_RectDestroyArraySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t size = 10;
    OH_Drawing_Array* rectArray = OH_Drawing_RectCreateArray(size);
    OH_Drawing_ErrorCode errCode = OH_Drawing_RectDestroyArray(rectArray);
    napi_create_int32(env,  errCode == OH_DRAWING_SUCCESS, &result);
    
    return result;
}

 napi_value OH_Drawing_RectDestroyArrayFail(napi_env env, napi_callback_info info)
{
    napi_value result;

    OH_Drawing_ErrorCode errCode = OH_Drawing_RectDestroyArray(nullptr);
    napi_create_int32(env,  errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    
    return result;
}

napi_value OH_Drawing_RoundRectOffsetSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    float xRad = 10;
    float yRad = 10;
    OH_Drawing_RoundRect* roundRect = OH_Drawing_RoundRectCreate(rect, xRad, yRad);
    float dx = 10;
    float dy = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RoundRectOffset(roundRect, dx, dy);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
napi_value OH_Drawing_RoundRectOffsetFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    float dx = 10;
    float dy = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_RoundRectOffset(nullptr, dx, dy);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontMeasureSingleCharacterWithFeaturesSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    const char* str = "HellWorld";
    OH_Drawing_FontFeatures* fontFeatures = OH_Drawing_FontFeaturesCreate();
    float textWidth = 10;
    OH_Drawing_ErrorCode errCode = OH_DRAWING_SUCCESS;
    errCode = OH_Drawing_FontMeasureSingleCharacterWithFeatures(font, str, fontFeatures, &textWidth);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
napi_value OH_Drawing_FontMeasureSingleCharacterWithFeaturesFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* str = "HellWorld";
    OH_Drawing_FontFeatures* fontFeatures = OH_Drawing_FontFeaturesCreate();
    float textWidth = 10;
    OH_Drawing_ErrorCode errCode = OH_DRAWING_SUCCESS;
    errCode = OH_Drawing_FontMeasureSingleCharacterWithFeatures(nullptr, str, fontFeatures, &textWidth);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontMeasureTextSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    const char* str = "HelloWorld";
    size_t byteLength = strlen(str);
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(left, top, right, bottom);
    float textWidth = 10;
    OH_Drawing_ErrorCode errCode = OH_DRAWING_SUCCESS;
    errCode = OH_Drawing_FontMeasureText(font, str, byteLength, TEXT_ENCODING_UTF8, bounds, &textWidth);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
napi_value OH_Drawing_FontMeasureTextFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = nullptr;
    const char* str = "HelloWorld";
    size_t byteLth = strlen(str);
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(left, top, right, bottom);
    float tWidth = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontMeasureText(font, str, byteLth, TEXT_ENCODING_UTF8, bounds, &tWidth);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontMeasureTextWithBrushOrPenFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* text = "HelloWorld";
    size_t byteLength = strlen(text);
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* bounds = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float textWidth = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontMeasureTextWithBrushOrPen(nullptr, text, byteLength,
        TEXT_ENCODING_UTF8, brush, pen, bounds, &textWidth);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontGetWidthsBoundsFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint16_t glyphs = 10;
    int count = 1;
    OH_Drawing_Brush* brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen* pen = OH_Drawing_PenCreate();
    float widths = 10;
    OH_Drawing_Array* bounds = nullptr;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetWidthsBounds(nullptr, &glyphs, count, brush, pen, &widths, bounds);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontGetPosSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();

    uint16_t glyphs = 10;
    int count = 1;
    int x = 10;
    int y = 10;
    OH_Drawing_Point* origin = OH_Drawing_PointCreate(x, y);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D;
    points->x = x;
    points->y = y;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetPos(font, &glyphs, count, origin, points);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_FontGetPosFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint16_t glyphs = 10;
    int count = 1;
    int x = 10;
    int y = 10;
    OH_Drawing_Point* origin = OH_Drawing_PointCreate(x, y);
    OH_Drawing_Point2D* points = new OH_Drawing_Point2D;
    points->x = x;
    points->y = y;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetPos(nullptr, &glyphs, count, origin, points);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontGetSpacingSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    float spacing = 0;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetSpacing(font, &spacing);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_FontGetSpacingFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = nullptr;
    float spacing = 0;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetSpacing(font, &spacing);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontGetBoundsFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = nullptr;
    uint16_t* glyphs = nullptr;
    uint32_t count = 10;
    OH_Drawing_Array* bounds = nullptr;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetBounds(font, glyphs, count, bounds);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}
napi_value OH_Drawing_FontGetPathForGlyphSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    uint16_t glyph = 10;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetPathForGlyph(font, glyph, path);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
napi_value OH_Drawing_FontGetPathForGlyphFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = nullptr;
    uint16_t glyph = 10;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetPathForGlyph(font, glyph, path);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}
napi_value OH_Drawing_FontGetTextPathSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = OH_Drawing_FontCreate();
    const char* text = "HelloWorld";
    size_t byteLength = strlen(text);
    float x = 10;
    float y = 10;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetTextPath(font, text, byteLength, TEXT_ENCODING_UTF8, x, y, path);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}
napi_value OH_Drawing_FontGetTextPathFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_Font* font = nullptr;
    const char* text = "HelloWorld";
    size_t byteLength = strlen(text);
    float x = 10;
    float y = 10;
    OH_Drawing_Path* path = OH_Drawing_PathCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontGetTextPath(font, text, byteLength, TEXT_ENCODING_UTF8, x, y, path);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontFeaturesCreateSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
   
    OH_Drawing_FontFeatures* fontFeature = OH_Drawing_FontFeaturesCreate();
    napi_create_int32(env, fontFeature != nullptr, &result);
    return result;
}

napi_value OH_Drawing_FontFeaturesAddFeatureSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_FontFeatures* fontFeature = OH_Drawing_FontFeaturesCreate();
    const char* name = "feature";
    float value = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontFeaturesAddFeature(fontFeature, name, value);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_FontFeaturesAddFeatureFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* name = "feature";
    float value = 10;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontFeaturesAddFeature(nullptr, name, value);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}

napi_value OH_Drawing_FontFeaturesDestroySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_FontFeatures* fontFeature = OH_Drawing_FontFeaturesCreate();
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontFeaturesDestroy(fontFeature);
    napi_create_int32(env, errCode == OH_DRAWING_SUCCESS, &result);
    return result;
}

napi_value OH_Drawing_FontFeaturesDestroyFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_ErrorCode errCode = OH_Drawing_FontFeaturesDestroy(nullptr);
    napi_create_int32(env, errCode == OH_DRAWING_ERROR_INVALID_PARAMETER, &result);
    return result;
}
