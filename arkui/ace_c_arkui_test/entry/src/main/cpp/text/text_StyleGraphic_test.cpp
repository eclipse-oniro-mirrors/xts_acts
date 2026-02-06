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

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_text_declaration.h>



namespace ArkUICapiTest {

static napi_value TextTextStyleGraphic001(napi_env env, napi_callback_info info)
{
    NAPI_START(textStyleGrap, ARKUI_NODE_TEXT);
    const char *content = "C textStyle Test";
    ArkUI_AttributeItem texContent = {.string = content};
    nodeAPI->setAttribute(textStyleGrap, NODE_WIDTH, &texContent);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, PARAM_5);
    ArkUI_StyledString *styledString = OH_ArkUI_StyledString_Create(typoStyle, OH_Drawing_CreateFontCollection());
    ASSERT_EQ(styledString == nullptr, false);
    OH_Drawing_TextStyle *styled1 = OH_Drawing_CreateTextStyle();
    OH_ArkUI_StyledString_PushTextStyle(styledString, styled1);
    OH_ArkUI_StyledString_AddText(styledString, "test2");
    OH_ArkUI_StyledString_PopTextStyle(styledString);

    OH_Drawing_Typography *tyPo = OH_ArkUI_StyledString_CreateTypography(styledString);
    ASSERT_EQ(tyPo == nullptr, false);
    OH_ArkUI_StyledString_Destroy(styledString);
    napi_value result = nullptr;  
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}

static napi_value TextTextStyleGraphic002(napi_env env, napi_callback_info info)
{
    NAPI_START(textStyleGrap, ARKUI_NODE_TEXT);
    const char *content = "C addPlaceHolder Test";
    ArkUI_AttributeItem texContent = {.string = content};
    nodeAPI->setAttribute(textStyleGrap, NODE_WIDTH, &texContent);
    OH_Drawing_TypographyStyle *typoStyle = OH_Drawing_CreateTypographyStyle();
    OH_Drawing_SetTypographyTextMaxLines(typoStyle, PARAM_5);
    ArkUI_StyledString *styledString = OH_ArkUI_StyledString_Create(typoStyle, OH_Drawing_CreateFontCollection());
    
    OH_Drawing_PlaceholderSpan placeholder = {5.0, 8.0, ALIGNMENT_ABOVE_BASELINE, TEXT_BASELINE_ALPHABETIC, 7.0};
    OH_ArkUI_StyledString_AddPlaceholder(styledString, &placeholder);
    OH_ArkUI_StyledString_Destroy(styledString);
    napi_value result = nullptr;  
    napi_create_int32(env, 0, &result);                                                                                 
    return result;
}


} // namespace ArkUICapiTest
