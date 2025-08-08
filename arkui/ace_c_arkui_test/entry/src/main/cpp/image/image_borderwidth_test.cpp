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

#define FIRST_MIDDLE_VALUE (10.0)
#define SECOND_MIDDLE_VALUE (100.0)
#define ABNORMAL_VALUE (-10.0)

namespace ArkUICapiTest {

static napi_value TestImageBorderWidth001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidth = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidth);
    NAPI_END;
}

static napi_value TestImageBorderWidth002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidth = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidth);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidth);
    NAPI_END;
}

static napi_value TestImageBorderWidth003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidthTop = FIRST_MIDDLE_VALUE;
    float borderWidthBottom = FIRST_MIDDLE_VALUE;
    float borderWidthLeft = FIRST_MIDDLE_VALUE;
    float borderWidthRight = FIRST_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthBottom}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    NAPI_END;
}

static napi_value TestImageBorderWidth004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidthTop = SECOND_MIDDLE_VALUE;
    float borderWidthBottom = SECOND_MIDDLE_VALUE;
    float borderWidthLeft = SECOND_MIDDLE_VALUE;
    float borderWidthRight = SECOND_MIDDLE_VALUE;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthBottom}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    NAPI_END;
}

static napi_value TestImageBorderWidth005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidth = ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {{.f32 = borderWidth}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidth);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidth);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidth);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidth);
    }

    NAPI_END;
}

static napi_value TestImageBorderWidth006(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    float borderWidthTop = ABNORMAL_VALUE;
    float borderWidthBottom = ABNORMAL_VALUE;
    float borderWidthLeft = ABNORMAL_VALUE;
    float borderWidthRight = ABNORMAL_VALUE;
    ArkUI_NumberValue value[] = {
        {.f32 = borderWidthTop}, {.f32 = borderWidthBottom}, {.f32 = borderWidthLeft}, {.f32 = borderWidthRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_WIDTH, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(image, NODE_BORDER_WIDTH) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_0].f32, borderWidthTop);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_1].f32, borderWidthBottom);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_2].f32, borderWidthLeft);
        ASSERT_NE(nodeAPI->getAttribute(image, NODE_BORDER_WIDTH)->value[PARAM_3].f32, borderWidthRight);
    }

    NAPI_END;
}

} // namespace ArkUICapiTest
