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

#include "node_tree_xcomponent_test.h"
#include "../manager/plugin_manager.h"
#include "common/common.h"
#include <string>

namespace ArkUICapiTest {

static char g_xComponentDetachID[PARAM_64] = {PARAM_0};
static ArkUI_NodeHandle g_parentColumnDetach = nullptr;

static ArkUI_NodeHandle CreateChildNodeXComponent(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON);

    ArkUI_NumberValue button_length_value[] = {{.f32 = SIZE_100}};
    ArkUI_AttributeItem button_length_item = {button_length_value,
                                              sizeof(button_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(button, NODE_WIDTH, &button_length_item);
    nodeAPI->setAttribute(button, NODE_HEIGHT, &button_length_item);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_RED}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
                                                 sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};

    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &background_color_item);

    return button;
}

static void OnEventReceiveXComponent(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_TOUCH_EVENT_ID) {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    }
}

napi_value NodeTreeXComponentTest::CreateNativeNodeXComponent(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "CreateNativeNodeXComponent");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeXComponent(nodeAPI);
    nodeAPI->addChild(column, button);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "NodeTreeXComponent";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    std::string id(xComponentID);
    ASSERT_EQ(OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column),
              SUCCESS);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveXComponent);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, ON_TOUCH_EVENT_ID, nullptr);

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

static void OnEventReceiveXComponentDetach(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive: event is null");
        return;
    }

    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "OnEventReceive eventId: %{public}d",
                 eventId);

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);

    if (eventId == ON_TOUCH_EVENT_ID) {
        std::string id(g_xComponentDetachID);
        if (OH_NativeXComponent_DetachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
            g_parentColumnDetach) == SUCCESS) {
            ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
            ArkUI_AttributeItem background_color_item = {background_color_value,
                                                         sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
            nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        } else {
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest",
                         "OH_NativeXComponent_DetachNativeRootNode failed");
        }
    }
}

napi_value NodeTreeXComponentTest::CreateNativeNodeXComponentDetach002(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "CreateNativeNodeXComponentDetach002");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeXComponent(nodeAPI);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "NodeTreeXComponentDetach";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);
    nodeAPI->addChild(column, button);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveXComponentDetach);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeXComponent401",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value NodeTreeXComponentTest::CreateNativeNodeXComponentDetach001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "CreateNativeNodeXComponentDetach001");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    napi_get_value_string_utf8(env, args[PARAM_0], g_xComponentDetachID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    g_parentColumnDetach = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    std::string id(g_xComponentDetachID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        g_parentColumnDetach) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeXComponent401",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value NodeTreeXComponentTest::CreateNativeNodeXComponent401(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "CreateNativeNodeXComponent");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeXComponent(nodeAPI);
    nodeAPI->addChild(column, button);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "NodeTreeXComponent401";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveXComponent);

    std::string id(xComponentID);
    auto ret = OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Detach002", "Detach002 = %{public}d", ret);
    ASSERT_EQ(ret, PARAM_NEGATIVE_2);
    
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeXComponent401",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

napi_value NodeTreeXComponentTest::CreateNativeNodeXComponentDetach401(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "CreateNativeNodeXComponent");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "NodeTreeXComponentTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto button = CreateChildNodeXComponent(nodeAPI);
    nodeAPI->addChild(column, button);
    ArkUI_AttributeItem id_item = {};
    id_item.string = "NodeTreeXComponentDetach401";
    nodeAPI->setAttribute(button, NODE_ID, &id_item);

    nodeAPI->registerNodeEventReceiver(&OnEventReceiveXComponent);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "CreateNativeNodeXComponentDetach401",
                     "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    auto ret = OH_NativeXComponent_DetachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
        nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Detach401", "Detach401 = %{public}d", ret);
    ASSERT_EQ(ret, PARAM_NEGATIVE_2);

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest