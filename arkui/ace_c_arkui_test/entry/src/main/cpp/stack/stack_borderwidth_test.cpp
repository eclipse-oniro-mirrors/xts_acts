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

static napi_value TestStackBorderWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidth = 1;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    NAPI_END;
}

static napi_value TestStackBorderWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidth = -1;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    }
    NAPI_END;
}

static napi_value TestStackBorderWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidth = 10;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    NAPI_END;
}

static napi_value TestStackBorderWidth004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidthTop = 1;
    float borderWidthRight = 2;
    float borderWidthButton = 3;
    float borderWidthLeft = 4;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthRight}, {.f32 = borderWidthButton}, {.f32 = borderWidthLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthLeft);
    NAPI_END;
}

static napi_value TestStackBorderWidth005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidthTop = -1;
    float borderWidthRight = -2;
    float borderWidthButton = -3;
    float borderWidthLeft = -4;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthRight}, {.f32 = borderWidthButton}, {.f32 = borderWidthLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthRight);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthButton);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthLeft);
    }
    NAPI_END;
}

static napi_value TestStackBorderWidth006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderWidthTop = 10;
    float borderWidthRight = 11;
    float borderWidthButton = 12;
    float borderWidthLeft = 13;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthRight}, {.f32 = borderWidthButton}, {.f32 = borderWidthLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
