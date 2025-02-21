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

namespace ArkUICapiTest {

static napi_value TestTextFontStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_STYLE)->value[PARAM_0].i32, ARKUI_FONT_STYLE_NORMAL);
    NAPI_END;
}

static napi_value TestTextFontStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_FONT_STYLE_ITALIC}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_FONT_STYLE)->value[PARAM_0].i32, ARKUI_FONT_STYLE_ITALIC);
    NAPI_END;
}

static napi_value TestTextFontStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exceptionValue = -10;
    ArkUI_NumberValue value[] = {{.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_FONT_STYLE, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(text, NODE_FONT_STYLE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_FONT_STYLE)->value[PARAM_0].i32, exceptionValue);
    };
    NAPI_END;
}

} // namespace ArkUICapiTest
