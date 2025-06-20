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
#include "custom_property_test.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <string>

static int NUMBER_2 = 2;
static int NUMBER_1006 = 1006;

namespace ArkUICapiTest {

napi_value CustomPropertyTest::testGetCustomProperty001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testAddCustomProperty001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testAddCustomProperty001",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);

    ArkUI_CustomProperty* customP;
    auto result = OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);
    if (result == ARKUI_ERROR_CODE_NO_ERROR) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
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

static void OnEventReceive2(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
            
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        auto parent =  OH_ArkUI_NodeUtils_GetParentInPageTree(pageNode);
        if (OH_ArkUI_NodeUtils_GetNodeType(parent) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CustomPropertyTest::testGetParentInPageTree002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive2);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive3(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        if (OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CustomPropertyTest::testGetActiveChildrenInfo003(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    
    nodeAPI->addChild(column, text);
    
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive4(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        if (OH_ArkUI_NodeUtils_GetNodeType(pageNode) == NUMBER_1006) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CustomPropertyTest::testGetCurrentPageRootNode004(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_NodeHandle text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive4);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value CustomPropertyTest::testIsCreatedByNDK005(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");

    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);

    bool isCapi = OH_ArkUI_NodeUtils_IsCreatedByNDK(column);
    if (isCapi) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value CustomPropertyTest::testGetNodeType006(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    
    if (OH_ArkUI_NodeUtils_GetNodeType(text) == 1) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value CustomPropertyTest::testCustomPropertyDestroy007(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_CustomProperty* customP;
    OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);

    auto result = OH_ArkUI_CustomProperty_GetStringValue(customP);
    if (strcmp(result, "aaa") == 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    
    OH_ArkUI_CustomProperty_Destroy(customP);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

napi_value CustomPropertyTest::testCustomPropertyGetStringValue008(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    
    ArkUI_NodeHandle column = nodeAPI -> createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    OH_ArkUI_NodeUtils_AddCustomProperty(column, "CustomValueA", "aaa");
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    ArkUI_CustomProperty* customP;
    OH_ArkUI_NodeUtils_GetCustomProperty(column, "CustomValueA", &customP);

    auto result = OH_ArkUI_CustomProperty_GetStringValue(customP);
    if (strcmp(result, "aaa") == 0) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(text, NODE_BACKGROUND_COLOR, &background_color_item);
    }

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive9(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
            OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        if (OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
        OH_ArkUI_ActiveChildrenInfo_Destroy(activeChildrenInfo);
    }
}

napi_value CustomPropertyTest::testActiveChildrenInfoDestroy009(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive9);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive10(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo);
        auto firstChild = OH_ArkUI_ActiveChildrenInfo_GetNodeByIndex(activeChildrenInfo, 1000);
        if (OH_ArkUI_NodeUtils_GetNodeType(firstChild) == 0) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CustomPropertyTest::testActiveChildrenInfoGetNodeByIndex010(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive10);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

static void OnEventReceive11(ArkUI_NodeEvent *event)
{
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (targetId == 1) {
        auto node = (ArkUI_NodeHandle)OH_ArkUI_NodeEvent_GetUserData(event);
        auto *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
        ArkUI_NodeHandle pageNode = OH_ArkUI_NodeUtils_GetCurrentPageRootNode(node);
        ArkUI_ActiveChildrenInfo* activeChildrenInfo;
        OH_ArkUI_NodeUtils_GetActiveChildrenInfo(pageNode, &activeChildrenInfo);
        
        if (OH_ArkUI_ActiveChildrenInfo_GetCount(activeChildrenInfo) == NUMBER_2) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

napi_value CustomPropertyTest::testActiveChildrenInfoGetCount011(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
            "GetContext env or info is null");
        return nullptr;
    }
    
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "columnA";
    nodeAPI->setAttribute(column, NODE_ID, &id_item);
    ArkUI_NodeHandle text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    id_item.string = "7";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &id_item);
    ArkUI_AttributeItem textId = {.string = "onClick"};
    nodeAPI->setAttribute(text, NODE_ID, &textId);
    nodeAPI->addChild(column, text);
    auto text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->addChild(column, text1);
    nodeAPI->registerNodeEvent(text, NODE_ON_CLICK, 1, text1);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive10);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "testRemoveCustomProperty002",
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