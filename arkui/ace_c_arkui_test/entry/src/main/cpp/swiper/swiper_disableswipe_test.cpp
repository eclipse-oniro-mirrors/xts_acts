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

static napi_value TestSwiperDisableSwipe001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t disableSwipe = 0;

    ArkUI_NumberValue disableSwipe_value[] = {{.i32 = disableSwipe}};
    ArkUI_AttributeItem disableSwipe_item = {disableSwipe_value,
                                             sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE)->value[PARAM_0].i32, disableSwipe);
    NAPI_END;
}

static napi_value TestSwiperDisableSwipe002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t disableSwipe = 1;

    ArkUI_NumberValue disableSwipe_value[] = {{.i32 = disableSwipe}};
    ArkUI_AttributeItem disableSwipe_item = {disableSwipe_value,
                                             sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE)->value[PARAM_0].i32, disableSwipe);
    NAPI_END;
}

static napi_value TestSwiperDisableSwipe003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t disableSwipe = -1;

    ArkUI_NumberValue disableSwipe_value[] = {{.i32 = disableSwipe}};
    ArkUI_AttributeItem disableSwipe_item = {disableSwipe_value,
                                             sizeof(disableSwipe_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE, &disableSwipe_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISABLE_SWIPE)->value[PARAM_0].i32, disableSwipe);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest