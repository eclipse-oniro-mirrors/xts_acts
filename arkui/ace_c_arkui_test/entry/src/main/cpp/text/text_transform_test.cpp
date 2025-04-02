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
static napi_value TestTextTransform001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float matrixValue = 0.5;
    float translateValue = 100;
    ArkUI_NumberValue value[] = {{.f32 = matrixValue},    {.f32 = PARAM_0},        {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},        {.f32 = matrixValue},    {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},        {.f32 = PARAM_0},        {.f32 = PARAM_1}, {.f32 = PARAM_0},
                                 {.f32 = translateValue}, {.f32 = translateValue}, {.f32 = PARAM_0}, {.f32 = PARAM_1}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TRANSFORM, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_0].f32, matrixValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_5].f32, matrixValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_12].f32, translateValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_13].f32, translateValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextTransform002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angleValue = 45;
    ArkUI_NumberValue value[] = {{.f32 = static_cast<float>(cos(angleValue))},
                                 {.f32 = static_cast<float>(-sin(angleValue))},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = static_cast<float>(sin(angleValue))},
                                 {.f32 = static_cast<float>(cos(angleValue))},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_1},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},
                                 {.f32 = PARAM_1}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TRANSFORM, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_0].f32, static_cast<float>(cos(angleValue)));
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_1].f32, static_cast<float>(-sin(angleValue)));
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_4].f32, static_cast<float>(sin(angleValue)));
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_5].f32, static_cast<float>(cos(angleValue)));
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextTransform003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float translateValue = 1000;
    ArkUI_NumberValue value[] = {{.f32 = PARAM_1},        {.f32 = PARAM_0},        {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},        {.f32 = PARAM_1},        {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0},        {.f32 = PARAM_0},        {.f32 = PARAM_1}, {.f32 = PARAM_0},
                                 {.f32 = translateValue}, {.f32 = translateValue}, {.f32 = PARAM_0}, {.f32 = PARAM_1}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TRANSFORM, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_12].f32, translateValue);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_13].f32, translateValue);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestTextTransform004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0},
                                 {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(text, NODE_TRANSFORM, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_0].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_5].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_12].f32, PARAM_0);
    ASSERT_EQ(nodeAPI->getAttribute(text, NODE_TRANSFORM)->value[PARAM_13].f32, PARAM_0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest
