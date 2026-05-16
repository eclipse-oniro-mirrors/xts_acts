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
 
#include "FocusScopeTest.h"
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

static ArkUI_NodeHandle column1 = nullptr;
static ArkUI_NodeHandle column2 = nullptr;
static ArkUI_NodeHandle button00 = nullptr;
static ArkUI_NodeHandle button01 = nullptr;
static ArkUI_NodeHandle button02 = nullptr;
static ArkUI_NodeHandle button03 = nullptr;
static ArkUI_NodeHandle button04 = nullptr;
static size_t g_argc = PARAM_1;
static size_t g_length = PARAM_64;
static size_t g_strLength = PARAM_0;
static int g_event0 = 0;
static int g_event1 = 1;
static int g_event2 = 2;
static int g_event3 = 3;
static int g_event4 = 4;
static int g_event5 = 5;
static int g_event6 = 6;
static int g_event7 = 7;
static int g_event8 = 8;
static int g_event9 = 9;
static int g_event10 = 10;
static int g_event11 = 11;
static int g_event12 = 12;
static int g_event13 = 13;
static float g_height = 0.5;
static float g_width = 0.6;

void SetNodeWidth(ArkUI_NodeHandle &node, float width)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue widthValue[] = {width};
    ArkUI_AttributeItem item_width = {widthValue, sizeof(width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_WIDTH_PERCENT, &item_width);
}

void SetNodeHeight(ArkUI_NodeHandle &node, float height)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue heightValue[] = {height};
    ArkUI_AttributeItem item_height = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_HEIGHT_PERCENT, &item_height);
}

void SetNodeId(ArkUI_NodeHandle &node, std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
}

void SetLabel(ArkUI_NodeHandle &node, std::string content)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem contentValue;
    contentValue.string = content.c_str();
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &contentValue);
}

// 设置FocusId
int SetFocusId(ArkUI_NodeHandle &node, const char *id, int32_t isGroup, int32_t isArrow)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue focusValue[] = {{.i32 = isGroup}, {.i32 = isArrow}};
    ArkUI_AttributeItem focusItem = {.value = focusValue, 2, .string = id};
    auto errorCode = nodeAPI->setAttribute(node, NODE_FOCUS_SCOPE_ID, &focusItem);

    auto message = nodeAPI->getAttribute(node, NODE_FOCUS_SCOPE_ID);
    auto id0 = message->string;
    auto value0 = message->value[0].i32;
    auto value1 = message->value[1].i32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG:",
        "SetFocusScopeId  id = %{public}s, isgroup = %{public}d, arrow= %{public}d", id0, value0, value1);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  errorCode: %{public}d", errorCode);
    return errorCode;
}

// 设置FocusPriority
int SetFocusPriority(ArkUI_NodeHandle &node, const char *id, int32_t pri)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue focusValue[] = {{.i32 = pri}};
    ArkUI_AttributeItem focusItem = {.value = focusValue, 1, .string = id};
    auto errorCode = nodeAPI->setAttribute(node, NODE_FOCUS_SCOPE_PRIORITY, &focusItem);

    auto message1 = nodeAPI->getAttribute(node, NODE_FOCUS_SCOPE_PRIORITY);
    auto id0 = message1->string;
    auto value0 = message1->value[0].i32;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG:",
        "SetFocusPriority  id = %{public}s, FocusPriority = %{public}d", id0, value0);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  errorCode: %{public}d", errorCode);
    return errorCode;
}

//创建测试按钮节点
ArkUI_NodeHandle SetButtonNode(std::string id, int32_t targetId)
{
    float mMargin = 5;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    //调整按钮布局
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
    //按钮添加边距
    ArkUI_NumberValue margin[] = {mMargin};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
    nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    SetNodeId(node, id);
    return node;
}

ArkUI_NodeHandle CreateTestNode()
{
    float mHeight = 0.4;
    float mWidth = 0.8;
    float mMargin = 10;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    
    ArkUI_NumberValue value3[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item3);
    
    ArkUI_NumberValue marginValue[] = {mMargin};
    ArkUI_AttributeItem item_margin = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_MARGIN, &item_margin);
    
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item_color);
    SetNodeWidth(column, mWidth);
    SetNodeHeight(column, mHeight);
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    auto value2 = 2;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == g_event0) {
        SetLabel(button00, "0");
    } else if (eventId == g_event1) {
        SetFocusId(column1, "column1", 1, 0);
    } else if (eventId == g_event2) {
        SetFocusId(column1, "column1", 1, 1);
    } else if (eventId == g_event3) {
        SetFocusId(column1, "column1", 0, 1);
    } else if (eventId == g_event4) {
        SetLabel(button00, std::to_string(SetFocusId(column1, "", value2, value2)));
    } else if (eventId == g_event5) {
        SetFocusId(column1, "column1", 1, 1);
        SetFocusPriority(button02, "column1", ARKUI_FOCUS_PRIORITY_PRIOR);
    } else if (eventId == g_event6) {
        SetFocusId(column2, "column2", 1, 1);
        SetFocusPriority(button04, "column2", ARKUI_FOCUS_PRIORITY_AUTO);
    } else if (eventId == g_event7) {
        SetFocusId(column2, "column2", 1, 1);
        SetFocusPriority(button04, "column2", ARKUI_FOCUS_PRIORITY_PREVIOUS);
    } else if (eventId == g_event8) {
        SetFocusId(column1, "column1", 1, 1);
        SetLabel(button00, std::to_string(SetFocusPriority(button01, "column1", value2)));
    } else if (eventId == g_event9) {
        auto errorCode1 = nodeAPI->setAttribute(column1, NODE_FOCUS_SCOPE_ID, nullptr);
        SetLabel(button00, std::to_string(errorCode1));
    } else if (eventId == g_event10) {
        auto errorCode2 = nodeAPI->setAttribute(button01, NODE_FOCUS_SCOPE_PRIORITY, nullptr);
        SetLabel(button00, std::to_string(errorCode2));
    } else if (eventId == g_event11) {
        SetLabel(button00, "f3");
    } else if (eventId == g_event12) {
        SetLabel(button00, "f4");
    } else if (eventId == g_event13) {
        SetLabel(button00, "f2");
    }
}

static void TestNode(ArkUI_NodeHandle node)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    //测试按钮布局
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(node, row1);
    nodeAPI->addChild(node, row2);
    
    //更改测试参数的button
    auto button = SetButtonNode("1", g_event1);
    nodeAPI->addChild(row1, button);
    auto button2 = SetButtonNode("2", g_event2);
    nodeAPI->addChild(row1, button2);
    auto button3 = SetButtonNode("3", g_event3);
    nodeAPI->addChild(row1, button3);
    auto button4 = SetButtonNode("4", g_event4);
    nodeAPI->addChild(row1, button4);
    auto button5 = SetButtonNode("5", g_event5);
    nodeAPI->addChild(row1, button5);
    auto button6 = SetButtonNode("6", g_event6);
    nodeAPI->addChild(row2, button6);
    auto button7 = SetButtonNode("7", g_event7);
    nodeAPI->addChild(row2, button7);
    auto button8 = SetButtonNode("8", g_event8);
    nodeAPI->addChild(row2, button8);
    auto button9 = SetButtonNode("9", g_event9);
    nodeAPI->addChild(row2, button9);
    auto button10 = SetButtonNode("10", g_event10);
    nodeAPI->addChild(row2, button10);
}

napi_value FocusScopeTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info(env, info, &g_argc, args, nullptr, nullptr);
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, g_length, &g_strLength);

    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column_test = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetNodeWidth(column_test, g_width);
    SetNodeHeight(column_test, g_height);
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column_test, NODE_BACKGROUND_COLOR, &item_color);
    button00 = SetButtonNode("focusScopeTest", 0);
    ArkUI_NumberValue focus[] = {{.i32 = 1}};
    ArkUI_AttributeItem item_focus = {.value = focus, 1};
    nodeAPI->setAttribute(button00, NODE_FOCUS_ON_TOUCH, &item_focus);
    nodeAPI->addChild(column, column_test);
    nodeAPI->addChild(column_test, button00);

    column1 = CreateTestNode();
    nodeAPI->addChild(column_test, column1);
    button01 = SetButtonNode("子节点1", NULL);
    button02 = SetButtonNode("子节点2", NULL);
    nodeAPI->registerNodeEvent(button02, NODE_ON_FOCUS, g_event13, nullptr);
    nodeAPI->addChild(column1, button01);
    nodeAPI->addChild(column1, button02);

    column2 = CreateTestNode();
    nodeAPI->addChild(column_test, column2);
    button03 = SetButtonNode("子节点3", NULL);
    button04 = SetButtonNode("子节点4", NULL);
    nodeAPI->registerNodeEvent(button03, NODE_ON_FOCUS, g_event11, nullptr);
    nodeAPI->registerNodeEvent(button04, NODE_ON_FOCUS, g_event12, nullptr);
    nodeAPI->addChild(column2, button03);
    nodeAPI->addChild(column2, button04);
    TestNode(column);
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