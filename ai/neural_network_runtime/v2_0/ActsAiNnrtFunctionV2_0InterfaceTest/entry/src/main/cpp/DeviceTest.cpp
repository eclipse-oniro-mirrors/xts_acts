/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
#include <cmath>
#include <cstdio>
#include <vector>

#include "include/NnrtUtilsTest.h"

using namespace OHOS::NeuralNetworkRuntime::Test;

// SUB_AI_NNRt_Func_North_Device_DeviceID_0100
int SubAiNnrtFuncNorthDeviceDeviceId0100()
{
    uint32_t count{0};
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(nullptr, &count);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceID_0200
int SubAiNnrtFuncNorthDeviceDeviceId0200()
{
    const size_t allDeviceIds = 0;
    const size_t *pAllDeviceIds = &allDeviceIds;
    uint32_t count{0};
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&pAllDeviceIds, &count);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceID_0300
int SubAiNnrtFuncNorthDeviceDeviceId0300()
{
    const size_t *allDeviceIds = nullptr;
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&allDeviceIds, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceID_0400
int SubAiNnrtFuncNorthDeviceDeviceId0400()
{
    const size_t *allDeviceIds = nullptr;
    uint32_t count{0};
    OH_NN_ReturnCode ret = OH_NNDevice_GetAllDevicesID(&allDeviceIds, &count);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    
    uint32_t expectCount = 1;
    if (count < expectCount) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceName_0100
int SubAiNnrtFuncNorthDeviceDeviceName0100()
{
    const size_t deviceID{100000};
    const char *name = nullptr;
    OH_NN_ReturnCode ret = OH_NNDevice_GetName(deviceID, &name);
    if (ret != OH_NN_FAILED) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceName_0200
int SubAiNnrtFuncNorthDeviceDeviceName0200()
{
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    OH_NN_ReturnCode ret = OH_NNDevice_GetName(targetDevice, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceName_0300
int SubAiNnrtFuncNorthDeviceDeviceName0300()
{
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    const char *name = "name";
    OH_NN_ReturnCode ret = OH_NNDevice_GetName(targetDevice, &name);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceType_0100
int SubAiNnrtFuncNorthDeviceDeviceType0100()
{
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    OH_NN_ReturnCode ret = OH_NNDevice_GetType(targetDevice, nullptr);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceType_0200
int SubAiNnrtFuncNorthDeviceDeviceType0200()
{
    const size_t deviceID{100000};
    OH_NN_DeviceType type{OH_NN_OTHERS};
    OH_NN_ReturnCode ret = OH_NNDevice_GetType(deviceID, &type);
    if (ret != OH_NN_INVALID_PARAMETER) {
        return -1;
    }
    return 0;
}

// SUB_AI_NNRt_Func_North_Device_DeviceType_0300
int SubAiNnrtFuncNorthDeviceDeviceType0300()
{
    const size_t *devicesID{nullptr};
    uint32_t devicesCount{0};
    if (OH_NNDevice_GetAllDevicesID(&devicesID, &devicesCount) != OH_NN_SUCCESS) {
        return -1;
    }
    size_t targetDevice = devicesID[0];
    
    OH_NN_DeviceType type{OH_NN_OTHERS};
    OH_NN_ReturnCode ret = OH_NNDevice_GetType(targetDevice, &type);
    if (ret != OH_NN_SUCCESS) {
        return -1;
    }
    return 0;
}
