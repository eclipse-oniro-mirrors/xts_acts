/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "ani/ani.h"

namespace ArkUIAniTest {

static ani_double TestSliderTrackThickness001(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness002(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness003(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness004(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness005(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness006(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness007(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness008(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness009(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness010(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness011(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness012(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness013(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness014(ani_env* env, ani_object info)
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

static ani_double TestSliderTrackThickness015(ani_env* env, ani_object info)
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

} // namespace ArkUIAniTest