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

static napi_value TestScrollWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float width = 300;
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_value_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

static napi_value TestScrollWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float width = -100;
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_value_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_WIDTH)->value[PARAM_0].f32, width);
    }
    NAPI_END;
}

static napi_value TestScrollWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float width = 10000;
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_value_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_WIDTH, &width_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_WIDTH)->value[PARAM_0].f32, width);
    NAPI_END;
}

} // namespace ArkUICapiTest
