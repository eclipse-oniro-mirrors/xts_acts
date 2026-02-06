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
 
#include "MonopolizeTest.h"
#include "../manager/PluginManagerTest.h"
#include <string>
#include <arkui/drag_and_drop.h>
#include <arkui/native_dialog.h>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/ui_input_event.h>
#include <cstddef>
#include <cstdint>
#include <hilog/log.h>

namespace ArkUICapiTest {
static ArkUI_NodeHandle text = nullptr;
static ArkUI_NodeHandle text0 = nullptr;
static ArkUI_NodeHandle text1 = nullptr;
static ArkUI_NodeHandle text2 = nullptr;
static int g_event0 = 0;
static int g_event1 = 1;
static int g_event2 = 2;
static int g_event3 = 3;
static int g_event4 = 4;
static int g_event5 = 5;

void SetWidthMonopolize(ArkUI_NodeHandle &node, float width)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue widthValue[] = {width};
    ArkUI_AttributeItem item_width = {widthValue, sizeof(width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_WIDTH_PERCENT, &item_width);
}

void SetHeightMonopolize(ArkUI_NodeHandle &node, float height)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue heightValue[] = {height};
    ArkUI_AttributeItem item_height = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_HEIGHT_PERCENT, &item_height);
}

void SetContentMonopolize(ArkUI_NodeHandle &node, std::string content)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem contentValue;
    contentValue.string = content.c_str();
    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &contentValue);
}

void SetMonopolize(ArkUI_NodeHandle &node, int32_t monopolize)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue monopolizeValue[] = {{.i32 = monopolize}};
    ArkUI_AttributeItem item_monopolize = {.value = monopolizeValue, 1};
    auto errorCode = nodeAPI->setAttribute(node, NODE_MONOPOLIZE_EVENTS, &item_monopolize);
    
    auto message = nodeAPI->getAttribute(node, NODE_MONOPOLIZE_EVENTS);
    auto value_monopolize = message->value[0].i32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  MONOPOLIZE: %{public}d", value_monopolize);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  errorCode: %{public}d", errorCode);
    SetContentMonopolize(text2, std::to_string(errorCode));
}

void SetIdMonopolize(ArkUI_NodeHandle &node, std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
}

ArkUI_NodeHandle SetButtonNodeMonopolize(std::string id, int32_t targetId)
{
    float mMargin = 10;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {mMargin};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
    nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);
    SetIdMonopolize(node, id);
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    return node;
}

ArkUI_NodeHandle SetTextNodeMonopolize(std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    SetIdMonopolize(node, id);
    SetContentMonopolize(node, "null message");
    return node;
}

ArkUI_NodeHandle CreateTestNodeMonopolize()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto mHeight = 0.8;
    auto mWidth = 0.1;
    float mMargin = 10;
    ArkUI_NumberValue value3[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3)/ sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item3);
    
    ArkUI_NumberValue marginValue[] = {mMargin};
    ArkUI_AttributeItem item_margin = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_MARGIN, &item_margin);
    
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item_color);
    SetWidthMonopolize(column, mHeight);
    SetHeightMonopolize(column, mWidth);
    SetIdMonopolize(column, "touchIt");
    SetMonopolize(column, 0);
    nodeAPI->registerNodeEvent(column, NODE_TOUCH_EVENT, g_event0, nullptr);
    
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == g_event0) {
        SetContentMonopolize(text1, "CHILD_EVENT");
    }
    if (eventId == g_event1) {
        SetContentMonopolize(text0, "FATHER_EVENT");
    }
    if (eventId == g_event2) {
        SetMonopolize(text, 0);
    } else if (eventId == g_event3) {
        SetMonopolize(text, 1);
    } else if (eventId == g_event4) {
        auto errorCode = nodeAPI->setAttribute(text, NODE_MONOPOLIZE_EVENTS, nullptr);
        SetContentMonopolize(text2, std::to_string(errorCode));
    } else if (eventId == g_event5) {
        SetContentMonopolize(text0, "null message");
        SetContentMonopolize(text1, "null message");
    }
}

napi_value MonopolizeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column_test = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column_test, NODE_BACKGROUND_COLOR, &item_color);
    nodeAPI->registerNodeEvent(column_test, NODE_TOUCH_EVENT, g_event1, nullptr);
    nodeAPI->addChild(column, column_test);
    
    text = CreateTestNodeMonopolize();
    nodeAPI->addChild(column_test, text);
    
    text0 = SetTextNodeMonopolize("father");
    text1 = SetTextNodeMonopolize("child");
    text2 = SetTextNodeMonopolize("errorCode");
    nodeAPI->addChild(column_test, text0);
    nodeAPI->addChild(column_test, text1);
    nodeAPI->addChild(column_test, text2);
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, row2);
    
    auto button = SetButtonNodeMonopolize("false", g_event2);
    nodeAPI->addChild(row1, button);
    auto button2 = SetButtonNodeMonopolize("true", g_event3);
    nodeAPI->addChild(row1, button2);
    auto button3 = SetButtonNodeMonopolize("nullptr", g_event4);
    nodeAPI->addChild(row1, button3);
    auto button4 = SetButtonNodeMonopolize("clear", g_event5);
    nodeAPI->addChild(row2, button4);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}
