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
#define PARAM_101 101

static ani_double TestSliderValue001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_VALUE)->value[PARAM_0].f32, PARAM_0);
    NAPI_END;
}

static ani_double TestSliderValue002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float progressValue = PARAM_10;
    ArkUI_NumberValue value[] = {{.f32 = progressValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_VALUE)->value[PARAM_0].f32, progressValue);
    NAPI_END;
}

static ani_double TestSliderValue003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float maxValue = SIZE_100;
    float minValue = PARAM_0;
    float progressValue = -PARAM_10;
    ArkUI_NumberValue max[] = {{.f32 = maxValue}};
    ArkUI_AttributeItem maxValue_item = {max, sizeof(max) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &maxValue_item);
    ArkUI_NumberValue min[] = {{.f32 = minValue}};
    ArkUI_AttributeItem minValue_item = {min, sizeof(min) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_MIN_VALUE, &minValue_item);
    ArkUI_NumberValue value[] = {{.f32 = progressValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_VALUE)->value[PARAM_0].f32, progressValue);
    NAPI_END;
}

static ani_double TestSliderValue004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float progressValue = PARAM_101;
    ArkUI_NumberValue value[] = {{.f32 = progressValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &value_item);
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_VALUE)->value[PARAM_0].f32, progressValue);
    NAPI_END;
}

static ani_double TestSliderValue005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float progressValue = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = progressValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_VALUE)->value[PARAM_0].f32, progressValue);
    NAPI_END;
}
} // namespace ArkUIAniTest
