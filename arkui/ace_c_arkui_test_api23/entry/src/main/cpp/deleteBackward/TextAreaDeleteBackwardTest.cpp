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

#include "TextAreaDeleteBackwardTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>

static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle textInput = nullptr;
static ArkUI_NodeHandle textArea = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isID)
{
    std::string idValue = isID;
    ArkUI_AttributeItem IDValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &IDValueItem);
}

napi_value TextAreaDeleteBackwardTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                 "%{public}s", xComponentID);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

            OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OnSurfaceCreatedCB  222--1");
            
            auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            auto text_input = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);

            ArkUI_AttributeItem text_placeholder{ .string = "测试文本!⛏️⛏️⛏️⛏️⛏️" };
            IDTest(text_input, "textAreaMiningTips");
            nodeAPI->setAttribute(text_input, NODE_TEXT_INPUT_TEXT, &text_placeholder);
            
            auto controller= OH_ArkUI_TextContentBaseController_Create () ;
            ArkUI_AttributeItem item_controller{ .object = controller };
            nodeAPI->setAttribute(text_input, NODE_TEXT_AREA_TEXT_CONTENT_CONTROLLER_BASE, &item_controller);

            ArkUI_TextContentBaseController* controller1= OH_ArkUI_TextContentBaseController_Create () ;
            OH_ArkUI_TextContentBaseController_Dispose(controller1);
            
            auto button{ nodeAPI->createNode(ARKUI_NODE_BUTTON) };
            ArkUI_AttributeItem button_label{ .string = "DeleteBackward" };
            IDTest(button, "DeleteBackward");
            nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &button_label);
            nodeAPI->registerNodeEvent(button, NODE_ON_CLICK_EVENT, PARAM_4242, controller);
            
            nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent* event) {
                auto eventType{ OH_ArkUI_NodeEvent_GetEventType(event) };
                auto eventId{ OH_ArkUI_NodeEvent_GetTargetId(event) };
                auto controller{ OH_ArkUI_NodeEvent_GetUserData(event) };
                
                if (eventType == NODE_ON_CLICK_EVENT && eventId == PARAM_4242)
                    OH_ArkUI_TextContentBaseController_DeleteBackward(
                        reinterpret_cast<ArkUI_TextContentBaseController*>(controller));
            });

            nodeAPI->addChild(column, text_input);
            nodeAPI->addChild(column, button);
            
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}

} // namespace ArkUIDeleteTest