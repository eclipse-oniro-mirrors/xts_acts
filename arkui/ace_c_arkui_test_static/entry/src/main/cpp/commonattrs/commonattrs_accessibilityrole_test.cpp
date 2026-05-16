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
static ani_double TestCommonAttrsAccessibilityRole001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_CUSTOM;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TEXT;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_SPAN;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_IMAGE_SPAN;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole005(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_IMAGE;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole006(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TOGGLE;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole007(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_LOADING_PROGRESS;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole008(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TEXT_INPUT;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole009(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TEXT_AREA;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole010(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_BUTTON;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole011(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_PROGRESS;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole012(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_CHECKBOX;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole013(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_XCOMPONENT;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole014(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_DATE_PICKER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole015(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TIME_PICKER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole016(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TEXT_PICKER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole017(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_CALENDAR_PICKER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole018(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_SLIDER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole019(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_RADIO;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole020(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_IMAGE_ANIMATOR;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole021(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_STACK;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole022(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_SWIPER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole023(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_SCROLL;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole024(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_LIST;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole025(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_LIST_ITEM;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole026(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_LIST_ITEM_GROUP;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole027(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_COLUMN;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole028(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_ROW;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole029(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_FLEX;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole030(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_REFRESH;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole031(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_REFRESH;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole032(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_WATER_FLOW;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole033(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_FLOW_ITEM;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole034(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_RELATIVE_CONTAINER;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole035(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_GRID;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole036(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_GRID_ITEM;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole037(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_CUSTOM_SPAN;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole038(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole039(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_125;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole040(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_999;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole041(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_1016;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_ACCESSIBILITY_ROLE)->value[PARAM_0].u32, accessibilityRole);
    NAPI_END;
}

static ani_double TestCommonAttrsAccessibilityRole042(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_TEXT;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_ACCESSIBILITY_ROLE);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUIAniTest