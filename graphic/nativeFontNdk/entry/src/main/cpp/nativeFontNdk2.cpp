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

#include "nativeFontNdk.h"

#define SUCCESS 0
#define FAIL (-1)
#define ARR_NUM_0 0
#define ARR_NUM_1 1
#define ARR_NUM_2 2
#define ARR_NUM_3 3
#define ARR_NUM_4 4
#define NUM_20 20
#define NUM_30 30
#define NUM_40 40
#define NUM_50 50
#define DOUBLE_NUM_500 500.0
#define DOUBLE_NUM_10 10.0
#define DOUBLE_NUM_15 15.0

static OH_Drawing_TypographyStyle *typoStyle_ = nullptr;
static OH_Drawing_TextStyle *txtStyle_ = nullptr;
static OH_Drawing_FontCollection *fontCollection_ = nullptr;
static OH_Drawing_TypographyCreate *handler_ = nullptr;
static OH_Drawing_Typography *typography_ = nullptr;
static OH_Drawing_Bitmap *cBitmap_ = nullptr;
static OH_Drawing_Canvas *canvas_ = nullptr;
static OH_Drawing_TypographyCreate *handler2_ = nullptr;
static OH_Drawing_FontCollection *fontCollection2_ = nullptr;
static OH_Drawing_TextStyle *txtStyle2_ = nullptr;
static OH_Drawing_TypographyStyle *typoStyle2_ = nullptr;

static void PrepareCreateTextLine(const std::string &text)
{
    double maxWidth = DOUBLE_NUM_500;
    uint32_t height = NUM_40;
    typoStyle_ = OH_Drawing_CreateTypographyStyle();
    txtStyle_ = OH_Drawing_CreateTextStyle();
    fontCollection_ = OH_Drawing_CreateFontCollection();
    handler_ = OH_Drawing_CreateTypographyHandler(typoStyle_, fontCollection_);
    OH_Drawing_SetTextStyleColor(txtStyle_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = NUM_30;
    OH_Drawing_SetTextStyleFontSize(txtStyle_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle_, FONT_WEIGHT_400);
    bool halfLeading = true;
    OH_Drawing_SetTextStyleHalfLeading(txtStyle_, halfLeading);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler_, txtStyle_);
    OH_Drawing_TypographyHandlerAddText(handler_, text.c_str());
    OH_Drawing_TypographyHandlerPopTextStyle(handler_);
    typography_ = OH_Drawing_CreateTypography(handler_);
    OH_Drawing_TypographyLayout(typography_, maxWidth);
    double position[2] = {DOUBLE_NUM_10, DOUBLE_NUM_15};
    cBitmap_ = OH_Drawing_BitmapCreate();
    OH_Drawing_BitmapFormat cFormat {COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    uint32_t width = NUM_20;
    OH_Drawing_BitmapBuild(cBitmap_, width, height, &cFormat);
    canvas_ = OH_Drawing_CanvasCreate();
    OH_Drawing_CanvasBind(canvas_, cBitmap_);
    OH_Drawing_CanvasClear(canvas_, OH_Drawing_ColorSetArgb(0xFF, 0xFF, 0xFF, 0xFF));
    OH_Drawing_TypographyPaint(typography_, canvas_, position[0], position[1]);
}

static void TearDown()
{
    if (canvas_ != nullptr) {
        OH_Drawing_CanvasDestroy(canvas_);
        canvas_ = nullptr;
    }
    if (typography_ != nullptr) {
        OH_Drawing_DestroyTypography(typography_);
        typography_ = nullptr;
    }
    if (handler_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler_);
        handler_ = nullptr;
    }
    if (txtStyle_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle_);
        txtStyle_ = nullptr;
    }
    if (typoStyle_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle_);
        typoStyle_ = nullptr;
    }
    if (cBitmap_ != nullptr) {
        OH_Drawing_BitmapDestroy(cBitmap_);
        cBitmap_ = nullptr;
    }
    if (fontCollection_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection_);
        fontCollection_ = nullptr;
    }
}

static void PrepareTypographyCreate(const char *text)
{
    fontCollection2_ = OH_Drawing_CreateFontCollection();
    typoStyle2_ = OH_Drawing_CreateTypographyStyle();
    handler2_ = OH_Drawing_CreateTypographyHandler(typoStyle2_, fontCollection2_);
    txtStyle2_ = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle2_, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = NUM_30;
    OH_Drawing_SetTextStyleFontSize(txtStyle2_, fontSize);
    OH_Drawing_SetTextStyleFontWeight(txtStyle2_, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(txtStyle2_, TEXT_BASELINE_ALPHABETIC);
    const char *fontFamilies[] = {"Roboto"};
    OH_Drawing_SetTextStyleFontFamilies(txtStyle2_, 1, fontFamilies);
    OH_Drawing_TypographyHandlerPushTextStyle(handler2_, txtStyle2_);
    if (text != nullptr) {
        OH_Drawing_TypographyHandlerAddText(handler2_, text);
    }
}

static void TypographyTearDown()
{
    if (handler2_ != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler2_);
        handler2_ = nullptr;
    }
    if (txtStyle2_ != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle2_);
        txtStyle2_ = nullptr;
    }
    if (fontCollection2_ != nullptr) {
        OH_Drawing_DestroyFontCollection(fontCollection2_);
        fontCollection2_ = nullptr;
    }
    if (typoStyle2_ != nullptr) {
        OH_Drawing_DestroyTypographyStyle(typoStyle2_);
        typoStyle2_ = nullptr;
    }
}

napi_value OHDrawingFontGetPathForGlyph001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_Drawing_FontSetTextSize(font, NUM_50);
    uint16_t glyphsNotExist = 65535;
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if ((path != nullptr) &&
        (OH_Drawing_FontGetPathForGlyph(font, glyphsNotExist, path) == OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingFontGetPathForGlyph002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *str = "hello world";
    uint32_t count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    if (strlen(str) == count) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if ((path != nullptr) &&
        (OH_Drawing_FontGetPathForGlyph(nullptr, glyphs[0], path) == OH_DRAWING_ERROR_INVALID_PARAMETER) &&
        (OH_Drawing_FontGetPathForGlyph(font, glyphs[0], nullptr) == OH_DRAWING_ERROR_INVALID_PARAMETER)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);

    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingFontGetPathForGlyph003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *space = " ";
    uint32_t count = OH_Drawing_FontCountText(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    if (strlen(space) == count) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, space, strlen(space), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if ((path != nullptr) &&
        (OH_Drawing_FontGetPathForGlyph(font, glyphs[0], path) == OH_DRAWING_SUCCESS) &&
        (OH_Drawing_PathGetLength(path, false) == 0) &&
        (OH_Drawing_PathIsClosed(path, false) == false)) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);

    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_FontDestroy(font);
    return result;
}

napi_value OHDrawingFontGetPathForGlyph004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    OH_Drawing_FontSetTextSize(font, NUM_50);
    const char *str = "helloworld";
    uint32_t count = OH_Drawing_FontCountText(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8);
    if (strlen(str) == count) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    uint16_t glyphs[count];
    OH_Drawing_FontTextToGlyphs(font, str, strlen(str), OH_Drawing_TextEncoding::TEXT_ENCODING_UTF8,
        glyphs, count);
    for (int i = 0; i < count; i++) {
        OH_Drawing_Path *path = OH_Drawing_PathCreate();
        if ((path != nullptr) &&
            (OH_Drawing_FontGetPathForGlyph(font, glyphs[i], path) == OH_DRAWING_SUCCESS) &&
            (OH_Drawing_PathGetLength(path, false) > 0) &&
            (OH_Drawing_PathIsClosed(path, false) == true)) {
            napi_create_int32(env, SUCCESS, &result3);
        } else {
            napi_create_int32(env, FAIL, &result3);
        }
        napi_set_element(env, result, ARR_NUM_2, result3);
        if (path != nullptr) {
            OH_Drawing_PathDestroy(path);
        }
    }
    OH_Drawing_FontDestroy(font);
    return result;
}