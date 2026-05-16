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

static napi_value TestStackMargin001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float margin = 10;

    ArkUI_NumberValue margin_value[] = {{.f32 = margin}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MARGIN, &margin_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_0].f32, margin);
    NAPI_END;
}

static napi_value TestStackMargin002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float margin = -10;

    ArkUI_NumberValue margin_value[] = {{.f32 = margin}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MARGIN, &margin_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_0].f32, margin);
    NAPI_END;
}

static napi_value TestStackMargin003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float marginTop = 10;
    float marginRight = 10;
    float marginButton = 50;
    float marginLeft = 50;

    ArkUI_NumberValue margin_value[] = {
        {.f32 = marginTop}, {.f32 = marginRight}, {.f32 = marginButton}, {.f32 = marginLeft}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MARGIN, &margin_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_0].f32, marginTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_2].f32, marginButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

static napi_value TestStackMargin004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float marginTop = -10;
    float marginRight = -10;
    float marginButton = -50;
    float marginLeft = -50;

    ArkUI_NumberValue margin_value[] = {
        {.f32 = marginTop}, {.f32 = marginRight}, {.f32 = marginButton}, {.f32 = marginLeft}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MARGIN, &margin_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_0].f32, marginTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_1].f32, marginRight);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_2].f32, marginButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MARGIN)->value[PARAM_3].f32, marginLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
