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

#include "UiInputErrorCodeTest.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_dialog.h>
#include <cstdint>
#include <string>
 
namespace ArkUICapiTest {

    ArkUI_NodeHandle text = nullptr;
    ArkUI_NodeHandle text3 = nullptr;
    ArkUI_NodeHandle text4 = nullptr;
    ArkUI_NodeHandle text5 = nullptr;
    ArkUI_NodeHandle text6 = nullptr;
    ArkUI_NodeHandle text7 = nullptr;
    ArkUI_NodeHandle text8 = nullptr;
    ArkUI_NodeHandle text9 = nullptr;
    ArkUI_NodeHandle text10 = nullptr;

    static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
    {
        auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_BUTTON);

        ArkUI_NumberValue enable_value[] = {{.i32 = enabled}};
        ArkUI_AttributeItem enable_item = {enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

        ArkUI_NumberValue width_value[] = {{.f32 = SIZE_100}};
        ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
        nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

        ArkUI_NumberValue margin_value[] = {{.f32 = DEFAULT_MARGIN}};
        ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_PINK}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);
        nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK_EVENT, ON_CLICK_EVENT_ID, nullptr);
        return nodeHandle;
    }


    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive: event is null");
            return;
        }
    
        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonOnHoverTest", "OnEventReceive eventId: %{public}d",
                     eventId);
    
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        ArkUI_NativeDialogAPI_1* dialogAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    
        if (eventId == ON_CLICK_EVENT_ID) {
            OH_LOG_INFO(LOG_APP, "on list AxisAction %{public}d",
                        OH_ArkUI_AxisEvent_GetAxisAction(uiInputEvent));
            ArkUI_ErrorCode isError = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState = std::to_string(isError);
            const char* isErrrorState1 = isErrrorState.c_str();
            ArkUI_AttributeItem contentItem = {.string =  isErrrorState1};
            nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);

            OH_LOG_INFO(LOG_APP, "on list DisplayX %{public}f",
                        OH_ArkUI_PointerEvent_GetDisplayX(uiInputEvent));
            ArkUI_ErrorCode isError1 =  OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState2 = std::to_string(isError1);
            const char* isErrrorState3 = isErrrorState2.c_str();
            ArkUI_AttributeItem contentItem1 = {.string =  isErrrorState3};
            nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &contentItem1);
        
            OH_LOG_INFO(LOG_APP, "on list DisplayX %{public}f",
                        OH_ArkUI_PointerEvent_GetDisplayX(nullptr));
            ArkUI_ErrorCode isError2 =  OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState4 = std::to_string(isError2);
            const char* isErrrorState5 = isErrrorState4.c_str();
            ArkUI_AttributeItem contentItem2 = {.string =  isErrrorState5};
            nodeAPI->setAttribute(text4, NODE_TEXT_CONTENT, &contentItem2);
            OH_LOG_INFO(LOG_APP, "on list GlobalDisplayX %{public}f",
                        OH_ArkUI_PointerEvent_GetGlobalDisplayX(uiInputEvent));
            ArkUI_ErrorCode isError3 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState6 = std::to_string(isError3);
            const char *isErrrorState7 = isErrrorState6.c_str();
            ArkUI_AttributeItem contentItem3 = {.string = isErrrorState7};
            nodeAPI->setAttribute(text5, NODE_TEXT_CONTENT, &contentItem3);
            OH_LOG_INFO(LOG_APP, "on list GlobalDisplayY %{public}f",
                        OH_ArkUI_PointerEvent_GetGlobalDisplayY(uiInputEvent));
            ArkUI_ErrorCode isError6 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState61 = std::to_string(isError6);
            const char *isErrrorState62 = isErrrorState61.c_str();
            ArkUI_AttributeItem contentItem6 = {.string = isErrrorState62};
            nodeAPI->setAttribute(text6, NODE_TEXT_CONTENT, &contentItem6);
            OH_LOG_INFO(LOG_APP, "on list HistoryGlobalDisplayX %{public}f",
                        OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayX(
                            uiInputEvent, 0, 0));
            ArkUI_ErrorCode isError7 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState71 = std::to_string(isError7);
            const char *isErrrorState72 = isErrrorState71.c_str();
            ArkUI_AttributeItem contentItem7 = {.string = isErrrorState72};
            nodeAPI->setAttribute(text7, NODE_TEXT_CONTENT, &contentItem7);
            OH_LOG_INFO(LOG_APP, "on list HistoryGlobalDisplayY %{public}f",
                        OH_ArkUI_PointerEvent_GetHistoryGlobalDisplayY(
                            uiInputEvent, 0, 0));
            ArkUI_ErrorCode isError8 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState81 = std::to_string(isError8);
            const char *isErrrorState82 = isErrrorState81.c_str();
            ArkUI_AttributeItem contentItem8 = {.string = isErrrorState82};
            nodeAPI->setAttribute(text8, NODE_TEXT_CONTENT, &contentItem8);
            OH_LOG_INFO(LOG_APP, "on list GlobalDisplayXByIndex %{public}f",
                        OH_ArkUI_PointerEvent_GetGlobalDisplayXByIndex(
                            uiInputEvent, 0));
            ArkUI_ErrorCode isError9 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState91 = std::to_string(isError9);
            const char *isErrrorState92 = isErrrorState91.c_str();
            ArkUI_AttributeItem contentItem9 = {.string = isErrrorState92};
            nodeAPI->setAttribute(text9, NODE_TEXT_CONTENT, &contentItem9);
            OH_LOG_INFO(LOG_APP, "on list GlobalDisplayYByIndex %{public}f",
                        OH_ArkUI_PointerEvent_GetGlobalDisplayYByIndex(
                            uiInputEvent, 0));
            ArkUI_ErrorCode isError10 = OH_ArkUI_UIInputEvent_GetLatestStatus();
            std::string isErrrorState101 = std::to_string(isError10);
            const char *isErrrorState102 = isErrrorState101.c_str();
            ArkUI_AttributeItem contentItem10 = {.string = isErrrorState102};
            nodeAPI->setAttribute(text10, NODE_TEXT_CONTENT, &contentItem10);
        }
    }

    napi_value ButtonErrorCodeTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "ButtonErrorCodeTest", "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto buttonaxis = createChildNode(nodeAPI, true);

        ArkUI_AttributeItem id_item = {.string = "ErrorCodeButton"};
        nodeAPI->setAttribute(buttonaxis, NODE_ID, &id_item);
        nodeAPI->addChild(column, buttonaxis);
    
        text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text4 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text5 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text6 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text7 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text8 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text9 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        text10 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem id_item1 = {.string = "ErrorCodetextStates"};
        nodeAPI->setAttribute(text, NODE_ID, &id_item1);
        ArkUI_AttributeItem id_item2 = {.string = "ErrorCodetextStates1"};
        nodeAPI->setAttribute(text3, NODE_ID, &id_item2);
        ArkUI_AttributeItem id_item3 = {.string = "ErrorCodetextStates2"};
        nodeAPI->setAttribute(text4, NODE_ID, &id_item3);
        ArkUI_AttributeItem id_item4 = {.string = "ErrorCodetextStates3"};
        nodeAPI->setAttribute(text5, NODE_ID, &id_item4);
        ArkUI_AttributeItem id_item5 = {.string = "ErrorCodetextStates4"};
        nodeAPI->setAttribute(text6, NODE_ID, &id_item5);
        ArkUI_AttributeItem id_item6 = {.string = "ErrorCodetextStates5"};
        nodeAPI->setAttribute(text7, NODE_ID, &id_item6);
        ArkUI_AttributeItem id_item7 = {.string = "ErrorCodetextStates6"};
        nodeAPI->setAttribute(text8, NODE_ID, &id_item7);
        ArkUI_AttributeItem id_item8 = {.string = "ErrorCodetextStates7"};
        nodeAPI->setAttribute(text9, NODE_ID, &id_item8);
        ArkUI_AttributeItem id_item9 = {.string = "ErrorCodetextStates8"};
        nodeAPI->setAttribute(text10, NODE_ID, &id_item9);
        ArkUI_AttributeItem logMsg = {.string = "Test"};
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text4, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text5, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text6, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text7, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text8, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text9, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->setAttribute(text10, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->addChild(column, text);
        nodeAPI->addChild(column, text3);
        nodeAPI->addChild(column, text4);
        nodeAPI->addChild(column, text5);
        nodeAPI->addChild(column, text6);
        nodeAPI->addChild(column, text7);
        nodeAPI->addChild(column, text8);
        nodeAPI->addChild(column, text9);
        nodeAPI->addChild(column, text10);
        nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column)
        == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonErrorCodeTest",
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