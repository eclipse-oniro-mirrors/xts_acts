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

static napi_value TestSwiperDuration001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float duration = 1000;

    ArkUI_NumberValue duration_value[] = {{.f32 = duration}};
    ArkUI_AttributeItem duration_item = {duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DURATION, &duration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DURATION)->value[PARAM_0].f32, duration);
    NAPI_END;
}

static napi_value TestSwiperDuration002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float duration = 10000;

    ArkUI_NumberValue duration_value[] = {{.f32 = duration}};
    ArkUI_AttributeItem duration_item = {duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DURATION, &duration_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DURATION)->value[PARAM_0].f32, duration);
    NAPI_END;
}

static napi_value TestSwiperDuration003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    float duration = -600;

    ArkUI_NumberValue duration_value[] = {{.f32 = duration}};
    ArkUI_AttributeItem duration_item = {duration_value, sizeof(duration_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DURATION, &duration_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_DURATION) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_DURATION)->value[PARAM_0].f32, duration);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest