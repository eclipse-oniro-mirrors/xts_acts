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

static napi_value TestSpanTextCase001(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t textCase = ARKUI_TEXT_CASE_NORMAL;

    ArkUI_NumberValue text_case_value[] = {{.i32 = textCase}};
    ArkUI_AttributeItem text_case_item = {text_case_value, sizeof(text_case_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_CASE, &text_case_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_CASE)->value[PARAM_0].i32, textCase);
    NAPI_END;
}

static napi_value TestSpanTextCase002(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t textCase = ARKUI_TEXT_CASE_LOWER;

    ArkUI_NumberValue text_case_value[] = {{.i32 = textCase}};
    ArkUI_AttributeItem text_case_item = {text_case_value, sizeof(text_case_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_CASE, &text_case_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_CASE)->value[PARAM_0].i32, textCase);
    NAPI_END;
}

static napi_value TestSpanTextCase003(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t textCase = ARKUI_TEXT_CASE_UPPER;

    ArkUI_NumberValue text_case_value[] = {{.i32 = textCase}};
    ArkUI_AttributeItem text_case_item = {text_case_value, sizeof(text_case_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_CASE, &text_case_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_CASE)->value[PARAM_0].i32, textCase);
    NAPI_END;
}

static napi_value TestSpanTextCase004(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t textCase = PARAM_NEGATIVE_1;

    ArkUI_NumberValue text_case_value[] = {{.i32 = textCase}};
    ArkUI_AttributeItem text_case_item = {text_case_value, sizeof(text_case_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_CASE, &text_case_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_TEXT_CASE) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_CASE)->value != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_CASE)->value[PARAM_0].i32, textCase);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
