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

export const OpenSession: () => number;

export const FinalizeContext;

export const CloseSession;

export const AllocateSharedMemory: () => number;

export const ReleaseSharedMemory;

export const InvokeCommand_WithoutOperation: () => Array<number>;

export const InvokeCommand_WithoutSession: () => Array<number>;

export const InvokeCommand_WithOperationIsValue: () => Array<number>;

export const InvokeCommand_WithOperationIsTempMem: () => Array<number>;

export const InvokeCommand_WithOperationIsPartialMem: () => Array<number>;

export const InvokeCommand_WithOperationIsTempMemIsNULL: () => Array<number>;

export const InvokeCommand_WithOperationNotStart: () => Array<number>;

export const InvokeCommand_WithOperationTypePartialUseTemp: () => Array<number>;

export const InvokeCommand_WithOperationTypePartialSizeIsExceed: () => Array<number>;

export const InvokeCommand_WithOperationTypePartialSizeIsZero: () => Array<number>;

export const InvokeCommand_WithMemrefTempInoutExceed1024k: () => Array<number>;

export const InvokeCommand_WithMemrefWholeExceed2048k: () => Array<number>;

