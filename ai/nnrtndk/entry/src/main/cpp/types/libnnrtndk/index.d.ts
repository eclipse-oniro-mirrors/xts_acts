/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
export const oHNNModelConstructOne: () => number;
export const oHNNModelConstructTwo: () => number;
export const oHNNModelAddTensorOne: () => number;
export const oHNNModelAddTensorTwo: () => number;
export const oHNNModelSetTensorDataOne: () => number;
export const oHNNModelSetTensorDataTwo: () => number;
export const oHNNModelAddOperationOne: () => number;
export const oHNNModelAddOperationTwo: () => number;
export const oHNNModelSpecifyInputsAndOutputsOne: () => number;
export const oHNNModelSpecifyInputsAndOutputsTwo: () => number;
export const oHNNModelFinishOne: () => number;
export const oHNNModelFinishTwo: () => number;
export const oHNNModelDestroy: () => number;
export const oHNNModelGetAvailableoperationsOne: () => number;
export const oHNNModelGetAvailableoperationsTwo: () => number;

export const oHNNCompilationConstructOne: () => number;
export const oHNNCompilationConstructTwo: () => number;
export const oHNNCompilationSetDeviceOne: () => number;
export const oHNNCompilationSetDeviceTwo: () => number;
export const oHNNCompilationSetCacheOne: () => number;
export const oHNNCompilationSetCacheTwo: () => number;
export const oHNNCompilationSetPerformanceModeOne: () => number;
export const oHNNCompilationSetPerformanceModeTwo: () => number;
export const oHNNCompilationSetPerformanceModeThree: () => number;
export const oHNNCompilationSetPerformanceModeFour: () => number;
export const oHNNCompilationSetPriorityOne: () => number;
export const oHNNCompilationSetPriorityTwo: () => number;
export const oHNNCompilationEnableFloat16One: () => number;
export const oHNNCompilationEnableFloat16Two: () => number;
export const oHNNCompilationBuildOne: () => number;
export const oHNNCompilationBuildTwo: () => number;
export const oHNNCompilationDestroy: () => number;

export const oHNNExecutorConstructOne: () => number;
export const oHNNExecutorConstructTwo: () => number;
export const oHNNExecutorSetInputOne: () => number;
export const oHNNExecutorSetInputTwo: () => number;
export const oHNNExecutorSetOutputOne: () => number;
export const oHNNExecutorSetOutputTwo: () => number;
export const oHNNExecutorGetOutputShapeOne: () => number;
export const oHNNExecutorGetOutputShapeTwo: () => number;
export const oHNNExecutorRunOne: () => number;
export const oHNNExecutorRunTwo: () => number;
export const oHNNExecutorAllocateInputMemoryOne: () => number;
export const oHNNExecutorAllocateInputMemoryTwo: () => number;
export const oHNNExecutorAllocateOutputMemoryOne: () => number;
export const oHNNExecutorAllocateOutputMemoryTwo: () => number;
export const oHNNExecutorDestroyInputMemory: () => number;
export const oHNNExecutorDestroyOutputMemory: () => number;
export const oHNNExecutorSetInputWithMemoryOne: () => number;
export const oHNNExecutorSetInputWithMemoryTwo: () => number;
export const oHNNExecutorSetOutputWithMemoryOne: () => number;
export const oHNNExecutorSetOutputWithMemoryTwo: () => number;
export const oHNNExecutorDestroy: () => number;

export const oHNNDeviceGetAllDevicesIDOne: () => number;
export const oHNNDeviceGetAllDevicesIDTwo: () => number;
export const oHNNDeviceGetNameOne: () => number;
export const oHNNDeviceGetNameTwo: () => number;
export const oHNNDeviceGetTypeOne: () => number;
export const oHNNDeviceGetTypeTwo: () => number;