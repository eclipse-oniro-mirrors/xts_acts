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
#define PARAM_90 90
#define PARAM_100 100
#define PARAM_101 101

static ani_double TestSliderMax001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_MAX_VALUE)->value[PARAM_0].f32, SIZE_100);
    NAPI_END;
}

static ani_double TestSliderMax002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float maxValue = PARAM_90;
    ArkUI_NumberValue value[] = {{.f32 = maxValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_MAX_VALUE)->value[PARAM_0].f32, maxValue);
    NAPI_END;
}

static ani_double TestSliderMax003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float maxValue = -PARAM_100;
    ArkUI_NumberValue value[] = {{.f32 = maxValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_MAX_VALUE)->value[PARAM_0].f32, maxValue);
    NAPI_END;
}

static ani_double TestSliderMax004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float maxValue = PARAM_101;
    ArkUI_NumberValue value[] = {{.f32 = maxValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_MAX_VALUE)->value[PARAM_0].f32, maxValue);
    NAPI_END;
}

static ani_double TestSliderMax005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    float maxValue = PARAM_0;
    ArkUI_NumberValue value[] = {{.f32 = maxValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_MAX_VALUE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_MAX_VALUE)->value[PARAM_0].f32, maxValue);
    NAPI_END;
}
} // namespace ArkUIAniTest
