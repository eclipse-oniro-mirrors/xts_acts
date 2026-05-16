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

#include "drag_getXY.h"
#include "../manager/plugin_manager.h"
#include <string>

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetXY", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GetXY", "OnEventReceive: event is null");
        return;
    }

    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GetXY", "OnEventReceive : %{public}p", dragEvent);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    float windowX = OH_ArkUI_DragEvent_GetTouchPointXToWindow(dragEvent);
    float windowY = OH_ArkUI_DragEvent_GetTouchPointYToWindow(dragEvent);
    float displayX = OH_ArkUI_DragEvent_GetTouchPointXToDisplay(dragEvent);
    float displayY = OH_ArkUI_DragEvent_GetTouchPointYToDisplay(dragEvent);
    float touchPointX = OH_ArkUI_DragEvent_GetPreviewTouchPointX(dragEvent);
    float touchPointY = OH_ArkUI_DragEvent_GetPreviewTouchPointY(dragEvent);
    float velocityX = OH_ArkUI_DragEvent_GetVelocityX(dragEvent);
    float velocityY = OH_ArkUI_DragEvent_GetVelocityY(dragEvent);
    float velocity = OH_ArkUI_DragEvent_GetVelocity(dragEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY",
                 "Drag getXY windowX : %{public}f windowY : %{public}f", windowX, windowY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY",
                 "Drag getXY displayX : %{public}f displayY : %{public}f", displayX, displayY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY",
                 "Drag getXY TouchPointX : %{public}f TouchPointY : %{public}f", touchPointX, touchPointY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY",
                 "Drag getXY VelocityX : %{public}f VelocityY : %{public}f", velocityX, velocityY);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY", "Drag getXY Velocity : %{public}f ", velocity);

    if (windowX >= 0 && windowY >= 0 && displayX >= 0 && displayY >= 0 && touchPointX >= 0 && touchPointY >= 0 &&
         velocityX >= 0 && velocityY >= 0 && velocity >= 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value GetXYTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "getXY", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "getXY", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem LABEL_Item = {.string = "drag_getXY Test"};
    ArkUI_NumberValue fontSize[] = {20};
    ArkUI_AttributeItem Font_Item = {fontSize, 1};
    ArkUI_NumberValue marginValue[] = {20};
    ArkUI_AttributeItem marginItem = {marginValue, 1};
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &LABEL_Item);
    nodeAPI->setAttribute(text, NODE_TEXT_FONT, &Font_Item);
    nodeAPI->setAttribute(text, NODE_MARGIN, &marginItem);
    nodeAPI->registerNodeEvent(text, NODE_ON_DRAG_START, 1, nullptr);
    OH_ArkUI_SetNodeDraggable(text, true);

    auto dragArea = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue heightValue1[] = {150};
    ArkUI_AttributeItem heightItem = {heightValue1, 1};
    ArkUI_NumberValue widthValue[] = {200};
    ArkUI_AttributeItem widthItem = {widthValue, 1};
    ArkUI_NumberValue borderValue[] = {1};
    ArkUI_AttributeItem borderItem = {borderValue, 1};
    nodeAPI->setAttribute(dragArea, NODE_WIDTH, &widthItem);
    nodeAPI->setAttribute(dragArea, NODE_HEIGHT, &heightItem);
    nodeAPI->setAttribute(dragArea, NODE_BORDER_WIDTH, &borderItem);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DROP, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_ENTER, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_MOVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_LEAVE, 1, nullptr);
    nodeAPI->registerNodeEvent(dragArea, NODE_ON_DRAG_END, 1, nullptr);

    ArkUI_AttributeItem id_item = {};
    id_item.string = "getXYTest";
    nodeAPI->setAttribute(text, NODE_ID, &id_item);
    id_item.string = "dragArea";
    nodeAPI->setAttribute(dragArea, NODE_ID, &id_item);

    nodeAPI->addChild(column, text);
    nodeAPI->addChild(column, dragArea);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
         INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "getXY",
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