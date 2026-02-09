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
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>
#include <hilog/log.h>

#define PARAM_106109 106109
#define PARAM_180101 180101
#define PARAM_20000 20000
#define PARAM_1038 1038
#define PARAM_7038 7038
#define PARAM_8033 8033

namespace ArkUICapiTest {

static napi_value TextMenuItemId_001(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    ASSERT_EQ(newMenuItem == nullptr, false);
    auto result1_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_CUT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_001 result=%{public}d", result1_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_CUT, PARAM_0);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result1_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_002(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result2_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_COPY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_002 result=%{public}d", result2_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_COPY, PARAM_1);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result2_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_003(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result3_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_PASTE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_003 result=%{public}d", result3_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_PASTE, PARAM_2);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result3_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_004(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result4_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_SELECT_ALL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_004 result=%{public}d", result4_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_SELECT_ALL, PARAM_3);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result4_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_005(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result5_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_COLLABORATION_SERVICE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_005 result=%{public}d", result5_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_COLLABORATION_SERVICE, PARAM_4);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result5_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_006(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result6_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_CAMERA_INPUT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_006 result=%{public}d", result6_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_CAMERA_INPUT, PARAM_5);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result6_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_007(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result7_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_AI_WRITER);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_007 result=%{public}d", result7_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_AI_WRITER, PARAM_6);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result7_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_008(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result8_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_TRANSLATE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_008 result=%{public}d", result8_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_TRANSLATE, PARAM_7);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result8_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_009(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result9_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_SEARCH);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_009 result=%{public}d", result9_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_SEARCH, PARAM_8);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result9_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_010(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result10_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_SHARE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_010 result=%{public}d", result10_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_SHARE, PARAM_9);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result10_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_011(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result11_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_URL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_011 result=%{public}d", result11_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_URL, PARAM_10);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result11_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_012(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result12_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_EMAIL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_012 result=%{public}d", result12_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_EMAIL, PARAM_11);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result12_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_013(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result13_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_PHONE_NUMBER);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_013 result=%{public}d", result13_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_PHONE_NUMBER, PARAM_12);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result13_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_014(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result14_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_ADDRESS);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_014 result=%{public}d", result14_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_ADDRESS, PARAM_13);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result14_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_015(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result15_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_DATA_TIME);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_015 result=%{public}d", result15_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_DATA_TIME, PARAM_14);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result15_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_016(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result16_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_ASK_AI);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_001 result=%{public}d", result16_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_ASK_AI, PARAM_15);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result16_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_017(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result17_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_BEGIN);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_017 result=%{public}d", result17_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_BEGIN, PARAM_10000);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result17_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_018(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto result18_1 = OH_ArkUI_TextMenuItem_SetId(newMenuItem, ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_END);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_018 result=%{public}d", result18_1);
    ASSERT_EQ(ARKUI_TEXT_MENU_ITEM_ID_APP_RESERVED_END, PARAM_20000);
    OH_ArkUI_TextMenuItem_Dispose(newMenuItem);
    ASSERT_EQ(result18_1, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

static napi_value TextMenuItemId_019(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_019 result=%{public}d", ARKUI_MENU_POLICY_DEFAULT);
    ASSERT_EQ(ARKUI_MENU_POLICY_DEFAULT, PARAM_0);
    NAPI_END;
}

static napi_value TextMenuItemId_020(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_020 result=%{public}d", ARKUI_MENU_POLICY_HIDE);
    ASSERT_EQ(ARKUI_MENU_POLICY_HIDE, PARAM_1);
    NAPI_END;
}

static napi_value TextMenuItemId_021(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_021 result=%{public}d", ARKUI_MENU_POLICY_SHOW);
    ASSERT_EQ(ARKUI_MENU_POLICY_SHOW, PARAM_2);
    NAPI_END;
}

static napi_value TextMenuItemId_022(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_022 result=%{public}d", ARKUI_ERROR_CODE_NODE_EVENT_NO_RETURN);
    ASSERT_EQ(ARKUI_ERROR_CODE_NODE_EVENT_NO_RETURN, PARAM_106109);
    NAPI_END;
}

static napi_value TextMenuItemId_023(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_023 result=%{public}d", ARKUI_ERROR_CODE_INVALID_STYLED_STRING);
    ASSERT_EQ(ARKUI_ERROR_CODE_INVALID_STYLED_STRING, PARAM_180101);
    NAPI_END;
}

static napi_value TextMenuItemId_024(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_024 result=%{public}d", NODE_TEXT_ENABLE_SELECTED_DATA_DETECTOR);
    ASSERT_EQ(NODE_TEXT_ENABLE_SELECTED_DATA_DETECTOR, PARAM_1038);
    NAPI_END;
}

static napi_value TextMenuItemId_025(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_025 result=%{public}d", NODE_TEXT_INPUT_ENABLE_SELECTED_DATA_DETECTOR);
    ASSERT_EQ(NODE_TEXT_INPUT_ENABLE_SELECTED_DATA_DETECTOR, PARAM_7038);
    NAPI_END;
}

static napi_value TextMenuItemId_026(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_026 result=%{public}d", ARKUI_ERROR_CODE_INVALID_STYLED_STRING);
    ASSERT_EQ(ARKUI_ERROR_CODE_INVALID_STYLED_STRING, PARAM_180101);
    NAPI_END;
}

static napi_value TextMenuItemId_027(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_027 result=%{public}d", ARKUI_TEXT_SPAN_TYPE_TEXT);
    ASSERT_EQ(ARKUI_TEXT_SPAN_TYPE_TEXT, PARAM_0);
    NAPI_END;
}

static napi_value TextMenuItemId_028(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_028 result=%{public}d", ARKUI_TEXT_SPAN_TYPE_IMAGE);
    ASSERT_EQ(ARKUI_TEXT_SPAN_TYPE_IMAGE, PARAM_1);
    NAPI_END;
}

static napi_value TextMenuItemId_029(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_029 result=%{public}d", ARKUI_TEXT_SPAN_TYPE_MIXED);
    ASSERT_EQ(ARKUI_TEXT_SPAN_TYPE_MIXED, PARAM_2);
    NAPI_END;
}

static napi_value TextMenuItemId_030(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_030 result=%{public}d", ARKUI_TEXT_SPAN_TYPE_DEFAULT);
    ASSERT_EQ(ARKUI_TEXT_SPAN_TYPE_DEFAULT, PARAM_3);
    NAPI_END;
}

static napi_value TextMenuItemId_031(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_031 result=%{public}d", ARKUI_TEXT_RESPONSE_TYPE_RIGHT_CLICK);
    ASSERT_EQ(ARKUI_TEXT_RESPONSE_TYPE_RIGHT_CLICK, PARAM_0);
    NAPI_END;
}

static napi_value TextMenuItemId_032(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_032 result=%{public}d", ARKUI_TEXT_RESPONSE_TYPE_LONG_PRESS);
    ASSERT_EQ(ARKUI_TEXT_RESPONSE_TYPE_LONG_PRESS, PARAM_1);
    NAPI_END;
}

static napi_value TextMenuItemId_033(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_033 result=%{public}d", ARKUI_TEXT_RESPONSE_TYPE_SELECT);
    ASSERT_EQ(ARKUI_TEXT_RESPONSE_TYPE_SELECT, PARAM_2);
    NAPI_END;
}

static napi_value TextMenuItemId_034(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_034 result=%{public}d", ARKUI_TEXT_RESPONSE_TYPE_DEFAULT);
    ASSERT_EQ(ARKUI_TEXT_RESPONSE_TYPE_DEFAULT, PARAM_3);
    NAPI_END;
}

static napi_value TextMenuItemId_035(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    std::string contents = "CAPI创建的菜单";
    auto ret = OH_ArkUI_TextMenuItem_SetContent(newMenuItem, contents.c_str());
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_035 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_036(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetContent(newMenuItem, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_036 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_037(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    char *buffer = new char[20];
    int writeLength = -1;
    std::string contents = "CAPI创建的菜单";
    auto ret = OH_ArkUI_TextMenuItem_SetContent(newMenuItem, contents.c_str());
    ret = OH_ArkUI_TextMenuItem_GetContent(newMenuItem, buffer, 20, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_037 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_038(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    int writeLength = 20;
    auto ret = OH_ArkUI_TextMenuItem_GetContent(newMenuItem, nullptr, writeLength, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_038 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_039(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    char *buffer = new char[2];
    int writeLength = -1;
    std::string contents = "CAPI创建的菜单";
    auto ret = OH_ArkUI_TextMenuItem_SetContent(newMenuItem, contents.c_str());
    ret = OH_ArkUI_TextMenuItem_GetContent(newMenuItem, buffer, 2, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_037 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_040(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetIcon(newMenuItem, "common/icon.png");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "TextMenuItemId_039 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_041(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetIcon(newMenuItem, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_041 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_042(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetIcon(newMenuItem, "common/icon.png");
    int32_t bufferSize = 1024, writeLength = -1;
    char *iconBuffer = new char[bufferSize];
    ret = OH_ArkUI_TextMenuItem_GetIcon(newMenuItem, iconBuffer, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_042 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_043(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetIcon(newMenuItem, "common/icon.png");
    int32_t bufferSize = 1, writeLength = -1;
    char *iconBuffer = new char[bufferSize];
    ret = OH_ArkUI_TextMenuItem_GetIcon(newMenuItem, iconBuffer, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_043 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_044(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetIcon(newMenuItem, "common/icon.png");
    int32_t bufferSize = 1, writeLength = -1;
    char *iconBuffer = new char[bufferSize];
    ret = OH_ArkUI_TextMenuItem_GetIcon(nullptr, iconBuffer, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_044 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_045(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(nullptr, "ctrl+P");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_045 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_046(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(newMenuItem, "ctrl+P");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_046 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}


static napi_value TextMenuItemId_047(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(newMenuItem, "ctrl+P");
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_047 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_048(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(newMenuItem, "ctrl+P");
    int bufferSize = 1024, writeLength = -1;
    char *labelInfo = new char[bufferSize];
    ret =  OH_ArkUI_TextMenuItem_GetLabelInfo(newMenuItem, labelInfo, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_048 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_049(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(newMenuItem, "ctrl+P");
    int bufferSize = 1024, writeLength = -1;
    char *labelInfo = nullptr;
    ret =  OH_ArkUI_TextMenuItem_GetLabelInfo(newMenuItem, labelInfo, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_049 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_050(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetLabelInfo(newMenuItem, "ctrl+P");
    int bufferSize = 1, writeLength = -1;
    char *labelInfo =  new char[bufferSize];
    ret =  OH_ArkUI_TextMenuItem_GetLabelInfo(newMenuItem, labelInfo, bufferSize, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_050 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_BUFFER_SIZE_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_051(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetId(newMenuItem, 111);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_051 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_052(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_TextMenuItem_SetId(nullptr, 111);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_052 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_053(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *newMenuItem = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItem_SetId(newMenuItem, 111);
    int id = -1;
    ret = OH_ArkUI_TextMenuItem_GetId(newMenuItem, &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_053 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_054(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    int id = -1;
    auto ret = OH_ArkUI_TextMenuItem_GetId(nullptr, &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_054 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_055(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    int id = -1;
    auto ret = OH_ArkUI_TextMenuItemArray_GetSize(nullptr, &id);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_055 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_056(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    int size = -1;
    auto ret = OH_ArkUI_TextMenuItemArray_GetSize((ArkUI_TextMenuItemArray*)arr, &size);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_056 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_057(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem *item = nullptr;
    auto ret = OH_ArkUI_TextMenuItemArray_GetItem(nullptr, 2, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_057 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_058(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_TextMenuItemArray_Erase(nullptr, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_058 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_059(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_TextMenuItemArray_Clear(nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_059 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_060(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    int size = -1;
    OH_ArkUI_TextMenuItemArray_GetSize((ArkUI_TextMenuItemArray*)arr, &size);
    ArkUI_TextMenuItem *item = nullptr;
    auto ret2 = OH_ArkUI_TextMenuItemArray_Insert((ArkUI_TextMenuItemArray*)arr, item, size);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_060 result=%{public}d", ret2);
    ASSERT_EQ(ARKUI_ERROR_CODE_PARAM_INVALID, ret2);
    NAPI_END;
}

static napi_value TextMenuItemId_061(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    auto ret = OH_ArkUI_TextMenuItemArray_Erase((ArkUI_TextMenuItemArray*)arr, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_061 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_062(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    ArkUI_TextMenuItem *item = OH_ArkUI_TextMenuItem_Create();
    auto ret = OH_ArkUI_TextMenuItemArray_GetItem((ArkUI_TextMenuItemArray*)arr, 2, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_062 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}

static napi_value TextMenuItemId_063(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    ArkUI_TextMenuItem *item = OH_ArkUI_TextMenuItem_Create();
    auto ret2 = OH_ArkUI_TextMenuItemArray_Insert((ArkUI_TextMenuItemArray*)arr, item, 1);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_063 result=%{public}d", ret2);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret2);
    NAPI_END;
}

static napi_value TextMenuItemId_064(napi_env env, napi_callback_info info)
{
    NAPI_START(Text, ARKUI_NODE_TEXT);
    ArkUI_TextMenuItem* arr[5] = {0};
    for (int i = 0; i < 5; i++) {
        arr[i] = OH_ArkUI_TextMenuItem_Create();
    }
    auto ret = OH_ArkUI_TextMenuItemArray_Clear((ArkUI_TextMenuItemArray*)arr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "TextMenuItemId_064 result=%{public}d", ret);
    ASSERT_EQ(ARKUI_ERROR_CODE_NO_ERROR, ret);
    NAPI_END;
}
}