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

static napi_value TestStackRotate001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 50;
    float y = 50;
    float z = 50;
    float angle = 50;
    float perspective = 50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

static napi_value TestStackRotate002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = -50;
    float y = -50;
    float z = -50;
    float angle = -50;
    float perspective = -50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = perspective}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE)->value[PARAM_4].f32, perspective);
    NAPI_END;
}

} // namespace ArkUICapiTest
