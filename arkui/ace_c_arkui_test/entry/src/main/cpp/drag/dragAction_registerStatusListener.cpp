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

#include "dragAction_registerStatusListener.h"
#include "../manager/plugin_manager.h"
#include <string>
#define TOUCHPOINTXY 200

namespace ArkUICapiTest {

ArkUI_DragStatus status;
ArkUI_DragEvent *arkuiDragEvent;
static auto createChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI, bool enabled)
{
    auto nodeHandle = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem LABEL_Item = {.string = "dragAction_RegisterStatusListener Test"};
    ArkUI_NumberValue fontSize[] = {20};
    ArkUI_AttributeItem Font_Item = {fontSize, 1};
    ArkUI_NumberValue marginValue[] = {20};
    ArkUI_AttributeItem marginItem = {marginValue, 1};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &LABEL_Item);
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_FONT, &Font_Item);
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &marginItem);
    nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_TOUCH_INTERCEPT, 1, nullptr);
    
    return nodeHandle;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragAction_RegisterStatusListenerTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "RegisterStatusListener", "OnEventReceive: event is null");
        return;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    auto dragAction = OH_ArkUI_CreateDragActionWithNode(nodeHandler);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "drag_RegisterStatusListener", "result:%{public}p", dragAction);

    auto returnValue = OH_ArkUI_DragAction_RegisterStatusListener(
        dragAction, nullptr, [](ArkUI_DragAndDropInfo *dragAndDropInfo, void *userData) -> void {
            status = OH_ArkUI_DragAndDropInfo_GetDragStatus(dragAndDropInfo);
            arkuiDragEvent = OH_ArkUI_DragAndDropInfo_GetDragEvent(dragAndDropInfo);
        });
    auto startDragReturnValue = OH_ArkUI_StartDrag(dragAction);

    if (dragAction != nullptr && returnValue != INVALID_PARAM && status != PARAM_NEGATIVE_1 &&
         arkuiDragEvent != nullptr && startDragReturnValue != INVALID_PARAM) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_ArkUI_DragAction_UnregisterStatusListener(dragAction);
    } else {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragAction_RegisterStatusListener",
                     "returnValue:%{public}d", returnValue);
    }
}

napi_value RegisterStatusListenerTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "dragAction_RegisterStatusListenerTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragAction_RegisterStatusListener",
                     "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto text1 = createChildNode(nodeAPI, true);
    auto text2 = createChildNode(nodeAPI, true);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "textDragTest1";
    nodeAPI->setAttribute(text1, NODE_ID, &id_item);
    id_item.string = "textDragTest2";
    nodeAPI->setAttribute(text2, NODE_ID, &id_item);

    nodeAPI->addChild(column, text1);
    nodeAPI->addChild(column, text2);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "dragAction_RegisterStatusListenerTest",
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