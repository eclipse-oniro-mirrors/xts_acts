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

#include "common/common.h"
#include <arkui/styled_string.h>

#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_types.h>
namespace ArkUICapiTest {

static napi_value TestTextParagraph001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    ArkUI_StyledString *styledString = OH_ArkUI_StyledString_Create(typoStyle, OH_Drawing_CreateFontCollection());

    OH_Drawing_TextStyle *txtStyle1 = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(txtStyle1, SIZE_150);
    OH_Drawing_SetTextStyleColor(txtStyle1, 0xFF00FF00);
    OH_ArkUI_StyledString_PushTextStyle(styledString, txtStyle1);
    OH_ArkUI_StyledString_AddText(styledString, "Paragraph layout");
    OH_ArkUI_StyledString_PopTextStyle(styledString);

    OH_Drawing_Typography *typography = OH_ArkUI_StyledString_CreateTypography(styledString);
    OH_Drawing_TypographyLayout(typography, SIZE_200 * PARAM_3_POINT_25);
    ArkUI_AttributeItem valueItem = {.object = styledString};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_CONTENT_WITH_STYLED_STRING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    OH_Drawing_DestroyTextStyle(txtStyle1);

    auto ret1 = nodeAPI->resetAttribute(text, NODE_TEXT_CONTENT_WITH_STYLED_STRING);
    ASSERT_EQ(ret1, SUCCESS);
    NAPI_END;
}

static napi_value TestTextParagraph002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem valueItem = {};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_CONTENT_WITH_STYLED_STRING, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static napi_value TestTextParagraph003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_CONTENT_WITH_STYLED_STRING, nullptr);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}
} // namespace ArkUICapiTest
