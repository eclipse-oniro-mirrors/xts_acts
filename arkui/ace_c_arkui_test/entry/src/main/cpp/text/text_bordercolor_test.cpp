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

static napi_value TestTextBorderColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t red = 0xFFFF0000;
    ArkUI_NumberValue value[] = {{.u32 = red}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_0].u32, red);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_1].u32, red);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_2].u32, red);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_3].u32, red);
    NAPI_END;
}

static napi_value TestTextBorderColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t black = 0xFF000000;
    ArkUI_NumberValue value[] = {{.u32 = black}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_0].u32, black);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_1].u32, black);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_2].u32, black);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_3].u32, black);
    NAPI_END;
}

static napi_value TestTextBorderColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t white = 0xFFFFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = white}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_0].u32, white);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_1].u32, white);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_2].u32, white);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_3].u32, white);
    NAPI_END;
}

static napi_value TestTextBorderColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t red = 0xFFFF0000;
    uint32_t green = 0xFF00FF00;
    uint32_t blue = 0xFF0000FF;
    uint32_t yellow = 0xFFFFFF00;
    ArkUI_NumberValue value[] = {{.u32 = red}, {.u32 = green}, {.u32 = blue}, {.u32 = yellow}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_BORDER_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_0].u32, red);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_1].u32, green);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_2].u32, blue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_BORDER_COLOR)->value[PARAM_3].u32, yellow);
    NAPI_END;
}

} // namespace ArkUICapiTest
