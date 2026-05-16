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
import hilog from '@ohos.hilog'
import Context from "application.Context"
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';
import fileuri from "@ohos.file.fileuri";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs, { ListFileOptions, Filter } from '@ohos.file.fs';
import { describe, beforeAll, it, expect, TestType, Size, Level, Hypium } from "../../../hypium/index";
import { Driver, MatchPattern, ON, Component } from '@ohos.UiTest';
import Utils from './Util.test';

let testTag = "common";

let validImageExt = ['.jpg']
let validVideoExt = ['.mp4']
let validVideoMpegExt = ['.mpeg']
let validImageGifExt = ['.gif']
let validImagePngExt = ['.png']

export async function driveFn() {
  let dr = Driver.create();
  let power = await dr.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
  if (power != null) {
    await power.click();
  }
}

export function sleep(ms: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, ms);
  });
}

export function genRadomStr(len: number): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let randomStr = '';
  for (let i = 0; i < len; i++) {
    randomStr += chars.charAt(Math.floor(Math.random() * chars.length).toInt());
  }
  return randomStr;
}

export async function getFileAsset(testNum: string, fetchOps: photoAccessHelper.FetchOptions):
  Promise<photoAccessHelper.PhotoAsset> {
  let asset: photoAccessHelper.PhotoAsset;
  try {
    let appContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset>;
    fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
    hilog.info(0x0000, testTag, '%{public}s', `${testNum} getFileAsset fetchResult: ${fetchResult.getCount()}`);
    asset = await fetchResult.getFirstObject();
    fetchResult.close();
  } catch (error: Error) {
    hilog.info(0x0000, testTag, '%{public}s', `${testNum} getFileAsset error: ${error}`);
    throw error;
  }
  return new Promise<photoAccessHelper.PhotoAsset>((resolve, reject) => {
    resolve(asset);
  });
}

export function fetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: new Array<string>(),
    predicates: predicates
  };
  hilog.info(0x0000, testTag, '%{public}s', `${testNum} queryOps: ${key} = ${value}`);
  return ops;
}

export function fetchAllOption(): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: new Array<string>(),
    predicates: predicates
  };
  return ops;
}

export function photoFetchOption(testNum: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: new Array<string>(
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
      photoAccessHelper.PhotoKeys.DATE_TRASHED,
      photoAccessHelper.PhotoKeys.HIDDEN,
      photoAccessHelper.PhotoKeys.CAMERA_SHOT_KEY,
      photoAccessHelper.PhotoKeys.USER_COMMENT,
      photoAccessHelper.PhotoKeys.DATE_ADDED_MS,
      photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS,
      photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE,
      photoAccessHelper.PhotoKeys.COVER_POSITION,
      photoAccessHelper.PhotoKeys.BURST_KEY,
      photoAccessHelper.PhotoKeys.LCD_SIZE,
      'thumb_size',
      photoAccessHelper.PhotoKeys.DETAIL_TIME,
      photoAccessHelper.PhotoKeys.DATE_TAKEN_MS,
      'all_exif'),
    predicates: predicates
  };
  hilog.info(0x0000, testTag, '%{public}s', `${testNum} queryOps: ${key} = ${value}`);
  return ops;
}

export function isBigInt(value: photoAccessHelper.MemberType): boolean {
  return (typeof value).toString() === 'bigint';
}

export function getAssetId(uri: string): string {
  const tag = 'Photo/';
  const index = uri.indexOf(tag);
  let str = uri.substring(index + tag.length);
  hilog.info(0x0000, testTag, `getAssetId str: ${str}`);
  return str;
}

export function getAlbumId(uri: string): string {
  const index = uri.lastIndexOf('/');
  let str = uri.substring(index + 1);
  hilog.info(0x0000, testTag, `getAlbumId str: ${str}`);
  return str;
}

export async function getBurstKey(testNum: string, fetchOps: photoAccessHelper.FetchOptions): Promise<string | number> {
  let burstKey: string | number | undefined = -1;
  try {
    let appContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
    if (fetchResult === undefined) {
      hilog.info(0x0000, testTag, `${testNum} getBurstKey fetchResult is undefined !`);
      return burstKey;
    }
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    if (photoAsset === undefined) {
      hilog.info(0x0000, testTag, `${testNum} getBurstKey photoAsset is undefined !`);
      return burstKey;
    }
    burstKey = photoAsset.get(photoAccessHelper.PhotoKeys.BURST_KEY) as string;
    hilog.info(0x0000, testTag, `${testNum} :: get burstKey success, burstKey is ${burstKey}`);
    return burstKey;
  } catch (error) {
    hilog.info(0x0000, testTag, `${testNum} :: getBurstKey failed, msg is ${error}`);
    return burstKey as string;
  }
}

export function checkUserAlbum(testNum: string, album: photoAccessHelper.Album,
  expectedName: string, expectedCover: string): void {
  hilog.info(0x0000, testTag, `${testNum} checkUserAlbum album.albumName: ${album.albumName},
    expectedName: ${expectedName}`);
  expect(album.albumType).assertEqual(photoAccessHelper.AlbumType.USER);
  expect(album.albumSubtype).assertEqual(photoAccessHelper.AlbumSubtype.USER_GENERIC);
  expect(album.albumName).assertEqual(expectedName);
  if (expectedCover === '') {
    expect(album.coverUri).assertEqual('');
  } else {
    expect(album.coverUri).assertEqual(expectedCover);
  }
  expect(album.albumUri !== '').assertEqual(true);
  expect(album.count).assertEqual(0);
}

export function checkSystemAlbum(testNum: string, album: photoAccessHelper.Album,
  expectedSubType: photoAccessHelper.AlbumSubtype): void {
  try {
    hilog.info(0x0000, testTag, `${testNum} checkSystemAlbum expectedSubType: ${expectedSubType}`);
    expect(album.albumType).assertEqual(photoAccessHelper.AlbumType.SYSTEM);
    expect(album.albumSubtype).assertEqual(expectedSubType);
    expect(album.albumName).assertEqual('');
    expect(album.albumUri !== '').assertEqual(true);
  } catch (error) {
    console.error(`Failed to delete all user albums! error: ${error}`);
  }
}

export async function getPermission(name?: Permissions): Promise<void> {
  try {
    await Utils.msSleep(2000);
    hilog.info(0x0000, testTag, 'getPermission start' + name);
    let atManager = abilityAccessCtrl.createAtManager();
    let testContext: Context = Hypium.get("context") as Context;
    atManager.requestPermissionsFromUser(testContext, [
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.READ_IMAGEVIDEO',
      'ohos.permission.WRITE_IMAGEVIDEO'
    ], (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
      if (err?.code !== 0) {
        hilog.info(0x0000, testTag, "err.code: " + err?.code + ", err.message: " + err?.message);
      } else {
        hilog.info(0x0000, testTag, 'requestPermissionsFromUser data:' + data);
        hilog.info(0x0000, testTag, 'requestPermissionsFromUser data permissions:' + data?.permissions);
        hilog.info(0x0000, testTag, 'requestPermissionsFromUser data authResults:' + data?.authResults);
        hilog.info(0x0000, testTag, 'requestPermissionsFromUser data dialogShownResults:' + data?.dialogShownResults);
      }
    });
  } catch (error: Error) {
    hilog.info(0x0000, testTag,
      ' createAsset failed' + ", error.name:" + error.name + ", error.message:" + error.message);
  }
}

export async function createMovingPhoto(testNum: string, context: Context, titleName: string):
  Promise<photoAccessHelper.PhotoAsset | null> {
  let photoAsset: photoAccessHelper.PhotoAsset | null = null;
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
    let extension: string = 'jpg';
    let options: photoAccessHelper.CreateOptions = {
      title: titleName,
      subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
    }
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
    hilog.info(0x0000, testTag, `${testNum} :: create assetChangeRequest success`);
    let photoUri =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.jpg";
    let videoUri =
      "file://ohos.acts.multimedia.photoaccess.Static/data/storage/el2/base/haps/entry/photos/test_mov_1.mp4";
    (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
    (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
    hilog.info(0x0000, testTag, `${testNum} :: add resource success`);
    await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
    hilog.info(0x0000, testTag, `${testNum} :: applyChange success`);
    photoAsset = (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset();
  } catch (error) {
    hilog.error(0x0000, testTag, `${testNum} :: create moving photo failed, error is ${error}`);
  }
  return photoAsset;
}

export async function getFileNameArray(context: Context): Promise<Array<String>> {
  let pathDir = context.filesDir;
  try {
    let filter: Filter = {
      suffix: []
    }
    let listFileOption: ListFileOptions = {
      recursion: true,
      listNum: 0,
      filter: filter
    }
    let suffix: Array<string> = validImageExt.concat(validVideoExt) || [] as Array<string>;
    let filter1: Filter = listFileOption.filter as Filter;
    filter1.suffix = suffix || [] as Array<string>;
    let nameArray: Array<string> = await fs.listFile(pathDir, listFileOption)

    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
    return [] as Array<string>
  }
}

export async function pushCreateAsset(context: Context, names: Array<string>):
  Promise<photoAccessHelper.PhotoAsset | undefined> {
  hilog.info(0x0000, testTag, 'pushCreateAsset start')
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let pathDir = context.filesDir;
  let successNum = 0;
  try {
    hilog.info(0x0000, testTag, 'pushCreateAsset name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: Array<string> = await getFileNameArray(context) || [] as Array<string>;
    hilog.info(0x0000, testTag, 'pushCreateAsset rawFiles number: ' + fileNames.length);
    for (let i = 0; i < fileNames.length; i++) {
      let fileName = fileNames[i];
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
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType,
              extension, options);
          (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(resourceType, fileUri);
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
          hilog.info(0x0000, testTag, `pushCreateAsset ${name} create success`)
          successNum++;
        }
      }
    }
    hilog.info(0x0000, testTag, 'Push_createAsset successfully fileNumber: ' + successNum);
    return;
  } catch (err) {
    hilog.error(0x0000, testTag, 'Push_createAsset push resource failed: ' + err)
    return;
  }
}

export function createSandboxFileUri(context: Context, extension: string) {
  let pathDir: string = context.filesDir;
  let path = pathDir + '/test' + new Date().getTime() + '.' + extension;
  fs.openSync(path, fs.OpenMode.CREATE)
  return fileuri.getUriFromPath(path);
}

export async function createVideoBySandBoxUri(testNum: string, testContext: Context, fileUri: string):
  Promise<string> {
  let uri: string = "";
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
      photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
    await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
    uri = ((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).getAsset() as photoAccessHelper.PhotoAsset).uri;
    hilog.info(0x0000, testTag, `${testNum} :: createVideoBySandBoxUri success, uri is ${uri}`);
  } catch (error) {
    hilog.info(0x0000, testTag, `${testNum} :: createVideoBySandBoxUri failed ! error is ${error}`);
  }
  return uri;
}

export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
  try {
    let result =
      await abilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`[picker] start abilityFinished: ${result}`);
  } catch (err: Error) {
    console.error(`[picker] start abilityFailed: ${err}`);
  }
}

export async function stopAbility(bundleName: string): Promise<void> {
  try {
    let result =
      await abilityDelegatorRegistry.getAbilityDelegator().executeShellCommand(`aa force-stop ${bundleName}`);
    console.info(`[picker] stop abilityFinished: ${result}`);
  } catch (err: Error) {
    console.error(`[picker] stop abilityFailed: ${err}`);
  }
}

export async function getAllFileNameArray(context: Context): Promise<Array<string>> {
  let pathDir = context.filesDir;
  try {
    let filter: Filter = {
      suffix: []
    }
    let listFileOption: ListFileOptions = {
      recursion: true,
      listNum: 0,
      filter: filter
    }
    let suffix: Array<string> =
      validImageExt.concat(validVideoExt).concat(validVideoMpegExt).concat(validImageGifExt).concat(validImagePngExt) ||
        [] as Array<string>;
    let filter1: Filter = listFileOption.filter as Filter;
    filter1.suffix = suffix || [] as Array<string>;
    let nameArray: Array<string> = await fs.listFile(pathDir, listFileOption)
    return nameArray;
  } catch (err) {
    console.error('getFileNameArray failed: ' + err);
    return [] as Array<string>
  }
}

export async function pushCreateAssetSingle(context: Context, names: Array<string>) {
  console.info('pushCreateAssetSingle start')
  let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
  let pathDir = context.filesDir;
  let successNum = 0;
  try {
    console.info('pushCreateAssetSingle name: ' + names)
    let photoType: photoAccessHelper.PhotoType;
    let resourceType: photoAccessHelper.ResourceType;
    let fileNames: Array<string> = await getAllFileNameArray(context) || [] as Array<string>;
    for (let i = 0; i < fileNames.length; i++) {
      let fileName = fileNames[i];
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
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
            photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType,
              extension, options);
          (assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest).addResource(resourceType, fileUri);
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).applyChanges((assetChangeRequest as photoAccessHelper.MediaAssetChangeRequest));
          console.info(`pushCreateAssetSingle ${name} create success`)
          successNum++;
        }
      }
    }
    console.info('Push_createAsset successfully fileNumber: ' + successNum);
  } catch (err) {
    console.error('Push_createAsset push resource failed: ' + err)
  }
}