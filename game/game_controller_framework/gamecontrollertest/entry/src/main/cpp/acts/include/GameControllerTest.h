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

#ifndef APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_TEST_H
#define APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_TEST_H
#include <cstdint>
#include <string>

namespace OHOS {
namespace GameController {
int32_t ActsGameDeviceGetAllDeviceInfos01();

int32_t ActsGameDeviceRegisterDeviceMonitor01();

int32_t ActsGameDeviceRegisterDeviceMonitor02();

int32_t ActsGameDeviceUnregisterDeviceMonitor01();

int32_t ActsGameDeviceDestroyAllDeviceInfos01();

int32_t ActsGameDeviceDestroyAllDeviceInfos02();

int32_t ActsGameDeviceAllDeviceInfosGetCount01();

int32_t ActsGameDeviceAllDeviceInfosGetCount02();

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo01();

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo02();

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo03();

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo04();

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo05();

int32_t ActsGameDeviceDeviceEventGetChangedType01();

int32_t ActsGameDeviceDeviceEventGetChangedType02();

int32_t ActsGameDeviceDeviceEventGetDeviceInfo01();

int32_t ActsGameDeviceDeviceEventGetDeviceInfo02();

int32_t ActsGameDeviceDestroyDeviceInfo01();

int32_t ActsGameDeviceDestroyDeviceInfo02();

int32_t ActsGameDeviceDeviceInfoGetDeviceId01();

int32_t ActsGameDeviceDeviceInfoGetDeviceId02();

int32_t ActsGameDeviceDeviceInfoGetDeviceId03();

int32_t ActsGameDeviceDeviceInfoGetName01();

int32_t ActsGameDeviceDeviceInfoGetName02();

int32_t ActsGameDeviceDeviceInfoGetName03();

int32_t ActsGameDeviceDeviceInfoGetProduct01();

int32_t ActsGameDeviceDeviceInfoGetProduct02();

int32_t ActsGameDeviceDeviceInfoGetVersion01();

int32_t ActsGameDeviceDeviceInfoGetVersion02();

int32_t ActsGameDeviceDeviceInfoGetPhys01();

int32_t ActsGameDeviceDeviceInfoGetPhys02();

int32_t ActsGameDeviceDeviceInfoGetPhys03();

int32_t ActsGameDeviceDeviceInfoGetDeviceType01();

int32_t ActsGameDeviceDeviceInfoGetDeviceType02();

int32_t ActsGamePadLeftShoulderRegisterButtonInputMonitor01();

int32_t ActsGamePadLeftShoulderRegisterButtonInputMonitor02();

int32_t ActsGamePadLeftShoulderUnregisterButtonInputMonitor01();

int32_t ActsGamePadRightShoulderRegisterButtonInputMonitor01();

int32_t ActsGamePadRightShoulderRegisterButtonInputMonitor02();

int32_t ActsGamePadRightShoulderUnregisterButtonInputMonitor01();

int32_t ActsGamePadLeftTriggerRegisterButtonInputMonitor01();

int32_t ActsGamePadLeftTriggerRegisterButtonInputMonitor02();

int32_t ActsGamePadLeftTriggerUnregisterButtonInputMonitor01();

int32_t ActsGamePadLeftTriggerRegisterAxisInputMonitor01();

int32_t ActsGamePadLeftTriggerRegisterAxisInputMonitor02();

int32_t ActsGamePadLeftTriggerUnregisterAxisInputMonitor01();

int32_t ActsGamePadRightTriggerRegisterButtonInputMonitor01();

int32_t ActsGamePadRightTriggerRegisterButtonInputMonitor02();

int32_t ActsGamePadRightTriggerUnregisterButtonInputMonitor01();

int32_t ActsGamePadRightTriggerRegisterAxisInputMonitor01();

int32_t ActsGamePadRightTriggerRegisterAxisInputMonitor02();

int32_t ActsGamePadRightTriggerUnregisterAxisInputMonitor01();

int32_t ActsGamePadButtonMenuRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonMenuRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonMenuUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonHomeRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonHomeRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonHomeUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonARegisterButtonInputMonitor01();

int32_t ActsGamePadButtonARegisterButtonInputMonitor02();

int32_t ActsGamePadButtonAUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonBRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonBRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonBUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonXRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonXRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonXUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonYRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonYRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonYUnregisterButtonInputMonitor01();

int32_t ActsGamePadButtonCRegisterButtonInputMonitor01();

int32_t ActsGamePadButtonCRegisterButtonInputMonitor02();

int32_t ActsGamePadButtonCUnregisterButtonInputMonitor01();

int32_t ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01();

int32_t ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02();

int32_t ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01();

int32_t ActsGamePadDpadRightButtonRegisterButtonInputMonitor01();

int32_t ActsGamePadDpadRightButtonRegisterButtonInputMonitor02();

int32_t ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01();

int32_t ActsGamePadDpadUpButtonRegisterButtonInputMonitor01();

int32_t ActsGamePadDpadUpButtonRegisterButtonInputMonitor02();

int32_t ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01();

int32_t ActsGamePadDpadDownButtonRegisterButtonInputMonitor01();

int32_t ActsGamePadDpadDownButtonRegisterButtonInputMonitor02();

int32_t ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01();

int32_t ActsGamePadDpadRegisterAxisInputMonitor01();

int32_t ActsGamePadDpadRegisterAxisInputMonitor02();

int32_t ActsGamePadDpadUnregisterAxisInputMonitor01();

int32_t ActsGamePadLeftThumbstickRegisterButtonInputMonitor01();

int32_t ActsGamePadLeftThumbstickRegisterButtonInputMonitor02();

int32_t ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01();

int32_t ActsGamePadLeftThumbstickRegisterAxisInputMonitor01();

int32_t ActsGamePadLeftThumbstickRegisterAxisInputMonitor02();

int32_t ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01();

int32_t ActsGamePadRightThumbstickRegisterButtonInputMonitor01();

int32_t ActsGamePadRightThumbstickRegisterButtonInputMonitor02();

int32_t ActsGamePadRightThumbstickUnregisterButtonInputMonitor01();

int32_t ActsGamePadRightThumbstickRegisterAxisInputMonitor01();

int32_t ActsGamePadRightThumbstickRegisterAxisInputMonitor02();

int32_t ActsGamePadRightThumbstickUnregisterAxisInputMonitor01();

int32_t ActsGameControllerGamePadButtonEventGetDeviceId01();

int32_t ActsGameControllerGamePadButtonEventGetDeviceId02();

int32_t ActsGameControllerGamePadButtonEventGetDeviceId03();

int32_t ActsGameControllerGamePadButtonEventGetButtonAction01();

int32_t ActsGameControllerGamePadButtonEventGetButtonAction02();

int32_t ActsGameControllerGamePadButtonEventGetButtonCode01();

int32_t ActsGameControllerGamePadButtonEventGetButtonCode02();

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName01();

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName02();

int32_t ActsGameControllerGamePadButtonEventGetButtonCodeName03();

int32_t ActsGameControllerGamePadPressedButtonsGetCount01();

int32_t ActsGameControllerGamePadPressedButtonsGetCount02();

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo01();

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo02();

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo03();

int32_t ActsGameControllerGamePadPressedButtonsGetButtonInfo04();

int32_t ActsGameControllerGamePadDestroyPressedButton01();

int32_t ActsGameControllerGamePadDestroyPressedButton02();

int32_t ActsGameControllerGamePadPressedButtonGetButtonCode01();

int32_t ActsGameControllerGamePadPressedButtonGetButtonCode02();

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName01();

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName02();

int32_t ActsGameControllerGamePadPressedButtonGetButtonCodeName03();

int32_t ActsGameControllerGamePadButtonEventGetActionTime01();

int32_t ActsGameControllerGamePadButtonEventGetActionTime02();

int32_t ActsGameControllerGamePadAxisEventGetDeviceId01();

int32_t ActsGameControllerGamePadAxisEventGetDeviceId02();

int32_t ActsGameControllerGamePadAxisEventGetDeviceId03();

int32_t ActsGameControllerGamePadAxisEventGetAxisSourceType01();

int32_t ActsGameControllerGamePadAxisEventGetAxisSourceType02();

int32_t ActsGameControllerGamePadAxisEventGetXAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetXAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetYAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetYAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetZAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetZAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetRZAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetRZAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetHatXAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetHatXAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetHatYAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetHatYAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetBrakeAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetBrakeAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue01();

int32_t ActsGameControllerGamePadAxisEventGetGasAxisValue02();

int32_t ActsGameControllerGamePadAxisEventGetActionTime01();

int32_t ActsGameControllerGamePadAxisEventGetActionTime02();
}
}

#endif //APP_GAMECONTROLLER_TEST_GAME_CONTROLLER_TEST_H