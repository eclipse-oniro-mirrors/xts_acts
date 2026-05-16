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

static napi_value TestStackTranslate001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 50;
    float y = 50;
    float z = 50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

static napi_value TestStackTranslate002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = -50;
    float y = -50;
    float z = -50;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE)->value[PARAM_2].f32, z);
    NAPI_END;
}

} // namespace ArkUICapiTest
