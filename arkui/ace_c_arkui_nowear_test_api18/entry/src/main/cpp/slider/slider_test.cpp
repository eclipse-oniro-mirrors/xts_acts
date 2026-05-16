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

namespace ArkUICapiTest {
#define NEGATIVE_VALUE (-1)

static napi_value TestSliderEnableHpaticFeedback001(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, 1);
    NAPI_END;
}

static napi_value TestSliderEnableHpaticFeedback002(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t haptic = true;
    ArkUI_NumberValue value[] = {{.i32 = haptic}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, haptic);
    NAPI_END;
}

static napi_value TestSliderEnableHpaticFeedback003(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t haptic = false;
    ArkUI_NumberValue value[] = {{.i32 = haptic}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, haptic);
    NAPI_END;
}

static napi_value TestSliderEnableHpaticFeedback004(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t haptic = NEGATIVE_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = haptic}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, 1);
    NAPI_END;
}

static napi_value TestSliderEnableHpaticFeedback005(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t haptic = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = haptic}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_ENABLE_HAPTIC_FEEDBACK)->value[PARAM_0].i32, haptic);
    NAPI_END;
}
} // namespace ArkUICapiTest
