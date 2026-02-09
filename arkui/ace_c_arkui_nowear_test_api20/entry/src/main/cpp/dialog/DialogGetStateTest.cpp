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

#include <arkui/native_dialog.h>
#include <mutex>
#include <string>

#include "../manager/plugin_manager.h"
#include "DialogGetStateTest.h"

namespace ArkUICapiTest {
static ArkUI_NativeDialogHandle globalCustomDialog = nullptr;
static ArkUI_NativeDialogAPI_3* g_dialogAPI3 = nullptr;
static ArkUI_NativeNodeAPI_1* g_nodeAPI = nullptr;
static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle text1 = nullptr;
static ArkUI_NodeHandle text2 = nullptr;
static ArkUI_NodeHandle text3 = nullptr;
static ArkUI_NodeHandle text4 = nullptr;
static std::mutex g_dialogMutex;

static auto CreateButtonNode(bool enabled, const char* text, int32_t clickEventID, const char* idStr)
{
    auto nodeHandle = g_nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_AttributeItem textItem = { .string = text };
    g_nodeAPI->setAttribute(nodeHandle, NODE_BUTTON_LABEL, &textItem);
    ArkUI_NumberValue enable_value[] = { { .i32 = enabled } };
    ArkUI_AttributeItem enable_item = { enable_value, sizeof(enable_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_ENABLED, &enable_item);

    ArkUI_NumberValue width_value[] = { { .f32 = SIZE_100 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);
    g_nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &width_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = DEFAULT_MARGIN } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_AttributeItem id_item = { .string = idStr };
    g_nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);

    g_nodeAPI->registerNodeEvent(nodeHandle, NODE_ON_CLICK, clickEventID, nullptr);

    return nodeHandle;
}

static auto CreateTextNode(const char* idStr)
{
    auto nodeHandle = g_nodeAPI->createNode(ARKUI_NODE_TEXT);

    ArkUI_NumberValue width_value[] = { { .f32 = SIZE_100 } };
    ArkUI_AttributeItem width_item = { width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &width_item);

    ArkUI_NumberValue height_value[] = { { .f32 = SIZE_50 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &height_item);

    ArkUI_NumberValue margin_value[] = { { .f32 = DEFAULT_MARGIN } };
    ArkUI_AttributeItem margin_item = { margin_value, sizeof(margin_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_MARGIN, &margin_item);

    ArkUI_NumberValue color_value[] = { { .u32 = 0xFF0000FF } };
    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color_item);

    ArkUI_AttributeItem id_item = { .string = idStr };
    g_nodeAPI->setAttribute(nodeHandle, NODE_ID, &id_item);

    return nodeHandle;
}

static void SetTextNodeContent(ArkUI_NodeHandle& nodeHandle)
{
    std::lock_guard<std::mutex> lock(g_dialogMutex);
    if (!g_nodeAPI) {
        return;
    }
    ArkUI_DialogState state = ArkUI_DialogState::DIALOG_UNINITIALIZED;
    int32_t result = OH_ArkUI_CustomDialog_GetState(globalCustomDialog, &state);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "SetTextNodeInfo state is %{public}d", state);
    std::string stateStr = std::to_string(state);
    const char* info = stateStr.c_str();
    ArkUI_AttributeItem content = { .string = info };
    g_nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &content);
}

static void OnWillAppear(void* userData)
{
    SetTextNodeContent(text1);
}

static void OnDidAppear(void* userData)
{
    SetTextNodeContent(text2);
}

static void OnWillDisappear(void* userData)
{
    SetTextNodeContent(text3);
}

static void OnDidDisappear(void* userData)
{
    SetTextNodeContent(text4);
}

static void CreateDialog()
{
    if (!g_nodeAPI) {
        return;
    }
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "create Dialog");
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    g_dialogAPI3 = reinterpret_cast<ArkUI_NativeDialogAPI_3*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_DIALOG, "ArkUI_NativeDialogAPI_3"));
    if (!g_dialogAPI3) {
        return;
    }
    // 创建对话框内容
    auto column = g_nodeAPI->createNode(ARKUI_NODE_COLUMN);
    if (!column) {
        return;
    }
    // 创建对话框
    auto customDialog = g_dialogAPI3->nativeDialogAPI1.create();
    if (!customDialog) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Error", "customDialog is null");
        return;
    }
    int32_t ret = g_dialogAPI3->nativeDialogAPI1.setContent(customDialog, column);
    if (ret != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "ControllerTest", "setContent failed, ret = %{public}d ", ret);
    }
    globalCustomDialog = customDialog;

    g_dialogAPI3->registerOnWillAppear(globalCustomDialog, nullptr, OnWillAppear);
    g_dialogAPI3->registerOnDidAppear(globalCustomDialog, nullptr, OnDidAppear);
    g_dialogAPI3->registerOnWillDisappear(globalCustomDialog, nullptr, OnWillDisappear);
    g_dialogAPI3->registerOnDidDisappear(globalCustomDialog, nullptr, OnDidDisappear);
}

static void DestroyDialog()
{
    if (g_dialogAPI3 && globalCustomDialog) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CustomDialogTest", "destroy Dialog");
        g_dialogAPI3->nativeDialogAPI1.removeContent(globalCustomDialog);
        g_dialogAPI3->nativeDialogAPI1.close(globalCustomDialog);
        globalCustomDialog = nullptr;
        g_dialogAPI3 = nullptr;
    }
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DialogGetStateTest", "OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(
        LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateTest", "OnEventReceive eventId: %{public}d", eventId);
    if (eventId == ON_CLICK_EVENT_ID) {
        if (!g_dialogAPI3 || !globalCustomDialog) {
            CreateDialog();
        }
        g_dialogAPI3->nativeDialogAPI1.show(globalCustomDialog, true);
    }
    if (eventId == ON_CLICK_EVENT_ID2) {
        DestroyDialog();
    }
    if (eventId == ON_CLICK_EVENT_ID3) {
        SetTextNodeContent(text);
    }
}

static ArkUI_NodeHandle CreateTextInfoColumn()
{
    auto column = g_nodeAPI->createNode(ARKUI_NODE_COLUMN);

    text = CreateTextNode("text");
    text1 = CreateTextNode("text1");
    text2 = CreateTextNode("text2");
    text3 = CreateTextNode("text3");
    text4 = CreateTextNode("text4");

    g_nodeAPI->addChild(column, text);
    g_nodeAPI->addChild(column, text1);
    g_nodeAPI->addChild(column, text2);
    g_nodeAPI->addChild(column, text3);
    g_nodeAPI->addChild(column, text4);

    ArkUI_NumberValue height_value[] = { { .f32 = SIZE_300 } };
    ArkUI_AttributeItem height_item = { height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue) };
    g_nodeAPI->setAttribute(column, NODE_HEIGHT, &height_item);

    return column;
}

napi_value DialogGetStateTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DialogGetStateTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    if (!g_nodeAPI) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Error", "nodeAPI is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    auto column = g_nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto showButton = CreateButtonNode(true, "showDialog", ON_CLICK_EVENT_ID, "showButton");
    auto destroyButton = CreateButtonNode(true, "destroyDialog", ON_CLICK_EVENT_ID2, "destroyButton");
    auto queryButton = CreateButtonNode(true, "queryState", ON_CLICK_EVENT_ID3, "queryButton");
    g_nodeAPI->addChild(column, showButton);
    g_nodeAPI->addChild(column, destroyButton);
    g_nodeAPI->addChild(column, queryButton);

    auto infoColumn = CreateTextInfoColumn();

    g_nodeAPI->addChild(column, infoColumn);
    g_nodeAPI->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "DialogGetStateTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value DialogGetStateTest::GetStateErrorCode_001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest", "GetStateErrorCode_001");
    ArkUI_DialogState state = static_cast<ArkUI_DialogState>(-1);
    auto ret = OH_ArkUI_CustomDialog_GetState(globalCustomDialog, &state);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest",
                 "[GetStateErrorCode_001] dialog state is %{public}d", state);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest",
                 "[GetStateErrorCode_001] GetState ret %{public}d", ret);
    ASSERT_EQ(state, ArkUI_DialogState::DIALOG_DISAPPEARED);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value DialogGetStateTest::GetStateErrorCode_002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest", "GetStateErrorCode_002");
    ArkUI_DialogState state = static_cast<ArkUI_DialogState>(-1);
    auto ret = OH_ArkUI_CustomDialog_GetState(nullptr, &state);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest",
                 "[GetStateErrorCode_002] dialog state is %{public}d", state);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "DialogGetStateErrorCodeTest",
                 "[GetStateErrorCode_002] GetState ret %{public}d", ret);
    ASSERT_EQ(state, -1);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest