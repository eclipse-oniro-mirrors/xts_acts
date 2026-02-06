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

#include "FocusControlTest.h"
#include <arkui/native_interface_focus.h>
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_key_event.h>
#include <arkui/ui_input_event.h>

namespace FocusControlTest {

ArkUI_NodeHandle button2;
ArkUI_NodeHandle button;
ArkUI_NodeHandle button4x;
ArkUI_NodeHandle button1xx;
static void OnEventReceive(ArkUI_NodeEvent *event)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive");
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive: event is null");
        return;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == ON_CLICK_EVENT_ID) {
        auto buttonContext2 = OH_ArkUI_GetContextByNode(button2);
        OH_ArkUI_FocusActivate(buttonContext2, true, true);
    } else {
        ArkUI_NumberValue background_color_value[] = {{.u32 = COLOR_GREEN}};
        ArkUI_AttributeItem background_color_item = {background_color_value,
                                                     sizeof(background_color_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "FocusControlTest", "OnEventReceive change color");
    }
}

napi_value FocusControlTest_001(napi_env env, napi_callback_info info)
{
    // 1. 基本参数检查
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_001", "Invalid env or info");
        return nullptr;
    }
    // 2. 获取NativeNodeAPI接口
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_001", "Failed to get NodeAPI");
        return nullptr;
    }
    // 3. 创建单个可聚焦按钮节点
    auto button = nodeAPI->createNode(ARKUI_NODE_BUTTON); // 使用BUTTON节点（默认可聚焦）
    // 3.1 设置节点属性
    ArkUI_AttributeItem attrId = {.string = "testButton"};
    nodeAPI->setAttribute(button, NODE_ID, &attrId);
    // 4. 注册焦点事件
    nodeAPI->registerNodeEvent(button, NODE_ON_FOCUS, ON_FOCUS_EVENT_ID, nullptr);
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    // 5. 请求焦点
    int32_t focusResult = OH_ArkUI_FocusRequest(button);
    if (focusResult != ARKUI_ERROR_CODE_NO_ERROR) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "FocusControlTest_001",
                     "FocusRequest returned: %{public}d", focusResult);
    }
    // 6. 返回成功码
    napi_value retValue;
    napi_create_int32(env, focusResult == ARKUI_ERROR_CODE_NO_ERROR ? 0 : 1, &retValue);
    return retValue;
}

napi_value FocusControlTest_002(napi_env env, napi_callback_info info)
{
    // 1. 基础检查
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_002", "Invalid parameters");
        return nullptr;
    }
    // 2. 获取NodeAPI
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_002", "Get NodeAPI failed");
        return nullptr;
    }
    // 3. 创建不可聚焦节点（使用正确的节点类型）
    auto nonFocusableNode = nodeAPI->createNode(ARKUI_NODE_TEXT);
    // 4. 尝试获取焦点（预期会失败）
    int32_t focusResult = OH_ArkUI_FocusRequest(nonFocusableNode);
    // 5. 验证确实返回了预期的错误码
    if (focusResult != ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE) {
        OH_LOG_Print(LOG_APP, LOG_WARN, LOG_PRINT_DOMAIN, "FocusControlTest_002",
                     "Unexpected focus result: %{public}d", focusResult);
    }
    // 7. 返回目标错误码
    napi_value retValue;
    napi_create_int32(env, focusResult == ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE ? 0 : 1, &retValue);
    return retValue;
}

napi_value FocusControlTest_003(napi_env env, napi_callback_info info)
{
    // 1. 参数校验
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003", "Invalid parameters");
        return nullptr;
    }
    // 2. 获取NativeNodeAPI
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003", "Failed to get NodeAPI");
        return nullptr;
    }
    // 3. 创建Column节点并明确设置为不可聚焦
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue focusValue = { .i32 = 0 }; // 0表示不可聚焦
    ArkUI_AttributeItem focusAttr = { .value = &focusValue, .size = 1 };
    nodeAPI->setAttribute(column, NODE_FOCUSABLE, &focusAttr);
    // 4. 创建子节点并设置为可聚焦
    auto child = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    focusValue.i32 = 1; // 1表示可聚焦
    nodeAPI->setAttribute(child, NODE_FOCUSABLE, &focusAttr);
    nodeAPI->addChild(column, child);
    // 5. 请求子节点的焦点（预期会因不可聚焦祖先而失败）
    int32_t focusResult = OH_ArkUI_FocusRequest(child);
    // 6. 验证返回的错误码
    if (focusResult != ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "FocusControlTest_003",
                     "Expected 150004 (NON_FOCUSABLE_ANCESTOR), but got: %{public}d", focusResult);
    }
    // 7. 清理资源
    if (nodeAPI->disposeNode) {
        nodeAPI->disposeNode(child);
        nodeAPI->disposeNode(column);
    }
    // 8. 返回结果
    napi_value retValue;
    napi_create_int32(env, focusResult == ARKUI_ERROR_CODE_FOCUS_NON_FOCUSABLE_ANCESTOR ? 0 : 1, &retValue);
    return retValue;
}

napi_value FocusControlTest_004(napi_env env, napi_callback_info info)
{
    ArkUI_NodeHandle invalidNode = nullptr;
    int32_t focusResult = OH_ArkUI_FocusRequest(invalidNode);
    napi_value retValue;
    napi_create_int32(env, focusResult == ARKUI_ERROR_CODE_FOCUS_NON_EXISTENT ? 0 : 1, &retValue);
    return retValue;
}
} // namespace ArkUICapiTest