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

#include "TypographyTest.h"
#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_error_code.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_record_cmd.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_font_descriptor.h>
#include <native_drawing/drawing_text_typography.h>

enum CaseNum {
    CASE_1 = 1,
    CASE_2 = 2,
    CASE_3 = 3,
    CASE_4 = 4,
    CASE_5 = 5,
    CASE_6 = 6,
    CASE_7 = 7,
    CASE_8 = 8,
    CASE_9 = 9,
    CASE_10 = 10,
    CASE_11 = 11,
    CASE_12 = 12,
    CASE_13 = 13
};
namespace OHOS::Rosen {
auto g_defaultNum = 0;
enum class WordBreakType { NORMAL, BREAK_ALL, BREAK_WORD, BREAK_HYPHEN };
struct TypographyStyle {
    WordBreakType wordBreakType;
};
} // namespace OHOS::Rosen
static OHOS::Rosen::TypographyStyle *ConvertToOriginalText(OH_Drawing_TypographyStyle *style)
{
    return reinterpret_cast<OHOS::Rosen::TypographyStyle *>(style);
}

static OH_Drawing_TextVerticalAlignment *ConvertToOriginalText1(OH_Drawing_Typography *style)
{
    return reinterpret_cast<OH_Drawing_TextVerticalAlignment *>(style);
}

void addTypographyTest(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back({"OH_Drawing_FontFeature0100", nullptr, OH_Drawing_FontFeature0100, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontFeature0101", nullptr, OH_Drawing_FontFeature0101, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Drawing_LineMetrics0100", nullptr, OH_Drawing_LineMetrics0100, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontDescriptor0100", nullptr, OH_Drawing_FontDescriptor0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontConfigInfo0100", nullptr, OH_Drawing_FontConfigInfo0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontGenericInfo0100", nullptr, OH_Drawing_FontGenericInfo0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontAliasInfo0100", nullptr, OH_Drawing_FontAliasInfo0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontAdjustInfo0100", nullptr, OH_Drawing_FontAdjustInfo0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontFallbackGroup0100", nullptr, OH_Drawing_FontFallbackGroup0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontFallbackInfo0100", nullptr, OH_Drawing_FontFallbackInfo0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_FontConfigInfoErrorCode0100", nullptr, OH_Drawing_FontConfigInfoErrorCode0100,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_RectStyle0100", nullptr, OH_Drawing_RectStyle0100, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"OH_Drawing_PlaceholderVerticalAlignment0100", nullptr,
                        OH_Drawing_PlaceholderVerticalAlignment0100, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_WordBreakType0100", nullptr, OH_Drawing_WordBreakType0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"OH_Drawing_TextStyleType0100", nullptr, OH_Drawing_TextStyleType0100, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
}

napi_value OH_Drawing_FontFeature0100(napi_env env, napi_callback_info info)
{
    OH_Drawing_TextStyle *TextStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyleAddFontFeature(TextStyle, "kern", 1);
    OH_Drawing_FontFeature *FontFeature = OH_Drawing_TextStyleGetFontFeatures(TextStyle);
    int32_t stateValue = 0;
    if (FontFeature->value == 1) {
        stateValue = 1;
    };
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontFeature0101(napi_env env, napi_callback_info info)
{
    OH_Drawing_TextStyle *TextStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyleAddFontFeature(TextStyle, "kern", 1);
    OH_Drawing_FontFeature *FontFeature = OH_Drawing_TextStyleGetFontFeatures(TextStyle);
    int32_t stateValue = 1;
    if (FontFeature->tag == nullptr) {
        stateValue = 0;
    };
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}
int32_t lineMetricsGetSwitch1(OH_Drawing_LineMetrics *lineMetrics, int32_t numValue)
{
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (lineMetrics->ascender == NULL)
                stateValue = 0;
            break;
        case CASE_2:
            if (lineMetrics->capHeight == NULL)
                stateValue = 0;
            break;
        case CASE_3:
            if (lineMetrics->descender == NULL)
                stateValue = 0;
            break;
        case CASE_4:
            if (lineMetrics->endIndex == NULL)
                stateValue = 0;
            break;
        case CASE_5:
            if (lineMetrics->firstCharMetrics.ascent == NULL)
                stateValue = 0;
            break;
        case CASE_6:
            if (lineMetrics->height == NULL)
                stateValue = 0;
            break;
        default:
            stateValue = 1;
            break;
    }
    return stateValue;
}
int32_t lineMetricsGetSwitch2(OH_Drawing_LineMetrics *lineMetrics, int32_t numValue)
{
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_7:
            if (lineMetrics->startIndex == NULL)
                stateValue = 0;
            break;
        case CASE_8:
            if (lineMetrics->width == NULL)
                stateValue = 0;
            break;
        case CASE_9:
            if (lineMetrics->x == NULL)
                stateValue = 0;
            break;
        case CASE_10:
            if (lineMetrics->xHeight == NULL)
                stateValue = 0;
            break;
        case CASE_11:
            if (lineMetrics->y == NULL)
                stateValue = 0;
            break;
        default:
            stateValue = 1;
            break;
    }
    return stateValue;
}
napi_value OH_Drawing_LineMetrics0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_TypographyStyle *style = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyVerticalAlignment(style, TEXT_VERTICAL_ALIGNMENT_CENTER);
    OH_Drawing_SetTypographyTextAlign(style, TEXT_ALIGN_RIGHT);
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateFontCollection();
    OH_Drawing_TypographyCreate *handler = OH_Drawing_CreateTypographyHandler(style, fontCollection);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    auto fontSize = 50;
    OH_Drawing_SetTextStyleFontSize(txtStyle, fontSize);
    OH_Drawing_TypographyHandlerPushTextStyle(handler, txtStyle);
    const char *text = " 测试文本测试文本测试文本测试文本";
    OH_Drawing_TypographyHandlerAddText(handler, text);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    auto layout = 60;
    OH_Drawing_TypographyLayout(typography, layout);
    OH_Drawing_LineMetrics *lineMetrics = OH_Drawing_TypographyGetLineMetrics(typography);
    int size = OH_Drawing_LineMetricsGetSize(lineMetrics);
    bool res = OH_Drawing_TypographyGetLineMetricsAt(typography, 1, lineMetrics);
    int32_t stateValue = 0;
    int a = 6;
    if (numValue > a) {
        stateValue = lineMetricsGetSwitch2(lineMetrics, numValue);
    } else {
        stateValue = lineMetricsGetSwitch1(lineMetrics, numValue);
    }
    OH_Drawing_DestroyTypographyStyle(style);
    OH_Drawing_DestroyTypographyHandler(handler);
    OH_Drawing_DestroyFontCollection(fontCollection);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTypography(typography);
    OH_Drawing_DestroyLineMetrics(lineMetrics);
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}
int32_t fontDescriptorGetSwitch(OH_Drawing_FontDescriptor *fontDescriptor, int32_t numValue)
{
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (fontDescriptor->path == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (fontDescriptor->postScriptName == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_3:
            if (fontDescriptor->fontSubfamily == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_4:
            if (fontDescriptor->width == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_5:
            if (fontDescriptor->italic == OHOS::Rosen::g_defaultNum) {
                stateValue = 1;
            }
            break;
        case CASE_6:
            if (fontDescriptor->monoSpace == false) {
                stateValue = 1;
            }
            break;
        case CASE_7:
            if (fontDescriptor->symbolic == false) {
                stateValue = 1;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    return stateValue;
}
napi_value OH_Drawing_FontDescriptor0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_Array *fullNameArray = OH_Drawing_GetSystemFontFullNamesByType(ALL);
    const OH_Drawing_String *fullName = OH_Drawing_GetSystemFontFullNameByIndex(fullNameArray, 5);
    OH_Drawing_FontDescriptor *fontDescriptor = OH_Drawing_GetFontDescriptorByFullName(fullName, ALL);
    int32_t stateValue = fontDescriptorGetSwitch(fontDescriptor, numValue);
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontConfigInfo0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontCfgInfo->fontDirSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (drawFontCfgInfo->fontGenericInfoSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_3:
            if (drawFontCfgInfo->fallbackGroupSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_4:
            if (drawFontCfgInfo->fontDirSet == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_5:
            if (drawFontCfgInfo->fontGenericInfoSet == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_6:
            if (drawFontCfgInfo->fallbackGroupSet == NULL) {
                stateValue = 0;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontGenericInfo0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    OH_Drawing_FontGenericInfo *drawFontGecInfo = drawFontCfgInfo->fontGenericInfoSet;
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontGecInfo->familyName == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (drawFontGecInfo->aliasInfoSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_3:
            if (drawFontGecInfo->adjustInfoSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_4:
            if (drawFontGecInfo->aliasInfoSet == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_5:
            if (drawFontGecInfo->adjustInfoSet == NULL) {
                stateValue = 0;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontAliasInfo0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    OH_Drawing_FontAliasInfo *drawFontAlsInfo = drawFontCfgInfo->fontGenericInfoSet->aliasInfoSet;
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontAlsInfo->familyName == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (drawFontAlsInfo->weight == OHOS::Rosen::g_defaultNum) {
                stateValue = 1;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontAdjustInfo0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    OH_Drawing_FontAdjustInfo *drawFontAlsInfo = drawFontCfgInfo->fontGenericInfoSet->adjustInfoSet;
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontAlsInfo->weight == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (drawFontAlsInfo->to == NULL) {
                stateValue = 0;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontFallbackGroup0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    OH_Drawing_FontFallbackGroup *drawFontFG = drawFontCfgInfo->fallbackGroupSet;
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontFG->groupName == nullptr) {
                stateValue = 1;
            }
            break;
        case CASE_2:
            if (drawFontFG->fallbackInfoSize == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_3:
            if (drawFontFG->fallbackInfoSet == NULL) {
                stateValue = 0;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontFallbackInfo0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1; // 期望接收1个参数
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue; // 使用整数类型
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode = SUCCESS_FONT_CONFIG_INFO;
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    OH_Drawing_FontFallbackInfo *drawFontFBInfo = drawFontCfgInfo->fallbackGroupSet->fallbackInfoSet;
    int32_t stateValue = 1;
    switch (numValue) {
        case CASE_1:
            if (drawFontFBInfo->familyName == NULL) {
                stateValue = 0;
            }
            break;
        case CASE_2:
            if (drawFontFBInfo->language == NULL) {
                stateValue = 0;
            }
            break;
        default:
            stateValue = 1;
            break;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_FontConfigInfoErrorCode0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue;
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_FontConfigInfoErrorCode errorCode;
    switch (numValue) {
        case CASE_1:
            errorCode = ERROR_FONT_CONFIG_INFO_PARSE_FILE;
            break;
        case CASE_2:
            errorCode = ERROR_FONT_CONFIG_INFO_ALLOC_MEMORY;
            break;
        case CASE_3:
            errorCode = ERROR_FONT_CONFIG_INFO_COPY_STRING_DATA;
            break;
        default:
            errorCode = ERROR_FONT_CONFIG_INFO_PARSE_FILE;
            break;
    }
    OH_Drawing_FontConfigInfo *drawFontCfgInfo = OH_Drawing_GetSystemFontConfigInfo(&errorCode);
    int32_t stateValue = 1;
    if (drawFontCfgInfo == nullptr) {
        stateValue = 0;
    };
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_RectStyle0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue;
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_RectHeightStyle heightStyle = RECT_HEIGHT_STYLE_TIGHT;
    OH_Drawing_RectWidthStyle widthStyle = RECT_WIDTH_STYLE_TIGHT;
    switch (numValue) {
        case CASE_1:
            heightStyle = RECT_HEIGHT_STYLE_MAX;
            break;
        case CASE_2:
            heightStyle = RECT_HEIGHT_STYLE_INCLUDELINESPACEMIDDLE;
            break;
        case CASE_3:
            heightStyle = RECT_HEIGHT_STYLE_INCLUDELINESPACETOP;
            break;
        case CASE_4:
            heightStyle = RECT_HEIGHT_STYLE_INCLUDELINESPACEBOTTOM;
            break;
        case CASE_5:
            heightStyle = RECT_HEIGHT_STYLE_STRUCT;
            break;
        case CASE_6:
            widthStyle = RECT_WIDTH_STYLE_MAX;
            break;
        default:
            heightStyle = RECT_HEIGHT_STYLE_MAX;
            break;
    }
    OH_Drawing_TextBox *textBox = OH_Drawing_TypographyGetRectsForRange(typography, 1, 2, heightStyle, widthStyle);
    int32_t stateValue = 1;
    if (textBox == nullptr) {
        stateValue = 0;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}
OH_Drawing_PlaceholderVerticalAlignment placeholderVerticalGetSwitch(int32_t numValue)
{
    OH_Drawing_PlaceholderVerticalAlignment PhVAlignment;
    switch (numValue) {
        case CASE_1:
            PhVAlignment = ALIGNMENT_BELOW_BASELINE;
            break;
        case CASE_2:
            PhVAlignment = ALIGNMENT_TOP_OF_ROW_BOX;
            break;
        case CASE_3:
            PhVAlignment = ALIGNMENT_BOTTOM_OF_ROW_BOX;
            break;
        case CASE_4:
            PhVAlignment = ALIGNMENT_CENTER_OF_ROW_BOX;
            break;
        case CASE_5:
            PhVAlignment = ALIGNMENT_FOLLOW_PARAGRAPH;
            break;
        default:
            PhVAlignment = ALIGNMENT_BELOW_BASELINE;
            break;
    }
    return PhVAlignment;
}
napi_value OH_Drawing_PlaceholderVerticalAlignment0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue;
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_TypographyCreate *handler =
        OH_Drawing_CreateTypographyHandler(typoStyle, OH_Drawing_CreateFontCollection());
    OH_Drawing_PlaceholderVerticalAlignment PhVAlignment = placeholderVerticalGetSwitch(numValue);
    OH_Drawing_PlaceholderSpan placeholderSpan = {20, 40, PhVAlignment, TEXT_BASELINE_ALPHABETIC, 10};
    OH_Drawing_TypographyHandlerAddPlaceholder(handler, &placeholderSpan);
    OH_Drawing_Typography *typography = OH_Drawing_CreateTypography(handler);
    OH_Drawing_TextBox *testBox = OH_Drawing_TypographyGetRectsForPlaceholders(typography);
    int32_t stateValue = 1;
    if (testBox == nullptr) {
        stateValue = 0;
    };
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

napi_value OH_Drawing_WordBreakType0100(napi_env env, napi_callback_info info)
{
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextWordBreakType(typoStyle, WORD_BREAK_TYPE_BREAK_HYPHEN);
    int32_t stateValue = 0;
    if (ConvertToOriginalText(typoStyle)->wordBreakType == OHOS::Rosen::WordBreakType::BREAK_HYPHEN) {
        stateValue = 1;
    } else {
        stateValue = 0;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}

OH_Drawing_TextStyleType textStyleTypeGetSwitch(int32_t numValue)
{
    OH_Drawing_TextStyleType textStyleType;
    switch (numValue) {
        case CASE_1:
            textStyleType = TEXT_STYLE_NONE;
            break;
        case CASE_2:
            textStyleType = TEXT_STYLE_FONT;
            break;
        case CASE_3:
            textStyleType = TEXT_STYLE_FOREGROUND;
            break;
        case CASE_4:
            textStyleType = TEXT_STYLE_BACKGROUND;
            break;
        case CASE_5:
            textStyleType = TEXT_STYLE_SHADOW;
            break;
        case CASE_6:
            textStyleType = TEXT_STYLE_DECORATIONS;
            break;
        case CASE_7:
            textStyleType = TEXT_STYLE_LETTER_SPACING;
            break;
        case CASE_8:
            textStyleType = TEXT_STYLE_WORD_SPACING;
            break;
        default:
            textStyleType = TEXT_STYLE_NONE;
            break;
    }
    return textStyleType;
}
napi_value OH_Drawing_TextStyleType0100(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1];
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t numValue;
    napi_get_value_int32(env, args[0], &numValue);
    OH_Drawing_TextStyle *txtStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyle *txtStyleCompare = OH_Drawing_CreateTextStyle();
    OH_Drawing_TextStyleType textStyleType = textStyleTypeGetSwitch(numValue);
    bool result1 = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    OH_Drawing_SetTextStyleLocale(txtStyle, "en");
    bool result2 = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    bool result3 = OH_Drawing_TextStyleIsAttributeMatched(nullptr, txtStyleCompare, TEXT_STYLE_ALL_ATTRIBUTES);
    bool result4 = OH_Drawing_TextStyleIsAttributeMatched(txtStyle, nullptr, TEXT_STYLE_ALL_ATTRIBUTES);
    OH_Drawing_DestroyTextStyle(txtStyle);
    OH_Drawing_DestroyTextStyle(txtStyleCompare);
    int32_t stateValue = 0;
    if (result1 && !result2 && !result3 && !result4) {
        stateValue = 1;
    } else {
        stateValue = 0;
    }
    napi_value result;
    napi_create_int32(env, stateValue, &result);
    return result;
}
