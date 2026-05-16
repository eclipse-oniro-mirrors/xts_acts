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

#include "LayoutGravityTest.h"
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
static ArkUI_NodeHandle button3 = nullptr;
static ArkUI_NodeHandle button4 = nullptr;
static ArkUI_NodeHandle button5 = nullptr;
static ArkUI_NodeHandle button6 = nullptr;
static ArkUI_NodeHandle button7 = nullptr;
static ArkUI_NodeHandle button8 = nullptr;
static ArkUI_NodeHandle button9 = nullptr;
static ArkUI_NodeHandle button10 = nullptr;
int_least32_t g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_CENTER;

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

// 设置LayoutGravity
static auto layoutGravityTest(ArkUI_NodeHandle &nodeHandle, int_least32_t isLayoutGravityTest)
{
    ArkUI_NumberValue value[] = {{.i32 = isLayoutGravityTest}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(nodeHandle, NODE_LAYOUT_GRAVITY, &valueItem);
    auto getResGravity = nodeAPI->getAttribute(nodeHandle, NODE_LAYOUT_GRAVITY);
    auto value_getResGravity = getResGravity->value[0].i32;
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

// 设置ID
static auto IDTest(ArkUI_NodeHandle &nodeHandle, std::string isId)
{
    std::string idValue = isId;
    ArkUI_AttributeItem idValueItem = {.string = idValue.c_str()};
    nodeAPI->setAttribute(nodeHandle, NODE_ID, &idValueItem);
}

napi_value LayoutGravityTest::CreateNativeNode(napi_env env, napi_callback_info info)
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
    auto column1 = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto stack1 = nodeAPI->createNode(ARKUI_NODE_STACK);
    auto row2 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row3 = nodeAPI->createNode(ARKUI_NODE_ROW);
    auto row4 = nodeAPI->createNode(ARKUI_NODE_ROW);
    Text1 = nodeAPI->createNode(ARKUI_NODE_TEXT);

    ArkUI_NumberValue borderWidthValue[] = {{.f32 = 2}};
    ArkUI_AttributeItem borderWidthValueItem = {borderWidthValue, sizeof(borderWidthValue) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(stack1, NODE_BORDER_WIDTH, &borderWidthValueItem);

    IDTest(Text1, "textGravity");
    // 设置文本内容
    ContentTest(Text1, "layoutGravity");
    // 统一设置layoutGravity
    layoutGravityTest(Text1, g_layoutGravity);
    // 统一设置宽高百分比
    HeightAndWidth(stack1, PARAM_200, PARAM_200);
    HeightAndWidth(Text1, PARAM_100, PARAM_100);
    // 设置背景颜色
    BackGroundColorTest(Text1, 0xfff3a757);
    BackGroundColorTest(stack1, 0xffa96ec3);

    nodeAPI->addChild(stack1, Text1);

    button1 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr1 = "0";
    ArkUI_AttributeItem LABEL_Item1 = {.string = labelStr1.c_str()};
    nodeAPI->setAttribute(button1, NODE_BUTTON_LABEL, &LABEL_Item1);
    nodeAPI->registerNodeEvent(button1, NODE_ON_CLICK_EVENT, PARAM_0, nullptr);
    nodeAPI->addChild(row2, button1);
    IDTest(button1, "buttonGravity0");

    button2 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr2 = "1";
    ArkUI_AttributeItem LABEL_Item2 = {.string = labelStr2.c_str()};
    nodeAPI->setAttribute(button2, NODE_BUTTON_LABEL, &LABEL_Item2);
    nodeAPI->registerNodeEvent(button2, NODE_ON_CLICK_EVENT, PARAM_1, nullptr);
    nodeAPI->addChild(row2, button2);
    IDTest(button2, "buttonGravity1");

    button3 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr3 = "2";
    ArkUI_AttributeItem LABEL_Item3 = {.string = labelStr3.c_str()};
    nodeAPI->setAttribute(button3, NODE_BUTTON_LABEL, &LABEL_Item3);
    nodeAPI->registerNodeEvent(button3, NODE_ON_CLICK_EVENT, PARAM_2, nullptr);
    nodeAPI->addChild(row2, button3);
    IDTest(button3, "buttonGravity2");

    button4 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr4 = "3";
    ArkUI_AttributeItem LABEL_Item4 = {.string = labelStr4.c_str()};
    nodeAPI->setAttribute(button4, NODE_BUTTON_LABEL, &LABEL_Item4);
    nodeAPI->registerNodeEvent(button4, NODE_ON_CLICK_EVENT, PARAM_3, nullptr);
    nodeAPI->addChild(row3, button4);
    IDTest(button4, "buttonGravity3");

    button5 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr5 = "4";
    ArkUI_AttributeItem LABEL_Item5 = {.string = labelStr5.c_str()};
    nodeAPI->setAttribute(button5, NODE_BUTTON_LABEL, &LABEL_Item5);
    nodeAPI->registerNodeEvent(button5, NODE_ON_CLICK_EVENT, PARAM_4, nullptr);
    nodeAPI->addChild(row3, button5);
    IDTest(button5, "buttonGravity4");

    button6 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr6 = "5";
    ArkUI_AttributeItem LABEL_Item6 = {.string = labelStr6.c_str()};
    nodeAPI->setAttribute(button6, NODE_BUTTON_LABEL, &LABEL_Item6);
    nodeAPI->registerNodeEvent(button6, NODE_ON_CLICK_EVENT, PARAM_5, nullptr);
    nodeAPI->addChild(row3, button6);
    IDTest(button6, "buttonGravity5");

    button7 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr7 = "6";
    ArkUI_AttributeItem LABEL_Item7 = {.string = labelStr7.c_str()};
    nodeAPI->setAttribute(button7, NODE_BUTTON_LABEL, &LABEL_Item7);
    nodeAPI->registerNodeEvent(button7, NODE_ON_CLICK_EVENT, PARAM_6, nullptr);
    nodeAPI->addChild(row4, button7);
    IDTest(button7, "buttonGravity6");

    button8 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr8 = "7";
    ArkUI_AttributeItem LABEL_Item8 = {.string = labelStr8.c_str()};
    nodeAPI->setAttribute(button8, NODE_BUTTON_LABEL, &LABEL_Item8);
    nodeAPI->registerNodeEvent(button8, NODE_ON_CLICK_EVENT, PARAM_7, nullptr);
    nodeAPI->addChild(row4, button8);
    IDTest(button8, "buttonGravity7");

    button9 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr9 = "8";
    ArkUI_AttributeItem LABEL_Item9 = {.string = labelStr9.c_str()};
    nodeAPI->setAttribute(button9, NODE_BUTTON_LABEL, &LABEL_Item9);
    nodeAPI->registerNodeEvent(button9, NODE_ON_CLICK_EVENT, PARAM_8, nullptr);
    nodeAPI->addChild(row4, button9);
    IDTest(button9, "buttonGravity8");

    button10 = nodeAPI->createNode(ARKUI_NODE_BUTTON);
    std::string labelStr10 = "9";
    ArkUI_AttributeItem LABEL_Item10 = {.string = labelStr10.c_str()};
    nodeAPI->setAttribute(button10, NODE_BUTTON_LABEL, &LABEL_Item10);
    nodeAPI->registerNodeEvent(button10, NODE_ON_CLICK_EVENT, PARAM_9, nullptr);
    nodeAPI->addChild(row4, button10);
    IDTest(button10, "buttonGravity9");

    nodeAPI->addChild(column1, row2);
    nodeAPI->addChild(column1, row3);
    nodeAPI->addChild(column1, row4);
    nodeAPI->addChild(column1, stack1);

    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        auto targetId = OH_ArkUI_NodeEvent_GetTargetId(event);

        switch (targetId) {
            case PARAM_0: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_TOP_START;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_1: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_TOP;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_2: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_TOP_END;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_3: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_START;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_4: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_CENTER;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_5: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_END;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_6: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_BOTTOM_START;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_7: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_BOTTOM;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_8: {
                g_layoutGravity = ARKUI_LOCALIZED_ALIGNMENT_BOTTOM_END;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
            case PARAM_9: {
                g_layoutGravity = PARAM_9;
                layoutGravityTest(Text1, g_layoutGravity);
                break;
            }
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column1);
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
    return nullptr;
    }
    return exports;
}
}