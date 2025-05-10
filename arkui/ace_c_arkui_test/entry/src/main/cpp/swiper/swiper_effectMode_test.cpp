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

static napi_value TestSwiperEffectMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = ARKUI_EDGE_EFFECT_SPRING}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE)->value[PARAM_0].i32,
        ARKUI_EDGE_EFFECT_SPRING);
    NAPI_END;
}

static napi_value TestSwiperEffectMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = ARKUI_EDGE_EFFECT_FADE}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE)->value[PARAM_0].i32,
        ARKUI_EDGE_EFFECT_FADE);
    NAPI_END;
}
static napi_value TestSwiperEffectMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = ARKUI_EDGE_EFFECT_NONE}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE)->value[PARAM_0].i32,
        ARKUI_EDGE_EFFECT_NONE);
    NAPI_END;
}
static napi_value TestSwiperEffectMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = PARAM_3}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
static napi_value TestSwiperEffectMode005(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
static napi_value TestSwiperEffectMode006(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}
static napi_value TestSwiperEffectMode007(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue mode_value[] = {{.i32 = ARKUI_EDGE_EFFECT_FADE}};
    ArkUI_AttributeItem mode_value_item = {mode_value, sizeof(mode_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE, &mode_value_item);
    ASSERT_EQ(ret, SUCCESS);
    auto ret1 = nodeAPI->resetAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_EDGE_EFFECT_MODE)->value[PARAM_0].i32,
        ARKUI_EDGE_EFFECT_SPRING);
    NAPI_END;
}
} // namespace ArkUICapiTest
