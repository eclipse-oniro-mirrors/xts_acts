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

#include <vector>
#include "nativeFontNdk.h"

#define SUCCESS 0
#define FAIL (-1)
#define ARR_NUM_0 0
#define ARR_NUM_1 1
#define ARR_NUM_2 2
#define ARR_NUM_3 3
#define ARR_NUM_4 4
#define ARR_NUM_5 5
#define NUM_20 20
#define NUM_30 30
#define NUM_40 40
#define NUM_50 50
#define DOUBLE_NUM_500 500.0
#define DOUBLE_NUM_10 10.0
#define DOUBLE_NUM_15 15.0
#define NEGATIVE_NUM_1 (-1)
#define NEGATIVE_NUM_100 (-100)
#define NUM_0 0
#define NUM_1 1
#define NUM_5 5
#define NUM_5000 5000
#define NUM_10000 10000

namespace {
    const double DEFAULT_FONT_SIZE = 50;
    const double MAX_WIDTH = 800.0;
}

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

static int32_t GetUnresolvedGlyphCount(const void* text, size_t length, OH_Drawing_TextEncoding encode)
{
    auto typoStyle = OH_Drawing_CreateTypographyStyle();
    auto handler = OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_GetFontCollectionGlobalInstance());
    OH_Drawing_TypographyHandlerAddEncodedText(handler, text, length, encode);
    auto typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, 100.0f);
    int32_t unresolved = OH_Drawing_TypographyGetUnresolvedGlyphsCount(typography);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return unresolved;
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

static int SetFontSize(OH_Drawing_TextStyle *txtStyle, double size, int weight, OH_Drawing_TextBadgeType badge)
{
    OH_Drawing_SetTextStyleFontSize(txtStyle, size);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, weight);
    OH_Drawing_SetTextStyleBadgeType(txtStyle, badge);
    return 0;
}

static int DestoryTypographyTextStyle(OH_Drawing_Typography *typography, OH_Drawing_TypographyCreate *handler,
    OH_Drawing_TextStyle *txtStyle)
{
    if (typography != nullptr) {
        OH_Drawing_DestroyTypography(typography);
        typography = nullptr;
    }

    if (handler != nullptr) {
        OH_Drawing_DestroyTypographyHandler(handler);
        handler = nullptr;
    }

    if (txtStyle != nullptr) {
        OH_Drawing_DestroyTextStyle(txtStyle);
        txtStyle = nullptr;
    }

    return 0;
}

napi_value OHDrawingSetTextStyleBadgeType001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_TypographyCreate *superTxtHandler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());

    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF));
    SetFontSize(txtStyle, DEFAULT_FONT_SIZE, FONT_WEIGHT_400, OH_Drawing_TextBadgeType::TEXT_BADGE_NONE);

    OH_Drawing_TextStyle *superTxtStyle = OH_Drawing_CreateTextStyle();
    if (superTxtStyle != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);
    SetFontSize(superTxtStyle, DEFAULT_FONT_SIZE, FONT_WEIGHT_400, OH_Drawing_TextBadgeType::TEXT_SUPERSCRIPT);

    const char *text = "OpenHarmony";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    if (typography != nullptr) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

    OH_Drawing_TypographyHandlerPushTextStyle(superTxtHandler, superTxtStyle);
    OH_Drawing_TypographyHandlerAddText(superTxtHandler, text);
    OH_Drawing_Typography *superTxtTypography = OH_Drawing_CreateTypography(superTxtHandler);
    if (superTxtTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    OH_Drawing_TypographyLayout(superTxtTypography, MAX_WIDTH);

    DestoryTypographyTextStyle(typography, handler, txtStyle);
    DestoryTypographyTextStyle(superTxtTypography, superTxtHandler, superTxtStyle);
    return result;
}

napi_value OHDrawingSetTextStyleBadgeType002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_2, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_TypographyCreate *subTxtHandler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());

    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0xFF));
    OH_Drawing_SetTextStyleFontSize(txtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(txtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBadgeType(txtStyle, OH_Drawing_TextBadgeType::TEXT_BADGE_NONE);

    OH_Drawing_TextStyle *subTxtStyle = OH_Drawing_CreateTextStyle();
    if (subTxtStyle != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);
    OH_Drawing_SetTextStyleFontSize(subTxtStyle, DEFAULT_FONT_SIZE);
    OH_Drawing_SetTextStyleFontWeight(subTxtStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBadgeType(subTxtStyle, OH_Drawing_TextBadgeType::TEXT_SUBSCRIPT);
    
    const char *text = "ÄãºÃÊÀ½ç";
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TypographyLayout(typography, MAX_WIDTH);

    OH_Drawing_TypographyHandlerPushTextStyle(subTxtHandler, subTxtStyle);
    OH_Drawing_TypographyHandlerAddText(subTxtHandler, text);
    OH_Drawing_Typography *subTxtTypography = OH_Drawing_CreateTypography(subTxtHandler);
    if (subTxtTypography != nullptr) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    OH_Drawing_TypographyLayout(subTxtTypography, MAX_WIDTH);

    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTextStyle(txtStyle);

    OH_Drawing_DestroyTypography(subTxtTypography);
    OH_Drawing_DestroyTypographyHandler(subTxtHandler);
    OH_Drawing_DestroyTextStyle(subTxtStyle);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_5, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;
    napi_value result5 = nullptr;
    // Basic ASCII characters
    const char ascii[] = u8"Hello World";
    if (GetUnresolvedGlyphCount(ascii, sizeof(ascii), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);
    // Non-ASCII characters (Chinese)
    const char chinese[] = u8"你好世界";
    if (GetUnresolvedGlyphCount(chinese, sizeof(chinese), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);
    // Special characters
    const char tabsNewline[] = u8"Tabs\tNewline\n";
    if (GetUnresolvedGlyphCount(tabsNewline, sizeof(tabsNewline), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    // 4-byte emoji characters
    const char emoji[] = u8"😊🌍🎉";
    if (GetUnresolvedGlyphCount(emoji, sizeof(emoji), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result4);
    } else {
        napi_create_int32(env, FAIL, &result4);
    }
    napi_set_element(env, result, ARR_NUM_3, result4);
    // Mixed case and symbols
    const char mixedCaseSymbols[] = u8"Aa1!Ωπ";
    if (GetUnresolvedGlyphCount(mixedCaseSymbols, sizeof(mixedCaseSymbols), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result5);
    } else {
        napi_create_int32(env, FAIL, &result5);
    }
    napi_set_element(env, result, ARR_NUM_4, result5);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Invalid continuation bytes
    const char invalid1[] = "abc\x80\xff";
    GetUnresolvedGlyphCount(invalid1, sizeof(invalid1), TEXT_ENCODING_UTF8);

    // Truncated multi-byte sequence
    const char invalid2[] = u8"正常\xE6\x97继续";
    GetUnresolvedGlyphCount(invalid2, sizeof(invalid2), TEXT_ENCODING_UTF8);

    // Overlong encoding
    const char invalid3[] = "\xF0\x82\x82\xAC"; // Overlong € symbol
    GetUnresolvedGlyphCount(invalid3, sizeof(invalid3), TEXT_ENCODING_UTF8);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_4, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;

    // Basic BMP characters
    const char16_t ascii16[] = u"Hello World";
    if (GetUnresolvedGlyphCount(ascii16, sizeof(ascii16), TEXT_ENCODING_UTF16) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    // Non-BMP characters (emoji)
    const char16_t emoji16[] = u"😀🌈";
    if (GetUnresolvedGlyphCount(emoji16, sizeof(emoji16), TEXT_ENCODING_UTF16) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    // RTL text with control characters
    const char16_t rtlText16[] = u"\x202E右到左文本";
    if (GetUnresolvedGlyphCount(rtlText16, sizeof(rtlText16), TEXT_ENCODING_UTF16) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);

    // Combining characters
    const char16_t combiningChars16[] = u"A\u0300\u0301";
    if (GetUnresolvedGlyphCount(combiningChars16, sizeof(combiningChars16), TEXT_ENCODING_UTF16) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result4);
    } else {
        napi_create_int32(env, FAIL, &result4);
    }
    napi_set_element(env, result, ARR_NUM_3, result4);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Unpaired high surrogate
    const char16_t invalid1[] = u"\xD800\x0041";
    GetUnresolvedGlyphCount(invalid1, sizeof(invalid1), TEXT_ENCODING_UTF16);

    // Unpaired low surrogate
    const char16_t invalid2[] = u"\xDC00";
    GetUnresolvedGlyphCount(invalid2, sizeof(invalid2), TEXT_ENCODING_UTF16);

    // Swapped surrogate pair
    const char16_t invalid3[] = u"\xDC00\xD800";
    GetUnresolvedGlyphCount(invalid3, sizeof(invalid3), TEXT_ENCODING_UTF16);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    // Basic ASCII range
    const char32_t ascii32[] = U"ASCII Text!";
    if (GetUnresolvedGlyphCount(ascii32, sizeof(ascii32), TEXT_ENCODING_UTF32) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    // Non-BMP characters
    const char32_t emoji32[] = { 0x1F600, 0x1F308, NUM_0 }; // 😀🌈
    if (GetUnresolvedGlyphCount(emoji32, sizeof(emoji32), TEXT_ENCODING_UTF32) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    // Maximum valid code point
    const char32_t maxUnicode32[] = { 0x10FFFF };
    if (GetUnresolvedGlyphCount(maxUnicode32, sizeof(maxUnicode32), TEXT_ENCODING_UTF32) == NUM_1) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    // Code point beyond U+10FFFF
    const char32_t invalid1[] = { 0x110000 };
    GetUnresolvedGlyphCount(invalid1, sizeof(invalid1), TEXT_ENCODING_UTF32);

    // Surrogate code points
    const char32_t invalid2[] = { 0xD800, 0xDFFF };
    GetUnresolvedGlyphCount(invalid2, sizeof(invalid2), TEXT_ENCODING_UTF32);

    // Negative value
    const int invalid3[] = { NEGATIVE_NUM_100 };
    GetUnresolvedGlyphCount(invalid3, sizeof(invalid3), TEXT_ENCODING_UTF32);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_4, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_value result4 = nullptr;

    // Empty input with different encodings
    if ((GetUnresolvedGlyphCount("", NUM_0, TEXT_ENCODING_UTF8) == NEGATIVE_NUM_1) &&
        (GetUnresolvedGlyphCount(u"", NUM_0, TEXT_ENCODING_UTF16) == NEGATIVE_NUM_1) &&
        (GetUnresolvedGlyphCount(U"", NUM_0, TEXT_ENCODING_UTF32) == NEGATIVE_NUM_1)) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    // Null pointer with zero length
    if (GetUnresolvedGlyphCount(nullptr, NUM_0, TEXT_ENCODING_UTF8) == NEGATIVE_NUM_1) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    // Maximum code point boundary
    const char32_t boundary1[] = { 0x10FFFF, 0x0000 };
    if (GetUnresolvedGlyphCount(boundary1, sizeof(boundary1), TEXT_ENCODING_UTF32) == NUM_1) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);

    // Minimum code point boundary
    const char32_t boundary2[] = { 0x0000 };
    if (GetUnresolvedGlyphCount(boundary2, sizeof(boundary2), TEXT_ENCODING_UTF32) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result4);
    } else {
        napi_create_int32(env, FAIL, &result4);
    }
    napi_set_element(env, result, ARR_NUM_3, result4);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText008(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    // Large UTF-8 text
    std::vector<char> bigUtf8(NUM_10000, 'A');
    if (GetUnresolvedGlyphCount(bigUtf8.data(), bigUtf8.size(), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    // Large UTF-16 text with surrogate pairs
    std::vector<char16_t> bigUtf16;
    for (int i = NUM_0; i < NUM_10000; ++i) {
        bigUtf16.push_back(0xD83D);
        bigUtf16.push_back(0xDE00);
    }
    if (GetUnresolvedGlyphCount(bigUtf16.data(), bigUtf16.size(), TEXT_ENCODING_UTF16) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    // Mixed valid/invalid UTF-32 data
    std::vector<char32_t> mixed_utf32(NUM_10000, 0x1F600);
    mixed_utf32[NUM_5000] = 0x110000; // Insert invalid code point
    if (GetUnresolvedGlyphCount(mixed_utf32.data(), mixed_utf32.size(), TEXT_ENCODING_UTF32) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    return result;
}

napi_value OHDrawingTypographyHandlerAddEncodedText009(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_create_array_with_length(env, ARR_NUM_3, &result);
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;

    // Invalid encoding type
    const char testStr[] = "test";
    if (GetUnresolvedGlyphCount(testStr, sizeof(testStr), TEXT_ENCODING_GLYPH_ID) == NEGATIVE_NUM_1) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUM_0, result1);

    // Mismatched encoding and data
    const char16_t utf16Data[] = u"test";
    if (GetUnresolvedGlyphCount(utf16Data, sizeof(utf16Data), TEXT_ENCODING_UTF8) == NUM_0) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUM_1, result2);

    // Null pointer with non-zero length
    if (GetUnresolvedGlyphCount(nullptr, NUM_5, TEXT_ENCODING_UTF16) == NEGATIVE_NUM_1) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUM_2, result3);
    return result;
}
