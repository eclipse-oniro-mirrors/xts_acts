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

#define MIN_ABNORMAL_VALUE (-1)
#define MAX_ABNORMAL_VALUE 10

namespace ArkUICapiTest {

static napi_value TestImageBorderStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t borderStyle = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    ArkUI_NumberValue value[] = {{.i32 = borderStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_0].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_1].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_2].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_3].i32, borderStyle);
    NAPI_END;
}

static napi_value TestImageBorderStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t borderStyle = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DASHED;
    ArkUI_NumberValue value[] = {{.i32 = borderStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_0].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_1].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_2].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_3].i32, borderStyle);
    NAPI_END;
}

static napi_value TestImageBorderStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t borderStyle = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DOTTED;
    ArkUI_NumberValue value[] = {{.i32 = borderStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_0].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_1].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_2].i32, borderStyle);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_3].i32, borderStyle);
    NAPI_END;
}

static napi_value TestImageBorderStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t borderStyleTop = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    int32_t borderStyleRight = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DASHED;
    int32_t borderStyleBottom = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    int32_t borderStyleLeft = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_DOTTED;

    ArkUI_NumberValue value[] = {
        {.i32 = borderStyleTop}, {.i32 = borderStyleRight}, {.i32 = borderStyleBottom}, {.i32 = borderStyleLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_0].i32, borderStyleTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_1].i32, borderStyleRight);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_2].i32, borderStyleBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_3].i32, borderStyleLeft);
    NAPI_END;
}

static napi_value TestImageBorderStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    int32_t borderStyleTop = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    int32_t borderStyleRight = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    int32_t borderStyleBottom = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;
    int32_t borderStyleLeft = ArkUI_BorderStyle::ARKUI_BORDER_STYLE_SOLID;

    ArkUI_NumberValue value[] = {
        {.i32 = borderStyleTop}, {.i32 = borderStyleRight}, {.i32 = borderStyleBottom}, {.i32 = borderStyleLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_STYLE, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_0].i32, borderStyleTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_1].i32, borderStyleRight);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_2].i32, borderStyleBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_STYLE)->value[PARAM_3].i32, borderStyleLeft);
    NAPI_END;
}

} // namespace ArkUICapiTest
