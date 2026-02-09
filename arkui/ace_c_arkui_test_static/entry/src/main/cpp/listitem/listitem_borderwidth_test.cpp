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

static ani_double TestListItemBorderWidth001(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderWidth = SIZE_20;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidth);
    NAPI_END;
}

static ani_double TestListItemBorderWidth002(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderWidthUp = SIZE_10;
    float borderWidthDown = SIZE_20;
    float borderWidthLeft = SIZE_30;
    float borderWidthRight = SIZE_40;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderWidthUp}, {.f32 = borderWidthDown}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthUp);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthDown);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    NAPI_END;
}

static ani_double TestListItemBorderWidth003(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderWidthUp = SIZE_100;
    float borderWidthDown = PARAM_0;
    float borderWidthLeft = PARAM_0;
    float borderWidthRight = PARAM_0;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderWidthUp}, {.f32 = borderWidthDown}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthUp);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthDown);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
    ASSERT_EQ(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    NAPI_END;
}

static ani_double TestListItemBorderWidth004(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderWidthUp = PARAM_NEGATIVE_50;
    float borderWidthDown = PARAM_NEGATIVE_50;
    float borderWidthLeft = PARAM_NEGATIVE_50;
    float borderWidthRight = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = borderWidthUp}, {.f32 = borderWidthDown}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthUp);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthDown);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    NAPI_END;
}

static ani_double TestListItemBorderWidth005(ani_env* env, ani_object info)
{
    NAPI_START(listItem, ARKUI_NODE_LIST_ITEM);
    float borderWidth = PARAM_NEGATIVE_50;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(listItem, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidth);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidth);
    ASSERT_NE(nodeAPI->getAttribute(listItem, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidth);
    NAPI_END;
}
} // namespace ArkUIAniTest
