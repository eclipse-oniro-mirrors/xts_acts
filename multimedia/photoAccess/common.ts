/*
 * Copyright (C) 2023-2024 Huawei Device Co., Ltd.
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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import fs, { ListFileOptions } from '@ohos.file.fs';
import fileuri from "@ohos.file.fileuri";

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
const photoType = photoAccessHelper.PhotoType;
const photoKeys = photoAccessHelper.PhotoKeys;
const albumKeys = photoAccessHelper.AlbumKeys;
const albumType = photoAccessHelper.AlbumType;
const albumSubtype = photoAccessHelper.AlbumSubtype;
const DEFAULT_SLEEP_TIME = 10;

const context = globalThis.abilityContext;
const pathDir = context.filesDir;

let validImageExt = ['.jpg']
let validVideoExt = ['.mp4']
let validVideoMpegExt = ['.mpeg']
let validImageGifExt = ['.gif']
let validImagePngExt = ['.png']

export async function sleep(times = DEFAULT_SLEEP_TIME) : Promise<void> {
  await new Promise(res => setTimeout(res, times));
};

export function fetchAllOption() : photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  const ops : photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  return ops;
};

export function fetchOption(testNum, key, value) : photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops : photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
};

export function albumFetchOption(testNum, key, value) : photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops : photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
};

export function photoFetchOption(testNum, key, value) : photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops : photoAccessHelper.FetchOptions = {
    fetchColumns: [
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
      photoKeys.DATE_ADDED_MS,
      photoKeys.DATE_MODIFIED_MS,
      photoKeys.DYNAMIC_RANGE_TYPE,
      photoKeys.COVER_POSITION,
      photoKeys.BURST_KEY,
      photoKeys.LCD_SIZE,
      photoKeys.THM_SIZE,
      photoKeys.DETAIL_TIME,
      photoKeys.DATE_TAKEN_MS,
      'all_exif',
    ],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
};

export async function getPermission(name = 'ohos.acts.multimedia.photoaccess') : Promise<void> {
  try {
    console.info('getPermission start', name);
    let permissionState = new Map();
    const permissions: Array<Permissions> = [
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.READ_IMAGEVIDEO',
      'ohos.permission.WRITE_IMAGEVIDEO',
    ];

    const atManager = abilityAccessCtrl.createAtManager();
    const appFlags = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    const userId = 100;
    const appInfo = await bundleManager.getApplicationInfo(name, appFlags, userId);
    const tokenID = appInfo.accessTokenId;
    for (const permission of permissions) {
      console.info('getPermission permission: ' + permission);
      try {
        await atManager.grantUserGrantedPermission(tokenID, permission, 1);
      } catch (error) {
        console.error(`getPermission ${permission} failed`);
      }
      permissionState.set(permission, await atManager.verifyAccessToken(tokenID, permission));
    }
    permissionState.forEach((value, key, map) => {
      if (value !== 0) {
        console.info(`getPermission failed; permission: ${key}, state: ${value}`);
      }
    });
    console.info('getPermission end');
  } catch (error) {
    console.error(`getPermission failed, error: ${error}`);
  }
};

export function isNum(value) : boolean {
  return typeof value === 'number' && !isNaN(value);
};

export function getAssetId(uri) : string {
  const tag = 'Photo/';
  const index = uri.indexOf(tag);
  let str = uri.substring(index + tag.length);
  console.info(`getAssetId str: ${str}`);
  return str;
}

export function getAlbumId(uri) : string {
  const index = uri.lastIndexOf('/');
  let str = uri.substring(index + 1);
  console.info(`getAlbumId str: ${str}`);
  return str;
}

export function genRadomStr(len: number) : string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let randomStr = '';
  for (let i = 0; i < len; i++) {
    randomStr += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return randomStr;
}

export async function createUserAlbum(testNum, albumName) : Promise<photoAccessHelper.Album> {
  console.info(`${testNum} createUserAlbum albumName: ${albumName}`);
  let album: photoAccessHelper.Album;
  try {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
    album = await helper.createAlbum(albumName);
    console.info(`${testNum} createUserAlbum suc`);
  } catch (error) {
    console.error(`Failed to createUserAlbum! error: ${error}`);
    throw error;
  }

  return new Promise((resolve, reject) => {
    resolve(album);
  });
}

export async function getFileAsset(testNum, fetchOps) : Promise<photoAccessHelper.PhotoAsset> {
  let asset: photoAccessHelper.PhotoAsset;
  try {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
    fetchResult = await helper.getAssets(fetchOps);
    console.info(`${testNum} getFileAsset fetchResult: ${fetchResult.getCount()}`);
    asset = await fetchResult.getFirstObject();
    fetchResult.close();
  } catch (error) {
    console.error(`${testNum} getFileAsset error: ${error}`);
    throw error;
  }

  return new Promise((resolve, reject) => {
    resolve(asset);
  });
}

export function getFileAssetFetchResult() : photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> {
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
  return fetchResult;
}

export function getAlbumFetchResult() : photoAccessHelper.FetchResult<photoAccessHelper.Album> {
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
  return fetchResult;
}

export function checkUserAlbum(expect, testNum, album, expectedName, expectedCover) : void {
  console.info(`${testNum} checkUserAlbum album.albumName: ${album.albumName}, expectedName: ${expectedName}`);
  expect(album.albumType).assertEqual(albumType.USER);
  expect(album.albumSubtype).assertEqual(albumSubtype.USER_GENERIC);
  expect(album.albumName).assertEqual(expectedName);
  if (expectedCover === '') {
    expect(album.coverUri).assertEqual('');
  } else {
    expect(album.coverUri).assertEqual(expectedCover);
  }
  expect(album.albumUri !== '').assertEqual(true);
  expect(album.count).assertEqual(0);
}

export function checkSystemAlbum(expect, testNum, album, expectedSubType) : void {
  try {
    console.info(`${testNum} checkSystemAlbum expectedSubType: ${expectedSubType}`);
    expect(album.albumType).assertEqual(albumType.SYSTEM);
    expect(album.albumSubtype).assertEqual(expectedSubType);
    expect(album.albumName).assertEqual('');
    expect(album.albumUri !== '').assertEqual(true);
  } catch (error) {
    console.error(`Failed to delete all user albums! error: ${error}`);
    throw error;
  }
}

export async function startAbility(bundleName: string, abilityName: string) : Promise<void> {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`[picker] start abilityFinished: ${result}`);
  }).catch(err => {
    console.error(`[picker] start abilityFailed: ${err}`);
  });
}

export async function stopAbility(bundleName: string) : Promise<void> {
  await delegator.executeShellCommand(`aa force-stop ${bundleName}`).then(result => {
    console.info(`[picker] stop abilityFinished: ${result}`);
  }).catch(err => {
    console.error(`[picker] stop abilityFailed: ${err}`);
  });
}

export async function getFileNameArray() {
  try{
    let listFileOption: ListFileOptions = {
      recursion: true,
      listNum: 0,
      filter: {
        suffix: [],
      }
    }
    listFileOption.filter.suffix = validImageExt.concat(validVideoExt);
    let nameArray = await fs.listFile(pathDir, listFileOption)
    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
  }
}

export async function getAllFileNameArray() {
  try{
    let listFileOption: ListFileOptions = {
      recursion: true,
      listNum: 0,
      filter: {
        suffix: [],
      }
    }
    listFileOption.filter.suffix = validImageExt.concat(validVideoExt).concat(validVideoMpegExt).concat(validImageGifExt).concat(validImagePngExt);
    let nameArray = await fs.listFile(pathDir, listFileOption)
    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
  }
}

export async function pushCreateAsset(names: Array<string>){
  console.info('pushCreateAsset start')
  let successNum = 0;
  try{
    console.info('pushCreateAsset name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: string[] = await getFileNameArray();
    console.info('pushCreateAsset rawFiles number: ' + fileNames.length);
    for(let i = 0; i < fileNames.length; i++) {
      let fileName = fileNames[i];
      let filePath = pathDir + '/' + fileName;
      let fileUri = fileuri.getUriFromPath(filePath);
      let rawExtension: string = fileName.split('.')[1];
      for (let j = 0; j < names.length; j++) {
        let name = names[j];
        if (fileName.includes('error')) continue
        let extension: string = name.split('.')[1];
        if (rawExtension === extension) {
          let options: photoAccessHelper.CreateOptions = {
            title: name.split('.')[0]
          }
          if (validImageExt.includes(('.' + extension))) {
            photoType = photoAccessHelper.PhotoType.IMAGE;
            resourceType = photoAccessHelper.ResourceType.IMAGE_RESOURCE;
          } else {
            photoType = photoAccessHelper.PhotoType.VIDEO;
            resourceType = photoAccessHelper.ResourceType.VIDEO_RESOURCE;
          }
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(globalThis.abilityContext, photoType, extension, options);
          assetChangeRequest.addResource(resourceType, fileUri);
          await phAccessHelper.applyChanges(assetChangeRequest);
          console.info(`pushCreateAsset ${name} create success`)
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  }catch(err){
    console.error('Push_createAsset push resource failed: ' + err)
    return;
  }
}

export async function pushCreateAssetSingle(names: Array<string>){
  console.info('pushCreateAssetSingle start')
  let successNum = 0;
  try{
    console.info('pushCreateAssetSingle name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: string[] = await getAllFileNameArray();
    for (let i = 0; i < fileNames.length; i++) {
      let fileName = fileNames[i];
      let filePath = pathDir + '/' + fileName;
      let fileUri = fileuri.getUriFromPath(filePath);
      let rawExtension: string = fileName.split('.')[1];
      for (let j = 0; j < names.length; j++) {
        let name = names[j];
        if(fileName == '/01.jpg' || fileName == '/01.mp4') continue
        let extension: string = name.split('.')[1];
        if (rawExtension === extension) {
          let options: photoAccessHelper.CreateOptions = {
            title: name.split('.')[0]
          }
          if (validImageExt.concat(validImageGifExt).concat(validImagePngExt).includes(('.' + extension))) {
            photoType = photoAccessHelper.PhotoType.IMAGE;
            resourceType = photoAccessHelper.ResourceType.IMAGE_RESOURCE;
          } else {
            photoType = photoAccessHelper.PhotoType.VIDEO;
            resourceType = photoAccessHelper.ResourceType.VIDEO_RESOURCE;
          }
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(globalThis.abilityContext, photoType, extension, options);
          assetChangeRequest.addResource(resourceType, fileUri);
          await phAccessHelper.applyChanges(assetChangeRequest);
          console.info(`pushCreateAssetSingle ${name} create success`)
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  }catch(err){
    console.error('Push_createAsset push resource failed: ' + err)
    return;
  }
}

export function createSandboxFileUri(extension) {
  let pathDir = globalThis.abilityContext.filesDir;
  let path = pathDir + '/test' + new Date().getTime() + '.' + extension;
  fs.openSync(path, fs.OpenMode.CREATE)
  return fileuri.getUriFromPath(path);
}

export async function getBurstKey(testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<string | number> {
  let burstKey: string | number | undefined = -1;
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      console.error(`${testNum} :: getBurstKey :: fetchResult is undefined !`);
      return burstKey;
    }
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    if (photoAsset === undefined) {
      console.error(`${testNum} :: getBurstKey :: photoAsset is undefined !`);
      return burstKey;
    }
    burstKey = photoAsset.get(photoKeys.BURST_KEY).toString();
    console.log(`${testNum} :: get burstKey success, burstKey is ${burstKey}`);
    return burstKey;
  } catch (error) {
    console.error(`${testNum} :: getBurstKey failed, msg is ${error}`);
    return burstKey;
  }
}

export async function createMovingPhoto(testNum: string, context: Context, titleName: string) {
  let photoAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
    let extension: string = 'jpg';
    let options: photoAccessHelper.CreateOptions = {
      title: titleName,
      subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
    }
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
    console.log(`${testNum} :: create assetChangeRequest success`);
    let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/phone/photos/test_mov_1.jpg";
    let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/phone/photos/test_mov_1.mp4";
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
    assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
    console.log(`${testNum} :: add resource success`);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.log(`${testNum} :: applyChange success`);
    photoAsset = assetChangeRequest.getAsset();
  } catch (error) {
    console.error(`${testNum} :: create moving photo failed, error is ${error}`);
  }
  return photoAsset;
}

export {
  photoType,
  photoKeys,
  albumKeys,
  albumType,
  albumSubtype,
};