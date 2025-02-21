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

static napi_value TestTextBorderWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float borderWidthValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = borderWidthValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthValue);
    NAPI_END;
}

static napi_value TestTextBorderWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float topValue = 20;
    float rightValue = 30;
    float bottomValue = 40;
    float leftValue = 50;
    ArkUI_NumberValue value[] = {{.f32 = topValue}, {.f32 = rightValue}, {.f32 = bottomValue}, {.f32 = leftValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_0].f32, topValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_1].f32, rightValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_2].f32, bottomValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_3].f32, leftValue);
    NAPI_END;
}

static napi_value TestTextBorderWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float exceptionValue = -20;
    ArkUI_NumberValue value[] = {{.f32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(text, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_3].f32, exceptionValue);
    }
    NAPI_END;
}

static napi_value TestTextBorderWidth004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float topExceptionValue = -20;
    float rightExceptionValue = -30;
    float bottomExceptionValue = -40;
    float leftExceptionValue = -50;
    ArkUI_NumberValue value[] = {{.f32 = topExceptionValue},
                                 {.f32 = rightExceptionValue},
                                 {.f32 = bottomExceptionValue},
                                 {.f32 = leftExceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(text, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_0].f32, topExceptionValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_1].f32, rightExceptionValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_2].f32, bottomExceptionValue);
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_BORDER_WIDTH)->value[PARAM_3].f32, leftExceptionValue);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
