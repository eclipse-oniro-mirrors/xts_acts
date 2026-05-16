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

#include "BorderRadiusTest.h"
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
static ArkUI_NodeHandle Text2 = nullptr;
static ArkUI_NodeHandle stack1 = nullptr;
static ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
static ArkUI_NodeHandle button1 = nullptr;
static ArkUI_NodeHandle button2 = nullptr;
static ArkUI_NodeHandle button3 = nullptr;
static int_least32_t g_borderType = 5;

// 设置Button文本
static auto ContentTest(ArkUI_NodeHandle &nodeHandle, std::string isContent)
{
    std::string contentStr = isContent;
    ArkUI_AttributeItem contentItem = {.string = contentStr.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_TEXT_CONTENT, &contentItem);
}

// 设置BorderRadiusType
static auto BorderRadiusTypeTest(ArkUI_NodeHandle &nodeHandle, int_least32_t isRadiusTest, float isType)
{
    ArkUI_NumberValue value[] = {{.i32 = isRadiusTest}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BORDER_RADIUS_TYPE, &valueItem);
    ArkUI_NumberValue typeValue[] = {{.f32 = isType}};
    ArkUI_AttributeItem typeValueItem = {typeValue, sizeof(typeValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_BORDER_RADIUS, &typeValueItem);
    auto getResRadius = nodeAPI->getAttribute(nodeHandle, NODE_BORDER_RADIUS_TYPE);
    auto value_getResRadius = getResRadius->value[0].i32;
    std::string contentTextStr = std::to_string(value_getResRadius);
    ArkUI_AttributeItem contentTextItem = {.string = contentTextStr.c_str()};
    nodeAPI->setAttribute(Text2, NODE_TEXT_CONTENT, &contentTextItem);
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
    ArkUI_AttributeItem WidthItem = {WidthValue, PARAM_1};
    ArkUI_NumberValue HeightValue[] = {isHeight};
    ArkUI_AttributeItem HeightItem = {HeightValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH, &WidthItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT, &HeightItem);
}

// 设置宽高百分比
static auto HeightAndWidthPercent(ArkUI_NodeHandle &nodeHandle, float isWidthPercentTest, float isHeightPercentTest)
{
    ArkUI_NumberValue WidthPercentValue[] = {isWidthPercentTest};
    ArkUI_AttributeItem WidthPercentItem = {WidthPercentValue, PARAM_1};
    ArkUI_NumberValue HeightPercentValue[] = {isHeightPercentTest};
    ArkUI_AttributeItem HeightPercentItem = {HeightPercentValue, PARAM_1};
    nodeAPI->setAttribute(nodeHandle, NODE_WIDTH_PERCENT, &WidthPercentItem);
    nodeAPI->setAttribute(nodeHandle, NODE_HEIGHT_PERCENT, &HeightPercentItem);
}

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

napi_value BorderRadiusTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    auto columnParent = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto column2 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto row = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto stack = nodeAPI->createNode(ARKUI_NODE_STACK);
    stack1 = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto stack2 = nodeAPI->createNode(ARKUI_NODE_STACK);

    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    Text2 = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ContentTest(Text1, "borderRadius");
    ContentTest(Text2, "test");

    // 统一设置宽高
    HeightAndWidthPercent(Text1, PARAM_1, PARAM_1);
    HeightAndWidth(stack1, SIZE_100, SIZE_100);
    HeightAndWidth(column1, SIZE_120, SIZE_120);
    HeightAndWidth(column2, SIZE_100, SIZE_100);
    // 设置组件ID
    IDTest(Text2, "stackBorderRadius1");
    // 设置背景颜色
    BackGroundColorTest(stack1, 0xFFFF0000);

    BackGroundColorTest(column1, 0xff0c0404);
    // 设置clip
    ArkUI_NumberValue clipValue1[] = {{.i32 = true}};
    ArkUI_AttributeItem clipValue_item1 = {clipValue1, sizeof(clipValue1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack1, NODE_CLIP, &clipValue_item1);
    // 设置blur
    ArkUI_NumberValue blurValue1[] = {{.f32 = SIZE_50}};
    ArkUI_AttributeItem blurValue_item1 = {blurValue1, sizeof(blurValue1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column2, NODE_BLUR, &blurValue_item1);
    // 设置position
    ArkUI_NumberValue positionValue1[] = {{.f32 = PARAM_0}, {.f32 = PARAM_0}};
    ArkUI_AttributeItem positionValue_item1 = {positionValue1, sizeof(positionValue1) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(column2, NODE_POSITION, &positionValue_item1);
    // 设置BorderRadiusType
    BorderRadiusTypeTest(stack1, ARKUI_RENDERSTRATEGY_FAST, SIZE_50);
    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "0";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->addChild(row, button1);

    button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr2 = "1";
    ArkUI_AttributeItem LABEL_Item2 = {.string = labelStr2.c_str()};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->addChild(row, button2);

    button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr3 = "5";
    ArkUI_AttributeItem LABEL_Item3 = {.string = labelStr3.c_str()};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->addChild(row, button3);

    IDTest(button1, "buttonBorderRadius1");
    IDTest(button2, "buttonBorderRadius2");
    IDTest(button3, "buttonBorderRadius3");

    nodeAPI->addChild(stack2, Text1);
    nodeAPI->addChild(stack2, column2);
    nodeAPI->addChild(stack1, stack2);
    nodeAPI->addChild(stack, column1);
    nodeAPI->addChild(stack, stack1);
    nodeAPI->addChild(columnParent, stack);
    nodeAPI->addChild(columnParent, row);
    nodeAPI->addChild(columnParent, Text2);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_0: {
                BorderRadiusTypeTest(stack1, ARKUI_RENDERSTRATEGY_FAST, SIZE_50);
                break;
            }
            case PARAM_1: {
                BorderRadiusTypeTest(stack1, ARKUI_RENDERSTRATEGY_OFFSCREEN, SIZE_50);
                break;
            }
            case PARAM_2: {
                BorderRadiusTypeTest(stack1, g_borderType, SIZE_50);
                break;
            }
        }
    });

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