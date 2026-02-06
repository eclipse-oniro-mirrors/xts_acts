/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <arkui/native_animate.h>
#include <arkui/native_gesture.h>
#include <arkui/native_node_napi.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include "arkui/native_interface.h"

namespace ArkUICapiTest {

static napi_value SwiperParamTest(napi_env env, napi_callback_info info)
{
    auto ret1 = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DIGIT);
    ASSERT_OBJ(ret1, nullptr);

    auto ret2 = OH_ArkUI_SwiperDigitIndicator_Create();
    ASSERT_NOTNULL(ret2);

    auto ret3 = OH_ArkUI_SwiperArrowStyle_Create();
    ASSERT_NOTNULL(ret3);

    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_NORMAL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_NORMAL done");
    auto ret4 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret4, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

static napi_value SwiperFontWeightEnumeratedTest(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W100);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W100 done");
    auto ret1 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret1, ARKUI_FONT_WEIGHT_W100);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W200);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W200 done");
    auto ret2 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret2, ARKUI_FONT_WEIGHT_W200);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W300);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W300 done");
    auto ret3 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret3, ARKUI_FONT_WEIGHT_W300);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W400);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W400 done");
    auto ret4 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret4, ARKUI_FONT_WEIGHT_W400);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W500);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W500 done");
    auto ret5 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret5, ARKUI_FONT_WEIGHT_W500);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W600);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W600 done");
    auto ret6 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret6, ARKUI_FONT_WEIGHT_W600);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W700);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W700 done");
    auto ret7 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret7, ARKUI_FONT_WEIGHT_W700);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W800);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W800 done");
    auto ret8 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret8, ARKUI_FONT_WEIGHT_W800);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_W900);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_W900 done");
    auto ret9 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret9, ARKUI_FONT_WEIGHT_W900);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_BOLD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_BOLD done");
    auto ret10 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret10, ARKUI_FONT_WEIGHT_BOLD);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_BOLDER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_BOLDER done");
    auto ret11 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret11, ARKUI_FONT_WEIGHT_BOLDER);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_LIGHTER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_LIGHTER done");
    auto ret12 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret12, ARKUI_FONT_WEIGHT_LIGHTER);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_MEDIUM);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_MEDIUM done");
    auto ret13 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret13, ARKUI_FONT_WEIGHT_MEDIUM);

    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_REGULAR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_REGULAR done");
    auto ret14 = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret14, ARKUI_FONT_WEIGHT_REGULAR);

    NAPI_END;
}

static napi_value SwiperSelectedFontEnumeratedTest(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W100);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W100 done");
    auto ret1 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret1, ARKUI_FONT_WEIGHT_W100);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W200);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W200 done");
    auto ret2 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret2, ARKUI_FONT_WEIGHT_W200);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W300);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W300 done");
    auto ret3 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret3, ARKUI_FONT_WEIGHT_W300);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W400);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W400 done");
    auto ret4 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret4, ARKUI_FONT_WEIGHT_W400);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W500);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W500 done");
    auto ret5 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret5, ARKUI_FONT_WEIGHT_W500);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W600);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W600 done");
    auto ret6 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret6, ARKUI_FONT_WEIGHT_W600);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W700);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W700 done");
    auto ret7 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret7, ARKUI_FONT_WEIGHT_W700);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W800);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W800 done");
    auto ret8 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret8, ARKUI_FONT_WEIGHT_W800);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_W900);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_W900 done");
    auto ret9 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret9, ARKUI_FONT_WEIGHT_W900);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_BOLD);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_BOLD done");
    auto ret10 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret10, ARKUI_FONT_WEIGHT_BOLD);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_NORMAL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_NORMAL done");
    auto ret11 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret11, ARKUI_FONT_WEIGHT_NORMAL);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_BOLDER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_BOLDER done");
    auto ret12 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret12, ARKUI_FONT_WEIGHT_BOLDER);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_LIGHTER);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_LIGHTER done");
    auto ret13 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret13, ARKUI_FONT_WEIGHT_LIGHTER);

    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_REGULAR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_REGULAR done");
    auto ret14 = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret14, ARKUI_FONT_WEIGHT_REGULAR);

    NAPI_END;
}

static napi_value SetMaxDisplayCountParamTest(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperIndicator *SetIndicator = OH_ArkUI_SwiperIndicator_Create(ARKUI_SWIPER_INDICATOR_TYPE_DOT);
    int32_t ret1 = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(SetIndicator, 6);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMaxDisplayCountParamTest SetMaxDisplayCount 6 done", "%{public}d", ret1);
    ASSERT_EQ(ret1, ARKUI_ERROR_CODE_NO_ERROR);

    int32_t ret2 = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(SetIndicator, 9);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMaxDisplayCountParamTest", "SetMaxDisplayCount 9 done");
    ASSERT_EQ(ret2, ARKUI_ERROR_CODE_NO_ERROR);

    int32_t ret3 = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(SetIndicator, 5);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMaxDisplayCountParamTest", "SetMaxDisplayCount 5 done");
    ASSERT_EQ(ret3, ARKUI_ERROR_CODE_PARAM_INVALID);

    int32_t ret4 = OH_ArkUI_SwiperIndicator_SetMaxDisplayCount(SetIndicator, 10);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetMaxDisplayCountParamTest", "SetMaxDisplayCount 10 done");
    ASSERT_EQ(ret4, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

static napi_value SetShowBackgroundTest(napi_env env, napi_callback_info info)
{
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetShowBackgroundTest", " SetShowBackgroundTest done");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SetShowBackgroundTest SetShowBackgroundTest", "%{public}d", check);
    ASSERT_EQ(check, 0);
    NAPI_END;
}

} // namespace ArkUICapiTest
