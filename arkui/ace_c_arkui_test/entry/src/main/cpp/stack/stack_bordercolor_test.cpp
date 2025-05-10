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

static napi_value TestStackBorderColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColor = 0xFFFF0000;
    ArkUI_NumberValue value[] = {{.u32 = borderColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColor);
    NAPI_END;
}

static napi_value TestStackBorderColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColor = 0xFFFFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = borderColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColor);
    NAPI_END;
}

static napi_value TestStackBorderColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColor = 0x00000000;
    ArkUI_NumberValue value[] = {{.u32 = borderColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColor);
    NAPI_END;
}

static napi_value TestStackBorderColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColorTop = 0xFFFF0000;
    uint32_t borderColorRight = 0xFFFF0000;
    uint32_t borderColorButton = 0xFFFF0000;
    uint32_t borderColorLeft = 0xFFFF0000;
    ArkUI_NumberValue value[] = {
        {.u32 = borderColorTop}, {.u32 = borderColorRight}, {.u32 = borderColorButton}, {.u32 = borderColorLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColorTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColorRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColorButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColorLeft);
    NAPI_END;
}

static napi_value TestStackBorderColor005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColorTop = 0xFFFFFFFF;
    uint32_t borderColorRight = 0xFFFFFFFF;
    uint32_t borderColorButton = 0xFFFFFFFF;
    uint32_t borderColorLeft = 0xFFFFFFFF;
    ArkUI_NumberValue value[] = {
        {.u32 = borderColorTop}, {.u32 = borderColorRight}, {.u32 = borderColorButton}, {.u32 = borderColorLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColorTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColorRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColorButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColorLeft);
    NAPI_END;
}

static napi_value TestStackBorderColor006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t borderColorTop = 0x00000000;
    uint32_t borderColorRight = 0x00000000;
    uint32_t borderColorButton = 0x00000000;
    uint32_t borderColorLeft = 0x00000000;
    ArkUI_NumberValue value[] = {
        {.u32 = borderColorTop}, {.u32 = borderColorRight}, {.u32 = borderColorButton}, {.u32 = borderColorLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColorTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColorRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColorButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColorLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
