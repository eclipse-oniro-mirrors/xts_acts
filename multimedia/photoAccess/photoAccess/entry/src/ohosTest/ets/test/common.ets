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
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fs, { ListFileOptions } from '@ohos.file.fs';
import fileuri from "@ohos.file.fileuri";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const photoType = photoAccessHelper.PhotoType;
const photoKeys = photoAccessHelper.PhotoKeys;
const albumKeys = photoAccessHelper.AlbumKeys;
const albumType = photoAccessHelper.AlbumType;
const albumSubtype = photoAccessHelper.AlbumSubtype;
const DEFAULT_SLEEP_TIME = 10;

let validImageExt = ['.jpg']
let validVideoExt = ['.mp4']
let validVideoMpegExt = ['.mpeg']
let validImageGifExt = ['.gif']
let validImagePngExt = ['.png']

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

interface filter {
  suffix: ESObject,
}
interface FileOptions {
  recursion: boolean,
  listNum: number,
  filter: filter
}

export function fetchAllOption(): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  return ops;
}

export function fetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
}

export function albumFetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
}
export function photoFetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
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
      photoKeys.MEDIA_SUFFIX,
      'all_exif',
    ],
    predicates: predicates
  };
  console.info(`${testNum} queryOps: ${key} = ${value}`);
  return ops;
}
export async function driveFn() {
  let dr = Driver.create();
  await sleep(1000);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  await sleep(1000);
  await power?.click();
}

export async function getPermission(name = 'ohos.acts.multimedia.photoaccess'): Promise<void> {
  try {
    console.info('getPermission start', name);

    let atManager = abilityAccessCtrl.createAtManager();
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
    atManager.requestPermissionsFromUser(testContext,  [
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.READ_IMAGEVIDEO',
      'ohos.permission.WRITE_IMAGEVIDEO',
      'ohos.permission.MANAGE_RISK_PHOTOS'
    ], (err: BusinessError, data: PermissionRequestResult) => {
      if (err) {
        console.error(`requestPermissionsFromUser fail, err->${JSON.stringify(err)}`);
      } else {
        console.info('requestPermissionsFromUser data:' + JSON.stringify(data));
        console.info('requestPermissionsFromUser data permissions:' + data.permissions);
        console.info('requestPermissionsFromUser data authResults:' + data.authResults);
        console.info('requestPermissionsFromUser data dialogShownResults:' + data.dialogShownResults);
      }
    });
  } catch (error) {
    console.error(`getPermission failed, error: ${error}`);
  }
};
export function isNum(value: photoAccessHelper.MemberType): boolean {
  return typeof value === 'number' && !isNaN(value);
};

export function getAssetId(uri: ESObject): string {
  const tag = 'Photo/';
  const index: ESObject = uri.indexOf(tag);
  let str: ESObject = uri.substring(index + tag.length);
  console.info(`getAssetId str: ${str}`);
  return str;
}

export function getAlbumId(uri: ESObject): string {
  const index: ESObject = uri.lastIndexOf('/');
  let str: ESObject = uri.substring(index + 1);
  console.info(`getAlbumId str: ${str}`);
  return str;
}

export function genRadomStr(len: number): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let randomStr = '';
  for (let i = 0; i < len; i++) {
    randomStr += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return randomStr;
}
export async function createUserAlbum(context: common.UIAbilityContext, testNum: string, albumName: string): Promise<photoAccessHelper.Album> {
  console.info(`${testNum} createUserAlbum albumName: ${albumName}`);
  let album: photoAccessHelper.Album | ESObject;
  try {
    const helper: ESObject = photoAccessHelper.getPhotoAccessHelper(context);
    album = await helper.createAlbum(albumName);
    console.info(`${testNum} createUserAlbum suc`);
  } catch (error) {
    console.error(`Failed to createUserAlbum! error: ${error}`);
  }

  return new Promise((resolve, reject) => {
    resolve(album);
  });
}

export async function getFileAsset(context: common.UIAbilityContext,testNum: string,
  fetchOps: photoAccessHelper.FetchOptions): Promise<photoAccessHelper.PhotoAsset> {
  let asset: photoAccessHelper.PhotoAsset;
  try {
    const helper = photoAccessHelper.getPhotoAccessHelper(context);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
    fetchResult = await helper.getAssets(fetchOps);
    console.info(`${testNum} getFileAsset fetchResult: ${fetchResult.getCount()}`);
    asset = await fetchResult.getFirstObject();
    fetchResult.close();
  } catch (error) {
    console.error(`${testNum} getFileAsset error: ${error}`);
  }

  return new Promise((resolve, reject) => {
    resolve(asset);
  });
}
export function getFileAssetFetchResult(): photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> {
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | ESObject;
  return fetchResult;
}

export function getAlbumFetchResult(): photoAccessHelper.FetchResult<photoAccessHelper.Album> {
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | ESObject;
  return fetchResult;
}

export function checkUserAlbum(expect: Function, testNum: string, album: ESObject, expectedName: ESObject,
  expectedCover: string): void {
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

export function checkSystemAlbum(expect: Function, testNum: string, album: ESObject, expectedSubType: ESObject): void {
  try {
    console.info(`${testNum} checkSystemAlbum expectedSubType: ${expectedSubType}`);
    expect(album.albumType).assertEqual(albumType.SYSTEM);
    expect(album.albumSubtype).assertEqual(expectedSubType);
    expect(album.albumName).assertEqual('');
    expect(album.albumUri !== '').assertEqual(true);
  } catch (error) {
    console.error(`Failed to delete all user albums! error: ${error}`);
  }
}
export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
  await delegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`).then(result => {
    console.info(`[picker] start abilityFinished: ${result}`);
  }).catch((err: BusinessError) => {
    console.error(`[picker] start abilityFailed: ${err}`);
  });
}

export async function stopAbility(bundleName: string): Promise<void> {
  await delegator.executeShellCommand(`aa force-stop ${bundleName}`).then(result => {
    console.info(`[picker] stop abilityFinished: ${result}`);
  }).catch((err: BusinessError) => {
    console.error(`[picker] stop abilityFailed: ${err}`);
  });
}

export async function getFileNameArray(context: common.UIAbilityContext,): Promise<void> {
  let pathDir = context.filesDir;
  try {
    let listFileOption: FileOptions = {
      recursion: true,
      listNum: 0,
      filter: {
        suffix: [],
      }
    }
    listFileOption.filter.suffix = validImageExt.concat(validVideoExt);
    let nameArray: ESObject = await fs.listFile(pathDir, listFileOption)
    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
  }
}
export async function getAllFileNameArray(context: common.UIAbilityContext): Promise<void> {
  let pathDir = context.filesDir;
  try {
    let listFileOption: FileOptions = {
      recursion: true,
      listNum: 0,
      filter: {
        suffix: [],
      }
    }
    listFileOption.filter.suffix =
      validImageExt.concat(validVideoExt).concat(validVideoMpegExt).concat(validImageGifExt).concat(validImagePngExt);
    let nameArray: ESObject = await fs.listFile(pathDir, listFileOption)
    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
  }
}
export async function pushCreateAsset(context: common.UIAbilityContext, names: Array<string>) {
  console.info('pushCreateAsset start')
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let pathDir = context.filesDir;
  let successNum = 0;
  try {
    console.info('pushCreateAsset name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: ESObject = await getFileNameArray(context);
    console.info('pushCreateAsset rawFiles number: ' + fileNames.length);
    for (let i = 0; i < fileNames.length; i++) {
      let fileName: ESObject = fileNames[i];
      let filePath = pathDir + '/' + fileName;
      let fileUri = fileuri.getUriFromPath(filePath);
      let rawExtension: string = fileName.split('.')[1];
      for (let j = 0; j < names.length; j++) {
        let name = names[j];
        if (fileName.includes('error')) {
          continue
        }
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
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType,
              extension, options);
          assetChangeRequest.addResource(resourceType, fileUri);
          await phAccessHelper.applyChanges(assetChangeRequest);
          console.info(`pushCreateAsset ${name} create success`)
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  } catch (err) {
    console.error('Push_createAsset push resource failed: ' + err)
    return;
  }
}
export async function pushCreateAssetSingle(context: common.UIAbilityContext,names: Array<string>) {
  console.info('pushCreateAssetSingle start')
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let pathDir = context.filesDir;
  let successNum = 0;
  try {
    console.info('pushCreateAssetSingle name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: ESObject = await getAllFileNameArray(context);
    for (let i = 0; i < fileNames.length; i++) {
      let fileName: ESObject = fileNames[i];
      let filePath = pathDir + '/' + fileName;
      let fileUri = fileuri.getUriFromPath(filePath);
      let rawExtension: string = fileName.split('.')[1];
      for (let j = 0; j < names.length; j++) {
        let name = names[j];
        if (fileName == '/01.jpg' || fileName == '/01.mp4') {
          continue
        }
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
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType,
              extension, options);
          assetChangeRequest.addResource(resourceType, fileUri);
          await phAccessHelper.applyChanges(assetChangeRequest);
          console.info(`pushCreateAssetSingle ${name} create success`)
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  } catch (err) {
    console.error('Push_createAsset push resource failed: ' + err)
    return;
  }
}
export function createSandboxFileUri(context: common.UIAbilityContext,extension: string) {
  let pathDir: string = context.filesDir;
  let path = pathDir + '/test' + new Date().getTime() + '.' + extension;
  fs.openSync(path, fs.OpenMode.CREATE)
  return fileuri.getUriFromPath(path);
}

export async function getBurstKey(context: common.UIAbilityContext, testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<string | number> {
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let burstKey: string | number = -1;
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
    let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
    let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.mp4";
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


export async function createVideoBySandBoxUri(testNum: string, testContext: common.UIAbilityContext, fileUri: string) {
  let uri: string = "";
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
    await phAccessHelper.applyChanges(assetChangeRequest);
    uri = assetChangeRequest.getAsset().uri;
    console.log(`${testNum} :: createVideoBySandBoxUri success, uri is ${uri}`);
  } catch (error) {
    console.log(`${testNum} :: createVideoBySandBoxUri failed ! error is ${error}`);
  }
  return uri;
}

export async function getAssetCountByMediaSuffix(testNum:string, helper: photoAccessHelper.PhotoAccessHelper,mediaSuffix: string) {
  let count: number = 0;
  try {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOptions: photoAccessHelper.FetchOptions = {
      fetchColumns: [
        photoKeys.DISPLAY_NAME
      ],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
    let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
    for (let photoAsset of photoAssetList) {
      let suffix: string = (photoAsset.displayName).substring(((photoAsset.displayName).lastIndexOf(".") + 1), photoAsset.displayName.length);
      if (mediaSuffix === suffix) {
        count++;
      }
    }
    console.log(`${testNum} :: get assetCount By mediaSuffix success, count = ${count}`);
  } catch (error) {
    console.error(`${testNum} :: get assetCount By mediaSuffix failed ! error = ${error}`);
    count = -1;
  }
  return count;
}

export async function createShootingModeAssetBatch(testNum: string, testContext: common.UIAbilityContext, fileNameList: Array<string>, disPlayName: string) { 
  let photoAssetUriList: Array<string> = []; 
  try { 
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext); 
    let imageFormatList: Array<string>  = await phAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE); 
    let videoFormatList: Array<string>  = await phAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO); 
    let photoType: photoAccessHelper.PhotoType | undefined = undefined; 
    let resourceType: photoAccessHelper.ResourceType | undefined = undefined; 
    for (let fileName of fileNameList) { 
      let mediaSuffix: string = fileName.substring((fileName.lastIndexOf(".") + 1), fileName.length); 
      let assetTitle: string = fileName.substring(0, (fileName.lastIndexOf("."))); 
      if (imageFormatList.includes(mediaSuffix)) { 
        photoType = photoAccessHelper.PhotoType.IMAGE; 
        resourceType = photoAccessHelper.ResourceType.IMAGE_RESOURCE; 
      } else if (videoFormatList.includes(mediaSuffix)) { 
        photoType = photoAccessHelper.PhotoType.VIDEO; 
        resourceType = photoAccessHelper.ResourceType.VIDEO_RESOURCE; 
      } else { 
        console.log(`${testNum} :: fileName = ${fileName} is not mediaLibrary support asset !`); 
        continue; 
      } 
      // let fileUri: string = testContext.filesDir + `/${disPlayName}`; 
      let fileUri: string = `file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/${disPlayName}` 
      let options: photoAccessHelper.CreateOptions = { 
        title: assetTitle 
      } 
      let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, mediaSuffix, options); 
      assetChangeRequest.addResource(resourceType, fileUri); 
      await phAccessHelper.applyChanges(assetChangeRequest); 
      console.info(`${testNum} :: apply createAssetRequest successfully !`); 
      let photoAssetUri: string = assetChangeRequest.getAsset().uri; 
      photoAssetUriList.push(photoAssetUri); 
    } 
    console.log(`${testNum} :: create all support mediaAsset success, assetCount = ${photoAssetUriList.length}`); 
  } catch (error) { 
    console.error(`${testNum} :: createShootingModeAssetBatch failed ! error = ${error}`); 
  } 
  return photoAssetUriList; 
}

export {
  photoType, photoKeys, albumKeys, albumType, albumSubtype, };
