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
#include "ActsUsbDDkTest.h"
#include "ddk/ddk_api.h"
#include "ddk/ddk_types.h"
#include "hilog/log.h"
#include "napi/native_api.h"
#include <cstdlib>
#include <hid/hid_ddk_types.h>
#include <js_native_api_types.h>
#include <unistd.h>
#include <vector>
#include "usb/usb_ddk_api.h"
#include "usb/usb_ddk_types.h"
#include "scsi_peripheral/scsi_peripheral_api.h"
#include "scsi_peripheral/scsi_peripheral_types.h"
#include "usb_serial/usb_serial_api.h"
#define BUFF_LENTH 10
#define PARAM_0 0
#define PARAM_1 1
#define PARM_1 1
#define PARAM_10 10
#define PORT_READ 0x01
#define PORT_WRITE 0x02
#define PORT_ILLEGAL 0x08
#define USB_SERIAL_TEST_BUF_SIZE 100
static uint8_t configIndex = 0;
static uint8_t interfaceIndex = 0;
static uint64_t interfaceHandle = 0;
static uint8_t settingIndex = 0;
static uint32_t timeout = 1000;
constexpr size_t MAX_USB_DEVICE_NUM = 128;
constexpr size_t DEVICE_MEM_MAP_SIZE = 10 * 1024;
constexpr size_t DEVICE_MEM_MAP_SIZE_50K = 50 * 1024;
constexpr size_t DEVICE_MEM_MAP_SIZE_128M = 128 * 1024 * 1024;
constexpr size_t DEVICE_MEM_MAP_MAX_SIZE = 1024 * 1024 * 10;
const uint64_t SCSI_DDK_INVALID_DEVICE_ID = 0xFFFFFFFFFFFFFFFF;
const uint32_t SIXTEEN_BIT = 16;
const uint32_t THIRTYTWO_BIT = 32;
const uint32_t BUS_NUM_MASK = 0xFFFF0000;
const uint32_t DEVICE_NUM_MASK = 0x0000FFFF;
const uint8_t CONTROL_READY_DATA = 10;
const uint8_t CONTROL_INQUIRY_DATA = 100;
const uint16_t ALLOCATIONLENGTH_DATA = 16;
const uint8_t READ10_DATA = 123;
constexpr uint8_t ONE_BYTE = 1;
constexpr uint8_t TWO_BYTE = 2;
constexpr uint8_t THREE_BYTE = 3;
constexpr uint8_t FOUR_BYTE = 4;
constexpr uint8_t FIVE_BYTE = 5;
constexpr uint8_t SIX_BYTE = 6;
constexpr uint8_t SEVEN_BYTE = 7;
constexpr uint8_t EIGHT_BYTE = 8;
constexpr uint8_t NINE_BYTE = 9;
constexpr uint16_t MAX_MEM_LEN = 256;
constexpr uint32_t TIMEOUT = 5000;
constexpr uint32_t TIMEOUT2 = 20000;
constexpr uint32_t TIMEOUT3 = -10;
constexpr uint8_t CDB_LENGTH_TEN = 10;
constexpr uint8_t TEMP_BUFFER_SIZE = 20;
constexpr uint8_t BASE_10 = 10;
constexpr uint8_t STATUS_MSG_LEN = 100;
constexpr uint8_t INTERFACE_INDEX2 = 5;
constexpr uint32_t USB_SERIAL_TEST_BAUDRATE = 9600;
constexpr uint8_t USB_SERIAL_TEST_DATA_BITS = 8;

void addUsbDDkErrorCodeTest1(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back(
        {"UsbDdkAshmemAshmemFd", nullptr, UsbDdkAshmemAshmemFd, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbDdkAshmemSize", nullptr, UsbDdkAshmemSize, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbDdkAshmemAddress", nullptr, UsbDdkAshmemAddress, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbDdkAshmemOffset", nullptr, UsbDdkAshmemOffset, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkAshmemBufferLength", nullptr, UsbDdkAshmemBufferLength, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"UsbDdkAshmemTransferredLength", nullptr, UsbDdkAshmemTransferredLength, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkSuccess", nullptr, UsbDdkSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkFailure", nullptr, UsbDdkFailure, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbDdkInvalidParameter", nullptr, UsbDdkInvalidParameter, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbDdkInvalidOperation", nullptr, UsbDdkInvalidOperation, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbDdkNullPTR", nullptr, UsbDdkNullPTR, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralDdkInit", nullptr, ScsiPeripheralDdkInit, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralRelease", nullptr, ScsiPeripheralRelease, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralOpen", nullptr, ScsiPeripheralOpen, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralClose", nullptr, ScsiPeripheralClose, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralTestUnitReady", nullptr, ScsiPeripheralTestUnitReady, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralInquiry", nullptr, ScsiPeripheralInquiry, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralReadCapacity10", nullptr, ScsiPeripheralReadCapacity10, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralRequestSense", nullptr, ScsiPeripheralRequestSense, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back(
        {"ScsiPeripheralRead", nullptr, ScsiPeripheralRead, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addUsbDDkErrorCodeTest2(std::vector<napi_property_descriptor> &descData)
{
    descData.push_back(
        {"ScsiPeripheralWrite", nullptr, ScsiPeripheralWrite, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralSendRequestByCDB", nullptr, ScsiPeripheralSendRequestByCDB, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10CONDITIONMET", nullptr, ScsiPeripheralVerify10CONDITIONMET, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10BUSY", nullptr, ScsiPeripheralVerify10BUSY, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10RESERVATIONCONFLICT", nullptr, ScsiPeripheralVerify10RESERVATIONCONFLICT,
                        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10TASKSETFULL", nullptr, ScsiPeripheralVerify10TASKSETFULL, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10ACAACTIVE", nullptr, ScsiPeripheralVerify10ACAACTIVE, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back({"ScsiPeripheralVerify10TASKABORTED", nullptr, ScsiPeripheralVerify10TASKABORTED, nullptr,
                        nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialInit", nullptr, UsbSerialInit, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialReleaseInitError", nullptr, UsbSerialReleaseInitError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"UsbSerialCloseInitError", nullptr, UsbSerialCloseInitError, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"UsbSerialOpen", nullptr, UsbSerialOpen, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialRead", nullptr, UsbSerialRead, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialWrite", nullptr, UsbSerialWrite, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialSetBaudRate", nullptr, UsbSerialSetBaudRate, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialSetParams", nullptr, UsbSerialSetParams, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialSetTimeout", nullptr, UsbSerialSetTimeout, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialSetFlowControl", nullptr, UsbSerialSetFlowControl, nullptr, nullptr, nullptr,
                        napi_default, nullptr});
    descData.push_back({"UsbSerialFlush", nullptr, UsbSerialFlush, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialFlushInput", nullptr, UsbSerialFlushInput, nullptr, nullptr, nullptr, napi_default, nullptr});
}

void addUsbDDkErrorCodeTest(std::vector<napi_property_descriptor> &descData)
{
    addUsbDDkErrorCodeTest1(descData);
    addUsbDDkErrorCodeTest2(descData);
    descData.push_back(
        {"UsbSerialFlushOutput", nullptr, UsbSerialFlushOutput, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialNoFlowControl", nullptr, UsbSerialNoFlowControl, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"UsbSerialHardwareFlowControl", nullptr, UsbSerialHardwareFlowControl, nullptr, nullptr,
                        nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialParityNone", nullptr, UsbSerialParityNone, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back(
        {"UsbSerialParityEven", nullptr, UsbSerialParityEven, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value UsbDdkAshmemAshmemFd(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->ashmemFd;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkAshmemSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->size;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkAshmemAddress(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->address;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkAshmemOffset(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->offset;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkAshmemBufferLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->bufferLength;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkAshmemTransferredLength(napi_env env, napi_callback_info info)
{
    napi_value result;
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    OH_Usb_Init();
    size_t bufferLen = PARAM_10;
    const uint8_t name[100] = "TestAshmem";
    DDK_Ashmem *ashmem = nullptr;
    OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    ashmem->transferredLength;
    const uint8_t ashmemMapType = 0x03;
    OH_DDK_MapAshmem(ashmem, ashmemMapType);
    int32_t returnValue = OH_Usb_SendPipeRequestWithAshmem(nullptr, ashmem);
    OH_DDK_DestroyAshmem(ashmem);
    OH_Usb_Release();
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value UsbDdkSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_create_int32(env, returnValue == DDK_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value UsbDdkFailure(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    ashmem->ashmemFd = 0;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_FAILURE ? 0 : -1, &result);
    return result;
}

napi_value UsbDdkInvalidParameter(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = PARAM_0;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    napi_create_int32(env, returnValue == DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbDdkInvalidOperation(napi_env env, napi_callback_info info)
{
    napi_value result;
    DDK_Ashmem *ashmem = nullptr;
    const uint8_t name[100] = "TestAshmem";
    uint32_t bufferLen = BUFF_LENTH;
    int32_t returnValue = OH_DDK_CreateAshmem(name, bufferLen, &ashmem);
    const uint8_t ashmemMapType = PORT_ILLEGAL;
    returnValue = OH_DDK_MapAshmem(ashmem, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_INVALID_OPERATION ? 0 : -1, &result);
    return result;
}

napi_value UsbDdkNullPTR(napi_env env, napi_callback_info info)
{
    napi_value result;
    const uint8_t ashmemMapType = PORT_READ | PORT_WRITE;
    int32_t returnValue = OH_DDK_MapAshmem(nullptr, ashmemMapType);
    napi_create_int32(env, returnValue == DDK_NULL_PTR ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralDdkInit(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_ScsiPeripheral_Init();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralRelease(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t ret = OH_ScsiPeripheral_Init();
    ret = OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_SUCCESS ? 0 : -1, &result);
    return result;
}

static uint64_t ConvertDeviceId(uint64_t deviceId64)
{
    int32_t deviceId32 = static_cast<uint32_t>(deviceId64 >> THIRTYTWO_BIT);
    uint32_t busNum = (deviceId32 & BUS_NUM_MASK) >> SIXTEEN_BIT;
    uint32_t deviceNum = deviceId32 & DEVICE_NUM_MASK;
    uint64_t deviceId = ((static_cast<uint64_t>(busNum) << THIRTYTWO_BIT) | deviceNum);

    return deviceId;
}

static uint64_t GetDeviceId(napi_env env, napi_callback_info info)
{
    size_t argc = PARAM_1;
    napi_value args[PARAM_1];
    int64_t tmpDeviceId;
    uint64_t deviceId = ConvertDeviceId(tmpDeviceId);
    return deviceId;
}

napi_value ScsiPeripheralOpen(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralClose(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ret = OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_IO_ERROR ? 0 : -1, &result);
    return result;
}

static void DeleteScsiPeripheralDevice(ScsiPeripheral_Device **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

napi_value ScsiPeripheralTestUnitReady(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_Device *device = nullptr;
    ScsiPeripheral_TestUnitReadyRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_TestUnitReady(device, &req, &resp);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralInquiry(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_Device *dev = nullptr;
    ScsiPeripheral_InquiryRequest req = {0};
    ScsiPeripheral_InquiryInfo inquiryInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Inquiry(dev, &req, &inquiryInfo, &resp);
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralReadCapacity10(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_Device *dev = nullptr;
    ScsiPeripheral_ReadCapacityRequest req = {0};
    ScsiPeripheral_CapacityInfo capacityInfo = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_ReadCapacity10(dev, &req, &capacityInfo, &resp);
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralRequestSense(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_RequestSenseRequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_RequestSense(nullptr, &req, &resp);
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralRead(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Read10(nullptr, &req, &resp);
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value ScsiPeripheralWrite(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_IORequest req = {0};
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Write10(nullptr, &req, &resp);
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

struct ScsiPeripheral_Device {
    int32_t devFd = -1;
    int32_t memMapFd = -1;
    int32_t lbLength = 0;
};

static ScsiPeripheral_Device *NewScsiPeripheralDevice()
{
    return new ScsiPeripheral_Device;
}

napi_value ScsiPeripheralSendRequestByCDB(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    ScsiPeripheral_Request request = {{0}};
    ScsiPeripheral_Response response = {{0}};
    int32_t ret = OH_ScsiPeripheral_SendRequestByCdb(nullptr, &request, &response);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

static void AppendIntToString(char *buffer, int32_t ret)
{
    char temp[TEMP_BUFFER_SIZE];
    int i = 0;

    int isNegative = (ret < 0);
    if (isNegative) {
        ret = -ret;
    }

    do {
        temp[i++] = '0' + (ret % BASE_10);
        ret /= BASE_10;
    } while (ret > 0);

    if (isNegative) {
        temp[i++] = '-';
    }

    for (int start = 0, end = i - 1; start < end; start++, end--) {
        char t = temp[start];
        temp[start] = temp[end];
        temp[end] = t;
    }

    size_t bufferLen = strlen(buffer);
    for (int j = 0; j < i; j++) {
        buffer[bufferLen + j] = temp[j];
    }
    buffer[bufferLen + i] = '\0';
}

static napi_value ScsiPeripheralStatusCONDITIONMET(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_CONDITION_MET;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10CONDITIONMET(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusCONDITIONMET(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

static napi_value ScsiPeripheralStatusBUSY(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_BUSY;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10BUSY(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusBUSY(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

static napi_value ScsiPeripheralStatusRESERVATIONCONFLICT(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_RESERVATION_CONFLICT;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10RESERVATIONCONFLICT(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusRESERVATIONCONFLICT(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

static napi_value ScsiPeripheralStatusTASKSETFULL(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_TASK_SET_FULL;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10TASKSETFULL(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusTASKSETFULL(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

static napi_value ScsiPeripheralStatusACAACTIVE(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_ACA_ACTIVE;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10ACAACTIVE(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusACAACTIVE(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

static napi_value ScsiPeripheralStatusTASKABORTED(napi_env env, ScsiPeripheral_Device *device)
{
    ScsiPeripheral_VerifyRequest req;
    req.lbAddress = UINT32_MAX;
    req.timeout = TIMEOUT;
    ScsiPeripheral_Response resp = {{0}};
    int32_t ret = OH_ScsiPeripheral_Verify10(device, &req, &resp);
    char statusMsg[STATUS_MSG_LEN] = "Verify2 Status check condition needed, actual status: ";
    resp.status = SCSIPERIPHERAL_STATUS_TASK_ABORTED;
    AppendIntToString(statusMsg, resp.status);
    return nullptr;
}

napi_value ScsiPeripheralVerify10TASKABORTED(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_ScsiPeripheral_Init();
    uint64_t deviceId = GetDeviceId(env, info);
    ScsiPeripheral_Device *device = nullptr;
    int32_t ret = OH_ScsiPeripheral_Open(deviceId, 0, &device);
    ScsiPeripheralStatusTASKABORTED(env, device);
    OH_ScsiPeripheral_Close(&device);
    OH_ScsiPeripheral_Release();
    napi_create_int32(env, ret == SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialInit(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_SUCCESS ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialReleaseInitError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INIT_ERROR ? 0 : -1, &result);
    return result;
}

static uint64_t GetDevicedId(napi_env env, napi_callback_info info)
{
    size_t argc = PARM_1;
    napi_value args[PARM_1];
    int64_t tmpDeviceId;
    uint64_t deviceId = static_cast<uint64_t>(tmpDeviceId);
    return deviceId;
}

napi_value UsbSerialOpen(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t deviceId = GetDevicedId(env, info);
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_Open(deviceId, 0, &deviceHandle);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INIT_ERROR ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialCloseInitError(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t deviceId = GetDevicedId(env, info);
    UsbSerial_Device *deviceHandle = nullptr;
    int32_t returnValue = OH_UsbSerial_Open(deviceId, 0, &deviceHandle);
    returnValue = OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INIT_ERROR ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialRead(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff(USB_SERIAL_TEST_BUF_SIZE);
    uint32_t bytesRead = 0;
    returnValue = OH_UsbSerial_Read(deviceHandle, buff.data(), buff.size(), &bytesRead);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialWrite(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    std::vector<uint8_t> buff = {1, 2, 3, 4, 5, 6};
    uint32_t bytesWritten = 0;
    returnValue = OH_UsbSerial_Write(deviceHandle, buff.data(), buff.size(), &bytesWritten);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialSetBaudRate(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    uint32_t baudRate = 9600;
    returnValue = OH_UsbSerial_SetBaudRate(deviceHandle, baudRate);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialSetParams(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    UsbSerial_Params params = {9600, 0, 10, 0};
    returnValue = OH_UsbSerial_SetParams(deviceHandle, &params);
    OH_UsbSerial_Close(&deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialSetTimeout(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetTimeout(deviceHandle, timeout);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialSetFlowControl(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_SOFTWARE_FLOW_CONTROL);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialFlush(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_Flush(deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialFlushInput(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_FlushInput(deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialFlushOutput(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_FlushOutput(deviceHandle);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialNoFlowControl(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_NO_FLOW_CONTROL);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialHardwareFlowControl(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t returnValue = OH_UsbSerial_Init();
    UsbSerial_Device *deviceHandle = nullptr;
    returnValue = OH_UsbSerial_SetFlowControl(deviceHandle, UsbSerial_FlowControl::USB_SERIAL_HARDWARE_FLOW_CONTROL);
    OH_UsbSerial_Release();
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INVALID_PARAMETER ? 0 : -1, &result);
    return result;
}

struct UsbSerial_Device {
    int32_t fd = -1;
};

static UsbSerial_Device *NewSerialDeviceHandle()
{
    return new UsbSerial_Device;
}

static void DeleteUsbSerialDeviceHandle(UsbSerial_Device **dev)
{
    if (*dev != nullptr) {
        delete *dev;
        *dev = nullptr;
    }
}

UsbSerial_Device *InitializeAndCreateDeviceHandle(napi_env env)
{
    int32_t usbSerialInitReturnValue = OH_UsbSerial_Init();
    if (usbSerialInitReturnValue != USB_SERIAL_DDK_NO_PERM) {
        OH_UsbSerial_Release();
    }
    return NewSerialDeviceHandle();
}

napi_value UsbSerialParityNone(napi_env env, napi_callback_info info)
{
    napi_value result;
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    UsbSerial_Parity parity = USB_SERIAL_PARITY_NONE;
    UsbSerial_Params serialParams;
    serialParams.baudRate = USB_SERIAL_TEST_BAUDRATE;
    serialParams.nDataBits = USB_SERIAL_TEST_DATA_BITS;
    serialParams.nStopBits = 1;
    serialParams.parity = parity;
    int32_t returnValue = OH_UsbSerial_SetParams(deviceHandle, &serialParams);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INIT_ERROR ? 0 : -1, &result);
    return result;
}

napi_value UsbSerialParityEven(napi_env env, napi_callback_info info)
{
    napi_value result;
    UsbSerial_Device *deviceHandle = InitializeAndCreateDeviceHandle(env);
    UsbSerial_Parity parity = USB_SERIAL_PARITY_EVEN;
    UsbSerial_Params serialParams;
    serialParams.baudRate = USB_SERIAL_TEST_BAUDRATE;
    serialParams.nDataBits = USB_SERIAL_TEST_DATA_BITS;
    serialParams.nStopBits = 1;
    serialParams.parity = parity;
    int32_t returnValue = OH_UsbSerial_SetParams(deviceHandle, &serialParams);
    DeleteUsbSerialDeviceHandle(&deviceHandle);
    napi_create_int32(env, returnValue == USB_SERIAL_DDK_INIT_ERROR ? 0 : -1, &result);
    return result;
}