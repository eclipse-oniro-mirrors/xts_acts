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

static napi_value TestStackBorderRadius001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = 10;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    NAPI_END;
}

static napi_value TestStackBorderRadius002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = 0;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    NAPI_END;
}

static napi_value TestStackBorderRadius003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = 10000;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    NAPI_END;
}

static napi_value TestStackBorderRadius004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = -1;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    }
    NAPI_END;
}

static napi_value TestStackBorderRadius005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadiusLeftTop = 10;
    float borderRadiusRightTop = 11;
    float borderRadiusLeftButton = 12;
    float borderRadiusRightButton = 13;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftButton},
                                 {.f32 = borderRadiusRightButton}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftButton);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightButton);
    NAPI_END;
}

static napi_value TestStackBorderRadius006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = 0;
    ArkUI_NumberValue value[] = {
        {.f32 = borderRadius}, {.f32 = borderRadius}, {.f32 = borderRadius}, {.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static napi_value TestStackBorderRadius007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadius = 10000;
    ArkUI_NumberValue value[] = {
        {.f32 = borderRadius}, {.f32 = borderRadius}, {.f32 = borderRadius}, {.f32 = borderRadius}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static napi_value TestStackBorderRadius008(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float borderRadiusLeftTop = -1;
    float borderRadiusRightTop = -1;
    float borderRadiusLeftButton = -1;
    float borderRadiusRightButton = -1;
    ArkUI_NumberValue value[] = {{.f32 = borderRadiusLeftTop},
                                 {.f32 = borderRadiusRightTop},
                                 {.f32 = borderRadiusLeftButton},
                                 {.f32 = borderRadiusRightButton}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BORDER_RADIUS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusLeftTop);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusRightTop);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeftButton);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRightButton);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
