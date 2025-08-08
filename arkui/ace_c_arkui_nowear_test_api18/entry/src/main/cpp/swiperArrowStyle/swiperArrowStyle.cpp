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

#include "swiperArrowStyle.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include <malloc.h>
#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {


napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    int check = 0;
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_a", "SwiperArrowStyle Create %{public}p", arrowStyle);
        check = 1;
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_a", "SwiperArrowStyle Create nullptr");
    }

    ASSERT_EQ(check, 1);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_b", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_b", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_Destroy(arrowStyle);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_c(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", "SetShowBackground 1 done");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle);
    ASSERT_EQ(check, 1);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_c1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c1", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c1", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 2);//2是非法值，预期是没有设置成功。
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", "SetShowBackground 2 done");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle);//预期获取的是0而不是2
    ASSERT_EQ(check, 0);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_c2(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetShowBackground(arrowStyle, 1);//预期传入非法参数，set不生效
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_c", " get nullptr done");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowBackground(arrowStyle);//预期传入非法参数，获取的是0
    ASSERT_EQ(check, 0);
    NAPI_END;
}
napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_d(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle(arrowStyle, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d", "SetShowSidebarMiddle 1 done");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle);
    ASSERT_EQ(check, 1);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_d1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d1", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d1", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle(arrowStyle, 3);//3是非法值，预期是设置失败，get结果仍为初始化时的0
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d1", "SetShowSidebarMiddle 3 done, expected value is 0");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle);
    ASSERT_EQ(check, 0);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_d2(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d2", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle =  nullptr;
    OH_ArkUI_SwiperArrowStyle_SetShowSidebarMiddle(arrowStyle, 1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_d2", "get nullptr done, expected value is 0");
    int check = OH_ArkUI_SwiperArrowStyle_GetShowSidebarMiddle(arrowStyle);
    ASSERT_EQ(check, 0);
    NAPI_END;
}
napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_e(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetBackgroundSize(arrowStyle, 19.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e", "SetBackgroundSize 19.0f done");
    float check = OH_ArkUI_SwiperArrowStyle_GetBackgroundSize(arrowStyle);
    ASSERT_EQ(check, 19.0f);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_e1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetBackgroundSize(arrowStyle, 19.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_e1", " set/get   nullptr");
    int check = OH_ArkUI_SwiperArrowStyle_GetBackgroundSize(arrowStyle);
    ASSERT_EQ(check, 24.0f);
    NAPI_END;
}
napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_f(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetBackgroundColor(arrowStyle, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f", "set/get nullptr");
    unsigned int check = OH_ArkUI_SwiperArrowStyle_GetBackgroundColor(arrowStyle);
    ASSERT_EQ(check, 0x00000000);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_f1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f1", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f1", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetBackgroundColor(arrowStyle, 3);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_f1", "SetBackgroundColor 3 done");
    unsigned int check = OH_ArkUI_SwiperArrowStyle_GetBackgroundColor(arrowStyle);
    ASSERT_EQ(check, 3);
    NAPI_END;
}
napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_g(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetArrowSize(arrowStyle, 4.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g", "SetArrowSize 4.0f done");
    float check = OH_ArkUI_SwiperArrowStyle_GetArrowSize(arrowStyle);
    ASSERT_EQ(check, 4.0f);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_g1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetArrowSize(arrowStyle, 4.0f);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_g1", "set/get nullptr");
    float check = OH_ArkUI_SwiperArrowStyle_GetArrowSize(arrowStyle);
    ASSERT_EQ(check, 18.0f);
    NAPI_END;
}
napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_h(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = OH_ArkUI_SwiperArrowStyle_Create();
    if(arrowStyle) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h", "SwiperArrowStyle Create %{public}p", arrowStyle);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h", "SwiperArrowStyle Create nullptr");
    }
    OH_ArkUI_SwiperArrowStyle_SetArrowColor(arrowStyle, 5);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h", "SetArrowColor 5 done");
    int check = OH_ArkUI_SwiperArrowStyle_GetArrowColor(arrowStyle);
    ASSERT_EQ(check, 5);
    NAPI_END;
}

napi_value SwiperArrowStyleTest::SwiperArrowStyleTest_h1(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_SwiperArrowStyle *arrowStyle = nullptr;
    OH_ArkUI_SwiperArrowStyle_SetArrowColor(arrowStyle, 5);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SwiperArrowStyleTest_h1", "set/get nullptr");
    unsigned int check = OH_ArkUI_SwiperArrowStyle_GetArrowColor(arrowStyle);
    ASSERT_EQ(check, 0x00182431);
    NAPI_END;
}
} // namespace ArkUICapiTest
