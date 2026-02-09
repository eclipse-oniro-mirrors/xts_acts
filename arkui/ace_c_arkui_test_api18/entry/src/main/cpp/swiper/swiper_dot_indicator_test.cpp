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
#include "../manager/plugin_manager.h"

namespace ArkUICapiTest {

static napi_value TestSwiperDigitIndicator001(napi_env env, napi_callback_info info)
{
    auto indicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT); 

    OH_ArkUI_SwiperIndicator_SetSpace(indicator, PARAM_5);
    OH_ArkUI_SwiperIndicator_SetIgnoreSizeOfBottom(indicator, PARAM_1);

    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetSpace(indicator), PARAM_5);
    ASSERT_EQ(OH_ArkUI_SwiperIndicator_GetIgnoreSizeOfBottom(indicator), PARAM_1);

    OH_ArkUI_SwiperIndicator_Dispose(indicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator002(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};
    OH_ArkUI_SwiperDigitIndicator_SetStartPosition(digitIndicator, PARAM_5);
    OH_ArkUI_SwiperDigitIndicator_SetTopPosition(digitIndicator, PARAM_5);
    OH_ArkUI_SwiperDigitIndicator_SetEndPosition(digitIndicator, PARAM_5);
    OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(digitIndicator, PARAM_5);

    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetStartPosition(digitIndicator), PARAM_5);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetTopPosition(digitIndicator), PARAM_5);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetEndPosition(digitIndicator), PARAM_5);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetBottomPosition(digitIndicator), PARAM_5);
    
    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator003(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};

    OH_ArkUI_SwiperDigitIndicator_SetFontColor(digitIndicator, COLOR_BLUE);
    OH_ArkUI_SwiperDigitIndicator_SetFontSize(digitIndicator, PARAM_10);
    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(digitIndicator, ArkUI_FontWeight::ARKUI_FONT_WEIGHT_LIGHTER);

    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetFontColor(digitIndicator), COLOR_BLUE);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetFontSize(digitIndicator), PARAM_10);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetFontWeight(digitIndicator), ArkUI_FontWeight::ARKUI_FONT_WEIGHT_LIGHTER);

    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator004(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor(digitIndicator, COLOR_RED);
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize(digitIndicator, PARAM_20);
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(digitIndicator, ArkUI_FontWeight::ARKUI_FONT_WEIGHT_NORMAL);
    
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor(digitIndicator), COLOR_RED);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize(digitIndicator), PARAM_20);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(digitIndicator), ArkUI_FontWeight::ARKUI_FONT_WEIGHT_NORMAL);

    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator005(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};

    OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom(digitIndicator, PARAM_1);

    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetIgnoreSizeOfBottom(digitIndicator), PARAM_1);
    
    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator006(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};
    OH_ArkUI_SwiperDigitIndicator_SetStartPosition(digitIndicator, -1.0);
    OH_ArkUI_SwiperDigitIndicator_SetTopPosition(digitIndicator, -1.0);
    OH_ArkUI_SwiperDigitIndicator_SetEndPosition(digitIndicator, -1.0);
    OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(digitIndicator, -1.0);
    
    auto fRetDigit = OH_ArkUI_SwiperDigitIndicator_GetStartPosition(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf StartPosition = %{public}f", fRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetStartPosition(digitIndicator), fRetDigit);
    
    fRetDigit = OH_ArkUI_SwiperDigitIndicator_GetTopPosition(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf topPosition = %{public}f", fRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetTopPosition(digitIndicator), fRetDigit);
    
    fRetDigit = OH_ArkUI_SwiperDigitIndicator_GetEndPosition(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf endPosition = %{public}f", fRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetEndPosition(digitIndicator), fRetDigit);
    
    fRetDigit = OH_ArkUI_SwiperDigitIndicator_GetBottomPosition(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf bottomPosition = %{public}f", fRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetBottomPosition(digitIndicator), fRetDigit);
    
    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator007(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};

    OH_ArkUI_SwiperDigitIndicator_SetFontColor(digitIndicator, -1);
    OH_ArkUI_SwiperDigitIndicator_SetFontSize(digitIndicator, -1.0);
    
    auto xRetDigit = OH_ArkUI_SwiperDigitIndicator_GetFontColor(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf FONT COLOR = %{public}x", xRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetFontColor(digitIndicator), xRetDigit);
    
    auto uRetDigit = OH_ArkUI_SwiperDigitIndicator_GetFontSize(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf FONT SIZE = %{public}u", uRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetFontSize(digitIndicator), uRetDigit);

    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}

static napi_value TestSwiperDigitIndicator008(napi_env env, napi_callback_info info)
{
    auto digitIndicator = OH_ArkUI_SwiperDigitIndicator_Create();
    ArkUI_NumberValue value_digit[] = {{.i32 = ARKUI_SWIPER_INDICATOR_TYPE_DIGIT}};
    ArkUI_AttributeItem item_digit = {.value=value_digit, .size=1, .object=digitIndicator};
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor(digitIndicator, -1);
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize(digitIndicator, -1.0);
    
    auto xRetDigit = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf SELECTED FONT COLOR  = %{public}x", xRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor(digitIndicator), xRetDigit);
    
    auto uRetDigit = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize(digitIndicator);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager", "[wjg] lpf SELECTED FONT SIZE = %{public}u", uRetDigit);
    ASSERT_EQ(OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize(digitIndicator), uRetDigit);

    OH_ArkUI_SwiperDigitIndicator_Destroy(digitIndicator);

    NAPI_END;
}
} // namespace ArkUICapiTest
