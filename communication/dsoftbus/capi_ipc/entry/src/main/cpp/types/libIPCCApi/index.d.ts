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

export const add: (a: number, b: number) => number;
export const oHIPCSkeletonJoinWorkThread: () => number;
export const oHIPCSkeletonStopWorkThread: () => number;
export const oHIPCSkeletonGetCallingTokenId: () => number;
export const oHIPCSkeletonGetFirstTokenId: () => number;
export const oHIPCSkeletonGetSelfTokenId: () => number;
export const oHIPCSkeletonGetCallingPid: () => number;
export const oHIPCSkeletonGetCallingUid: () => number;
export const oHIPCSkeletonIsLocalCalling: () => number;
export const oHIPCSkeletonSetMaxWorkThreadNum: () => number;
export const oHIPCSkeletonResetCallingIdentity: () => number;
export const oHIPCSkeletonSetCallingIdentity: () => number;
export const oHIPCSkeletonIsHandlingTransaction: () => number;
export const oHIPCRemoteStubCreate: () => number;
export const oHIPCRemoteStubDestroy: () => number;
export const oHIPCRemoteProxyDestroy: () => number;
export const oHIPCRemoteProxySendRequest: () => number;
export const oHIPCRemoteProxyGetInterfaceDescriptor: () => number;
export const oHIPCDeathRecipientCreate: () => number;
export const oHIPCDeathRecipientDestroy: () => number;
export const oHIPCRemoteProxyAddDeathRecipient: () => number;
export const oHIPCRemoteProxyRemoveDeathRecipient: () => number;
export const oHIPCRemoteProxyIsRemoteDead: () => number;
export const oHIPCParcelCreate: () => number;
export const oHIPCParcelDestroy: () => number;
export const oHIPCParcelGetDataSize: () => number;
export const oHIPCParcelGetWritableBytes: () => number;
export const oHIPCParcelGetReadableBytes: () => number;
export const oHIPCParcelGetReadPosition: () => number;
export const oHIPCParcelGetWritePosition: () => number;
export const oHIPCParcelRewindReadPosition: () => number;
export const oHIPCParcelRewindWritePosition: () => number;
export const oHIPCParcelWriteInt8: () => number;
export const oHIPCParcelReadInt8: () => number;
export const oHIPCParcelWriteInt16: () => number;
export const oHIPCParcelReadInt16: () => number;
export const oHIPCParcelWriteInt32: () => number;
export const oHIPCParcelReadInt32: () => number;
export const oHIPCParcelWriteInt64: () => number;
export const oHIPCParcelReadInt64: () => number;
export const oHIPCParcelWriteFloat: () => number;
export const oHIPCParcelReadFloat: () => number;
export const oHIPCParcelWriteDouble: () => number;
export const oHIPCParcelReadDouble: () => number;
export const oHIPCParcelWriteString: () => number;
export const oHIPCParcelReadString: () => number;
export const oHIPCParcelWriteBuffer: () => number;
export const oHIPCParcelReadBuffer: () => number;
export const oHIPCParcelWriteRemoteStub: () => number;
export const oHIPCParcelReadRemoteStub: () => number;
export const oHIPCParcelWriteRemoteProxy: () => number;
export const oHIPCParcelReadRemoteProxy: () => number;
export const oHIPCParcelWriteFileDescriptor: () => number;
export const oHIPCParcelReadFileDescriptor: () => number;
export const oHIPCParcelAppend: () => number;
export const oHIPCParcelWriteInterfaceToken: () => number;
export const oHIPCParcelReadInterfaceToken: () => number;