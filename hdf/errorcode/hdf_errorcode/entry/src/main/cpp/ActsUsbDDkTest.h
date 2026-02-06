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

#ifndef HDF_ERRORCODE_ACTSUSBDDKTEST_H
#define HDF_ERRORCODE_ACTSUSBDDKTEST_H
#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <vector>
void addUsbDDkErrorCodeTest(std::vector<napi_property_descriptor>& descData);
napi_value UsbDdkAshmemAshmemFd(napi_env env, napi_callback_info info);
napi_value UsbDdkAshmemSize(napi_env env, napi_callback_info info);
napi_value UsbDdkAshmemAddress(napi_env env, napi_callback_info info);
napi_value UsbDdkAshmemOffset(napi_env env, napi_callback_info info);
napi_value UsbDdkAshmemBufferLength(napi_env env, napi_callback_info info);
napi_value UsbDdkAshmemTransferredLength(napi_env env, napi_callback_info info);
napi_value UsbDdkSuccess(napi_env env, napi_callback_info info);
napi_value UsbDdkFailure(napi_env env, napi_callback_info info);
napi_value UsbDdkInvalidParameter(napi_env env, napi_callback_info info);
napi_value UsbDdkInvalidOperation(napi_env env, napi_callback_info info);
napi_value UsbDdkNullPTR(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralDdkInit(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralRelease(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralOpen(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralClose(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralTestUnitReady(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralInquiry(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralReadCapacity10(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralRequestSense(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralRead(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralWrite(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10Success(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralSendRequestByCDB(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralCreateDeviceMemMap(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10CONDITIONMET(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10BUSY(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10RESERVATIONCONFLICT(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10TASKSETFULL(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10ACAACTIVE(napi_env env, napi_callback_info info);
napi_value ScsiPeripheralVerify10TASKABORTED(napi_env env, napi_callback_info info);
napi_value UsbSerialInit(napi_env env, napi_callback_info info);
napi_value UsbSerialReleaseInitError(napi_env env, napi_callback_info info);
napi_value UsbSerialCloseInitError(napi_env env, napi_callback_info info);
napi_value UsbSerialOpen(napi_env env, napi_callback_info info);
napi_value UsbSerialRead(napi_env env, napi_callback_info info);
napi_value UsbSerialWrite(napi_env env, napi_callback_info info);
napi_value UsbSerialSetBaudRate(napi_env env, napi_callback_info info);
napi_value UsbSerialSetParams(napi_env env, napi_callback_info info);
napi_value UsbSerialSetTimeout(napi_env env, napi_callback_info info);
napi_value UsbSerialSetFlowControl(napi_env env, napi_callback_info info);
napi_value UsbSerialFlush(napi_env env, napi_callback_info info);
napi_value UsbSerialFlushInput(napi_env env, napi_callback_info info);
napi_value UsbSerialFlushOutput(napi_env env, napi_callback_info info);
napi_value UsbSerialNoFlowControl(napi_env env, napi_callback_info info);
napi_value UsbSerialHardwareFlowControl(napi_env env, napi_callback_info info);
napi_value UsbSerialParityNone(napi_env env, napi_callback_info info);
napi_value UsbSerialParityEven(napi_env env, napi_callback_info info);
#endif //HDF_ERRORCODE_ACTSUSBDDKTEST_H
