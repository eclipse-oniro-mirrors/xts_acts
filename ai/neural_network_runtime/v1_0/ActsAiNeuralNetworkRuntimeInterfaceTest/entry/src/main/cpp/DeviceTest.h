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

#ifndef DEVICE_TEST_H
#define DEVICE_TEST_H

namespace OHOS {
namespace NeuralNetworkRuntime {

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0100
 * @tc.number SUB_AI_NNRtt_Func_North_Device_DeviceID_0100
 * @tc.desc   测试OH_NNDevice_GetAllDevicesID参数为nullptr的情况
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceId0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0200
 * @tc.desc   测试OH_NNDevice_GetAllDevicesID传入非空指针的情况
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceId0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0300
 * @tc.desc   测试OH_NNDevice_GetAllDevicesID count参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceId0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceID_0400
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceID_0400
 * @tc.desc   测试OH_NNDevice_GetAllDevicesID正常获取设备ID
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceId0400();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0100
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0100
 * @tc.desc   测试OH_NNDevice_GetName使用无效设备ID
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceName0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0200
 * @tc.desc   测试OH_NNDevice_GetName name参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceName0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0300
 * @tc.desc   测试OH_NNDevice_GetName name参数为非空指针
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceName0300();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceName_0400
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceName_0400
 * @tc.desc   测试OH_NNDevice_GetName正常获取设备名称
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceName0400();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0100
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0100
 * @tc.desc   测试OH_NNDevice_GetType type参数为nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceType0100();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0200
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0200
 * @tc.desc   测试OH_NNDevice_GetType使用无效设备ID
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceType0200();

/**
 * @tc.name   SUB_AI_NNRt_Func_North_Device_DeviceType_0300
 * @tc.number SUB_AI_NNRt_Func_North_Device_DeviceType_0300
 * @tc.desc   测试OH_NNDevice_GetType正常获取设备类型
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
int SubAiNnRtFuncNorthDeviceDeviceType0300();

} // namespace NeuralNetworkRuntime
} // namespace OHOS

#endif // DEVICE_TEST_H
