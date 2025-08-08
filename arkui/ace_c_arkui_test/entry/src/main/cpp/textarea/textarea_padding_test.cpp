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

#define PADDING 16
#define PADDING_TOP 8
#define PADDING_BOTTOM 16
#define PADDING_LEFT 10
#define PADDING_RIGHT 20

namespace ArkUICapiTest {

static napi_value TestTextAreaPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {{.f32 = PADDING}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_PADDING)->value[PARAM_0].f32, PADDING);
    NAPI_END;
}

static napi_value TestTextAreaPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(textArea, ARKUI_NODE_TEXT_AREA);
    ArkUI_NumberValue value[] = {
        {.f32 = PADDING_TOP}, {.f32 = PADDING_BOTTOM}, {.f32 = PADDING_LEFT}, {.f32 = PADDING_RIGHT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(textArea, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_PADDING)->value[PARAM_0].f32, PADDING_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_PADDING)->value[PARAM_1].f32, PADDING_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_PADDING)->value[PARAM_2].f32, PADDING_LEFT);
    ASSERT_EQ(nodeAPI->getAttribute(textArea, NODE_PADDING)->value[PARAM_3].f32, PADDING_RIGHT);
    NAPI_END;
}
} // namespace ArkUICapiTest
