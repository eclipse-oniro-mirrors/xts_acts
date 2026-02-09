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

static napi_value TestCommonAttrsOutlineColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t outlineColor = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = outlineColor}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OUTLINE_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_0].u32, outlineColor);
    NAPI_END;
}

static napi_value TestCommonAttrsOutlineColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t top = COLOR_RED;
    uint32_t right = COLOR_RED;
    uint32_t bottom = COLOR_RED;
    uint32_t left = COLOR_PURPLE;
    ArkUI_NumberValue value[] = {{.u32 = top}, {.u32 = right}, {.u32 = bottom}, {.u32 = left}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OUTLINE_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_0].u32, top);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_1].u32, right);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_2].u32, bottom);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_3].u32, left);
    NAPI_END;
}

static napi_value TestCommonAttrsOutlineColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t outlineColor = COLOR_WHITE + PARAM_1;
    ArkUI_NumberValue value[] = {{.u32 = outlineColor}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_OUTLINE_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCommonAttrsOutlineColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t outlineColor = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = outlineColor}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_OUTLINE_COLOR, &valueItem);
    auto ret = nodeAPI->resetAttribute(text, NODE_OUTLINE_COLOR);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_OUTLINE_COLOR)->value[PARAM_0].u32, COLOR_BLACK);
    NAPI_END;
}

} // namespace ArkUICapiTest
