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

static napi_value TestStackLinearGradient001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_TOP}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient008(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient009(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    float expectAngle = 180;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_NONE}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, expectAngle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_NONE);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

static napi_value TestStackLinearGradient010(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    uint32_t colorRed = 0xFFFF0000;
    uint32_t colorBlue = 0xFF0000FF;
    uint32_t colors[] = {colorRed, colorBlue};
    float begin = 0.0;
    float end = 1.0;
    float stops[] = {begin, end};
    float angle = 60;
    int32_t size = 2;
    int32_t repeating = 0;

    ArkUI_ColorStop colorStop = {colors, stops, size};
    ArkUI_NumberValue linearGradient_value[] = {
        {.f32 = angle}, {.i32 = ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM}, {.i32 = repeating}};
    ArkUI_AttributeItem linearGradient_item = {linearGradient_value,
                                               sizeof(linearGradient_value) / sizeof(ArkUI_NumberValue)};
    linearGradient_item.object = &colorStop;
    auto ret = nodeAPI->setAttribute(stack, NODE_LINEAR_GRADIENT, &linearGradient_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32,
              ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[0], colorRed);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->colors[1], colorBlue);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[0], begin);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->stops[1], end);
    ASSERT_EQ(((ArkUI_ColorStop *)(nodeAPI->getAttribute(stack, NODE_LINEAR_GRADIENT)->object))->size, size);
    NAPI_END;
}

} // namespace ArkUICapiTest
