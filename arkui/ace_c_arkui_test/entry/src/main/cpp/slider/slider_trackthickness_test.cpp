/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestSliderTrackThickness001(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_5);
    NAPI_END;
}

static napi_value TestSliderTrackThickness002(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

static napi_value TestSliderTrackThickness003(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_10000}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_10000);
    NAPI_END;
}

static napi_value TestSliderTrackThickness004(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_AttributeItem value_item1 = {};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

static napi_value TestSliderTrackThickness005(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    auto ret = nodeAPI->resetAttribute(slider, NODE_SLIDER_TRACK_THICKNESS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

static napi_value TestSliderTrackThickness006(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_5);
    NAPI_END;
}

static napi_value TestSliderTrackThickness007(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_20);
    NAPI_END;
}

static napi_value TestSliderTrackThickness008(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_10000}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_10000);
    NAPI_END;
}

static napi_value TestSliderTrackThickness009(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_AttributeItem value_item1 = {};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_20);
    NAPI_END;
}

static napi_value TestSliderTrackThickness010(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    auto ret = nodeAPI->resetAttribute(slider, NODE_SLIDER_TRACK_THICKNESS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_20);
    NAPI_END;
}

static napi_value TestSliderTrackThickness011(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_NONE;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_5);
    NAPI_END;
}

static napi_value TestSliderTrackThickness012(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_NONE;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

static napi_value TestSliderTrackThickness013(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_NONE;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_10000}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_10000);
    NAPI_END;
}

static napi_value TestSliderTrackThickness014(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_NONE;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_AttributeItem value_item1 = {};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

static napi_value TestSliderTrackThickness015(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_NONE;
    ArkUI_NumberValue value0[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item0 = {value0, sizeof(value0) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item0);
    ArkUI_NumberValue value1[] = {{.f32 = PARAM_5}};
    ArkUI_AttributeItem value_item1 = {value1, sizeof(value1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_THICKNESS, &value_item1);
    auto ret = nodeAPI->resetAttribute(slider, NODE_SLIDER_TRACK_THICKNESS);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_THICKNESS)->value[PARAM_0].f32, PARAM_4);
    NAPI_END;
}

} // namespace ArkUICapiTest