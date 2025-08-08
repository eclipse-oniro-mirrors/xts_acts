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

#include "textinput_oncut_test.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

#define TEXT_INPUT_ON_CUT_TEST_STRING "X"

static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);

    ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_AttributeItem text_item = {};
    text_item.string = TEXT_INPUT_ON_CUT_TEST_STRING;
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_INPUT_TEXT, &text_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

    nodeAPI->registerNodeEvent(nodeHandle, NODE_TEXT_INPUT_ON_CUT, ON_CUT_EVENT_ID, nullptr);

    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_CUT_EVENT_ID) {
        ArkUI_StringAsyncEvent *result = OH_ArkUI_NodeEvent_GetStringAsyncEvent(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "OnEventReceive pStr: %{public}s",
                     result->pStr);
        if (::strcmp(result->pStr, TEXT_INPUT_ON_CUT_TEST_STRING) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value TextInputOnCutTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnCutTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto textInput = createChildNode(nodeAPI);
    auto textInputDisable = createChildNode(nodeAPI);
    
    ArkUI_NumberValue size_value[] = {{.f32 = SIZE_300}, {.f32 = SIZE_300}};
    ArkUI_AttributeItem size_item = {size_value, sizeof(size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_SIZE, &size_item);

    ArkUI_NumberValue enter_value[] = {{.i32 = ARKUI_ENTER_KEY_TYPE_NEW_LINE}};
    ArkUI_AttributeItem enter_item = {enter_value, sizeof(enter_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textInputDisable, NODE_TEXT_INPUT_ENTER_KEY_TYPE, &enter_item);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "OnCutTestTextInput";
    nodeAPI->setAttribute(textInput, NODE_ID, &id_item);

    nodeAPI->addChild(column, textInput);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TextInputOnCutTest",
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