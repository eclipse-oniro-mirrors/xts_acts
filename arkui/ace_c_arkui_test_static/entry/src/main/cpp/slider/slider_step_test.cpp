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
#define PARAM_0_01 0.01
#define DEFAULT_VALUE 1.00
#define PARAM_0_001 0.001
#define PARAM_101 101

static ani_double TestSliderStep001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float defaultValue = DEFAULT_VALUE;
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STEP)->value[PARAM_0].f32, defaultValue);
    NAPI_END;
}

static ani_double TestSliderStep002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float stepValue = PARAM_0_01;
    ArkUI_NumberValue value[] = {{.f32 = stepValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STEP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STEP)->value[PARAM_0].f32, stepValue);
    NAPI_END;
}

static ani_double TestSliderStep003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float stepValue = -PARAM_10;
    ArkUI_NumberValue value[] = {{.f32 = stepValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STEP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_STEP)->value[PARAM_0].f32, stepValue);
    NAPI_END;
}

static ani_double TestSliderStep004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float stepValue = PARAM_0_001;
    ArkUI_NumberValue value[] = {{.f32 = stepValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STEP, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_STEP)->value[PARAM_0].f32, stepValue);
    NAPI_END;
}

static ani_double TestSliderStep005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float stepValue = PARAM_101;
    ArkUI_NumberValue value[] = {{.f32 = stepValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STEP, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STEP)->value[PARAM_0].f32, stepValue);
    NAPI_END;
}
} // namespace ArkUIAniTest
