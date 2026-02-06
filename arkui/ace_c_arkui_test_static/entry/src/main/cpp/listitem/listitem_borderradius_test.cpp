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

static ani_double TestListItemBorderRadius001(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderRadius = SIZE_20;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}

static ani_double TestListItemBorderRadius002(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderRadiusUp = SIZE_10;
    float borderRadiusDown = SIZE_20;
    float borderRadiusLeft = SIZE_30;
    float borderRadiusRight = SIZE_40;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderRadiusUp}, {.f32 = borderRadiusDown}, {.f32 = borderRadiusLeft}, {.f32 = borderRadiusRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusUp);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusDown);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeft);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRight);
    NAPI_END;
}

static ani_double TestListItemBorderRadius003(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderRadiusUp = SIZE_100;
    float borderRadiusDown = PARAM_0;
    float borderRadiusLeft = PARAM_0;
    float borderRadiusRight = PARAM_0;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderRadiusUp}, {.f32 = borderRadiusDown}, {.f32 = borderRadiusLeft}, {.f32 = borderRadiusRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusUp);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusDown);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeft);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRight);
    NAPI_END;
}

static ani_double TestListItemBorderRadius004(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderRadiusUp = PARAM_NEGATIVE_50;
    float borderRadiusDown = PARAM_NEGATIVE_50;
    float borderRadiusLeft = PARAM_NEGATIVE_50;
    float borderRadiusRight = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderRadiusUp}, {.f32 = borderRadiusDown}, {.f32 = borderRadiusLeft}, {.f32 = borderRadiusRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadiusUp);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadiusDown);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadiusLeft);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadiusRight);
    NAPI_END;
}

static ani_double TestListItemBorderRadius005(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderRadius = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[] = {{.f32 = borderRadius}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_RADIUS, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_0].f32, borderRadius);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_1].f32, borderRadius);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_2].f32, borderRadius);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_RADIUS)->value[PARAM_3].f32, borderRadius);
    NAPI_END;
}
} // namespace ArkUIAniTest
