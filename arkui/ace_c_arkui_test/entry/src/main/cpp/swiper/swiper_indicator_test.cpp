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
#define NUM_0 0
#define NUM_1 1
#define NUM__1 (-1)
#define NUM_5 5
#define NUM_10 10
#define NUM_20 20
#define COLOR 0xFFFFFF00
#define COLOR1 0xFF0000FF

namespace ArkUICapiTest {

static napi_value TestSwiperIndicator001(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = NUM_0;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    NAPI_END;
}

static napi_value TestSwiperIndicator002(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = NUM_1;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    NAPI_END;
}

static napi_value TestSwiperIndicator003(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    int32_t indicator = NUM__1;
    ArkUI_NumberValue value[] = {{.i32 = indicator}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    if (nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR) != nullptr) {
        ASSERT_NE(nodeAPI->getAttribute(swiper, NODE_SWIPER_SHOW_INDICATOR)->value[PARAM_0].i32, indicator);
    }
    NAPI_END;
}

static napi_value TestSwiperIndicator004(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetStartPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetEndPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, NUM_5);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetStartPosition(indicator), NUM_5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetTopPosition(indicator), NUM_5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetEndPosition(indicator), NUM_5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetBottomPosition(indicator), NUM_5);
    
    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator005(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);

    OH_ArkUI_SwiperIndicator_SetItemWidth(indicator, NUM_10);
    OH_ArkUI_SwiperIndicator_SetItemHeight(indicator, NUM_20);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetItemWidth(indicator), NUM_10);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetItemHeight(indicator), NUM_20);

    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator006(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    
    OH_ArkUI_SwiperIndicator_SetSelectedItemWidth(indicator, NUM_10);
    OH_ArkUI_SwiperIndicator_SetSelectedItemHeight(indicator, NUM_20);
    
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedItemWidth(indicator), NUM_10);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedItemHeight(indicator), NUM_20);

    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator007(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);

    OH_ArkUI_SwiperIndicator_SetMask(indicator, NUM_1);
    OH_ArkUI_SwiperIndicator_SetColor(indicator, COLOR);
    OH_ArkUI_SwiperIndicator_SetSelectedColor(indicator, COLOR1);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetMask(indicator), NUM_1);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetColor(indicator), COLOR);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSelectedColor(indicator), COLOR1);
    
    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator008(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    OH_ArkUI_SwiperIndicator_SetStartPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetTopPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetEndPosition(indicator, NUM_5);
    OH_ArkUI_SwiperIndicator_SetBottomPosition(indicator, NUM_5);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DOT}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    value_item.object = indicator;
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_INDICATOR, &value_item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_INDICATOR)->value[PARAM_0].i32,
        ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    ASSERT_OBJ(nodeAPI->getAttribute(swiper, NODE_SWIPER_INDICATOR)->object, indicator);

    NAPI_END;
}

static napi_value TestSwiperIndicator009(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_INDICATOR, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestSwiperIndicator010(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = {{.i32 = PARAM_NEGATIVE_1}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_INDICATOR, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestSwiperIndicator011(napi_env env, napi_callback_info info)
{
    NAPI_START(swiper, ARKUI_NODE_SWIPER);

    ArkUI_NumberValue value[] = { { .i32 = PARAM_NEGATIVE_1 } };
    ArkUI_AttributeItem value_item = { value, sizeof(value) / sizeof(ArkUI_NumberValue) };
    auto ret = nodeAPI->setAttribute(swiper, NODE_SWIPER_INDICATOR, &value_item);
    ASSERT_EQ(ret, INVALID_PARAM);

    auto ret1 = nodeAPI->resetAttribute(swiper, NODE_SWIPER_INDICATOR);
    ASSERT_EQ(ret1, SUCCESS);

    ASSERT_EQ(
        nodeAPI->getAttribute(swiper, NODE_SWIPER_INDICATOR)->value[PARAM_0].i32, ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    ASSERT_EQ(nodeAPI->getAttribute(swiper, NODE_SWIPER_INDICATOR)->value[PARAM_1].i32, PARAM_0);
    NAPI_END;
}
} // namespace ArkUICapiTest
