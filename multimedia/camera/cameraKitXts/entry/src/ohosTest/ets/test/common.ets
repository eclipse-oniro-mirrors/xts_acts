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

import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { camera } from '@kit.CameraKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = 'cameraTest.common: ';
const COMMON_WAIT_DURATION: number = 500;

const cameraPosition = camera.CameraPosition;
const cameraType = camera.CameraType;
const connectionType = camera.ConnectionType;
const hostDeviceType = camera.HostDeviceType;
const sceneMode = camera.SceneMode;
const cameraErrorCode = camera.CameraErrorCode;
const cameraConcurrentType = camera.CameraConcurrentType;
const cameraFlashMode = camera.FlashMode;
const cameraFocusMode = camera.FocusMode;
const cameraPreconfigType = camera.PreconfigType;
const cameraPreconfigRatio = camera.PreconfigRatio;

export function isEmpty(data: ESObject | null | undefined): boolean {
  return data === null || data === undefined;
}

export function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export async function waitForTrigger(check: () => boolean, timeoutMs: number = 15000,
  intervalMs: number = 100): Promise<boolean> {
  let elapsed: number = 0;
  while (elapsed < timeoutMs) {
    if (check()) {
      return true;
    }
    await sleep(intervalMs);
    elapsed += intervalMs;
  }
  return check();
}

export function resourceName(prefix: string = 'avRecorder', suffix: string = '.mp4'): string {
  return prefix + '_' + Date.now() + suffix;
}

export async function getFd(pathName: string): Promise<number> {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let fullPath: string = testContext.filesDir + '/' + pathName;
  let file: fs.File = fs.openSync(fullPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  return file.fd;
}

export async function closeFd(fdNumber: number): Promise<void> {
  if (fdNumber >= 0) {
    fs.closeSync(fdNumber);
  }
}

export function checkBackCamera(): boolean {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let supportedCamera: Array<camera.CameraDevice> = camera.getCameraManager(testContext).getSupportedCameras();
  if (supportedCamera.length <= 1) {
    return false;
  }
  for (let i = 0; i < supportedCamera.length; i++) {
    if (supportedCamera[i].cameraPosition === cameraPosition.CAMERA_POSITION_BACK) {
      return true;
    }
  }
  return false;
}

export async function driveFn(): Promise<void> {
  // driveFn is a best-effort helper that auto-clicks the permission dialog's "允许" button.
  // It must NOT abort beforeAll when the underlying UI automation (aams) is unavailable,
  // because camera permission may already be granted from a previous run and the dialog
  // may never appear. Known failure modes that should be tolerated:
  //   - "can not connect to aams ret_err_connection_exist": previous test suite left an
  //     UiTest connection open; Driver.create() rejects because only one connection is allowed
  //   - Driver/UiTest SA unavailable on the device
  //   - Permission dialog does not appear within COMMON_WAIT_DURATION
  try {
    let driver = Driver.create();
    await sleep(COMMON_WAIT_DURATION);
    let allowButton1 = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), COMMON_WAIT_DURATION);
    let allowButton2 = await driver?.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), COMMON_WAIT_DURATION);
    await allowButton1?.click();
    await allowButton2?.click();
    await sleep(COMMON_WAIT_DURATION);
  } catch (err) {
    let businessError = err as BusinessError;
    console.warn(TAG + 'driveFn non-fatal exception (continuing): code='
      + Number(businessError.code) + ', message=' + businessError.message);
  }
}

export async function getPermission(name: string = 'ohos.acts.multimedia.camera.xts'): Promise<void> {
  try {
    console.info(TAG + 'getPermission start ' + name);
    let atManager = abilityAccessCtrl.createAtManager();
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    atManager.requestPermissionsFromUser(testContext, ['ohos.permission.CAMERA'],
      (err: BusinessError, data: PermissionRequestResult) => {
        if (!isEmpty(err as ESObject)) {
          console.error(TAG + 'requestPermissionsFromUser fail, err=' + JSON.stringify(err));
          return;
        }
        console.info(TAG + 'requestPermissionsFromUser data=' + JSON.stringify(data));
      });
  } catch (err) {
    let businessError = err as BusinessError;
    console.error(TAG + 'getPermission failed, error=' + JSON.stringify(businessError));
  }
}

export function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG + 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export function getEnumValueList<T extends Record<string, number | string>>(enumeration: T): number[] {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  return numberValues;
}

export {
  COMMON_WAIT_DURATION,
  cameraPosition,
  cameraType,
  connectionType,
  hostDeviceType,
  sceneMode,
  cameraErrorCode,
  cameraConcurrentType,
  cameraFlashMode,
  cameraFocusMode,
  cameraPreconfigType,
  cameraPreconfigRatio
}