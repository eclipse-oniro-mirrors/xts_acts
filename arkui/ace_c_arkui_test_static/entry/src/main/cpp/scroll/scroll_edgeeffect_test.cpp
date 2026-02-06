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

#define ABNORMAL_PARAM 1000

namespace ArkUIAniTest {

static ani_double TestScrollEdgeEffect001(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_NONE}, {.i32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, ARKUI_EDGE_EFFECT_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, PARAM_1);
    NAPI_END;
}

static ani_double TestScrollEdgeEffect002(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = PARAM_0}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, ARKUI_EDGE_EFFECT_SPRING);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, PARAM_0);
    NAPI_END;
}

static ani_double TestScrollEdgeEffect003(ani_env* env, ani_object info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_FADE}, {.i32 = PARAM_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_EDGE_EFFECT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, ARKUI_EDGE_EFFECT_FADE);
    ASSERT_EQ(nodeAPI->getAttribute(scroll, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, PARAM_1);
    NAPI_END;
}
} // namespace ArkUIAniTest
