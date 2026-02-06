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

static napi_value TestToggleUnSelectedColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t unSelectedColor = 0xFFFF0000;
    ArkUI_NumberValue value[] = {{.u32 = unSelectedColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR)->value[PARAM_0].u32, unSelectedColor);
    NAPI_END;
}

static napi_value TestToggleUnSelectedColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t unSelectedColor = napi_null;
    ArkUI_NumberValue value[] = {{.u32 = unSelectedColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR)->value[PARAM_0].u32, unSelectedColor);
    NAPI_END;
}

static napi_value TestToggleUnSelectedColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);
    uint32_t unSelectedColor = napi_undefined;
    ArkUI_NumberValue value[] = {{.u32 = unSelectedColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR)->value[PARAM_0].u32, unSelectedColor);
    NAPI_END;
}
static napi_value TestToggleUnSelectedColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(toggle, ARKUI_NODE_TOGGLE);

    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_NE(nodeAPI->getAttribute(toggle, NODE_TOGGLE_UNSELECTED_COLOR)->value[PARAM_0].u32, COLOR_RED);
    NAPI_END;
}
} // namespace ArkUICapiTest
