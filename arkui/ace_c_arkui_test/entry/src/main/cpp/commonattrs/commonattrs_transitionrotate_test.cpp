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

static napi_value TestCommonAttrsTransitionRotate001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_0;
    float angle = PARAM_NEGATIVE_180;
    float lineOfSight = PARAM_NEGATIVE_1;
    int32_t duration = PARAM_NEGATIVE_1000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, lineOfSight);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curveType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delayDuration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, numberOfTimes);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playbackMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, playbackSpeed);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_NEGATIVE_5;
    float y = PARAM_NEGATIVE_5;
    float z = PARAM_0;
    float angle = PARAM_0;
    float lineOfSight = PARAM_0;
    int32_t duration = PARAM_0;
    int32_t curveType = PARAM_NEGATIVE_1;
    int32_t delayDuration = PARAM_0;
    int32_t numberOfTimes = PARAM_NEGATIVE_1;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_REVERSE;
    float playbackSpeed = PARAM_1;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate003(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_5;
    float y = PARAM_5;
    float z = PARAM_5;
    float angle = PARAM_180;
    float lineOfSight = PARAM_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = PARAM_13;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float playbackSpeed = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate004(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_5;
    float y = PARAM_5;
    float z = PARAM_5;
    float angle = PARAM_180;
    float lineOfSight = PARAM_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = PARAM_13;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float playbackSpeed = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate005(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_5;
    float y = PARAM_5;
    float z = PARAM_5;
    float angle = PARAM_180;
    float lineOfSight = PARAM_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = PARAM_13;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_ALTERNATE;
    float playbackSpeed = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate006(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_5;
    float y = PARAM_5;
    float z = PARAM_5;
    float angle = PARAM_180;
    float lineOfSight = PARAM_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_LINEAR;
    int32_t delayDuration = PARAM_2000;
    int32_t numberOfTimes = PARAM_0;
    int32_t playbackMode = PARAM_4;
    float playbackSpeed = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate007(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_0;
    float angle = PARAM_0;
    float lineOfSight = PARAM_NEGATIVE_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_EASE_OUT;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, x);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_1].f32, y);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_2].f32, z);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_3].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_4].f32, lineOfSight);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_5].i32, duration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_6].i32, curveType);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_7].i32, delayDuration);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_8].i32, numberOfTimes);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_9].i32, playbackMode);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_10].f32, playbackSpeed);
    NAPI_END;
}

static napi_value TestCommonAttrsTransitionRotate008(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    float x = PARAM_0;
    float y = PARAM_0;
    float z = PARAM_0;
    float angle = PARAM_0;
    float lineOfSight = PARAM_NEGATIVE_1;
    int32_t duration = PARAM_2000;
    int32_t curveType = ARKUI_CURVE_EASE_OUT;
    int32_t delayDuration = PARAM_NEGATIVE_1000;
    int32_t numberOfTimes = PARAM_3;
    int32_t playbackMode = ARKUI_ANIMATION_PLAY_MODE_NORMAL;
    float playbackSpeed = PARAM_2;
    ArkUI_NumberValue value[] = {{.f32 = x}, {.f32 = y}, {.f32 = z}, {.f32 = angle}, {.f32 = lineOfSight},
                                 {.i32 = duration}, {.i32 = curveType}, {.i32 = delayDuration},
                                 {.i32 = numberOfTimes}, {.i32 = playbackMode}, {.f32 = playbackSpeed}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_ROTATE_TRANSITION, &valueItem);
    auto ret = nodeAPI->resetAttribute(column, NODE_ROTATE_TRANSITION);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(column, NODE_ROTATE_TRANSITION)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest
