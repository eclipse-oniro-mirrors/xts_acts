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

static napi_value TestStackBrightness001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = -1;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 0;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 1.5;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 2;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 3;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

static napi_value TestStackBrightness007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float brightnessValue = 1;
    ArkUI_NumberValue value[] = {{.f32 = brightnessValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_BRIGHTNESS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_BRIGHTNESS)->value[PARAM_0].f32, brightnessValue);
    NAPI_END;
}

} // namespace ArkUICapiTest
