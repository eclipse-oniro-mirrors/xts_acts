/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "../manager/plugin_manager.h"
#include <string>
#include "radio_component.h"
namespace ArkUICapiTest {

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

napi_value RadioOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    // parent column
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RadioOnChangeTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value RadioOnChangeTest::CreateNativeNodeChecked(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "CreateNativeNodeChecked");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RadioOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
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

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RadioOnChangeTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest