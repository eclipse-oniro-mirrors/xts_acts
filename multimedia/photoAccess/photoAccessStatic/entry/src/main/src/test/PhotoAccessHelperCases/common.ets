/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { expect } from '../../../../hypium/index';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError, Callback } from '@ohos.base';
import image from '@ohos.multimedia.image';

interface size {
  width: number,
  height: number
}

let columns: photoAccessHelper.PhotoKeys[] = [
  photoAccessHelper.PhotoKeys.URI,
  photoAccessHelper.PhotoKeys.PHOTO_TYPE,
  photoAccessHelper.PhotoKeys.DISPLAY_NAME,
  photoAccessHelper.PhotoKeys.DATE_ADDED,
  photoAccessHelper.PhotoKeys.DATE_MODIFIED,
  photoAccessHelper.PhotoKeys.DURATION,
  photoAccessHelper.PhotoKeys.WIDTH,
  photoAccessHelper.PhotoKeys.HEIGHT,
  photoAccessHelper.PhotoKeys.DATE_TAKEN,
  photoAccessHelper.PhotoKeys.ORIENTATION,
  photoAccessHelper.PhotoKeys.FAVORITE,
  photoAccessHelper.PhotoKeys.SIZE,
  photoAccessHelper.PhotoKeys.TITLE,
  photoAccessHelper.PhotoKeys.POSITION,
]
const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
const photoExtensions = [
  "jpg",
  "jpeg",
  "png",
  "svg",
  "bmp",
  "gif"
]
const videoExtensions = [
  "mp4",
  "ts",
  "webm",
  "mkv"
]
let sizes: image.Size[] = [
  { width: -1, height: -1 },
  { width: 0, height: 0 },
  { width: 100, height: 0 },
  { width: 0, height: 100 },
  { width: 720, height: 720 },
  { width: 1000, height: 1000 }
]
const fetchOptions_allocate_file = initFetchOptions()

export function checkSet(callBackSet: boolean, uriSet: boolean, phAccessHelper: photoAccessHelper.PhotoAccessHelper | null,
  forChildUris: boolean, photoAsset: photoAccessHelper.PhotoAsset,
  onCallback1: Callback<photoAccessHelper.ChangeData>) {
  if (uriSet) {
    (phAccessHelper as photoAccessHelper.PhotoAccessHelper).registerChange(photoAsset.uri, forChildUris, onCallback1);
    if (callBackSet) {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(photoAsset.uri, onCallback1);
    } else {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(photoAsset.uri);
    }
  } else {
    (phAccessHelper as photoAccessHelper.PhotoAccessHelper).registerChange(DEFAULT_PHOTO_URI, true, onCallback1);
    if (callBackSet) {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(photoAsset.uri, onCallback1);
    } else {
      (phAccessHelper as photoAccessHelper.PhotoAccessHelper).unRegisterChange(photoAsset.uri);
    }
  }
}

export function checkUri(uri: photoAccessHelper.PhotoAsset | string, photoType: photoAccessHelper.PhotoType,
  extension: string) {
  if (photoType == photoAccessHelper.PhotoType.IMAGE) {
    expect(uri).assertContain("IMG")
  } else {
    expect(uri).assertContain("VID")
  }
  expect(uri).assertContain(extension)
}

export async function checkReadAndWrite(fd: int) {
  let arrayBuffer: ArrayBuffer = new ArrayBuffer(4096);
  fs.read(fd, arrayBuffer).then((readLen: long) => {
    console.info("read file data succeed");
  }).catch((err: Error) => {
    console.info("read file data failed with error message: " + err.message + ", error code: " + err.name);
    expect(false).assertTrue();
  })
  let str: string = "hello, world";
  fs.write(fd, str).then((writeLen: long) => {
    console.info("write data to file succeed and size is:" + writeLen);
    expect(false).assertTrue();
  }).catch((err: Error) => {
    console.info("write data to file failed with error message: " + err.message + ", error code: " + err.name);
  })
}

export function getPhotoAssetAttrs(photoAsset: photoAccessHelper.PhotoAsset) {
  let photoAssetUri: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.URI.toString());
  expect(photoAssetUri).not().assertUndefined()
  console.info('photoAsset.uri : ' + photoAssetUri);
  let photoAssetType: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.PHOTO_TYPE.toString());
  expect(photoAssetType).not().assertUndefined()
  console.info('photoAsset.photoType : ' + photoAssetType);
  let photoAssetName: photoAccessHelper.MemberType =
    photoAsset.get(photoAccessHelper.PhotoKeys.DISPLAY_NAME.toString());
  expect(photoAssetName).not().assertUndefined()
  console.info('photoAsset.displayName : ' + photoAssetName);
}

export function initFetchOptions() {
  let predicates_getThumbnail: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOptions_allocate_file: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates_getThumbnail
  };
  console.info('initFetchOptions photoAsset.displayName : ' + "addCb01.jpg");
  predicates_getThumbnail.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, "addCb01.jpg")
  return fetchOptions_allocate_file
}

export {
  columns, photoExtensions, videoExtensions, sizes, fetchOptions_allocate_file
};