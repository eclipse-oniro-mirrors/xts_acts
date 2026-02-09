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
 
#include "HoverEffectTest.h"
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
static int g_event5 = 5;

void SetWidthHover(ArkUI_NodeHandle &node, float width)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue widthValue[] = {width};
    ArkUI_AttributeItem item_width = {widthValue, sizeof(width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_WIDTH_PERCENT, &item_width);
}

void SetHeightHover(ArkUI_NodeHandle &node, float height)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue heightValue[] = {height};
    ArkUI_AttributeItem item_height = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_HEIGHT_PERCENT, &item_height);
}

void SetContentHover(ArkUI_NodeHandle &node, std::string content)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem contentValue;
    contentValue.string = content.c_str();
    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &contentValue);
}

void SetHoverEffect(ArkUI_NodeHandle &node, int32_t effect)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue effectValue[] = {{.i32 = effect}};
    ArkUI_AttributeItem item_effect = {.value = effectValue, 1};
    auto errorCode = nodeAPI->setAttribute(node, NODE_HOVER_EFFECT, &item_effect);
    auto message = nodeAPI->getAttribute(node, NODE_HOVER_EFFECT);
    auto value_effect = message->value[0].i32;
    auto value = std::to_string(value_effect);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  HOVER_EFFECT: %{public}d", value_effect);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "TESTLOG", "  errorCode: %{public}d", errorCode);
    SetContentHover(text0, value);
    SetContentHover(text1, std::to_string(errorCode));
}

void SetIdHover(ArkUI_NodeHandle &node, std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
}

ArkUI_NodeHandle SetButtonNodeHover(std::string id, int32_t targetId)
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
    SetIdHover(node, id);
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    return node;
}

ArkUI_NodeHandle SetTextNodeHover(std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_TEXT);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    SetIdHover(node, id);
    SetContentHover(node, "null message");
    return node;
}

ArkUI_NodeHandle CreateTestNodeHover()
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    float mHeight = 0.8;
    float mWidth = 0.1;
    float mMargin = 10;
    ArkUI_NumberValue value3[] = {{.u32 = 0xffff0000}};
    ArkUI_AttributeItem item3 = {value3, sizeof(value3) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item3);
    
    ArkUI_NumberValue marginValue[] = {mMargin};
    ArkUI_AttributeItem item_margin = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column, NODE_MARGIN, &item_margin);
    
    ArkUI_NumberValue colorValue[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem item_color = {.value = colorValue, 1};
    nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &item_color);
    SetWidthHover(column, mHeight);
    SetHeightHover(column, mWidth);
    SetHoverEffect(column, 0);
    return column;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == g_event1) {
        SetHoverEffect(text, ARKUI_HOVER_EFFECT_AUTO);
    } else if (eventId == g_event2) {
        SetHoverEffect(text, ARKUI_HOVER_EFFECT_SCALE);
    } else if (eventId == g_event3) {
        SetHoverEffect(text, ARKUI_HOVER_EFFECT_HIGHLIGHT);
    } else if (eventId == g_event4) {
        SetHoverEffect(text, ARKUI_HOVER_EFFECT_NONE);
    } else if (eventId == g_event5) {
        auto errorCode = nodeAPI->setAttribute(text, NODE_HOVER_EFFECT, nullptr);
        auto message = nodeAPI->getAttribute(text, NODE_HOVER_EFFECT);
        auto value_effect = message->value[0].i32;
        auto value = std::to_string(value_effect);
        SetContentHover(text0, value);
        SetContentHover(text1, std::to_string(errorCode));
    }
}

napi_value HoverEffectTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    nodeAPI->addChild(column, column_test);
    
    text = CreateTestNodeHover();
    nodeAPI->addChild(column_test, text);
    
    text0 = SetTextNodeHover("hover0");
    nodeAPI->addChild(column_test, text0);
    text1 = SetTextNodeHover("hover1");
    nodeAPI->addChild(column_test, text1);
    ArkUI_NodeHandle row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column, row1);
    
    auto button = SetButtonNodeHover("0", g_event1);
    nodeAPI->addChild(row1, button);
    auto button2 = SetButtonNodeHover("1", g_event2);
    nodeAPI->addChild(row1, button2);
    auto button3 = SetButtonNodeHover("2", g_event3);
    nodeAPI->addChild(row1, button3);
    auto button4 = SetButtonNodeHover("3", g_event4);
    nodeAPI->addChild(row1, button4);
    auto button5 = SetButtonNodeHover("nullptr", g_event5);
    nodeAPI->addChild(row1, button5);
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
