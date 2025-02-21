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

static napi_value TestColumnPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float padding = 10;

    ArkUI_NumberValue padding_value[] = {{.f32 = padding}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}

static napi_value TestColumnPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float padding = -10;

    ArkUI_NumberValue padding_value[] = {{.f32 = padding}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}

static napi_value TestColumnPadding003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float paddingTop = 10;
    float paddingRight = 10;
    float paddingBottom = 50;
    float paddingLeft = 50;

    ArkUI_NumberValue padding_value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

static napi_value TestColumnPadding004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float paddingTop = -10;
    float paddingRight = -10;
    float paddingBottom = -50;
    float paddingLeft = -50;

    ArkUI_NumberValue padding_value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
