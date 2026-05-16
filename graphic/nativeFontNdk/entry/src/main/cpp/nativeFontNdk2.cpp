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
#include "common.h"
#include <hilog/log.h>
#include <vector>
#include <codecvt>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <cstdio>
#include <cstdlib>
#include <cstring>

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
    // 测试常量
    const double DEFAULT_FONT_SIZE = 50;
    const double MAX_WIDTH = 800.0;
    const int ZERO_MINUS_ONE = -1;
    const int MIN_FONT_WEIGHT = 100;
    const int MAX_FONT_WEIGHT = 1000;
    const int TEST_FONT_SIZE = 12;
    const double TEST_LINE_HEIGHT = 1.5;
    const int TEST_TEXT_ALIGN = 1;
    const int INVALID_ATTRIBUTE_ID = 9999;
    const int INVALID_VALUE = -1;
    constexpr const char* TEST_FONT_FILE_PATH = "/system/fonts/HarmonyOS_Sans_SC.ttf";
    constexpr const char* SYMBOL_FILE = "/system/fonts/HMSymbolVF.ttf";
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

bool NearEqual(const double left, const double right)
{
    constexpr double epsilon = 0.001f;
    return (std::abs(left - right) <= epsilon);
}

// read font file to memory buffer
static bool ReadFontFileToBuffer(const char* filePath, void** outData, size_t* outSize)
{
    if (filePath == nullptr || outData == nullptr || outSize == nullptr) {
        return false;
    }

    FILE* fp = fopen(filePath, "rb");
    if (fp == nullptr) {
        return false;
    }

    fseek(fp, 0, SEEK_END);
    *outSize = ftell(fp);
    fseek(fp, 0, SEEK_SET);

    *outData = malloc(*outSize);
    if (*outData == nullptr) {
        fclose(fp);
        return false;
    }

    size_t readSize = fread(*outData, 1, *outSize, fp);
    fclose(fp);
    return (readSize == *outSize);
}

std::string ConvertUtf16ToUtf8(const uint8_t* utf16Data, uint32_t utf16Len)
{
    std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> converter;
    std::u16string utf16String(reinterpret_cast<const char16_t*>(utf16Data), utf16Len / 2);
    return converter.to_bytes(utf16String);
}

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

napi_value OHDrawingSetTypographyStyleAttributeDouble001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double lineSpacingSet = 30.0f;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        OH_Drawing_TypographyStyleAttributeId::TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, lineSpacingSet);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double lineSpacingGet = 0.0f;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        OH_Drawing_TypographyStyleAttributeId::TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, &lineSpacingGet);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = NearEqual(lineSpacingGet, lineSpacingSet);
    NAPI_ASSERT(env, isEqual == true, "lineSpacingGet != lineSpacingSet");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeInt001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle* typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle == nullptr, create error");
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, FONT_WIDTH_SEMI_EXPANDED);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    int outResult = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, &outResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = outResult == FONT_WIDTH_SEMI_EXPANDED;
    NAPI_ASSERT(env, isEqual == true, "widthGet != widthSet");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeDouble001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    double maxLineHeight = 30.0f;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, maxLineHeight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double getResult = 0;
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &getResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = NearEqual(getResult, maxLineHeight);
    NAPI_ASSERT(env, isEqual == true,
        "TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM get != TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM set");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeDouble002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle* txtStyle = nullptr;
    double maxLineHeight = 30.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, maxLineHeight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INVALID_PARAMETER,
        "SetTextStyleAttributeDouble errorCode != OH_DRAWING_ERROR_INVALID_PARAMETER");
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &maxLineHeight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INVALID_PARAMETER,
        "GetTextStyleAttributeDouble errorCode != OH_DRAWING_ERROR_INVALID_PARAMETER");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeDouble003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    double value = 3.0;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE, value);
    // _I_ in ID general tip this is a int type ID, but function name has double word only use _D_ ID
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH,
        "SetTextStyleAttributeDouble I_LINE_HEIGHT_STYLE errorCode != OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH");
    errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_FONT_WIDTH, value);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH,
        "SetTextStyleAttributeDouble I_FONT_WIDTH errorCode != OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH");
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(txtStyle, TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE, &value);
    // _I_ in ID general tip this is a int type ID, but function name has double word only use _D_ ID
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH,
        "GetTextStyleAttributeDouble I_LINE_HEIGHT_STYLE errorCode != OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH");
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_FONT_WIDTH, &value);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH,
        "GetTextStyleAttributeDouble  I_FONT_WIDTH errorCode != OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeDouble004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    double maxLineHeight = 30.0f;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, maxLineHeight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double getResult = 0;
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, &getResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = NearEqual(getResult, maxLineHeight);
    NAPI_ASSERT(env, isEqual == true,
        "TEXT_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM get != TEXT_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM set");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeInt001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle* txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE,
        OH_Drawing_LineHeightStyle::TEXT_LINE_HEIGHT_BY_FONT_HEIGHT);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTextStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    int outResult = 0;
    errorCode = OH_Drawing_GetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE, &outResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTextStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = outResult == TEXT_LINE_HEIGHT_BY_FONT_HEIGHT;
    NAPI_ASSERT(env, isEqual == true, "TEXT_LINE_HEIGHT_BY_FONT_HEIGHT get != TEXT_LINE_HEIGHT_BY_FONT_HEIGHT set");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorsFromPath001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char *invalidPath = strdup("");
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromPath(invalidPath);
    NAPI_ASSERT(env, fontFullDescArr == nullptr, "trans invalidPath, fontFullDescArr != nullptr, has error");
    size_t num = OH_Drawing_GetDrawingArraySize(fontFullDescArr);
    NAPI_ASSERT(env, num == 0, "num != 0, has error");
    int index = 1;
    const OH_Drawing_FontFullDescriptor *desc1 = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, index);
    NAPI_ASSERT(env, desc1 == nullptr, "desc1 != nullptr, has error");
    OH_Drawing_DestroyFontFullDescriptors(fontFullDescArr);
    free(invalidPath);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorsFromPath002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // Test empty path
    const char* emptyPath = "";
    OH_Drawing_Array* fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(emptyPath);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    // Test NULL path
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(nullptr);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    // Test non-existent path
    const char* invalidPath = "/invalid/path/to/font.ttf";
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(invalidPath);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorsFromPath003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // Create long path safely
    std::string longPath(1023, 'a'); // Create string with 1023 'a' characters
    longPath += '\0'; // Null-terminate

    OH_Drawing_Array* fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(longPath.c_str());
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    // Test path with special characters
    const char* specialPath = "/system/fonts/test\0null.ttf";
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(specialPath);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    // Test relative path
    const char* relativePath = "./font.ttf";
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(relativePath);
    // Relative path may be valid or invalid
    if (fontDescArray != nullptr) {
        OH_Drawing_DestroyFontFullDescriptors(fontDescArray);
    }
    
    // Test path without permission
    const char* noPermissionPath = "/proc/kallsyms";
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(noPermissionPath);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    // Test non-font file
    const char* notFontFile = "/system/etc/hosts";
    fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(notFontFile);
    NAPI_ASSERT_NO_MES(fontDescArray == nullptr);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

bool StrcmpUtf8(OH_Drawing_String result, char *expect)
{
    return strcmp(ConvertUtf16ToUtf8(result.strData, result.strLen).c_str(), expect) == 0;
}

napi_value OHDrawingGetFontFullDescriptorAttributeString001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char *validPath = strdup("/system/fonts/HarmonyOS_Sans.ttf");
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromPath(validPath);
    NAPI_ASSERT(env, fontFullDescArr != nullptr, "fontFullDescArr");
    NAPI_ASSERT(env, OH_Drawing_GetDrawingArraySize(fontFullDescArr) == 1,
        "OH_Drawing_GetDrawingArraySize(fontFullDescArr) != 1");

    const OH_Drawing_FontFullDescriptor *desc = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, 0);
    NAPI_ASSERT(env, desc != nullptr, "desc");
    const OH_Drawing_FontFullDescriptor *desc1 = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, 1);
    NAPI_ASSERT(env, desc1 == nullptr, "desc1");

    OH_Drawing_String path = {.strData = nullptr, .strLen = 0};
    OH_Drawing_ErrorCode errorCode0 =
        OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_PATH, &path);
    NAPI_ASSERT(env, errorCode0 == OH_DRAWING_SUCCESS, "errorCode0");
    NAPI_ASSERT(env, StrcmpUtf8(path, validPath), "");

    OH_Drawing_String postscriptName = {.strData = nullptr, .strLen = 0};
    errorCode0 = OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_POSTSCRIPT_NAME,
        &postscriptName);
    NAPI_ASSERT(env, errorCode0 == OH_DRAWING_SUCCESS, "errorCode1");
    char *realPostscriptName = strdup("HarmonyOS_Sans");
    NAPI_ASSERT(env, StrcmpUtf8(postscriptName, realPostscriptName), "");

    char *realFullName = strdup("HarmonyOS Sans");
    OH_Drawing_String fullName = {.strData = nullptr, .strLen = 0};
    errorCode0 = OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_FULL_NAME, &fullName);
    NAPI_ASSERT(env, errorCode0 == OH_DRAWING_SUCCESS, "errorCode2");
    NAPI_ASSERT(env, StrcmpUtf8(fullName, realFullName), "");

    char *realFamilyName = strdup("HarmonyOS Sans");
    OH_Drawing_String familyName = {.strData = nullptr, .strLen = 0};
    errorCode0 =
        OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_FAMILY_NAME, &familyName);
    NAPI_ASSERT(env, errorCode0 == OH_DRAWING_SUCCESS, "errorCode3");
    NAPI_ASSERT(env, StrcmpUtf8(familyName, realFamilyName), "");

    char *realSubFamilyName = strdup("Regular");
    OH_Drawing_String subFamilyName = {.strData = nullptr, .strLen = 0};
    errorCode0 = OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_S_SUB_FAMILY_NAME,
        &subFamilyName);
    ASSERT_EQ(errorCode0, OH_DRAWING_SUCCESS);
    NAPI_ASSERT(env, errorCode0 == 0, "errorCode4");
    NAPI_ASSERT(env, StrcmpUtf8(subFamilyName, realSubFamilyName), "");

    OH_Drawing_DestroyFontFullDescriptors(fontFullDescArr);
    free(validPath);
    free(realPostscriptName);
    free(realFullName);
    free(realFamilyName);
    free(realSubFamilyName);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorAttributeString002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_String str;
    OH_Drawing_ErrorCode ret = OH_Drawing_GetFontFullDescriptorAttributeString(
        nullptr, FULL_DESCRIPTOR_ATTR_S_PATH, &str);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INCORRECT_PARAMETER);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorAttributeString003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char *validPath = strdup("/system/fonts/HarmonyOS_Sans.ttf");
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromPath(validPath);
    NAPI_ASSERT(env, fontFullDescArr != nullptr, "fontFullDescArr");
    NAPI_ASSERT(env, OH_Drawing_GetDrawingArraySize(fontFullDescArr) == 1,
        "OH_Drawing_GetDrawingArraySize(fontFullDescArr) != 1");

    const OH_Drawing_FontFullDescriptor *desc = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, 0);
    NAPI_ASSERT(env, desc != nullptr, "desc");
    OH_Drawing_String path = {.strData = nullptr, .strLen = 0};
    OH_Drawing_ErrorCode errorCode0 =
        OH_Drawing_GetFontFullDescriptorAttributeString(desc, FULL_DESCRIPTOR_ATTR_B_SYMBOLIC, &path);
    NAPI_ASSERT(env, errorCode0 == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH, "");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char *validPath = strdup("/system/fonts/HarmonyOS_Sans.ttf");
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromPath(validPath);
    NAPI_ASSERT(env, fontFullDescArr != nullptr, "fontFullDescArr");
    NAPI_ASSERT(env, OH_Drawing_GetDrawingArraySize(fontFullDescArr) == 1, "");

    const OH_Drawing_FontFullDescriptor *desc =
        OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, ZERO_MINUS_ONE);
    NAPI_ASSERT(env, desc == nullptr, "index should >= 0");
    OH_Drawing_DestroyFontFullDescriptors(fontFullDescArr);
    free(validPath);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorAttributeInt001(napi_env env, napi_callback_info info)
{
    char *validPath = strdup("/system/fonts/HMSymbolVF.ttf");
    // Assign it an initial value
    int weight = -1;
    int italic = -1;
    bool mono = false;
    bool symblic = false;
    constexpr int initialValue = -1;
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromPath(validPath);
    NAPI_ASSERT(env, fontFullDescArr != nullptr, "fontFullDescArr");
    const OH_Drawing_FontFullDescriptor *desc = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, 0);

    OH_Drawing_ErrorCode errorCode = OH_Drawing_GetFontFullDescriptorAttributeInt(desc, FULL_DESCRIPTOR_ATTR_S_PATH,
        &weight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH, "errorCode");
    NAPI_ASSERT(env, weight == initialValue, "weight");
    errorCode = OH_Drawing_GetFontFullDescriptorAttributeBool(desc, FULL_DESCRIPTOR_ATTR_I_WEIGHT, &symblic);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH, "errorCode1");
    NAPI_ASSERT(env, symblic == false, "symblic");

    errorCode = OH_Drawing_GetFontFullDescriptorAttributeInt(nullptr, FULL_DESCRIPTOR_ATTR_I_ITALIC, &italic);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER, "errorCode2");
    NAPI_ASSERT(env, weight == initialValue, "weight1");
    errorCode = OH_Drawing_GetFontFullDescriptorAttributeBool(nullptr, FULL_DESCRIPTOR_ATTR_B_SYMBOLIC, &mono);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER, "errorCode3");

    errorCode = OH_Drawing_GetFontFullDescriptorAttributeInt(desc, FULL_DESCRIPTOR_ATTR_I_ITALIC, nullptr);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER, "errorCode4");
    errorCode = OH_Drawing_GetFontFullDescriptorAttributeBool(desc, FULL_DESCRIPTOR_ATTR_B_SYMBOLIC, nullptr);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_ERROR_INCORRECT_PARAMETER, "errorCode5");

    OH_Drawing_DestroyFontFullDescriptors(fontFullDescArr);
    free(validPath);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

// Normal successful case
napi_value OHDrawingGetFontFullDescriptorAttributeInt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    // 1. Get valid font descriptors
    const char* fontPath = "/system/fonts/HarmonyOS_Sans.ttf";
    OH_Drawing_Array* fontDescArray = OH_Drawing_GetFontFullDescriptorsFromPath(fontPath);
    
    if (fontDescArray == nullptr) {
        napi_create_int32(env, SUCCESS, &result);
        return result;
    }
    
    // 2. Get first descriptor
    const OH_Drawing_FontFullDescriptor* desc =
        OH_Drawing_GetFontFullDescriptorByIndex(fontDescArray, 0);
    NAPI_ASSERT(env, desc != nullptr, "Failed to get font descriptor");
    
    // 3. Test getting font weight (should succeed)
    int fontWeight = 0;
    bool getResult = OH_Drawing_GetFontFullDescriptorAttributeInt(
        desc, FULL_DESCRIPTOR_ATTR_I_WEIGHT, &fontWeight);
    
    NAPI_ASSERT(env, getResult == OH_DRAWING_SUCCESS, "GetFontFullDescriptorAttributeInt failed");
    NAPI_ASSERT(env, fontWeight >= MIN_FONT_WEIGHT && fontWeight <= MAX_FONT_WEIGHT,
        "Font weight out of valid range");
    
    // 4. Test getting width (should succeed)
    int fontWidth = 0;
    getResult = OH_Drawing_GetFontFullDescriptorAttributeInt(
        desc, FULL_DESCRIPTOR_ATTR_I_WIDTH, &fontWidth);
    
    NAPI_ASSERT(env, getResult == OH_DRAWING_SUCCESS, "Failed to get font width");
    
    OH_Drawing_DestroyFontFullDescriptors(fontDescArray);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorFromStream001(napi_env env, napi_callback_info info)
{
    std::vector<char> content;
    OH_Drawing_Array* fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromStream(nullptr, 1);
    NAPI_ASSERT(env, fontFullDescArr == nullptr, "");
    fontFullDescArr = OH_Drawing_GetFontFullDescriptorsFromStream(content.data(), content.size());
    NAPI_ASSERT(env, fontFullDescArr == nullptr, "");
    size_t num = OH_Drawing_GetDrawingArraySize(fontFullDescArr);
    NAPI_ASSERT(env, num == 0, "");

    const OH_Drawing_FontFullDescriptor* desc = OH_Drawing_GetFontFullDescriptorByIndex(fontFullDescArr, 0);
    NAPI_ASSERT(env, desc == nullptr, "");
    NAPI_ASSERT_NO_MES(desc == nullptr);

    OH_Drawing_DestroyFontFullDescriptors(fontFullDescArr);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

/**
 * 测试用例：正常场景-传入合法字体二进制数据
 * 参数：data=有效TTF数据指针，size=文件实际大小
 * 返回值：非NULL数组
 */
napi_value OHDrawingGetFontFullDescriptorFromStream002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    void* fontData = nullptr;
    size_t fontSize = 0;

    // 适配NAPI_ASSERT_NO_MES：仅传断言条件，无消息参数
    bool readRet = ReadFontFileToBuffer(TEST_FONT_FILE_PATH, &fontData, &fontSize);
    NAPI_ASSERT_NO_MES(readRet == true);
    NAPI_ASSERT_NO_MES(fontData != nullptr && fontSize > 0);

    // 调用目标API
    OH_Drawing_Array* fontDescArr = OH_Drawing_GetFontFullDescriptorsFromStream(fontData, fontSize);
    NAPI_ASSERT_NO_MES(fontDescArr != nullptr);

    // 校验数组属性
    size_t descCount = OH_Drawing_GetDrawingArraySize(fontDescArr);
    NAPI_ASSERT_NO_MES(descCount > 0);

    // 校验描述符
    const OH_Drawing_FontFullDescriptor* desc = OH_Drawing_GetFontFullDescriptorByIndex(fontDescArr, 0);
    NAPI_ASSERT_NO_MES(desc != nullptr);

    // 资源释放
    OH_Drawing_DestroyFontFullDescriptors(fontDescArr);
    free(fontData);

    // 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetFontFullDescriptorFromStream003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    void* fontData = nullptr;
    size_t fontSize = 0;

    bool readRet = ReadFontFileToBuffer(SYMBOL_FILE, &fontData, &fontSize);
    NAPI_ASSERT_NO_MES(readRet == true);
    NAPI_ASSERT_NO_MES(fontData != nullptr && fontSize > 0);

    // 调用目标API
    OH_Drawing_Array* fontDescArr = OH_Drawing_GetFontFullDescriptorsFromStream(fontData, fontSize);
    NAPI_ASSERT_NO_MES(fontDescArr != nullptr);

    // 校验数组属性
    size_t descCount = OH_Drawing_GetDrawingArraySize(fontDescArr);
    NAPI_ASSERT_NO_MES(descCount > 0);

    // 校验描述符
    const OH_Drawing_FontFullDescriptor* desc = OH_Drawing_GetFontFullDescriptorByIndex(fontDescArr, 0);
    NAPI_ASSERT_NO_MES(desc != nullptr);

    bool boolAttr = false;
    OH_Drawing_ErrorCode errorCode =
        OH_Drawing_GetFontFullDescriptorAttributeBool(desc, FULL_DESCRIPTOR_ATTR_B_MONO, &boolAttr);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MyTag",
        "monoSpace: %{public}s", boolAttr ? "true" : "false");
    NAPI_ASSERT_NO_MES(boolAttr == false);

    errorCode = OH_Drawing_GetFontFullDescriptorAttributeBool(desc, FULL_DESCRIPTOR_ATTR_B_SYMBOLIC, &boolAttr);
    NAPI_ASSERT_NO_MES(errorCode == OH_DRAWING_SUCCESS);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "MyTag",
        "symbolic: %{public}s", boolAttr ? "true" : "false");
    NAPI_ASSERT_NO_MES(boolAttr == false);

    // 资源释放
    OH_Drawing_DestroyFontFullDescriptors(fontDescArr);
    free(fontData);

    // 返回测试结果
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
