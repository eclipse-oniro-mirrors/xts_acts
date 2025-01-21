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

#include "textinput_onchange_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, int32_t enabled, const char *id)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);

    // set enabled
    ArkUI_NumberValue enabled_value[] = {{.i32 = enabled}};
    ArkUI_AttributeItem enabled_item = {enabled_value, sizeof(enabled_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enabled_item);

    // set id
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);

    // set background color
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    // set width
    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_200}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    // set height
    ArkUI_NumberValue height_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    // set keyboard
    ArkUI_NumberValue keyboard_value[] = {{.i32 = PARAM_0}};
    ArkUI_AttributeItem keyboard_item = {keyboard_value, sizeof(keyboard_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_INPUT_ENABLE_KEYBOARD_ON_FOCUS, &keyboard_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, ON_CLICK_EVENT_ID, nullptr);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_INPUT_ON_CHANGE, ON_CHANGE_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == ON_CHANGE_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "OnEventReceive:ON_CHANGE_EVENT_ID");
        ArkUI_StringAsyncEvent *result = OH_ArkUI_NodeEvent_GetStringAsyncEvent(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "result:%{public}s", result->pStr);
        if (std::strcmp(result->pStr, "123abc") == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_BLUE}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    } else if (eventId == ON_CLICK_EVENT_ID) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "OnEventReceive:ON_CLICK_EVENT_ID");
        ArkUI_NumberValue textInput_editing_value[] = {{.i32 = PARAM_0}};
        ArkUI_AttributeItem textInput_editing_item = {textInput_editing_value,
                                                      sizeof(textInput_editing_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_TEXT_INPUT_EDITING, &textInput_editing_item);

        ArkUI_AttributeItem text_item = {};
        text_item.string = "123abc";
        nodeAPI->setAttribute(nodeHandler, NODE_TEXT_INPUT_TEXT, &text_item);
    }
}

napi_value TextInputOnChangeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnChangeTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto textInput = createChildNode(nodeAPI, PARAM_1, "OnChangeTextInput");
    auto textInputDisabled = createChildNode(nodeAPI, PARAM_0, "OnChangeTextInputDisabled");

    // Bind onChange event
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    // parent column
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column, textInput);
    nodeAPI->addChild(column, textInputDisabled);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputEnabledTest",
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