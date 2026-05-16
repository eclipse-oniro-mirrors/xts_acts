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

#include "checkbox_onchange_test.h"
#include <string>
#include <arkui/native_node_napi.h>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

#define ON_CHANGE_DISABLE_EVENT_ID 7007

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool select)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_CHECKBOX);

    ArkUI_NumberValue select_value[] = {{.i32 = select}};
    ArkUI_AttributeItem select_item = {select_value, sizeof(select_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_CHECKBOX_SELECT, &select_item);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CheckboxOnChangeTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CheckboxOnChangeTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CHANGE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (result->data[0].i32) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }

    if (eventId == ON_CHANGE_DISABLE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (!result->data[0].i32) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CheckboxOnChangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto checkbox = createChildNode(nodeAPI, false);
    auto checkboxSelected = createChildNode(nodeAPI, true);

    nodeAPI->registerNodeEvent(checkbox, NODE_CHECKBOX_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(checkboxSelected, NODE_CHECKBOX_EVENT_ON_CHANGE, ON_CHANGE_DISABLE_EVENT_ID, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnChangeTestCheckBox";
    nodeAPI->setAttribute(checkbox, NODE_ID, &id_item);
    id_item.string = "OnChangeTestCheckBoxSelected";
    nodeAPI->setAttribute(checkboxSelected, NODE_ID, &id_item);

    nodeAPI->addChild(column, checkbox);
    nodeAPI->addChild(column, checkboxSelected);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest