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
#include <arkui/native_dialog.h>
#include <arkui/native_interface.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_dialog.h>
#include <arkui/native_type.h>
#include "ani/ani.h"

namespace ArkUICapiTest {

static ani_double TestCustomDialogWidth(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setWidth(customDialog, 200, ARKUI_LENGTH_METRIC_UNIT_VP);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogHeight(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setHeight(customDialog, 400, ARKUI_LENGTH_METRIC_UNIT_VP);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogBorderWidth(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setBorderWidth(customDialog, 5, 10, 15, 20, ARKUI_LENGTH_METRIC_UNIT_VP);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogBorderColor(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setBorderColor(customDialog, COLOR_GREEN, COLOR_BLUE, COLOR_PINK, COLOR_YELLOW);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogBorderStyle(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setBorderStyle(customDialog, -99, -99, 2, 2);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogShadow(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setShadow(customDialog, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_LG);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogCustomShadow(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    ArkUI_NumberValue custom_shadow_value[] = {{.f32 = 30}, {.i32 = {}}, {.f32 = {}}, {.f32 = {}},
                                               {.i32 = {}}, {.u32 = COLOR_RED}, {.u32 = 100}};
    ArkUI_AttributeItem custom_shadow_item = {custom_shadow_value,
                                              sizeof(custom_shadow_value) / sizeof(ArkUI_NumberValue)};
    int ret = dialogAPI3->setCustomShadow(customDialog, &custom_shadow_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogBackgroundBlurStyle(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setBackgroundBlurStyle(customDialog, ARKUI_BLUR_STYLE_COMPONENT_ULTRA_THICK);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogKeyboardAvoidMode(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setKeyboardAvoidMode(customDialog, ARKUI_KEYBOARD_AVOID_MODE_DEFAULT);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogEnableHoverMode(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->enableHoverMode(customDialog, true);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogHoverModeArea(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_3 *dialogAPI3 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_3, dialogAPI3);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI3->setHoverModeArea(customDialog, ARKUI_HOVER_MODE_AREA_TYPE_TOP);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogLevelMode(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_2 *dialogAPI2 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_2, dialogAPI2);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI2->setLevelMode(customDialog, ARKUI_LEVEL_MODE_OVERLAY);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogLevelUniqueId(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_2 *dialogAPI2 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_2, dialogAPI2);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI2->setLevelUniqueId(customDialog, 0);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogImmersiveMode(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_NativeDialogAPI_2 *dialogAPI2 = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_2, dialogAPI2);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI2->setImmersiveMode(customDialog, ARKUI_IMMERSIVE_MODE_DEFAULT);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogBackgroundColor(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI->setBackgroundColor(customDialog, '#FF94A0F0');
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomDialogCornerRadius(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI->setCornerRadius(customDialog, -10, 10, 15, 32);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomModalMode(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI->setModalMode(customDialog,false);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static ani_double TestCustomAutoCancel(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI->setAutoCancel(customDialog,false);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}


static ani_double TestCustomMask(ani_env* env, ani_object info)
{
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    ArkUI_Rect mark_item = {.x = 10, .y = 10, .width = 200, .height = 150};
    auto customDialog = dialogAPI->create();
    int ret = dialogAPI->setMask(customDialog, COLOR_GREEN, &mark_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

} // namespace ArkUICapiTest
