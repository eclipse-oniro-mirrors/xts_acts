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

#include "SourceTypeTest.h"
#include "PluginManagerTest.h"
#include <arkui/native_dialog.h>
#include <arkui/native_gesture.h>
#include <string>
#include <hilog/log.h>
#undef LOG_TAG
#define LOG_TAG "public"
 
namespace ArkUICapiTest {
    ArkUI_NativeDialogHandle globalCustomDialog = nullptr;
    ArkUI_NodeHandle text3 = nullptr;

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

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

        nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);

        return nodeHandle;
    }

    static auto createChildNode1(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
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

        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_BLUE}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &background_color_item);

        nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);

        return nodeHandle;
    }

    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonSourceTypeTest", "OnEventReceive");
        if (event == nullptr) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonSourceTypeTest", "OnEventReceive: event is null");
            return;
        }

        int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonSourceTypeTest", "OnEventReceive eventId: %{public}d",
                     eventId);

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
        auto *uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        ArkUI_NativeDialogAPI_1* dialogAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
    
        if (eventId == PARAM_1) {
            OH_LOG_INFO(LOG_APP, "输入源类型为：%{public}d ", OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent));
            auto isNum = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
            std::string isNumber = std::to_string(isNum);
            const char* isNumber1 = isNumber.c_str();
            ArkUI_AttributeItem contentItem = {.string =  isNumber1};
            nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &contentItem);
        }
    
        if (eventId == PARAM_2) {
            OH_LOG_INFO(LOG_APP, "输入源类型为：%{public}d ", OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent));
            auto isKey = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
            std::string isKey1 = std::to_string(isKey);
            const char* isKey2 = isKey1.c_str();
            ArkUI_AttributeItem contentItem1 = {.string =  isKey2};
            nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &contentItem1);
        }
    }

    napi_value ButtonSourceTypeTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ButtonSourceTypeTest", "CreateNativeNode");

        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN,
                "ButtonSourceTypeTest", "GetContext env or info is null");
            return nullptr;
        }

        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
        auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        auto button1 = createChildNode(nodeAPI, true);
        auto button2 = createChildNode1(nodeAPI, true);

        ArkUI_AttributeItem id_item = {};
        id_item.string = "手柄测试按钮";
        nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &id_item);
        ArkUI_AttributeItem id_item1 = {};
        id_item1.string = "键盘测试按钮";
        nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &id_item1);
        nodeAPI->addChild(column, button1);
        nodeAPI->addChild(column, button2);
    
        text3 = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem logMsg = {.string = "设备返回数值"};
        nodeAPI->setAttribute(text3, NODE_TEXT_CONTENT, &logMsg);
        nodeAPI->addChild(column, text3);
        nodeAPI->registerNodeEventReceiver(&OnEventReceive);

        std::string id(xComponentID);
        if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column)
        == INVALID_PARAM) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ButtonSourceTypeTest",
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