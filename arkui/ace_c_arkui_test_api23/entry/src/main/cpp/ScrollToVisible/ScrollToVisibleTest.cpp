/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "ScrollToVisible.h"
#include <cstdint>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

static int32_t ScrollToVisibleTextInput = 2;
static int32_t ScrollToVisibleTextArea = 2;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {
napi_value ScrollToVisibleTest::GetTextInputScrollToVisibleTest(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, ScrollToVisibleTextInput, &retValue);
    return retValue;
}

napi_value ScrollToVisibleTest::GetTextAreaScrollToVisibleTest(napi_env env, napi_callback_info info)
{
    napi_value retValue;
    napi_create_int32(env, ScrollToVisibleTextArea, &retValue);
    return retValue;
}

void onReceiver1(ArkUI_NodeEvent *event)
{
    const ArkUI_NodeEventType eventtype = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventtype == NODE_ON_CLICK_EVENT) {
        ArkUI_NodeHandle tsTextAreaNode;
        OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ScrollToVisibleTextArea", &tsTextAreaNode);
        auto TextAreaController =  OH_ArkUI_TextContentBaseController_Create();
        ArkUI_AttributeItem controllerItem1 = {.object = TextAreaController};
        nodeAPI->setAttribute(tsTextAreaNode, NODE_TEXT_AREA_TEXT_CONTENT_CONTROLLER_BASE, &controllerItem1);
        OH_ArkUI_TextContentBaseController_ScrollToVisible(TextAreaController, PARAM_20, PARAM_80);
        OH_ArkUI_TextContentBaseController_Dispose(TextAreaController);
        ArkUI_NodeHandle tsTextInputNode;
        OH_ArkUI_NodeUtils_GetAttachedNodeHandleById("ScrollToVisibleTextInput", &tsTextInputNode);
        auto TextInputController =  OH_ArkUI_TextContentBaseController_Create();
        ArkUI_AttributeItem controllerItem2 = {.object = TextInputController};
        nodeAPI->setAttribute(tsTextInputNode, NODE_TEXT_INPUT_TEXT_CONTENT_CONTROLLER_BASE, &controllerItem2);
        OH_ArkUI_TextContentBaseController_ScrollToVisible(TextInputController, PARAM_20, PARAM_80);
        OH_ArkUI_TextContentBaseController_Dispose(TextInputController);
    } else if (eventtype  == NODE_TEXT_AREA_ON_CONTENT_SCROLL) {
        ScrollToVisibleTextArea = PARAM_1;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, 
                        "eventtype", "ScrollToVisibleTextArea: %{public}d", ScrollToVisibleTextArea);
    } else if (eventtype  == NODE_TEXT_INPUT_ON_CONTENT_SCROLL) {
        ScrollToVisibleTextInput = PARAM_1;
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, 
                        "eventtype", "ScrollToVisibleTextInput: %{public}d", ScrollToVisibleTextInput);
    }
    return;
}
napi_value ScrollToVisibleTest::CreateScrollToVisibleNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollToVisibleTextInput",
                 "%{public}s", xComponentID);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ScrollToVisibleTextInput",
                     "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto TextArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
    auto TextInput = nodeAPI->createNode(ARKUI_NODE_TEXT_INPUT);
    auto Button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(Column, TextInput);
    nodeAPI->addChild(Column, TextArea);
    nodeAPI->addChild(Column, Button);
    nodeAPI->registerNodeEvent(TextArea, NODE_TEXT_AREA_ON_CONTENT_SCROLL, PARAM_1, nullptr);
    nodeAPI->registerNodeEvent(TextInput, NODE_TEXT_INPUT_ON_CONTENT_SCROLL, PARAM_1, nullptr);
    ArkUI_NumberValue textWidth[] = {{ .f32 = SIZE_200 }};
    ArkUI_NumberValue textHeight[] = {{ .f32 = SIZE_50 }};
    ArkUI_AttributeItem textItem1 = {.value = textWidth, .size = PARAM_1};
    ArkUI_AttributeItem textItem2 = {.value = textHeight, .size = PARAM_1};
    nodeAPI->setAttribute(TextArea, NODE_WIDTH, &textItem1);
    nodeAPI->setAttribute(TextArea, NODE_HEIGHT, &textItem2);
    nodeAPI->setAttribute(TextInput, NODE_WIDTH, &textItem1);
    nodeAPI->setAttribute(TextInput, NODE_HEIGHT, &textItem2);
    ArkUI_AttributeItem areaIDItem = {.string = "ScrollToVisibleTextArea", .size= PARAM_1};
    ArkUI_AttributeItem inputIDItem = {.string = "ScrollToVisibleTextInput", .size= PARAM_1};
    nodeAPI->setAttribute(TextArea, NODE_ID, &areaIDItem);
    nodeAPI->setAttribute(TextInput, NODE_ID, &inputIDItem);
    
    
    ArkUI_AttributeItem textItem = { .string = "一日，我这个智能助手接到了一位员工的求助。他说自己遇到了一些麻烦，需要我的帮助。我听了他的问题，心中暗自想着：“机不可失，时不再来。”于是我立刻开始了解决他的问题。\n\n经过一番努力，我终于帮助他解决了问题。"};
    nodeAPI->setAttribute(TextInput, NODE_TEXT_INPUT_TEXT, &textItem);
    nodeAPI->setAttribute(TextArea, NODE_TEXT_AREA_TEXT, &textItem);
    ArkUI_AttributeItem buttonItem = {.string = "ScrollToVisibleButton"};
    nodeAPI->setAttribute(Button, NODE_BUTTON_LABEL, &buttonItem);
    ArkUI_AttributeItem buttonIDItem = {.string = "ScrollToVisibleButton", .size= PARAM_1};
    nodeAPI->setAttribute(Button, NODE_ID, &buttonIDItem);
    nodeAPI->registerNodeEvent(Button, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->registerNodeEventReceiver(onReceiver1);
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), Column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}