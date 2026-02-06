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

#include "arkuiXComponent.h"
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

namespace ArkUICapiTest {

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

struct ArkUI_Node_ {
    int32_t type;
    void* uiNodeHandle = nullptr;
    bool cNode = false;
    bool buildNode = false;
    void* extraData = nullptr;
    void* extraCustomData = nullptr;
    ArkUI_LengthMetricUnit lengthMetricUnit = ARKUI_LENGTH_METRIC_UNIT_DEFAULT;
    void* eventListeners = nullptr;
    void* barrierOption = nullptr;
    void* guidelineOption = nullptr;
    void* alignRuleOption = nullptr;
    void* userData = nullptr;
    void* swiperIndicator = nullptr;
    int32_t linearGradientDirection = -1;
    void* customEventListeners = nullptr;
    void* altDrawableDescriptor = nullptr;
    void* drawableDescriptor = nullptr;
    void* imageFrameInfos = nullptr;
    ArkUI_AttributeItem_* areaChangeRadio = nullptr;
    void* transitionOption = nullptr;
    void* progressLinearStyle = nullptr;
    void* visibleAreaEventOptions = nullptr;
    bool isBindNative = false;
};

void StartImageAnalyzer_func(ArkUI_NodeHandle node, ArkUI_XComponent_ImageAnalyzerState statusCode, void* userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "StartImageAnalyzer_func", "StartImageAnalyzer_func");
    return;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_a(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_a", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_Node_ *node = new ArkUI_Node_;

    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer((ArkUI_Node*)node, NULL, NULL);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_a", "StartImageAnalyzer ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_b(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_b", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_Node_ *node = new ArkUI_Node_;
    node->isBindNative = false;
    auto ret = OH_ArkUI_XComponent_StopImageAnalyzer((ArkUI_Node*)node);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_b", "StartImageAnalyzer ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_c(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_c", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    char data[12] = "user data";
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StartImageAnalyzer(nodeHandle, data, StartImageAnalyzer_func);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_c", "StartImageAnalyzer ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_d(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_d", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_SetAutoInitialize(nodeHandle, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_d", "SetAutoInitialize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_e(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_e", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nullptr;
    auto ret = OH_ArkUI_XComponent_SetAutoInitialize(nodeHandle, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_e", "SetAutoInitialize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_f(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_f", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_StopImageAnalyzer(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_f", "StartImageAnalyzer ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_g(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_g", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto node = OH_ArkUI_SurfaceHolder_Create(nodeHandle);
    auto ret = OH_ArkUI_XComponent_GetNativeWindow(node);
    int check = ((ret == nullptr) ? 1 : 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_g", "GetNativeWindow ret %{public}d", check);
    
    ASSERT_EQ(check, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_g1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_g1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto node = nullptr;
    auto ret = OH_ArkUI_XComponent_GetNativeWindow(node);
    int check = ((ret == nullptr) ? 1 : 0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_g1", "GetNativeWindow ret %{public}d", check);
    
    ASSERT_EQ(check, 1);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_h(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_h", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    auto ret = OH_ArkUI_XComponent_Initialize(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_h", "Initialize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_h1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_h1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);
    auto ret = OH_ArkUI_XComponent_Initialize(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_h1", "Initialize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_i(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_i", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    OH_ArkUI_XComponent_Initialize(nodeHandle);
    auto ret = OH_ArkUI_XComponent_Finalize(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_i", "Finalize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

ani_int ArkuiXComponentTest::ArkuiXComponentTest_i1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_i1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);
    //auto ret = OH_ArkUI_XComponent_Initialize(nodeHandle);
    auto ret = OH_ArkUI_XComponent_Finalize(nodeHandle);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_i1", "Finalize ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_j(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_j", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_XCOMPONENT);
    bool flag = true;
    auto ret = OH_ArkUI_XComponent_IsInitialized(nodeHandle, &flag);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_j", "IsInitialized ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}
ani_int ArkuiXComponentTest::ArkuiXComponentTest_j1(ani_env* env, ani_object obj)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_j1", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);
    bool flag = true;
    auto ret = OH_ArkUI_XComponent_IsInitialized(nodeHandle, &flag);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ArkuiXComponentTest_j1", "IsInitialized ret %{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest
