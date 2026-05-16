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

#include "IgnoreLayoutSafeAreaTest.h"
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
static ArkUI_NodeHandle Text1 = nullptr;
static ArkUI_NodeHandle columnTest = nullptr;
static ArkUI_NodeHandle stack = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle button1 = nullptr;
static ArkUI_NodeHandle button2 = nullptr;
static ArkUI_NodeHandle button3 = nullptr;
static ArkUI_NodeHandle button4 = nullptr;
static ArkUI_NodeHandle button5 = nullptr;
static ArkUI_NodeHandle button6 = nullptr;
static ArkUI_NodeHandle button7 = nullptr;
static ArkUI_NodeHandle button8 = nullptr;
static ArkUI_NodeHandle button9 = nullptr;
static int_least32_t g_ignoreType = ARKUI_LAYOUT_SAFE_AREA_TYPE_SYSTEM;
static int_least32_t g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_ALL;

// 设置Button文本
static auto ContentTest(ArkUI_NodeHandle &nodeHandle, std::string isContent)
{
    std::string contentStr = isContent;
    ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &contentItem);
}

// 设置IgnoreLayoutSafeArea
static auto IgnoreLayoutTest(ArkUI_NodeHandle &nodeHandle, uint32_t isTypeTest, uint32_t isEdgeTest)
{
    ArkUI_NumberValue value[] = {{.u32 = isTypeTest}, {.u32 = isEdgeTest}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_IGNORE_LAYOUT_SAFE_AREA, &valueItem);
    auto getResIgnore = nodeAPI->getAttribute(nodeHandle, NODE_IGNORE_LAYOUT_SAFE_AREA);
    auto value_getResIgnoreType = getResIgnore->value[0].u32;
    auto value_getResIgnoreEdge = getResIgnore->value[1].u32;
    std::string contentTextStr = std::to_string(value_getResIgnoreType) + std::to_string(value_getResIgnoreEdge);
    ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
    nodeAPI->setAttribute(Text1, NODE_TEXT_CONTENT, &contentTextItem);
}

// 设置背景色
static auto BackGroundColorTest(ArkUI_NodeHandle &nodeHandle, uint32_t isColorTest)
{
    ArkUI_NumberValue color1[] = {{.u32 = isColorTest}};
    ArkUI_AttributeItem color1_item = {color1, sizeof(color1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color1_item);
}

// 设置宽高
static auto HeightAndWidth(ArkUI_NodeHandle &nodeHandle, float isWidth, float isHeight)
{
    ArkUI_NumberValue WidthValue[] = {isWidth};
    ArkUI_AttributeItem WidthItem = {WidthValue, 1};
    ArkUI_NumberValue HeightValue[] = {isHeight};
    ArkUI_AttributeItem HeightItem = {HeightValue, 1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &WidthItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &HeightItem);
}

// 设置宽高百分比
static auto HeightAndWidthPercent(ArkUI_NodeHandle &nodeHandle, float isWidthPercent, float isHeightPercent)
{
    ArkUI_NumberValue WidthPercentValue[] = {isWidthPercent};
    ArkUI_AttributeItem WidthItemPercent = {WidthPercentValue, 1};
    ArkUI_NumberValue HeightPercentValue[] = {isHeightPercent};
    ArkUI_AttributeItem HeightPercentItem = {HeightPercentValue, 1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &WidthItemPercent);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT_PERCENT, &HeightPercentItem);
}

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

napi_value IgnoreLayoutSafeAreaTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row3 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row4 = nodeAPI->createNode(ARKUI_NODE_ROW);

    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    columnTest = nodeAPI->createNode(ARKUI_NODE_COLUMN);

    ArkUI_NumberValue alinValue[] = {{.i32 = ARKUI_ALIGNMENT_TOP}};
    ArkUI_AttributeItem alinValueItem = {alinValue, sizeof(alinValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack, NODE_ALIGNMENT, &alinValueItem);

    IDTest(columnTest, "columIgnore");
    // 设置文本内容
    ContentTest(Text1, "test");
    // 统一设置忽略安全区
    IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
    // 统一设置宽高百分比
    HeightAndWidthPercent(stack, PARAM_1, PARAM_1);
    HeightAndWidthPercent(columnTest, PARAM_1, PARAM_1);
    // 设置背景颜色
    BackGroundColorTest(columnTest, 0xfff3a757);

    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "15";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->addChild(row2, button1);
    IDTest(button1, "buttonEdge15");

    button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr2 = "1";
    ArkUI_AttributeItem LABEL_Item2 = {.string = labelStr2.c_str()};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->addChild(row2, button2);
    IDTest(button2, "buttonEdge1");

    button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr3 = "2";
    ArkUI_AttributeItem LABEL_Item3 = {.string = labelStr3.c_str()};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->addChild(row2, button3);
    IDTest(button3, "buttonEdge2");

    button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr4 = "4";
    ArkUI_AttributeItem LABEL_Item4 = {.string = labelStr4.c_str()};
    nodeAPI->setAttribute(button4, NODE_BUTTON_LABEL, &LABEL_Item4);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
    nodeAPI->addChild(row2, button4);
    IDTest(button4, "buttonEdge4");

    button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr5 = "8";
    ArkUI_AttributeItem LABEL_Item5 = {.string = labelStr5.c_str()};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK_EVENT, PARAM_4, nullptr);
    nodeAPI->addChild(row3, button5);
    IDTest(button5, "buttonEdge8");

    button6 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr6 = "3";
    ArkUI_AttributeItem LABEL_Item6 = {.string = labelStr6.c_str()};
    nodeAPI->setAttribute(button6, NODE_BUTTON_LABEL, &LABEL_Item6);
    nodeAPI->registerNodeEvent(button6, NODE_ON_CLICK_EVENT, PARAM_5, nullptr);
    nodeAPI->addChild(row3, button6);
    IDTest(button6, "buttonEdge3");

    button7 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr7 = "12";
    ArkUI_AttributeItem LABEL_Item7 = {.string = labelStr7.c_str()};
    nodeAPI->setAttribute(button7, NODE_BUTTON_LABEL, &LABEL_Item7);
    nodeAPI->registerNodeEvent(button7, NODE_ON_CLICK_EVENT, PARAM_6, nullptr);
    nodeAPI->addChild(row3, button7);
    IDTest(button7, "buttonEdge12");

    button8 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr8 = "17";
    ArkUI_AttributeItem LABEL_Item8 = {.string = labelStr8.c_str()};
    nodeAPI->setAttribute(button8, NODE_BUTTON_LABEL, &LABEL_Item8);
    nodeAPI->registerNodeEvent(button8, NODE_ON_CLICK_EVENT, PARAM_7, nullptr);
    nodeAPI->addChild(row4, button8);
    IDTest(button8, "buttonEdge17");

    button9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr9 = "2";
    ArkUI_AttributeItem LABEL_Item9 = {.string = labelStr9.c_str()};
    nodeAPI->setAttribute(button9, NODE_BUTTON_LABEL, &LABEL_Item9);
    nodeAPI->registerNodeEvent(button9, NODE_ON_CLICK_EVENT, PARAM_8, nullptr);
    nodeAPI->addChild(row4, button9);
    nodeAPI->addChild(row4, Text1);
    IDTest(button9, "buttonType2");

    nodeAPI->addChild(column, row2);
    nodeAPI->addChild(column, row3);
    nodeAPI->addChild(column, row4);
    nodeAPI->addChild(stack, columnTest);
    nodeAPI->addChild(stack, column);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_0: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_ALL;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_1: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_TOP;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_2: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_BOTTOM;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_3: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_START;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_4: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_END;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_5: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_VERTICAL;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_6: {
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_HORIZONTAL;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_7: {
                g_ignoreEdge = PARAM_17;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
            case PARAM_8: {
                g_ignoreType = PARAM_2;
                g_ignoreEdge = ARKUI_LAYOUT_SAFE_AREA_EDGE_ALL;
                IgnoreLayoutTest(columnTest, g_ignoreType, g_ignoreEdge);
                break;
            }
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), stack);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}