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

static napi_value TestCommonAttrsPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float padding = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = padding}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}
static napi_value TestCommonAttrsPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float padding = PARAM_10;
    ArkUI_NumberValue value[] = {{.f32 = padding}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}

static napi_value TestCommonAttrsPadding003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float paddingTop = PARAM_NEGATIVE_10;
    float paddingRight = PARAM_10;
    float paddingBottom = PARAM_50;
    float paddingLeft = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom},
                                 {.f32 = paddingLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

static napi_value TestCommonAttrsPadding004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float paddingTop = PARAM_10;
    float paddingRight = PARAM_10;
    float paddingBottom = PARAM_50;
    float paddingLeft = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom},
                                 {.f32 = paddingLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_PADDING, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

static napi_value TestCommonAttrsPadding005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float paddingTop = PARAM_10;
    float paddingRight = PARAM_10;
    float paddingBottom = PARAM_50;
    float paddingLeft = PARAM_50;
    ArkUI_NumberValue value[] = {{.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom},
                                 {.f32 = paddingLeft}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(text, NODE_PADDING, &value_item);
    auto ret = nodeAPI->resetAttribute(text, NODE_PADDING);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_PADDING)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest
