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

static napi_value TestCustomComponentRadialGradient001(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float defaultValue = 0;
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, defaultValue);
    NAPI_END;
}

static napi_value TestCustomComponentRadialGradient002(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float offsetValue = 25;
    int32_t repeat = 0;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = offsetValue}, {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(custom, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeat);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomComponentRadialGradient003(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float offsetValue = 25;
    int32_t repeat = 0;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF, 0xFF000000};
    float stops[] = {0.2, 0.5, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_3};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = offsetValue}, {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(custom, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeat);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestCustomComponentRadialGradient004(napi_env env, napi_callback_info info)
{
    NAPI_START(custom, ARKUI_NODE_CUSTOM);
    float offsetValue = 25;
    int32_t repeat = 1;
    unsigned int colors[] = {0xFFFFFFFF, 0xFF0000FF};
    float stops[] = {0.3, 1};
    ArkUI_ColorStop colorStop = {colors, stops, PARAM_2};
    ArkUI_NumberValue value[] = {{.f32 = offsetValue}, {.f32 = offsetValue}, {.f32 = offsetValue}, {.i32 = repeat}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto ret = nodeAPI->setAttribute(custom, NODE_RADIAL_GRADIENT, &valueItem);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_0].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_1].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_2].f32, offsetValue);
    ASSERT_EQ(nodeAPI->getAttribute(custom, NODE_RADIAL_GRADIENT)->value[PARAM_3].i32, repeat);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
