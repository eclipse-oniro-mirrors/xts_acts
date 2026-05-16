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

#include "customDialog.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>
#include "ani/ani.h"

#include <arkui/drag_and_drop.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <arkui/native_dialog.h>

namespace ArkUICapiTest {


ani_int CustomDialogTest::CustomDialogTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    int check = ((options == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_a", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);

    OH_ArkUI_CustomDialog_DisposeOptions(options);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_a", "Destroy ret void");
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_a1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_a1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nullptr);
    int check = ((options == nullptr) ? ARKUI_ERROR_CODE_PARAM_INVALID : ARKUI_ERROR_CODE_NO_ERROR);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_a1", "check %{public}d", check);
    ASSERT_EQ(check, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_b", "SetLevelMode  preset done");

    auto ret = OH_ArkUI_CustomDialog_SetLevelMode(options, (ArkUI_LevelMode)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_b1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_b1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    auto ret = OH_ArkUI_CustomDialog_SetLevelMode(nullptr, (ArkUI_LevelMode)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_c", "SetLevelUniqueId  preset done");

    auto ret = OH_ArkUI_CustomDialog_SetLevelUniqueId(options, 1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_c1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_c1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetLevelUniqueId(nullptr, 1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_d(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_d", "SetImmersiveMode  preset done");

    auto ret = OH_ArkUI_CustomDialog_SetImmersiveMode(options, (ArkUI_ImmersiveMode)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_d1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_d1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetImmersiveMode(nullptr, (ArkUI_ImmersiveMode)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void callback_(int32_t dialogId){
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_e", "CreateNativeNode");
    return;
}
ani_int CustomDialogTest::CustomDialogTest_e(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_e", "OpenDialog  preset done");

    auto ret = OH_ArkUI_CustomDialog_OpenDialog(options, callback_);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_e1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_e1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    auto ret = OH_ArkUI_CustomDialog_OpenDialog(nullptr, callback_);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void UpdateDialogCallback(int32_t dialogId){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_f(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_f", "OpenDialog  preset done");

    auto ret = OH_ArkUI_CustomDialog_UpdateDialog(options, UpdateDialogCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_f1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_f1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    auto ret = OH_ArkUI_CustomDialog_UpdateDialog(nullptr, UpdateDialogCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_g(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_g", "CloseDialog  preset done");

    auto ret = OH_ArkUI_CustomDialog_OpenDialog(options, callback_);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_g", "CloseDialog  preset done  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    ret = OH_ArkUI_CustomDialog_CloseDialog(0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_g", "CloseDialog  preset done  %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_g1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_g1", "CreateNativeNode");
    auto ret = OH_ArkUI_CustomDialog_OpenDialog(nullptr, callback_);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    ret = OH_ArkUI_CustomDialog_CloseDialog(-1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_h(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_h", "SetBackgroundColor  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundColor(options, 2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_h1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_h1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundColor(nullptr, 2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_i(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_i", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_i", "SetCornerRadius  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetCornerRadius(options, 2.0f, 2.1f, 2.2f, 2.3f);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_i1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_i1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetCornerRadius(nullptr, 2.0f, 2.1f, 2.2f, 2.3f);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_j(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_j", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_j", "SetBorderWidth  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetBorderWidth(options, 2.0f, 2.1f, 2.2f, 2.3f, (ArkUI_LengthMetricUnit)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_j1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_j1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetBorderWidth(nullptr, 2.0f, 2.1f, 2.2f, 2.3f, (ArkUI_LengthMetricUnit)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_k(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_k", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_k", "SetBorderColor  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetBorderColor(options, 1, 2, 3, 4);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_k1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_k1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetBorderColor(nullptr, 1, 2, 3, 4);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_l(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_l", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_l", "SetBorderStyle  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetBorderStyle(options, 1, 2, 3, 4);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_l1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_l1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetBorderStyle(nullptr, 1, 2, 3, 4);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_m(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_m", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_m", "SetWidth  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetWidth(options, 3.1f, (ArkUI_LengthMetricUnit)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_m1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_m1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetWidth(nullptr, 3.1f, (ArkUI_LengthMetricUnit)1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_n(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_n", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_n", "SetHeight  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetHeight(options, 3.2f, (ArkUI_LengthMetricUnit)2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_n1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_n1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetHeight(nullptr, 3.2f, (ArkUI_LengthMetricUnit)2);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_o(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_o", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_o", "SetHeight  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetShadow(options, (ArkUI_ShadowStyle)3);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_o1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_o", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetShadow(nullptr, (ArkUI_ShadowStyle)3);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

typedef struct {
    /** Numeric array. */
    const ArkUI_NumberValue* value;
    /** Size of the numeric array. */
    int32_t size;
    /** String type. */
    const char* string;
    /** Object type. */
    void* object;
} ArkUI_AttributeItem_;
ani_int CustomDialogTest::CustomDialogTest_p(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_p", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    ArkUI_AttributeItem_ *node = new ArkUI_AttributeItem_;
    ArkUI_NumberValue* val = new ArkUI_NumberValue;
    val->f32 = 0.0f;
    node->size = 1;
    node->value = (const ArkUI_NumberValue*)val;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_p", "SetCustomShadow  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetCustomShadow(options, (const ArkUI_AttributeItem*)node);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_p1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_p1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_AttributeItem_ *node = new ArkUI_AttributeItem_;
    ArkUI_NumberValue* val = new ArkUI_NumberValue;
    val->f32 = 0.0f;
    node->size = 1;
    node->value = (const ArkUI_NumberValue*)val;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_p1", "SetCustomShadow  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetCustomShadow(nullptr, (const ArkUI_AttributeItem*)node);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_q(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_q", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_q", "SetBackgroundBlurStyle  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundBlurStyle(options, (ArkUI_BlurStyle)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_q1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_q", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    
    auto ret = OH_ArkUI_CustomDialog_SetBackgroundBlurStyle(nullptr, (ArkUI_BlurStyle)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_r(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_r", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_r", "SetAlignment  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetAlignment(options, 1, 2.2f, 3.3f);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_r1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_r1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    
    auto ret = OH_ArkUI_CustomDialog_SetAlignment(nullptr, 1, 2.2f, 3.3f);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_s(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_s", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_s", "SetAlignment  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetModalMode(options, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_s1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_s1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);

    auto ret = OH_ArkUI_CustomDialog_SetModalMode(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_t(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_t", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_t", "SetAutoCancel  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetAutoCancel(options, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_t1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_t1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetAutoCancel(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_u(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_u", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_u", "SetSubwindowMode  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetSubwindowMode(options, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_u1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_u1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto ret = OH_ArkUI_CustomDialog_SetSubwindowMode(nullptr, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
typedef struct {
    /** X coordinate of the mask area. */
    float x;
    /** Y coordinate of the mask area. */
    float y;
    /** Width of the mask area. */
    float width;
    /** Height of the mask area. */
    float height;
} ArkUI_Rect_;
ani_int CustomDialogTest::CustomDialogTest_v(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_v", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    ArkUI_Rect_ *rect = new ArkUI_Rect_;
    rect->x = 3.1f;
    rect->y = 3.1f;
    rect->width = 3.1f;
    rect->height = 3.1f;

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_v", "SetMask  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetMask(options, 0, (ArkUI_Rect*)rect);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_v1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_v1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    ArkUI_Rect_ *rect = new ArkUI_Rect_;
    rect->x = 3.1f;
    rect->y = 3.1f;
    rect->width = 3.1f;
    rect->height = 3.1f;

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_v1", "SetMask  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetMask(options, 0, (ArkUI_Rect*)rect);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_w(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_w", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_w", "SetKeyboardAvoidMode  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetKeyboardAvoidMode(options, (ArkUI_KeyboardAvoidMode)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_w1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_w1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    auto ret = OH_ArkUI_CustomDialog_SetKeyboardAvoidMode(options, (ArkUI_KeyboardAvoidMode)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_x(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_x", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_x", "SetHoverModeEnabled  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetHoverModeEnabled(options, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int CustomDialogTest::CustomDialogTest_x1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_x1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    auto ret = OH_ArkUI_CustomDialog_SetHoverModeEnabled(options, true);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_y(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_y", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_y", "SetHoverModeArea  preset done");
    auto ret = OH_ArkUI_CustomDialog_SetHoverModeArea(options, (ArkUI_HoverModeAreaType)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_y1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_y1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;

    auto ret = OH_ArkUI_CustomDialog_SetHoverModeArea(options, (ArkUI_HoverModeAreaType)0);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void RegisterOnWillDismissCallback(ArkUI_DialogDismissEvent* event){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_z(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_z", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_z", "RegisterOnWillDismissCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillDismissCallback(options, (void*)data, RegisterOnWillDismissCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_z1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_z1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_z1", "RegisterOnWillDismissCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillDismissCallback(options, (void*)data, RegisterOnWillDismissCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void RegisterOnWillAppearCallback(void* userData){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_A(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_A", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_A", "RegisterOnWillAppearCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillAppearCallback(options, (void*)data, RegisterOnWillAppearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_A1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_A1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    char data[8] = "data";
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillAppearCallback(options, (void*)data, RegisterOnWillAppearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void RegisterOnDidAppearCallback(void* userData){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_B(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_B", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_B", "RegisterOnDidAppearCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnDidAppearCallback(options, (void*)data, RegisterOnDidAppearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_B1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_B1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    char data[8] = "data";
    auto ret = OH_ArkUI_CustomDialog_RegisterOnDidAppearCallback(options, (void*)data, RegisterOnDidAppearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void RegisterOnWillDisappearCallback(void* userData){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_C(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_C", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_C", "RegisterOnWillDisappearCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillDisappearCallback(options, (void*)data, RegisterOnWillDisappearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_C1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_C1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = nullptr;
    char data[8] = "data";
    auto ret = OH_ArkUI_CustomDialog_RegisterOnWillDisappearCallback(options, (void*)data, RegisterOnWillDisappearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
void RegisterOnDidDisappearCallback(void* userData){
    return;
}
ani_int CustomDialogTest::CustomDialogTest_D(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_D", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto options = OH_ArkUI_CustomDialog_CreateOptions(nodeHandle);
    char data[8] = "data";
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_D", "RegisterOnDidDisappearCallback  preset done");
    auto ret = OH_ArkUI_CustomDialog_RegisterOnDidDisappearCallback(options, (void*)data, RegisterOnDidDisappearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int CustomDialogTest::CustomDialogTest_D1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest_D1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto options = nullptr;
    char data[8] = "data";
    auto ret = OH_ArkUI_CustomDialog_RegisterOnDidDisappearCallback(options, (void*)data, RegisterOnDidDisappearCallback);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest

