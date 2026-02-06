
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

#include "button_gettype_test.h"
#include "../manager/plugin_manager.h"
#include "ani/ani.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include "hilog/log.h"
#include <string>

namespace ArkUICapiTest {
ArkUI_NodeHandle text1 = nullptr;
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled) {
  auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

  ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
  ArkUI_AttributeItem enable_item = {
      enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
  nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

  ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
  ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) /
                                                     sizeof(ArkUI_NumberValue)};
  nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
  nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

  ArkUI_AttributeItem LABEL_Item = {.string = "gettype"};
  nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &LABEL_Item);

  ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
  ArkUI_AttributeItem margin_item = {
      margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
  nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

  nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_KEY_EVENT, 1, nullptr);

  return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event) {
  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest",
               "OnEventReceive");
  if (event == nullptr) {
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverTest",
                 "OnEventReceive: event is null");
    return;
  }

  int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest","OnEventReceive eventId: %{public}d", eventId);

  ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
  OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1,nodeAPI);
  auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
  auto uiEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
  int32_t type = OH_ArkUI_UIInputEvent_GetType(uiEvent);

  OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest",
               "OH_ArkUI_UIInputEvent_GetType: %{public}d", type);

  if (eventId == 1 && type == 4) {
    auto isText_ = "successed";
    ArkUI_AttributeItem item1 = {.string = isText_};
    nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &item1);
  }
}

void ButtonGetTypeTest::CreateNativeNode(ani_env *env, ani_object info, ani_object NodeContent) {
  OH_LOG_INFO(LOG_APP, " [cf]CustomComponentOnDrawBehindTest start -> 66");
  // 获取节点的前置框架代码，直接写就行
  ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
  OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1,nodeAPI);

  // 将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
  ArkUI_NodeContentHandle contentHandle;
  OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent,&contentHandle);

  auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
  auto button = createChildNode(nodeAPI, true);
  text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);

  ArkUI_AttributeItem item1 = {.string = "gettype"};
  nodeAPI->setAttribute(text1, NODE_TEXT_CONTENT, &item1);

  ArkUI_AttributeItem id_item = {};
  id_item.string = "gettype";
  nodeAPI->setAttribute(text1, NODE_ID, &id_item);

  nodeAPI->addChild(column, button);
  nodeAPI->addChild(column, text1);

  nodeAPI->registerNodeEventReceiver(&OnEventReceive);

  // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
  OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
  OH_ArkUI_NodeContent_AddNode(contentHandle, column);
  OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
  return;
}
} // namespace ArkUICapiTest