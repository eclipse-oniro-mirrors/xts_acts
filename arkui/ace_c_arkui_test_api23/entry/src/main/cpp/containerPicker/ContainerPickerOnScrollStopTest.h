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
 
#ifndef ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_ONSCROLLSTOP_TEST_H
#define ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_ONSCROLLSTOP_TEST_H

#include "../common/common.h"
#include "../component/TextComponentTest.h"
#include "../component/ContainerPickerComponentTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>

namespace ArkUICapiTest {

class ContainerPickerOnScrollStopTest {
public:
    ~ContainerPickerOnScrollStopTest();
    static napi_value CreateNativeNode(napi_env env, napi_callback_info info);
private:
    static std::shared_ptr<ContainerPickerComponent> CreateNode_ContainerPicker()
    {
        auto containerPicker = std::make_shared<ContainerPickerComponent>();
        auto nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1*>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        const char* month1[] = {"一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" };
        for (int i = PARAM_0; i < PARAM_12; i++) {
            auto text = new TextComponent();
            text->SetTextContent(month1[i]);
            nodeAPI->addChild(containerPicker->GetComponent(), text->GetComponent());
        }
        return containerPicker;
    }
};
} // namespace ArkUICapiTest
#endif // ARKUI_CAPI_XTS_TEXT_CONTAINERPICKER_ONSCROLLSTOP_TEST_H