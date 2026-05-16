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

import { describe, it, expect, TestType, Size, Level} from '@ohos/hypium'
import hilog from '@ohos.hilog';
import iPCCApi from 'libIPCCApi.so'

export default function iPCCApiTest() {
  describe('IPCCApiTest', () => {

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_JoinWorkThread_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_JoinWorkThread_0100
     * @tc.desc   test OH_IPCSkeleton_JoinWorkThread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_JoinWorkThread_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonJoinWorkThread();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_StopWorkThread_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_StopWorkThread_0100
     * @tc.desc   test OH_IPCSkeleton_StopWorkThread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_StopWorkThread_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonStopWorkThread();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingTokenId_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingTokenId_0100
     * @tc.desc   test OH_IPCSkeleton_GetCallingTokenId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingTokenId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonGetCallingTokenId();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_GetFirstTokenId_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_GetFirstTokenId_0100
     * @tc.desc   test OH_IPCSkeleton_GetFirstTokenId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_GetFirstTokenId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonGetFirstTokenId();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_GetSelfTokenId_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_GetSelfTokenId_0100
     * @tc.desc   test OH_IPCSkeleton_GetSelfTokenId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_GetSelfTokenId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonGetSelfTokenId();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingPid_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingPid_0100
     * @tc.desc   test OH_IPCSkeleton_GetCallingPid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingPid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonGetCallingPid();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingUid_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingUid_0100
     * @tc.desc   test OH_IPCSkeleton_GetCallingUid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_GetCallingUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonGetCallingUid();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_IsLocalCalling_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_IsLocalCalling_0100
     * @tc.desc   test OH_IPCSkeleton_IsLocalCalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_IsLocalCalling_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonIsLocalCalling();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_SetMaxWorkThreadNum_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_SetMaxWorkThreadNum_0100
     * @tc.desc   test OH_IPCSkeleton_SetMaxWorkThreadNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_SetMaxWorkThreadNum_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonSetMaxWorkThreadNum();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_ResetCallingIdentity_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_ResetCallingIdentity_0100
     * @tc.desc   test OH_IPCSkeleton_ResetCallingIdentity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_ResetCallingIdentity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonResetCallingIdentity();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_SetCallingIdentity_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_SetCallingIdentity_0100
     * @tc.desc   test OH_IPCSkeleton_SetCallingIdentity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_SetCallingIdentity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonSetCallingIdentity();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCSkeleton_IsHandlingTransaction_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCSkeleton_IsHandlingTransaction_0100
     * @tc.desc   test OH_IPCSkeleton_IsHandlingTransaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCSkeleton_IsHandlingTransaction_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCSkeletonIsHandlingTransaction();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteStub_Create_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteStub_Create_0100
     * @tc.desc   test OH_IPCRemoteStub_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteStub_Create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteStubCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteStub_Destroy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteStub_Destroy_0100
     * @tc.desc   test OH_IPCRemoteStub_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteStub_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteStubDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_Destroy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_Destroy_0100
     * @tc.desc   test OH_IPCRemoteProxy_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxyDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_SendRequest_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_SendRequest_0100
     * @tc.desc   test OH_IPCRemoteProxy_SendRequest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_SendRequest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxySendRequest();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_GetInterfaceDescriptor_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_GetInterfaceDescriptor_0100
     * @tc.desc   test OH_IPCRemoteProxy_GetInterfaceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_GetInterfaceDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxyGetInterfaceDescriptor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCDeathRecipient_Create_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCDeathRecipient_Create_0100
     * @tc.desc   test OH_IPCDeathRecipient_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCDeathRecipient_Create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCDeathRecipientCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCDeathRecipient_Destroy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCDeathRecipient_Destroy_0100
     * @tc.desc   test OH_IPCDeathRecipient_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCDeathRecipient_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCDeathRecipientDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_AddDeathRecipient_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_AddDeathRecipient_0100
     * @tc.desc   test OH_IPCRemoteProxy_AddDeathRecipient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_AddDeathRecipient_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxyAddDeathRecipient();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_RemoveDeathRecipient_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_RemoveDeathRecipient_0100
     * @tc.desc   test OH_IPCRemoteProxy_RemoveDeathRecipient
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_RemoveDeathRecipient_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxyRemoveDeathRecipient();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCRemoteProxy_IsRemoteDead_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCRemoteProxy_IsRemoteDead_0100
     * @tc.desc   test OH_IPCRemoteProxy_IsRemoteDead
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCRemoteProxy_IsRemoteDead_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCRemoteProxyIsRemoteDead();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_Create_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_Create_0100
     * @tc.desc   test OH_IPCParcel_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_Create_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_Destroy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_Destroy_0100
     * @tc.desc   test OH_IPCParcel_Destroy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_Destroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelDestroy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_GetDataSize_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_GetDataSize_0100
     * @tc.desc   test OH_IPCParcel_GetDataSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_GetDataSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelGetDataSize();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_GetWritableBytes_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_GetWritableBytes_0100
     * @tc.desc   test OH_IPCParcel_GetWritableBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_GetWritableBytes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelGetWritableBytes();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_GetReadableBytes_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_GetReadableBytes_0100
     * @tc.desc   test OH_IPCParcel_GetReadableBytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_GetReadableBytes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelGetReadableBytes();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_GetReadPosition_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_GetReadPosition_0100
     * @tc.desc   test OH_IPCParcel_GetReadPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_GetReadPosition_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelGetReadPosition();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_GetWritePosition_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_GetWritePosition_0100
     * @tc.desc   test OH_IPCParcel_GetWritePosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_GetWritePosition_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelGetWritePosition();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_RewindReadPosition_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_RewindReadPosition_0100
     * @tc.desc   test OH_IPCParcel_RewindReadPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_RewindReadPosition_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelRewindReadPosition();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_RewindWritePosition_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_RewindWritePosition_0100
     * @tc.desc   test OH_IPCParcel_RewindWritePosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_RewindWritePosition_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelRewindWritePosition();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteInt8_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteInt8_0100
     * @tc.desc   test OH_IPCParcel_WriteInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteInt8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadInt8_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadInt8_0100
     * @tc.desc   test OH_IPCParcel_ReadInt8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadInt8_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadInt8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteInt16_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteInt16_0100
     * @tc.desc   test OH_IPCParcel_WriteInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteInt16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteInt16();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadInt16_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadInt16_0100
     * @tc.desc   test OH_IPCParcel_ReadInt16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadInt16_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadInt16();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteInt32_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteInt32_0100
     * @tc.desc   test OH_IPCParcel_WriteInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteInt32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteInt32();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadInt32_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadInt32_0100
     * @tc.desc   test OH_IPCParcel_ReadInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadInt32_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadInt32();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteInt64_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteInt64_0100
     * @tc.desc   test OH_IPCParcel_WriteInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteInt64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteInt64();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadInt64_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadInt64_0100
     * @tc.desc   test OH_IPCParcel_ReadInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadInt64_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadInt64();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteFloat_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteFloat_0100
     * @tc.desc   test OH_IPCParcel_WriteFloat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteFloat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteFloat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadFloat_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadFloat_0100
     * @tc.desc   test OH_IPCParcel_ReadFloat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadFloat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadFloat();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteDouble_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteDouble_0100
     * @tc.desc   test OH_IPCParcel_WriteDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteDouble_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteDouble();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadDouble_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadDouble_0100
     * @tc.desc   test OH_IPCParcel_ReadDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadDouble_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadDouble();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteString_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteString_0100
     * @tc.desc   test OH_IPCParcel_WriteString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteString();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadString_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadString_0100
     * @tc.desc   test OH_IPCParcel_ReadString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadString();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteBuffer_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteBuffer_0100
     * @tc.desc   test OH_IPCParcel_WriteBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadBuffer_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadBuffer_0100
     * @tc.desc   test OH_IPCParcel_ReadBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadBuffer_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadBuffer();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteStub_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteStub_0100
     * @tc.desc   test OH_IPCParcel_WriteRemoteStub
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteRemoteStub();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteStub_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteStub_0100
     * @tc.desc   test OH_IPCParcel_ReadRemoteStub
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadRemoteStub();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteProxy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteProxy_0100
     * @tc.desc   test OH_IPCParcel_WriteRemoteProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteRemoteProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteRemoteProxy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteProxy_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteProxy_0100
     * @tc.desc   test OH_IPCParcel_ReadRemoteProxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadRemoteProxy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadRemoteProxy();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteFileDescriptor_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteFileDescriptor_0100
     * @tc.desc   test OH_IPCParcel_WriteFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteFileDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteFileDescriptor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadFileDescriptor_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadFileDescriptor_0100
     * @tc.desc   test OH_IPCParcel_ReadFileDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadFileDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadFileDescriptor();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_Append_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_Append_0100
     * @tc.desc   test OH_IPCParcel_Append
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_Append_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelAppend();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_WriteInterfaceToken_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_WriteInterfaceToken_0100
     * @tc.desc   test OH_IPCParcel_WriteInterfaceToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_WriteInterfaceToken_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelWriteInterfaceToken();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_N_IPCParcel_ReadInterfaceToken_0100
     * @tc.number SUB_DSoftbus_IPC_N_IPCParcel_ReadInterfaceToken_0100
     * @tc.desc   test OH_IPCParcel_ReadInterfaceToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_N_IPCParcel_ReadInterfaceToken_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = iPCCApi.oHIPCParcelReadInterfaceToken();
      expect(result).assertEqual(0);
      done();
    });

  })

}