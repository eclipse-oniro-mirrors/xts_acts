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
#include <GameControllerKit/game_device.h>
#include "../include/GameControllerTest.h"
#include "../include/GameControllerModel.h"
#include <hilog/log.h>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "GameControllerXts"

namespace OHOS {
namespace GameController {

static GameDevice_AllDeviceInfos *CreateAllDeviceInfos()
{
    AllDeviceInfos *allDeviceInfos = new AllDeviceInfos();
    allDeviceInfos->count = 1;
    BasicDeviceInfo basicDeviceInfo;
    basicDeviceInfo.name = "name";
    allDeviceInfos->allDeviceInfos.push_back(basicDeviceInfo);
    return (GameDevice_AllDeviceInfos *)allDeviceInfos;
}

static void DeviceMonitorCallbackTest01(const struct GameDevice_DeviceEvent *deviceEvent) {}

int32_t ActsGameDeviceGetAllDeviceInfos01()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = nullptr;

    GameController_ErrorCode code = OH_GameDevice_GetAllDeviceInfos(&allDeviceInfos);
    if (code == GameController_ErrorCode::GAME_CONTROLLER_MULTIMODAL_INPUT_ERROR) {
        OH_LOG_ERROR(LOG_APP, "[ActsDeviceTest][ActsGameDeviceGetAllDeviceInfos01]get all deviceInfos failed.");
    }
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceRegisterDeviceMonitor01()
{
    GameController_ErrorCode code = OH_GameDevice_RegisterDeviceMonitor(DeviceMonitorCallbackTest01);

    OH_GameDevice_UnregisterDeviceMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceRegisterDeviceMonitor02()
{
    GameController_ErrorCode code = OH_GameDevice_RegisterDeviceMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceUnregisterDeviceMonitor01()
{
    OH_GameDevice_RegisterDeviceMonitor(DeviceMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GameDevice_UnregisterDeviceMonitor();
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDestroyAllDeviceInfos01()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = nullptr;
    OH_GameDevice_GetAllDeviceInfos(&allDeviceInfos);

    GameController_ErrorCode code = OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDestroyAllDeviceInfos02()
{
    GameController_ErrorCode code = OH_GameDevice_DestroyAllDeviceInfos(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetCount01()
{
    int count = 0;
    GameDevice_AllDeviceInfos *allDeviceInfos = CreateAllDeviceInfos();

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetCount(allDeviceInfos, &count);
    if (count != 1) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetCount02()
{
    int count = 0;
    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetCount(nullptr, &count);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo01()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = CreateAllDeviceInfos();
    GameDevice_DeviceInfo *deviceInfo;

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(allDeviceInfos, 0, &deviceInfo);

    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo02()
{
    GameDevice_DeviceInfo *deviceInfo;

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(nullptr, 0, &deviceInfo);

    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo03()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = CreateAllDeviceInfos();
    GameDevice_DeviceInfo *deviceInfo;

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(allDeviceInfos, 2, &deviceInfo);
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo04()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = CreateAllDeviceInfos();
    GameDevice_DeviceInfo *deviceInfo;

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(allDeviceInfos, -1, &deviceInfo);
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceAllDeviceInfosGetDeviceInfo05()
{
    GameDevice_AllDeviceInfos *allDeviceInfos = CreateAllDeviceInfos();
    GameDevice_DeviceInfo *deviceInfo;

    GameController_ErrorCode code = OH_GameDevice_AllDeviceInfos_GetDeviceInfo(allDeviceInfos, 1, &deviceInfo);
    OH_GameDevice_DestroyAllDeviceInfos(&allDeviceInfos);
    return static_cast<int32_t>(code);
}

} // namespace GameController
} // namespace OHOS