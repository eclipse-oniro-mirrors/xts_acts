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

const TAG = "cameraXts.common";

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

export function isEmpty(data: ESObject) {
  console.info(TAG, 'isEmpty test.');
  if (data == null || data == undefined) {
    console.info(TAG, 'data is null.');
    return true;
  }
  return false;
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

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
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

export async function getPermission(name = 'ohos.acts.multimedia.camera.supp.xts'): Promise<void> {
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
          "ohos.permission.MANAGE_RISK_PHOTOS"
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
  cameraPreconfigRatio }
