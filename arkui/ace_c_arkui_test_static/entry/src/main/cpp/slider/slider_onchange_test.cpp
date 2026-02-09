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

#include "slider_onchange_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "SliderOnChangeTest", "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NodeComponentEvent *componentEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);

    if (eventId == ON_CHANGE_EVENT_ID &&
        strcmp(nodeAPI->getAttribute(nodeHandler, NODE_ID)->string, "OnChangeSlider") == 0) {
        ArkUI_NumberValue trackColorValue[] = {{.u32 = 0xFFFF0000}};
        ArkUI_AttributeItem trackColorItem = {trackColorValue, sizeof(trackColorValue) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_SLIDER_TRACK_COLOR, &trackColorItem);
    }

    if (eventId == ON_CHANGE_EVENT_ID && componentEvent->data[PARAM_0].f32 == SIZE_50 &&
        componentEvent->data[PARAM_1].f32 == PARAM_0 &&
        strcmp(nodeAPI->getAttribute(nodeHandler, NODE_ID)->string, "OnChangeSliderValue") == 0) {
        ArkUI_NumberValue trackColorValueSecond[] = {{.u32 = 0xFF00FF00}};
        ArkUI_AttributeItem trackColorItemSecond = {trackColorValueSecond,
                                                    sizeof(trackColorValueSecond) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_SLIDER_TRACK_COLOR, &trackColorItemSecond);
    }
}

void SliderOnChangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // slider
    auto slider = nodeAPI->createNode(ARKUI_NODE_SLIDER);
    ArkUI_AttributeItem idItem = {};
    idItem.string = "OnChangeSlider";
    nodeAPI->setAttribute(slider, NODE_ID, &idItem);

    auto sliderV = nodeAPI->createNode(ARKUI_NODE_SLIDER);
    ArkUI_AttributeItem idItemV = {};
    idItemV.string = "OnChangeSliderValue";
    nodeAPI->setAttribute(sliderV, NODE_ID, &idItemV);

    nodeAPI->addChild(column, slider);
    nodeAPI->addChild(column, sliderV);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->registerNodeEvent(slider, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(slider, NODE_SLIDER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    nodeAPI->registerNodeEvent(sliderV, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(sliderV, NODE_SLIDER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest