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
#include <arkui/native_type.h>
#include "customdialog1_test.h"
#include "../manager/plugin_manager.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_node_ani.h"

static ArkUI_CustomDialogOptions *stateCDOption = nullptr;
static int32_t dialogIdState = 0;

namespace ArkUICapiTest {   

  CallBackData CustomDialogTest1::callBackData;

  static auto SetWidth(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float width) {
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    return nodeHandle;
  }

  static auto SetHeight(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float height) {
    ArkUI_NumberValue height_value[] = {{.f32 = height}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);
    return nodeHandle;
  }
  
  static auto SetBackgroundColor(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle nodeHandle, uint32_t color) {
    ArkUI_NumberValue color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color_item);
    return nodeHandle;
  }
  
  static void OnWillDismiss(ArkUI_DialogDismissEvent *event) {
    
    ArkUI_AttributeItem id_item = {};
    id_item.string = "willDismiss";
    CustomDialogTest1::callBackData.willDismiss = id_item.string;
    
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "gsz-----------OnWillDismiss");
  }
  static void OnWillAppear(void *userData) {
    ArkUI_AttributeItem id_item = {};
    id_item.string = "willAppear";
    CustomDialogTest1::callBackData.willAppear = id_item.string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "gsz-----------OnWillAppear");
  }
  static void OnDidAppear(void *userData) {
    ArkUI_AttributeItem id_item = {};
    id_item.string = "didAppear";
    CustomDialogTest1::callBackData.didAppear = id_item.string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnDidAppear");
  }
  static void OnWillDisappear(void *userData) {
    ArkUI_AttributeItem id_item = {};
    id_item.string = "willDisappear";
    CustomDialogTest1::callBackData.willDisappear = id_item.string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnWillDisappear");
  }
  static void OnDidDisappear(void *userData) {
    ArkUI_AttributeItem id_item = {};
    id_item.string = "didDisappear";
    CustomDialogTest1::callBackData.didDisappear = id_item.string;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnDidDisappear");
  }

  static auto CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle parentNode, ArkUI_NodeType type) {
    auto childNode = nodeAPI->createNode(type);
    nodeAPI->addChild(parentNode, childNode);
    return childNode;
  }
  

  void MyCustomCallback(int32_t dialogId) {
    dialogIdState = dialogId;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "MyCustomCallback : %{public}d", dialogId);
  }
 void MyCustomCallback1(int32_t dialogId) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "MyCustomCallback1 : %{public}d", dialogId);
  }
  static auto SetId(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id) {
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);
    return nodeHandle;
  }
  static auto SetButton(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id, const char *text) {
    nodeHandle = SetWidth(nodeAPI, nodeHandle, SIZE_100);
    nodeHandle = SetHeight(nodeAPI, nodeHandle, SIZE_40);
    ArkUI_AttributeItem label_item = {.string = text};
    nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &label_item);
    nodeHandle = SetBackgroundColor(nodeAPI, nodeHandle, COLOR_RED);
    nodeHandle = SetId(nodeAPI, nodeHandle, id);
    return nodeHandle;
  }

  static void OnEventReceiveClose(ArkUI_NodeEvent *event) {
    OH_ArkUI_CustomDialog_CloseDialog(dialogIdState);
    OH_ArkUI_CustomDialog_DisposeOptions(stateCDOption);
  }
  
  static void OnEventReceive3(ArkUI_NodeEvent *event) {
    
    OH_ArkUI_CustomDialog_SetCornerRadius(stateCDOption, 10, 10, 10, 10);
    OH_ArkUI_CustomDialog_SetBorderWidth(stateCDOption, 2, 4, 2, 4, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetBorderColor(stateCDOption, COLOR_BLUE, 0xFFFFFF00, COLOR_RED, 0xFF00FF00);
    OH_ArkUI_CustomDialog_SetBorderStyle(stateCDOption, 0, 1, 1, 2);
    OH_ArkUI_CustomDialog_SetWidth(stateCDOption, 350, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetHeight(stateCDOption, 150, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetShadow(stateCDOption, ARKUI_SHADOW_STYLE_OUTER_FLOATING_MD);
    OH_ArkUI_CustomDialog_SetAlignment(stateCDOption, ARKUI_ALIGNMENT_CENTER, -20, 20);
    OH_ArkUI_CustomDialog_SetModalMode(stateCDOption, true);
    OH_ArkUI_CustomDialog_SetSubwindowMode(stateCDOption, true);
    OH_ArkUI_CustomDialog_SetAutoCancel(stateCDOption, true);
    OH_ArkUI_CustomDialog_UpdateDialog(stateCDOption, MyCustomCallback1);
    
  } 

  static void OnEventReceiveNew(ArkUI_NodeEvent *event) {
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogContentTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogContentTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogContentTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    
    auto column9 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue a_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem a_item = {a_value, sizeof(a_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_CUSTOM_KEYBOARD, &a_item);

    ArkUI_AttributeItem b_item = {};
    b_item.string = "abc";
    nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_TEXT, &b_item);
    nodeAPI->addChild(column9,textInput);
    
    auto dialogController = OH_ArkUI_CustomDialog_CreateOptions(column9);
    
    OH_ArkUI_CustomDialog_SetCornerRadius(dialogController, -10, 10, 15, 32);
    OH_ArkUI_CustomDialog_SetBorderWidth(dialogController, 1, 2, 1, 2, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetBorderColor(dialogController, COLOR_RED, 0xFFFFFF00, COLOR_BLUE, 0xFF00FF00);
    OH_ArkUI_CustomDialog_SetBorderStyle(dialogController, 0, -99, 1, 2);
    OH_ArkUI_CustomDialog_SetWidth(dialogController, 300, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetHeight(dialogController, 200, ARKUI_LENGTH_METRIC_UNIT_VP);
    OH_ArkUI_CustomDialog_SetShadow(dialogController, ARKUI_SHADOW_STYLE_OUTER_DEFAULT_XS);
    OH_ArkUI_CustomDialog_SetAlignment(dialogController, ARKUI_ALIGNMENT_CENTER, 20, -20);
    OH_ArkUI_CustomDialog_SetAutoCancel(dialogController, false);
    OH_ArkUI_CustomDialog_SetModalMode(dialogController, false);
    OH_ArkUI_CustomDialog_SetSubwindowMode(dialogController, true);
    OH_ArkUI_CustomDialog_SetBackgroundColor(dialogController, COLOR_PINK);
    OH_ArkUI_CustomDialog_SetLevelMode(dialogController, ARKUI_LEVEL_MODE_OVERLAY);
    OH_ArkUI_CustomDialog_SetLevelUniqueId(dialogController, 0);
    OH_ArkUI_CustomDialog_SetImmersiveMode(dialogController, ARKUI_IMMERSIVE_MODE_DEFAULT);
    OH_ArkUI_CustomDialog_SetHoverModeEnabled(dialogController,true);
    
    OH_ArkUI_CustomDialog_RegisterOnWillDismissCallback(dialogController, column9, OnWillDismiss);
    OH_ArkUI_CustomDialog_RegisterOnWillAppearCallback(dialogController, column9, OnWillAppear);
    OH_ArkUI_CustomDialog_RegisterOnDidAppearCallback(dialogController, column9, OnDidAppear);
    OH_ArkUI_CustomDialog_RegisterOnWillDisappearCallback(dialogController, column9, OnWillDisappear);
    OH_ArkUI_CustomDialog_RegisterOnDidDisappearCallback(dialogController, column9, OnDidDisappear);
    
    stateCDOption = dialogController;
        
    auto button1 = CreateChildNode(nodeAPI, column9, ARKUI_NODE_BUTTON);
    button1 = SetButton(nodeAPI, button1, "button1", "Update");
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, 0, nullptr);
    nodeAPI->addNodeEventReceiver(button1, &OnEventReceive3);
    nodeAPI->addChild(column9, button1);
    
    auto buttonClose = CreateChildNode(nodeAPI, column9, ARKUI_NODE_BUTTON);
    button1 = SetButton(nodeAPI, buttonClose, "close", "close");
    nodeAPI->registerNodeEvent(buttonClose, NODE_ON_CLICK, 0, nullptr);
    nodeAPI->addNodeEventReceiver(buttonClose, &OnEventReceiveClose);
    nodeAPI->addChild(column9, buttonClose);
    
    if (eventId == 1) {
        auto dd = OH_ArkUI_CustomDialog_OpenDialog(dialogController,MyCustomCallback);
    }
    
  }
 
 void CustomDialogTest1::customDialogAttrsTest(ani_env* env, ani_object info, ani_object NodeContent)
 {
    OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    button = SetButton(nodeAPI, button, "buttonId","openDialog");
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 1, nullptr);
    nodeAPI->addNodeEventReceiver(button, &OnEventReceiveNew);

    nodeAPI->addChild(column, button);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
 }
}  // namespace ArkUICapiTest
