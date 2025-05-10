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

#define SIZE_NAGETIVE_100 100

namespace ArkUICapiTest {

static napi_value TestSpanLineHeight001(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float lineHeight = SIZE_100;

    ArkUI_NumberValue lineHeight_value[] = {{.f32 = lineHeight}};
    ArkUI_AttributeItem lineHeight_item = {lineHeight_value, sizeof(lineHeight_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LINE_HEIGHT, &lineHeight_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, lineHeight);
    NAPI_END;
}

static napi_value TestSpanLineHeight002(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float lineHeight = PARAM_0;

    ArkUI_NumberValue lineHeight_value[] = {{.f32 = lineHeight}};
    ArkUI_AttributeItem lineHeight_item = {lineHeight_value, sizeof(lineHeight_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LINE_HEIGHT, &lineHeight_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, lineHeight);
    NAPI_END;
}

static napi_value TestSpanLineHeight003(napi_env env, napi_callback_info info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    float lineHeight = SIZE_NAGETIVE_100;

    ArkUI_NumberValue lineHeight_value[] = {{.f32 = lineHeight}};
    ArkUI_AttributeItem lineHeight_item = {lineHeight_value, sizeof(lineHeight_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_LINE_HEIGHT, &lineHeight_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_LINE_HEIGHT)->value[PARAM_0].f32, lineHeight);
    NAPI_END;
}

} // namespace ArkUICapiTest
