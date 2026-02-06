/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdint>
#include <cstdint>
#include <GameControllerKit/game_pad.h>
#include <GameControllerKit/game_pad_event.h>
#include "../include/GameControllerTest.h"
#include "../include/GameControllerModel.h"

namespace OHOS {
namespace GameController {
namespace {
const int64_t ACTION_TIME = 2222;
const int64_t BTN_ACTION_TIME = 1111;
const double X_VALUE = 8.0;
const double Y_VALUE = 1.0;
const double Z_VALUE = 2.0;
const double RZ_VALUE = 3.0;
const double BREAK_VALUE = 4.0;
const double GAS_VALUE = 5.0;
const double HAT_X_VALUE = 6.0;
const double HAT_Y_VALUE = 7.0;
const char *KEY_NAME_A = "ButtonA";
const char *KEY_NAME_B = "ButtonB";
const char *UNIQ = "uniq";
} // namespace

static GamePad_ButtonEvent *CreateButtonEvent(GamePad_Button_ActionType actionType)
{
    GamePadButtonEvent *gamePadButtonEvent = new GamePadButtonEvent();
    gamePadButtonEvent->id = 1;
    gamePadButtonEvent->uniq = UNIQ;
    gamePadButtonEvent->keyCode = GamePadButtonTypeEnum::BUTTON_A;
    gamePadButtonEvent->keyCodeName = KEY_NAME_A;
    gamePadButtonEvent->actionTime = BTN_ACTION_TIME;
    gamePadButtonEvent->keyAction = actionType;
    KeyInfo keyInfo;
    keyInfo.keyCode = GamePadButtonTypeEnum::BUTTON_B;
    keyInfo.keyCodeName = KEY_NAME_B;
    gamePadButtonEvent->keys.push_back(keyInfo);
    return (GamePad_ButtonEvent *)gamePadButtonEvent;
}

static GamePad_AxisEvent *CreateAxisEvent(GamePad_AxisSourceType axisSourceType)
{
    GamePadAxisEvent *gamePadAxisEvent = new GamePadAxisEvent();
    gamePadAxisEvent->uniq = UNIQ;
    gamePadAxisEvent->axisSourceType = static_cast<GamePadAxisSourceTypeEnum>(axisSourceType);
    gamePadAxisEvent->xValue = X_VALUE;
    gamePadAxisEvent->yValue = Y_VALUE;
    gamePadAxisEvent->zValue = Z_VALUE;
    gamePadAxisEvent->rzValue = RZ_VALUE;
    gamePadAxisEvent->brakeValue = BREAK_VALUE;
    gamePadAxisEvent->gasValue = GAS_VALUE;
    gamePadAxisEvent->hatxValue = HAT_X_VALUE;
    gamePadAxisEvent->hatyValue = HAT_Y_VALUE;
    gamePadAxisEvent->actionTime = ACTION_TIME;

    return (GamePad_AxisEvent *)gamePadAxisEvent;
}

static void DestroyButtonEvent(GamePad_ButtonEvent *buttonEvent)
{
    delete buttonEvent;
    buttonEvent = nullptr;
}

static void DestroyAxisEvent(GamePad_AxisEvent *axisEvent)
{
    delete axisEvent;
    axisEvent = nullptr;
}

static bool IsNotSame(double val1, double val2)
{
    const double epsilon = 1e-10; // 自定义的精度范围
    return fabs(val1 - val2) >= epsilon;
}

int32_t ActsGameControllerGamePadButtonEventGetDeviceId01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);
    if (strcmp(deviceId, UNIQ) != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetDeviceId02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetDeviceId03()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, nullptr);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonAction01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_Button_ActionType actionType;
    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &actionType);
    if (actionType != GamePad_Button_ActionType::DOWN) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
        DestroyButtonEvent(buttonEvent);
        return static_cast<int32_t>(code);
    }
    DestroyButtonEvent(buttonEvent);
    
    GamePad_ButtonEvent *buttonEventNew = CreateButtonEvent(UP);
    GamePad_Button_ActionType actionTypeNew;
    code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEventNew, &actionTypeNew);
    if (actionTypeNew != GamePad_Button_ActionType::UP) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEventNew);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonAction02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    GamePad_Button_ActionType actionType;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &actionType);

    return static_cast<int32_t>(code);
}


int32_t ActsGameControllerGamePadButtonEventGetButtonCode01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    if (buttonCode != GamePadButtonTypeEnum::BUTTON_A) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonCode02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    char *buttonCodeName = nullptr;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);
    if (strcmp(buttonCodeName, KEY_NAME_A) != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    char *buttonCodeName;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName03()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, nullptr);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetCount01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    int32_t count = 0;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);
    if (count != 1) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetCount02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int32_t count;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo03()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 1, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo04()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, -1, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadDestroyPressedButton01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;

    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    GameController_ErrorCode code = OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadDestroyPressedButton02()
{
    GameController_ErrorCode code = OH_GamePad_DestroyPressedButton(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonGetButtonCode01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;
    int32_t buttonCode;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCode(pressedButton, &buttonCode);
    if (buttonCode != GamePadButtonTypeEnum::BUTTON_B) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonGetButtonCode02()
{
    GamePad_PressedButton *pressedButton = nullptr;
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCode(pressedButton, &buttonCode);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    char *buttonCodeName = nullptr;
    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &buttonCodeName);
    if (strcmp(buttonCodeName, KEY_NAME_B) != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName02()
{
    GamePad_PressedButton *pressedButton = nullptr;
    char *buttonCodeName;

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &buttonCodeName);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName03()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    GamePad_PressedButton *pressedButton;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, nullptr);
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}


int32_t ActsGameControllerGamePadButtonEventGetActionTime01()
{
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent(DOWN);
    int64_t actionTime = 0;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);
    if (actionTime != BTN_ACTION_TIME) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadButtonEventGetActionTime02()
{
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetDeviceId01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::LEFT_THUMBSTICK);
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);
    if (strcmp(deviceId, UNIQ) != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetDeviceId02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetDeviceId03()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::RIGHT_THUMBSTICK);

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, nullptr);
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

bool CheckGetAxisSourceType(GamePad_AxisSourceType type)
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(type);
    GamePad_AxisSourceType axisSourceType;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetAxisSourceType(axisEvent, &axisSourceType);
    DestroyAxisEvent(axisEvent);
    if (axisSourceType != type) {
        return false;
    }
    return true;
}

int32_t ActsGameControllerGamePadAxisEventGetAxisSourceType01()
{
    GameController_ErrorCode code = GAME_CONTROLLER_SUCCESS;
    if (CheckGetAxisSourceType(GamePad_AxisSourceType::DPAD)
        && GamePad_AxisSourceType::LEFT_THUMBSTICK
        && GamePad_AxisSourceType::RIGHT_THUMBSTICK
        && GamePad_AxisSourceType::LEFT_TRIGGER
        && GamePad_AxisSourceType::RIGHT_TRIGGER) {
        code = GameController_ErrorCode::GAME_CONTROLLER_SUCCESS;
    } else {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetAxisSourceType02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    GamePad_AxisSourceType axisSourceType;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetAxisSourceType(axisEvent, &axisSourceType);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetXAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::RIGHT_TRIGGER);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, X_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetXAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetYAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, Y_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetYAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetZAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, Z_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetZAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetRZAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, RZ_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetRZAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetHatXAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, HAT_X_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetHatXAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetHatYAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, HAT_Y_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetHatYAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetBrakeAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, BREAK_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetBrakeAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    double axisValue = 0;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, GAS_VALUE)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetActionTime01()
{
    GamePad_AxisEvent *axisEvent = CreateAxisEvent(GamePad_AxisSourceType::DPAD);
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);
    if (actionTime != ACTION_TIME) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ActsGameControllerGamePadAxisEventGetActionTime02()
{
    GamePad_AxisEvent *axisEvent = nullptr;
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);

    return static_cast<int32_t>(code);
}
} // namespace GameController
} // namespace OHOS