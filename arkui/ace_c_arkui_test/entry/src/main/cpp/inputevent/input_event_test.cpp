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
#include "input_event_test.h"

#include <arkui/native_gesture.h>
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <cstdint>
#include <string>

#include "../manager/plugin_manager.h"
#include "button_component.h"
#include "column_component.h"
#include "row_component.h"
#include "text_component.h"

#define COLUMN_ID 2020
#define TEXT_ID 2121
namespace ArkUICapiTest {
constexpr int32_t LEFT_MOUSE_BUTTON = 1;
constexpr int32_t RIGHT_MOUSE_BUTTON = 2;
constexpr int32_t MIDDLE_MOUSE_BUTTON = 3;
constexpr int32_t MOUSE_PRESSED = 1;
constexpr int32_t MOUSE_RELEASE = 2;
constexpr int32_t MOUSE_MOVEMENT = 3;
constexpr int32_t SOURCETYPE_NONE = 0;
constexpr int32_t SOURCETYPE_MOUSE = 1;
constexpr int32_t SOURCETYPE_TOUCH = 2;
constexpr int32_t SOURCETOLL_UNKNOWN = 0;
constexpr int32_t SOURCETOLL_FINGER = 1;
constexpr int32_t SOURCETOLL_MOUSE = 7;
static std::vector<int32_t> MouseActionVector;
int32_t InputEventTest::eventState = -1;
std::string InputEventTest::funcName = "";

void FunctionMap(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_UIInputEvent_GetType") {
        auto value = OH_ArkUI_UIInputEvent_GetType(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "getType %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_UIInputEvent_GetAction") {
        auto value = OH_ArkUI_UIInputEvent_GetAction(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetAction %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_UIInputEvent_GetSourceType") {
        auto value = OH_ArkUI_UIInputEvent_GetSourceType(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetSourceType %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_UIInputEvent_GetToolType") {
        auto value = OH_ArkUI_UIInputEvent_GetToolType(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetToolType %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_UIInputEvent_GetEventTime") {
        auto value = OH_ArkUI_UIInputEvent_GetEventTime(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetEventTime %{public}lld", value);
        InputEventTest::eventState = 1;
    }
}

void PointEventFunctionMap1(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetPointerCount") {
        auto value = OH_ArkUI_PointerEvent_GetPointerCount(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetPointerCount %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetPointerId") {
        auto value = OH_ArkUI_PointerEvent_GetPointerId(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "GetPointerId %{public}d", value);
        InputEventTest::eventState = value;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetX") {
        auto value = OH_ArkUI_PointerEvent_GetX(uiInputEvent);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "OH_ArkUI_PointerEvent_GetX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetXByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetXByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetXByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetY") {
        auto value = OH_ArkUI_PointerEvent_GetY(uiInputEvent);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "OH_ArkUI_PointerEvent_GetY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetYByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetYByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetYByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetWindowX") {
        auto value = OH_ArkUI_PointerEvent_GetWindowX(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetWindowX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetWindowXByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetWindowXByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetWindowXByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
}

void PointEventFunctionMap2(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetWindowY") {
        auto value = OH_ArkUI_PointerEvent_GetWindowY(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetWindowY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetWindowYByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetWindowYByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetWindowYByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetDisplayX") {
        auto value = OH_ArkUI_PointerEvent_GetDisplayX(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetDisplayX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetDisplayXByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetDisplayXByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetDisplayXByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetDisplayY") {
        auto value = OH_ArkUI_PointerEvent_GetDisplayY(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetDisplayY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetDisplayYByIndex") {
        auto value = OH_ArkUI_PointerEvent_GetDisplayYByIndex(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetDisplayYByIndex %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetPressure") {
        auto value = OH_ArkUI_PointerEvent_GetPressure(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetPressure %{public}f", value);
        InputEventTest::eventState = 1;
    }
}
void PointEventFunctionMap3(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetTiltX") {
        auto value = OH_ArkUI_PointerEvent_GetTiltX(uiInputEvent, 0);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "OH_ArkUI_PointerEvent_GetTiltX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetTiltY") {
        auto value = OH_ArkUI_PointerEvent_GetTiltY(uiInputEvent, 0);
        OH_LOG_Print(
            LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest", "OH_ArkUI_PointerEvent_GetTiltY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetTouchAreaWidth") {
        auto value = OH_ArkUI_PointerEvent_GetTouchAreaWidth(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetTouchAreaWidth %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetTouchAreaHeight") {
        auto value = OH_ArkUI_PointerEvent_GetTouchAreaHeight(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetTouchAreaHeight %{public}f", value);
        InputEventTest::eventState = 1;
    }
}

void HisportyPointEventFunctionMap(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetHistorySize") {
        auto value = OH_ArkUI_PointerEvent_GetHistorySize(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistorySize %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryEventTime") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryEventTime(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryEventTime %{public}lld", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryPointerCount") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryPointerCount(uiInputEvent, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryPointerCount %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryPointerId") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryPointerId(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryPointerId %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryX") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryX(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryY") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryY %{public}f", value);
        InputEventTest::eventState = 1;
    }
}

void HisportyPointEventFunctionMap1(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryWindowX") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryWindowX(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryWindowX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryWindowY") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryWindowY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryWindowY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryDisplayX") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryDisplayX(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryDisplayX %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryDisplayY") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryDisplayY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryDisplayY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryPressure") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryX(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryPressure %{public}d", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryTiltX") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryTiltX %{public}f", value);
        InputEventTest::eventState = 1;
    }
}

void HisportyPointEventFunctionMap2(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryTiltY") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryTiltY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryTiltY %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryWindowY(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryTouchAreaWidth %{public}f", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight") {
        auto value = OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight(uiInputEvent, 0, 0);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_PointerEvent_GetHistoryTouchAreaHeight %{public}f", value);
        InputEventTest::eventState = 1;
    }
}

void AxisFunctionMap(const ArkUI_UIInputEvent* uiInputEvent, const std::string functionName)
{
    if (functionName == "OH_ArkUI_AxisEvent_GetVerticalAxisValue") {
        auto value = OH_ArkUI_AxisEvent_GetVerticalAxisValue(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_AxisEvent_GetVerticalAxisValue %{public}lf", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_AxisEvent_GetHorizontalAxisValue") {
        auto value = OH_ArkUI_AxisEvent_GetHorizontalAxisValue(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_AxisEvent_GetHorizontalAxisValue %{public}lf", value);
        InputEventTest::eventState = 1;
    }
    if (functionName == "OH_ArkUI_AxisEvent_GetPinchAxisScaleValue") {
        auto value = OH_ArkUI_AxisEvent_GetPinchAxisScaleValue(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
            "OH_ArkUI_AxisEvent_GetPinchAxisScaleValue %{public}lf", value);
        InputEventTest::eventState = 1;
    }
}

napi_value InputEventTest::GetEventState(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetEventState eventState=%{public}d",
        InputEventTest::eventState);
    napi_value result;
    napi_create_int32(env, InputEventTest::eventState, &result);
    InputEventTest::eventState = -1;
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetEventState reset eventState=%{public}d",
        InputEventTest::eventState);
    return result;
}

napi_value InputEventTest::SetFuncName(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = 128;
    size_t funcNameStrLength = 0;
    char functionName[128] = { 0 };
    napi_get_value_string_utf8(env, args[0], functionName, length, &funcNameStrLength);
    InputEventTest::funcName = std::string(functionName);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "InputEventTest",
        "SetFuncName InputEventTest::funcName = %{public}s", InputEventTest::funcName.c_str());

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

std::shared_ptr<ColumnComponent> CreateMouseButton()
{
    auto columnMouse = std::make_shared<ColumnComponent>();
    columnMouse->SetWidth(SIZE_400);
    columnMouse->SetHeight(SIZE_300);
    columnMouse->SetBorderWidth(SIZE_5);
    auto buttonMouse = new ButtonComponent();
    buttonMouse->SetWidth(SIZE_200);
    buttonMouse->SetHeight(SIZE_100);
    buttonMouse->SetLable("click");
    buttonMouse->SetMargin(SIZE_10);
    buttonMouse->SetId("buttonMouse");
    auto textShow = new TextComponent();
    textShow->SetWidth(SIZE_300);
    textShow->SetHeight(SIZE_150);
    textShow->SetBackgroundColor(COLOR_PINK);
    buttonMouse->RegisterOnMouse([textShow, buttonMouse](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        FunctionMap(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap3(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
    });
    columnMouse->AddChild(std::shared_ptr<ButtonComponent>(buttonMouse));
    columnMouse->AddChild(std::shared_ptr<TextComponent>(textShow));
    return columnMouse;
}

std::shared_ptr<ColumnComponent> CreateTouchButton()
{
    auto columnTouch = std::make_shared<ColumnComponent>();
    columnTouch->SetWidth(SIZE_400);
    columnTouch->SetHeight(SIZE_300);
    columnTouch->SetBorderWidth(SIZE_5);
    columnTouch->SetMargin(SIZE_10);
    auto textTouch = new TextComponent();
    textTouch->SetWidth(SIZE_300);
    textTouch->SetHeight(SIZE_200);
    textTouch->SetBackgroundColor(COLOR_PINK);
    textTouch->SetMargin(SIZE_10);
    textTouch->SetId("textTouch");
    textTouch->RegisterOnTouch([textTouch](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        FunctionMap(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
        PointEventFunctionMap3(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
        HisportyPointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
    });
    columnTouch->AddChild(std::shared_ptr<TextComponent>(textTouch));
    return columnTouch;
}

napi_value InputEventTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNode");

    size_t argc = 2;
    napi_value args[2] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    size_t lengthFuncName = 128;
    size_t funcNameStrLength = 0;
    char functionName[128] = { 0 };
    napi_get_value_string_utf8(env, args[1], functionName, lengthFuncName, &funcNameStrLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }

    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    InputEventTest::funcName = std::string(funcName);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "InputEventTest::funcName:%{public}s",
        InputEventTest::funcName.c_str());

    auto parentColumn = new ColumnComponent();
    auto columnMouse = CreateMouseButton();
    auto columnTouch = CreateTouchButton();
    parentColumn->AddChild(columnMouse);
    parentColumn->AddChild(columnTouch);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

std::shared_ptr<ButtonComponent> CreateButtonExample()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseRightTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        // MOUSE_PRESSED first, then MOUSE_RELEASE.
        if (mouseButton == RIGHT_MOUSE_BUTTON) {
            if (mouseAction == MOUSE_PRESSED) {
                MouseActionVector.push_back(MOUSE_PRESSED);
            }
            if (mouseAction == MOUSE_RELEASE && MouseActionVector.size() == PARAM_1 &&
                MouseActionVector[0] == MOUSE_PRESSED) {
                button->SetBackgroundColor(COLOR_YELLOW);
            }
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample1()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseLeftTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);

        if (mouseButton == LEFT_MOUSE_BUTTON && mouseAction == MOUSE_PRESSED) {
            button->SetBackgroundColor(COLOR_PURPLE);
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample2()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseMiddleTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        if (mouseButton == MIDDLE_MOUSE_BUTTON && mouseAction == MOUSE_PRESSED) {
            button->SetBackgroundColor(COLOR_PINK);
        }
    });
    return button;
}

std::shared_ptr<ButtonComponent> CreateButtonExample3()
{
    auto button = std::make_shared<ButtonComponent>();
    button->SetWidth(SIZE_200);
    button->SetHeight(SIZE_100);
    button->SetMargin(SIZE_10);
    button->SetBackgroundColor(COLOR_BLUE);
    button->SetFontSize(SIZE_20);
    button->SetId("onMouseMoveTest");
    button->RegisterOnMouse([button](ArkUI_NodeEvent* event) {
        auto* uiInputEvent = OH_ArkUI_NodeEvent_GetInputEvent(event);
        auto mouseAction = OH_ArkUI_MouseEvent_GetMouseAction(uiInputEvent);
        auto mouseButton = OH_ArkUI_MouseEvent_GetMouseButton(uiInputEvent);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest",
            "button mouseAction=%{public}d,mouseButton=%{public}d", mouseAction, mouseButton);
        if (mouseAction == MOUSE_MOVEMENT) {
            button->SetBackgroundColor(COLOR_BLACK);
        }
    });
    return button;
}

napi_value InputEventTest::CreateNativeNodeForMouse(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNodeForMouse");
    MouseActionVector.clear();

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);

    auto parentColumn = new ColumnComponent();
    auto button = CreateButtonExample();
    parentColumn->AddChild(button);

    auto button1 = CreateButtonExample1();
    parentColumn->AddChild(button1);

    auto button2 = CreateButtonExample2();
    parentColumn->AddChild(button2);

    auto button3 = CreateButtonExample3();
    parentColumn->AddChild(button3);

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

ColumnComponent* axisColumn;
void OnActionCallBackAxis(ArkUI_GestureEvent* event, void* extraparam)
{
    auto uiInputEvent = OH_ArkUI_GestureEvent_GetRawInputEvent(event);
    FunctionMap(uiInputEvent, InputEventTest::funcName);
    PointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
    PointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
    PointEventFunctionMap3(uiInputEvent, InputEventTest::funcName);
    HisportyPointEventFunctionMap(uiInputEvent, InputEventTest::funcName);
    HisportyPointEventFunctionMap1(uiInputEvent, InputEventTest::funcName);
    HisportyPointEventFunctionMap2(uiInputEvent, InputEventTest::funcName);
    AxisFunctionMap(uiInputEvent, InputEventTest::funcName);
}
napi_value InputEventTest::CreateNativeNodeForAxis(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "CreateNativeNodeForAxis");
    MouseActionVector.clear();

    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "GetContext env or info is null");
        return nullptr;
    }
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto parentColumn = new ColumnComponent();
    axisColumn = new ColumnComponent();
    axisColumn->SetWidth(SIZE_500);
    axisColumn->SetHeight(SIZE_500);
    axisColumn->SetBackgroundColor(COLOR_RED);
    axisColumn->SetId("AxisID");

    auto guestureAPI = reinterpret_cast<ArkUI_NativeGestureAPI_1*>(
        OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_GESTURE, "ArkUI_NativeGestureAPI_1"));
    auto swipeGuesture = guestureAPI->createSwipeGesture(1, GESTURE_DIRECTION_ALL, PARAM_10);
    guestureAPI->setGestureEventTarget(
        swipeGuesture, GESTURE_EVENT_ACTION_ACCEPT, axisColumn->GetComponent(), &OnActionCallBackAxis);
    guestureAPI->addGestureToNode(axisColumn->GetComponent(), swipeGuesture, PARALLEL, NORMAL_GESTURE_MASK);

    parentColumn->AddChild(std::shared_ptr<ColumnComponent>(axisColumn));

    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), parentColumn->GetComponent()) == INVALID_PARAM) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "InputEventTest", "OH_NativeXComponent_AttachNativeRootNode failed");
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
} // namespace ArkUICapiTest
