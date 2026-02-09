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
#include "ContainerPickerComponentTest.h"

namespace ArkUICapiTest {

void ContainerPickerComponent::SetContainerPickerSelectedIndex(int32_t selectedIndex)
{
    ArkUI_NumberValue selectedIndexValue[] = { { .i32 = selectedIndex } };
    ArkUI_AttributeItem selectedIndexItem = { selectedIndexValue,
        sizeof(selectedIndexValue) / sizeof(ArkUI_NumberValue) };
    _nodeAPI->setAttribute(_component, NODE_PICKER_OPTION_SELECTED_INDEX, &selectedIndexItem);
}
void ContainerPickerComponent::SetContainerPickerCanLoop(int32_t canLoop)
{
    ArkUI_NumberValue canLoopValue[] = { { .i32 = canLoop } };
    ArkUI_AttributeItem canLoopItem = { canLoopValue, sizeof(canLoopValue) / sizeof(ArkUI_NumberValue) };
    _nodeAPI->setAttribute(_component, NODE_PICKER_CAN_LOOP, &canLoopItem);
}
void ContainerPickerComponent::SetContainerPickerEnableHapticFeedback(int32_t enableHapticFeedback)
{
    ArkUI_NumberValue enableHapticFeedbackValue[] = { { .i32 = enableHapticFeedback } };
    ArkUI_AttributeItem enableHapticFeedbackItem = { enableHapticFeedbackValue,
        sizeof(enableHapticFeedbackValue) / sizeof(ArkUI_NumberValue) };
    _nodeAPI->setAttribute(_component, NODE_PICKER_ENABLE_HAPTIC_FEEDBACK, &enableHapticFeedbackItem);
}
void ContainerPickerComponent::RegisterOnChange(const std::function<void(ArkUI_NodeEvent* event)>& onChange)
{
    onChange_ = onChange;
    _nodeAPI->registerNodeEvent(_component, NODE_PICKER_EVENT_ON_CHANGE, 0, nullptr);
}
void ContainerPickerComponent::RegisterOnScrollStop(const std::function<void(ArkUI_NodeEvent* event)>& OnScrollStop)
{
    OnScrollStop_ = OnScrollStop;
    _nodeAPI->registerNodeEvent(_component, NODE_PICKER_EVENT_ON_SCROLL_STOP, 0, nullptr);
}
void ContainerPickerComponent::SetContainerPickerSelectionIndicator(PickerIndicatorStyle& indicatorStyle)
{
    _style = indicatorStyle;
    ArkUI_AttributeItem item = { .object = indicatorStyle.GetStyle() };
    _nodeAPI->setAttribute(_component, NODE_PICKER_SELECTION_INDICATOR, &item);
}
void ContainerPickerComponent::OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    switch (eventType) {
        case NODE_PICKER_EVENT_ON_CHANGE:
            if (onChange_) {
                onChange_(event);
            }
            break;
        case NODE_PICKER_EVENT_ON_SCROLL_STOP:
            if (OnScrollStop_) {
                OnScrollStop_(event);
            }
            break;
        default:
            break;
    }
}

} // namespace ArkUICapiTest
