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

static napi_value TestListLinearGradient001(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient002(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient003(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT;
    int32_t repeating = true;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient004(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_BOTTOM;
    int32_t repeating = true;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient005(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient006(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_LEFT_BOTTOM;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient007(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_TOP;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);

    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient008(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_RIGHT_BOTTOM;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};

    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient009(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_NONE;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, SIZE_180);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}

static napi_value TestListLinearGradient010(napi_env env, napi_callback_info info)
{
    NAPI_START(list, ARKUI_NODE_LIST);
    float angle = SIZE_90;
    int32_t direction = ARKUI_LINEAR_GRADIENT_DIRECTION_CUSTOM;
    int32_t repeating = false;
    unsigned int colors[] = {COLOR_WHITE, COLOR_BLUE};
    float stops[] = {PARAM_0, PARAM_0_POINT_5};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[PARAM_3] = {{.f32 = angle}, {.i32 = direction}, {.i32 = repeating}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(list, NODE_LINEAR_GRADIENT, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_0].f32, angle);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_1].i32, direction);
    ASSERT_EQ(nodeAPI->getAttribute(list, NODE_LINEAR_GRADIENT)->value[PARAM_2].i32, repeating);
    NAPI_END;
}
} // namespace ArkUICapiTest
