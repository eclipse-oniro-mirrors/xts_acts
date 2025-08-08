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
#include <arkui/native_dialog.h>
#include <arkui/native_type.h>
#include <cstdint>
#include <string>

namespace ArkUICapiTest {

static void Call(int dialogId) {
}

static napi_value TestCustomDialog001(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_3* dialogAPI3 = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));

    auto customDialog = dialogAPI3->nativeDialogAPI1.create();
    dialogAPI3->setBackgroundBlurStyle(customDialog, ARKUI_BLUR_STYLE_THIN);
    ArkUI_NumberValue custom_BlurStyleOptions_value[] = { {.i32 = ARKUI_COLOR_MODE_LIGHT},
        {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE}, {.f32 = 1}, {.u32 = 20}, {.u32 = 20},
        {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_ACTIVE}, {.u32 = 0xFFFF0000} };
    ArkUI_AttributeItem custom_BlurStyleOptions_item = { custom_BlurStyleOptions_value,
        sizeof(custom_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue) };
    dialogAPI3->setBackgroundBlurStyleOptions(customDialog, &custom_BlurStyleOptions_item);
    ArkUI_NumberValue custom_Effect_value[] = { {.f32 = 20}, {.f32 = 1}, {.f32 = 1}, {.u32 = 0x66FFFFFF},
        {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE}, {.u32 = 20}, {.u32 = 20},
        {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_ACTIVE}, {.u32 = 0xFFFF0000} };
    ArkUI_AttributeItem custom_Effect_item = { custom_Effect_value,
        sizeof(custom_Effect_value) / sizeof(ArkUI_NumberValue) };
    auto ret = dialogAPI3->setBackgroundEffect(customDialog, &custom_Effect_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
static napi_value TestCustomDialog002(napi_env env, napi_callback_info info)
{
    const ArkUI_NativeDialogAPI_3* dialogAPI3 = reinterpret_cast<ArkUI_NativeDialogAPI_3 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    auto customDialog = dialogAPI3->nativeDialogAPI1.create();
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto dialog = OH_ArkUI_CustomDialog_CreateOptions(column2);
    OH_ArkUI_CustomDialog_SetBackgroundBlurStyle(dialog, ARKUI_BLUR_STYLE_REGULAR);
    ArkUI_NumberValue dialog_BlurStyleOptions_value[] = { {.i32 = ARKUI_COLOR_MODE_LIGHT},
        {.i32 = ARKUI_ADAPTIVE_COLOR_AVERAGE}, {.f32 = 1}, {.u32 = 20}, {.u32 = 20},
        {.i32 = ARKUI_BLUR_STYLE_ACTIVE_POLICY_ALWAYS_ACTIVE}, {.u32 = 0x00FF0000} };
    ArkUI_AttributeItem dialog_BlurStyleOptions_item = { dialog_BlurStyleOptions_value,
        sizeof(dialog_BlurStyleOptions_value) / sizeof(ArkUI_NumberValue) };
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundBlurStyleOptions(dialog, &dialog_BlurStyleOptions_item);
    ArkUI_NumberValue dialog_Effect_value[] = { {.f32 = 0}, {.f32 = 0}, {.f32 = 0.0001},
        {.u32 = 0x66FFFFFF}, {.i32 = 0}, {.u32 = 300}, {.u32 = 300}, {.i32 = 1}, {.u32 = 0x00FF0000} };
    ArkUI_AttributeItem dialog_Effect_item = { dialog_Effect_value,
        sizeof(dialog_Effect_value) / sizeof(ArkUI_NumberValue) };
    OH_ArkUI_CustomDialog_SetBackgroundEffect(dialog, &dialog_Effect_item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
} // namespace ArkUICapiTest