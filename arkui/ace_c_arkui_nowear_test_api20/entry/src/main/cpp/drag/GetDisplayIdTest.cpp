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

#include "GetDisplayIdTest.h"
#include "../manager/plugin_manager.h"
#include <string>
#include <arkui/drag_and_drop.h>
 
namespace ArkUICapiTest {
    static void OnEventReceive(ArkUI_NodeEvent *event)
    {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        ArkUI_DragEvent* dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
        switch (eventType) {
            case NODE_ON_DRAG_START: {
                int displayIdValue = -1;
                ArkUI_ErrorCode errorCode = OH_ArkUI_DragEvent_GetDisplayId(dragEvent, &displayIdValue);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "displayId:%{public}d;", displayIdValue);
                if (displayIdValue == 0) {
                    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
                    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
                    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
                    ArkUI_NumberValue color_value[] = {{.u32 = 0xFF00FF00}};
                    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
                    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &color_item);
                }
                break;
            }
            default:
                break;
        }
    }
 
    napi_value GetDisplayIdTest::CreateNativeNode(napi_env env, napi_callback_info info)
    {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragEventGetDisplayIdTest", "CreateNativeNode");
 
        size_t argc = PARAM_1;
        napi_value args[PARAM_1] = {nullptr};
        napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
        size_t length = PARAM_64;
        size_t strLength = PARAM_0;
        char xComponentID[PARAM_64] = {PARAM_0};
        napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
 
        if ((env == nullptr) || (info == nullptr)) {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragEventGetDisplayIdTest", "GetContext is null");
            return nullptr;
        }
 
        ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
            auto Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            auto image = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
            ArkUI_NumberValue imageWidthValue[] = {150};
            ArkUI_AttributeItem imageWidthItem = {imageWidthValue, 1};
            ArkUI_NumberValue imageHeightValue[] = {150};
            ArkUI_AttributeItem imageHeightItem = {imageHeightValue, 1};
            nodeAPI->setAttribute(image, NODE_WIDTH, &imageWidthItem);
            nodeAPI->setAttribute(image, NODE_HEIGHT, &imageHeightItem);
            nodeAPI->setAttribute(dragArea, NODE_WIDTH, &imageWidthItem);
            nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &imageHeightItem);
            nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 0, nullptr);
            OH_ArkUI_SetNodeDraggable(image, true);
            ArkUI_AttributeItem id_item = {};
            id_item.string = "image";
            nodeAPI->setAttribute(image, NODE_ID, &id_item);
            id_item.string = "dragArea";
            nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);
            nodeAPI->addChild(Column, image);
            nodeAPI->addChild(Column, dragArea);
            nodeAPI->registerNodeEventReceiver(&OnEventReceive);
 
        std::string id(xComponentID);
        OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), Column);
        napi_value exports;
        if (napi_create_object(env, &exports) != napi_ok) {
            napi_throw_type_error(env, nullptr, "napi_create_object failed");
            return nullptr;
        }
 
        return exports;
    }
} // namespace ArkUICapiTest