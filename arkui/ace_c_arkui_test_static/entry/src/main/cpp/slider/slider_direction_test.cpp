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
#define WRONG_DIRECTION_VALUE (ARKUI_SLIDER_DIRECTION_HORIZONTAL + 10)
#define NEGATIVE_VALUE (-1)

static ani_double TestSliderDirection001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_DIRECTION)->value[PARAM_0].i32,
              ARKUI_SLIDER_DIRECTION_HORIZONTAL);
    NAPI_END;
}

static ani_double TestSliderDirection002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t directionValue = ARKUI_SLIDER_DIRECTION_VERTICAL;
    ArkUI_NumberValue value[] = {{.i32 = directionValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_DIRECTION)->value[PARAM_0].i32, directionValue);
    NAPI_END;
}

static ani_double TestSliderDirection003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t directionValue = ARKUI_SLIDER_DIRECTION_HORIZONTAL;
    ArkUI_NumberValue value[] = {{.i32 = directionValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_DIRECTION, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_DIRECTION)->value[PARAM_0].i32, directionValue);
    NAPI_END;
}

static ani_double TestSliderDirection004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t directionValue = WRONG_DIRECTION_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = directionValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_DIRECTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_DIRECTION)->value[PARAM_0].i32, directionValue);
    NAPI_END;
}

static ani_double TestSliderDirection005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    int32_t directionValue = NEGATIVE_VALUE;
    ArkUI_NumberValue value[] = {{.i32 = directionValue}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_DIRECTION, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    ASSERT_NE(nodeAPI->getAttribute(slider, NODE_SLIDER_DIRECTION)->value[PARAM_0].i32, directionValue);
    NAPI_END;
}
} // namespace ArkUIAniTest
