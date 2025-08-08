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

static napi_value TestStackTransition001(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue move_transition_value[] = {
        {.i32 = ARKUI_TRANSITION_EDGE_TOP}, {.i32 = SIZE_600}, {.i32 = ARKUI_CURVE_LINEAR}};
    ArkUI_AttributeItem move_transition_item = {move_transition_value,
                                                sizeof(move_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MOVE_TRANSITION, &move_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, ARKUI_TRANSITION_EDGE_TOP);
    NAPI_END;
}

static napi_value TestStackTransition002(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue move_transition_value[] = {
        {.i32 = ARKUI_TRANSITION_EDGE_BOTTOM}, {.i32 = SIZE_600}, {.i32 = ARKUI_CURVE_LINEAR}};
    ArkUI_AttributeItem move_transition_item = {move_transition_value,
                                                sizeof(move_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MOVE_TRANSITION, &move_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, ARKUI_TRANSITION_EDGE_BOTTOM);
    NAPI_END;
}

static napi_value TestStackTransition003(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue move_transition_value[] = {
        {.i32 = ARKUI_TRANSITION_EDGE_START}, {.i32 = SIZE_600}, {.i32 = ARKUI_CURVE_LINEAR}};
    ArkUI_AttributeItem move_transition_item = {move_transition_value,
                                                sizeof(move_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MOVE_TRANSITION, &move_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, ARKUI_TRANSITION_EDGE_START);
    NAPI_END;
}

static napi_value TestStackTransition004(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    ArkUI_NumberValue move_transition_value[] = {
        {.i32 = ARKUI_TRANSITION_EDGE_END}, {.i32 = SIZE_600}, {.i32 = ARKUI_CURVE_LINEAR}};
    ArkUI_AttributeItem move_transition_item = {move_transition_value,
                                                sizeof(move_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MOVE_TRANSITION, &move_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, ARKUI_TRANSITION_EDGE_END);
    NAPI_END;
}

static napi_value TestStackTransition005(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    int32_t moveTransition = -1;
    ArkUI_NumberValue move_transition_value[] = {{.i32 = moveTransition}};
    ArkUI_AttributeItem move_transition_item = {move_transition_value,
                                                sizeof(move_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_MOVE_TRANSITION, &move_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_MOVE_TRANSITION)->value[PARAM_0].i32, moveTransition);
    }
    NAPI_END;
}

static napi_value TestStackTransition006(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0.5;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 500;
    int32_t iterations = 2;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = -1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestStackTransition007(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0.5;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_EASE;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = 0;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition008(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 0.6;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float tempo = 2;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition009(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition010(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition011(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition012(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition013(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition014(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EXTREME_DECELERATION;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition015(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SHARP;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition016(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_RHYTHM;
    int32_t delay = 300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition017(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SMOOTH;
    int32_t delay = -300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition018(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FRICTION;
    int32_t delay = -1300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition019(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = -1;
    int32_t duration = -1;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition020(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float opacity = 2;
    int32_t duration = 2000;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue opacity_transition_value[] = {{.f32 = opacity}, {.i32 = duration},   {.i32 = curve},
                                                    {.i32 = delay},   {.i32 = iterations}, {.i32 = playMode},
                                                    {.f32 = tempo}};
    ArkUI_AttributeItem opacity_transition_item = {opacity_transition_value,
                                                   sizeof(opacity_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_OPACITY_TRANSITION, &opacity_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacity);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition021(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 50;
    float y = 50;
    float z = 50;
    float angle = 50;
    float perspective = 50;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 500;
    int32_t iterations = 2;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = -1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_OPACITY_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestStackTransition022(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = -50;
    float y = -50;
    float z = -50;
    float angle = -50;
    float perspective = -50;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_EASE;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = 0;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition023(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float tempo = 2;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition024(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition025(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition026(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition027(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition028(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition029(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EXTREME_DECELERATION;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition030(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SHARP;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition031(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_RHYTHM;
    int32_t delay = 300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition032(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SMOOTH;
    int32_t delay = -300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition033(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FRICTION;
    int32_t delay = -1300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition034(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = -1;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition035(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    float angle = 0;
    float perspective = 0;
    int32_t duration = 2000;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue rotate_transition_value[] = {
        {.f32 = x},     {.f32 = y},     {.f32 = z},          {.f32 = angle},    {.f32 = perspective}, {.i32 = duration},
        {.i32 = curve}, {.i32 = delay}, {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem rotate_transition_item = {rotate_transition_value,
                                                  sizeof(rotate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_ROTATE_TRANSITION, &rotate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, perspective);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition036(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0.5;
    float y = 0.5;
    float z = 0.5;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 500;
    int32_t iterations = 2;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = -1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestStackTransition037(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 2;
    float y = 2;
    float z = 2;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_EASE;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = 0;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition038(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = -2;
    float y = -2;
    float z = -2;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float tempo = 2;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition039(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition040(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition041(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition042(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition043(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition044(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EXTREME_DECELERATION;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition045(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SHARP;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition046(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_RHYTHM;
    int32_t delay = 300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition047(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SMOOTH;
    int32_t delay = -300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition048(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FRICTION;
    int32_t delay = -1300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition049(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = -1;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition050(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 1;
    float y = 1;
    float z = 1;
    int32_t duration = 2000;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue scale_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                  {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                  {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem scale_transition_item = {scale_transition_value,
                                                 sizeof(scale_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_SCALE_TRANSITION, &scale_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_SCALE_TRANSITION)->value[PARAM_8].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition051(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 50;
    float y = 50;
    float z = 50;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 500;
    int32_t iterations = 2;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = -1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, PARAM_NEGATIVE_1);
    }
    NAPI_END;
}

static napi_value TestStackTransition052(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = -50;
    float y = -50;
    float z = -50;
    int32_t duration = 500;
    int32_t curve = ARKUI_CURVE_EASE;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float tempo = 0;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition053(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float tempo = 2;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition054(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition055(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EASE_IN_OUT;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition056(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition057(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_LINEAR_OUT_SLOW_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition058(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FAST_OUT_LINEAR_IN;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition059(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_EXTREME_DECELERATION;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition060(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SHARP;
    int32_t delay = 0;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition061(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_RHYTHM;
    int32_t delay = 300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition062(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_SMOOTH;
    int32_t delay = -300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition063(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 1000;
    int32_t curve = ARKUI_CURVE_FRICTION;
    int32_t delay = -1300;
    int32_t iterations = 1;
    int32_t playMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
    ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    NAPI_END;
}

static napi_value TestStackTransition064(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = -1;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    }
    NAPI_END;
}

static napi_value TestStackTransition065(napi_env env, napi_callback_info info)
{
    NAPI_START(stack, ARKUI_NODE_STACK);
    float x = 0;
    float y = 0;
    float z = 0;
    int32_t duration = 2000;
    int32_t curve = -1;
    int32_t delay = 0;
    int32_t iterations = -2;
    int32_t playMode = -1;
    float tempo = 1;

    ArkUI_NumberValue translate_transition_value[] = {{.f32 = x},          {.f32 = y},        {.f32 = z},
                                                      {.i32 = duration},   {.i32 = curve},    {.i32 = delay},
                                                      {.i32 = iterations}, {.i32 = playMode}, {.f32 = tempo}};
    ArkUI_AttributeItem translate_transition_item = {translate_transition_value,
                                                     sizeof(translate_transition_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(stack, NODE_TRANSLATE_TRANSITION, &translate_transition_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION) != nullptr) {
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_0].f32, x);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_1].f32, y);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_2].f32, z);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_3].i32, duration);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_4].i32, curve);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_5].i32, delay);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_6].i32, iterations);
        ASSERT_NE(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_7].i32, playMode);
        ASSERT_EQ(nodeAPI->getAttribute(stack, NODE_TRANSLATE_TRANSITION)->value[PARAM_8].f32, tempo);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
