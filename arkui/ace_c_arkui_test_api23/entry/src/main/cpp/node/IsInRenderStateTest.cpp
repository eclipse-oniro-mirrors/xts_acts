/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "../manager/PluginManagerTest.h"
#include "IsInRenderStateTest.h"
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <string>

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestIsInRenderState001", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestIsInRenderState001",
            "OnEventReceive: event is null");
        return;
    }
    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (targetId == 0) {
        bool isOnRenderTree = false;
        auto result = OH_ArkUI_NativeModule_IsInRenderState(node, &isOnRenderTree);
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh on render tree state is %{public}d", isOnRenderTree);
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "wjh on render tree state is %{public}d", result);
        if (result == ARKUI_ERROR_CODE_NO_ERROR && isOnRenderTree == true) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}
 
napi_value IsInRenderStateTest::TestIsInRenderState001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestIsInRenderState001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestIsInRenderState001",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item = {.string = "onClick"};
    nodeAPI->setAttribute(button, NODE_BUTTON_LABEL, &button_item);
    ArkUI_AttributeItem button_id = {.string = "btn_onClick_id"};
    nodeAPI->setAttribute(button, NODE_ID, &button_id);
    nodeAPI->addChild(column, button);
    
    nodeAPI->registerNodeEvent(button, NODE_ON_CLICK, 0, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestIsInRenderState001",
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