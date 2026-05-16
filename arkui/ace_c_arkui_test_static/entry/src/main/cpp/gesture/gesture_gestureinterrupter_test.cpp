/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "gesture_gestureinterrupter_test.h"
#include <string>
#include "ani/ani.h"
#include "hilog/log.h"
#include "arkui/native_interface.h"
#include "arkui/native_node.h"
#include "arkui/native_node_ani.h"
#include "arkui/native_type.h"
#include <cstdint>

namespace ArkUIAniTest {

ArkUI_NativeNodeAPI_1* GestureGestureInterrupterTest::nodeAPI = nullptr;

static ArkUI_GestureInterruptResult OnGetSystemFlag(ArkUI_GestureInterruptInfo* info)
{
    auto sysTag = OH_ArkUI_GestureInterruptInfo_GetSystemFlag(info);
    auto event = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto column = OH_ArkUI_GestureEvent_GetNode(event);
    if (!sysTag) {
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        GestureGestureInterrupterTest::nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &color_item);
    } else {
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_BLUE } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        GestureGestureInterrupterTest::nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &color_item);
    }
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

static ArkUI_GestureInterruptResult OnGetRecognizer(ArkUI_GestureInterruptInfo* info)
{
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);
    auto recognizer = OH_ArkUI_GestureInterruptInfo_GetRecognizer(info);
    auto event = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto column = OH_ArkUI_GestureEvent_GetNode(event);
    auto gesture = gestureAPI->getGestureType(recognizer);
    if (gesture == TAP_GESTURE) {
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        GestureGestureInterrupterTest::nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &color_item);
    }
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

static ArkUI_GestureInterruptResult OnGetGestureEvent(ArkUI_GestureInterruptInfo* info)
{
    auto gestureEvent = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto column = OH_ArkUI_GestureEvent_GetNode(gestureEvent);
    ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
    ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
    GestureGestureInterrupterTest::nodeAPI->setAttribute(column, NODE_BACKGROUND_COLOR, &color_item);
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

static ArkUI_GestureInterruptResult OnGetSystemRecognizerType(ArkUI_GestureInterruptInfo* info)
{
    auto recognizerType = OH_ArkUI_GestureInterruptInfo_GetSystemRecognizerType(info);
    auto event = OH_ArkUI_GestureInterruptInfo_GetGestureEvent(info);
    auto button = OH_ArkUI_GestureEvent_GetNode(event);
    if (recognizerType) {
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        GestureGestureInterrupterTest::nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &color_item);
    }
    return GESTURE_INTERRUPT_RESULT_REJECT;
}

static std::shared_ptr<ButtonComponent> CreateButtonNodeWithInterrupter(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetId(id);
    button->SetBackgroundColor(COLOR_RED);
    button->SetMargin(SIZE_10);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, nullptr);
    gestureAPI->addGestureToNode(button->GetComponent(), tapGesture, NORMAL, NORMAL_GESTURE_MASK);
    return button;
}

static void OnEventGesture(ArkUI_GestureEvent* event, void* extraParams)
{
    auto inputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    auto button = OH_ArkUI_GestureEvent_GetNode(event);
    if (inputEvent) {
        ArkUI_NumberValue color_value[] = { { .u32 = COLOR_GREEN } };
        ArkUI_AttributeItem color_item = { color_value, sizeof(color_value) / sizeof(ArkUI_NumberValue) };
        GestureGestureInterrupterTest::nodeAPI->setAttribute(button, NODE_BACKGROUND_COLOR, &color_item);
    }
}

static std::shared_ptr<ButtonComponent> CreateButtonNodeWithInput(
    ArkUI_NativeGestureAPI_1* gestureAPI, const std::string& id)
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_150);
    button->SetHeight(SIZE_100);
    button->SetId(id);
    button->SetBackgroundColor(COLOR_RED);
    button->SetMargin(SIZE_10);
    auto tapGesture = gestureAPI->createTapGesture(PARAM_1, PARAM_1);
    gestureAPI->setGestureEventTarget(tapGesture, GESTURE_EVENT_ACTION_ACCEPT, nullptr, OnEventGesture);
    gestureAPI->addGestureToNode(button->GetComponent(), tapGesture, NORMAL, NORMAL_GESTURE_MASK);
    return button;
}

static auto CreateColumnNode(ArkUI_NativeGestureAPI_1* gestureAPI)
{
    auto column = GestureGestureInterrupterTest::nodeAPI->createNode(ARKUI_NODE_COLUMN);
    auto Column = std::make_shared<ColumnComponent>();
    auto button1 = CreateButtonNodeWithInterrupter(gestureAPI, "button1");
    gestureAPI->setGestureInterrupterToNode(button1->GetComponent(), OnGetSystemFlag);
    auto button2 = CreateButtonNodeWithInterrupter(gestureAPI, "button2");
    gestureAPI->setGestureInterrupterToNode(button2->GetComponent(), OnGetRecognizer);
    auto button3 = CreateButtonNodeWithInterrupter(gestureAPI, "button3");
    gestureAPI->setGestureInterrupterToNode(button3->GetComponent(), OnGetGestureEvent);
    auto button4 = CreateButtonNodeWithInterrupter(gestureAPI, "button4");
    gestureAPI->setGestureInterrupterToNode(button4->GetComponent(), OnGetSystemRecognizerType);
    auto button5 = CreateButtonNodeWithInput(gestureAPI, "button5");
    std::vector<std::shared_ptr<ButtonComponent>> buttons = { button1, button2, button3, button4, button5 };
    for (auto button : buttons) {
        Column->AddChild(button);
    }
    GestureGestureInterrupterTest::nodeAPI->addChild(column, Column->GetComponent());
    return column;
}

void GestureGestureInterrupterTest::CreateNativeNode(ani_env* env, ani_object info, ani_object NodeContent)
{
    OH_LOG_INFO(LOG_APP, " [cf]TestEventInfoGetPressedTime001 start -> 66");
    
    //将入参 NodeContent 与 contentHandle 绑定，后面操作 contentHandle
    ArkUI_NodeContentHandle contentHandle;
    OH_ArkUI_NativeModule_GetNodeContentFromAniValue(env, NodeContent, &contentHandle);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureGestureInterrupterTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto column = CreateColumnNode(gestureAPI);

    // 添加Native组件到contentHandle上用于挂载显示。 新添加的接口
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode start -> 110");
    OH_ArkUI_NodeContent_AddNode(contentHandle, column);
    OH_LOG_INFO(LOG_APP, " [cf]OH_ArkUI_NodeContent_AddNode end -> 116");
    return ;
}
} // namespace ArkUIAniTest