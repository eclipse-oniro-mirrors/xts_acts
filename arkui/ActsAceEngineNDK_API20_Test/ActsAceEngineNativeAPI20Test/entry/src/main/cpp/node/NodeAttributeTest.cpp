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
#include "node/NodeAttribute.h"

namespace NodeAttribute {

napi_value CheckNodeTextHalfLeading(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_HALF_LEADING, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_HALF_LEADING);
    if (itemptr->value[0].i32 == flag && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextLineCount(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_LINE_COUNT);
    if (itemptr->value[0].i32 == 0) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextOptimizeTrailingSpace(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_OPTIMIZE_TRAILING_SPACE, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_OPTIMIZE_TRAILING_SPACE);
    if (itemptr->value[0].i32 == flag && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextLinearGradient(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float angle = mt() % PARAM_3600 / 10; // 生成随机参数
    ArkUI_LinearGradientDirection direction = ArkUI_LinearGradientDirection(mt() % PARAM_10);
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    int size = mt() % PARAM_4; // 生成随机参数
    uint32_t color1 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t color2 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t color3 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t colors[] = { color1, color2, color3 };
    float stop1 = mt() % PARAM_3 / 10; // 生成随机参数
    float stop2 = mt() % PARAM_4 / 10 + stop1; // 生成随机参数
    float stop3 = mt() % PARAM_4 / 10 + stop2; // 生成随机参数
    float stops[] = { stop1, stop2, stop3 };
    ArkUI_ColorStop object = { .colors = colors, .stops = stops, .size = size };
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .f32 = angle }, { .i32 = direction }, { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3, .object = &object };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_LINEAR_GRADIENT, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_LINEAR_GRADIENT);
    bool condition = itemptr->value[1].i32 == direction && itemptr->value[2].i32 == flag;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextRadialGradient(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float x = mt() % PARAM_1000 / 10; // 生成随机参数
    float y = mt() % PARAM_1000 / 10; // 生成随机参数
    float radius = mt() % PARAM_3600 / 10; // 生成随机参数
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    int size = mt() % PARAM_4; // 生成随机参数
    uint32_t color1 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t color2 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t color3 = mt() % PARAM_4294967296; // 生成随机参数
    uint32_t colors[] = { color1, color2, color3 };
    float stop1 = mt() % PARAM_3 / 10; // 生成随机参数
    float stop2 = mt() % PARAM_4 / 10 + stop1; // 生成随机参数
    float stop3 = mt() % PARAM_4 / 10 + stop2; // 生成随机参数
    float stops[] = { stop1, stop2, stop3 };
    ArkUI_ColorStop object = { .colors = colors, .stops = stops, .size = size };
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .f32 = x }, { .f32 = y }, { .f32 = radius }, { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4, .object = &object };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_RADIAL_GRADIENT, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_RADIAL_GRADIENT);
    bool condition = itemptr->value[3].i32 == flag;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextVerticalAlign(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_TextVerticalAlignment TextVerticalAlignment = ArkUI_TextVerticalAlignment(mt() % PARAM_4); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = TextVerticalAlignment } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_VERTICAL_ALIGN, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_VERTICAL_ALIGN);
    if (itemptr->value[0].i32 == TextVerticalAlignment && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextInputHalfLeading(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_INPUT_HALF_LEADING, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_INPUT_HALF_LEADING);
    if (itemptr->value[0].i32 == flag && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextInputKeyboardAppearance(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_KeyboardAppearance KeyboardAppearance = ArkUI_KeyboardAppearance(mt() % PARAM_4); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = KeyboardAppearance } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_INPUT_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_INPUT_KEYBOARD_APPEARANCE);
    if (itemptr->value[0].i32 == KeyboardAppearance && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextInputEnableFillAnimation(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_INPUT_ENABLE_FILL_ANIMATION, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_INPUT_ENABLE_FILL_ANIMATION);
    if (itemptr->value[0].i32 == flag && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextInputLineHeight(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t lineHeight = mt() % PARAM_30; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_INPUT);
    ArkUI_NumberValue value[] = { { .i32 = lineHeight } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_INPUT_LINE_HEIGHT, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_INPUT_LINE_HEIGHT);
    if (itemptr->value[0].i32 == lineHeight && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaInputFilter(napi_env env, napi_callback_info info)
{
    char* regular = "/<.*>/"; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem item = { .string = regular };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_INPUT_FILTER, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_INPUT_FILTER);
    if (strcmp(item.string, regular) == 0 && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaContentType(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_TextInputContentType TextInputContentType = ArkUI_TextInputContentType(mt() % PARAM_33); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = TextInputContentType } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_CONTENT_TYPE, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_CONTENT_TYPE);
    if (itemptr->value[0].i32 == TextInputContentType && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaHalfLeading(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_HALF_LEADING, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_HALF_LEADING);
    if (itemptr->value[0].i32 == flag && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaKeyboardAppearance(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_KeyboardAppearance KeyboardAppearance = ArkUI_KeyboardAppearance(mt() % PARAM_4); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = KeyboardAppearance } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_KEYBOARD_APPEARANCE, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_KEYBOARD_APPEARANCE);
    if (itemptr->value[0].i32 == KeyboardAppearance && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaMaxLines(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem item;
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_MAX_LINES);
    if (itemptr->value[0].i32 == PARAM_3) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaLineSpacing(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t lineSpacing = mt() % PARAM_10; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = lineSpacing } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_LINE_SPACING, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_LINE_SPACING);
    if (itemptr->value[0].i32 == lineSpacing && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaMinLines(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_MIN_LINES);
    if (itemptr->value[0].i32 == 0) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaMaxLinesWithScroll(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem item;
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_MAX_LINES_WITH_SCROLL);
    if (itemptr->value[0].i32 == PARAM_3) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextAreaLineHeight(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t lineHeight = mt() % PARAM_30; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = { { .i32 = lineHeight } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = TextComponent.setAttribute(NODE_TEXT_AREA_LINE_HEIGHT, &item);
    const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_AREA_LINE_HEIGHT);
    if (itemptr->value[0].i32 == lineHeight && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTextPickSelectedBackgroundStyle(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2;
    uint32_t color = mt() % PARAM_4294967296; // 生成随机参数
    float radius1 = mt() % PARAM_3600 / 10; // 生成随机参数
    float radius2 = mt() % PARAM_3600 / 10; // 生成随机参数
    float radius3 = mt() % PARAM_3600 / 10; // 生成随机参数
    float radius4 = mt() % PARAM_3600 / 10; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC TextComponent = XC(ARKUI_NODE_TEXT_PICKER);
    if (flag) {
        ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = radius1 } };
        ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
        int32_t setResult = TextComponent.setAttribute(NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE, &item);
        const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE);
        bool condition = itemptr->value[0].u32 == color;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else {
        ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = radius1 }, { .f32 = radius2 },
                                      { .f32 = radius3 }, { .f32 = radius4 } };
        ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
        int32_t setResult = TextComponent.setAttribute(NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE, &item);
        const ArkUI_AttributeItem* itemptr = TextComponent.getAttribute(NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE);
        bool condition = itemptr->value[0].u32 == color;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeBorderWidthPercent(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    float percent1 = mt() % PARAM_101 / 100.0; // 生成随机参数
    float percent2 = mt() % PARAM_101 / 100.0; // 生成随机参数
    float percent3 = mt() % PARAM_101 / 100.0; // 生成随机参数
    float percent4 = mt() % PARAM_101 / 100.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    int32_t setResult;
    if (flag) {
        ArkUI_NumberValue value[] = { { .f32 = percent1 }, { .f32 = percent2 },
                                      { .f32 = percent3 }, { .f32 = percent4 } };
        ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
        setResult = RowComponent.setAttribute(NODE_BORDER_WIDTH_PERCENT, &item);
    } else {
        ArkUI_NumberValue value[] = { { .f32 = percent1 } };
        ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
        setResult = RowComponent.setAttribute(NODE_BORDER_WIDTH_PERCENT, &item);
    }
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_BORDER_WIDTH_PERCENT);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - percent1 >= -exp && itemptr->value[0].f32 - percent1 <= exp;
    condition = condition && RowComponent.resetAttribute(NODE_BORDER_WIDTH_PERCENT) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeUniqueId(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_UNIQUE_ID);
    if (itemptr->value[0].i32 >= 0) {
        result = 1;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeFocusBox(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float distance = (mt() % PARAM_3 - 1); // 生成随机参数
    float width = mt() % PARAM_101 / 100.0; // 生成随机参数
    uint32_t color = mt() % PARAM_4294967296; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    RowComponent.SetPercentWidth(PARAM_0_POINT_5);
    RowComponent.SetPercentHeight(PARAM_0_POINT_5);
    RowComponent.SetBackgroundColor(color);
    RowComponent.SetId("rootnode");
    std::shared_ptr<ArkUICapiTest::Component> child = std::make_shared<ArkUICapiTest::XComponent>(RowComponent);
    ColumnComponent.AddChild(child);
    ArkUI_NumberValue value[] = { { .f32 = distance }, { .f32 = width },
                                  { .u32 = color } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3 };
    int32_t setResult = RowComponent.setAttribute(NODE_FOCUS_BOX, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_FOCUS_BOX);
    float exp = 0.000001;
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].f32 - distance >= -exp && itemptr->value[0].f32 - distance <= exp &&
                          itemptr->value[1].f32 - width >= -exp && itemptr->value[1].f32 - width <= exp &&
                          itemptr->value[2].u32 == color;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    ColumnComponent.RemoveChild(child);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeClickDistance(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float distance = (mt() % PARAM_21 - 10) / 10; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = { { .f32 = distance } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_CLICK_DISTANCE, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_CLICK_DISTANCE);
    float exp = 0.000001;
    if (itemptr != nullptr) {
        bool  condition = itemptr->value[0].f32 - distance >= -exp && itemptr->value[0].f32 - distance <= exp;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTabStop(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_TAB_STOP, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_TAB_STOP);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && RowComponent.resetAttribute(NODE_TAB_STOP) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeBackgroundImageResizableWithSlice(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float size1 = mt() % PARAM_101 / 2; // 生成随机参数
    float size2 = mt() % PARAM_101 / 2; // 生成随机参数
    float size3 = mt() % PARAM_101 / 2; // 生成随机参数
    float size4 = mt() % PARAM_101 / 2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = { { .f32 = size1 }, { .f32 = size2 },
                                  { .f32 = size3 }, { .f32 = size4 } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = RowComponent.setAttribute(NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - size1 >= -exp && itemptr->value[0].f32 - size1 <= exp &&
                     itemptr->value[1].f32 - size2 >= -exp && itemptr->value[1].f32 - size2 <= exp &&
                     itemptr->value[2].f32 - size3 >= -exp && itemptr->value[2].f32 - size3 <= exp &&
                     itemptr->value[3].f32 - size4 >= -exp && itemptr->value[3].f32 - size4 <= exp;
    condition = condition && RowComponent.resetAttribute(NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeNextFocus(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_FocusMove focusMove = ArkUI_FocusMove(mt() % PARAM_6); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = focusMove } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1, .object = TextComponent.GetComponent() };
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeVisibleAreaApproximateChangeRatio(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float value[] = { float(mt() % PARAM_11 / 10) }; // 生成随机参数
    int32_t size = 1;
    int32_t interval = mt() % PARAM_501 + 500; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_VisibleAreaEventOptions* VisibleAreaEventOptions = OH_ArkUI_VisibleAreaEventOptions_Create();
    OH_ArkUI_VisibleAreaEventOptions_SetRatios(VisibleAreaEventOptions, value, size);
    OH_ArkUI_VisibleAreaEventOptions_SetExpectedUpdateInterval(VisibleAreaEventOptions, interval);
    ArkUI_AttributeItem item = { .object = VisibleAreaEventOptions };
    int32_t setResult = RowComponent.setAttribute(NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_RATIO, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        float* reValue;
        int32_t reSize;
        int32_t reInterval;
        VisibleAreaEventOptions = static_cast<ArkUI_VisibleAreaEventOptions*>(itemptr->object);
        OH_ArkUI_VisibleAreaEventOptions_GetRatios(VisibleAreaEventOptions, reValue, &reSize);
        reInterval = OH_ArkUI_VisibleAreaEventOptions_GetExpectedUpdateInterval(VisibleAreaEventOptions);
        float exp = 0.000001;
        bool condition = reValue[0] - value[0] >= -exp && reValue[0] - value[0] <= exp && reSize == size &&
                         reInterval == interval;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTranslateWidthPercent(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float size1 = mt() % PARAM_11 / 10; // 生成随机参数
    float size2 = mt() % PARAM_11 / 10; // 生成随机参数
    float size3 = mt() % PARAM_11 / 10; // 生成随机参数
    bool size4 = mt() % PARAM_2; // 生成随机参数
    bool size5 = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = { { .f32 = size1 }, { .f32 = size2 },
                                  { .f32 = size3 }, { .i32 = size4 },
                                  { .i32 = size5 }};
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_5 };
    int32_t setResult = RowComponent.setAttribute(NODE_TRANSLATE_WITH_PERCENT, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_TRANSLATE_WITH_PERCENT);
    if (itemptr != nullptr) {
        float exp = 0.000001;
        bool condition = itemptr->value[0].f32 - size1 >= -exp && itemptr->value[0].f32 - size1 <= exp &&
                         itemptr->value[1].f32 - size2 >= -exp && itemptr->value[1].f32 - size2 <= exp &&
                         itemptr->value[2].f32 - size3 >= -exp && itemptr->value[2].f32 - size3 <= exp &&
                         itemptr->value[3].i32 == size4 && itemptr->value[4].i32 == size5;
        condition = condition && RowComponent.resetAttribute(NODE_TRANSLATE_WITH_PERCENT) == ARKUI_ERROR_CODE_NO_ERROR;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeRotateAngle(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float setX = mt() % PARAM_101 / 10.0; // 生成随机参数
    float setY = mt() % PARAM_101 / 10.0; // 生成随机参数
    float setZ = mt() % PARAM_101 / 10.0; // 生成随机参数
    float setDistance = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    ArkUI_NumberValue value[] = { { .f32 = setX }, { .f32 = setY },
                                  { .f32 = setZ }, { .f32 = setDistance } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = RowComponent.setAttribute(NODE_ROTATE_ANGLE, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_ROTATE_ANGLE);
    if (itemptr != nullptr) {
        float exp = 0.000001;
        bool condition = itemptr->value[0].f32 - setX >= -exp && itemptr->value[0].f32 - setX <= exp &&
                         itemptr->value[1].f32 - setY >= -exp && itemptr->value[1].f32 - setY <= exp &&
                         itemptr->value[2].f32 - setZ >= -exp && itemptr->value[2].f32 - setZ <= exp &&
                         itemptr->value[3].f32 - setDistance >= -exp && itemptr->value[3].f32 - setDistance <= exp;
        condition = condition && RowComponent.resetAttribute(NODE_ROTATE_ANGLE) == ARKUI_ERROR_CODE_NO_ERROR;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeImmutableFontWeight(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_FontWeight fontWeight = ArkUI_FontWeight(mt() % PARAM_15); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = { { .i32 = fontWeight } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_IMMUTABLE_FONT_WEIGHT, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_IMMUTABLE_FONT_WEIGHT);
    bool condition = itemptr->value[0].i32 == fontWeight;
    condition = condition && RowComponent.resetAttribute(NODE_IMMUTABLE_FONT_WEIGHT) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeImageSpanBaselineOffset(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float offset = mt() % PARAM_1001 / 100.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_IMAGE_SPAN);
    ArkUI_NumberValue value[] = { { .f32 = offset } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_IMAGE_SPAN_BASELINE_OFFSET, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_IMAGE_SPAN_BASELINE_OFFSET);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - offset >= -exp && itemptr->value[0].f32 - offset <= exp;
    condition = condition && RowComponent.resetAttribute(NODE_IMAGE_SPAN_BASELINE_OFFSET) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeImageSyncLoad(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ImageComponent = XC(ARKUI_NODE_IMAGE);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ImageComponent.setAttribute(NODE_IMAGE_SYNC_LOAD, &item);
    const ArkUI_AttributeItem* itemptr = ImageComponent.getAttribute(NODE_IMAGE_SYNC_LOAD);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == flag;
        condition = condition && ImageComponent.resetAttribute(NODE_IMAGE_SYNC_LOAD) == ARKUI_ERROR_CODE_NO_ERROR;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeImageSyncLoad: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeButtonMinFontScale(napi_env env, napi_callback_info info)
{
    float scale = 1.0;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue value[] = { { .f32 = scale } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_BUTTON_MIN_FONT_SCALE, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_BUTTON_MIN_FONT_SCALE);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - scale >= -exp && itemptr->value[0].f32 - scale <= exp;
    condition = condition && RowComponent.resetAttribute(NODE_BUTTON_MIN_FONT_SCALE) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeButtonMinFontScale: %{public}d",
                 setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "condition: %{public}f",
                 itemptr->value[0].f32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "condition: %{public}f",
                 scale);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeButtonMaxFontScale(napi_env env, napi_callback_info info)
{
    float scale = 1.0;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_BUTTON);
    ArkUI_NumberValue value[] = { { .f32 = scale } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_BUTTON_MAX_FONT_SCALE, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_BUTTON_MAX_FONT_SCALE);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - scale >= -exp && itemptr->value[0].f32 - scale <= exp;
    condition = condition && RowComponent.resetAttribute(NODE_BUTTON_MAX_FONT_SCALE) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeButtonMaxFontScale: %{public}d",
                 setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "condition: %{public}f",
                 itemptr->value[0].f32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "condition: %{public}f",
                 scale);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeXComponentSurfaceSize(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_XCOMPONENT);
    RowComponent.SetXComponentType(ARKUI_XCOMPONENT_TYPE_SURFACE);
    RowComponent.SetXComponentId("test");
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_XCOMPONENT_SURFACE_SIZE);
    bool condition = itemptr->value[0].u32 == 0 && itemptr->value[1].u32 == 0;
    if (condition) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                 "CheckAttribute", "NODE_XCOMPONENT_SURFACE_SIZEsetResult: %{public}d",
                 itemptr->value[0].u32);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeXComponentSurfaceRect(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    int32_t setX = mt() % PARAM_100; // 生成随机参数
    int32_t setY = mt() % PARAM_100; // 生成随机参数
    int32_t width = mt() % PARAM_100; // 生成随机参数
    int32_t height = mt() % PARAM_100; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    if (ColumnComponent.GetChildren().size() == 0) {
        std::shared_ptr<XC> ptr = std::shared_ptr<XC>(&XComponentRect);
        ColumnComponent.AddChild(ptr);
    }
    ArkUI_NumberValue value[] = { { .i32 = setX }, { .i32 = setY }, { .i32 = width }, { .i32 = height } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4 };
    int32_t setResult = XComponentRect.setAttribute(NODE_XCOMPONENT_SURFACE_RECT, &item);
    auto itemptr = XComponentRect.getAttribute(NODE_XCOMPONENT_SURFACE_RECT);
    bool condition = itemptr->value[PARAM_0].i32 == setX && itemptr->value[PARAM_1].i32 == setY &&
                     itemptr->value[PARAM_2].i32 == width && itemptr->value[PARAM_3].i32 == height;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect setResult: %{public}d", setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect setX getResult: %{public}d", itemptr->value[PARAM_0].i32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect setY getResult: %{public}d", itemptr->value[PARAM_1].i32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect width getResult: %{public}d", itemptr->value[PARAM_2].i32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect height getResult: %{public}d", itemptr->value[PARAM_3].i32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect setX set: %{public}d", setX);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect setY set: %{public}d", setY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect width set: %{public}d", width);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeXComponentSurfaceRect height set: %{public}d", height);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeDatePickerCanLoop(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_DATE_PICKER);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RowComponent.setAttribute(NODE_DATE_PICKER_CAN_LOOP, &item);
    const ArkUI_AttributeItem* itemptr = RowComponent.getAttribute(NODE_DATE_PICKER_CAN_LOOP);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && RowComponent.resetAttribute(NODE_DATE_PICKER_CAN_LOOP) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTimePickerStart(napi_env env, napi_callback_info info)
{
    char* startTime = "5:20";
    napi_value retValue = 0;
    int32_t result = 0;
    XC TimePickerComponent = XC(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue value[] = { { .i32 = true } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    TimePickerComponent.setAttribute(NODE_TIME_PICKER_USE_MILITARY_TIME, &item);
    item = { .string = startTime };
    int32_t setResult = TimePickerComponent.setAttribute(NODE_TIME_PICKER_START, &item);
    const ArkUI_AttributeItem* itemptr = TimePickerComponent.getAttribute(NODE_TIME_PICKER_START);
    bool condition = strcmp(itemptr->string, "5:20:0") == 0;
    condition = condition && TimePickerComponent.resetAttribute(NODE_TIME_PICKER_START) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_STARTsetResult: %{public}d",
                 setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_STARTsetResult: %{public}s",
                 itemptr->string);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_STARTsetResult: %{public}s",
                 startTime);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeTimePickerEnd(napi_env env, napi_callback_info info)
{
    char* endTime = "13:14";
    napi_value retValue = 0;
    int32_t result = 0;
    XC TimePickerComponent = XC(ARKUI_NODE_TIME_PICKER);
    ArkUI_NumberValue value[] = { { .i32 = true } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    TimePickerComponent.setAttribute(NODE_TIME_PICKER_USE_MILITARY_TIME, &item);
    item = { .string = endTime };
    int32_t setResult = TimePickerComponent.setAttribute(NODE_TIME_PICKER_END, &item);
    const ArkUI_AttributeItem* itemptr = TimePickerComponent.getAttribute(NODE_TIME_PICKER_END);
    bool condition = strcmp(itemptr->string, "13:14:0") == 0;
    condition = condition && TimePickerComponent.resetAttribute(NODE_TIME_PICKER_START) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}s",
                 itemptr->string);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}s",
                 endTime);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSliderPrefix(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC SliderComponent = XC(ARKUI_NODE_SLIDER);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    TextComponent.SetWidth(PARAM_15);
    TextComponent.SetHeight(PARAM_15);
    TextComponent.SetBackgroundColor(0xff23dcff);
    ArkUI_AttributeItem item = { .object = TextComponent.GetComponent() };
    int32_t setResult = SliderComponent.setAttribute(NODE_SLIDER_PREFIX, &item);
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSliderSuffix(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC SliderComponent = XC(ARKUI_NODE_SLIDER);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    TextComponent.SetWidth(PARAM_15);
    TextComponent.SetHeight(PARAM_15);
    TextComponent.SetBackgroundColor(0xff23dcff);
    ArkUI_AttributeItem item = { .object = TextComponent.GetComponent() };
    int32_t setResult = SliderComponent.setAttribute(NODE_SLIDER_SUFFIX, &item);
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeCheckboxGroupSelectedColor(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    uint32_t color = mt() % PARAM_4294967296; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC CheckboxGroupComponent = XC(ARKUI_NODE_CHECKBOX_GROUP);
    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = CheckboxGroupComponent.setAttribute(NODE_CHECKBOX_GROUP_SELECTED_COLOR, &item);
    const ArkUI_AttributeItem* itemptr = CheckboxGroupComponent.getAttribute(NODE_CHECKBOX_GROUP_SELECTED_COLOR);
    bool condition = itemptr->value[0].u32 == color;
    condition = condition && CheckboxGroupComponent.resetAttribute(NODE_CHECKBOX_GROUP_SELECTED_COLOR) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeCheckboxGroupUnselectedColor(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    uint32_t color = mt() % PARAM_4294967296; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC CheckboxGroupComponent = XC(ARKUI_NODE_CHECKBOX_GROUP);
    ArkUI_NumberValue value[] = { { .u32 = color } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = CheckboxGroupComponent.setAttribute(NODE_CHECKBOX_GROUP_UNSELECTED_COLOR, &item);
    const ArkUI_AttributeItem* itemptr = CheckboxGroupComponent.getAttribute(NODE_CHECKBOX_GROUP_UNSELECTED_COLOR);
    bool condition = itemptr->value[0].u32 == color;
    condition = condition && CheckboxGroupComponent.resetAttribute(NODE_CHECKBOX_GROUP_UNSELECTED_COLOR) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeCheckboxGroupMark(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    uint32_t color = mt() % PARAM_4294967296; // 生成随机参数
    float size = mt() % PARAM_101 / 10.0; // 生成随机参数
    float weight = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC CheckboxGroupComponent = XC(ARKUI_NODE_CHECKBOX_GROUP);
    ArkUI_NumberValue value[] = { { .u32 = color }, { .f32 = size }, { .f32 = weight } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3 };
    int32_t setResult = CheckboxGroupComponent.setAttribute(NODE_CHECKBOX_GROUP_MARK, &item);
    const ArkUI_AttributeItem* itemptr = CheckboxGroupComponent.getAttribute(NODE_CHECKBOX_GROUP_MARK);
    float exp = 0.000001;
    bool condition = itemptr->value[0].u32 == color &&
                     itemptr->value[1].f32 - size >= -exp && itemptr->value[1].f32 - size <= exp &&
                     itemptr->value[2].f32 - weight >= -exp && itemptr->value[2].f32 - weight <= exp;
    condition = condition && CheckboxGroupComponent.resetAttribute(NODE_CHECKBOX_GROUP_MARK) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeCheckboxGroupShape(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_CheckboxShape shape = ArkUI_CheckboxShape(mt() % PARAM_2); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC CheckboxGroupComponent = XC(ARKUI_NODE_CHECKBOX_GROUP);
    ArkUI_NumberValue value[] = { { .i32 = shape } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = CheckboxGroupComponent.setAttribute(NODE_CHECKBOX_GROUP_SHAPE, &item);
    const ArkUI_AttributeItem* itemptr = CheckboxGroupComponent.getAttribute(NODE_CHECKBOX_GROUP_SHAPE);
    bool condition = itemptr->value[0].i32 == shape;
    condition = condition && CheckboxGroupComponent.resetAttribute(NODE_CHECKBOX_GROUP_SHAPE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeScrollFling(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float velocity = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ScrollComponent = XC(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .f32 = velocity } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ScrollComponent.setAttribute(NODE_SCROLL_FLING, &item);
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeScrollFadingEdge(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    float size = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ScrollComponent = XC(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = flag }, { .f32 = size } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
    int32_t setResult = ScrollComponent.setAttribute(NODE_SCROLL_FADING_EDGE, &item);
    const ArkUI_AttributeItem* itemptr = ScrollComponent.getAttribute(NODE_SCROLL_FADING_EDGE);
    float exp = 0.000001;
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && ScrollComponent.resetAttribute(NODE_SCROLL_FADING_EDGE) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_SCROLL_FADING_EDGEsetResult: %{public}d",
                 setResult);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_SCROLL_FADING_EDGEsetResult: %{public}f",
                 itemptr->value[1].f32);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_SCROLL_FADING_EDGEsetResult: %{public}f",
                 size);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeScrollFlingSpeedLimit(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float velocity = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ScrollComponent = XC(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .f32 = velocity } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ScrollComponent.setAttribute(NODE_SCROLL_FLING_SPEED_LIMIT, &item);
    const ArkUI_AttributeItem* itemptr = ScrollComponent.getAttribute(NODE_SCROLL_FLING_SPEED_LIMIT);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - velocity >= -exp && itemptr->value[0].f32 - velocity <= exp;
    condition = condition && ScrollComponent.resetAttribute(NODE_SCROLL_FLING_SPEED_LIMIT) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeScrollClipContent(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_ContentClipMode contentClipMode = ArkUI_ContentClipMode(mt() % PARAM_3); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ScrollComponent = XC(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .i32 = contentClipMode } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ScrollComponent.setAttribute(NODE_SCROLL_CLIP_CONTENT, &item);
    const ArkUI_AttributeItem* itemptr = ScrollComponent.getAttribute(NODE_SCROLL_CLIP_CONTENT);
    float exp = 0.000001;
    bool condition = itemptr->value[0].i32 == contentClipMode;
    condition = condition && ScrollComponent.resetAttribute(NODE_SCROLL_CLIP_CONTENT) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeScrollBarMargin(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float marginStart = mt() % PARAM_101 / 10.0; // 生成随机参数
    float marginEnd = mt() % PARAM_101 / 10.0; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ScrollComponent = XC(ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = { { .f32 = marginStart }, { .f32 = marginEnd } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
    int32_t setResult = ScrollComponent.setAttribute(NODE_SCROLL_BAR_MARGIN, &item);
    const ArkUI_AttributeItem* itemptr = ScrollComponent.getAttribute(NODE_SCROLL_BAR_MARGIN);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - marginStart >= -exp && itemptr->value[0].f32 - marginStart <= exp &&
                     itemptr->value[1].f32 - marginEnd >= -exp && itemptr->value[1].f32 - marginEnd <= exp;
    condition = condition && ScrollComponent.resetAttribute(NODE_SCROLL_BAR_MARGIN) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeListStackFromEnd(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ListComponent = XC(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ListComponent.setAttribute(NODE_LIST_STACK_FROM_END, &item);
    const ArkUI_AttributeItem* itemptr = ListComponent.getAttribute(NODE_LIST_STACK_FROM_END);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && ListComponent.resetAttribute(NODE_LIST_STACK_FROM_END) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeListFocusWrapMode(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_FocusWrapMode focusWrapMode = ArkUI_FocusWrapMode(mt() % PARAM_2); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ListComponent = XC(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .i32 = focusWrapMode } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ListComponent.setAttribute(NODE_LIST_FOCUS_WRAP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = ListComponent.getAttribute(NODE_LIST_FOCUS_WRAP_MODE);
    bool condition = itemptr->value[0].i32 == focusWrapMode;
    condition = condition && ListComponent.resetAttribute(NODE_LIST_FOCUS_WRAP_MODE) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeListSyncLoad(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC ListComponent = XC(ARKUI_NODE_LIST);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = ListComponent.setAttribute(NODE_LIST_SYNC_LOAD, &item);
    const ArkUI_AttributeItem* itemptr = ListComponent.getAttribute(NODE_LIST_SYNC_LOAD);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && ListComponent.resetAttribute(NODE_LIST_SYNC_LOAD) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeListSyncLoad: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSwiperIndicatorInteractive(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC SwiperComponent = XC(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = SwiperComponent.setAttribute(NODE_SWIPER_INDICATOR_INTERACTIVE, &item);
    const ArkUI_AttributeItem* itemptr = SwiperComponent.getAttribute(NODE_SWIPER_INDICATOR_INTERACTIVE);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && SwiperComponent.resetAttribute(NODE_SWIPER_INDICATOR_INTERACTIVE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSwiperPageFlipMode(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_PageFlipMode pageFlipMode = ArkUI_PageFlipMode(mt() % PARAM_2); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC SwiperComponent = XC(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = pageFlipMode } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = SwiperComponent.setAttribute(NODE_SWIPER_PAGE_FLIP_MODE, &item);
    const ArkUI_AttributeItem* itemptr = SwiperComponent.getAttribute(NODE_SWIPER_PAGE_FLIP_MODE);
    bool condition = itemptr->value[0].i32 == pageFlipMode;
    condition = condition && SwiperComponent.resetAttribute(NODE_SWIPER_PAGE_FLIP_MODE) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSwiperAutoFill(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float visionDistance = mt() % PARAM_101 / 0.5;
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC SwiperComponent = XC(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .f32 = visionDistance }, { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_2 };
    int32_t setResult = SwiperComponent.setAttribute(NODE_SWIPER_AUTO_FILL, &item);
    const ArkUI_AttributeItem* itemptr = SwiperComponent.getAttribute(NODE_SWIPER_AUTO_FILL);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - visionDistance >= -exp && itemptr->value[0].f32 - visionDistance <= exp &&
                     itemptr->value[1].i32 == flag;
    condition = condition && SwiperComponent.resetAttribute(NODE_SWIPER_AUTO_FILL) == ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeSwiperMaintainVisibleContentPosition(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC SwiperComponent = XC(ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = SwiperComponent.setAttribute(NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION, &item);
    const ArkUI_AttributeItem* itemptr = SwiperComponent.getAttribute(NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION);
    bool condition = itemptr->value[0].i32 == flag;
    condition = condition && SwiperComponent.resetAttribute(NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeRefreshMaxPullDownDistance(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    float refreshDistance = mt() % PARAM_101 / 0.5;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RefreshComponent = XC(ARKUI_NODE_REFRESH);
    ArkUI_NumberValue value[] = { { .f32 = refreshDistance } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = RefreshComponent.setAttribute(NODE_REFRESH_MAX_PULL_DOWN_DISTANCE, &item);
    const ArkUI_AttributeItem* itemptr = RefreshComponent.getAttribute(NODE_REFRESH_MAX_PULL_DOWN_DISTANCE);
    float exp = 0.000001;
    bool condition = itemptr->value[0].f32 - refreshDistance >= -exp && itemptr->value[0].f32 - refreshDistance <= exp;
    condition = condition && RefreshComponent.resetAttribute(NODE_REFRESH_MAX_PULL_DOWN_DISTANCE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeWaterFlowLayoutMode(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    ArkUI_WaterFlowLayoutMode waterFlowLayoutMode = ArkUI_WaterFlowLayoutMode(mt() % PARAM_2); // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC WaterFlowComponent = XC(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = waterFlowLayoutMode } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = WaterFlowComponent.setAttribute(NODE_WATER_FLOW_LAYOUT_MODE, &item);
    const ArkUI_AttributeItem* itemptr = WaterFlowComponent.getAttribute(NODE_WATER_FLOW_LAYOUT_MODE);
    bool condition = itemptr->value[0].i32 == waterFlowLayoutMode;
    condition = condition && WaterFlowComponent.resetAttribute(NODE_WATER_FLOW_LAYOUT_MODE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeWaterFlowSyncLoad(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC WaterFlowComponent = XC(ARKUI_NODE_WATER_FLOW);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = WaterFlowComponent.setAttribute(NODE_WATER_FLOW_SYNC_LOAD, &item);
    const ArkUI_AttributeItem* itemptr = WaterFlowComponent.getAttribute(NODE_WATER_FLOW_SYNC_LOAD);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == flag;
        condition = condition && WaterFlowComponent.resetAttribute(NODE_WATER_FLOW_SYNC_LOAD) ==
                    ARKUI_ERROR_CODE_NO_ERROR;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeWaterFlowSyncLoad: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeRelativeContainerGuideLine(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC RelativeContainerComponent = XC(ARKUI_NODE_RELATIVE_CONTAINER);
    ArkUI_GuidelineOption* option = OH_ArkUI_GuidelineOption_Create(0);
    ArkUI_AttributeItem item = { .object = option };
    int32_t setResult = RelativeContainerComponent.setAttribute(NODE_RELATIVE_CONTAINER_GUIDE_LINE, &item);
    const ArkUI_AttributeItem* itemptr = RelativeContainerComponent.getAttribute(NODE_RELATIVE_CONTAINER_GUIDE_LINE);
    bool condition = itemptr->object == option;
    condition = condition && RelativeContainerComponent.resetAttribute(NODE_RELATIVE_CONTAINER_GUIDE_LINE) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute",
                 "CheckNodeRelativeContainerGuideLine: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeRelativeContainerBarrier(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    size_t size = mt() % PARAM_10; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC RelativeContainerComponent = XC(ARKUI_NODE_RELATIVE_CONTAINER);
    ArkUI_BarrierOption* option = OH_ArkUI_BarrierOption_Create(size);
    ArkUI_AttributeItem item = { .object = option };
    int32_t setResult = RelativeContainerComponent.setAttribute(NODE_RELATIVE_CONTAINER_BARRIER, &item);
    const ArkUI_AttributeItem* itemptr = RelativeContainerComponent.getAttribute(NODE_RELATIVE_CONTAINER_BARRIER);
    bool condition = itemptr->object == option;
    condition = condition && RelativeContainerComponent.resetAttribute(NODE_RELATIVE_CONTAINER_BARRIER) ==
                ARKUI_ERROR_CODE_NO_ERROR;
    if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeGridSyncLoad(napi_env env, napi_callback_info info)
{
    std::random_device randomNumber; // 随机数种子生成器
    std::mt19937 mt(randomNumber()); // 随机数生成器
    bool flag = mt() % PARAM_2; // 生成随机参数
    napi_value retValue = 0;
    int32_t result = 0;
    XC GridComponent = XC(ARKUI_NODE_GRID);
    ArkUI_NumberValue value[] = { { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_1 };
    int32_t setResult = GridComponent.setAttribute(NODE_GRID_SYNC_LOAD, &item);
    const ArkUI_AttributeItem* itemptr = GridComponent.getAttribute(NODE_GRID_SYNC_LOAD);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == flag;
        condition = condition && GridComponent.resetAttribute(NODE_GRID_SYNC_LOAD) == ARKUI_ERROR_CODE_NO_ERROR;
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "CheckNodeGridSyncLoad: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeEmbeddedComponentWant(napi_env env, napi_callback_info info)
{
    napi_value retValue = 0;
    int32_t result = 0;
    XC EmbeddedComponentComponent = XC(ARKUI_NODE_EMBEDDED_COMPONENT);
    AbilityBase_Element Element = {
        .bundleName = "com.example.embeddeddemo",
        .abilityName = "EmbeddedUIExtensionAbility",
        .moduleName = ""
    };
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(Element);
    ArkUI_AttributeItem itemobjwant = { .object = want };
    int32_t setResult = EmbeddedComponentComponent.setAttribute(NODE_EMBEDDED_COMPONENT_WANT, &itemobjwant);
    if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
        result = 0;
    } else {
        result = PARAM_NEGATIVE_9;
    }
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckAttribute", "NODE_TIME_PICKER_ENDsetResult: %{public}d",
                 setResult);
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CreateAttributeNativeNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "CreateNativeNode napi_get_cb_info failed");
    }
    if (argCnt != PARAM_1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &nodeContentHandle);
    auto nodeContentEvent = [](ArkUI_NodeContentEvent *event) {
        ArkUI_NodeContentHandle handle = OH_ArkUI_NodeContentEvent_GetNodeContentHandle(event);
        if (OH_ArkUI_NodeContentEvent_GetEventType(event) == NODE_CONTENT_EVENT_ON_ATTACH_TO_WINDOW) {
            InitNode();
            OH_ArkUI_NodeContent_AddNode(handle, ColumnComponent.GetComponent());
        }
    };
    OH_ArkUI_NodeContent_RegisterCallback(nodeContentHandle, nodeContentEvent);
    return nullptr;
}

napi_value CheckNodeFocusMoveForward(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_FORWARD;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeFocusMoveBackward(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_BACKWARD;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeFocusMoveUp(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_UP;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

napi_value CheckNodeFocusMoveDown(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_DOWN;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}


napi_value CheckNodeFocusMoveLeft(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_LEFT;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}


napi_value CheckNodeFocusMoveRight(napi_env env, napi_callback_info info)
{
    ArkUI_FocusMove focusMove = ARKUI_FOCUS_MOVE_RIGHT;
    napi_value retValue = 0;
    int32_t result = 0;
    XC RowComponent = XC(ARKUI_NODE_ROW);
    XC TextComponent = XC(ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = focusMove}};
    ArkUI_AttributeItem item = {.value = value, .size = PARAM_1, .object = TextComponent.GetComponent()};
    int32_t setResult = RowComponent.setAttribute(NODE_NEXT_FOCUS, &item);
    const ArkUI_AttributeItem *itemptr = RowComponent.getAttribute(NODE_NEXT_FOCUS);
    if (itemptr != nullptr) {
        bool condition = itemptr->value[0].i32 == focusMove && itemptr->object == TextComponent.GetComponent();
        if (condition && setResult == ARKUI_ERROR_CODE_NO_ERROR) {
            result = 1;
        } else if (setResult != ARKUI_ERROR_CODE_NO_ERROR) {
            result = 0;
        } else {
            result = PARAM_NEGATIVE_9;
        }
    } else if (setResult == ARKUI_ERROR_CODE_NO_ERROR) {
        result = 1;
    } else {
        result = 0;
    }
    napi_create_int32(env, result, &retValue);
    return retValue;
}

void InitNode()
{
    ColumnComponent.SetPercentWidth(PARAM_0_POINT_5);
    ColumnComponent.SetPercentHeight(PARAM_0_POINT_5);
    ColumnComponent.SetBackgroundColor(0xff3d8aed);
    ColumnComponent.SetId("rootnode");
}

}
