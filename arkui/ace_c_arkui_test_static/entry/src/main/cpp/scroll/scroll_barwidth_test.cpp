
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestScrollBarWidth001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_10);
    NAPI_END;
}

static ani_double TestScrollBarWidth002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_NEGATIVE_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_NEGATIVE_10);
    }
    NAPI_END;
}

static ani_double TestScrollBarWidth003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestScrollBarWidth004(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_10000}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_10000);
    }
    NAPI_END;
}

static ani_double TestScrollBarWidth005(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_AttributeItem value_item = {};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_4);
    }
    NAPI_END;
}

static ani_double TestScrollBarWidth006(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_WIDTH, &value_item);
    auto ret = nodeAPI->resetAttribute(scroll, NODE_SCROLL_BAR_WIDTH);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_WIDTH)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

} // namespace ArkUIAniTest