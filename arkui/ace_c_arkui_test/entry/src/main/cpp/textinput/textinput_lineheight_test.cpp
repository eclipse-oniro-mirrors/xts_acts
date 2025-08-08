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
#define LARGE_VALUE 99999999

static napi_value TestTextInputLineHeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float height = 5.5;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_LINE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

static napi_value TestTextInputLineHeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float height = 100;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_LINE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

static napi_value TestTextInputLineHeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float height = 0;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_LINE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

static napi_value TestTextInputLineHeight004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float height = -1;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_LINE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}

static napi_value TestTextInputLineHeight005(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float height = LARGE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = height}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_TEXT_LINE_HEIGHT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, height);
    NAPI_END;
}
} // namespace ArkUICapiTest
