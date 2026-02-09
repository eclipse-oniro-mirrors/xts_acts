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

#define DEFAULT_TEXT_1 "textinput"
#define DEFAULT_TEXT_2 "textinput textinput \n textinput textinput textinput textinput textinput"
#define DEFAULT_TEXT_3 ""

namespace ArkUICapiTest {

static napi_value TestTextAreaContentLineCount001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_1;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32, 0);
    NAPI_END;
}
static napi_value TestTextAreaContentLineCount002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_2;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32, 0);
    NAPI_END;
}
static napi_value TestTextAreaContentLineCount003(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_AttributeItem value_item = {};
    value_item.string = DEFAULT_TEXT_3;
    auto ret = nodeAPI->setAttribute(textArea, NODE_TEXT_INPUT_TEXT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto tmp = nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32;
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_TEXT_AREA_CONTENT_LINE_COUNT)->value[PARAM_0].i32, 0);
    NAPI_END;
}
} // namespace ArkUICapiTest