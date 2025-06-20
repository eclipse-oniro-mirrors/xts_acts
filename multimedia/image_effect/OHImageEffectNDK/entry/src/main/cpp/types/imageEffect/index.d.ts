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

export const savePixelMapForPath: (path: string) => number;
export const creatOutPixeMapForPath: (path: string) => number;
export const OHEffectBufferInfoCreate: () => number;
export const OHEffectBufferInfoSetAddr: (a: number) => number;
export const OHEffectBufferInfoGetAddr: (a: number) => number;
export const OHEffectBufferInfoSetEffectFormat: (a: number) => number;
export const OHEffectBufferInfoGetEffectFormat: (a: number) => number;
export const OHEffectBufferInfoSetHeight: (a: number) => number;
export const OHEffectBufferInfoGetHeight: (a: number) => number;
export const OHEffectBufferInfoSetRowSize: (a: number) => number;
export const OHEffectBufferInfoGetRowSize: (a: number) => number;
export const OHEffectBufferInfoSetWidth: (a: number) => number;
export const OHEffectBufferInfoGetWidth: (a: number) => number;
export const OHEffectBufferInfoSetTimestamp: (a: number) => number;
export const OHEffectBufferInfoGetTimestamp: (a: number) => number;
export const OHEffectBufferInfoRelease: (a: number) => number;

export const OHEffectFilterInfoCreate: () => number;
export const OHEffectFilterInfoSetFilterName: (a: number) => number;
export const OHEffectFilterInfoGetFilterName: (a: number) => number;
export const OHEffectFilterInfoSetSupportedBufferTypes: (a: number) => number;
export const OHEffectFilterInfoGetSupportedBufferTypes: (a: number) => number;
export const OHEffectFilterInfoSetSupportedFormats: (a: number) => number;
export const OHEffectFilterInfoGetSupportedFormats: (a: number) => number;
export const OHEffectFilterInfoRelease: (a: number) => number;

export const OHEffectFilterCreate: (a: number) => number;
export const OHEffectFilterSetValue: (a: number) => number;
export const OHEffectFilterGetValue: (a: number) => number;
export const OHEffectFilterLookupFilterInfo: (a: number) => number;
export const OHEffectFilterLookupFilters: (a: number) => number;
export const OHEffectFilterRegister: (a: number) => number;
export const OHEffectFilterRelease: (a: number) => number;
export const OHEffectFilterReleaseFilterNames: (a: number) => number;
export const OHEffectFilterRender: (a:number) => number;

export const OHImageEffectCreate: (a: number) => number;
export const OHImageEffectConfigure: (a: number) => number;
export const OHImageEffectAddFilter: (a: number) => number;
export const OHImageEffectAddFilterByFilter: (a: number) => number;
export const OHImageEffectGetFilter: (a: number) => number;
export const OHImageEffectGetFilterCount: (a: number) => number;
export const OHImageEffectGetInputSurface: (a: number) => number;
export const OHImageEffectInsertFilter: (a: number) => number;
export const OHImageEffectInsertFilterByFilter: (a: number) => number;
export const OHImageEffectReplaceFilter: (a: number) => number;
export const OHImageEffectReplaceFilterByFilter: (a: number) => number;
export const OHImageEffectRelease: (a: number) => number;
export const OHImageEffectRemoveFilter: (a: number) => number;
export const OHImageEffectRemoveFilterByIndex: (a: number) => number;
export const OHImageEffectSave: (a: number) => number;
export const OHImageEffectRestore: (a: number) => number;
export const OHImageEffectSetInputNativeBuffer: () => number;
export const OHImageEffectSetInputPixelmap: (a: number) => number;
export const OHImageEffectSetInputUri: (a: number) => number;
export const OHImageEffectSetOutputNativeBuffer: () => number;
export const OHImageEffectSetOutputPixelmap: (a: number) => number;
export const OHImageEffectSetOutputSurface: (a: number) => number;
export const OHImageEffectSetOutputUri: (a: number) => number;
export const OHImageEffectStart: () => number;
export const OHImageEffectStop: () => number;
export const OHImageEffectSetInputPicture: () => number;
export const OHImageEffectSetOutputPicture: () => number;