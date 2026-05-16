/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>
#include <arkui/styled_string.h>

bool g_onlyBetweenLines = true;
float FLOAT_10 = 10;
float FLOAT_30 = 30;

namespace ArkUICapiTest {

static napi_value TextEnumTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_TEXT_SELECTION_CHANGE TextEnumTest_001 result=%{public}d",
        NODE_TEXT_ON_TEXT_SELECTION_CHANGE);
    ASSERT_EQ(PARAM_1002, NODE_TEXT_ON_TEXT_SELECTION_CHANGE);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_COPY TextEnumTest_002 result=%{public}d",
        NODE_TEXT_ON_COPY);
    ASSERT_EQ(PARAM_1003, NODE_TEXT_ON_COPY);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ON_WILL_COPY TextEnumTest_003 result=%{public}d",
        NODE_TEXT_ON_WILL_COPY);
    ASSERT_EQ(PARAM_1004, NODE_TEXT_ON_WILL_COPY);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION TextEnumTest_004 result=%{public}d",
        NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_1047, NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_CONTROLLER TextEnumTest_005 result=%{public}d",
        NODE_TEXT_CONTROLLER);
    ASSERT_EQ(PARAM_1054, NODE_TEXT_CONTROLLER);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION TextEnumTest_006 result=%{public}d",
        NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION);
    ASSERT_EQ(PARAM_22028, NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING TextEnumTest_007 result=%{public}d",
        NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING);
    ASSERT_EQ(PARAM_22029, NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Custom, ARKUI_NODE_CUSTOM);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING TextEnumTest_008 result=%{public}d",
        OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING);
    ASSERT_EQ(PARAM_8, OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING);
    NAPI_END(Custom);
}

static napi_value TextEnumTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto controller = OH_ArkUI_TextController_Create();
    ASSERT_EQ((controller != nullptr), true);

    ArkUI_AttributeItem controllerItem = {.object = controller};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTROLLER, &controllerItem);

    OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
    ArkUI_StyledString_Descriptor *styledString =
        OH_ArkUI_StyledString_Descriptor_CreateWithString("行高样式示例", spanStyles, PARAM_1);
    auto result1_1 = OH_ArkUI_TextController_SetStyledString(controller, styledString);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result1_1 TextEnumTest_009 result=%{public}d", result1_1);
    ASSERT_EQ(result1_1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_SpanStyle_Destroy(spanStyle);
    OH_ArkUI_TextController_Destroy(controller);
    OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
    NAPI_END(text);
}

static napi_value TextEnumTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
    ArkUI_StyledString_Descriptor *styledString =
        OH_ArkUI_StyledString_Descriptor_CreateWithString("行高样式示例", spanStyles, PARAM_1);
    auto result2_1 = OH_ArkUI_TextController_SetStyledString(nullptr, styledString);

    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result2_1 TextEnumTest_010 result=%{public}d", result2_1);
    ASSERT_EQ(result2_1, ARKUI_ERROR_CODE_PARAM_INVALID);

    OH_ArkUI_SpanStyle_Destroy(spanStyle);
    OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
    NAPI_END(text);
}

static napi_value TextEnumTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto controller = OH_ArkUI_TextController_Create();

    ArkUI_AttributeItem controllerItem = {.object = controller};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTROLLER, &controllerItem);

    auto result3_1 = OH_ArkUI_TextController_SetStyledString(controller, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result3_1 TextEnumTest_011 result=%{public}d", result3_1);
    ASSERT_EQ(result3_1, ARKUI_ERROR_CODE_PARAM_INVALID);

    OH_ArkUI_TextController_Destroy(controller);
    NAPI_END(text);
}

static napi_value TextEnumTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto lineHeightStyle = OH_ArkUI_LineHeightStyle_Create();
    ASSERT_EQ((lineHeightStyle != nullptr), true);

    OH_ArkUI_LineHeightStyle_SetLineHeight(lineHeightStyle, FLOAT_10);
    auto result4_1 = OH_ArkUI_LineHeightStyle_SetLineHeightMultiple(lineHeightStyle, FLOAT_10);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result4_1 TextEnumTest_012 result=%{public}d", result4_1);
    ASSERT_EQ(result4_1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LineHeightStyle_Destroy(lineHeightStyle);
    NAPI_END(text);
}

static napi_value TextEnumTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const OH_ArkUI_LineHeightStyle *lineHeightStyle2 = OH_ArkUI_LineHeightStyle_Create();
    auto result5_1 = OH_ArkUI_LineHeightStyle_GetLineHeightMultiple(lineHeightStyle2, &FLOAT_10);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result5_1 TextEnumTest_013 result=%{public}d", result5_1);
    ASSERT_EQ(result5_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextEnumTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result6_1 = OH_ArkUI_LineHeightStyle_SetLineHeightMultiple(nullptr, FLOAT_10);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result6_1 TextEnumTest_014 result=%{public}d", result6_1);
    ASSERT_EQ(result6_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result7_1 = OH_ArkUI_LineHeightStyle_GetLineHeightMultiple(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result7_1 TextEnumTest_015 result=%{public}d", result7_1);
    ASSERT_EQ(result7_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    OH_ArkUI_LineSpacingStyle_SetLineSpacing(lineSpacingStyle, FLOAT_30);
    OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(lineSpacingStyle, g_onlyBetweenLines);

    OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    OH_ArkUI_SpanStyle_SetStart(spanStyle, PARAM_0);
    OH_ArkUI_SpanStyle_SetLength(spanStyle, PARAM_12);
    auto result8_1 = OH_ArkUI_SpanStyle_SetLineSpacingStyle(spanStyle, lineSpacingStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result8_1 TextEnumTest_016 result=%{public}d", result8_1);
    ASSERT_EQ(result8_1, ARKUI_ERROR_CODE_NO_ERROR);

    const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
    ArkUI_StyledString_Descriptor *styledString =
        OH_ArkUI_StyledString_Descriptor_CreateWithString("行间距样式示例\n段落内容", spanStyles, PARAM_1);

    OH_ArkUI_SpanStyle_Destroy(spanStyle);
    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
    NAPI_END(text);
}

static napi_value TextEnumTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    auto result9_1 = OH_ArkUI_LineSpacingStyle_SetLineSpacing(lineSpacingStyle, FLOAT_30);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result9_1 TextEnumTest_017 result=%{public}d", result9_1);
    ASSERT_EQ(result9_1, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    NAPI_END(text);
}

static napi_value TextEnumTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result10_1 = OH_ArkUI_LineSpacingStyle_SetLineSpacing(nullptr, FLOAT_30);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result10_1 TextEnumTest_018 result=%{public}d", result10_1);
    ASSERT_EQ(result10_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    auto result11_1 = OH_ArkUI_LineSpacingStyle_GetLineSpacing(lineSpacingStyle, &FLOAT_30);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result11_1 TextEnumTest_019 result=%{public}d", result11_1);
    ASSERT_EQ(result11_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextEnumTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    auto result12_1 = OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(lineSpacingStyle, g_onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result12_1 TextEnumTest_020 result=%{public}d", result12_1);
    ASSERT_EQ(result12_1, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    NAPI_END(text);
}

static napi_value TextEnumTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    auto result13_1 = OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines(lineSpacingStyle, &g_onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result13_1 TextEnumTest_021 result=%{public}d", result13_1);
    ASSERT_EQ(result13_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextEnumTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result14_1 = OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(nullptr, g_onlyBetweenLines);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result14_1 TextEnumTest_022 result=%{public}d", result14_1);
    ASSERT_EQ(result14_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result15_1 = OH_ArkUI_LineSpacingStyle_GetLineSpacing(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result15_1 TextEnumTest_023 result=%{public}d", result15_1);
    ASSERT_EQ(result15_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result16_1 = OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result16_1 TextEnumTest_024 result=%{public}d", result16_1);
    ASSERT_EQ(result16_1, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    OH_ArkUI_LineSpacingStyle_SetLineSpacing(lineSpacingStyle, FLOAT_30);
    OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(lineSpacingStyle, g_onlyBetweenLines);

    auto result_25 = OH_ArkUI_SpanStyle_SetLineSpacingStyle(nullptr, lineSpacingStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_25 TextEnumTest_025 result=%{public}d", result_25);
    ASSERT_EQ(result_25, ARKUI_ERROR_CODE_PARAM_INVALID);

    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    NAPI_END(text);
}

static napi_value TextEnumTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    OH_ArkUI_SpanStyle_SetStart(spanStyle, PARAM_0);
    OH_ArkUI_SpanStyle_SetLength(spanStyle, PARAM_12);
    auto result_26 = OH_ArkUI_SpanStyle_SetLineSpacingStyle(spanStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_26 TextEnumTest_026 result=%{public}d", result_26);
    ASSERT_EQ(result_26, ARKUI_ERROR_CODE_PARAM_INVALID);

    const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
    ArkUI_StyledString_Descriptor *styledString =
        OH_ArkUI_StyledString_Descriptor_CreateWithString("行间距样式示例\n段落内容", spanStyles, PARAM_1);

    OH_ArkUI_SpanStyle_Destroy(spanStyle);
    OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
    NAPI_END(text);
}

static napi_value TextEnumTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result_27 = OH_ArkUI_SpanStyle_SetLineSpacingStyle(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_27 TextEnumTest_027 result=%{public}d", result_27);
    ASSERT_EQ(result_27, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result_28 = OH_ArkUI_SpanStyle_SetStart(nullptr, PARAM_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_28 TextEnumTest_028 result=%{public}d", result_28);
    ASSERT_EQ(result_28, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result_29 = OH_ArkUI_SpanStyle_SetLength(nullptr, PARAM_12);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_29 TextEnumTest_029 result=%{public}d", result_29);
    ASSERT_EQ(result_29, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_030(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result_30 = OH_ArkUI_LineHeightStyle_SetLineHeight(nullptr, FLOAT_10);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_30 TextEnumTest_030 result=%{public}d", result_30);
    ASSERT_EQ(result_30, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_031(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    OH_ArkUI_LineSpacingStyle_SetLineSpacing(lineSpacingStyle, FLOAT_30);
    OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(lineSpacingStyle, g_onlyBetweenLines);

    OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    OH_ArkUI_SpanStyle_SetStart(spanStyle, PARAM_0);
    OH_ArkUI_SpanStyle_SetLength(spanStyle, PARAM_12);
    auto result_31_1 = OH_ArkUI_SpanStyle_SetLineSpacingStyle(spanStyle, lineSpacingStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_31_1 TextEnumTest_031 result=%{public}d", result_31_1);
    ASSERT_EQ(result_31_1, ARKUI_ERROR_CODE_NO_ERROR);

    auto result_31_2 = OH_ArkUI_SpanStyle_GetLineSpacingStyle(spanStyle, lineSpacingStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_31_2 TextEnumTest_031 result=%{public}d", result_31_2);
    ASSERT_EQ(result_31_2, ARKUI_ERROR_CODE_NO_ERROR);

    const OH_ArkUI_SpanStyle *spanStyles[] = {spanStyle};
    ArkUI_StyledString_Descriptor *styledString =
        OH_ArkUI_StyledString_Descriptor_CreateWithString("行间距样式示例\n段落内容", spanStyles, PARAM_1);

    OH_ArkUI_SpanStyle_Destroy(spanStyle);
    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    OH_ArkUI_StyledString_Descriptor_Destroy(styledString);
    NAPI_END(text);
}

static napi_value TextEnumTest_032(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const OH_ArkUI_SpanStyle *spanStyle = OH_ArkUI_SpanStyle_Create();
    auto result_32 = OH_ArkUI_SpanStyle_GetLineSpacingStyle(spanStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_32 TextEnumTest_032 result=%{public}d", result_32);
    ASSERT_EQ(result_32, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextEnumTest_033(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_ArkUI_LineSpacingStyle *lineSpacingStyle = OH_ArkUI_LineSpacingStyle_Create();
    ASSERT_EQ((lineSpacingStyle != nullptr), true);

    OH_ArkUI_LineSpacingStyle_SetLineSpacing(lineSpacingStyle, FLOAT_30);
    OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines(lineSpacingStyle, g_onlyBetweenLines);
    auto result_33 = OH_ArkUI_SpanStyle_GetLineSpacingStyle(nullptr, lineSpacingStyle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_33 TextEnumTest_033 result=%{public}d", result_33);
    ASSERT_EQ(result_33, ARKUI_ERROR_CODE_PARAM_INVALID);

    OH_ArkUI_LineSpacingStyle_Destroy(lineSpacingStyle);
    NAPI_END(text);
}

static napi_value TextEnumTest_034(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto result_34 = OH_ArkUI_SpanStyle_GetLineSpacingStyle(nullptr, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "result_34 TextEnumTest_034 result=%{public}d", result_34);
    ASSERT_EQ(result_34, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}
}
