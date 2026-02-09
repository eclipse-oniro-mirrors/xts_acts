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
#include "../include/GameControllerTest.h"

namespace OHOS {
namespace GameController {

static void ButtonInputMonitorCallbackTest01(const struct GamePad_ButtonEvent *buttonEvent) {}

static void AxisInputMonitorCallbackTest01(const struct GamePad_AxisEvent *axisEvent) {}

int32_t ActsGamePadLeftShoulderRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftShoulderRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftShoulderUnregisterButtonInputMonitor01()
{
    OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();

    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightShoulderRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_RightShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightShoulderRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_RightShoulder_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightShoulderUnregisterButtonInputMonitor01()
{
    OH_GamePad_RightShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerUnregisterButtonInputMonitor01()
{
    OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerRegisterAxisInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerRegisterAxisInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftTriggerUnregisterAxisInputMonitor01()
{
    OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightTriggerRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_RightTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightTriggerRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterButtonInputMonitor(nullptr);
    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}


int32_t ActsGamePadRightTriggerUnregisterButtonInputMonitor01()
{
    OH_GamePad_RightTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightTriggerRegisterAxisInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_RightTrigger_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightTriggerRegisterAxisInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightTriggerUnregisterAxisInputMonitor01()
{
    OH_GamePad_RightTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonMenuRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonMenuRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonMenuUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonHomeRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonHome_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonHomeRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonHome_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonHomeUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonHome_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonARegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonA_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonARegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonA_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonAUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonA_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonBRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonB_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonBRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonB_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonBUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonB_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonXRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonX_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonXRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonX_RegisterButtonInputMonitor(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonXUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonX_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonYRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonY_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonYRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonY_RegisterButtonInputMonitor(nullptr);

    OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonYUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonY_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonCRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_ButtonC_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonCRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_ButtonC_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadButtonCUnregisterButtonInputMonitor01()
{
    OH_GamePad_ButtonC_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}


int32_t ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01()
{
    OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadRightButtonRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadRightButtonRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01()
{
    OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadUpButtonRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadUpButtonRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01()
{
    OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadDownButtonRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadDownButtonRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01()
{
    OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadRegisterAxisInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadRegisterAxisInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_Dpad_RegisterAxisInputMonitor(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ActsGamePadDpadUnregisterAxisInputMonitor01()
{
    OH_GamePad_Dpad_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(nullptr);

    OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01()
{
    OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickRegisterAxisInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickRegisterAxisInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(nullptr);

    OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01()
{
    OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickRegisterButtonInputMonitor01()
{
    GameController_ErrorCode code =
        OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickRegisterButtonInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickUnregisterButtonInputMonitor01()
{
    OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickRegisterAxisInputMonitor01()
{
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickRegisterAxisInputMonitor02()
{
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGamePadRightThumbstickUnregisterAxisInputMonitor01()
{
    OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

} // namespace GameController
} // namespace OHOS