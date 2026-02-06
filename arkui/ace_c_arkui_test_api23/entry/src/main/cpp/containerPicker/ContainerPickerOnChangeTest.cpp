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

#include "../manager/PluginManagerTest.h"
#include "ContainerPickerOnChangeTest.h"
#include "../component/ColumnComponentTest.h"
#include <arkui/native_type.h>
#include <string>
namespace ArkUICapiTest {
napi_value ContainerPickerOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContainerPickerOnChangeTest",
                     "GetContext env or info is null");
        return nullptr;
    }
    
    auto column = new ColumnComponent();
    auto containerPicker = CreateNode_ContainerPicker();
    containerPicker->SetId("containerPickerOnChangeTest");
    containerPicker->RegisterOnChange([containerPicker](ArkUI_NodeEvent *event) {
        ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        ArkUI_NodeComponentEvent *onChangeEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        bool containerPickerResult = false;
        containerPickerResult = (onChangeEvent->data[PARAM_0].i32 != PARAM_1);
        if (containerPickerResult) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(containerPicker->GetComponent(), NODE_BACKGROUND_COLOR, &background_color_item);
        }
    });
    column->AddChild(containerPicker);

    // 所有组件挂在到XComponent
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                 column->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ContainerPickerOnChangeTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest