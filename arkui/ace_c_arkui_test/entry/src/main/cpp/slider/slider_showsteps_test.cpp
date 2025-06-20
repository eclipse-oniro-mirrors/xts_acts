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
#define NEGATIVE_VALUE (-1)

static napi_value TestSliderShowSteps001(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_SHOW_STEPS)->value[PARAM_0].i32, 0);
    NAPI_END;
}

static napi_value TestSliderShowSteps002(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t showSteps = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = showSteps}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_SHOW_STEPS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_SHOW_STEPS)->value[PARAM_0].i32, showSteps);
    NAPI_END;
}

static napi_value TestSliderShowSteps003(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t showSteps = PARAM_3;
    ArkUI_NumberValue value[] = {{.i32 = showSteps}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_SHOW_STEPS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_SHOW_STEPS)->value[PARAM_0].i32, showSteps);
    NAPI_END;
}

static napi_value TestSliderShowSteps004(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t showSteps = NEGATIVE_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = showSteps}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_SHOW_STEPS, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_SHOW_STEPS)->value[PARAM_0].i32, showSteps);
    NAPI_END;
}

static napi_value TestSliderShowSteps005(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t showSteps = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = showSteps}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_SHOW_STEPS, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_SHOW_STEPS)->value[PARAM_0].i32, showSteps);
    NAPI_END;
}
} // namespace ArkUICapiTest
