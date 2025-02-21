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

static napi_value TestSliderStyle001(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STYLE)->value[PARAM_0].i32, ARKUI_SLIDER_STYLE_OUT_SET);
    NAPI_END;
}

static napi_value TestSliderStyle002(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_IN_SET;
    ArkUI_NumberValue value[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STYLE)->value[PARAM_0].i32, styleValue);
    NAPI_END;
}

static napi_value TestSliderStyle003(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = ARKUI_SLIDER_STYLE_OUT_SET;
    ArkUI_NumberValue value[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_STYLE)->value[PARAM_0].i32, styleValue);
    NAPI_END;
}

static napi_value TestSliderStyle004(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = SIZE_200;
    ArkUI_NumberValue value[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_STYLE)->value[PARAM_0].i32, styleValue);
    NAPI_END;
}

static napi_value TestSliderStyle005(napi_env env, napi_callback_info info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t styleValue = -PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = styleValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_STYLE, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_STYLE)->value[PARAM_0].i32, styleValue);
    NAPI_END;
}
} // namespace ArkUICapiTest
