/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "common/common.h"
#include "../manager/plugin_manager.h"
#include "get_window_info_test.h"
#include <arkui/native_node.h>
#include <string>

ArkUI_NativeNodeAPI_1 *nodeAPI2 = nullptr;
ArkUI_NodeHandle button_visibility = nullptr;
static int NUMBER_0 = 0;
static int NUMBER_1 = 1;
static int NUMBER_2 = 2;

namespace ArkUICapiTest {
static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建bt0
    ArkUI_NodeHandle bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt0_item = {.string = "no error"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    ArkUI_AttributeItem bt0_id = {.string = "button_id0"};
    nodeAPI->setAttribute(bt0, NODE_ID, &bt0_id);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, NUMBER_0, nullptr);
    // 创建bt1
    ArkUI_NodeHandle bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt1_item = {.string = "invalid"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    ArkUI_AttributeItem bt1_id = {.string = "button_id1"};
    nodeAPI->setAttribute(bt1, NODE_ID, &bt1_id);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, NUMBER_1, nullptr);
    // 创建bt2
    ArkUI_NodeHandle bt2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt2_item = {.string = "same id"};
    nodeAPI->setAttribute(bt2, NODE_BUTTON_LABEL, &bt2_item);
    ArkUI_AttributeItem bt2_id = {.string = "button_id2"};
    nodeAPI->setAttribute(bt2, NODE_ID, &bt2_id);
    nodeAPI->registerNodeEvent(bt2, NODE_ON_CLICK, NUMBER_2, nullptr);
    nodeAPI->addChild(column, bt0);
    nodeAPI->addChild(column, bt1);
    nodeAPI->addChild(column, bt2);
    return column;
}

static ArkUI_NodeHandle CreateChildNode1(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建bt0
    ArkUI_NodeHandle bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt0_item = {.string = "get window name"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    ArkUI_AttributeItem bt0_id = {.string = "button_id0"};
    nodeAPI->setAttribute(bt0, NODE_ID, &bt0_id);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, NUMBER_0, nullptr);
    nodeAPI->addChild(column, bt0);
    return column;
}

static ArkUI_NodeHandle CreateChildNode2(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    // column
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    // 创建button
    button_visibility = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item = {.string = "visibility"};
    nodeAPI->setAttribute(button_visibility, NODE_BUTTON_LABEL, &button_item);
    // 创建bt0
    ArkUI_NodeHandle bt0 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt0_item = {.string = "visible"};
    nodeAPI->setAttribute(bt0, NODE_BUTTON_LABEL, &bt0_item);
    ArkUI_AttributeItem bt0_id = {.string = "button_id0"};
    nodeAPI->setAttribute(bt0, NODE_ID, &bt0_id);
    nodeAPI->registerNodeEvent(bt0, NODE_ON_CLICK, NUMBER_0, nullptr);
    // 创建bt1
    ArkUI_NodeHandle bt1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt1_item = {.string = "none"};
    nodeAPI->setAttribute(bt1, NODE_BUTTON_LABEL, &bt1_item);
    ArkUI_AttributeItem bt1_id = {.string = "button_id1"};
    nodeAPI->setAttribute(bt1, NODE_ID, &bt1_id);
    nodeAPI->registerNodeEvent(bt1, NODE_ON_CLICK, NUMBER_1, nullptr);
    // 创建bt2
    ArkUI_NodeHandle bt2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem bt2_item = {.string = "hidden"};
    nodeAPI->setAttribute(bt2, NODE_BUTTON_LABEL, &bt2_item);
    ArkUI_AttributeItem bt2_id = {.string = "button_id2"};
    nodeAPI->setAttribute(bt2, NODE_ID, &bt2_id);
    nodeAPI->registerNodeEvent(bt2, NODE_ON_CLICK, NUMBER_2, nullptr);
    nodeAPI->addChild(column, button_visibility);
    nodeAPI->addChild(column, bt0);
    nodeAPI->addChild(column, bt1);
    nodeAPI->addChild(column, bt2);
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testGetWindowInfo001", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testGetWindowInfo001",
            "OnEventReceive: event is null");
        return;
    }
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (targetId == NUMBER_0) {
        ArkUI_HostWindowInfo *info;
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(node, &info);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (targetId == NUMBER_1) {
        ArkUI_HostWindowInfo *info;
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(nullptr, &info);
        if (errorCode == ARKUI_ERROR_CODE_PARAM_INVALID) {
            nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
    if (targetId == NUMBER_2) {
        ArkUI_HostWindowInfo *info;
        ArkUI_NodeHandle button = nodeAPI2->createNode(ARKUI_NODE_BUTTON);
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(button, &info);
        if (errorCode == ARKUI_ERROR_CODE_NODE_NOT_ON_MAIN_TREE) {
            nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value GetWindowInfoTest::testGetWindowInfo001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testNodeHandleByIdTest001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testNodeHandleByIdTest001",
            "GetContext env or info is null");
        return nullptr;
    }
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI2);
    static ArkUI_NodeHandle root = CreateChildNode(nodeAPI2);
    nodeAPI2->registerNodeEventReceiver(&OnEventReceive);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive1(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testHostWindowInfoGetName002", "OnEventReceive1");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testHostWindowInfoGetName002",
            "OnEventReceive1: event is null");
        return;
    }
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (targetId == NUMBER_0) {
        ArkUI_HostWindowInfo *info;
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(node, &info);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            const char *windowName = OH_ArkUI_HostWindowInfo_GetName(info);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "kkk Get-window-name Node belongs to window:%{public}s", windowName);
            if (strcmp(windowName, "arkui_capi_xts_api150") == 0) {
                nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
            }
            OH_ArkUI_HostWindowInfo_Destroy(info);
        }
    }
}

napi_value GetWindowInfoTest::testHostWindowInfoGetName002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testHostWindowInfoGetNameTest002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testHostWindowInfoGetNameTest002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI2);
    static ArkUI_NodeHandle root = CreateChildNode1(nodeAPI2);
    nodeAPI2->registerNodeEventReceiver(&OnEventReceive1);
 
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testHostWindowInfoGetNameTest002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    ArkUI_HostWindowInfo *info;
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_0) {
        ArkUI_NumberValue visible_value[] = {{.i32 = ARKUI_VISIBILITY_VISIBLE}};
        ArkUI_AttributeItem visible_value_item = {visible_value, sizeof(visible_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI2->setAttribute(button_visibility, NODE_VISIBILITY, &visible_value_item);
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(button_visibility, &info);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            const char *windowName = OH_ArkUI_HostWindowInfo_GetName(info);
            if (strcmp(windowName, "arkui_capi_xts_api150") == 0) {
                nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
            }
            OH_ArkUI_HostWindowInfo_Destroy(info);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_1) {
        ArkUI_NumberValue visible_value[] = {{.i32 = ARKUI_VISIBILITY_NONE}};
        ArkUI_AttributeItem visible_value_item = {visible_value, sizeof(visible_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI2->setAttribute(button_visibility, NODE_VISIBILITY, &visible_value_item);
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(button_visibility, &info);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            const char *windowName = OH_ArkUI_HostWindowInfo_GetName(info);
            if (strcmp(windowName, "arkui_capi_xts_api150") == 0) {
                nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
            }
            OH_ArkUI_HostWindowInfo_Destroy(info);
        }
    }
    if (OH_ArkUI_NodeEvent_GetTargetId(event) == NUMBER_2) {
        ArkUI_NumberValue visible_value[] = {{.i32 = ARKUI_VISIBILITY_HIDDEN}};
        ArkUI_AttributeItem visible_value_item = {visible_value, sizeof(visible_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI2->setAttribute(button_visibility, NODE_VISIBILITY, &visible_value_item);
        int32_t errorCode = OH_ArkUI_NodeUtils_GetWindowInfo(button_visibility, &info);
        if (errorCode == ARKUI_ERROR_CODE_NO_ERROR) {
            const char *windowName = OH_ArkUI_HostWindowInfo_GetName(info);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
                "kkk Get-window-name Node belongs to window:%{public}s", windowName);
            if (strcmp(windowName, "arkui_capi_xts_api150") == 0) {
                nodeAPI2->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
            }
            OH_ArkUI_HostWindowInfo_Destroy(info);
        }
    }
}

napi_value GetWindowInfoTest::testHostWindowInfoDestroy003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testNodeHandleByIdTest001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testNodeHandleByIdTest001",
            "GetContext env or info is null");
        return nullptr;
    }
    
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI2);
    static ArkUI_NodeHandle root = CreateChildNode2(nodeAPI2);
    nodeAPI2->registerNodeEventReceiver(&OnEventReceive2);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), root) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
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