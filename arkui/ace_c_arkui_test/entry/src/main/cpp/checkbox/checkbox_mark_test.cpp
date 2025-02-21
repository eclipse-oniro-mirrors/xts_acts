/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"
namespace ArkUICapiTest {

static napi_value TestCheckboxMark001(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    uint32_t color = COLOR_RED;
    float size = 50;
    float thickness = 10;
    ArkUI_NumberValue mark_value[] = {{.u32 = color}, {.f32 = size}, {.f32 = thickness}};
    ArkUI_AttributeItem mark_item = {mark_value, sizeof(mark_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_MARK, &mark_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_1].f32, size);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_2].f32, thickness);
    NAPI_END;
}

static napi_value TestCheckboxMark002(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_2].f32, PARAM_2);
    NAPI_END;
}

static napi_value TestCheckboxMark003(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    uint32_t color = COLOR_RED;
    ArkUI_NumberValue mark_value[] = {{.u32 = color}};
    ArkUI_AttributeItem mark_item = {mark_value, sizeof(mark_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_MARK, &mark_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_0].u32, color);
    NAPI_END;
}

static napi_value TestCheckboxMark004(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    uint32_t color = COLOR_RED;
    float size = 50;
    ArkUI_NumberValue mark_value[] = {{.u32 = color}, {.f32 = size}};
    ArkUI_AttributeItem mark_item = {mark_value, sizeof(mark_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_MARK, &mark_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_0].u32, color);
    ASSERT_EQ(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_1].f32, size);
    NAPI_END;
}

static napi_value TestCheckboxMark005(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    uint32_t color = COLOR_RED;
    float size = -50;
    float thickness = 10;
    ArkUI_NumberValue mark_value[] = {{.u32 = color}, {.f32 = size}, {.f32 = thickness}};
    ArkUI_AttributeItem mark_item = {mark_value, sizeof(mark_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_MARK, &mark_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_0].u32, color);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_1].f32, size);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_2].f32, thickness);
    NAPI_END;
}

static napi_value TestCheckboxMark006(napi_env env, napi_callback_info info)
{
    NAPI_START(checkbox, ARKUI_NODE_CHECKBOX);
    uint32_t color = COLOR_RED;
    float size = 50;
    float thickness = -10;
    ArkUI_NumberValue mark_value[] = {{.u32 = color}, {.f32 = size}, {.f32 = thickness}};
    ArkUI_AttributeItem mark_item = {mark_value, sizeof(mark_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(checkbox, NODE_CHECKBOX_MARK, &mark_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_0].u32, color);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_1].f32, size);
    ASSERT_NE(nodeAPI->getAttribute(checkbox, NODE_CHECKBOX_MARK)->value[PARAM_2].f32, thickness);
    NAPI_END;
}

} // namespace ArkUICapiTest