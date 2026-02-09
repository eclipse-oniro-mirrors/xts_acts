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

import { abilityAccessCtrl, common, PermissionRequestResult } from "@kit.AbilityKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { Driver, MatchPattern, ON } from "@kit.TestKit";
import { camera } from "@kit.CameraKit";
import fs from '@ohos.file.fs';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { expect } from '@ohos/hypium';
import { sendablePhotoAccessHelper } from "@kit.MediaLibraryKit";

export const LOG_TAG = '[PhotoAccessXts].';
const TAG = "photoAccessXtsSupp.common";

const COMMON_WAIT_DURATION: number = 500;
const cameraPosition = camera.CameraPosition;
const cameraType = camera.CameraType;
const connectionType = camera.ConnectionType;
const hostDeviceType = camera.HostDeviceType;
const sceneMode = camera.SceneMode;
const cameraErrorCode = camera.CameraErrorCode;
const cameraFlashMode = camera.FlashMode;
const cameraFocusMode = camera.FocusMode;
const cameraPreconfigType = camera.PreconfigType;
const cameraPreconfigRatio = camera.PreconfigRatio;
const albumSubtype = photoAccessHelper.AlbumSubtype;
const albumKeys = photoAccessHelper.AlbumKeys;
const albumType = photoAccessHelper.AlbumType;
const photoKeys = photoAccessHelper.PhotoKeys;

export function isEmpty(data: ESObject) {
  console.info(TAG, 'isEmpty test.');
  if (data == null || data == undefined) {
    console.info(TAG, 'data is null.');
    return true;
  }
  return false;
}
export function fetchAllOption(): photoAccessHelper.FetchOptions  {
  const predicates = new dataSharePredicates.DataSharePredicates();
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  return ops;
}
export function checkBackCamera() {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let supportedCamera = camera.getCameraManager(testContext).getSupportedCameras();
  if (supportedCamera.length <= 0) {
    console.info(TAG, 'No supported camera.');
    return false;
  } else {
    for (let i = 0; i < supportedCamera.length; i++) {
      if (supportedCamera[i].cameraPosition === cameraPosition.CAMERA_POSITION_BACK) {
        console.info(TAG, 'Supported rear Camera.');
        return true;
      }
    }
    return false;
  }
}

export function genRandomStr(len: number): string {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  let randomStr = '';
  for (let i = 0; i < len; i++) {
    randomStr += chars.charAt(Math.floor(Math.random() * chars.length));
  }
  return randomStr;
}

export async function createUserAlbum(context: common.UIAbilityContext, testName: string,
  albumName: string): Promise<photoAccessHelper.Album> {
  console.info(`${testName} createUserAlbum albumName: ${albumName}`);
  let album: photoAccessHelper.Album | ESObject;
  try {
    const helper: ESObject = photoAccessHelper.getPhotoAccessHelper(context);
    album = await helper.createAlbum(albumName);
    console.info(`${testName} createUserAlbum suc`);
  } catch (error) {
    console.error(`Failed to createUserAlbum! error: ${error}`);
    expect().assertFail();
  }

  return new Promise((resolve, reject) => {
    resolve(album);
  });
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
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


export async function driveFn() {
  let dr = Driver.create();
  await sleep(COMMON_WAIT_DURATION);
  let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), COMMON_WAIT_DURATION);
  while (power) {
    await sleep(COMMON_WAIT_DURATION);
    await power?.click();
    await sleep(COMMON_WAIT_DURATION);
    power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), COMMON_WAIT_DURATION);
  }
}

export function resourceName() {
  let timestamp = Date.now();
  let filename = `avRecorder_${timestamp}.mp4`;
  return filename;
}

export async function getFd(pathName: string) {
  console.info(TAG, 'case come in getFd');
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  pathName = testContext.filesDir + "/" + pathName;
  console.log(TAG, 'pathName =' + pathName);
  let file = await fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let fdNumber = file.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}

export async function closeFd(fdNumber: number) {
  console.info('case come in closeFd');
  if (fdNumber != null) {
    fs.closeSync(fdNumber);
  } else {
    console.info('[fs.closeSync] case fdNumber is null');
  }
}

export async function getPermission(name = 'ohos.acts.multimedia.photoAccess.supp.xts'): Promise<void> {
  try {
    console.info(TAG, 'getPermission start', name);

    let atManager = abilityAccessCtrl.createAtManager();
    let testContext: common.UIAbilityContext =
      AppStorage.get<common.UIAbilityContext>("testContext") as common.UIAbilityContext;
    atManager.requestPermissionsFromUser(testContext, [
      "ohos.permission.CAMERA",
      "ohos.permission.MICROPHONE",
      'ohos.permission.MEDIA_LOCATION',
      'ohos.permission.READ_IMAGEVIDEO',
      'ohos.permission.WRITE_IMAGEVIDEO',
      'ohos.permission.MANAGE_RISK_PHOTOS'
    ], (err: BusinessError, data: PermissionRequestResult) => {
      if (err) {
        console.error(TAG, `requestPermissionsFromUser fail, err->${JSON.stringify(err)}`);
      } else {
        console.info(TAG, 'requestPermissionsFromUser data:' + JSON.stringify(data));
        console.info(TAG, 'requestPermissionsFromUser data permissions:' + data.permissions);
        console.info(TAG, 'requestPermissionsFromUser data authResults:' + data.authResults);
        console.info(TAG, 'requestPermissionsFromUser data dialogShownResults:' + data.dialogShownResults);
      }
    });
  } catch (error) {
    console.error(TAG, `getPermission failed, error: ${error}`);
  }
}
export async function copyImageToSandbox(fileName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const rawFileContent = testContext.resourceManager.getRawFileContentSync(fileName);
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const fd = await fs.open(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  await fs.write(fd.fd, rawFileContent.buffer);
  await fs.close(fd);
}
export async function getSendableFileAsset(context: common.UIAbilityContext, testName: string,
  fetchOps: photoAccessHelper.FetchOptions): Promise<sendablePhotoAccessHelper.PhotoAsset> {
  let asset: sendablePhotoAccessHelper.PhotoAsset;
  try {
    const helper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset>;
    fetchResult = await helper.getAssets(fetchOps);
    console.info(`${testName} getFileAsset fetchResult: ${fetchResult.getCount()}`);
    asset = await fetchResult.getFirstObject();
    fetchResult.close();
  } catch (error) {
    console.error(`${testName} getFileAsset error: ${error}`);
    expect().assertFail();
  }

  return new Promise((resolve, reject) => {
    resolve(asset);
  });
}

export { COMMON_WAIT_DURATION,
  cameraPosition,
  cameraType,
  connectionType,
  hostDeviceType,
  sceneMode,
  cameraErrorCode,
  cameraFlashMode,
  cameraFocusMode,
  cameraPreconfigType,
  cameraPreconfigRatio,
  albumKeys,
  albumType,
  albumSubtype,
  photoKeys,
}

export enum ErrorCode {
  /**
   * Parameter error.
   */
  PARAM_ERROR_CODE = 401,

  /**
   * Permission denied.
   */
  PERM_DENIED_ERROR_CODE = 13900012,

  /**
   * Invalid argument.
   */
  ARGUMENT_INVALID_ERROR_CODE = 13900020,

  /**
   * System inner fail.
   */
  SYSTEM_INNER_ERROR_CODE = 14000011,
  /**
   * Member is not a valid PhotoKey
   */
  NOT_VALID_PHOTO_KEY_ERROR_CODE = 14000014,

}
