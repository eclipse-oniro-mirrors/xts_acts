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
#include "ConvertPositionFromWindowTest.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <string>

static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;

namespace ArkUICapiTest {

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestConvertPositionFromWindow001", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestConvertPositionFromWindow001",
            "OnEventReceive: event is null");
        return;
    }

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);
    auto node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (targetId == 0) {
        int posX = 0;
        int posY = 0;
        ArkUI_IntOffset position1 = {posX, posY};
        ArkUI_IntOffset pos1;
        auto result1 = OH_ArkUI_NativeModule_ConvertPositionFromWindow(node, position1, &pos1);
        OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "zlk result1 is %{public}d", result1);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager",
                     "kkk  OH_ArkUI_NativeModule_ConvertPositionFromWindow: %{public}d-%{public}d", pos1.x, pos1.y);
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
            sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        if (result1 == ARKUI_ERROR_CODE_NO_ERROR) {
            nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &background_color_item);
        }
    }
}

static ArkUI_NodeHandle CreateChildNode(ArkUI_NativeNodeAPI_1 *nodeAPI)
{
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item5 = {.string = "5"};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &button_item5);
    ArkUI_AttributeItem button_id5 = {.string = "btn_onClick5_id"};
    nodeAPI->setAttribute(button5, NODE_ID, &button_id5);
    nodeAPI->addChild(column, button5);

    ArkUI_NodeHandle button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item1 = {.string = "1"};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &button_item1);
    ArkUI_AttributeItem button_id1 = {.string = "btn_onClick1_id"};
    nodeAPI->setAttribute(button1, NODE_ID, &button_id1);
    nodeAPI->addChild(column, button1);

    ArkUI_NodeHandle button9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    ArkUI_AttributeItem button_item9 = {.string = "9"};
    nodeAPI->setAttribute(button9, NODE_BUTTON_LABEL, &button_item9);
    ArkUI_AttributeItem button_id9 = {.string = "btn_onClick9_id"};
    nodeAPI->setAttribute(button9, NODE_ID, &button_id9);

    ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
    ArkUI_AttributeItem background_color_item = {background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
    int posX = 0;
    int posY = 0;
    ArkUI_IntOffset position2 = {posX, posY};
    ArkUI_IntOffset *pos3 = nullptr;
    ArkUI_IntOffset pos1;
    auto result1 = OH_ArkUI_NativeModule_ConvertPositionFromWindow(button1, position2, pos3);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "zlk result1 is %{public}d", result1);
    if (result1 == ARKUI_ERROR_CODE_PARAM_INVALID) {
        nodeAPI->setAttribute(button1, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    auto result9 = OH_ArkUI_NativeModule_ConvertPositionFromWindow(button9, position2, &pos1);
    OH_LOG_Print(LOG_APP, LOG_INFO, 1, "event", "zlk result9 is %{public}d", result9);
    if (result9 == ARKUI_ERROR_CODE_NODE_NOT_ON_MAIN_TREE) {
        nodeAPI->setAttribute(button9, NODE_BACKGROUND_COLOR, &background_color_item);
    }
    nodeAPI->addChild(column, button9);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK, 0, nullptr);
    return column;
}

napi_value ConvertPositionFromWindowTest::TestConvertPositionFromWindow001(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TestConvertPositionFromWindow001", "CreateNativeNode");
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestConvertPositionFromWindow001",
            "GetContext env or info is null");
        return nullptr;
    }
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto column = CreateChildNode(nodeAPI);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestConvertPositionFromWindow001",
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