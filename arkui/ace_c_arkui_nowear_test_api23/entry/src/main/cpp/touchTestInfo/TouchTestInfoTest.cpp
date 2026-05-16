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

#include "TouchTestInfoTest.h"
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
static ArkUI_NodeHandle text1 = nullptr;
static ArkUI_NodeHandle list = nullptr;
static size_t g_argc = PARAM_1;
static size_t g_length = PARAM_64;
static size_t g_strLength = PARAM_0;
static int32_t g_strategy = 1;
static int32_t g_caseOne = 1;
static int32_t g_caseTwo = 2;
static int32_t g_caseThree = 3;
static int32_t g_caseFour = 4;
static int32_t g_caseFive = 5;
static int32_t g_touchColumn = 10;
static int32_t g_touchButton = 11;
static ArkUI_ErrorCode errorCode_setId = ARKUI_ERROR_CODE_NO_ERROR;

void SetBackgroundColor(ArkUI_NodeHandle &node, uint32_t color)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue backgroundColor[] = {{.u32 = color}};
    ArkUI_AttributeItem item_backgroundColor = {backgroundColor, sizeof(backgroundColor) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_BACKGROUND_COLOR, &item_backgroundColor);
}

void SetMargin(ArkUI_NodeHandle &node, float margin)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue marginValue[] = {margin};
    ArkUI_AttributeItem item_margin = {marginValue, sizeof(marginValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
}

void SetWidth(ArkUI_NodeHandle &node, float width)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue widthValue[] = {width};
    ArkUI_AttributeItem item_width = {widthValue, sizeof(width) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_WIDTH, &item_width);
}

void SetHeight(ArkUI_NodeHandle &node, float height)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue heightValue[] = {height};
    ArkUI_AttributeItem item_height = {heightValue, sizeof(heightValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_HEIGHT, &item_height);
}

void SetBorderWidth(ArkUI_NodeHandle &node, float borderWidth)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_NumberValue borderWidthValue[] = {borderWidth};
    ArkUI_AttributeItem item_borderWidth = {borderWidthValue, sizeof(borderWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_BORDER_WIDTH, &item_borderWidth);
}

void SetId(ArkUI_NodeHandle &node, std::string id)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    nodeAPI->setAttribute(node, NODE_ID, &idValue);
}

void SetContent(ArkUI_NodeHandle &node, std::string content)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem contentValue;
    contentValue.string = content.c_str();
    nodeAPI->setAttribute(node, NODE_TEXT_CONTENT, &contentValue);
}

ArkUI_NodeHandle setButtonNode(std::string id, int32_t targetId)
{
    float buttonMargin = 5;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    ArkUI_AttributeItem idValue;
    idValue.string = id.c_str();
    auto node = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    nodeAPI->setAttribute(node, NODE_BUTTON_LABEL, &idValue);
    ArkUI_NumberValue value_layout[] = {{.u32 = 1}};
    ArkUI_AttributeItem item_layout = {value_layout, sizeof(value_layout)/ sizeof(ArkUI_NumberValue)};
    ArkUI_NumberValue margin[] = {buttonMargin};
    ArkUI_AttributeItem item_margin = {margin, sizeof(margin) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(node, NODE_MARGIN, &item_margin);
    nodeAPI->setAttribute(node, NODE_LAYOUT_WEIGHT, &item_layout);
    nodeAPI->registerNodeEvent(node, NODE_ON_CLICK, targetId, nullptr);
    SetId(node, id);
    return node;
}

ArkUI_NodeHandle CreateTextTest(std::string id)
{
    float textMargin = 10;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item0;
    item0.string = "null message";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &item0);

    SetBackgroundColor(text, 0xFFFFC0CB);
    SetMargin(text, textMargin);
    SetId(text, id);
    return text;
}

ArkUI_NodeHandle CreateColumn()
{
    float mMargin = 10;
    int32_t mWidth = 200;
    int32_t mHeight = 50;
    ArkUI_NativeNodeAPI_1 *nodeAPI = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
    auto component = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    SetBackgroundColor(component, 0xFFFFC0CB);
    SetMargin(component, mMargin);
    SetWidth(component, mWidth);
    SetHeight(component, mHeight);
    SetBorderWidth(component, 1);
    SetId(component, "ColumnTest");
    return component;
}

static void OnEventReceive(ArkUI_NodeEvent *event)
{
    auto eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    if (eventId == g_touchColumn) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG", "touchColumn");
        SetContent(text1, "touchColumn");
    }
    if (eventId == g_touchButton) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG", "touchButton");
        SetContent(text, "touchButton");
    }
    if (eventId == g_caseOne) {
        g_strategy = g_caseOne;
    } else if (eventId == g_caseTwo) {
        g_strategy = g_caseTwo;
    } else if (eventId == g_caseThree) {
        g_strategy = g_caseThree;
    } else if (eventId == g_caseFour) {
        g_strategy = g_caseFour;
    } else if (eventId == g_caseFive) {
        SetContent(text, "null message");
        SetContent(text1, "null message");
    }
}

static void OnEventAdd(ArkUI_NodeEvent *nodeEvent)
{
    auto type = OH_ArkUI_NodeEvent_GetEventType(nodeEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG", "===EventReceiver is called %{public}d", type);
        if (type == NODE_ON_CHILD_TOUCH_TEST) {
            auto touchInfo = OH_ArkUI_NodeEvent_GetTouchTestInfo(nodeEvent);
            if (!touchInfo) {
                return;
            }
            ArkUI_TouchTestInfoItemArray array = nullptr;
            int32_t size = 0;
            OH_ArkUI_TouchTestInfo_GetTouchTestInfoList(touchInfo, &array, &size);
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG",
                         "NODE_ON_CHILD_TOUCH_TEST is called %{public}d, %{public}d, %{public}d, %{public}d", type,
                         !!touchInfo, !!array, size);
            if (size > 0) {
                auto X = OH_ArkUI_TouchTestInfoItem_GetX(array[0]);
                auto Y = OH_ArkUI_TouchTestInfoItem_GetY(array[0]);
                auto windowX = OH_ArkUI_TouchTestInfoItem_GetWindowX(array[0]);
                auto windowY = OH_ArkUI_TouchTestInfoItem_GetWindowY(array[0]);
                auto parentX = OH_ArkUI_TouchTestInfoItem_GetXRelativeToParent(array[0]);
                auto parentY = OH_ArkUI_TouchTestInfoItem_GetYRelativeToParent(array[0]);
                
                ArkUI_Rect childRect{};
                ArkUI_ErrorCode rectResult = ARKUI_ERROR_CODE_NO_ERROR;
                char childIdBuffer[256] = {0};
                ArkUI_ErrorCode idResult = ARKUI_ERROR_CODE_NO_ERROR;
                rectResult = OH_ArkUI_TouchTestInfoItem_GetChildRect(array[0], &childRect);
                idResult = OH_ArkUI_TouchTestInfoItem_GetChildId(array[0], childIdBuffer, sizeof(childIdBuffer));
            }
            if (g_strategy == g_caseOne) {
                errorCode_setId = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(touchInfo,
                    ARKUI_TOUCH_TEST_STRATEGY_DEFAULT);
            } else if (g_strategy == g_caseTwo) {
                errorCode_setId = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(touchInfo,
                    ARKUI_TOUCH_TEST_STRATEGY_FORWARD_COMPETITION);
            } else if (g_strategy == g_caseThree) {
                errorCode_setId = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(touchInfo,
                    ARKUI_TOUCH_TEST_STRATEGY_FORWARD);
            } else if (g_strategy == g_caseFour) {
                errorCode_setId = OH_ArkUI_TouchTestInfo_SetTouchResultStrategy(nullptr,
                    ARKUI_TOUCH_TEST_STRATEGY_FORWARD_COMPETITION);
            }
            OH_ArkUI_TouchTestInfo_SetTouchResultId(touchInfo, "ColumnTest");
            OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TESTLOG", "错误码: %{public}d",
                errorCode_setId);
        }
}


napi_value TouchTestInfoTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    ArkUI_NodeHandle column_parent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_NodeHandle column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    nodeAPI->addChild(column_parent, column);

    text = CreateTextTest("text");
    text1 = CreateTextTest("text1");
    list = CreateColumn();
    nodeAPI->addChild(list, text1);
    nodeAPI->registerNodeEvent(list, NODE_TOUCH_EVENT, g_touchColumn, nullptr);

    nodeAPI->addChild(column, list);
    ArkUI_NodeHandle button = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    SetId(button, "ButtonTest");
    nodeAPI->addChild(column, button);
    nodeAPI->addChild(button, text);
    nodeAPI->registerNodeEvent(button, NODE_TOUCH_EVENT, g_touchButton, nullptr);
    nodeAPI->registerNodeEvent(column, NODE_ON_CHILD_TOUCH_TEST, 0, nullptr);

    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column_parent, row);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    nodeAPI->addChild(column_parent, row1);
    auto button1 = setButtonNode("c1", g_caseOne);
    nodeAPI->addChild(row, button1);
    auto button2 = setButtonNode("c2", g_caseTwo);
    nodeAPI->addChild(row, button2);
    auto button3 = setButtonNode("c3", g_caseThree);
    nodeAPI->addChild(row, button3);
    auto button4 = setButtonNode("nullptr", g_caseFour);
    nodeAPI->addChild(row, button4);
    auto button5 = setButtonNode("clear", g_caseFive);
    nodeAPI->addChild(row1, button5);

    nodeAPI->registerNodeEventReceiver(&OnEventReceive);
    nodeAPI->addNodeEventReceiver(column, &OnEventAdd);
    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column_parent);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest