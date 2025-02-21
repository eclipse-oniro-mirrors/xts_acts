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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
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
    const permissions = [
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
        console.info(`getPermission ${permission} failed`);
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
    console.info(`getPermission failed, error: ${error}`);
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
    console.info(`Failed to createUserAlbum! error: ${error}`);
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
    console.info(`${testNum} getFileAsset error: ${error}`);
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
    console.info(`Failed to delete all user albums! error: ${error}`);
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
    console.info('getFileNameArray failed: ' + err);
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
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  }catch(err){
    console.info('Push_createAsset push resource failed: ' + err)
    return;
  }
}

export {
  photoType,
  photoKeys,
  albumKeys,
  albumType,
  albumSubtype,
};