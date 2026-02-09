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

static ani_double TestSliderTrackColor001(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0xFF1122FF;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}

static ani_double TestSliderTrackColor002(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0xFF000000;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}

static ani_double TestSliderTrackColor003(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0xFFFFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}

static ani_double TestSliderTrackColor004(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0x00FFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}

static ani_double TestSliderTrackColor005(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0x80FFFFFF;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}

static ani_double TestSliderTrackColor006(ani_env* env, ani_object info)
{
    NAPI_START(slider, ARKUI_NODE_SLIDER);
    uint32_t trackColor = 0x00000000;
    ArkUI_NumberValue value[] = {{.u32 = trackColor}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(slider, NODE_SLIDER_TRACK_COLOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(slider, NODE_SLIDER_TRACK_COLOR)->value[PARAM_0].u32, trackColor);
    NAPI_END;
}
} // namespace ArkUIAniTest
