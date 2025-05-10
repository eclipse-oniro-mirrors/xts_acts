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

#define FIRST_COLOR_VALUE 0xFFFF0000
#define SECOND_COLOR_VALUE 0xFF000000

namespace ArkUICapiTest {

static napi_value TestTextInputFontColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    uint32_t color = FIRST_COLOR_VALUE;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_COLOR)->value[PARAM_0].u32, color);
    NAPI_END;
}

static napi_value TestTextInputFontColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    uint32_t color = SECOND_COLOR_VALUE;
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_FONT_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_FONT_COLOR)->value[PARAM_0].u32, color);
    NAPI_END;
}

} // namespace ArkUICapiTest
