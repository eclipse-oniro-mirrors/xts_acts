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

// Native Window Test
export const testNativeWindowCreateNativeWindowNullptr: () => number;
export const testNativeWindowDestroyNativeWindowNullptr: () => number;
export const testNativeWindowGetSurfaceIdNullptr: () => number;
export const testNativeWindowCreateNativeWindowFromSurfaceIdNullptr: () => number;
export const testNativeWindowCreateNativeWindowFromSurfaceIdNormal: () => number;
export const testNativeWindowCreateNativeWindowFromSurfaceIdSurfaceId: () => number;
export const testNativeWindowCreateNativeWindowBufferFromNativeBufferNullptr: () => number;
export const testNativeWindowCreateNativeWindowBufferFromSurfaceBufferNullptr: () => number;
export const testNativeWindowDestroyNativeWindowBufferNullptr: () => number;
export const testNativeWindowGetBufferHandleFromNativeNullptr: () => number;
export const testNativeWindowCreateNativeWindowBufferFromNativeBufferNormal: () => number;
export const testNativeWindowCreateNativeWindowBufferFromNativeBufferMuch: () => number;
export const testNativeWindowNativeWindowRequestBufferNullptr: () => number;
export const testNativeWindowNativeWindowAbortBufferNullptr: () => number;
export const testNativeWindowNativeWindowRequestAbortBufferNormal: () => number;
export const testNativeWindowNativeWindowRequestAbortBufferAbnormal: () => number;
export const testNativeWindowNativeWindowRequestBufferFenceFdNormal: () => number;
export const testNativeWindowNativeWindowRequestBufferFenceFdAbnormal: () => number;
export const testNativeWindowNativeWindowRequestAbortBufferMax: () => number;
export const testNativeWindowNativeWindowRequestAbortBufferErrorCode: () => number;
export const testNativeWindowWriteToParcelErrptr: () => number;
export const testNativeWindowReadFromParcelErrptr: () => number;
export const testNativeWindowWRParcelNormal: () => number;
export const testNativeWindowWriteToParcelAbNormal: () => number;
export const testNativeWindowReadFromParcelAbNormal: () => number;
export const testNativeWindowWRParcelDifferent: () => number;
export const testNativeWindowNativeWindowFlushBufferNullptr: () => number;
export const testNativeWindowNativeWindowFlushBufferNormal: () => number;
export const testNativeWindowNativeWindowFlushBufferAbnormal: () => number;
export const testNativeWindowNativeWindowFlushBufferErrorCode: () => number;
export const testNativeWindowGetLastFlushedBufferV2Nullptr: () => number;
export const testNativeWindowGetLastFlushedBufferNullptr: () => number;
export const testNativeWindowGetLastFlushedBufferV2Normal: () => number;
export const testNativeWindowGetLastFlushedBufferNormal: () => number;
export const testNativeWindowSetBufferHold: () => number;
export const testNativeWindowGetNativeObjectMagicNullptr: () => number;
export const testNativeWindowGetNativeObjectMagicNormal: () => number;
export const testNativeWindowNativeObjectReferenceNullptr: () => number;
export const testNativeWindowNativeObjectReferenceNormal: () => number;
export const testNativeWindowNativeObjectUnreferenceNullptr: () => number;
export const testNativeWindowNativeObjectUnreferenceNormal: () => number;
export const testNativeWindowNativeWindowAttachBufferNullptr: () => number;
export const testNativeWindowNativeWindowDetachBufferNullptr: () => number;
export const testNativeWindowNativeWindowDetachBufferNormal: () => number;
export const testNativeWindowNativeWindowAttachBufferErrorCode: () => number;
export const testNativeWindowNativeWindowAttachBufferNormal: () => number;
export const testNativeWindowNativeWindowDetachBufferErrorCode: () => number;
export const testNativeWindowNativeWindowAtDetachDifferentBufferNormal: () => number;
export const testNativeWindowNativeWindowAtDetachDifferentBufferAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptNullptr: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetBufferGeometryNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetBufferGeometryAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetFormatNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetFormatAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetUsageNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetUsageAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetStrideNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetStrideAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetSwapIntervalNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetSwapIntervalAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetColorGamutNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetColorGamutAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetTransformNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetTransformAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetUiTimeStampNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetUiTimeStampAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptGetBufferQueueSize: () => number;
export const testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetHdrWhitePointBrightnessAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetSdrWhitePointBrightnessAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetSourceTypeNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetSourceTypeAbnormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetGetAppFrameworkTypeAbnormal: () => number;
export const testNativeWindowNativeWindowSetSetScalingModeV2Nullptr: () => number;
export const testNativeWindowNativeWindowSetScalingModeV2ScalingMode: () => number;
export const testNativeWindowGetColorSpaceFirst: () => number;
export const testNativeWindowSetColorSpaceNormal: () => number;
export const testNativeWindowSetColorSpaceNullptr: () => number;
export const testNativeWindowGetColorSpaceNullptr: () => number;
export const testNativeWindowSetColorSpaceAbnormal: () => number;
export const testNativeWindowGetMetadataValueFirst: () => number;
export const testNativeWindowSetDynamicMetadataValue: () => number;
export const testNativeWindowSetMetadataValueTimes: () => number;
export const testNativeWindowSetStaticMetadataValue: () => number;
export const testNativeWindowSetMetadataValue: () => number;
export const testNativeWindowSetNullMetadataValue: () => number;
export const testNativeWindowSetMetadataValueNullptr: () => number;
export const testNativeWindowGetMetadataValueAbnormal: () => number;
export const testNativeWindowGetMetadataValueNullptr: () => number;
export const testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampNormal: () => number;
export const testNativeWindowNativeWindowHandleOptSetDesiredPresentTimeStampAbNormal: () => number;
export const testNativeWindowSetMetadataValue_metadata_type: () => number;
export const testNativeWindowCreateNativeWindow: () => number;
export const testNativeWindowNativeWindowSetSetScalingMode: () => number;
export const testNativeWindowNativeWindowSetMetaData: () => number;
export const testNativeWindowNativeWindowSetMetaDataSet: () => number;
export const testNativeWindowNativeWindowSetTunnelHandle: () => number;