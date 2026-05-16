/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "native_common.h"
#include "common.h"
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_font_descriptor.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>
#include <native_drawing/drawing_types.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_run.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_lineTypography.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_font_mgr.h>
#include <cfloat>
#include <cstdio>
#include <cstdlib>
#include <string>

namespace {
    // 测试常量
    const double DEFAULT_FONT_SIZE = 50;
    const int ZERO_MINUS_ONE = -1;
    const int MIN_FONT_WEIGHT = 100;
    const int MAX_FONT_WEIGHT = 900;
    constexpr int WEIGHT_STEP = 100;
    constexpr int MIN_WIDTH = 1;
    constexpr int MAX_WIDTH = 9;
    constexpr int BOOL_FALSE = 0;
    constexpr int BOOL_TRUE = 1;
    const int TEST_FONT_SIZE = 12;
    const double TEST_LINE_HEIGHT = 1.5;
    const int TEST_TEXT_ALIGN = 1;
    const int INVALID_ATTRIBUTE_ID = 9999;
    const int INVALID_VALUE = -1;
}

bool Equal(const double left, const double right)
{
    constexpr double epsilon = 0.001f;
    return (std::abs(left - right) <= epsilon);
}

napi_value OHDrawingTypographyIsEllipsized001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *elipss = "……";
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 1);
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, elipss);
    bool isEllipsized = OH_Drawing_TypographyIsEllipsized(typoStyle);
    NAPI_ASSERT_NO_MES(isEllipsized);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingTypographyIsEllipsized002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *elipss = "123456";
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 1);
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, elipss);
    bool isEllipsized = OH_Drawing_TypographyIsEllipsized(typoStyle);
    NAPI_ASSERT_NO_MES(isEllipsized);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingTypographyIsEllipsized003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const char *elipss = "123456";
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 1);
    OH_Drawing_SetTypographyTextEllipsis(typoStyle, elipss);
    bool isEllipsized = OH_Drawing_TypographyIsEllipsized(nullptr);
    NAPI_ASSERT_NO_MES(!isEllipsized);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingTypographyIsLineUnlimited001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, 1);
    bool isLineUnlimited = OH_Drawing_TypographyIsLineUnlimited(typoStyle);
    NAPI_ASSERT_NO_MES(!isLineUnlimited);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingTypographyIsLineUnlimited002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    bool isLineUnlimited = OH_Drawing_TypographyIsLineUnlimited(typoStyle);
    NAPI_ASSERT_NO_MES(isLineUnlimited);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingTypographyIsLineUnlimited003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    bool isLineUnlimited = OH_Drawing_TypographyIsLineUnlimited(nullptr);
    NAPI_ASSERT_NO_MES(!isLineUnlimited);
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    return result;
}

napi_value OHDrawingFontParserGetFontByName001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontParser *fontParser = OH_Drawing_CreateFontParser();
    NAPI_ASSERT_NO_MES(fontParser != nullptr);
    
    const char *name = "HarmonyOS Sans";
    OH_Drawing_FontDescriptor *fontDescriptorNull = OH_Drawing_FontParserGetFontByName(nullptr, name);
    NAPI_ASSERT_NO_MES(fontDescriptorNull == nullptr);
    
    const char *nameEmpty = "";
    OH_Drawing_FontDescriptor *fontDescriptorEmpty = OH_Drawing_FontParserGetFontByName(fontParser, nameEmpty);
    NAPI_ASSERT_NO_MES(fontDescriptorEmpty == nullptr);

    OH_Drawing_DestroyFontDescriptor(fontDescriptorNull);
    OH_Drawing_DestroyFontDescriptor(fontDescriptorEmpty);
    OH_Drawing_DestroyFontParser(fontParser);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingCreateFontDescriptor001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_Drawing_FontDescriptor *desc = OH_Drawing_CreateFontDescriptor();
    NAPI_ASSERT_NO_MES(desc != nullptr);
    
    size_t num = 0;
    OH_Drawing_FontDescriptor *descArr = OH_Drawing_MatchFontDescriptors(desc, &num);
    NAPI_ASSERT_NO_MES(descArr != nullptr && num > 0);
    
    for (size_t i = 0; i < num; i++) {
        OH_Drawing_FontDescriptor current = descArr[i];
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3", "[%{public}zu] path: %{public}s", i, current.path);
        NAPI_ASSERT_NO_MES(current.path != nullptr && strlen(current.path) > 0);

        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3",
            "[%{public}zu] weight: %{public}d, width: %{public}d, italic: %{public}d, symbolic: %{public}d",
            i, current.weight, current.width, current.italic, current.symbolic);
        NAPI_ASSERT_NO_MES(current.weight >= MIN_FONT_WEIGHT && current.weight <= MAX_FONT_WEIGHT &&
                          (current.weight % WEIGHT_STEP) == 0);
        NAPI_ASSERT_NO_MES(current.width >= MIN_WIDTH && current.width <= MAX_WIDTH);
        
        int italicZero = (current.italic == BOOL_FALSE);
        int italicOne = (current.italic == BOOL_TRUE);
        int symZero = (current.symbolic == BOOL_FALSE);
        int symOne = (current.symbolic == BOOL_TRUE);
        if (italicZero == 0) {
            NAPI_ASSERT_NO_MES(italicOne == 1);
        }
        if (symZero == 0) {
            NAPI_ASSERT_NO_MES(symOne == 1);
        }
        
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3", "postScriptName: %{public}s",
            current.postScriptName);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3", "fullName: %{public}s", current.fullName);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3", "fontFamily: %{public}s", current.fontFamily);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Font3", "fontSubfamily: %{public}s", current.fontSubfamily);
    }
    
    OH_Drawing_DestroyFontDescriptor(desc);
    OH_Drawing_DestroyFontDescriptors(descArr, num);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyGetLineTextRange001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    double maxDouble = 1200;
    OH_Drawing_TypographyLayout(typography, maxDouble);
    OH_Drawing_Range *drawingRange = OH_Drawing_TypographyGetLineTextRange(typography, 1, true);
    NAPI_ASSERT_NO_MES(drawingRange != nullptr);

    size_t sizeT1 = OH_Drawing_GetStartFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT1 == 0);
    size_t sizeT2 = OH_Drawing_GetEndFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT2 == 0);

    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyGetLineTextRange002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    double maxDouble = 1200;
    OH_Drawing_TypographyLayout(typography, maxDouble);
    OH_Drawing_Range *drawingRange = OH_Drawing_TypographyGetLineTextRange(nullptr, 1, true);
    NAPI_ASSERT_NO_MES(drawingRange == nullptr);

    size_t sizeT1 = OH_Drawing_GetStartFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT1 == 0);
    size_t sizeT2 = OH_Drawing_GetEndFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT2 == 0);

    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyGetLineTextRange003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);

    double maxDouble = 1200;
    OH_Drawing_TypographyLayout(typography, maxDouble);
    OH_Drawing_Range *drawingRange = OH_Drawing_TypographyGetLineTextRange(typography, 1, false);
    NAPI_ASSERT_NO_MES(drawingRange != nullptr);

    size_t sizeT1 = OH_Drawing_GetStartFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT1 == 0);
    size_t sizeT2 = OH_Drawing_GetEndFromRange(drawingRange);
    NAPI_ASSERT_NO_MES(sizeT2 == 0);

    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTextVerticalAlignment001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_SetTypographyVerticalAlignment(typoStyle, TEXT_VERTICAL_ALIGNMENT_TOP);
    double fontHeiht = 2.0;
    OH_Drawing_SetTextStyleFontHeight(txtStyle, fontHeiht);
    int actualAlign = OH_Drawing_TypographyGetEffectiveAlignment(typoStyle);
    NAPI_ASSERT_NO_MES(actualAlign != TEXT_VERTICAL_ALIGNMENT_TOP);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTextVerticalAlignment002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    OH_Drawing_SetTypographyVerticalAlignment(typoStyle, TEXT_VERTICAL_ALIGNMENT_BASELINE);
    int actualAlign = OH_Drawing_TypographyGetEffectiveAlignment(typoStyle);
    NAPI_ASSERT_NO_MES(actualAlign == TEXT_VERTICAL_ALIGNMENT_BASELINE);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeInt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(txtStyle != nullptr);
    double fontHeiht = 1.2;
    OH_Drawing_SetTextStyleFontHeight(txtStyle, fontHeiht);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE, TEXT_LINE_HEIGHT_BY_FONT_SIZE);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");

    int sizeResult = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE,
        &sizeResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(sizeResult == TEXT_LINE_HEIGHT_BY_FONT_SIZE);
    
    errorCode = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE, TEXT_LINE_HEIGHT_BY_FONT_HEIGHT);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");

    int heightResult = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE,
        &heightResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(heightResult == TEXT_LINE_HEIGHT_BY_FONT_HEIGHT);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double eleven = 11.1;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, eleven);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double gotValue = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == eleven);

    double valueZero = 0;
    errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, valueZero);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == valueZero);

    errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, DBL_MAX);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == DBL_MAX);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double eleven = 11.1;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, eleven);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double gotValue = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == eleven);

    double valueZero = 0;
    errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, valueZero);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == valueZero);

    errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, DBL_MAX);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == DBL_MAX);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTextStyleAttributeInt001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE,
        OH_Drawing_LineHeightStyle::TEXT_LINE_HEIGHT_BY_FONT_SIZE);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTextStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    int outResult = 0;
    errorCode = OH_Drawing_GetTextStyleAttributeInt(txtStyle,
        OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE, &outResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTextStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(outResult == TEXT_LINE_HEIGHT_BY_FONT_SIZE);
    OH_Drawing_DestroyTextStyle(txtStyle);
    
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

void DestroyFontCollection(OH_Drawing_FontCollection *fontCollection, OH_Drawing_TypographyStyle *typoStyle,
    OH_Drawing_TypographyCreate *handler, OH_Drawing_Typography *typography)
{
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyTypography(typography);
}

void DestroyTextLines(OH_Drawing_Array *textLines, OH_Drawing_TextLine *textLine, OH_Drawing_Array *runs,
    OH_Drawing_Array *advances)
{
    OH_Drawing_DestroyTextLines(textLines);
    OH_Drawing_DestroyTextLine(textLine);
    OH_Drawing_DestroyRunGlyphs(runs);
    OH_Drawing_DestroyRunGlyphAdvances(advances);
}

void DestroyRunGlyphs(OH_Drawing_Array *glyphs, OH_Drawing_Point *point, OH_Drawing_Font *drawingFont,
    OH_Drawing_Rect *imageBounds)
{
    OH_Drawing_DestroyRunGlyphs(glyphs);
    OH_Drawing_PointDestroy(point);
    OH_Drawing_FontDestroy(drawingFont);
    OH_Drawing_DestroyRunImageBounds(imageBounds);
}

napi_value OHDrawingGetRunGlyphAdvanceByIndex001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    double maxDouble = 1200;
    OH_Drawing_TypographyLayout(typography, maxDouble);

    OH_Drawing_Array *textLines = OH_Drawing_TypographyGetTextLines(typography);

    int h = 0;
    OH_Drawing_TextLine *textLine = OH_Drawing_GetTextLineByIndex(textLines, 0);
    double glyphCount = OH_Drawing_TextLineGetGlyphCount(textLine);
    OH_Drawing_Array *runs = OH_Drawing_TextLineGetGlyphRuns(textLine);
    h = h + 1;
    OH_Drawing_Run *run = OH_Drawing_GetRunByIndex(runs, 0);
    uint32_t count = OH_Drawing_GetRunGlyphCount(run);
    int start = 0;
    int length = 300;
    OH_Drawing_Array *advances = OH_Drawing_GetRunGlyphAdvances(run, start, length);
    NAPI_ASSERT_NO_MES(advances == nullptr);

    OH_Drawing_Array *glyphs = OH_Drawing_GetRunGlyphs(run, 0, count);
    uint16_t glyphIds[int(glyphCount)];
    glyphIds[0] = OH_Drawing_GetRunGlyphsByIndex(glyphs, 0);
    OH_Drawing_Point *point = OH_Drawing_GetRunGlyphAdvanceByIndex(advances, 0);
    NAPI_ASSERT_NO_MES(point == nullptr);

    float width = 0;
    float height = 0;
    OH_Drawing_PointGetX(point, &width);
    OH_Drawing_PointGetY(point, &height);
    OH_Drawing_TextDirection txtDirection = OH_Drawing_GetRunTextDirection(run);
    NAPI_ASSERT_NO_MES(txtDirection == TEXT_DIRECTION_LTR);
    
    OH_Drawing_Font *drawingFont = OH_Drawing_GetRunFont(run);
    NAPI_ASSERT_NO_MES(drawingFont == nullptr);
    OH_Drawing_Rect *imageBounds = OH_Drawing_GetRunImageBounds(run);
    NAPI_ASSERT_NO_MES(imageBounds == nullptr);

    DestroyFontCollection(fontCollection, typoStyle, handler, typography);
    DestroyTextLines(textLines, textLine, runs, advances);
    DestroyRunGlyphs(glyphs, point, drawingFont, imageBounds);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingLineTypographyCreateLine007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleColor(txtStyle, OH_Drawing_ColorSetArgb(0xFF, 0x00, 0x00, 0x00));
    double fontSize = 70;
    double fontHeight = 1.5;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_SetTextStyleFontHeight(txtStyle, fontHeight);
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(typoStyle, fontCollection);
    const char *text1 = "这是第一段文本，创建一个排版行对象,创建一个指向文本行对象。";
    OH_Drawing_TypographyHandlerAddText(handler, text1);
    OH_Drawing_LineTypography *lineTypography = OH_Drawing_CreateLineTypography(handler);
    NAPI_ASSERT_NO_MES(lineTypography != nullptr);
    OH_Drawing_TextLine *lineTypographyLine = OH_Drawing_LineTypographyCreateLine(lineTypography, 1, 19);
    NAPI_ASSERT_NO_MES(lineTypographyLine != nullptr);

    size_t strLength = 0;
    double maxWidth = 1200;
    size_t countBreak = OH_Drawing_LineTypographyGetLineBreak(lineTypography, strLength, maxWidth);
    size_t countTextChars = 30;
    NAPI_ASSERT_NO_MES(countBreak == countTextChars);

    size_t strLengthNext = 0;
    double maxWidthNext = 0;
    size_t countBreakNext = OH_Drawing_LineTypographyGetLineBreak(lineTypography, strLengthNext, maxWidthNext);
    NAPI_ASSERT_NO_MES(countBreakNext == 0);

    const char *ellipsis = "……";
    OH_Drawing_TextLine *textLine = OH_Drawing_TextLineCreateTruncatedLine(lineTypographyLine, 0, ELLIPSIS_MODAL_HEAD,
        ellipsis);
    NAPI_ASSERT_NO_MES(textLine == nullptr);

    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyLineTypography(lineTypography);
    OH_Drawing_DestroyTextLine(lineTypographyLine);
    OH_Drawing_DestroyTextLine(textLine);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingUnregisterFont001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_GetFontCollectionGlobalInstance();
    OH_Drawing_RegisterFont(fontCollection, "cartoon", "/system/fonts/HarmonyOS_Sans_TC.ttf");
    const char *familyName = "tc";
    uint32_t flag = OH_Drawing_UnregisterFont(fontCollection, familyName);
    NAPI_ASSERT_NO_MES(flag == 0);
    const char *familyNameEmpty = "";
    uint32_t flagEmpty = OH_Drawing_UnregisterFont(fontCollection, familyNameEmpty);
    constexpr int fontNotFoundError = 8;
    NAPI_ASSERT_NO_MES(flagEmpty == fontNotFoundError);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value OHDrawingFontStyleSetGetStyle001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    char **styleName = nullptr;
    OH_Drawing_FontMgr *mgr = OH_Drawing_FontMgrCreate();
    OH_Drawing_FontStyleSet *fontStyleSet = OH_Drawing_FontMgrCreateFontStyleSet(mgr, 0);
    OH_Drawing_FontStyleStruct normalStyle = OH_Drawing_FontStyleSetGetStyle(fontStyleSet, 0, styleName);
    constexpr int fontWeightNormal = 3;
    constexpr int fontSlantUpright = 0;
    constexpr int fontWidthNormal = 5;
    NAPI_ASSERT_NO_MES(normalStyle.weight == fontWeightNormal);
    NAPI_ASSERT_NO_MES(normalStyle.slant == fontSlantUpright);
    NAPI_ASSERT_NO_MES(normalStyle.width == fontWidthNormal);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyStyleIsHintEnabled001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool res = OH_Drawing_TypographyStyleIsHintEnabled(nullptr);
    NAPI_ASSERT_NO_MES(!res);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyStyleIsHintEnabled002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    
    OH_Drawing_TypographyStyle *style = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    bool initRes = OH_Drawing_TypographyStyleIsHintEnabled(style);
    NAPI_ASSERT_NO_MES(!initRes);

    bool targetEnabled = true;
    OH_Drawing_TypographyStyleSetHintsEnabled(style, targetEnabled);

    bool setRes = OH_Drawing_TypographyStyleIsHintEnabled(style);
    NAPI_ASSERT_NO_MES(setRes == targetEnabled);

    OH_Drawing_TypographyStyle *typoStyleCopy =  OH_Drawing_CopyTypographyStyle(style);
    bool setRes2 = OH_Drawing_TypographyStyleIsHintEnabled(typoStyleCopy);
    NAPI_ASSERT_NO_MES(setRes2 == targetEnabled);

    OH_Drawing_DestroyTypographyStyle(typoStyleCopy);
    OH_Drawing_DestroyTypographyStyle(style);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetSystemFontConfigInfo001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_FontConfigInfo *cfgInfo = OH_Drawing_GetSystemFontConfigInfo(nullptr);
    NAPI_ASSERT_NO_MES(cfgInfo);
    OH_Drawing_DestroySystemFontConfigInfo(cfgInfo);

    OH_Drawing_FontConfigInfoErrorCode code = ERROR_FONT_CONFIG_INFO_UNKNOWN;
    OH_Drawing_FontConfigInfo *configJsonInfo = OH_Drawing_GetSystemFontConfigInfo(&code);
    NAPI_ASSERT_NO_MES(configJsonInfo != nullptr);
    NAPI_ASSERT_NO_MES(code == SUCCESS_FONT_CONFIG_INFO);
    OH_Drawing_DestroySystemFontConfigInfo(configJsonInfo);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble007(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double lineSpacingSet = 30;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, lineSpacingSet);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double gotValue = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = Equal(gotValue, lineSpacingSet);
    NAPI_ASSERT_NO_MES(isEqual);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeInt005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeInt(
        typoStyle, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, FONT_WIDTH_SEMI_EXPANDED);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    int gotValue = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, &gotValue);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(gotValue == FONT_WIDTH_SEMI_EXPANDED);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeInt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, style != nullptr, "style is nullptr, create error");
    OH_Drawing_ErrorCode ret = OH_Drawing_SetTextStyleAttributeInt(style, TEXT_STYLE_ATTR_I_FONT_WIDTH, INVALID_VALUE);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);
    OH_Drawing_DestroyTextStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTextStyleAttributeInt003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_ErrorCode ret =
        OH_Drawing_SetTextStyleAttributeInt(nullptr, TEXT_STYLE_ATTR_D_LINE_HEIGHT_MINIMUM, TEST_FONT_SIZE);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH == 26200003);

    OH_Drawing_TextStyle *style = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT_NO_MES(style != nullptr);

    ret = OH_Drawing_SetTextStyleAttributeInt(style, TEXT_STYLE_ATTR_I_FONT_WIDTH, INVALID_VALUE);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);

    OH_Drawing_DestroyTextStyle(style);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTextStyleAttributeInt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    int value = 0;
    OH_Drawing_ErrorCode ret =
        OH_Drawing_GetTextStyleAttributeInt(nullptr, TEXT_STYLE_ATTR_I_LINE_HEIGHT_STYLE, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);
    ret = OH_Drawing_GetTextStyleAttributeInt(txtStyle, TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    OH_Drawing_DestroyTextStyle(txtStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT(env, typoStyle != nullptr, "typoStyle is nullptr, create error");
    double lineSpacingSet = 30;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, lineSpacingSet);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double lineSpacingGet = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle,
        TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, &lineSpacingGet);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = Equal(lineSpacingGet, lineSpacingSet);
    NAPI_ASSERT_NO_MES(isEqual);
    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble005(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_ErrorCode ret = OH_Drawing_SetTypographyStyleAttributeDouble(
        nullptr, TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, TEST_LINE_HEIGHT);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);
    
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    ret = OH_Drawing_SetTypographyStyleAttributeDouble(
        typoStyle, static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), TEST_LINE_HEIGHT);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    NAPI_ASSERT_NO_MES(OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE == 26200001);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeDouble006(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    double value = 0;
    OH_Drawing_ErrorCode ret = OH_Drawing_GetTypographyStyleAttributeDouble(
        typoStyle, TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    
    ret = OH_Drawing_GetTypographyStyleAttributeDouble(
        typoStyle, static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTypographyStyleAttributeDouble001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    double value = 0;
    OH_Drawing_ErrorCode ret =
        OH_Drawing_GetTypographyStyleAttributeDouble(nullptr, TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    ret = OH_Drawing_GetTypographyStyleAttributeDouble(typoStyle, TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, nullptr);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTypographyStyleAttributeInt001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    int value = 0;
    OH_Drawing_ErrorCode ret =
        OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    ret = OH_Drawing_GetTypographyStyleAttributeInt(
        typoStyle, static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeInt003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTypographyStyleAttributeInt(
        typoStyle, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, FONT_WIDTH_SEMI_EXPANDED);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "SetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    int outResult = 0;
    errorCode = OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, &outResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTypographyStyleAttributeInt errorCode != OH_DRAWING_SUCCESS");
    NAPI_ASSERT_NO_MES(outResult == FONT_WIDTH_SEMI_EXPANDED);
    
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingSetTypographyStyleAttributeInt004(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_ErrorCode ret =
        OH_Drawing_SetTypographyStyleAttributeInt(nullptr, TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE, TEST_TEXT_ALIGN);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    ret = OH_Drawing_SetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_D_LINE_SPACING, TEST_TEXT_ALIGN);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    ret =
        OH_Drawing_SetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_I_LINE_HEIGHT_STYLE, INVALID_VALUE);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_PARAMETER_OUT_OF_RANGE);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTextStyleAttributeDouble001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    NAPI_ASSERT(env, txtStyle != nullptr, "txtStyle == nullptr, create error");
    double maxLineHeight = 30;
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SetTextStyleAttributeDouble(
        txtStyle, OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, maxLineHeight);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS, "SetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    double getResult = 0;
    errorCode = OH_Drawing_GetTextStyleAttributeDouble(
        txtStyle, OH_Drawing_TextStyleAttributeId::TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &getResult);
    NAPI_ASSERT(env, errorCode == OH_DRAWING_SUCCESS,
        "GetTextStyleAttributeDouble errorCode != OH_DRAWING_SUCCESS");
    bool isEqual = Equal(getResult, maxLineHeight);
    NAPI_ASSERT(env, isEqual,
        "TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM get != TEXT_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM set");
    napi_create_int32(env, SUCCESS, &result);
    OH_Drawing_DestroyTextStyle(txtStyle);
    return result;
}

napi_value OHDrawingGetTypographyStyleAttributeInt002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    int value = 0;
    OH_Drawing_ErrorCode ret =
        OH_Drawing_GetTypographyStyleAttributeInt(nullptr, TYPOGRAPHY_STYLE_ATTR_I_FONT_WIDTH, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_INVALID_PARAMETER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTypographyStyleAttributeInt003(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    NAPI_ASSERT_NO_MES(typoStyle != nullptr);

    int value = 0;
    OH_Drawing_ErrorCode ret =
        OH_Drawing_GetTypographyStyleAttributeInt(typoStyle, TYPOGRAPHY_STYLE_ATTR_D_LINE_HEIGHT_MAXIMUM, &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);

    ret = OH_Drawing_GetTypographyStyleAttributeInt(
        typoStyle, static_cast<OH_Drawing_TypographyStyleAttributeId>(INVALID_ATTRIBUTE_ID), &value);
    NAPI_ASSERT_NO_MES(ret == OH_DRAWING_ERROR_ATTRIBUTE_ID_MISMATCH);
    
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyStyleGetStrutStyle001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_StrutStyle *typoGetStrutStyle = OH_Drawing_TypographyStyleGetStrutStyle(typoStyle);
    NAPI_ASSERT_NO_MES(typoGetStrutStyle != nullptr);

    OH_Drawing_StrutStyle *typoGetStrutStyleNull = OH_Drawing_TypographyStyleGetStrutStyle(nullptr);
    NAPI_ASSERT_NO_MES(typoGetStrutStyleNull == nullptr);
    
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    OH_Drawing_TypographyStyleDestroyStrutStyle(typoGetStrutStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyTextlineStyleGetFontWeight001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();

    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_100);
    OH_Drawing_FontWeight getFontWeightOne = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightOne == FONT_WEIGHT_100);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_200);
    OH_Drawing_FontWeight getFontWeightTwo = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightTwo == FONT_WEIGHT_200);

    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_300);
    OH_Drawing_FontWeight getFontWeightThree = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightThree == FONT_WEIGHT_300);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_400);
    OH_Drawing_FontWeight getFontWeightFour = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightFour == FONT_WEIGHT_400);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_500);
    OH_Drawing_FontWeight getFontWeightFive = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightFive == FONT_WEIGHT_500);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_600);
    OH_Drawing_FontWeight getFontWeightSix = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightSix == FONT_WEIGHT_600);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_700);
    OH_Drawing_FontWeight getFontWeightSeven = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightSeven == FONT_WEIGHT_700);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_800);
    OH_Drawing_FontWeight getFontWeightEight = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightEight == FONT_WEIGHT_800);
    
    OH_Drawing_SetTypographyTextLineStyleFontWeight(typoStyle, FONT_WEIGHT_900);
    OH_Drawing_FontWeight getFontWeightNight = OH_Drawing_TypographyTextlineStyleGetFontWeight(typoStyle);
    NAPI_ASSERT_NO_MES(getFontWeightNight == FONT_WEIGHT_900);
    
    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyTextlineStyleGetFontStyle001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();

    OH_Drawing_FontStyle fontStyleNormal = OH_Drawing_TypographyTextlineStyleGetFontStyle(typoStyle);
    NAPI_ASSERT_NO_MES(fontStyleNormal == FONT_STYLE_NORMAL);

    OH_Drawing_SetTypographyTextLineStyleFontStyle(typoStyle, FONT_STYLE_ITALIC);
    OH_Drawing_FontStyle fontStyleItalic = OH_Drawing_TypographyTextlineStyleGetFontStyle(typoStyle);
    NAPI_ASSERT_NO_MES(fontStyleItalic == FONT_STYLE_ITALIC);

    OH_Drawing_TypographyTextlineStyleGetFontStyle(nullptr);

    OH_Drawing_DestroyTypographyStyle(typoStyle);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingTypographyGetTextAlign001(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_LEFT);
    OH_Drawing_TextAlign ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_LEFT);

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_RIGHT);
    ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_RIGHT);

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_CENTER);
    ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_CENTER);

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_JUSTIFY);
    ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_JUSTIFY);

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_START);
    ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_START);

    OH_Drawing_SetTypographyTextAlign(typoStyle, TEXT_ALIGN_END);
    ret = OH_Drawing_TypographyGetTextAlign(typoStyle);
    NAPI_ASSERT_NO_MES(ret == TEXT_ALIGN_END);

    OH_Drawing_TypographyGetTextAlign(nullptr);

    OH_Drawing_DestroyTypographyStyle(typoStyle);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHDrawingGetTextTabAlignment002(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_Drawing_TextTab* textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_LEFT, 100.0);
    OH_Drawing_TextAlign textAlign = OH_Drawing_GetTextTabAlignment(textTab);
    NAPI_ASSERT_NO_MES(textAlign == TEXT_ALIGN_LEFT);

    constexpr float kDefaultTabStopPosition = 100.0f;
    textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_RIGHT, kDefaultTabStopPosition);
    textAlign = OH_Drawing_GetTextTabAlignment(textTab);
    NAPI_ASSERT_NO_MES(textAlign == TEXT_ALIGN_RIGHT);

    textTab = OH_Drawing_CreateTextTab(TEXT_ALIGN_CENTER, kDefaultTabStopPosition);
    textAlign = OH_Drawing_GetTextTabAlignment(textTab);
    NAPI_ASSERT_NO_MES(textAlign == TEXT_ALIGN_CENTER);

    napi_create_int32(env, SUCCESS, &result);
    return result;
}
