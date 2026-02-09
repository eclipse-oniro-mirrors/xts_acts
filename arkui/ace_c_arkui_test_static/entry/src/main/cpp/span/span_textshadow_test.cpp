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

static ani_double TestSpanTextShadow001(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_TEXT_SHADOW, &valueItem);
    ASSERT_EQ(ret, INVALID_PARAM);

    NAPI_END;
}

static ani_double TestSpanTextShadow002(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);
    float radius = 10;
    uint32_t colour = 0xFFFF0000;
    float xDeviation = 50;
    float yDeviation = 50;

    ArkUI_NumberValue value[] = {
        {.f32 = radius}, {.i32 = ARKUI_SHADOW_TYPE_COLOR}, {.u32 = colour}, {.f32 = xDeviation}, {.f32 = yDeviation}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_TEXT_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_0].f32, radius);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_1].i32, ARKUI_SHADOW_TYPE_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_2].u32, colour);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_3].f32, xDeviation);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_4].f32, yDeviation);
    NAPI_END;
}

static ani_double TestSpanTextShadow003(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);
    float radius = 1000;
    uint32_t colour = 0xFFFFFFFF;
    float xDeviation = 1000;
    float yDeviation = 1000;

    ArkUI_NumberValue value[] = {
        {.f32 = radius}, {.i32 = ARKUI_SHADOW_TYPE_BLUR}, {.u32 = colour}, {.f32 = xDeviation}, {.f32 = yDeviation}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_TEXT_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_0].f32, radius);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_1].i32, ARKUI_SHADOW_TYPE_BLUR);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_2].u32, colour);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_3].f32, xDeviation);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_4].f32, yDeviation);
    NAPI_END;
}

static ani_double TestSpanTextShadow004(ani_env* env, ani_object info)
{
    NAPI_START(text, ARKUI_NODE_SPAN);
    float radius = 10;
    uint32_t colour = 0xFFFF0000;
    float xDeviation = 50;
    float yDeviation = 50;

    ArkUI_NumberValue value[] = {
        {.f32 = radius}, {.i32 = ARKUI_SHADOW_TYPE_BLUR}, {.u32 = colour}, {.f32 = xDeviation}, {.f32 = yDeviation}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TEXT_TEXT_SHADOW, &valueItem);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(text, NODE_TEXT_TEXT_SHADOW);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_1].i32, ARKUI_SHADOW_TYPE_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_2].u32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_3].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TEXT_TEXT_SHADOW)->value[PARAM_4].f32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUIAniTest
