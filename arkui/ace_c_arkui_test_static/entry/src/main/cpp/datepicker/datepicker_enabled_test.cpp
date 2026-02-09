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

#include "datepicker_enabled_test.h"

#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"

namespace ArkUIAniTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_DATE_PICKER);

    if (enabled != SIZE_50) {
        ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);
    }

    // set background color
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    // set width
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_70}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    // set margin
    ArkUI_NumberValue margin_value[] = {{.f32 = SIZE_1}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    // set selected date
    const char *dataPickerValue = "2024-01-01";
    ArkUI_AttributeItem date_picker_value_item = {};
    date_picker_value_item.string = dataPickerValue;
    nodeAPI->setAttribute(nodeHandle, NODE_DATE_PICKER_SELECTED, &date_picker_value_item);

    // set focusable
    ArkUI_NumberValue focusable_value[] = {{.i32 = FOCUSABLE_TRUE}};
    ArkUI_AttributeItem focusable_item = {focusable_value, sizeof(focusable_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_FOCUSABLE, &focusable_item);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DatePickerEnabledTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DatePickerEnabledTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    uint32_t color = COLOR_PURPLE;
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DatePickerEnabledTest", "OnEventReceive eventId: %{public}d",
                 eventId);
    switch (eventId) {
        case ON_CLICK_EVENT_ID:
            color = COLOR_GREEN;
            break;
        case ON_FOCUS_EVENT_ID:
            color = COLOR_BLUE;
            break;
        case ON_BLUR_EVENT_ID:
            color = COLOR_YELLOW;
            break;
        default:
            break;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
}

void DatePickerEnabledTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    //获取节点的前置框架代码，直接写就行
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    // first datePicker
    auto datePicker = createChildNode(nodeAPI, PARAM_1);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "EnabledDatePicker";
    nodeAPI->setAttribute(datePicker, NODE_ID, &id_item);
    nodeAPI->registerNodeEvent(datePicker, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(datePicker, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // second datePicker
    auto datePickerDisabled = createChildNode(nodeAPI, PARAM_0);
    ArkUI_AttributeItem id_second_item = {};
    id_second_item.string = "DisabledDatePicker";
    nodeAPI->setAttribute(datePickerDisabled, NODE_ID, &id_second_item);
    nodeAPI->registerNodeEvent(datePickerDisabled, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(datePickerDisabled, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // third datePicker
    auto datePickerAbnormal = createChildNode(nodeAPI, PARAM_NEGATIVE_1);
    ArkUI_AttributeItem id_third_item = {};
    id_third_item.string = "AbnormalDatePicker";
    nodeAPI->setAttribute(datePickerAbnormal, NODE_ID, &id_third_item);
    nodeAPI->registerNodeEvent(datePickerAbnormal, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(datePickerAbnormal, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);

    // datePicker for click
    auto datePickerClick = createChildNode(nodeAPI, PARAM_1);
    ArkUI_AttributeItem id_item_click = {};
    id_item_click.string = "OnClickEnabledDatePicker";
    nodeAPI->setAttribute(datePickerClick, NODE_ID, &id_item_click);
    nodeAPI->registerNodeEvent(datePickerClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // datePicker for click
    auto datePickerDisabledClick = createChildNode(nodeAPI, PARAM_0);
    ArkUI_AttributeItem id_second_item_click = {};
    id_second_item_click.string = "OnClickDisabledDatePicker";
    nodeAPI->setAttribute(datePickerDisabledClick, NODE_ID, &id_second_item_click);
    nodeAPI->registerNodeEvent(datePickerDisabledClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // datePicker for click
    auto datePickerAbnormalClick = createChildNode(nodeAPI, PARAM_NEGATIVE_1);
    ArkUI_AttributeItem id_third_item_click = {};
    id_third_item_click.string = "OnClickAbnormalDatePicker";
    nodeAPI->setAttribute(datePickerAbnormalClick, NODE_ID, &id_third_item_click);
    nodeAPI->registerNodeEvent(datePickerAbnormalClick, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    // row
    auto rowFirst = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowSecond = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto rowThird = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(rowFirst, datePicker);
    nodeAPI->addChild(rowFirst, datePickerClick);
    nodeAPI->addChild(rowSecond, datePickerDisabled);
    nodeAPI->addChild(rowSecond, datePickerDisabledClick);
    nodeAPI->addChild(rowThird, datePickerAbnormal);
    nodeAPI->addChild(rowThird, datePickerAbnormalClick);

    nodeAPI->addChild(column, rowFirst);
    nodeAPI->addChild(column, rowSecond);
    nodeAPI->addChild(column, rowThird);

    // Bind click event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest