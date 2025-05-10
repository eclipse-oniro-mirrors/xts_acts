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

#include "customdialog_test.h"
#include "../manager/plugin_manager.h"
#include <arkui/native_dialog.h>
#include <arkui/native_type.h>
#include "common/common.h"

namespace ArkUICapiTest {

#define COLOR_MASK 0x77550000
#define ON_CLICK_EVENT_ID_1 1001
#define ON_CLICK_EVENT_ID_2 1002
ArkUI_NativeDialogHandle dialog_global;

static auto setWidth(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float width)
{
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    return nodeHandle;
}

static auto setHeight(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float height)
{
    ArkUI_NumberValue height_value[] = {{.f32 = height}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);
    return nodeHandle;
}

static auto setWidthPercent(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float width)
{
    ArkUI_NumberValue width_value[] = {{.f32 = width}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &width_item);
    return nodeHandle;
}

static auto setMargin(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float margin)
{
    ArkUI_NumberValue margin_value[] = {{.f32 = margin}};
    ArkUI_AttributeItem margin_item = {margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);
    return nodeHandle;
}

static auto setHeightPercent(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, float height)
{
    ArkUI_NumberValue height_value[] = {{.f32 = height}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT_PERCENT, &height_item);
    return nodeHandle;
}

static auto setBackgroundColor(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle nodeHandle, uint32_t color)
{
    ArkUI_NumberValue color_value[] = {{.u32 = color}};
    ArkUI_AttributeItem color_item = {color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color_item);
    return nodeHandle;
}

static auto setDialog(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle)
{
    nodeHandle = setWidth(nodeAPI, nodeHandle, SIZE_200);
    nodeHandle = setHeight(nodeAPI, nodeHandle, SIZE_300);
    nodeHandle = setBackgroundColor(nodeAPI, nodeHandle, COLOR_RED);
    return nodeHandle;
}

static auto setId(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id)
{
    ArkUI_AttributeItem id_item = {};
    id_item.string = id;
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);
    return nodeHandle;
}

static auto setButton(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle, const char *id)
{
    nodeHandle = setWidth(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = setHeight(nodeAPI, nodeHandle, SIZE_30);
    nodeHandle = setBackgroundColor(nodeAPI, nodeHandle, COLOR_YELLOW);
    nodeHandle = setMargin(nodeAPI, nodeHandle, PARAM_1);
    nodeHandle = setId(nodeAPI, nodeHandle, id);
    return nodeHandle;
}

static auto setColumn(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_NodeHandle &nodeHandle)
{
    nodeHandle = setWidthPercent(nodeAPI, nodeHandle, PARAM_1);
    nodeHandle = setHeightPercent(nodeAPI, nodeHandle, PARAM_1);
    nodeHandle = setBackgroundColor(nodeAPI, nodeHandle, COLOR_RED);
    return nodeHandle;
}

static  bool OnWillDismissEvent(int32_t reason)
{
    if (reason == DIALOG_DISMISS_TOUCH_OUTSIDE) {
        ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);
        if (dialog_global) {
            dialogAPI->close(dialog_global);
        }
        return true;
    }
    return true;
}

static void OnEventReceiveCustomDialog(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);

    if (eventId == ON_CLICK_EVENT_ID_1) {
        auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        column1 = setId(nodeAPI, column1, "columnSetAutoCancel");
        column1 = setDialog(nodeAPI, column1);
        auto customDialog = dialogAPI->create();
        dialogAPI->setContent(customDialog, column1);
        dialogAPI->setAutoCancel(customDialog, true);
        dialogAPI->setModalMode(customDialog, false);
        dialogAPI->show(customDialog, false);
    } else if (eventId == ON_CLICK_EVENT_ID_2) {
        auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        column1 = setId(nodeAPI, column1, "columnRegisterOnWillDismiss");
        column1 = setDialog(nodeAPI, column1);
        auto customDialog = dialogAPI->create();
        dialogAPI->setContent(customDialog, column1);
        ArkUI_Rect maskRect = {};
        maskRect.x = PARAM_0;
        maskRect.y = PARAM_0;
        maskRect.width = SIZE_500;
        maskRect.height = SIZE_800;
        dialogAPI->setMask(customDialog, COLOR_MASK, &maskRect);
        dialog_global = customDialog;
        dialogAPI->registerOnWillDismiss(customDialog, &OnWillDismissEvent);
        dialogAPI->show(customDialog, false);
    }
}

napi_value CustomDialogTest::CreateNativeNodeSetAutoCancel(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest", "CreateNativeNodeSetAutoCancel");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(row1, button1);

    column = setColumn(nodeAPI, column);
    button1 = setButton(nodeAPI, button1, "buttonSetAutoCancel");
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, ON_CLICK_EVENT_ID_2, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveCustomDialog);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value CustomDialogTest::CreateNativeNodeRegisterOnWillDismiss(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest", "CreateNativeNodeSetAutoCancel");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_NativeDialogAPI_1 *dialogAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_DIALOG, ArkUI_NativeDialogAPI_1, dialogAPI);

    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(row1, button1);

    column = setColumn(nodeAPI, column);
    button1 = setButton(nodeAPI, button1, "buttonRegisterOnWillDismiss");
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK, ON_CLICK_EVENT_ID_1, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceiveCustomDialog);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CustomDialogTest",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest