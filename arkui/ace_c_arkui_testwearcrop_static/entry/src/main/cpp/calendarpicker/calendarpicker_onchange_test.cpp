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

#include "../manager/plugin_manager.h"
#include "calendarpicker_onchange_test.h"
#include <arkui/native_type.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"


namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto calendarPicker = nodeAPI->createNode(ARKUI_NODE_CALENDAR_PICKER);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = {{.f32 = SIZE_30}};
    ArkUI_AttributeItem heightItem = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue background_colorValue[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_colorItem = {background_colorValue,
                                                sizeof(background_colorValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker, NODE_BACKGROUND_COLOR, &background_colorItem);

    float offsetValue = -150;
    ArkUI_NumberValue alignedValue[] = {
        {.i32 = ARKUI_CALENDAR_ALIGNMENT_CENTER}, {.f32 = PARAM_0}, {.f32 = offsetValue}};
    ArkUI_AttributeItem startValueItem = {alignedValue, sizeof(alignedValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(calendarPicker, NODE_CALENDAR_PICKER_EDGE_ALIGNMENT, &startValueItem);

    nodeAPI->registerNodeEvent(calendarPicker, NODE_CALENDAR_PICKER_EVENT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    return calendarPicker;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CalendarPickerOnClickTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CalendarPickerOnClickTest",
                     "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CalendarPickerOnClickTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CHANGE_EVENT_ID) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        bool checkResult = false;
        checkResult = (result->data[PARAM_0].u32 > PARAM_0) && (result->data[PARAM_1].u32 > PARAM_0) &&
                      (result->data[PARAM_2].u32 > PARAM_0);
        if (checkResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

void CalendarPickerOnChangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]CalendarPickerOnChangeTest::CreateNativeNode start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

   
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto calendarPicker = createChildNode(nodeAPI);

    nodeAPI->addChild(column, calendarPicker);

    ArkUI_AttributeItem idItem = {};
    idItem.string = "calendarPickerOnChangeTest";
    nodeAPI->setAttribute(calendarPicker, NODE_ID, &idItem);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUICapiTest