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

#include "napi/native_api.h"
#include <bits/alltypes.h>
#include <fcntl.h>
#include <thread>
#include <cinttypes>
#include <cstring>
#include <cstdlib>
#include <IPCKit/ipc_kit.h>

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
void OnRemoteDestroyCallback(void *userData)
{
    (void)userData;
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

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value OHIPCSkeletonJoinWorkThread(napi_env env, napi_callback_info info)
{
    napi_value result;
    std::thread th([] { OH_IPCSkeleton_JoinWorkThread(); });
    th.detach();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonStopWorkThread(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_IPCSkeleton_StopWorkThread();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonGetCallingTokenId(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t tokenId = OH_IPCSkeleton_GetCallingTokenId();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonGetFirstTokenId(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t firstTokenId = OH_IPCSkeleton_GetFirstTokenId();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonGetSelfTokenId(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t selfTokenId = OH_IPCSkeleton_GetSelfTokenId();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonGetCallingPid(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t callingPid = OH_IPCSkeleton_GetCallingPid();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonGetCallingUid(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint64_t callingUid = OH_IPCSkeleton_GetCallingUid();
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCSkeletonIsLocalCalling(napi_env env, napi_callback_info info)
{
    napi_value result;
    int isLocalCalling = OH_IPCSkeleton_IsLocalCalling();
    if (isLocalCalling < 0) {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    } else {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    }
    return result;
}

static napi_value OHIPCSkeletonSetMaxWorkThreadNum(napi_env env, napi_callback_info info)
{
    napi_value result;
    int maxThreadNum = 1;
    int ret = OH_IPCSkeleton_SetMaxWorkThreadNum(maxThreadNum);
    if (ret == OH_IPC_SUCCESS) {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCSkeletonResetCallingIdentity(napi_env env, napi_callback_info info)
{
    napi_value result;
    do {
        int ret = OH_IPCSkeleton_SetCallingIdentity(TEST_STR);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        char *identity = nullptr;
        int32_t len = 0;
        OH_IPC_MemAllocator allocator = MemAllocator;
        ret = OH_IPCSkeleton_ResetCallingIdentity(&identity, &len, allocator);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCSkeletonSetCallingIdentity(napi_env env, napi_callback_info info)
{
    return OHIPCSkeletonResetCallingIdentity(env, info);
}

static napi_value OHIPCSkeletonIsHandlingTransaction(napi_env env, napi_callback_info info)
{
    napi_value result;
    int isHandlingTransaction = OH_IPCSkeleton_IsHandlingTransaction();
    if (isHandlingTransaction < 0) {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    } else {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    }
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCRemoteStubCreate(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_OnRemoteDestroyCallback destroyCallback = OnRemoteDestroyCallback;
    auto stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub,  destroyCallback, nullptr);
    if (stub != nullptr) {
        OH_IPCRemoteStub_Destroy(stub);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCRemoteStubDestroy(napi_env env, napi_callback_info info)
{
    return OHIPCRemoteStubCreate(env, info);
}

static napi_value OHIPCRemoteProxyDestroy(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCRemoteProxy *proxy = nullptr;
    OH_IPCRemoteProxy_Destroy(proxy);
    napi_create_int32(env, OH_IPC_SUCCESS, &result);
    return result;
}

static napi_value OHIPCRemoteProxySendRequest(napi_env env, napi_callback_info info)
{
    napi_value result;
    const OHIPCRemoteProxy *proxy = nullptr;
    uint32_t code = 0;
    const OHIPCParcel *data = nullptr;
    OHIPCParcel *reply = nullptr;
    OH_IPC_MessageOption option = {OH_IPC_REQUEST_MODE_SYNC, 0};
    int ret = OH_IPCRemoteProxy_SendRequest(proxy, code, data, reply, &option);
    if (ret == OH_IPC_SUCCESS) {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    } else {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    }
    return result;
}

static napi_value OHIPCRemoteProxyGetInterfaceDescriptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    char* descriptor = nullptr;
    int len = 0;
    OHIPCRemoteProxy *proxy = nullptr;
    int ret = OH_IPCRemoteProxy_GetInterfaceDescriptor(proxy, &descriptor, &len, MemAllocator);
    if (ret == OH_IPC_SUCCESS) {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    } else {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    }
    return result;
}

static napi_value OHIPCDeathRecipientCreate(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_OnDeathRecipientCallback deathRecipientCallback = OnRemoteDestroyCallback;
    OH_OnDeathRecipientDestroyCallback destroyCallback = OnRemoteDestroyCallback;
    OHIPCDeathRecipient* oHIPCDeathRecipient = OH_IPCDeathRecipient_Create(
        deathRecipientCallback, destroyCallback, nullptr);
    if (oHIPCDeathRecipient != nullptr) {
        OH_IPCDeathRecipient_Destroy(oHIPCDeathRecipient);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCDeathRecipientDestroy(napi_env env, napi_callback_info info)
{
    return OHIPCDeathRecipientCreate(env, info);
}

static napi_value OHIPCRemoteProxyAddDeathRecipient(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_OnDeathRecipientCallback deathRecipientCallback = OnRemoteDestroyCallback;
    OH_OnDeathRecipientDestroyCallback destroyCallback = OnRemoteDestroyCallback;
    do {
        OHIPCDeathRecipient *oHIPCDeathRecipient = OH_IPCDeathRecipient_Create(deathRecipientCallback,
            destroyCallback, nullptr);
        if (oHIPCDeathRecipient == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OHIPCRemoteProxy *proxy = nullptr;
        int ret = OH_IPCRemoteProxy_AddDeathRecipient(proxy, oHIPCDeathRecipient);
        if (ret == OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        ret = OH_IPCRemoteProxy_RemoveDeathRecipient(proxy, oHIPCDeathRecipient);
        if (ret == OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCDeathRecipient_Destroy(oHIPCDeathRecipient);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCRemoteProxyRemoveDeathRecipient(napi_env env, napi_callback_info info)
{
    return OHIPCRemoteProxyAddDeathRecipient(env, info);
}

static napi_value OHIPCRemoteProxyIsRemoteDead(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCRemoteProxy *proxy = nullptr;
    int isRemoteDead = OH_IPCRemoteProxy_IsRemoteDead(proxy);
    if (isRemoteDead == 0) {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    } else {
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    }
    return result;
}

static napi_value OHIPCParcelCreate(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel* parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelDestroy(napi_env env, napi_callback_info info)
{
    return OHIPCParcelCreate(env, info);
}

static napi_value OHIPCParcelGetDataSize(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int ret = OH_IPCParcel_GetDataSize(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelGetWritableBytes(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int ret = OH_IPCParcel_GetWritableBytes(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelGetReadableBytes(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int ret = OH_IPCParcel_GetReadableBytes(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelGetReadPosition(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int ret = OH_IPCParcel_GetReadPosition(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelGetWritePosition(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int ret = OH_IPCParcel_GetWritePosition(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelRewindReadPosition(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        uint32_t newPosition = 0;
        int ret = OH_IPCParcel_RewindReadPosition(parcel, newPosition);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelRewindWritePosition(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        uint32_t newPosition = 0;
        int ret = OH_IPCParcel_RewindWritePosition(parcel, newPosition);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteInt8(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int8_t val = 0;
        int ret = OH_IPCParcel_WriteInt8(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadInt8(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int8_t val = 0;
        int ret = OH_IPCParcel_ReadInt8(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteInt16(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int16_t val = 0;
        int ret = OH_IPCParcel_WriteInt16(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadInt16(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int16_t val = 0;
        int ret = OH_IPCParcel_ReadInt16(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteInt32(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int32_t val = 0;
        int ret = OH_IPCParcel_WriteInt32(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadInt32(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int32_t val = 0;
        int ret = OH_IPCParcel_ReadInt32(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteInt64(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int64_t val = 0;
        int ret = OH_IPCParcel_WriteInt64(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadInt64(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int64_t val = 0;
        int ret = OH_IPCParcel_ReadInt64(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteFloat(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        float val = 0.0f;
        int ret = OH_IPCParcel_WriteFloat(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadFloat(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        float val = 0.0f;
        int ret = OH_IPCParcel_ReadFloat(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteDouble(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        double val = 0.0;
        int ret = OH_IPCParcel_WriteDouble(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadDouble(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        double val = 0.0;
        int ret = OH_IPCParcel_ReadDouble(parcel, &val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteString(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        const char* val = "";
        int ret = OH_IPCParcel_WriteString(parcel, val);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadString(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    do {
        if (parcel == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        const char *val = "";
        int ret = OH_IPCParcel_WriteString(parcel, val);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        const char *readStr = OH_IPCParcel_ReadString(parcel);
        if (readStr == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCParcelWriteBuffer(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        uint8_t buff[10] = {0};
        int ret = OH_IPCParcel_WriteBuffer(parcel, buff, sizeof(buff));
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, ret, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadBuffer(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    do {
        if (parcel == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        uint8_t buff[10] = {0};
        int ret = OH_IPCParcel_WriteBuffer(parcel, buff, sizeof(buff));
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        const uint8_t *readBuff = OH_IPCParcel_ReadBuffer(parcel, sizeof(buff));
        if (readBuff == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCParcelWriteRemoteStub(napi_env env, napi_callback_info info)
{
    napi_value result;
    do {
        OHIPCParcel *parcel = OH_IPCParcel_Create();
        if (parcel == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        auto stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub,
            nullptr, nullptr);
        if (stub == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCRemoteStub_Destroy(stub);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCParcelReadRemoteStub(napi_env env, napi_callback_info info)
{
    napi_value result;
    do {
        OHIPCParcel *parcel = OH_IPCParcel_Create();
        if (parcel == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OHIPCRemoteStub *stub = OH_IPCRemoteStub_Create(TEST_STR, OnRemoteRequestStub,
            nullptr, nullptr);
        if (stub == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        int ret = OH_IPCParcel_WriteRemoteStub(parcel, stub);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCRemoteStub_Destroy(stub);
        OHIPCRemoteStub *readStub = OH_IPCParcel_ReadRemoteStub(parcel);
        if (readStub == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCRemoteStub_Destroy(readStub);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCParcelWriteRemoteProxy(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        OHIPCRemoteProxy *proxy = nullptr;
        int ret = OH_IPCParcel_WriteRemoteProxy(parcel, proxy);
        (void)ret;
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadRemoteProxy(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        OHIPCRemoteProxy *proxy = OH_IPCParcel_ReadRemoteProxy(parcel);
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, proxy == nullptr ? 1 : 0, &result);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelAppend(napi_env env, napi_callback_info info)
{
    napi_value result;
    do {
        OHIPCParcel *parcel1 = OH_IPCParcel_Create();
        if (parcel1 == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OHIPCParcel *parcel2 = OH_IPCParcel_Create();
        if (parcel2 == nullptr) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        int8_t val = 0;
        int ret = OH_IPCParcel_WriteInt8(parcel2, val);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        ret = OH_IPCParcel_Append(parcel1, parcel2);
        if (ret != OH_IPC_SUCCESS) {
            napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
            break;
        }
        OH_IPCParcel_Destroy(parcel1);
        OH_IPCParcel_Destroy(parcel2);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } while (false);
    return result;
}

static napi_value OHIPCParcelReadFileDescriptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int32_t fd = -1;
        int ret = OH_IPCParcel_ReadFileDescriptor(parcel, &fd);
        (void)ret;
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteFileDescriptor(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        int32_t fd = -1;
        int ret = OH_IPCParcel_WriteFileDescriptor(parcel, fd);
        (void)ret;
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelWriteInterfaceToken(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        const char *token = "";
        int ret = OH_IPCParcel_WriteInterfaceToken(parcel, token);
        (void)ret;
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

static napi_value OHIPCParcelReadInterfaceToken(napi_env env, napi_callback_info info)
{
    napi_value result;
    OHIPCParcel *parcel = OH_IPCParcel_Create();
    if (parcel != nullptr) {
        char *token = nullptr;
        int32_t len = 0;
        OH_IPC_MemAllocator allocator = MemAllocator;
        int ret = OH_IPCParcel_ReadInterfaceToken(parcel, &token, &len, allocator);
        (void)ret;
        OH_IPCParcel_Destroy(parcel);
        napi_create_int32(env, OH_IPC_SUCCESS, &result);
    } else {
        napi_create_int32(env, OH_IPC_ERROR_CODE_BASE, &result);
    }
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonJoinWorkThread", nullptr, OHIPCSkeletonJoinWorkThread, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonStopWorkThread", nullptr, OHIPCSkeletonStopWorkThread, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonGetCallingTokenId", nullptr, OHIPCSkeletonGetCallingTokenId, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonGetFirstTokenId", nullptr, OHIPCSkeletonGetFirstTokenId, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonGetSelfTokenId", nullptr, OHIPCSkeletonGetSelfTokenId, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonGetCallingPid", nullptr, OHIPCSkeletonGetCallingPid, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonGetCallingUid", nullptr, OHIPCSkeletonGetCallingUid, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonIsLocalCalling", nullptr, OHIPCSkeletonIsLocalCalling, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonSetMaxWorkThreadNum", nullptr, OHIPCSkeletonSetMaxWorkThreadNum,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonResetCallingIdentity", nullptr, OHIPCSkeletonResetCallingIdentity,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonSetCallingIdentity", nullptr, OHIPCSkeletonSetCallingIdentity,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCSkeletonIsHandlingTransaction", nullptr, OHIPCSkeletonIsHandlingTransaction,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteStubCreate", nullptr, OHIPCRemoteStubCreate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteStubDestroy", nullptr, OHIPCRemoteStubDestroy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxyDestroy", nullptr, OHIPCRemoteProxyDestroy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxySendRequest", nullptr, OHIPCRemoteProxySendRequest,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxyGetInterfaceDescriptor", nullptr, OHIPCRemoteProxyGetInterfaceDescriptor,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCDeathRecipientCreate", nullptr, OHIPCDeathRecipientCreate, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCDeathRecipientDestroy", nullptr, OHIPCDeathRecipientDestroy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxyAddDeathRecipient", nullptr, OHIPCRemoteProxyAddDeathRecipient,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxyRemoveDeathRecipient", nullptr, OHIPCRemoteProxyRemoveDeathRecipient,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCRemoteProxyIsRemoteDead", nullptr, OHIPCRemoteProxyIsRemoteDead, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelCreate", nullptr, OHIPCParcelCreate, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelDestroy", nullptr, OHIPCParcelDestroy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelGetDataSize", nullptr, OHIPCParcelGetDataSize, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelGetWritableBytes", nullptr, OHIPCParcelGetWritableBytes,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelGetReadableBytes", nullptr, OHIPCParcelGetReadableBytes,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelGetReadPosition", nullptr, OHIPCParcelGetReadPosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelGetWritePosition", nullptr, OHIPCParcelGetWritePosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelRewindReadPosition", nullptr, OHIPCParcelRewindReadPosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelRewindWritePosition", nullptr, OHIPCParcelRewindWritePosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteInt8", nullptr, OHIPCParcelWriteInt8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadInt8", nullptr, OHIPCParcelReadInt8, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteInt16", nullptr, OHIPCParcelWriteInt16, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadInt16", nullptr, OHIPCParcelReadInt16, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteInt32", nullptr, OHIPCParcelWriteInt32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadInt32", nullptr, OHIPCParcelReadInt32, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteInt64", nullptr, OHIPCParcelWriteInt64, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadInt64", nullptr, OHIPCParcelReadInt64, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteFloat", nullptr, OHIPCParcelWriteFloat, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadFloat", nullptr, OHIPCParcelReadFloat, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteDouble", nullptr, OHIPCParcelWriteDouble, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadDouble", nullptr, OHIPCParcelReadDouble, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteString", nullptr, OHIPCParcelWriteString, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadString", nullptr, OHIPCParcelReadString, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteBuffer", nullptr, OHIPCParcelWriteBuffer, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadBuffer", nullptr, OHIPCParcelReadBuffer, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteRemoteStub", nullptr, OHIPCParcelWriteRemoteStub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadRemoteStub", nullptr, OHIPCParcelReadRemoteStub, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteRemoteProxy", nullptr, OHIPCParcelWriteRemoteProxy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadRemoteProxy", nullptr, OHIPCParcelReadRemoteProxy, nullptr,
            nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteFileDescriptor", nullptr, OHIPCParcelWriteFileDescriptor,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadFileDescriptor", nullptr, OHIPCParcelReadFileDescriptor,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelAppend", nullptr, OHIPCParcelAppend, nullptr, nullptr,
            nullptr, napi_default, nullptr},
        {"oHIPCParcelWriteInterfaceToken", nullptr, OHIPCParcelWriteInterfaceToken,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"oHIPCParcelReadInterfaceToken", nullptr, OHIPCParcelReadInterfaceToken,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "IPCCApi",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}