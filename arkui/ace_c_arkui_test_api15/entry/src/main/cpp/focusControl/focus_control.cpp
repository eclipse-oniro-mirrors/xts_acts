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

#include "focus_Control.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem LABEL_Item = {.string = "button"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &LABEL_Item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);
    return button;
}
ArkUI_NodeHandle button2;
ArkUI_NodeHandle button;
ArkUI_NodeHandle button4x;

ArkUI_NodeHandle button1xx;
static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID)  {
          auto buttonContext2 = OH_ArkUI_GetContextByNode(button2);
          OH_ArkUI_FocusActivate(buttonContext2, true, true);
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest2", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest2", "OnEventReceive2: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    
    
     int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID )  {
          auto buttonContext2 = OH_ArkUI_GetContextByNode(button1xx);
          OH_ArkUI_FocusClear(buttonContext2);
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest4", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest4", "OnEventReceive2: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    
    
     int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
     if (eventId == ON_CLICK_EVENT_ID )  {
          auto buttonContext4x = OH_ArkUI_GetContextByNode(button4x);
          OH_ArkUI_FocusSetAutoTransfer(buttonContext4x, false);
          
     } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest",
                      "OnEventReceive change color");
    }
    
}


napi_value FocusControlTest::FocusControlTest_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest_001", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_001", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button1"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);
    nodeAPI->addChild(column, button);
    
    auto button2 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "button2"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId2);
    nodeAPI->addChild(column, button2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    OH_ArkUI_FocusRequest(button2);


    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_001",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}


napi_value FocusControlTest::FocusControlTest_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest_002", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_002", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    button1xx = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button1xxx"};
    nodeAPI->setAttribute(button1xx, NODE_ID, &textId);
    nodeAPI->addChild(column, button1xx);



    nodeAPI->registerNodeEvent(button1xx, NODE_ON_BLUR, ON_BLUR_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button1xx, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);


    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value FocusControlTest::FocusControlTest_003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest_003", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button1"};
    nodeAPI->setAttribute(button, NODE_ID, &textId);
    nodeAPI->addChild(column, button);


    button2 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "button2"};
    nodeAPI->setAttribute(button2, NODE_ID, &textId2);
    nodeAPI->addChild(column, button2);

    nodeAPI->registerNodeEvent(button2, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    auto buttonContext2 = OH_ArkUI_GetContextByNode(button2);
    OH_ArkUI_FocusActivate(buttonContext2, true, true);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}


napi_value FocusControlTest::FocusControlTest_004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest_004", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_004", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button4 = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId = {.string = "button4"};
    nodeAPI->setAttribute(button4, NODE_ID, &textId);
    nodeAPI->addChild(column, button4);
    
    button4x = createChildNode(nodeAPI, true);
    ArkUI_AttributeItem textId2 = {.string = "button4x"};
    nodeAPI->setAttribute(button4x, NODE_ID, &textId2);
    nodeAPI->addChild(column, button4x);
    nodeAPI->registerNodeEvent(button4x, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
     nodeAPI->registerNodeEvent(button4x, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_001",
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