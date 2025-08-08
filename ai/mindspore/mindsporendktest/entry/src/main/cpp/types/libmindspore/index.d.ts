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
export const oHAIContextCreateOne: () => number;
export const oHAIContextDestroyOne: () => number;
export const oHAIContextSetThreadNumOne: (a: number) => number;
export const oHAIContextSetThreadNumTwo: (a: number) => number;
export const oHAIContextGetThreadNumOne: (a: number) => number;
export const oHAIContextGetThreadNumTwo: () => number;
export const oHAIContextSetThreadAffinityModeOne: (a: number) => number;
export const oHAIContextSetThreadAffinityModeTwo: (a: number) => number;
export const oHAIContextGetThreadAffinityModeOne: (a: number) => number;
export const oHAIContextGetThreadAffinityModeTwo: () => number;
export const oHAIDeviceInfoCreateOne: (a: number) => number;
export const oHAIDeviceInfoGetDeviceTypeOne: (a: number) => number;
export const oHAIDeviceInfoGetDeviceTypeTwo: (a: number) => number;
export const oHAIDeviceInfoGetDeviceTypeThree: (a: number) => number;
export const oHAIDeviceInfoGetDeviceTypeFour: () => number;
export const oHAIDeviceInfoDestroyOne: (a: number) => number;
export const oHAIDeviceInfoSetProviderOne: (a: number, b: string) => string;
export const oHAIDeviceInfoSetProviderTwo: (a: number, b: string) => string;
export const oHAIDeviceInfoSetProviderThree: (a: number, b: string) => number;
export const oHAIDeviceInfoSetProviderFour: (a: number, b: string) => string;
export const oHAIDeviceInfoGetProviderOne: (a: number, b: string) => string;
export const oHAIDeviceInfoGetProviderTwo: () => number;
export const oHAIDeviceInfoSetProviderDeviceOne: (a: number, b: string) => string;
export const oHAIDeviceInfoSetProviderDeviceTwo: (a: number, b: string) => string;
export const oHAIDeviceInfoSetProviderDeviceThree: (a: number, b: string) => string;
export const oHAIDeviceInfoGetProviderDeviceOne: (a: number, b: string) => string;
export const oHAIDeviceInfoGetProviderDeviceTwo: () => number;
export const oHAIDeviceInfoSetEnableFP16One: (a: number) => number;
export const oHAIDeviceInfoSetEnableFP16Two: (a: number) => number;
export const oHAIDeviceInfoSetEnableFP16Three: () => number;
export const oHAIDeviceInfoGetEnableFP16One: (a: number) => number;
export const oHAIDeviceInfoGetEnableFP16Two: () => number;
export const oHAIDeviceInfoSetDeviceIdOne: (a: number, b: number) => number;
export const oHAIDeviceInfoSetDeviceIdTwo: (a: number) => number;
export const oHAIDeviceInfoGetDeviceIdOne: (a: number, b: number) => number;
export const oHAIDeviceInfoGetDeviceIdTwo: () => number;
export const oHAIDeviceInfoSetPerformanceModeOne: (a: number, b: number) => number;
export const oHAIDeviceInfoSetPerformanceModeTwo: (a: number, b: number) => number;
export const oHAIDeviceInfoSetPerformanceModeThree: (a: number, b: number) => number;
export const oHAIDeviceInfoSetPerformanceModeFour: (a: number, b: number) => number;
export const oHAIDeviceInfoSetPerformanceModeFive: (a: number, b: number) => number;
export const oHAIDeviceInfoGetPerformanceModeOne: (a: number, b: number) => number;
export const oHAIDeviceInfoGetPerformanceModeTwo: () => number;
export const oHAIContextSetThreadAffinityCoreListOne: () => number;
export const oHAIContextGetThreadAffinityCoreListOne: () => number;
export const oHAIContextSetEnableParallelOne: () => number;
export const oHAIContextSetEnableParallelTwo: () => number;
export const oHAIContextGetEnableParallelOne: () => number;
export const oHAIContextGetEnableParallelTwo: () => number;
export const oHAISetFrequencyOne: (a: number) => number;
export const oHAIGetFrequencyOne: (a: number) => number;
export const oHAIModelCreateOne: () => number;
export const oHAIModelDestroyOne: () => number;
export const oHAITensorCreateOne: () => number;
export const oHAITensorDestroyOne: () => number;
export const oHAITensorCloneOne: () => number;
export const oHAITensorSetNameOne: (a: string) => number;
export const oHAITensorGetNameOne: (a: string) => number;
export const oHAITensorSetDataTypeOne: () => number;
export const oHAITensorGetDataTypeOne: () => number;
export const oHAITensorSetShapeOne: () => number;
export const oHAITensorGetShapeOne: () => number;
export const oHAITensorSetFormatOne: () => number;
export const oHAITensorGetFormatOne: () => number;
export const oHAITensorSetDataOne: () => number;
export const oHAITensorGetDataOne: () => number;
export const oHAITensorGetMutableDataOne: () => number;
export const oHAITensorGetElementNumOne: () => number;
export const oHAITensorGetDataSizeOne: () => number;
export const oHAIDeviceInfoSetPriorityOne: () => number;
export const oHAIDeviceInfoAddExtensionOne: () => number;
export const oHAIContextAddDeviceInfoOne: () => number;
export const oHAIDeviceInfoAddExtensionThree: () => number;
export const oHAIModelBuildFromFileOne: () => number;
export const oHAIModelResizeOne: () => number;
export const oHAIModelPredictOne: () => number;
export const oHAITensorSetUserDataOne: () => number;
export const oHAIModelGetInputsOne: () => number;
export const oHAIModelGetOutputByTensorNameOne: () => number;
export const oHAIModelGetOutputsOne: () => number;
export const oHAIModelGetInputByTensorNameOne: () => number;


export const oHAIContextGetThreadAffinityCoreListTwo: () => number;
export const oHAIContextSetThreadAffinityCoreListTwo: () => number;
export const oHAICreateNNRTDeviceInfoByNameOne: () => number;
export const oHAICreateNNRTDeviceInfoByTypeOne: () => number;
export const oHAIDestroyAllNNRTDeviceDescsOne: () => number;
export const oHAIDeviceInfoAddExtensionTwo: () => number;
export const oHAIDeviceInfoCreateTwo: () => number;
export const oHAIDeviceInfoSetPriorityTwo: () => number;
export const oHAIGetAllNNRTDeviceDescsOne: () => number;
export const oHAIGetDeviceIdFromNNRTDeviceDescOne: () => number;
export const oHAIGetElementOfNNRTDeviceDescsOne: () => number;
export const oHAIGetFrequencyTwo: () => number;
export const oHAIGetNameFromNNRTDeviceDescOne: () => number;
export const oHAIGetTypeFromNNRTDeviceDescOne: () => number;
export const oHAISetFrequencyTwo: (a) => number;
export const oHAITensorCloneTwo: () => number;
export const oHAITensorCreateTwo: () => number;
export const oHAITensorGetDataSizeTwo: () => number;
export const oHAITensorGetDataTwo: () => number;
export const oHAITensorGetDataTypeTwo: () => number;
export const oHAITensorGetElementNumTwo: () => number;
export const oHAITensorGetFormatTwo: () => number;
export const oHAITensorGetMutableDataTwo: () => number;
export const oHAITensorGetNameTwo: () => number;
export const oHAITensorGetShapeTwo: () => number;
export const oHAITensorSetDataTwo: () => number;
export const oHAITensorSetDataTypeTwo: () => number;
export const oHAITensorSetFormatTwo: () => number;
export const oHAITensorSetNameTwo: () => number;
export const oHAITensorSetShapeTwo: () => number;
export const oHAIModelBuildOne: () => number;

