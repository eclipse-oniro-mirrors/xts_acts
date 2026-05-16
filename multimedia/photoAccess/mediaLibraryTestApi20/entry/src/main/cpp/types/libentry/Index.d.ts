/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

//multimedia/media_library/media_asset_change_request_capi.h
export const testOhMediaAssetChangeRequestAddResourceWithUriParameterError: () => number;
export const testOhMediaAssetChangeRequestAddResourceWithBufferParameterError: () => number;
export const testOhMediaAssetChangeRequestGetWriteCacheHandlerParameterError: () => number;
export const testOhMediaAssetChangeRequestSaveCameraPhotoParameterError: () => number;
export const testOhMediaAssetChangeRequestDiscardCameraPhotoParameterError: () => number;
//multimedia/media_library/media_asset_capi.h
export const testOhMediaAsset: (id: string) => void;
export const testOhMediaVideoAsset: (id: string) => void;
export const testOhMediaAssetGetUriOk: () => number;
export const testOhMediaAssetGetMediaTypeOk: () => number;
export const testOhMediaAssetGetMediaSubTypeOk: () => number;
export const testOhMediaAssetGetDisplayNameOk: () => number;
export const testOhMediaAssetGetSizeOk: () => number;
export const testOhMediaAssetGetDateAddedOk: () => number;
export const testOhMediaAssetGetDateModifiedOk: () => number;
export const testOhMediaAssetGetDateTakenOk: () => number;
export const testOhMediaAssetGetDateAddedMsOk: () => number;
export const testOhMediaAssetGetDateModifiedMsOk: () => number;
export const testOhMediaAssetGetDurationOk: () => number;
export const testOhMediaAssetGetWidthOk: () => number;
export const testOhMediaAssetGetHeightOk: () => number;
export const testOhMediaAssetGetOrientationOk: () => number;
export const testOhMediaAssetIsFavoriteOk: () => number;
export const testOhMediaAssetGetTitleOk: () => number;
export const testOhMediaAssetReleaseOk: () => number;
export const testOhMediaLibraryImageOk: () => number;
export const testOhMediaLibraryDefaultOk: () => number;
export const testOhMediaAssetChangeRequestAddResourceWithUriNotSuchFile: () => number;
export const testOhMediaAssetChangeRequestGetWriteCacheHandlerNoAuthority: () => number;
export const testOhMediaAssetChangeRequestReleaseOk: () => number;
export const testOhMediaAssetManagerRequestMovingPhotoOk: () => number;
export const testOhMediaAssetManagerRequestImageOk: () => number;
export const testOhMovingPhotoGetUriOk: () => number;
export const testOhMovingPhotoRequestContentWithUrisOk: () => number;
export const testOhMovingPhotoRequestContentWithUriOk: () => number;
export const testOhMovingPhotoRequestContentWithBufferOk: () => number;
export const testOhMovingPhotoReleaseOk: () => number;
export const testOhMediaAssetChangeRequestAddResourceWithBufferNotSupported: () => number;
export const testOhMediaAssetChangeRequestAddResourceWithUriNotSupported: () => number;
export const testMediaLibraryQualityFast: () => number;
export const testMediaLibraryQualityFull: () => number;
export const testMediaLibraryCompressed: () => number;
export const testMediaLibraryPictureObject: () => number;
export const testMediaLibraryMovingPhoto: () => number;
export const testMediaLibraryRust: () => number;
export const testOhMediaAccessHelperApplyChangesOk: () => number;
export const testMediaLibraryHighQualityMode: () => number;
export const testMediaLibraryBalancedMode: () => number;