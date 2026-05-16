/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestSpanDecoration001(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_NONE;
    uint32_t color = 0x00000000;

    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {.u32 = color}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    NAPI_END;
}

static ani_double TestSpanDecoration002(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    uint32_t color = 0xFFFF0000;

    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {.u32 = color}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    NAPI_END;
}

static ani_double TestSpanDecoration003(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_OVERLINE;
    uint32_t color = 0xFF000000;

    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {.u32 = color}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    NAPI_END;
}

static ani_double TestSpanDecoration004(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH;
    uint32_t color = 0xFFFFFFFF;

    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {.u32 = color}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
    ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    NAPI_END;
}

static ani_double TestSpanDecoration005(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = PARAM_NEGATIVE_1;
    uint32_t color = 0xFF000000;

    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {.u32 = color}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_1].u32, color);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration006(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_SOLID;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration007(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DOUBLE;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration008(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DOTTED;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration009(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_DASHED;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration010(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = ARKUI_TEXT_DECORATION_STYLE_WAVY;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, SUCCESS);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_EQ(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration011(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = PARAM_NEGATIVE_10;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}

static ani_double TestSpanDecoration012(ani_env* env, ani_object info)
{
    NAPI_START(span, ARKUI_NODE_SPAN);
    int32_t decorationType = ARKUI_TEXT_DECORATION_TYPE_UNDERLINE;
    int32_t decorationStyle = SIZE_100;
    ArkUI_NumberValue decoration_value[] = {{.i32 = decorationType}, {}, {.i32 = decorationStyle}};
    ArkUI_AttributeItem decoration_item = {decoration_value, sizeof(decoration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(span, NODE_TEXT_DECORATION, &decoration_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(span, NODE_TEXT_DECORATION) != nullptr &&
        nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_0].i32, decorationType);
        ASSERT_NE(nodeAPI->getAttribute(span, NODE_TEXT_DECORATION)->value[PARAM_2].i32, decorationStyle);
    }
    NAPI_END;
}
} // namespace ArkUIAniTest
