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

static napi_value TestSwiperDisplayCount001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t displayCount = 3;
    ArkUI_NumberValue value[] = {{.i32 = displayCount}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT)->value[PARAM_0].i32, displayCount);
    NAPI_END;
}

static napi_value TestSwiperDisplayCount002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t displayCount = 10000;
    ArkUI_NumberValue value[] = {{.i32 = displayCount}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT)->value[PARAM_0].i32, displayCount);
    NAPI_END;
}

static napi_value TestSwiperDisplayCount003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t displayCount = -1;
    int32_t expectCode = 1;
    ArkUI_NumberValue value[] = {{.i32 = displayCount}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT)->value[PARAM_0].i32, expectCode);
    NAPI_END;
}

static napi_value TestSwiperDisplayCount004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t displayCount = 0;
    int32_t expectCode = 1;
    ArkUI_NumberValue value[] = {{.i32 = displayCount}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_DISPLAY_COUNT)->value[PARAM_0].i32, expectCode);
    NAPI_END;
}

} // namespace ArkUICapiTest
