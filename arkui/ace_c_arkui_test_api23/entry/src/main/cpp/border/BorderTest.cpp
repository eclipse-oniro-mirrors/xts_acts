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

#include "BorderTest.h"
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
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle button1 = nullptr;
static ArkUI_NodeHandle button2 = nullptr;
static float g_borderWidth = 0;
static float g_borderGap = 0;

// 设置Button文本
static auto ContentTest(ArkUI_NodeHandle &nodeHandle, std::string isContent)
{
    std::string contentStr = isContent;
    ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &contentItem);
}

// 设置背景色
static auto BackGroundColorTest(ArkUI_NodeHandle &nodeHandle, uint32_t isColorTest)
{
    ArkUI_NumberValue color1[] = {{.u32 = isColorTest}};
    ArkUI_AttributeItem color1_item = {color1, sizeof(color1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &color1_item);
}

// 设置BorderDashWidth
static auto BorderHashWidthTest(ArkUI_NodeHandle &nodeHandle, float isDashWidthTop, float isDashWidthRight,
                                float isDashWidthBottom, float isDashWidthLeft)
{
    ArkUI_NumberValue value[] = {
        {.f32 = isDashWidthTop}, {.f32 = isDashWidthRight}, {.f32 = isDashWidthBottom}, {.f32 = isDashWidthLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_DASH_WIDTH, &valueItem);
}

// 设置BorderDashGap
static auto BorderHashGapTest(ArkUI_NodeHandle &nodeHandle, float isDashGapTop, float isDashGapRight,
                              float isDashGapBottom, float isDashGapLeft)
{
    ArkUI_NumberValue value[] = {
        {.f32 = isDashGapTop}, {.f32 = isDashGapRight}, {.f32 = isDashGapBottom}, {.f32 = isDashGapLeft}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_DASH_GAP, &valueItem);
}

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

static auto HeightAndWidth(ArkUI_NodeHandle &nodeHandle, float isWidth, float isHeight)
{
    ArkUI_NumberValue WidthValue[] = {isWidth};
    ArkUI_AttributeItem WidthItem = {WidthValue, PARAM_1};
    ArkUI_NumberValue HeightValue[] = {isHeight};
    ArkUI_AttributeItem HeightItem = {HeightValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &WidthItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &HeightItem);
}

static auto HeightAndWidthPercent(ArkUI_NodeHandle &nodeHandle, float isWidthPercent, float isHeightPercent)
{
    ArkUI_NumberValue WidthPercentValue[] = {isWidthPercent};
    ArkUI_AttributeItem WidthItemPercent = {WidthPercentValue, PARAM_1};
    ArkUI_NumberValue HeightPercentValue[] = {isHeightPercent};
    ArkUI_AttributeItem HeightPercentItem = {HeightPercentValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &WidthItemPercent);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT_PERCENT, &HeightPercentItem);
}

napi_value BorderTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row1 = nodeAPI->createNode(ARKUI_NODE_ROW);
    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);

    ArkUI_NumberValue borderWidthValue[] = {{.f32 = PARAM_2}};
    ArkUI_AttributeItem borderWidthValueItem = {borderWidthValue, sizeof(borderWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Text1, NODE_BORDER_WIDTH, &borderWidthValueItem);

    ArkUI_NumberValue borderStyleValue[] = {{.i32 = ARKUI_BORDER_STYLE_DASHED}};
    ArkUI_AttributeItem borderStyleValue_item = {borderStyleValue,
                                                 sizeof(borderStyleValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(Text1, NODE_BORDER_STYLE, &borderStyleValue_item);

    // 设置文本内容
    ContentTest(Text1, "border test");
    // 统一设忽hashWidth/hashGap
    BorderHashWidthTest(Text1, g_borderWidth, g_borderWidth, g_borderWidth, g_borderWidth);
    BorderHashGapTest(Text1, g_borderGap, g_borderGap, g_borderGap, g_borderGap);
    // 统一设置宽高百分比
    HeightAndWidthPercent(Text1, PARAM_0_POINT_8, PARAM_0_POINT_5);
    HeightAndWidthPercent(column, PARAM_1, PARAM_1);
    // 设置背景颜色
    BackGroundColorTest(Text1, 0xfff3a757);
    BackGroundColorTest(column, 0xffa96ec3);

    IDTest(Text1, "borderText1");

    nodeAPI->addChild(column, Text1);

    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "10";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->addChild(row1, button1);

    button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr2 = "-2";
    ArkUI_AttributeItem LABEL_Item2 = {.string = labelStr2.c_str()};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->addChild(row1, button2);

    IDTest(button1, "borderButton1");
    IDTest(button2, "borderButton2");

    nodeAPI->addChild(column, row1);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_0: {
                g_borderWidth = PARAM_10;
                g_borderGap = PARAM_10;
                BorderHashWidthTest(Text1, g_borderWidth, g_borderWidth, g_borderWidth, g_borderWidth);
                BorderHashGapTest(Text1, g_borderGap, g_borderGap, g_borderGap, g_borderGap);
                break;
            }
            case PARAM_1: {
                g_borderWidth = PARAM_NEGATIVE_2;
                g_borderGap = PARAM_NEGATIVE_2;
                BorderHashWidthTest(Text1, g_borderWidth, g_borderWidth, g_borderWidth, g_borderWidth);
                BorderHashGapTest(Text1, g_borderGap, g_borderGap, g_borderGap, g_borderGap);
                break;
            }
        }
    });

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