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

static napi_value TestFlexWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float width = 300;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static napi_value TestFlexWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float width = -100;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(flex, NODE_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(flex, NODE_WIDTH)->value[PARAM_0].f32, width);
    }
    NAPI_END;
}

static napi_value TestFlexWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(flex, ARKUI_NODE_FLEX);
    float width = 500;

    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(flex, NODE_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(flex, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

} // namespace ArkUICapiTest