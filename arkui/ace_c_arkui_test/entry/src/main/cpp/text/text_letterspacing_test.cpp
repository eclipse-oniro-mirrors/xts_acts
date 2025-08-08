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

static napi_value TestTextLetterSpacing001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float letterSpacingValue = 50;
    ArkUI_NumberValue value[] = {{.f32 = letterSpacingValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_LETTER_SPACING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, letterSpacingValue);
    NAPI_END;
}

static napi_value TestTextLetterSpacing002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float largeValue = 1000;
    ArkUI_NumberValue value[] = {{.f32 = largeValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_LETTER_SPACING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, largeValue);
    NAPI_END;
}

static napi_value TestTextLetterSpacing003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float exceptionValue = -100;
    ArkUI_NumberValue value[] = {{.f32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_LETTER_SPACING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_LETTER_SPACING)->value[PARAM_0].f32, exceptionValue);
    NAPI_END;
}

} // namespace ArkUICapiTest
