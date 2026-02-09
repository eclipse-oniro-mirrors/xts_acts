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

static napi_value TestTextPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float paddingValue = 20;
    ArkUI_NumberValue value[] = {{.f32 = paddingValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, paddingValue);
    NAPI_END;
}

static napi_value TestTextPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float paddingValue = 0;
    ArkUI_NumberValue value[] = {{.f32 = paddingValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, paddingValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, paddingValue);
    NAPI_END;
}

static napi_value TestTextPadding003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float topValue = 5;
    float rightValue = 6;
    float bottomValue = 7;
    float leftValue = 8;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = topValue}, {.f32 = rightValue}, {.f32 = bottomValue}, {.f32 = leftValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, topValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, rightValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, bottomValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, leftValue);
    NAPI_END;
}

static napi_value TestTextPadding004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float topValue = 1000;
    float rightValue = 1000;
    float bottomValue = 1000;
    float leftValue = 1000;
    ArkUI_NumberValue value[PARAM_4] = {
        {.f32 = topValue}, {.f32 = rightValue}, {.f32 = bottomValue}, {.f32 = leftValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, topValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, rightValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, bottomValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, leftValue);
    NAPI_END;
}
} // namespace ArkUICapiTest
