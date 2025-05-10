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

static napi_value TestSwiperDisplayArrow001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue displayArrow_value[] = {{.i32 = ARKUI_SWIPER_ARROW_HIDE}};
    ArkUI_AttributeItem displayArrow_value_item = {displayArrow_value,
                                                   sizeof(displayArrow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW, &displayArrow_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW)->value[PARAM_0].i32,
              ARKUI_SWIPER_ARROW_HIDE);
    NAPI_END;
}

static napi_value TestSwiperDisplayArrow002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue displayArrow_value[] = {{.i32 = ARKUI_SWIPER_ARROW_SHOW}};
    ArkUI_AttributeItem displayArrow_value_item = {displayArrow_value,
                                                   sizeof(displayArrow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW, &displayArrow_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW)->value[PARAM_0].i32,
              ARKUI_SWIPER_ARROW_SHOW);
    NAPI_END;
}

static napi_value TestSwiperDisplayArrow003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue displayArrow_value[] = {{.i32 = ARKUI_SWIPER_ARROW_SHOW_ON_HOVER}};
    ArkUI_AttributeItem displayArrow_value_item = {displayArrow_value,
                                                   sizeof(displayArrow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW, &displayArrow_value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW)->value[PARAM_0].i32,
              ARKUI_SWIPER_ARROW_SHOW_ON_HOVER);
    NAPI_END;
}

static napi_value TestSwiperDisplayArrow004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t displayArrow = -1;

    ArkUI_NumberValue displayArrow_value[] = {{.i32 = displayArrow}};
    ArkUI_AttributeItem displayArrow_value_item = {displayArrow_value,
                                                   sizeof(displayArrow_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW, &displayArrow_value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_DISPLAY_ARROW)->value[PARAM_0].i32, displayArrow);
    }
    NAPI_END;
}

} // namespace ArkUICapiTest
