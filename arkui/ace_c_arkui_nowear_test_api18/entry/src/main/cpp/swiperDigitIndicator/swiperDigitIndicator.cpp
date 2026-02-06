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

#include "swiperDigitIndicator.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>


namespace ArkUICapiTest {

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    int flag = 0;
    if(indicator) {
        flag = 1;
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_a", "indicator creat success");
    }
    else
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_a", "indicator creat failed");
    ASSERT_EQ(flag, 1);
    OH_ArkUI_SwiperDigitIndicator_Destroy(indicator);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetStartPosition(indicator, 1.1f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_b", "SetStartPosition 1.1f done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetStartPosition(indicator);
    ASSERT_EQ(ret, 1.1f);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_b1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    OH_ArkUI_SwiperDigitIndicator_SetStartPosition(indicator, 1.1f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_b1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetStartPosition(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetTopPosition(indicator, 2.2f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_c", "SetTopPosition 2.2f done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetTopPosition(indicator);
    ASSERT_EQ(ret, 2.2f);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_c1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    OH_ArkUI_SwiperDigitIndicator_SetTopPosition(indicator, 2.2f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_c1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetTopPosition(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetEndPosition(indicator, 3.3f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_d", "SetEndPosition 3.3f done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetEndPosition(indicator);
    ASSERT_EQ(ret, 3.3f);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_d1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_d1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator =  nullptr;
    OH_ArkUI_SwiperDigitIndicator_SetEndPosition(indicator, 3.3f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_d1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetEndPosition(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_e(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(indicator, 4.4f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_e", "SetBottomPosition 4.4f done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetBottomPosition(indicator);
    ASSERT_EQ(ret, 4.4f);
    NAPI_END;
}


napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_e1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_e1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;

    OH_ArkUI_SwiperDigitIndicator_SetBottomPosition(indicator, 4.4f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_e1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetBottomPosition(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_f(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetFontColor(indicator, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_f", "SetFontColor 1 done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontColor(indicator);
    ASSERT_EQ(ret, 1);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_f1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetFontColor(indicator, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_f1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontColor(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_g(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor(indicator, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_g", "SetSelectedFontColor 2 done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor(indicator);
    ASSERT_EQ(ret, 2);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_g1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_g1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontColor(indicator, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_g1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontColor(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_h(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetFontSize(indicator, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_h", "SetFontSize 3 done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontSize(indicator);
    ASSERT_EQ(ret, 3);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_h1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_h1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetFontSize(indicator, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_h1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontSize(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_i(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_i", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize(indicator, 5.5f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_i", "SetSelectedFontSize 5.5f done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize(indicator);
    ASSERT_EQ(ret, 5.5f);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_i1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_i1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontSize(indicator, 5.5f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_i1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontSize(indicator);
    ASSERT_EQ(ret, 0.0f);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_j(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_NORMAL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j", "SetFontWeight ARKUI_FONT_WEIGHT_NORMAL done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret, ARKUI_FONT_WEIGHT_NORMAL);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_j1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetFontWeight(indicator, ARKUI_FONT_WEIGHT_NORMAL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_j1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetFontWeight(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_k(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_MEDIUM);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_MEDIUM done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret, ARKUI_FONT_WEIGHT_MEDIUM);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_k1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetSelectedFontWeight(indicator, ARKUI_FONT_WEIGHT_MEDIUM);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_k1", "SetSelectedFontWeight ARKUI_FONT_WEIGHT_MEDIUM done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetSelectedFontWeight(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_l(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_l", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = OH_ArkUI_SwiperDigitIndicator_Create();
    
    OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom(indicator, 4);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_l", "SetIgnoreSizeOfBottom 4 done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetIgnoreSizeOfBottom(indicator);
    ASSERT_EQ(ret, 4);
    NAPI_END;
}

napi_value swiperDigitIndicatorTest::swiperDigitIndicatorTest_l1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_l1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperDigitIndicator *indicator = nullptr;
    
    OH_ArkUI_SwiperDigitIndicator_SetIgnoreSizeOfBottom(indicator, 4);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "swiperDigitIndicatorTest_l1", "get nullptr done");
    auto ret = OH_ArkUI_SwiperDigitIndicator_GetIgnoreSizeOfBottom(indicator);
    ASSERT_EQ(ret, 0);
    NAPI_END;
}
} // namespace ArkUICapiTest

