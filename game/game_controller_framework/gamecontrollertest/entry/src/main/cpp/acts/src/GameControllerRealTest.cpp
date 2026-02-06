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


#include "../include/GameControllerRealTest.h"
#include "../include/GameControllerModel.h"
#include <GameControllerKit/game_device.h>
#include <GameControllerKit/game_pad.h>
#include <cstdint>
#include <string>
#include <hilog/log.h>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "GameControllerXts"

namespace OHOS {
namespace GameController {
static bool g_isExistRealDevice = false;
static bool g_isReceiveDeviceMonitorEvent = false;
static bool g_isReceiveButtonInputEvent = false;
static bool g_isReceiveAxisInputEvent = false;
static bool g_isHasOnlineDeviceEvent = false;
static bool g_isParseDeviceEventSuccess = true;
static bool g_isParseButtonEventSuccess = true;
static bool g_isParseAxisEventSuccess = true;

static const std::unordered_map<int32_t, std::string> BUTTON_CODE_NAME_TRANSFORMATION = {
    {GamePadButtonTypeEnum::LEFT_SHOULDER, "LeftShoulder"},
    {GamePadButtonTypeEnum::RIGHT_SHOULDER, "RightShoulder"},
    {GamePadButtonTypeEnum::LEFT_TRIGGER, "LeftTrigger"},
    {GamePadButtonTypeEnum::RIGHT_TRIGGER, "RightTrigger"},

    {GamePadButtonTypeEnum::LEFT_THUMBSTICK_BUTTON, "LeftThumbstick"},
    {GamePadButtonTypeEnum::RIGHT_THUMBSTICK_BUTTON, "RightThumbstick"},
    {GamePadButtonTypeEnum::BUTTON_HOME, "ButtonHome"},
    {GamePadButtonTypeEnum::BUTTON_MENU, "ButtonMenu"},
    {GamePadButtonTypeEnum::BUTTON_OPTIONS, "ButtonOptions"},
    {GamePadButtonTypeEnum::BUTTON_A, "ButtonA"},
    {GamePadButtonTypeEnum::BUTTON_B, "ButtonB"},
    {GamePadButtonTypeEnum::BUTTON_C, "ButtonC"},
    {GamePadButtonTypeEnum::BUTTON_X, "ButtonX"},
    {GamePadButtonTypeEnum::BUTTON_Y, "ButtonY"},

    {GamePadButtonTypeEnum::DPAD_UP_BUTTON, "Dpad_UpButton"},
    {GamePadButtonTypeEnum::DPAD_DOWN_BUTTON, "Dpad_DownButton"},
    {GamePadButtonTypeEnum::DPAD_LEFT_BUTTON, "Dpad_LeftButton"},
    {GamePadButtonTypeEnum::DPAD_RIGHT_BUTTON, "Dpad_RightButton"}};

static bool ParseDeviceInfo(GameDevice_DeviceInfo *deviceInfo, int32_t oprType)
{
    std::string log;
    char *deviceId = nullptr;
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceId(deviceInfo, &deviceId);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append("deviceId:").append(deviceId);
    free(deviceId);

    char *name = nullptr;
    code = OH_GameDevice_DeviceInfo_GetName(deviceInfo, &name);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append(",name:").append(name);
    free(name);

    int product;
    code = OH_GameDevice_DeviceInfo_GetProduct(deviceInfo, &product);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append(",product:").append(std::to_string(product));

    int version;
    code = OH_GameDevice_DeviceInfo_GetVersion(deviceInfo, &version);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append(",version:").append(std::to_string(version));

    char *physicalAddress = nullptr;
    code = OH_GameDevice_DeviceInfo_GetPhysicalAddress(deviceInfo, &physicalAddress);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append(",phys:").append(physicalAddress);
    free(physicalAddress);

    GameDevice_DeviceType type;
    code = OH_GameDevice_DeviceInfo_GetDeviceType(deviceInfo, &type);
    if (code != GAME_CONTROLLER_SUCCESS) {
        return false;
    }
    log.append(",type:").append(std::to_string(type));
    if (oprType == 0) {
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest][GetAllDeviceInfo]DeviceInfo: %{public}s", log.c_str());
    } else {
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest][DeviceEvent]DeviceInfo: %{public}s", log.c_str());
    }

    return true;
}

static void DeviceMonitorCallbackTest(const struct GameDevice_DeviceEvent *deviceEvent)
{
    g_isReceiveDeviceMonitorEvent = true;
    GameDevice_StatusChangedType type;
    OH_GameDevice_DeviceEvent_GetChangedType(deviceEvent, &type);
    if (type == ONLINE) {
        g_isHasOnlineDeviceEvent = true;
    }
    if (type != ONLINE && type != OFFLINE) {
        g_isParseDeviceEventSuccess = false;
    } else {
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest]DeviceEvent eventType is %{public}d", static_cast<int32_t>(type));
    }
    GameDevice_DeviceInfo *deviceInfo;
    OH_GameDevice_DeviceEvent_GetDeviceInfo(deviceEvent, &deviceInfo);
    if (!ParseDeviceInfo(deviceInfo, 1)) {
        g_isParseDeviceEventSuccess = false;
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceTest]ParseDeviceInfo failed when handle event");
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
}

static bool CheckButtonCode(int32_t buttonCode, char *buttonCodeName)
{
    if (BUTTON_CODE_NAME_TRANSFORMATION.count(buttonCode) == 0) {
        g_isParseButtonEventSuccess = false;
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] cannot find buttonCode's buttonName");
        return false;
    }

    if (BUTTON_CODE_NAME_TRANSFORMATION.at(buttonCode) != buttonCodeName) {
        g_isParseButtonEventSuccess = false;
        OH_LOG_ERROR(LOG_APP,
                     "[ActsRealDeviceCheckGamePadEvent] buttonCodeName is not same with buttonCode’s buttonName");
        return false;
    }
    return true;
}

static std::string GetPressedButtonInfo(const int32_t count, const struct GamePad_ButtonEvent *buttonEvent)
{
    std::string pressedButtonCodes;
    for (int32_t idx = 0; idx < count; idx++) {
        GamePad_PressedButton *pressedButton;
        OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, idx, &pressedButton);
        int32_t btnCode;
        OH_GamePad_PressedButton_GetButtonCode(pressedButton, &btnCode);
        char *name;
        OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &name);
        CheckButtonCode(btnCode, name);
        if (idx != 0) {
            pressedButtonCodes = pressedButtonCodes.append(";");
        }
        pressedButtonCodes = pressedButtonCodes.append(std::to_string(btnCode) + "|").append(name);
        free(name);
        OH_GamePad_DestroyPressedButton(&pressedButton);
    }
    return pressedButtonCodes;
}

static void OnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent, const std::string &buttonName)
{
    g_isReceiveButtonInputEvent = true;
    std::string temp;
    temp.append("OnButtonEvent:").append(buttonName);
    char *deviceId;
    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseButtonEventSuccess = false;
    }
    temp.append(" ,deviceId:").append(deviceId);
    free(deviceId);
    GamePad_Button_ActionType action;
    code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &action);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseButtonEventSuccess = false;
    }
    temp.append(" ,action:").append(std::to_string(action));
    int32_t buttonCode;
    OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    temp.append(" ,code:").append(std::to_string(buttonCode));
    char *buttonCodeName;
    OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);
    temp.append(" ,codeName:").append(buttonCodeName);
    if (buttonName != buttonCodeName) {
        g_isParseButtonEventSuccess = false;
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] buttonCodeName is not same with buttonName");
    }
    CheckButtonCode(buttonCode, buttonCodeName);
    free(buttonCodeName);
    int64_t actionTime;
    code = OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseButtonEventSuccess = false;
    }
    temp.append(" ,actionTime:").append(std::to_string(actionTime));
    int32_t count;
    code = OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseButtonEventSuccess = false;
    }
    temp.append(" ,count:").append(std::to_string(count));
    temp.append(" ,pressedButtonCodes:").append(GetPressedButtonInfo(count, buttonEvent));
    OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest][buttonEvent]%{public}s", temp.c_str());
}

static void LeftShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftShoulder");
}

static void RightShoulderOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightShoulder");
}

static void LeftTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftTrigger");
}

static void RightTriggerOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightTrigger");
}

static void ButtonMenuOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonMenu");
}

static void ButtonCOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonC");
}

static void ButtonHomeOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonHome");
}

static void ButtonAOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonA");
}

static void ButtonBOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonB");
}

static void ButtonXOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonX");
}

static void ButtonYOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "ButtonY");
}

static void DpadLeftButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_LeftButton");
}

static void DpadRightButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_RightButton");
}

static void DpadUpButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_UpButton");
}

static void DpadDownButtonOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "Dpad_DownButton");
}

static void LeftThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "LeftThumbstick");
}

static void RightThumbstickOnButtonEvent(const struct GamePad_ButtonEvent *buttonEvent)
{
    OnButtonEvent(buttonEvent, "RightThumbstick");
}

static void OnAxisEvent(const struct GamePad_AxisEvent *axisEvent, const std::string &axisName,
                        const std::string axisValue)
{
    g_isReceiveAxisInputEvent = true;
    std::string log;
    log.append("OnAxisEvent:").append(axisName);
    char *deviceId;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    log.append(",deviceId:").append(deviceId);
    free(deviceId);
    GamePad_AxisSourceType axisSourceType;
    code = OH_GamePad_AxisEvent_GetAxisSourceType(axisEvent, &axisSourceType);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    log.append(",axisSourceType:").append(std::to_string(axisSourceType));
    std::int64_t actionTime;
    code = OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    log.append(",actionTime:").append(std::to_string(actionTime));
    log.append(",axisValue:").append(axisValue);
    OH_LOG_INFO(LOG_APP, "[OnAxisEvent]%{public}s", log.c_str());
}

static void LeftTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Brake";
    double brakeAxisValue;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &brakeAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(brakeAxisValue));

    OnAxisEvent(axisEvent, "LeftTrigger_OnAxisEvent", val);
}

static void RightTriggerOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Gas";
    double gasAxisValue;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &gasAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(gasAxisValue));
    OnAxisEvent(axisEvent, "RightTrigger_OnAxisEvent", val);
}

static void DpadOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "HatX";
    double hatXAxisValue;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &hatXAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(hatXAxisValue)).append("_HatY");
    double hatYAxisValue;
    code = OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &hatYAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(hatYAxisValue));
    OnAxisEvent(axisEvent, "Dpad_OnAxisEvent", val);
}

static void LeftThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "X";
    double xAxisValue;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &xAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(xAxisValue)).append("_Y");
    double yAxisValue;
    code = OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &yAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(yAxisValue));
    OnAxisEvent(axisEvent, "LeftThumbstick_OnAxisEvent", val);
}

static void RightThumbstickOnAxisEvent(const struct GamePad_AxisEvent *axisEvent)
{
    std::string val = "Z";
    double zAxisValue;
    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &zAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(zAxisValue)).append("_RZ");
    double rzAxisValue;
    code = OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &rzAxisValue);
    if (code != GAME_CONTROLLER_SUCCESS) {
        g_isParseAxisEventSuccess = false;
    }
    val.append(std::to_string(rzAxisValue));
    OnAxisEvent(axisEvent, "RightThumbstick_OnAxisEvent", val);
}

static void RegisterAllMonitor()
{
    OH_GameDevice_RegisterDeviceMonitor(DeviceMonitorCallbackTest);
    OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(LeftShoulderOnButtonEvent);
    OH_GamePad_RightShoulder_RegisterButtonInputMonitor(RightShoulderOnButtonEvent);
    OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(LeftTriggerOnButtonEvent);
    OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(LeftTriggerOnAxisEvent);
    OH_GamePad_RightTrigger_RegisterButtonInputMonitor(RightTriggerOnButtonEvent);
    OH_GamePad_RightTrigger_RegisterAxisInputMonitor(RightTriggerOnAxisEvent);
    OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(ButtonMenuOnButtonEvent);
    OH_GamePad_ButtonHome_RegisterButtonInputMonitor(ButtonHomeOnButtonEvent);
    OH_GamePad_ButtonA_RegisterButtonInputMonitor(ButtonAOnButtonEvent);
    OH_GamePad_ButtonB_RegisterButtonInputMonitor(ButtonBOnButtonEvent);
    OH_GamePad_ButtonX_RegisterButtonInputMonitor(ButtonXOnButtonEvent);
    OH_GamePad_ButtonY_RegisterButtonInputMonitor(ButtonYOnButtonEvent);
    OH_GamePad_ButtonC_RegisterButtonInputMonitor(ButtonCOnButtonEvent);
    OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(DpadLeftButtonOnButtonEvent);
    OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(DpadRightButtonOnButtonEvent);
    OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(DpadUpButtonOnButtonEvent);
    OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(DpadDownButtonOnButtonEvent);
    OH_GamePad_Dpad_RegisterAxisInputMonitor(DpadOnAxisEvent);
    OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(LeftThumbstickOnButtonEvent);
    OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(LeftThumbstickOnAxisEvent);
    OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(RightThumbstickOnButtonEvent);
    OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(RightThumbstickOnAxisEvent);
}

int32_t ActsRealDeviceHasRealDevice() { return g_isExistRealDevice ? 1 : 0; }

int32_t ActsRealDeviceGetAllDevices()
{
    RegisterAllMonitor();
    GameDevice_AllDeviceInfos *allDeviceInfos = nullptr;
    GameController_ErrorCode code = OH_GameDevice_GetAllDeviceInfos(&allDeviceInfos);
    if (code != 0) {
        return code;
    }
    int count = 0;
    OH_GameDevice_AllDeviceInfos_GetCount(allDeviceInfos, &count);
    if (count == 0) {
        // 没有任何外设，用例后面就不用执行了
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest]no device");
        OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
        return code;
    }
    for (int idx = 0; idx < count; idx++) {
        GameDevice_DeviceInfo *deviceInfo;
        code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(allDeviceInfos, idx, &deviceInfo);
        if (code != GAME_CONTROLLER_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceTest]GetDeviceInfo Failed, %{public}d", code);
            break;
        }
        if (!ParseDeviceInfo(deviceInfo, 0)) {
            // 解析deviceInfo失败了，用例返回失败即可
            code = GAME_CONTROLLER_PARAM_ERROR;
            OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceTest]ParseDeviceInfo failed when GetAllDeviceInfo");
            break;
        }
        OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    }
    g_isExistRealDevice = true;
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    OH_LOG_INFO(LOG_APP, "[ActsRealDeviceTest] get all devices test Success");
    return static_cast<int32_t>(code);
}

int32_t ActsRealDeviceCheckDeviceEvent()
{
    /**
     * 1. 必须收到设备事件
     * 2. 必须有设备上线事件
     * 3. 必须解析事件成功
     */
    if (!g_isReceiveDeviceMonitorEvent) {
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckDeviceEvent] isReceiveDeviceMonitorEvent is false");
        return -1;
    }

    if (!g_isParseDeviceEventSuccess) {
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckDeviceEvent] isParseDeviceEventSuccess is false");
        return -1;
    }

    if (!g_isHasOnlineDeviceEvent) {
        OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckDeviceEvent] isHasOnlineDeviceEvent is false");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "[ActsRealDeviceCheckDeviceEvent] CheckDeviceEvent success");
    return 0;
}

int32_t ActsRealDeviceCheckGamePadEvent()
{
    if (g_isReceiveButtonInputEvent) {
        if (!g_isParseButtonEventSuccess) {
            OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] isParseButtonEventSuccess is false");
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] isParseButtonEventSuccess is true");
    } else {
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] no button event");
    }

    if (g_isReceiveAxisInputEvent) {
        if (!g_isParseAxisEventSuccess) {
            OH_LOG_ERROR(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] isParseAxisEventSuccess is false");
            return -1;
        }
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] isParseAxisEventSuccess is true");
    } else {
        OH_LOG_INFO(LOG_APP, "[ActsRealDeviceCheckGamePadEvent] no axis event");
    }
    return 0;
}
} // namespace GameController
}