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

#include "keyEvent_SetConsumed.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = "KeyEvent"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);
    nodeAPI->registerNodeEvent(button, NODE_ON_KEY_EVENT, 2, nullptr);
    nodeAPI->registerNodeEvent(button, NODE_ON_KEY_PRE_IME, 2, nullptr);

    return button;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventSetConsumed", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventSetConsumed", "OnEventReceive: event is null");
        return;
    }
    auto get_ArkuI_UIInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
    OH_ArkUI_KeyEvent_SetConsumed(get_ArkuI_UIInputEvent, true);
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    
}

napi_value KeyEventSetConsumedTest::KeyEventSetConsumedTest_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "KeyEventSetConsumed", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventSetConsumed", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI);
    ArkUI_AttributeItem textId = {.string = "KeyEventSetConsumed"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);

    nodeAPI->addChild(column, button);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "KeyEventSetConsumed",
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