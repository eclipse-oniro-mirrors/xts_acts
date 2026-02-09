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

#include "DistanceTest.h"
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
static int g_event1 = 1;
static int g_event2 = 2;
static int g_event3 = 3;
static int g_event4 = 4;

void SetWidthDistance(ArkUI_NodeHandle &node, float width)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue widthValue[] = {width};
    ArkUI_AttributeItem item_width = {widthValue, sizeof(width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_WIDTH_PERCENT, &item_width);
}

void SetHeightDistance(ArkUI_NodeHandle &node, float height)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue heightValue[] = {height};
    ArkUI_AttributeItem item_height = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_HEIGHT_PERCENT, &item_height);
}

void SetContentDistance(ArkUI_NodeHandle &node, std::string content)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem contentValue;
    contentValue.string = content.c_str();
    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &contentValue);
}

void SetDistance(ArkUI_NodeHandle &node, float distance)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue distanceValue[] = {{.f32 = distance}};
    ArkUI_AttributeItem item_distance = {.value = distanceValue, 1};
    auto errorCode = nodeAPI->setAttribute(node, NODE_ON_CLICK_EVENT_DISTANCE_THRESHOLD, &item_distance);
    
    auto message = nodeAPI->getAttribute(node, NODE_ON_CLICK_EVENT_DISTANCE_THRESHOLD);
    auto value_distance = message->value[0].f32;
    auto value = std::to_string(value_distance);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  DISTANCE: %{public}f", value_distance);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  errorCode: %{public}d", errorCode);
    SetContentDistance(text0, value);
    SetContentDistance(text1, std::to_string(errorCode));
}

void SetIdDistance(ArkUI_NodeHandle &node, std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
}

ArkUI_NodeHandle SetButtonNodeDistance(std::string id, int32_t targetId)
{
    float mMargin = 10;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout) / sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {mMargin};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
    nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);
    SetIdDistance(node, id);
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    return node;
}

ArkUI_NodeHandle SetTextNodeDistance(std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    SetIdDistance(node, id);
    SetContentDistance(node, "null message");
    return node;
}

ArkUI_NodeHandle CreateTestNodeDistance()
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
    SetWidthDistance(column, mHeight);
    SetHeightDistance(column, mWidth);
    SetDistance(column, 0);
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    auto case1 = 200;
    auto case2 = 0;
    auto case3 = 50.0;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == g_event1) {
        SetDistance(text, case1);
    } else if (eventId == g_event2) {
        SetDistance(text, case2);
    } else if (eventId == g_event3) {
        SetDistance(text, case3);
    } else if (eventId == g_event4) {
        auto errorCode = nodeAPI->setAttribute(text, NODE_ON_CLICK_EVENT_DISTANCE_THRESHOLD, nullptr);
        auto message = nodeAPI->getAttribute(text, NODE_ON_CLICK_EVENT_DISTANCE_THRESHOLD);
        auto value_distance = message->value[0].f32;
        SetContentDistance(text0, std::to_string(value_distance));
        SetContentDistance(text1, std::to_string(errorCode));
    }
}

napi_value DistanceTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    
    ArkUI_NodeHandle columnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(columnParent, column);
    ArkUI_NodeHandle column_test = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFFC0CB}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column_test, NODE_BACKGROUND_COLOR, &item_color);
    nodeAPI->registerNodeEvent(column_test, NODE_ON_CLICK_EVENT, 0, nullptr);
    nodeAPI->addChild(column, column_test);
    
    text = CreateTestNodeDistance();
    nodeAPI->addChild(column_test, text);
    
    text0 = SetTextNodeDistance("test0");
    nodeAPI->addChild(column_test, text0);
    text1 = SetTextNodeDistance("test1");
    nodeAPI->addChild(column_test, text1);
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    ArkUI_NodeHandle row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, row1);
    nodeAPI->addChild(column, row2);
    
    auto button = SetButtonNodeDistance("200", g_event1);
    nodeAPI->addChild(row1, button);
    auto button2 = SetButtonNodeDistance("0", g_event2);
    nodeAPI->addChild(row1, button2);
    auto button3 = SetButtonNodeDistance("50.0", g_event3);
    nodeAPI->addChild(row1, button3);
    auto button4 = SetButtonNodeDistance("nullptr", g_event4);
    nodeAPI->addChild(row1, button4);
    
    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), columnParent);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}
