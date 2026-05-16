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

static napi_value TestSwiperCurve001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_LINEAR}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_LINEAR);
    NAPI_END;
}

static napi_value TestSwiperCurve002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_EASE}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_EASE);
    NAPI_END;
}

static napi_value TestSwiperCurve003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_EASE_IN}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_EASE_IN);
    NAPI_END;
}

static napi_value TestSwiperCurve004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_EASE_OUT}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_EASE_OUT);
    NAPI_END;
}

static napi_value TestSwiperCurve005(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_EASE_IN_OUT}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_EASE_IN_OUT);
    NAPI_END;
}

static napi_value TestSwiperCurve006(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_FAST_OUT_SLOW_IN}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_FAST_OUT_SLOW_IN);
    NAPI_END;
}

static napi_value TestSwiperCurve007(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_LINEAR_OUT_SLOW_IN}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_LINEAR_OUT_SLOW_IN);
    NAPI_END;
}

static napi_value TestSwiperCurve008(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_FAST_OUT_LINEAR_IN}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_FAST_OUT_LINEAR_IN);
    NAPI_END;
}

static napi_value TestSwiperCurve009(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_EXTREME_DECELERATION}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_EXTREME_DECELERATION);
    NAPI_END;
}

static napi_value TestSwiperCurve010(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_SHARP}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_SHARP);
    NAPI_END;
}

static napi_value TestSwiperCurve011(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_RHYTHM}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_RHYTHM);
    NAPI_END;
}

static napi_value TestSwiperCurve012(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_SMOOTH}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_SMOOTH);
    NAPI_END;
}

static napi_value TestSwiperCurve013(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue curve_value[] = {{.i32 = ARKUI_CURVE_FRICTION}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, ARKUI_CURVE_FRICTION);
    NAPI_END;
}

static napi_value TestSwiperCurve014(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t curve = -1;

    ArkUI_NumberValue curve_value[] = {{.i32 = curve}};
    ArkUI_AttributeItem curve_value_item = {curve_value, sizeof(curve_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_CURVE, &curve_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_CURVE)->value[PARAM_0].i32, curve);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
