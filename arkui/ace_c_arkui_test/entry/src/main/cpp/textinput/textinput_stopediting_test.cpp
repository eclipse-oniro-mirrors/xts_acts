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
#define NEGATIVE_VALUE (-1)
#define LARGE_VALUE 99999999

static napi_value TestTextInputStopEditing001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t editing = true;
    ArkUI_NumberValue value[] = {{.i32 = editing}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_EDITING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_EDITING)->value[PARAM_0].i32, false);
    NAPI_END;
}

static napi_value TestTextInputStopEditing002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t editing = false;
    ArkUI_NumberValue value[] = {{.i32 = editing}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_EDITING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_EDITING)->value[PARAM_0].i32, editing);
    NAPI_END;
}

static napi_value TestTextInputStopEditing003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t editing = PARAM_2;
    ArkUI_NumberValue value[] = {{.i32 = editing}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_EDITING, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_EDITING)->value[PARAM_0].i32, editing);
    NAPI_END;
}

static napi_value TestTextInputStopEditing004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t editing = NEGATIVE_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = editing}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_EDITING, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_EDITING)->value[PARAM_0].i32, editing);
    NAPI_END;
}

static napi_value TestTextInputStopEditing005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    int32_t editing = LARGE_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = editing}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_EDITING, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_EDITING)->value[PARAM_0].i32, editing);
    NAPI_END;
}
} // namespace ArkUICapiTest
