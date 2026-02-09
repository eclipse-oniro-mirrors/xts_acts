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
#include "napi/native_api.h"
#include "acts/include/GameControllerTest.h"
#include "acts/include/GameControllerRealTest.h"

template <typename Func>
static inline napi_value CreateTestFunction(Func func, napi_env env, napi_callback_info /*info*/)
{
    napi_value retVal = nullptr;
    int32_t ret = func();
    napi_create_int32(env, ret, &retVal);
    return retVal;
}

// game_device_test begin
static napi_value ActsGameDeviceGetAllDeviceInfos01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceGetAllDeviceInfos01, env, info);
}

static napi_value ActsGameDeviceRegisterDeviceMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceRegisterDeviceMonitor01, env, info);
}

static napi_value ActsGameDeviceRegisterDeviceMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceRegisterDeviceMonitor02, env, info);
}

static napi_value ActsGameDeviceUnregisterDeviceMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceUnregisterDeviceMonitor01, env, info);
}

static napi_value ActsGameDeviceDestroyAllDeviceInfos01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDestroyAllDeviceInfos01, env, info);
}

static napi_value ActsGameDeviceDestroyAllDeviceInfos02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDestroyAllDeviceInfos02, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetCount01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetCount01, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetCount02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetCount02, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetDeviceInfo01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetDeviceInfo01, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetDeviceInfo02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetDeviceInfo02, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetDeviceInfo03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetDeviceInfo03, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetDeviceInfo04(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetDeviceInfo04, env, info);
}

static napi_value ActsGameDeviceAllDeviceInfosGetDeviceInfo05(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceAllDeviceInfosGetDeviceInfo05, env, info);
}
// game_device_test end

// game_device_event_test begin
static napi_value ActsGameDeviceDeviceEventGetChangedType01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceEventGetChangedType01, env, info);
}

static napi_value ActsGameDeviceDeviceEventGetChangedType02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceEventGetChangedType02, env, info);
}

static napi_value ActsGameDeviceDeviceEventGetDeviceInfo01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceEventGetDeviceInfo01, env, info);
}

static napi_value ActsGameDeviceDeviceEventGetDeviceInfo02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceEventGetDeviceInfo02, env, info);
}

static napi_value ActsGameDeviceDestroyDeviceInfo01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDestroyDeviceInfo01, env, info);
}

static napi_value ActsGameDeviceDestroyDeviceInfo02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDestroyDeviceInfo02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetDeviceId01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetDeviceId01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetDeviceId02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetDeviceId02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetDeviceId03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetDeviceId03, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetName01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetName01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetName02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetName02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetName03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetName03, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetProduct01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetProduct01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetProduct02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetProduct02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetVersion01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetVersion01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetVersion02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetVersion02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetPhys01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetPhys01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetPhys02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetPhys02, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetPhys03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetPhys03, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetDeviceType01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetDeviceType01, env, info);
}

static napi_value ActsGameDeviceDeviceInfoGetDeviceType02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameDeviceDeviceInfoGetDeviceType02, env, info);
}

// game_device_event_test end

// game_pad_test begin
static napi_value ActsGamePadLeftShoulderRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftShoulderRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftShoulderRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftShoulderRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadLeftShoulderUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftShoulderUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadRightShoulderRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightShoulderRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadRightShoulderRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightShoulderRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadRightShoulderUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightShoulderUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftTriggerRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftTriggerRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadLeftTriggerUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftTriggerRegisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerRegisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftTriggerRegisterAxisInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerRegisterAxisInputMonitor02, env, info);
}

static napi_value ActsGamePadLeftTriggerUnregisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftTriggerUnregisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadRightTriggerRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadRightTriggerRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadRightTriggerUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadRightTriggerRegisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerRegisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadRightTriggerRegisterAxisInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerRegisterAxisInputMonitor02, env, info);
}

static napi_value ActsGamePadRightTriggerUnregisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightTriggerUnregisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonMenuRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonMenuRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonMenuRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonMenuRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonMenuUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonMenuUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonHomeRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonHomeRegisterButtonInputMonitor01, env, info);
}
static napi_value ActsGamePadButtonHomeRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonHomeRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonHomeUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonHomeUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonARegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonARegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonARegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonARegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonAUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonAUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonBRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonBRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonBRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonBRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonBUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonBUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonXRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonXRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonXRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonXRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonXUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonXUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonYRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonYRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonYRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonYRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonYUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonYUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonCRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonCRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadButtonCRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonCRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadButtonCUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadButtonCUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01, env,
                              info);
}

static napi_value ActsGamePadDpadRightButtonRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadRightButtonRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadRightButtonRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadRightButtonRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01, env,
                              info);
}

static napi_value ActsGamePadDpadUpButtonRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadUpButtonRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadUpButtonRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadUpButtonRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadDownButtonRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadDownButtonRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadDownButtonRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadDownButtonRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01, env,
                              info);
}

static napi_value ActsGamePadDpadRegisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadRegisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadDpadRegisterAxisInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadRegisterAxisInputMonitor02, env, info);
}

static napi_value ActsGamePadDpadUnregisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadDpadUnregisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftThumbstickRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftThumbstickRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01, env,
                              info);
}

static napi_value ActsGamePadLeftThumbstickRegisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickRegisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadLeftThumbstickRegisterAxisInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickRegisterAxisInputMonitor02, env, info);
}

static napi_value ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadRightThumbstickRegisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickRegisterButtonInputMonitor01, env, info);
}

static napi_value ActsGamePadRightThumbstickRegisterButtonInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickRegisterButtonInputMonitor02, env, info);
}

static napi_value ActsGamePadRightThumbstickUnregisterButtonInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickUnregisterButtonInputMonitor01, env,
                              info);
}

static napi_value ActsGamePadRightThumbstickRegisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickRegisterAxisInputMonitor01, env, info);
}

static napi_value ActsGamePadRightThumbstickRegisterAxisInputMonitor02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickRegisterAxisInputMonitor02, env, info);
}

static napi_value ActsGamePadRightThumbstickUnregisterAxisInputMonitor01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGamePadRightThumbstickUnregisterAxisInputMonitor01, env, info);
}

// game_pad_test end

// game_pad_event_test begin

static napi_value ActsGameControllerGamePadButtonEventGetDeviceId01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetDeviceId01, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetDeviceId02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetDeviceId02, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetDeviceId03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetDeviceId03, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonAction01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonAction01, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonAction02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonAction02, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonCode01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonCode01, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonCode02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonCode02, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonCodeName01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonCodeName01, env,
                              info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonCodeName02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonCodeName02, env,
                              info);
}

static napi_value ActsGameControllerGamePadButtonEventGetButtonCodeName03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetButtonCodeName03, env,
                              info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetCount01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetCount01, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetCount02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetCount02, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetButtonInfo01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetButtonInfo01, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetButtonInfo02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetButtonInfo02, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetButtonInfo03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetButtonInfo03, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonsGetButtonInfo04(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonsGetButtonInfo04, env, info);
}

static napi_value ActsGameControllerGamePadDestroyPressedButton01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadDestroyPressedButton01, env, info);
}

static napi_value ActsGameControllerGamePadDestroyPressedButton02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadDestroyPressedButton02, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonGetButtonCode01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonGetButtonCode01, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonGetButtonCode02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonGetButtonCode02, env, info);
}

static napi_value ActsGameControllerGamePadPressedButtonGetButtonCodeName01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonGetButtonCodeName01, env,
                              info);
}

static napi_value ActsGameControllerGamePadPressedButtonGetButtonCodeName02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonGetButtonCodeName02, env,
                              info);
}

static napi_value ActsGameControllerGamePadPressedButtonGetButtonCodeName03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadPressedButtonGetButtonCodeName03, env,
                              info);
}

static napi_value ActsGameControllerGamePadButtonEventGetActionTime01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetActionTime01, env, info);
}

static napi_value ActsGameControllerGamePadButtonEventGetActionTime02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadButtonEventGetActionTime02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetDeviceId01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetDeviceId01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetDeviceId02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetDeviceId02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetDeviceId03(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetDeviceId03, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetAxisSourceType01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetAxisSourceType01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetAxisSourceType02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetAxisSourceType02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetXAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetXAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetXAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetXAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetYAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetYAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetYAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetYAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetZAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetZAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetZAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetZAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetRZAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetRZAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetRZAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetRZAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetHatXAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetHatXAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetHatXAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetHatXAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetHatYAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetHatYAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetHatYAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetHatYAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetBrakeAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetBrakeAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetBrakeAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetBrakeAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetGasAxisValue01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetGasAxisValue01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetGasAxisValue02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetGasAxisValue02, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetActionTime01(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetActionTime01, env, info);
}

static napi_value ActsGameControllerGamePadAxisEventGetActionTime02(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsGameControllerGamePadAxisEventGetActionTime02, env, info);
}

static napi_value ActsRealDeviceGetAllDevices(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsRealDeviceGetAllDevices, env, info);
}

static napi_value ActsRealDeviceHasRealDevice(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsRealDeviceHasRealDevice, env, info);
}

static napi_value ActsRealDeviceCheckDeviceEvent(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsRealDeviceCheckDeviceEvent, env, info);
}

static napi_value ActsRealDeviceCheckGamePadEvent(napi_env env, napi_callback_info info)
{
    return CreateTestFunction(&OHOS::GameController::ActsRealDeviceCheckGamePadEvent, env, info);
}

// game_pad_event_test end

napi_property_descriptor desc[] = {
    {"ActsGameDeviceGetAllDeviceInfos01", nullptr, ActsGameDeviceGetAllDeviceInfos01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceRegisterDeviceMonitor01", nullptr, ActsGameDeviceRegisterDeviceMonitor01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceRegisterDeviceMonitor02", nullptr, ActsGameDeviceRegisterDeviceMonitor02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceUnregisterDeviceMonitor01", nullptr, ActsGameDeviceUnregisterDeviceMonitor01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDestroyAllDeviceInfos01", nullptr, ActsGameDeviceDestroyAllDeviceInfos01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDestroyAllDeviceInfos02", nullptr, ActsGameDeviceDestroyAllDeviceInfos02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetCount01", nullptr, ActsGameDeviceAllDeviceInfosGetCount01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetCount02", nullptr, ActsGameDeviceAllDeviceInfosGetCount02, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetDeviceInfo01", nullptr, ActsGameDeviceAllDeviceInfosGetDeviceInfo01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetDeviceInfo02", nullptr, ActsGameDeviceAllDeviceInfosGetDeviceInfo02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetDeviceInfo03", nullptr, ActsGameDeviceAllDeviceInfosGetDeviceInfo03, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetDeviceInfo04", nullptr, ActsGameDeviceAllDeviceInfosGetDeviceInfo04, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGameDeviceAllDeviceInfosGetDeviceInfo05", nullptr, ActsGameDeviceAllDeviceInfosGetDeviceInfo05, nullptr,
     nullptr, nullptr, napi_default, nullptr},

    {"ActsGameDeviceDeviceEventGetChangedType01", nullptr, ActsGameDeviceDeviceEventGetChangedType01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDeviceEventGetChangedType02", nullptr, ActsGameDeviceDeviceEventGetChangedType02, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDeviceEventGetDeviceInfo01", nullptr, ActsGameDeviceDeviceEventGetDeviceInfo01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDeviceEventGetDeviceInfo02", nullptr, ActsGameDeviceDeviceEventGetDeviceInfo02, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDestroyDeviceInfo01", nullptr, ActsGameDeviceDestroyDeviceInfo01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDestroyDeviceInfo02", nullptr, ActsGameDeviceDestroyDeviceInfo02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetDeviceId01", nullptr, ActsGameDeviceDeviceInfoGetDeviceId01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetDeviceId02", nullptr, ActsGameDeviceDeviceInfoGetDeviceId02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetDeviceId03", nullptr, ActsGameDeviceDeviceInfoGetDeviceId03, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetName01", nullptr, ActsGameDeviceDeviceInfoGetName01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetName02", nullptr, ActsGameDeviceDeviceInfoGetName02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetName03", nullptr, ActsGameDeviceDeviceInfoGetName02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetProduct01", nullptr, ActsGameDeviceDeviceInfoGetProduct01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetProduct02", nullptr, ActsGameDeviceDeviceInfoGetProduct02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetVersion01", nullptr, ActsGameDeviceDeviceInfoGetVersion01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetVersion02", nullptr, ActsGameDeviceDeviceInfoGetVersion02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetPhys01", nullptr, ActsGameDeviceDeviceInfoGetPhys01, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetPhys02", nullptr, ActsGameDeviceDeviceInfoGetPhys02, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetPhys03", nullptr, ActsGameDeviceDeviceInfoGetPhys03, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetDeviceType01", nullptr, ActsGameDeviceDeviceInfoGetDeviceType01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGameDeviceDeviceInfoGetDeviceType02", nullptr, ActsGameDeviceDeviceInfoGetDeviceType02, nullptr, nullptr,
     nullptr, napi_default, nullptr},

    {"ActsGamePadLeftShoulderRegisterButtonInputMonitor01", nullptr,
     ActsGamePadLeftShoulderRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftShoulderRegisterButtonInputMonitor02", nullptr,
     ActsGamePadLeftShoulderRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftShoulderUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadLeftShoulderUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightShoulderRegisterButtonInputMonitor01", nullptr,
     ActsGamePadRightShoulderRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightShoulderRegisterButtonInputMonitor02", nullptr,
     ActsGamePadRightShoulderRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightShoulderUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadRightShoulderUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerRegisterButtonInputMonitor01", nullptr, ActsGamePadLeftTriggerRegisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerRegisterButtonInputMonitor02", nullptr, ActsGamePadLeftTriggerRegisterButtonInputMonitor02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadLeftTriggerUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerRegisterAxisInputMonitor01", nullptr, ActsGamePadLeftTriggerRegisterAxisInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerRegisterAxisInputMonitor02", nullptr, ActsGamePadLeftTriggerRegisterAxisInputMonitor02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftTriggerUnregisterAxisInputMonitor01", nullptr, ActsGamePadLeftTriggerUnregisterAxisInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerRegisterButtonInputMonitor01", nullptr,
     ActsGamePadRightTriggerRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerRegisterButtonInputMonitor02", nullptr,
     ActsGamePadRightTriggerRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadRightTriggerUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerRegisterAxisInputMonitor01", nullptr, ActsGamePadRightTriggerRegisterAxisInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerRegisterAxisInputMonitor02", nullptr, ActsGamePadRightTriggerRegisterAxisInputMonitor02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightTriggerUnregisterAxisInputMonitor01", nullptr,
     ActsGamePadRightTriggerUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonMenuRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonMenuRegisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonMenuRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonMenuRegisterButtonInputMonitor02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonMenuUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadButtonMenuUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonHomeRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonHomeRegisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonHomeRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonHomeRegisterButtonInputMonitor02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonHomeUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadButtonHomeUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonARegisterButtonInputMonitor01", nullptr, ActsGamePadButtonARegisterButtonInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonARegisterButtonInputMonitor02", nullptr, ActsGamePadButtonARegisterButtonInputMonitor02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonAUnregisterButtonInputMonitor01", nullptr, ActsGamePadButtonAUnregisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonBRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonBRegisterButtonInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonBRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonBRegisterButtonInputMonitor02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonBUnregisterButtonInputMonitor01", nullptr, ActsGamePadButtonBUnregisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonXRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonXRegisterButtonInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonXRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonXRegisterButtonInputMonitor02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonXUnregisterButtonInputMonitor01", nullptr, ActsGamePadButtonXUnregisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonYRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonYRegisterButtonInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonYRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonYRegisterButtonInputMonitor02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonYUnregisterButtonInputMonitor01", nullptr, ActsGamePadButtonYUnregisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonCRegisterButtonInputMonitor01", nullptr, ActsGamePadButtonCRegisterButtonInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonCRegisterButtonInputMonitor02", nullptr, ActsGamePadButtonCRegisterButtonInputMonitor02, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadButtonCUnregisterButtonInputMonitor01", nullptr, ActsGamePadButtonCUnregisterButtonInputMonitor01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02", nullptr,
     ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadRightButtonRegisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadRightButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadRightButtonRegisterButtonInputMonitor02", nullptr,
     ActsGamePadDpadRightButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadUpButtonRegisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadUpButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadUpButtonRegisterButtonInputMonitor02", nullptr,
     ActsGamePadDpadUpButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadDownButtonRegisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadDownButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadDownButtonRegisterButtonInputMonitor02", nullptr,
     ActsGamePadDpadDownButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadDpadRegisterAxisInputMonitor01", nullptr, ActsGamePadDpadRegisterAxisInputMonitor01, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGamePadDpadRegisterAxisInputMonitor02", nullptr, ActsGamePadDpadRegisterAxisInputMonitor02, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"ActsGamePadDpadUnregisterAxisInputMonitor01", nullptr, ActsGamePadDpadUnregisterAxisInputMonitor01, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickRegisterButtonInputMonitor01", nullptr,
     ActsGamePadLeftThumbstickRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickRegisterButtonInputMonitor02", nullptr,
     ActsGamePadLeftThumbstickRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickRegisterAxisInputMonitor01", nullptr,
     ActsGamePadLeftThumbstickRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickRegisterAxisInputMonitor02", nullptr,
     ActsGamePadLeftThumbstickRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01", nullptr,
     ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickRegisterButtonInputMonitor01", nullptr,
     ActsGamePadRightThumbstickRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickRegisterButtonInputMonitor02", nullptr,
     ActsGamePadRightThumbstickRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickUnregisterButtonInputMonitor01", nullptr,
     ActsGamePadRightThumbstickUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickRegisterAxisInputMonitor01", nullptr,
     ActsGamePadRightThumbstickRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickRegisterAxisInputMonitor02", nullptr,
     ActsGamePadRightThumbstickRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGamePadRightThumbstickUnregisterAxisInputMonitor01", nullptr,
     ActsGamePadRightThumbstickUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr},

    {"ActsGameControllerGamePadButtonEventGetDeviceId01", nullptr, ActsGameControllerGamePadButtonEventGetDeviceId01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetDeviceId02", nullptr, ActsGameControllerGamePadButtonEventGetDeviceId02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetDeviceId03", nullptr, ActsGameControllerGamePadButtonEventGetDeviceId03,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonAction01", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonAction01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonAction02", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonAction02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonCode01", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonCode01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonCode02", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonCode02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonCodeName01", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonCodeName01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonCodeName02", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonCodeName02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetButtonCodeName03", nullptr,
     ActsGameControllerGamePadButtonEventGetButtonCodeName03, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetCount01", nullptr, ActsGameControllerGamePadPressedButtonsGetCount01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetCount02", nullptr, ActsGameControllerGamePadPressedButtonsGetCount02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetButtonInfo01", nullptr,
     ActsGameControllerGamePadPressedButtonsGetButtonInfo01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetButtonInfo02", nullptr,
     ActsGameControllerGamePadPressedButtonsGetButtonInfo02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetButtonInfo03", nullptr,
     ActsGameControllerGamePadPressedButtonsGetButtonInfo03, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonsGetButtonInfo04", nullptr,
     ActsGameControllerGamePadPressedButtonsGetButtonInfo04, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadDestroyPressedButton01", nullptr, ActsGameControllerGamePadDestroyPressedButton01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadDestroyPressedButton02", nullptr, ActsGameControllerGamePadDestroyPressedButton02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonGetButtonCode01", nullptr,
     ActsGameControllerGamePadPressedButtonGetButtonCode01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonGetButtonCode02", nullptr,
     ActsGameControllerGamePadPressedButtonGetButtonCode02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonGetButtonCodeName01", nullptr,
     ActsGameControllerGamePadPressedButtonGetButtonCodeName01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonGetButtonCodeName02", nullptr,
     ActsGameControllerGamePadPressedButtonGetButtonCodeName02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadPressedButtonGetButtonCodeName03", nullptr,
     ActsGameControllerGamePadPressedButtonGetButtonCodeName03, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetActionTime01", nullptr,
     ActsGameControllerGamePadButtonEventGetActionTime01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadButtonEventGetActionTime02", nullptr,
     ActsGameControllerGamePadButtonEventGetActionTime02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetDeviceId01", nullptr, ActsGameControllerGamePadAxisEventGetDeviceId01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetDeviceId02", nullptr, ActsGameControllerGamePadAxisEventGetDeviceId02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetDeviceId03", nullptr, ActsGameControllerGamePadAxisEventGetDeviceId03,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetAxisSourceType01", nullptr,
     ActsGameControllerGamePadAxisEventGetAxisSourceType01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetAxisSourceType02", nullptr,
     ActsGameControllerGamePadAxisEventGetAxisSourceType02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetXAxisValue01", nullptr, ActsGameControllerGamePadAxisEventGetXAxisValue01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetXAxisValue02", nullptr, ActsGameControllerGamePadAxisEventGetXAxisValue02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetYAxisValue01", nullptr, ActsGameControllerGamePadAxisEventGetYAxisValue01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetYAxisValue02", nullptr, ActsGameControllerGamePadAxisEventGetYAxisValue02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetZAxisValue01", nullptr, ActsGameControllerGamePadAxisEventGetZAxisValue01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetZAxisValue02", nullptr, ActsGameControllerGamePadAxisEventGetZAxisValue02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetRZAxisValue01", nullptr, ActsGameControllerGamePadAxisEventGetRZAxisValue01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetRZAxisValue02", nullptr, ActsGameControllerGamePadAxisEventGetRZAxisValue02,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetHatXAxisValue01", nullptr,
     ActsGameControllerGamePadAxisEventGetHatXAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetHatXAxisValue02", nullptr,
     ActsGameControllerGamePadAxisEventGetHatXAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetHatYAxisValue01", nullptr,
     ActsGameControllerGamePadAxisEventGetHatYAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetHatYAxisValue02", nullptr,
     ActsGameControllerGamePadAxisEventGetHatYAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetBrakeAxisValue01", nullptr,
     ActsGameControllerGamePadAxisEventGetBrakeAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetBrakeAxisValue02", nullptr,
     ActsGameControllerGamePadAxisEventGetBrakeAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetGasAxisValue01", nullptr,
     ActsGameControllerGamePadAxisEventGetGasAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetGasAxisValue02", nullptr,
     ActsGameControllerGamePadAxisEventGetGasAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetActionTime01", nullptr, ActsGameControllerGamePadAxisEventGetActionTime01,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"ActsGameControllerGamePadAxisEventGetActionTime02", nullptr, ActsGameControllerGamePadAxisEventGetActionTime02,
     nullptr, nullptr, nullptr, napi_default, nullptr},

    {"ActsRealDeviceGetAllDevices", nullptr, ActsRealDeviceGetAllDevices, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"ActsRealDeviceHasRealDevice", nullptr, ActsRealDeviceHasRealDevice, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"ActsRealDeviceCheckDeviceEvent", nullptr, ActsRealDeviceCheckDeviceEvent, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"ActsRealDeviceCheckGamePadEvent", nullptr, ActsRealDeviceCheckGamePadEvent, nullptr, nullptr, nullptr,
     napi_default, nullptr},
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}

EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
