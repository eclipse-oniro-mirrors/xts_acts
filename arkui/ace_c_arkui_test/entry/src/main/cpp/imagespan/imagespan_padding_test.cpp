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

static napi_value TestImageSpanPadding001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float padding = 10;

    ArkUI_NumberValue padding_value[] = {{.f32 = padding}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}

static napi_value TestImageSpanPadding002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float padding = -10;

    ArkUI_NumberValue padding_value[] = {{.f32 = padding}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_0].f32, padding);
    NAPI_END;
}

static napi_value TestImageSpanPadding003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float paddingTop = 20;
    float paddingRight = 20;
    float paddingBottom = 50;
    float paddingLeft = 50;

    ArkUI_NumberValue padding_value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

static napi_value TestImageSpanPadding004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageSpan, ARKUI_NODE_IMAGE_SPAN);
    float paddingTop = -20;
    float paddingRight = -20;
    float paddingBottom = -50;
    float paddingLeft = -50;

    ArkUI_NumberValue padding_value[] = {
        {.f32 = paddingTop}, {.f32 = paddingRight}, {.f32 = paddingBottom}, {.f32 = paddingLeft}};
    ArkUI_AttributeItem padding_item = {padding_value, sizeof(padding_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageSpan, NODE_PADDING, &padding_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_0].f32, paddingTop);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_1].f32, paddingRight);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_2].f32, paddingBottom);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpan, NODE_PADDING)->value[PARAM_3].f32, paddingLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest