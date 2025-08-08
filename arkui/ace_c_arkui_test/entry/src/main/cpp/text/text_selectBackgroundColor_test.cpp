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

#define COLOR_BLUE1 0x33007DFF
#define COLOR_DEFAULT 0x33FF0000
#define COLOR_ERROR 0x33FFFFFF
namespace ArkUICapiTest {

static napi_value TestTextSelectedBackgroundColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_DEFAULT);

    NAPI_END;
}

static napi_value TestTextSelectedBackgroundColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_BLUE1);

    NAPI_END;
}

static napi_value TestTextSelectedBackgroundColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextSelectedBackgroundColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_SELECTED_BACKGROUND_COLOR)->value[PARAM_0].u32, COLOR_ERROR);
    NAPI_END;
}
} // namespace ArkUICapiTest
