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

#include "DeviceTest.h"
#include <hilog/log.h>
#include <neural_network_runtime/neural_network_core.h>
#include <neural_network_runtime/neural_network_runtime.h>
#include <neural_network_runtime/neural_network_runtime_type.h>
#include <string>
#include "NnrtUtilsTest.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "DeviceTest"

namespace OHOS {
namespace NeuralNetworkRuntime {

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0100
 * @tc.number SUB_AI_NNRtt_Func_North_Device_DeviceID_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceId0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0100 start");
    uint32_t count = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(nullptr, &count);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceId0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0200 start");
    const size_t allDeviceIds = 0;
    const size_t* pAllDeviceIds = &allDeviceIds;
    uint32_t count = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&pAllDeviceIds, &count);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceId0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0300 start");
    const size_t* allDeviceIds = nullptr;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&allDeviceIds, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceId0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0400 start");

    const size_t* allDeviceIds = nullptr;
    uint32_t count = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&allDeviceIds, &count);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed, ret=%{public}d", ret);
        return -1;
    }
    uint32_t expectCount = 1;
    if (count < expectCount) {
        OH_LOG_ERROR(LOG_APP, "Device count less than expected, count=%{public}u", count);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceID_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceName0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0100 start");
    const size_t deviceID = 100000;
    const char* name = nullptr;
    OH_NN_ReturnCode ret = OH_NNDevice_GetName(deviceID, &name);
    if (ret != OH_NN_FAILED) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_FAILED, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceName0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0200 start");
    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }
    size_t targetDevice = devicesID[0];
    ret = OH_NNDevice_GetName(targetDevice, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceName0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0300 start");
    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }
    size_t targetDevice = devicesID[0];
    const char* name = "name";
    ret = OH_NNDevice_GetName(targetDevice, &name);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0300 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0400
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0400
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceName0400()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0400 start");
    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }
    uint32_t number = 1;
    if (devicesCount < number) {
        OH_LOG_ERROR(LOG_APP, "Device count less than expected");
        return -1;
    }
    const char* name = nullptr;
    OH_LOG_INFO(LOG_APP, "Found %{public}u device(s):", devicesCount);
    for (uint32_t i = 0; i < devicesCount; i++) {
        name = nullptr;
        ret = OH_NNDevice_GetName(devicesID[i], &name);
        if (ret != OH_NN_SUCCESS) {
            OH_LOG_ERROR(LOG_APP, "GetName failed for device %{public}u", i);
            return -1;
        }
        if (name != nullptr) {
            OH_LOG_INFO(LOG_APP, "  Device[%{public}u]: %{public}s", i, name);
        }
    }

    if (devicesCount > 0 && name != nullptr) {
        OH_LOG_INFO(LOG_APP, "Device name test passed (found %{public}u device(s))", devicesCount);
    } else {
        OH_LOG_ERROR(LOG_APP, "No valid device found");
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceName_0400 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceType0100()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0100 start");
    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }
    size_t targetDevice = devicesID[0];
    ret = OH_NNDevice_GetType(targetDevice, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0100 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceType0200()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0200 start");
    const size_t deviceID = 100000;
    OH_NN_DeviceType type = OH_NN_OTHERS;
    OH_NN_ReturnCode ret = OH_NNDevice_GetType(deviceID, &type);
    if (ret != OH_NN_INVALID_PARAMETER) {
        OH_LOG_ERROR(LOG_APP, "Expected OH_NN_INVALID_PARAMETER, got %{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0200 passed");
    return 0;
}

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
 * @tc.desc   [C- SOFTWARE -0200]
 */
int SubAiNnRtFuncNorthDeviceDeviceType0300()
{
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0300 start");
    const size_t* devicesID = nullptr;
    uint32_t devicesCount = 0;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount);
    if (ret != OH_NN_SUCCESS || devicesID == nullptr) {
        OH_LOG_ERROR(LOG_APP, "GetAllDevicesID failed");
        return -1;
    }
    size_t targetDevice = devicesID[0];
    OH_NN_DeviceType type = OH_NN_OTHERS;
    ret = OH_NNDevice_GetType(targetDevice, &type);
    if (ret != OH_NN_SUCCESS) {
        OH_LOG_ERROR(LOG_APP, "GetType failed, ret=%{public}d", ret);
        return -1;
    }
    OH_LOG_INFO(LOG_APP, "SUB_AI_NNRt_Func_North_Device_DeviceType_0300 passed");
    return 0;
}

} // namespace NeuralNetworkRuntime
} // namespace OHOS
