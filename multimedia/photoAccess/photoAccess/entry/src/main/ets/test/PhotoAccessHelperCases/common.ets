/**
 * Copyright (c) 2023 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { expect } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import buffer from '@ohos.buffer';
import { BusinessError } from '@ohos.base';

const photoKeys = photoAccessHelper.PhotoKeys;
let columns = [
  photoKeys.URI,
  photoKeys.PHOTO_TYPE,
  photoKeys.DISPLAY_NAME,
  photoKeys.DATE_ADDED,
  photoKeys.DATE_MODIFIED,
  photoKeys.DURATION,
  photoKeys.WIDTH,
  photoKeys.HEIGHT,
  photoKeys.DATE_TAKEN,
  photoKeys.ORIENTATION,
  photoKeys.FAVORITE,
  photoKeys.SIZE,
  photoKeys.TITLE,
  photoKeys.POSITION,
  photoKeys.DATE_TRASHED,
  photoKeys.HIDDEN,
  photoKeys.CAMERA_SHOT_KEY,
  photoKeys.USER_COMMENT,
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
let sizes = [
  { width: -1, height: -1 },
  { width: 0, height: 0 },
  { width: 100, height: 0 },
  { width: 0, height: 100 },
  { width: 720, height: 720 },
  { width: 1000, height: 1000 }
]
const fetchOptions_allocate_file = initFetchOptions()

export function checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1){
  if(uriSet){
    phAccessHelper.registerChange(photoAsset.uri, forChildUris, onCallback1);
    if(callBackSet){
      phAccessHelper.unRegisterChange(photoAsset.uri, onCallback1);
    }else {
      phAccessHelper.unRegisterChange(photoAsset.uri);
    }
  }else{
    phAccessHelper.registerChange(DEFAULT_PHOTO_URI, true, onCallback1);
    if(callBackSet){
      phAccessHelper.unRegisterChange(photoAsset.uri, onCallback1);
    }else {
      phAccessHelper.unRegisterChange(photoAsset.uri);
    }
  }
}

export function checkUri(uri,photoType, extension) {
  if(photoType==photoAccessHelper.PhotoType.IMAGE){
    expect(uri).assertContain("IMG")
  }else {
    expect(uri).assertContain("VID")
  }
  expect(uri).assertContain(extension)
}

export function checkReadAndWrite(fd){
  let arrayBuffer = new ArrayBuffer(4096);
  fs.read(fd, arrayBuffer).then((readLen: number) => {
    console.info("read file data succeed");
    let buf = buffer.from(arrayBuffer, 0, readLen);
    console.info(`The content of file: ${buf.toString()}`);
  }).catch((err: BusinessError) => {
    console.info("read file data failed with error message: " + err.message + ", error code: " + err.code);
    expect(false).assertTrue();
  })
  let str: string = "hello, world";
  fs.write(fd, str).then((writeLen: number) => {
    console.info("write data to file succeed and size is:" + writeLen);
    expect(false).assertTrue();
  }).catch((err: BusinessError) => {
    console.info("write data to file failed with error message: " + err.message + ", error code: " + err.code);
  })
}

export function getPhotoAssetAttrs(photoAsset){
  let photoAssetUri: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.URI.toString());
  expect(photoAssetUri).not().assertUndefined()
  console.info('photoAsset.uri : ' + photoAssetUri);
  let photoAssetType: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.PHOTO_TYPE.toString());
  expect(photoAssetType).not().assertUndefined()
  console.info('photoAsset.photoType : ' + photoAssetType);
  let photoAssetName: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.DISPLAY_NAME.toString());
  expect(photoAssetName).not().assertUndefined()
  console.info('photoAsset.displayName : ' + photoAssetName);
}

export function initFetchOptions(){
  let predicates_getThumbnail: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOptions_allocate_file: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates_getThumbnail
  };
  predicates_getThumbnail.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, "addCb01.jpg")
  return fetchOptions_allocate_file
}

export {
  columns,
  photoExtensions,
  videoExtensions,
  sizes,
  fetchOptions_allocate_file
};