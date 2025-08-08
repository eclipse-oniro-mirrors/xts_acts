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

export const testRequestImageForPath: (a:string, b:ESObject, c:string, callback:(err:ESObject, state:ESObject, requestId?:ESObject)=> ESObject) => ESObject;

export const testRequestVideoForPath: (a:string, b:ESObject, c:string, callback:(err:ESObject, state:ESObject, requestId?:ESObject)=> ESObject
) => ESObject;

export const testCancelRequest: (a: ESObject) => ESObject;

export const testMediaAssetGetUri: (a: number) => ESObject;

export const testMediaAssetGetDisplayName: (a: number) => ESObject;

export const testMediaAssetGetSize: (a: number) => ESObject;

export const testMediaAssetGetDateModifiedMs: (a: number) => ESObject;

export const testMediaAssetGetWidth: (a: number) => ESObject;

export const testMediaAssetGetHeight: (a: number) => ESObject;

export const testMediaAssetGetOrientation: (a: number) => ESObject;

export const testMediaAssetRelease: (a: number) => ESObject;

export const testChangeRequestAddResourceWithBuffer: (a: number) => ESObject;

export const testChangeRequestSaveCameraPhoto: (a: number) => ESObject;

export const testChangeRequestSaveCameraVideo: (a: number) => ESObject;

export const testChangeRequestDiscardCameraPhoto: (a: number) => ESObject;

export const testChangeRequestRelease: (a: number) => ESObject;

export const testManagerRequestImage: (a: number) => ESObject;

export const testMediaAccessHelperApplyChanges: (a: number) => ESObject;

export const testMediaAssetGetMediaType: (a: number) => ESObject;

export const testMediaAssetGetMediaSubType: (a: number) => ESObject;

export const testMediaAssetGetDateAdded: (a: number) => ESObject;

export const testMediaAssetGetDateModified: (a: number) => ESObject;

export const testMediaAssetGetDateTaken: (a: number) => ESObject;

export const testMediaAssetGetDateAddedMs: (a: number) => ESObject;

export const testMediaAssetGetDuration: (a: number) => ESObject;

export const testMediaAssetIsFavorite: (a: number) => ESObject;

export const testMediaAssetGetTitle: (a: number) => ESObject;

export const testChangeRequestAddResourceWithUri: (a: number) => ESObject;

export const testChangeRequestGetWriteCacheHandler: (a: number) => ESObject;

export const testManagerRequestMovingPhoto: (a: number) => ESObject;

export const testMovingPhotoRequestContentWithUris: (a: number) => ESObject;

export const testMovingPhotoRequestContentWithUri: (a: number) => ESObject;

export const testMovingPhotoRequestContentWithBuffer: (a: number) => ESObject;

export const testManagerRelease: (a: number) => ESObject;

export const testMovingPhotoGetUri: (a: number) => ESObject;

export const testMovingPhotoRelease: (a: number) => ESObject;








