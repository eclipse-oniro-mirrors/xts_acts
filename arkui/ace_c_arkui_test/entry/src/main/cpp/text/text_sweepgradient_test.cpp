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

static napi_value TestTextSweepGradient001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float defaultValue = 0;
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_2].f32, defaultValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_3].f32, defaultValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_4].f32, defaultValue);
    NAPI_END;
}

static napi_value TestTextSweepGradient002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 50;
    float startValue = 0;
    float endValue = 180;
    float angleValue = 90;
    int32_t repeat = 0;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = startValue},
                                 {.f32 = endValue},    {.f32 = angleValue},  {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_SWEEP_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_2].f32, startValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_3].f32, endValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_4].f32, angleValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_5].i32, repeat);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextSweepGradient003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 50;
    float startValue = 0;
    float endValue = 180;
    float angleValue = 90;
    int32_t repeat = 0;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF, 0xFF000000};
    float stops[] = {0.2, 0.5, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_3};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = startValue},
                                 {.f32 = endValue},    {.f32 = angleValue},  {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_SWEEP_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_2].f32, startValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_3].f32, endValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_4].f32, angleValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_5].i32, repeat);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_3);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextSweepGradient004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 50;
    float startValue = 0;
    float endValue = 180;
    float angleValue = 90;
    int32_t repeat = 1;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = startValue},
                                 {.f32 = endValue},    {.f32 = angleValue},  {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_SWEEP_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_2].f32, startValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_3].f32, endValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_4].f32, angleValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_5].i32, repeat);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextSweepGradient005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float offsetValue = 50;
    float startValue = 0;
    float endValue = 180;
    float angleValue = 90;
    int32_t repeat = 0;
    unsigned int colors[] = {1234, 1234};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = startValue},
                                 {.f32 = endValue},    {.f32 = angleValue},  {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(text, NODE_SWEEP_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_2].f32, startValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_3].f32, endValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_4].f32, angleValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->value[PARAM_5].i32, repeat);
    ArkUI_ColorStop *arkUI_ColorStop =
        reinterpret_cast<ArkUI_ColorStop *>(nodeAPI->getAttribute(text, NODE_SWEEP_GRADIENT)->object);
    ASSERT_EQ(arkUI_ColorStop->size, PARAM_2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
