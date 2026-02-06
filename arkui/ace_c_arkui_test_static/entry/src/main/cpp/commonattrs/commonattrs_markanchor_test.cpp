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

static ani_double TestCommonAttrsMarkAnchorTest001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float anchorX = PARAM_30;
    float anchorY = PARAM_40;
    ArkUI_NumberValue value[] = {{.f32 = anchorX}, {.f32 = anchorY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MARK_ANCHOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_0].f32, anchorX);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_1].f32, anchorY);
    NAPI_END;
}

static ani_double TestCommonAttrsMarkAnchorTest002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float anchorX = PARAM_NEGATIVE_30;
    float anchorY = PARAM_NEGATIVE_40;
    ArkUI_NumberValue value[] = {{.f32 = anchorX}, {.f32 = anchorY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MARK_ANCHOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_0].f32, anchorX);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_1].f32, anchorY);
    NAPI_END;
}

static ani_double TestCommonAttrsMarkAnchorTest003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float anchorX = PARAM_0_POINT_5;
    float anchorY = PARAM_0_POINT_5;
    ArkUI_NumberValue value[] = {{.f32 = anchorX}, {.f32 = anchorY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_MARK_ANCHOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_0].f32, anchorX);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_1].f32, anchorY);
    NAPI_END;
}

static ani_double TestCommonAttrsMarkAnchorTest004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float anchorX = PARAM_30;
    float anchorY = PARAM_40;
    ArkUI_NumberValue value[] = {{.f32 = anchorX}, {.f32 = anchorY}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_MARK_ANCHOR, &valueItem);
    auto ret = nodeAPI->resetAttribute(text, NODE_MARK_ANCHOR);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_MARK_ANCHOR)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

} // namespace ArkUIAniTest
