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

#include "radio_onChange_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include "../component/radio_component.h"
namespace ArkUIAniTest {

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NodeComponentEvent* componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
    if (eventId == ON_CHANGE_EVENT_ID) {
        int32_t status = componentEvent->data[0].i32;
        if (status == PARAM_1) {
            ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_RED } };
            ArkUI_AttributeItem background_color_item = { background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void RadioOnChangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // radio
    auto radio = nodeAPI->createNode(ARKUI_NODE_RADIO);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "OnChangeRadio";
    nodeAPI->setAttribute(radio, NODE_ID, &idItem);

    nodeAPI->addChild(column, radio);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(radio, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(radio, NODE_RADIO_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}

void RadioOnChangeTest::CreateNativeNodeChecked(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto radio1 = std::make_shared<RadioComponent>();
    radio1->SetId("OnChangeRadio");
    radio1->SetWidth(SIZE_100);
    radio1->SetHeight(SIZE_100);
    radio1->SetMargin(PARAM_10);
    radio1->SetGroup("radioGroup");
    radio1->SetChecked(true);
    auto radio2 = std::make_shared<RadioComponent>();
    radio2->SetId("OnChangeRadio2");
    radio2->SetWidth(SIZE_100);
    radio2->SetHeight(SIZE_100);
    radio2->SetMargin(PARAM_10);
    radio2->SetGroup("radioGroup");
    radio2->SetChecked(true);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);

    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, row2);
    nodeAPI->addChild(row1, radio1->GetComponent());
    nodeAPI->addChild(row2, radio2->GetComponent());

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest