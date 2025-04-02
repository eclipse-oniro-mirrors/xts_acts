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

#define FIRST_COLOR_VALUE 0xFFFF11FF
#define SECOND_COLOR_VALUE 0xFF000000
#define FIRST_TOP_COLOR_VALUE 0xFF000000
#define FIRST_BOTTOM_COLOR_VALUE 0xFF0000FF
#define FIRST_LEFT_COLOR_VALUE 0xFF00FFFF
#define FIRST_RIGHT_COLOR_VALUE 0xFF444444
#define SECOND_TOP_COLOR_VALUE 0xFF888888
#define SECOND_BOTTOM_COLOR_VALUE 0xFF00FF00
#define SECOND_LEFT_COLOR_VALUE 0xFFCCCCCC
#define SECOND_RIGHT_COLOR_VALUE 0xFFFF00FF

namespace ArkUICapiTest {

static napi_value TestImageBorderColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t borderColor = FIRST_COLOR_VALUE;
    ArkUI_NumberValue value[] = {{.u32 = borderColor}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColor);
    NAPI_END;
}

static napi_value TestImageBorderColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t borderColor = SECOND_COLOR_VALUE;
    ArkUI_NumberValue value[] = {{.u32 = borderColor}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColor);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColor);
    NAPI_END;
}

static napi_value TestImageBorderColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t borderColorTop = FIRST_TOP_COLOR_VALUE;
    uint32_t borderColorBottom = FIRST_BOTTOM_COLOR_VALUE;
    uint32_t borderColorLeft = FIRST_LEFT_COLOR_VALUE;
    uint32_t borderColorRight = FIRST_RIGHT_COLOR_VALUE;
    ArkUI_NumberValue value[] = {
        {.u32 = borderColorTop}, {.u32 = borderColorBottom}, {.u32 = borderColorLeft}, {.u32 = borderColorRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColorTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColorBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColorLeft);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColorRight);
    NAPI_END;
}

static napi_value TestImageBorderColor004(napi_env env, napi_callback_info info)
{
    NAPI_START(image, ARKUI_NODE_IMAGE);
    uint32_t borderColorTop = SECOND_TOP_COLOR_VALUE;
    uint32_t borderColorBottom = SECOND_BOTTOM_COLOR_VALUE;
    uint32_t borderColorLeft = SECOND_LEFT_COLOR_VALUE;
    uint32_t borderColorRight = SECOND_RIGHT_COLOR_VALUE;
    ArkUI_NumberValue value[] = {
        {.u32 = borderColorTop}, {.u32 = borderColorBottom}, {.u32 = borderColorLeft}, {.u32 = borderColorRight}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(image, NODE_BORDER_COLOR, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_0].u32, borderColorTop);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_1].u32, borderColorBottom);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_2].u32, borderColorLeft);
    ASSERT_EQ(nodeAPI->getAttribute(image, NODE_BORDER_COLOR)->value[PARAM_3].u32, borderColorRight);
    NAPI_END;
}

} // namespace ArkUICapiTest
