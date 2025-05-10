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

#define FIRST_MIDDLE_VALUE (0.0)
#define SECOND_MIDDLE_VALUE (10.0)

namespace ArkUICapiTest {

static napi_value TestTextInputPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float padding = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = padding}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_0].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_1].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_2].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_3].f32, padding);
    NAPI_END;
}

static napi_value TestTextInputPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float padding = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = padding}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_0].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_1].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_2].f32, padding);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_3].f32, padding);
    NAPI_END;
}

static napi_value TestTextInputPadding003(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float paddingTop = FIRST_MIDDLE_VALUE;
    float paddingRight = FIRST_MIDDLE_VALUE;
    float paddingBottom = FIRST_MIDDLE_VALUE;
    float paddingLeft = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

static napi_value TestTextInputPadding004(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float paddingTop = SECOND_MIDDLE_VALUE;
    float paddingRight = SECOND_MIDDLE_VALUE;
    float paddingBottom = SECOND_MIDDLE_VALUE;
    float paddingLeft = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textInput, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(textInput, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
