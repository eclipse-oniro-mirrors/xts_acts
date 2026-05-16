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

static napi_value TestTextLinearGradient001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_TOP}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT}, {.i32 = true}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, true);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF, 0xFF000000};
    float stops[] = {0.2, 0.5, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_3};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_3);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_NONE}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextLinearGradient011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = 90;
    unsigned int colors[] = {1234, 1234};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT}, {.i32 = false}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, false);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_LINEAR_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
