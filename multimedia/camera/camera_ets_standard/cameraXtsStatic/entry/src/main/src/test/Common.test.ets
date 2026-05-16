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

import { abilityAccessCtrl, PermissionRequestResult, Permissions } from "@kit.AbilityKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { Driver, MatchPattern, ON } from "@kit.TestKit";
import { camera } from "@kit.CameraKit";
import fs from '@ohos.file.fs';
import Utils from "./Util.test";
import { Context } from "@kit.ArkUI";
import { Hypium } from "../../../hypium";
import { hilog } from "@kit.PerformanceAnalysisKit";

const TAG = "cameraXts.common";
export const COMMON_WAIT_DURATION: number = 500;
const domain = 0x0000;
const tag = 'ListTest';


export function resourceName(): string {
  let timestamp = Date.now();
  let filename = `avRecorder_${timestamp}.mp4`;
  return filename;
}

export async function getFd(pathName: string):Promise<int> {
  console.info(TAG, 'case come in getFd');
  let appContext: Context = Hypium.get("Context") as Context;
  pathName = appContext.filesDir + "/" + pathName;
  console.log(TAG, 'pathName =' + pathName);
  let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let fdNumber = file.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}
export function sleep(ms: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, ms);
  });
}

export async function getPermission(name?: Permissions): Promise<void> {
  try {

    console.info(TAG, 'getPermission start', name);

    let context = Hypium.get('Context') as Context;
    hilog.info(domain, tag, '%{public}s', '  beforeAll get Context');
    // 相机权限
    hilog.info(domain, tag, '%{public}s', '  beforeAll createAtManager');
    let atManager = abilityAccessCtrl.createAtManager();
    let arr: Array<Permissions> = new Array<Permissions>();
    arr.push('ohos.permission.CAMERA')
    arr.push('ohos.permission.GRANT_SENSITIVE_PERMISSIONS')
    arr.push('ohos.permission.MICROPHONE')
    arr.push('ohos.permission.MEDIA_LOCATION')
    hilog.info(domain, tag, '%{public}s', '  beforeAll requestPermissionsFromUser');
    atManager.requestPermissionsFromUser(context, arr,
      (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
        hilog.info(0x0000, 'testTag', '  requestPermissionsFromUser end');
      });
    await Utils.msSleep(500);

    hilog.info(domain, tag, '%{public}s', '  beforeAll waitForComponent');
    for (let i = 0; i < arr.length; i++) {

      let dr = Driver.create();
      let power1 = await dr.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      let power2 = await dr.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
      await power1?.click();
      await power2?.click();
    }
    await Utils.msSleep(1000);
    console.info('  abilityTest beforeAll end');
  } catch (err) {
    hilog.error(0x0000, 'testTag', '  beforeAll failed, err: ' + err);
  }
}