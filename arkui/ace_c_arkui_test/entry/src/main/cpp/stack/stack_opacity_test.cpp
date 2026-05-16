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

static napi_value TestStackOpacity001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestStackOpacity002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0.5;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestStackOpacity003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0.6;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestStackOpacity004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    NAPI_END;
}

static napi_value TestStackOpacity005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = -1;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    }
    NAPI_END;
}

static napi_value TestStackOpacity006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 2;
    ArkUI_NumberValue value[] = {{.f32 = opacity}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY)->value[PARAM_0].f32, opacity);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
