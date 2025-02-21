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
/*
 * @tc.number     : SUB_ARKUI_CAPI_TEXT_DECORATION_0100
 * @tc.name       : testTextDecoration001
 * @tc.desc       : testing decoration for text with default value
 * @tc.size       : MediumTest
 * @tc.type       : Function
 * @tc.level      : Level 1
 */
static napi_value TestTextDecoration001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, ARKUI_TEXT_DECORATION_TYPE_NONE);
    NAPI_END;
}

static napi_value TestTextDecoration002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32,
              ARKUI_TEXT_DECORATION_TYPE_UNDERLINE);
    NAPI_END;
}

static napi_value TestTextDecoration003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_DECORATION_TYPE_OVERLINE}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32,
              ARKUI_TEXT_DECORATION_TYPE_OVERLINE);
    NAPI_END;
}

static napi_value TestTextDecoration004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32,
              ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextDecoration005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t exceptionValue = -10;
    ArkUI_NumberValue value[] = {{.i32 = exceptionValue}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    if (nodeAPI->getAttribute(text, NODE_TEXT_DECORATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, exceptionValue);
    };
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestTextDecoration006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t color = 0xFFFF0000;
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE}, {.u32 = color}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    NAPI_END;
}

static napi_value TestTextDecoration007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_SOLID;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DOUBLE;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DOTTED;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DASHED;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_WAVY;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = PARAM_NEGATIVE_10;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}

static napi_value TestTextDecoration013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = SIZE_100;
    ArkUI_NumberValue value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_DECORATION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_NE(nodeAPI->getAttribute(text, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    NAPI_END;
}
} // namespace ArkUICapiTest
