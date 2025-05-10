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
static napi_value TestCommonAttrsAccessibilityRole001(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole002(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole003(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole004(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole005(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole006(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole007(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole008(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole009(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole010(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole011(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole012(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole013(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole014(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole015(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole016(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole017(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole018(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole019(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole020(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = ARKUI_NODE_IMAGE_ANIMATOR;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityRole021(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole022(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole023(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole024(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole025(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole026(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole027(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole028(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole029(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole030(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole031(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole032(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole033(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole034(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole035(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole036(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole037(napi_env env, napi_callback_info info)
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

static napi_value TestCommonAttrsAccessibilityRole038(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityRole039(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_125;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityRole040(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_999;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityRole041(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t accessibilityRole = PARAM_1016;
    ArkUI_NumberValue value[] = {{.u32 = accessibilityRole}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_ACCESSIBILITY_ROLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsAccessibilityRole042(napi_env env, napi_callback_info info)
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

} // namespace ArkUICapiTest