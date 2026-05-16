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


#include "datepicker_ondatechange_test.h"
#include <arkui/native_type.h>
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto datePicker = nodeAPI->createNode(ARKUI_NODE_DATE_PICKER);

    ArkUI_NumberValue widthValue[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem widthItem = {widthValue, sizeof(widthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = {{.f32 = SIZE_250}};
    ArkUI_AttributeItem heightItem = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker, NODE_HEIGHT, &heightItem);

    ArkUI_NumberValue borderWidthValue[] = {{.f32 = PARAM_2}};
    ArkUI_AttributeItem borderWidthValueItem = {borderWidthValue, sizeof(borderWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker, NODE_BORDER_WIDTH, &borderWidthValueItem);

    ArkUI_NumberValue marginValue[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem marginItem = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(datePicker, NODE_MARGIN, &marginItem);

    nodeAPI->registerNodeEvent(datePicker, NODE_DATE_PICKER_EVENT_ON_DATE_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    return datePicker;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DatePickerOnClickTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DatePickerOnClickTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DatePickerOnClickTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CHANGE_EVENT_ID) {
        int32_t defaultYear = 1970;
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        bool checkResult = false;
        checkResult = (result->data[PARAM_0].i32 != defaultYear) || (result->data[PARAM_1].i32 != PARAM_1) ||
                      (result->data[PARAM_2].i32 != PARAM_1);
        if (checkResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}
void DatePickerOnDateChangeTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto datePicker = createChildNode(nodeAPI);

    nodeAPI->addChild(column, datePicker);

    ArkUI_AttributeItem idItem = {};
    idItem.string = "datePickerOnDateChangeTest";
    nodeAPI->setAttribute(datePicker, NODE_ID, &idItem);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest