/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <cstdint>

namespace ArkUICapiTest {

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
    button->SetWidth(SIZE_40);
    button->SetHeight(SIZE_20);
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
    button->SetWidth(SIZE_40);
    button->SetHeight(SIZE_20);
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

napi_value GestureGestureInterrupterTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInterrupterTest", "CreateNativeNode");

    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = PARAM_64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = { PARAM_0 };
    napi_get_value_string_utf8(env, args[PARAM_0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInterrupterTest", "GetContext env or info is null");
        return nullptr;
    }

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, GestureGestureInterrupterTest::nodeAPI);
    ArkUI_NativeGestureAPI_1* gestureAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_GESTURE, ArkUI_NativeGestureAPI_1, gestureAPI);

    auto column = CreateColumnNode(gestureAPI);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id), column) ==
        INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GestureGestureInterrupterTest",
            "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}
} // namespace ArkUICapiTest