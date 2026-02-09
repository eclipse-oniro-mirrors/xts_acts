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
#include <GameControllerKit/game_device_event.h>
#include <hilog/log.h>
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "GameControllerXts"
#include "../include/GameControllerTest.h"
#include "../include/GameControllerModel.h"

namespace OHOS {
namespace GameController {
;
namespace {
const int32_t PRODUCT = 1;
const int32_t VENDOR = 2;
const int32_t VERSION = 3;
} // namespace
static GameDevice_DeviceEvent *CreateDeviceEvent()
{
    GameDeviceEvent *deviceEvent = new GameDeviceEvent();
    deviceEvent->changeType = 1;
    BasicDeviceInfo basicDeviceInfo;
    deviceEvent->deviceInfo = basicDeviceInfo;
    return (GameDevice_DeviceEvent *)deviceEvent;
}

static GameDevice_DeviceInfo *CreateDeviceInfo(DeviceTypeEnum deviceType)
{
    BasicDeviceInfo *basicDeviceInfo = new BasicDeviceInfo();
    basicDeviceInfo->uniq = "uniq";
    basicDeviceInfo->name = "name";
    basicDeviceInfo->product = PRODUCT;
    basicDeviceInfo->vendor = VENDOR;
    basicDeviceInfo->version = VERSION;
    basicDeviceInfo->phys = "PhysicalAddress";
    basicDeviceInfo->deviceType = deviceType;
    return (GameDevice_DeviceInfo *)basicDeviceInfo;
}

static void DestroyDeviceEvent(GameDevice_DeviceEvent *event)
{
    delete event;
    event = nullptr;
}

int32_t ActsGameDeviceDeviceEventGetChangedType01()
{
    GameDevice_DeviceEvent *event = CreateDeviceEvent();
    GameDevice_StatusChangedType type;

    GameController_ErrorCode code = OH_GameDevice_DeviceEvent_GetChangedType(event, &type);
    if (type != ONLINE) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyDeviceEvent(event);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceEventGetChangedType02()
{
    GameDevice_StatusChangedType type;

    GameController_ErrorCode code = OH_GameDevice_DeviceEvent_GetChangedType(nullptr, &type);
    return static_cast<int32_t>(code);
}


int32_t ActsGameDeviceDeviceEventGetDeviceInfo01()
{
    GameDevice_DeviceEvent *event = CreateDeviceEvent();
    GameDevice_DeviceInfo *deviceInfo;
    GameController_ErrorCode code = OH_GameDevice_DeviceEvent_GetDeviceInfo(event, &deviceInfo);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    DestroyDeviceEvent(event);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceEventGetDeviceInfo02()
{
    GameDevice_DeviceInfo *deviceInfo;
    GameDevice_DeviceEvent *event;

    GameController_ErrorCode code = OH_GameDevice_DeviceEvent_GetDeviceInfo(nullptr, &deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDestroyDeviceInfo01()
{
    GameDevice_DeviceEvent *event = CreateDeviceEvent();
    GameDevice_DeviceInfo *deviceInfo;
    OH_GameDevice_DeviceEvent_GetDeviceInfo(event, &deviceInfo);
    GameController_ErrorCode code = OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    DestroyDeviceEvent(event);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDestroyDeviceInfo02()
{
    GameController_ErrorCode code = OH_GameDevice_DestroyDeviceInfo(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetDeviceId01()
{
    char *deviceId;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceId(deviceInfo, &deviceId);
    if (strcmp(deviceId, "uniq") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    if (code == GameController_ErrorCode::GAME_CONTROLLER_NO_MEMORY) {
        OH_LOG_ERROR(LOG_APP, "[ActsDeviceTest][ActsGameDeviceDeviceInfoGetDeviceId01]get deviceId failed.");
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetDeviceId02()
{
    char *deviceId;
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceId(nullptr, &deviceId);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetDeviceId03()
{
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceId(deviceInfo, nullptr);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetName01()
{
    char *name;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetName(deviceInfo, &name);
    if (strcmp(name, "name") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetName02()
{
    char *name;

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetName(nullptr, &name);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetName03()
{
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetName(deviceInfo, nullptr);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetProduct01()
{
    int32_t product;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetProduct(deviceInfo, &product);
    if (product != PRODUCT) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetProduct02()
{
    int32_t product;
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetProduct(nullptr, &product);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetVersion01()
{
    int32_t version;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetVersion(deviceInfo, &version);
    if (version != VERSION) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetVersion02()
{
    int32_t version;

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetVersion(nullptr, &version);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetPhys01()
{
    char *phys;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetPhysicalAddress(deviceInfo, &phys);
    if (strcmp(phys, "PhysicalAddress") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetPhys02()
{
    char *phys;

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetPhysicalAddress(nullptr, &phys);
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetPhys03()
{
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetPhysicalAddress(deviceInfo, nullptr);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    return static_cast<int32_t>(code);
}


int32_t ActsGameDeviceDeviceInfoGetDeviceType01()
{
    GameDevice_DeviceType type;
    GameDevice_DeviceInfo *deviceInfo = CreateDeviceInfo(DeviceTypeEnum::GAME_PAD);
    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceType(deviceInfo, &type);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    if (type != GameDevice_DeviceType::GAME_PAD) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
        return static_cast<int32_t>(code);
    }
    
    GameDevice_DeviceInfo *deviceInfoNew = CreateDeviceInfo(DeviceTypeEnum::UNKNOWN);
    GameDevice_DeviceType typeNew;
    code = OH_GameDevice_DeviceInfo_GetDeviceType(deviceInfoNew, &typeNew);
    OH_GameDevice_DestroyDeviceInfo(&deviceInfo);
    if (typeNew != GameDevice_DeviceType::UNKNOWN) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    return static_cast<int32_t>(code);
}

int32_t ActsGameDeviceDeviceInfoGetDeviceType02()
{
    GameDevice_DeviceType type;

    GameController_ErrorCode code = OH_GameDevice_DeviceInfo_GetDeviceType(nullptr, &type);
    return static_cast<int32_t>(code);
}
} // namespace GameController
}