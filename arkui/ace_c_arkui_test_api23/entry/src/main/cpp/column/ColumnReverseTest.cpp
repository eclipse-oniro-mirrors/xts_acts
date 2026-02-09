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

#include "ColumnReverseTest.h"
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
static ArkUI_NodeHandle Column = nullptr;
static ArkUI_NodeHandle Text1 = nullptr;
static ArkUI_NodeHandle Text2 = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle button1 = nullptr;
static ArkUI_NodeHandle button2 = nullptr;
static ArkUI_NodeHandle button3 = nullptr;
static ArkUI_NodeHandle button4 = nullptr;
static ArkUI_NodeHandle button5 = nullptr;

// 设置Button文本
static auto ContentTest(ArkUI_NodeHandle &nodeHandle, std::string isContent)
{
    std::string contentStr = isContent;
    ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &contentItem);
}

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

// 设置背景色
static auto BackGroundColorTest(ArkUI_NodeHandle &nodeHandle, uint32_t isColorTest)
{
    ArkUI_NumberValue color1[] = {{.u32 = isColorTest}};
    ArkUI_AttributeItem color1_item = {color1, sizeof(color1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color1_item);
}

// 设置宽高百分比
static auto WidthPercent(ArkUI_NodeHandle &nodeHandle, float isWidth)
{
    ArkUI_NumberValue WidthPercentValue[] = {isWidth};
    ArkUI_AttributeItem WidthItemPercent = {WidthPercentValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &WidthItemPercent);
}

napi_value ColumnReverseTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = 0;
    char xComponentID[PARAM_64] = {0};
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                 "%{public}s", xComponentID);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "diatanceTest",
                     "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto colum1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    WidthPercent(colum1, PARAM_1);

    Column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    BackGroundColorTest(Column, 0xAFEEEE00);
    WidthPercent(Column, PARAM_0_POINT_9);

    ArkUI_NumberValue ReverseValue[] = {{.i32 = false}};
    ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);

    nodeAPI->addChild(colum1, Column);

    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);

    ArkUI_NumberValue HeightTextValue[] = {SIZE_50};
    ArkUI_AttributeItem HeightTextItem = {HeightTextValue, 1};
    nodeAPI->setAttribute(Text1, NODE_HEIGHT, &HeightTextItem);
    nodeAPI->setAttribute(Text2, NODE_HEIGHT, &HeightTextItem);

    WidthPercent(Text1, PARAM_0_POINT_4);
    WidthPercent(Text2, PARAM_0_POINT_4);

    ContentTest(Text1, "Column1");
    ContentTest(Text2, "Column2");
    IDTest(Text1, "columnReverse");

    BackGroundColorTest(Text1, 0xF5DEB300);
    BackGroundColorTest(Text2, 0xD2B48C00);

    nodeAPI->addChild(Column, Text1);
    nodeAPI->addChild(Column, Text2);

    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "true";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->addChild(row1, button1);
    IDTest(button1, "columnReverse1");

    button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr2 = "false";
    ArkUI_AttributeItem LABEL_Item2 = {.string = labelStr2.c_str()};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->addChild(row1, button2);
    IDTest(button2, "columnReverse2");

    button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr3 = "0";
    ArkUI_AttributeItem LABEL_Item3 = {.string = labelStr3.c_str()};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
    nodeAPI->addChild(row2, button3);
    IDTest(button3, "columnReverse3");

    button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr4 = "1";
    ArkUI_AttributeItem LABEL_Item4 = {.string = labelStr4.c_str()};
    nodeAPI->setAttribute(button4, NODE_BUTTON_LABEL, &LABEL_Item4);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK_EVENT, PARAM_4, nullptr);
    nodeAPI->addChild(row2, button4);
    IDTest(button4, "columnReverse4");

    button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr5 = "5";
    ArkUI_AttributeItem LABEL_Item5 = {.string = labelStr5.c_str()};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK_EVENT, PARAM_5, nullptr);
    nodeAPI->addChild(row2, button5);
    IDTest(button5, "columnReverse5");

    nodeAPI->addChild(colum1, row1);
    nodeAPI->addChild(colum1, row2);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_1: {
                ArkUI_NumberValue ReverseValue[] = {{.i32 = true}};
                ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) /
                    sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);
                auto getResReverse = nodeAPI->getAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE);
                auto value_getResReverse = getResReverse->value[0].i32;
                std::string contentTextStr = std::to_string(value_getResReverse);
                ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
                nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
                break;
            }
            case PARAM_2: {
                ArkUI_NumberValue ReverseValue[] = {{.i32 = false}};
                ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) /
                    sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);
                auto getResReverse = nodeAPI->getAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE);
                auto value_getResReverse = getResReverse->value[0].i32;
                std::string contentTextStr = std::to_string(value_getResReverse);
                ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
                nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
                break;
            }
            case PARAM_3: {
                ArkUI_NumberValue ReverseValue[] = {{.i32 = PARAM_0}};
                ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) /
                    sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);
                auto getResReverse = nodeAPI->getAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE);
                auto value_getResReverse = getResReverse->value[0].i32;
                std::string contentTextStr = std::to_string(value_getResReverse);
                ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
                nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
                break;
            }
            case PARAM_4: {
                ArkUI_NumberValue ReverseValue[] = {{.i32 = PARAM_1}};
                ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) /
                    sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);
                auto getResReverse = nodeAPI->getAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE);
                auto value_getResReverse = getResReverse->value[0].i32;
                std::string contentTextStr = std::to_string(value_getResReverse);
                ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
                nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
                break;
            }
            case PARAM_5: {
                ArkUI_NumberValue ReverseValue[] = {{.i32 = PARAM_5}};
                ArkUI_AttributeItem ReverseItem = {ReverseValue, sizeof(ReverseValue) /
                    sizeof(ArkUI_NumberValue)};
                nodeAPI->setAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE, &ReverseItem);
                auto getResReverse = nodeAPI->getAttribute(Column, NODE_LINEAR_LAYOUT_REVERSE);
                auto value_getResReverse = getResReverse->value[0].i32;
                std::string contentTextStr = std::to_string(value_getResReverse);
                ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
                nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
                break;
            }
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), colum1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}