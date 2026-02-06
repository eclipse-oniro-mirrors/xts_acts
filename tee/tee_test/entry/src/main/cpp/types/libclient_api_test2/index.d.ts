/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
export const InitContext: () => number;

export const FinalizeContext;

export const CloseSession;

export const ReleaseSharedMemory;

export const Opensession_WithoutContext: () => Array<number>;

export const Opensession_WithoutSession: () => Array<number>;

export const Opensession_WithoutDestination: () => Array<number>;

export const Opensession_WithoutConnectionMethod: () => Array<number>;

export const Opensession_WithNotSupportConnectionMethod: () => Array<number>;

export const Opensession_ContextIsNotInit: () => Array<number>;

export const Opensession_ParamValueIsInvalid: () => Array<number>;

export const Opensession_WithoutOperation: () => Array<number>;

export const Opensession_WithoutOrigin: () => number;

export const Opensession_WithOperationIsNone: () => Array<number>;

export const Opensession_WithOperationIsValue: () => Array<number>;

export const Opensession_WithOperationIsTempMem: () => Array<number>;

export const Opensession_WithNotExistUUID: () => Array<number>;

export const Opensession_ReturnErrorFromTA: () => Array<number>;

export const Opensession_WithParamTypesIsInvalid: () => Array<number>;

export const RequestCancellationTest: () => number;

export const Closesession_WithCreatedSession: () => Array<number>;

export const Closesession_WithoutSession: () => Array<number>;

export const Closesession_WithNotOpenedSession: () => Array<number>;

export const AllocateSharedMemory_WithAllocatedMem: () => number;

export const AllocateSharedMemory_WithoutContext: () => number;

export const AllocateSharedMemory_WithoutSharedMem: () => number;

export const AllocateSharedMemory_WithSharedMemHasReleased: () => number;

export const AllocateSharedMemory_WithSharedMemFlagIsZero: () => number;

export const AllocateSharedMemory_WithSharedMemFlagIsInvalid: () => number;

export const AllocateSharedMemory_WithSizeExceed: () => number;

export const AllocateSharedMemory_ReachSharememNumLimit: () => Array<number>;

export const RegisterSharedMemory_WithRegisterMem: () => number;

export const RegisterSharedMemory_WithoutContext: () => number;

export const RegisterSharedMemory_WithoutSharedMem: () => number;

export const RegisterSharedMemory_WithSharedMemFlagIsZero: () => number;

export const RegisterSharedMemory_WithSharedMemFlagIsInvalid: () => number;

export const RegisterSharedMemory_WithSharedMemBufferIsNull: () => number;