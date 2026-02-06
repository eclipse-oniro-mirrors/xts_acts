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

#ifndef ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_COMPONENT_H
#define ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_COMPONENT_H
#include "ComponentTest.h"
#include <arkui/native_node.h>
namespace ArkUICapiTest {

class PickerIndicatorStyle {
public:
    PickerIndicatorStyle() = default;
    explicit PickerIndicatorStyle(ArkUI_PickerIndicatorType type) : _type(type)
    {
        _data = OH_ArkUI_PickerIndicatorStyle_Create(type);
    }
    ~PickerIndicatorStyle()
    {
        OH_ArkUI_PickerIndicatorStyle_Dispose(_data);
    }
    ArkUI_ErrorCode SetBackground(ArkUI_PickerIndicatorBackground value)
    {
        OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(_data, &value);
        return OH_ArkUI_PickerIndicatorStyle_ConfigureBackground(_data, &value);
    }
    ArkUI_ErrorCode SetDivider(ArkUI_PickerIndicatorDivider value)
    {
        OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(_data, &value);
        return  OH_ArkUI_PickerIndicatorStyle_ConfigureDivider(_data, &value);
    }
    ArkUI_PickerIndicatorType GetType() const { return _type; }
    ArkUI_PickerIndicatorStyle* GetStyle() { return _data; }

private:
    ArkUI_PickerIndicatorType _type = ArkUI_PickerIndicatorType::ARKUI_PICKER_INDICATOR_BACKGROUND;
    ArkUI_PickerIndicatorStyle* _data;
};


class ContainerPickerComponent : public Component {
public:
    explicit ContainerPickerComponent() : Component(ARKUI_NODE_PICKER) {}
    explicit ContainerPickerComponent(ArkUI_NodeHandle handle) : Component(handle) {}
    
    void SetContainerPickerSelectedIndex(int32_t selectedIndex);
    void SetContainerPickerCanLoop(int32_t canLoop);
    void SetContainerPickerEnableHapticFeedback(int32_t enableHapticFeedback);
    void RegisterOnChange(const std::function<void(ArkUI_NodeEvent* event)>& onChange);
    void RegisterOnScrollStop(const std::function<void(ArkUI_NodeEvent* event)>& OnScrollStop);
    void OnNodeEvent(ArkUI_NodeEvent* event) override;
    void SetContainerPickerSelectionIndicator(PickerIndicatorStyle&);
    
    std::function<void(ArkUI_NodeEvent* event)> onChange_;
    std::function<void(ArkUI_NodeEvent* event)> OnScrollStop_;
private:
    PickerIndicatorStyle _style;
};
} // ArkUICapiTest
#endif //ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_COMPONENT_H
