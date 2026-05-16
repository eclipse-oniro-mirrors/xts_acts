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
#include <IPCKit/ipc_kit.h>
#include <IPCKit/ipc_cparcel.h>
#include <bits/alltypes.h>
#include <fcntl.h>
#include <future>
#include <thread>
#include <cinttypes>
#include <cstring>
#include <cstdlib>
#include <cfloat>
#include "AbilityKit/native_child_process.h"
#include <hilog/log.h>

static const char *TEST_STR = "STUB_DESCRIPTOR";

int OnRemoteRequestStub(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return 0;
}

int OnRemoteRequestStub1(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return OH_IPC_INVALID_USER_ERROR_CODE ;
}

int OnRemoteRequestStub2(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return OH_IPC_ERROR_CODE_MAX ;
}

int OnRemoteRequestStub3(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return OH_IPC_USER_ERROR_CODE_MIN ;
}

int OnRemoteRequestStub4(uint32_t code, const OHIPCParcel *data, OHIPCParcel *reply,
    void *userData)
{
    (void)userData;
    (void)code;
    (void)data;
    (void)reply;
    return OH_IPC_USER_ERROR_CODE_MAX ;
}

static void* MemAllocator(int32_t len)
{
    if (len <= 0) {
        return nullptr;
    }
    void *buffer = malloc(len);
    if (buffer == nullptr) {
        return nullptr;
    }
    (void)memset(buffer, 0, len);
    return buffer;
}

void OnRemoteDestroyCallback(void *userData)
{
    (void)userData;
}

static napi_value OHIPCParcelRewindReadPositionParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = nullptr;
    uint32_t newPosition = 0;
    int ret = OH_IPCParcel_RewindReadPosition(parcel, newPosition);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelRewindWritePositionParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = nullptr;
    uint32_t newPosition = 0;
    int ret = OH_IPCParcel_RewindWritePosition(parcel, newPosition);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt8WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = INT8_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteInt8(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt8ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = 0;
    int ret = OH_IPCParcel_WriteInt8(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt8ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = INT8_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadInt8(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt8ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int8_t val = 0;
    int ret = OH_IPCParcel_ReadInt8(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt16WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = INT16_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteInt16(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt16ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    int ret = OH_IPCParcel_WriteInt16(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt16ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = INT16_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadInt16(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt16ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int16_t val = 0;
    int ret = OH_IPCParcel_ReadInt16(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt32WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = INT32_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteInt32(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt32ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    int ret = OH_IPCParcel_WriteInt32(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt32ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = INT32_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadInt32(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt32ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t val = 0;
    int ret = OH_IPCParcel_ReadInt32(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt64WriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = INT64_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteInt64(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInt64ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    int ret = OH_IPCParcel_WriteInt64(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt64ReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = INT64_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadInt64(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadInt64ParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int64_t val = 0;
    int ret = OH_IPCParcel_ReadInt64(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFloatWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = FLT_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteFloat(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFloatParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = 0.0f;
    int ret = OH_IPCParcel_WriteFloat(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : 1, &result);
    return result;
}

static napi_value OHIPCParcelReadFloatReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = FLT_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadFloat(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadFloatParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    float val = 0.0f;
    int ret = OH_IPCParcel_ReadFloat(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteDoubleWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    double val = DBL_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteDouble(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteDoubleParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    double val = 0.0;
    int ret = OH_IPCParcel_WriteDouble(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadDoubleReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    double val = DBL_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_ReadDouble(parcel, &val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadDoubleParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    double val = 0.0;
    int ret = OH_IPCParcel_ReadDouble(nullptr, &val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteStringWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    const char* val = "a";
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteString(parcel, val);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteStringParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    const char* val = "";
    int ret = OH_IPCParcel_WriteString(nullptr, val);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteBufferWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    uint8_t buff[10] = {255};
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteBuffer(parcel, buff, sizeof(buff));
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteBufferParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    uint8_t buff[10] = {0};
        int ret = OH_IPCParcel_WriteBuffer(nullptr, buff, sizeof(buff));
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteRemoteStubSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteRemoteStubWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub, nullptr, nullptr);
    int ret = 0;
    int maxNum = 10000;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    };
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteRemoteStubParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(nullptr, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteRemoteProxyParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteProxy *proxy = nullptr;
    int ret = OH_IPCParcel_WriteRemoteProxy(nullptr, proxy);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFileDescriptorSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = 12;
    int ret = OH_IPCParcel_WriteFileDescriptor(parcel, fd);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFileDescriptorWriteError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = INT32_MAX;
    int ret = 0;
    int maxNum = 10;
    for (int i = 0; i < maxNum; i++) {
        ret = OH_IPCParcel_WriteFileDescriptor(parcel, fd);
    };
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_WRITE_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteFileDescriptorParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = -1;
    int ret = OH_IPCParcel_WriteFileDescriptor(nullptr, fd);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadFileDescriptorSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = 12;
    OH_IPCParcel_WriteFileDescriptor(parcel, fd);
    int ret = OH_IPCParcel_ReadFileDescriptor(parcel, &fd);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadFileDescriptorReadError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = INT32_MAX;
    int ret = 0;
    int maxNum = 100000;
    for (int i = 0; i < maxNum; i++) {
        OH_IPCParcel_WriteFileDescriptor(parcel, fd);
    };
    ret = OH_IPCParcel_ReadFileDescriptor(parcel, &fd);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_PARCEL_READ_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadFileDescriptorParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    int32_t fd = -1;
    int ret = OH_IPCParcel_ReadFileDescriptor(nullptr, &fd);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCQuestModeAsync(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel* parcel = OH_IPCParcel_Create();
    auto proxyCallBack = OH_IPCParcel_ReadRemoteProxy(parcel);
    uint32_t code = 0;
    const OHIPCParcel *data = nullptr;
    OHIPCParcel *reply = nullptr;
    OH_IPC_MessageOption option = {OH_IPC_REQUEST_MODE_ASYNC, 0};
    int ret = OH_IPCRemoteProxy_SendRequest(proxyCallBack, code, data, reply, &option);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelAppendSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();
    OHIPCParcel *parcel2 = OH_IPCParcel_Create();
    int8_t val = 0;
    int ret = OH_IPCParcel_WriteInt8(parcel2, val);
    ret = OH_IPCParcel_Append(parcel1, parcel2);
    OH_IPCParcel_Destroy(parcel1);
    OH_IPCParcel_Destroy(parcel2);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelAppendParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel1 = OH_IPCParcel_Create();
    OHIPCParcel *parcel2 = OH_IPCParcel_Create();
    int8_t val = 0;
    int ret = OH_IPCParcel_WriteInt8(parcel2, val);
    ret = OH_IPCParcel_Append(nullptr, nullptr);
    OH_IPCParcel_Destroy(parcel1);
    OH_IPCParcel_Destroy(parcel2);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelWriteInterfaceTokenParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    const char *token = "";
    int ret = OH_IPCParcel_WriteInterfaceToken(nullptr, token);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadInterfaceTokenSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    char *token = nullptr;
    int32_t len = 0;
    OH_IPC_MemAllocator allocator = MemAllocator;
    int ret = OH_IPCParcel_ReadInterfaceToken(parcel, &token, &len, allocator);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCParcelReadInterfaceTokenParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    char *token = nullptr;
    int32_t len = 0;
    OH_IPC_MemAllocator allocator = MemAllocator;
    int ret = OH_IPCParcel_ReadInterfaceToken(nullptr, &token, &len, allocator);
    OH_IPCParcel_Destroy(parcel);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCRemoteProxySendRequestParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    const OHIPCRemoteProxy *proxy = nullptr;
    OHIPCParcel* parcel = OH_IPCParcel_Create();
    uint32_t code = 0;
    const OHIPCParcel *data = nullptr;
    OHIPCParcel *reply = nullptr;
    OH_IPC_MessageOption option = {OH_IPC_REQUEST_MODE_SYNC, 0};
    int ret = OH_IPCRemoteProxy_SendRequest(proxy, code, data, reply, &option);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCRemoteProxyGetInterfaceDescriptorParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    char* descriptor = nullptr;
    int len = 0;
    OHIPCRemoteProxy *proxy = nullptr;
    int ret = OH_IPCRemoteProxy_GetInterfaceDescriptor(proxy, &descriptor, &len, MemAllocator);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCRemoteProxyAddDeathRecipientParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_OnDeathRecipientCallback deathRecipientCallback = OnRemoteDestroyCallback;
    OH_OnDeathRecipientDestroyCallback destroyCallback = OnRemoteDestroyCallback;
    OHIPCDeathRecipient *oHIPCDeathRecipient = OH_IPCDeathRecipient_Create(deathRecipientCallback,
        destroyCallback, nullptr);
    OHIPCRemoteProxy *proxy = nullptr;
    int ret = OH_IPCRemoteProxy_AddDeathRecipient(proxy, oHIPCDeathRecipient);
    OH_IPCDeathRecipient_Destroy(oHIPCDeathRecipient);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCRemoteProxyRemoveDeathRecipientParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_OnDeathRecipientCallback deathRecipientCallback = OnRemoteDestroyCallback;
    OH_OnDeathRecipientDestroyCallback destroyCallback = OnRemoteDestroyCallback;
    OHIPCDeathRecipient *oHIPCDeathRecipient = OH_IPCDeathRecipient_Create(deathRecipientCallback,
        destroyCallback, nullptr);
    OHIPCRemoteProxy *proxy = nullptr;
    int ret = OH_IPCRemoteProxy_AddDeathRecipient(proxy, oHIPCDeathRecipient);
    ret = OH_IPCRemoteProxy_RemoveDeathRecipient(proxy, oHIPCDeathRecipient);
    OH_IPCDeathRecipient_Destroy(oHIPCDeathRecipient);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCSkeletonSetMaxWorkThreadNumParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_IPCSkeleton_SetMaxWorkThreadNum(NULL);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCSkeletonResetCallingIdentitySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_IPCSkeleton_SetCallingIdentity(TEST_STR);
    char *identity = nullptr;
    int32_t len = 0;
    OH_IPC_MemAllocator allocator = MemAllocator;
    ret = OH_IPCSkeleton_ResetCallingIdentity(&identity, &len, allocator);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCSkeletonResetCallingIdentityParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_IPCSkeleton_SetCallingIdentity(TEST_STR);
    char *identity = nullptr;
    int32_t len = 0;
    OH_IPC_MemAllocator allocator = MemAllocator;
    ret = OH_IPCSkeleton_ResetCallingIdentity(&identity, NULL, allocator);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCSkeletonSetCallingIdentitySuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_IPCSkeleton_SetCallingIdentity(TEST_STR);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCSkeletonSetCallingIdentityParamError(napi_env env, napi_callback_info info)
{
    napi_value result;
    int ret = OH_IPCSkeleton_SetCallingIdentity(NULL);
    napi_create_int32(env, ret == OH_IPC_CHECK_PARAM_ERROR ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCInvalidUserErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub1, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCErrorCodeMAX(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub2, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCUserErrorCodeMIN(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub3, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCUserErrorCodeMAX(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub4, nullptr, nullptr);
    int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
    OH_IPCRemoteStub_Destroy(stub);
    napi_create_int32(env, ret == OH_IPC_SUCCESS ? 0 : -1, &result);
    return result;
}

static napi_value OHIPCErrorCode(napi_env env, napi_callback_info info)
{
    napi_value result;
    int OH_IP_MEM_ALLOCATOR_ERROR_CODE = 1901003;
    int OH_IPC_DEAD_REMOTE_OBJECT_CODE = 1901005;
    int OH_IPNER_ERROR_CODE = 1901007;
    napi_create_int32(env, OH_IP_MEM_ALLOCATOR_ERROR_CODE == OH_IPC_MEM_ALLOCATOR_ERROR ? 0 : -1, &result);
    napi_create_int32(env, OH_IPC_DEAD_REMOTE_OBJECT_CODE == OH_IPC_DEAD_REMOTE_OBJECT ? 0 : -1, &result);
    napi_create_int32(env, OH_IPNER_ERROR_CODE == OH_IPC_INNER_ERROR ? 0 : -1, &result);
    return result;
}

napi_property_descriptor desc[] = {
    {"OHIPCParcelRewindReadPositionParamError", nullptr, OHIPCParcelRewindReadPositionParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelRewindWritePositionParamError", nullptr, OHIPCParcelRewindWritePositionParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteInt8WriteError", nullptr, OHIPCParcelWriteInt8WriteError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteInt8ParamError", nullptr, OHIPCParcelWriteInt8ParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadInt8ReadError", nullptr, OHIPCParcelReadInt8ReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadInt8ParamError", nullptr, OHIPCParcelReadInt8ParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteInt16WriteError", nullptr, OHIPCParcelWriteInt16WriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteInt16ParamError", nullptr, OHIPCParcelWriteInt16ParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadInt16ReadError", nullptr, OHIPCParcelReadInt16ReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadInt16ParamError", nullptr, OHIPCParcelReadInt16ParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteInt32WriteError", nullptr, OHIPCParcelWriteInt32WriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteInt32ParamError", nullptr, OHIPCParcelWriteInt32ParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadInt32ReadError", nullptr, OHIPCParcelReadInt32ReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadInt32ParamError", nullptr, OHIPCParcelReadInt32ParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteInt64WriteError", nullptr, OHIPCParcelWriteInt64WriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteInt64ParamError", nullptr, OHIPCParcelWriteInt64ParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadInt64ReadError", nullptr, OHIPCParcelReadInt64ReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadInt64ParamError", nullptr, OHIPCParcelReadInt64ParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteFloatWriteError", nullptr, OHIPCParcelWriteFloatWriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteFloatParamError", nullptr, OHIPCParcelWriteFloatParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadFloatReadError", nullptr, OHIPCParcelReadFloatReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadFloatParamError", nullptr, OHIPCParcelReadFloatParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteDoubleWriteError", nullptr, OHIPCParcelWriteDoubleWriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteDoubleParamError", nullptr, OHIPCParcelWriteDoubleParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadDoubleReadError", nullptr, OHIPCParcelReadDoubleReadError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelReadDoubleParamError", nullptr, OHIPCParcelReadDoubleParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteStringWriteError", nullptr, OHIPCParcelWriteStringWriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteStringParamError", nullptr, OHIPCParcelWriteStringParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteBufferWriteError", nullptr, OHIPCParcelWriteBufferWriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteBufferParamError", nullptr, OHIPCParcelWriteBufferParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteRemoteStubSuccess", nullptr, OHIPCParcelWriteRemoteStubSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteRemoteStubWriteError", nullptr, OHIPCParcelWriteRemoteStubWriteError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteRemoteStubParamError", nullptr, OHIPCParcelWriteRemoteStubParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteRemoteProxyParamError", nullptr, OHIPCParcelWriteRemoteProxyParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteFileDescriptorSuccess", nullptr, OHIPCParcelWriteFileDescriptorSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelWriteFileDescriptorWriteError", nullptr, OHIPCParcelWriteFileDescriptorWriteError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelWriteFileDescriptorParamError", nullptr, OHIPCParcelWriteFileDescriptorParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelReadFileDescriptorSuccess", nullptr, OHIPCParcelReadFileDescriptorSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadFileDescriptorReadError", nullptr, OHIPCParcelReadFileDescriptorReadError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelReadFileDescriptorParamError", nullptr, OHIPCParcelReadFileDescriptorParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCQuestModeAsync", nullptr, OHIPCQuestModeAsync, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelAppendSuccess", nullptr, OHIPCParcelAppendSuccess, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCParcelAppendParamError", nullptr, OHIPCParcelAppendParamError, nullptr, nullptr, nullptr, napi_default,
     nullptr},
    {"OHIPCParcelWriteInterfaceTokenParamError", nullptr, OHIPCParcelWriteInterfaceTokenParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCParcelReadInterfaceTokenSuccess", nullptr, OHIPCParcelReadInterfaceTokenSuccess, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCParcelReadInterfaceTokenParamError", nullptr, OHIPCParcelReadInterfaceTokenParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCRemoteProxySendRequestParamError", nullptr, OHIPCRemoteProxySendRequestParamError, nullptr, nullptr, nullptr,
     napi_default, nullptr},
    {"OHIPCRemoteProxyGetInterfaceDescriptorParamError", nullptr, OHIPCRemoteProxyGetInterfaceDescriptorParamError,
     nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCRemoteProxyAddDeathRecipientParamError", nullptr, OHIPCRemoteProxyAddDeathRecipientParamError, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHIPCRemoteProxyRemoveDeathRecipientParamError", nullptr, OHIPCRemoteProxyRemoveDeathRecipientParamError, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHIPCSkeletonSetMaxWorkThreadNumParamError", nullptr, OHIPCSkeletonSetMaxWorkThreadNumParamError, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHIPCSkeletonResetCallingIdentitySuccess", nullptr, OHIPCSkeletonResetCallingIdentitySuccess, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCSkeletonResetCallingIdentityParamError", nullptr, OHIPCSkeletonResetCallingIdentityParamError, nullptr,
     nullptr, nullptr, napi_default, nullptr},
    {"OHIPCSkeletonSetCallingIdentitySuccess", nullptr, OHIPCSkeletonSetCallingIdentitySuccess, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCSkeletonSetCallingIdentityParamError", nullptr, OHIPCSkeletonSetCallingIdentityParamError, nullptr, nullptr,
     nullptr, napi_default, nullptr},
    {"OHIPCInvalidUserErrorCode", nullptr, OHIPCInvalidUserErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCErrorCodeMAX", nullptr, OHIPCErrorCodeMAX, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCUserErrorCodeMIN", nullptr, OHIPCUserErrorCodeMIN, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCUserErrorCodeMAX", nullptr, OHIPCUserErrorCodeMAX, nullptr, nullptr, nullptr, napi_default, nullptr},
    {"OHIPCErrorCode", nullptr, OHIPCErrorCode, nullptr, nullptr, nullptr, napi_default, nullptr},
    };

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "IPC20CApi",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}