
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "GetDragSourceTest.h"
#include "../manager/plugin_manager.h"
#include <arkui/drag_and_drop.h>
#include <string>
#include "ani/ani.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include "hilog/log.h"
#include <string>

namespace ArkUICapiTest {
static void OnEventReceive(ArkUI_NodeEvent *event) {
  auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
  ArkUI_DragEvent *dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
  switch (eventType) {
  case NODE_ON_DRAG_START: {
    char bundleNameChar[200];
    bool isRemoteBool;
    ArkUI_ErrorCode errorCode1 =
        OH_ArkUI_DragEvent_GetDragSource(dragEvent, bundleNameChar, 200);
    ArkUI_ErrorCode errorCode2 =
        OH_ArkUI_DragEvent_IsRemote(dragEvent, &isRemoteBool);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                 "bundleName:%{public}s;", bundleNameChar);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                 "isRemoteBool:%{public}d;", isRemoteBool);
    if (isRemoteBool == false && bundleNameChar != nullptr) {
      ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
      OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1,
                                  nodeAPI);
      auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
      ArkUI_NumberValue color_value[] = {{.u32 = 0xFF00FF00}};
      ArkUI_AttributeItem color_item = {
          color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
      nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
    }
    break;
  }
  default:
    break;
  }
}

void GetDragSourceTest::CreateNativeNode(ani_env *env, ani_object info,ani_object NodeContent) {
  OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
  // 获取节点的前置框架代码，直接写就行
  ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
  OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1,nodeAPI);

  // 将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
  ArkUI_NodeContentHandle contentHandle;
  OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent,&contentHandle);
    
  auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
  auto image = nodeAPI->createNode(ARKUI_NODE_BUTTON);
  auto dragArea = nodeAPI->createNode(ARKUI_NODE_TEXT);
  ArkUI_NumberValue imageWidthValue[] = {150};
  ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
  ArkUI_NumberValue imageHeightValue[] = {150};
  ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
  nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
  nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
  nodeAPI->setAttribute(dragArea, NODE_WIDTH, &imageWidthItem);
  nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &imageHeightItem);
  nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 0, nullptr);
  OH_ArkUI_SetNodeDraggable(image, true);
  ArkUI_AttributeItem id_item = {};
  id_item.string = "image";
  nodeAPI->setAttribute(image, NODE_ID, &id_item);
  id_item.string = "dragArea";
  nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
  nodeAPI->addChild(Column, image);
  nodeAPI->addChild(Column, dragArea);
  nodeAPI->registerNodeEventReceiver(&OnEventReceive);

  // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
  OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
  OH_ArkUI_NodeContent_AddNode(contentHandle, Column);
  OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
  return;
}
} // namespace ArkUICapiTest