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

static ani_double TestListEdgeEffect001(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edgeEffect = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}, {.i32 = edgeEffect}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, ARKUI_EDGE_EFFECT_SPRING);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, edgeEffect);
    NAPI_END;
}

static ani_double TestListEdgeEffect002(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edgeEffect = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_EDGE_EFFECT_FADE}, {.i32 = edgeEffect}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, ARKUI_EDGE_EFFECT_FADE);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, edgeEffect);
    NAPI_END;
}

static ani_double TestListEdgeEffect003(ani_env* env, ani_object info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    int32_t edgeEffect = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = edgeEffect}, {.i32 = edgeEffect}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(list, NODE_SCROLL_EDGE_EFFECT, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_0].i32, edgeEffect);
    ASSERT_NE(nodeAPI->getAttribute(list, NODE_SCROLL_EDGE_EFFECT)->value[PARAM_1].i32, edgeEffect);
    NAPI_END;
}

} // namespace ArkUIAniTest
