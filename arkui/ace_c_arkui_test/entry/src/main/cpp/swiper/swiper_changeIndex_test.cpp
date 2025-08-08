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

static napi_value TestSwiperChangeIndex001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SWIPE_TO_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestSwiperChangeIndex002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SWIPE_TO_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestSwiperChangeIndex003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_1 }, { .i32 = true } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SWIPE_TO_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestSwiperChangeIndex004(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = PARAM_1 }, { .i32 = false } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SWIPE_TO_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestSwiperChangeIndex005(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    ArkUI_NumberValue value[] = { { .i32 = PARAM_1 }, { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SWIPE_TO_INDEX, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest
