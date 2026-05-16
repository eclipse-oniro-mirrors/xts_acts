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
export const oHNativeImageCreate: () => number;
export const oHNativeImageAcquireNativeWindow: () => number;
export const oHNativeImageAcquireNativeWindowAbnormal: () => number;
export const oHNativeImageAttachContext: () => number;
export const oHNativeImageAttachContextAbnormal: () => number;
export const oHNativeImageDetachContext: () => number;
export const oHNativeImageDetachContextAbnormal: () => number;
export const oHNativeImageUpdateSurfaceImage: () => number;
export const oHNativeImageUpdateSurfaceImageBoundary: () => number;
export const oHNativeImageUpdateSurfaceImageAbnormal: () => number;
export const oHNativeImageGetTimestamp: () => number;
export const oHNativeImageGetTransformMatrix: () => number;
export const oHNativeImageGetTransformMatrixAbnormal: () => number;
export const oHNativeImageDestroy: () => number;
export const oHNativeImageCreateNormal: () => number;
export const oHNativeImageCreateAbnormal: () => number;
export const oHNativeImageDestroy1: () => number;
export const oHNativeImageCreateMuch: () => number;
export const oHNativeImageAcquireNativeWindowNullptr: () => number;
export const oHNativeImageAcquireNativeWindowNormal: () => number;
export const oHNativeImageAttachContextNullptr: () => Array<number>;
export const oHNativeImageDetachContextNullptr: () => number;
export const oHNativeImageAttachContextNormal: () => Array<number>;
export const oHNativeImageDetachContextNormal: () => Array<number>;
export const oHNativeImageGetSurfaceIdNullptr: () => Array<number>;
export const oHNativeGetSurfaceIdNormal: () => number;
export const oHNativeImageUpdateSurfaceImageNullptr: () => number;
export const oHNativeImageGetTimestampNullptr: () => number;
export const oHNativeImageGetTransformMatrixNullptr: () => Array<number>;
export const oHNativeImageGetTransformMatrixV2Nullptr: () => Array<number>;
export const oHNativeImageUpdateSurfaceImageNormal: () => number;
export const oHNativeImageGetTimestampNormal: () => Array<number>;
export const oHNativeImageGetTransformMatrixNormal: () => Array<number>;
export const oHNativeImageGetTransformMatrixV2Normal: () => Array<number>;
export const oHNativeImageSetOnFrameAvailableListenerNullptr: () => number;
export const oHNativeImageUnSetOnFrameAvailableListenerNullptr: () => number;
export const oHNativeImageSetOnFrameAvailableListenerNormal: () => Array<number>;
export const oHNativeImageUnsetOnFrameAvailableListenerNormal: () => Array<number>;
export const oHNativeImageGetBufferMatrixNormal: () => number;
export const oHNativeImageGetBufferMatrixNormal01: () => Array<number>;
export const oHNativeImageGetBufferMatrixAbNormal: () => Array<number>;
export const oHNativeImageGetBufferMatrixCall: () => number;
export const oHNativeImageAcquireNativeWindowBufferNormal: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferCall: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferAbNormal01: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferAbNormal02: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferAbNormal03: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferAbNormal04: () => Array<number>;
export const oHNativeImageAcquireNativeWindowBufferAbNormal05: () => Array<number>;
export const oHNativeImageReleaseNativeWindowBufferAbnormal: () => number;
export const oHConsumerSurfaceSetDefaultUsageNormal: () => Array<number>;
export const oHConsumerSurfaceSetDefaultUsageCall: () => Array<number>;
export const oHConsumerSurfaceSetDefaultUsageAbNormal: () => Array<number>;
export const oHConsumerSurfaceSetDefaultSizeNormal: () => Array<number>;
export const oHConsumerSurfaceSetDefaultSizeCall: () => Array<number>;
export const oHConsumerSurfaceSetDefaultSizeAbNormal: () => Array<number>;
export const oHConsumerSurfaceSetDefaultSizeAbNormal01: () => Array<number>;
export const oHConsumerSurfaceCreateAbNormal: () => number;
export const OHConsumerSurfaceSetDefaultUsageSizeNormal: () => number;
export const oHNativeWindowDropBufferModeSetTrueNormal: () => number;
export const oHNativeWindowDropBufferModeSetAbNormal: () => number;
export const oHNativeWindowDropBufferModeSetTrueNormal2: () => number;
export const oHNativeImageReleaseNativeWindowBufferNormal: () => number;
export const oHNativeImageReleaseNativeWindowBufferAbnormal01: () => number;
export const oHNativeImageCreateWithSingleBufferModeUsingTextImageNormal: () => number;
export const oHNativeImageCreateWithSingleBufferModeUsingTextImageNull: () => number;
export const oHNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal: () => Array<number>;
export const oHNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls: () => number;
export const oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal: () => Array<number>;
export const oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal: () => Array<number>;
export const oHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls: () => number;
export const oHNativeImageReleaseTextImageNormal: () => number;
export const oHNativeImageReleaseTextImageNull: () => number;
export const oHNativeImageReleaseTextImageMultipleCalls: () => number;
export const oHNativeImageReleaseTextImageDestroyImage: () => number;
export const oHNativeImageGetColorSpaceNormal: () => number;
export const oHNativeImageGetColorSpaceNull: () => number;
export const oHNativeImageGetColorSpaceMultipleCalls: () => number;
export const oHNativeImageGetColorSpaceDestoryImage: () => number;
export const oHNativeImageCreateWithSingleBufferModeTest1: () => number;
export const oHNativeImageCreateWithSingleBufferModeTest2: () => number;
export const oHNativeImageCreateWithSingleBufferModeTest3: () => number;
export const oHConsumerSurfaceCreateWithSingleBufferModeTest: () => number;
export const oHNativeImageAcquireLatestNativeWindowBufferAbNormal: () => number;
export const oHNativeImageAcquireLatestNativeWindowBufferAbNormal01: () => number;
export const oHNativeImageAcquireLatestNativeWindowBufferAbNormal02: () => number;
export const oHNativeImageAcquireLatestNativeWindowBufferAbNormal03: () => number;
export const oHNativeImageAcquireLatestNativeWindowBufferCall: () => number;
export const oHNativeImageCreateWithSingleBufferModeChangeTextureTarget: () => number;
export const oHNativeImageIsReleasedNull: () => number;
export const oHNativeImageIsReleasedNull1: () => number;
export const oHNativeImageIsReleasedNormal0: () => number;
export const oHNativeImageIsReleasedNormal1: () => number;
export const oHNativeImageReleasedNull: () => number;
export const oHNativeImageReleasedNormal: () => number;
export const oHNativeImageReleasedNormal1: () => Array<number>;
export const oHNativeImageIsReleasedCalls: () => number;
export const oHNativeImageReleasedCalls: () => number;
export const oHNativeImageReleaseAbnormal: () => number;
export const oHNativeErrorCodeCover: () => number;