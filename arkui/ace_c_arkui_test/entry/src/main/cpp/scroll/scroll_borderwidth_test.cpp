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

#define SUCCESS 0
#define ABNORMAL_PARAM 1000
#define BORDER_WIDTH_PARAM 40
#define PARAM_10 10
#define PARAM_50 50
#define PARAM_M10 (-10)
#define PARAM_M50 (-50)

namespace ArkUICapiTest {

static napi_value TestScrollBorderWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = BORDER_WIDTH_PARAM}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_0].f32, BORDER_WIDTH_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_1].f32, BORDER_WIDTH_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_2].f32, BORDER_WIDTH_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_3].f32, BORDER_WIDTH_PARAM);
    NAPI_END;
}

static napi_value TestScrollBorderWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = PARAM_10}, {.f32 = PARAM_50}, {.f32 = PARAM_10}, {.f32 = PARAM_50}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_1].f32, PARAM_50);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_2].f32, PARAM_10);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_3].f32, PARAM_50);
    NAPI_END;
}

static napi_value TestScrollBorderWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[PARAM_4] = {{.f32 = PARAM_M10}, {.f32 = PARAM_M50}, {.f32 = PARAM_M10}, {.f32 = PARAM_M50}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_BORDER_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_0].f32, PARAM_M10);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_1].f32, PARAM_M50);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_2].f32, PARAM_M10);
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_BORDER_WIDTH)->value[PARAM_3].f32, PARAM_M50);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
