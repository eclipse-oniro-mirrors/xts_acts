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
export const oHNativeBufferAlloc: () => number;
export const oHNativeBufferReference: () => number;
export const oHNativeBufferUnreference: () => number;
export const oHNativeBufferGetConfig: () => number;
export const oHNativeBufferMap: () => number;
export const oHNativeBufferUnmap: () => number;
export const oHNativeBufferGetSeqNum: () => number;
export const oHNativeBufferAllocAbnormal: () => number;
export const oHNativeBufferReferenceAbnormal: () => number;
export const oHNativeBufferUnreferenceAbnormal: () => number;
export const oHNativeBufferGetConfigAbnormal: () => number;
export const oHNativeBufferMapAbnormal: () => number;
export const oHNativeBufferUnmapAbnormal: () => number;
export const oHNativeBufferGetSeqNumAbnormal: () => number;

//
export const oHNativeBufferAllocNullptr: () => number;
export const oHNativeBufferAllocNormal: () => Array<number>;
export const oHNativeBufferAllocAbormal: () => Array<number>;
export const oHNativeBufferAllocMuch: () => number;
export const oHNativeBufferFromNativeWindowBufferNullptr: () => Array<number>;
export const oHNativeBufferFromNativeWindowBufferNormal: () => Array<number>;
export const oHNativeBufferGetConfigNullptr: () => number;
export const oHNativeBufferGetConfigNormal: () => number;
export const oHNativeBufferGetSeqNumNullptr: () => number;
export const oHNativeBufferGetSeqNumNormal: () => number;
export const oHNativeBuffeMapNullptr: () => number;
export const oHNativeBufferMapNormal: () => number;
export const oHNativeBuffeMapPlanesNullptr: () => Array<number>;
export const oHNativeBufferMapPlanesAbNormal: () => Array<number>;
export const oHNativeBufferMapPlanesNormal: () => Array<number>;
export const oHNativeBuffeReferenceNullptr: () => number;
export const oHNativeBuffeUnreferenceNullptr: () => number;
export const oHNativeBufferReferenceNormal: () => number;
export const oHNativeBufferReferenceMax: () => number;
export const oHNativeBufferUnreferenceNormal: () => number;
export const oHNativeBuffeUnmapNullptr: () => number;
export const oHNativeBufferUnmapNormal: () => number;
export const oHNativeBufferGetColorSpaceFirst: () => number;
export const oHNativeBufferSetColorSpaceNormal: () => Array<number>;
export const oHNativeBufferSetColorSpaceNullptr: () => number;
export const oHNativeBufferSetColorSpaceAbnormal: () => number;
export const oHNativeBufferGetColorSpaceNullptr: () => Array<number>;
export const oHNativeBufferGetMetadataValueFirst: () => number;
export const oHNativeBufferSetDynamicMetadataValue: () => Array<number>;
export const oHNativeBufferSetMetadataValueTimes: () => number;
export const oHNativeBufferSetStaticMetadataValue: () => Array<number>;
export const oHNativeBufferSetMetadataValue: () => Array<number>;
export const oHNativeBufferSetNullMetadataValue: () => number;
export const oHNativeBufferSetMetadataValueNullptr: () => Array<number>;
export const oHNativeBufferGetMetadataValueAbnormal: () => Array<number>;
export const oHNativeBufferGetMetadataValueNullptr: () => Array<number>;
export const oHNativeBufferY8Y16USAGEandAlloc: () => Array<number>;



