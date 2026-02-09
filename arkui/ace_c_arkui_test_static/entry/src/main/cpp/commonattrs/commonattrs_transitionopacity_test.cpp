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

static ani_double TestCommonAttrsTransitionOpacity001(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_NEGATIVE_1;
    int32_t duration = PARAM_NEGATIVE_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity002(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_NEGATIVE_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity003(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0_POINT_5;
    int32_t duration = PARAM_NEGATIVE_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity004(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_1;
    int32_t duration = PARAM_NEGATIVE_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity005(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity006(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity007(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = PARAM_NEGATIVE_1;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity008(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = PARAM_13;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity009(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacityValue);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curveType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delayDuration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, numberOfTimes);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playbackMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, playbackSpeed);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity010(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacityValue);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curveType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delayDuration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, numberOfTimes);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playbackMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, playbackSpeed);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity011(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float playbackSpeed = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_0].f32, opacityValue);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_1].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_2].i32, curveType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_3].i32, delayDuration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_4].i32, numberOfTimes);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_5].i32, playbackMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_OPACITY_TRANSITION)->value[PARAM_6].f32, playbackSpeed);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity012(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_NEGATIVE_1;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE_REVERSE;
    float playbackSpeed = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity013(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_NEGATIVE_1;
    int32_t playbackMode = PARAM_NEGATIVE_1;
    float playbackSpeed = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity014(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_NEGATIVE_1;
    int32_t playbackMode = PARAM_4;
    float playbackSpeed = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static ani_double TestCommonAttrsTransitionOpacity015(ani_env* env, ani_object info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float opacityValue = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float playbackSpeed = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = opacityValue}, {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_OPACITY_TRANSITION, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_OPACITY_TRANSITION);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUIAniTest