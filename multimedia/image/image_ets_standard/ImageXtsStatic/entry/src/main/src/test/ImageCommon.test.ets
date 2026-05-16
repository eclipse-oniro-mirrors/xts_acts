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

import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
// import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { Component, Context } from '@kit.ArkUI';
import Utils from './Util.test';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { expect, Hypium } from '../../../hypium';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { common } from '@kit.AbilityKit';

export const LOG_TAG = '[PhotoAccessXts].';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const COMMON_WAIT_DURATION: number = 500;

const domain = 0x0000; // 日志域，可自定义（如 0x1234、0x0001 等）
const tag = 'ListTest'; // 日志标签，标识你的测试模块

const TAG = LOG_TAG + 'common';

let validImageExt = ['.jpg']
let validVideoExt = ['.mp4']
let validVideoMpegExt = ['.mpeg']
let validImageGifExt = ['.gif']
let validImagePngExt = ['.png']


interface filter {
  suffix: ESObject,
}

interface FileOptions {
  recursion: boolean,
  listNum: number,
  filter: filter
}



export async function getPermission(name?: Permissions): Promise<void> {
  try {

    console.info(TAG, 'getPermission start', name);
    let context = Hypium.get('Context') as Context;
    hilog.info(domain, tag, '%{public}s', '  beforeAll get Context');
    hilog.info(domain, tag, '%{public}s', '  beforeAll createAtManager');
    let atManager = abilityAccessCtrl.createAtManager();
    let arr: Array<Permissions> = new Array<Permissions>();
    arr.push('ohos.permission.CAMERA')
    arr.push('ohos.permission.GRANT_SENSITIVE_PERMISSIONS')
    arr.push('ohos.permission.MICROPHONE')
    arr.push('ohos.permission.MEDIA_LOCATION')
    arr.push('ohos.permission.READ_IMAGEVIDEO')
    arr.push('ohos.permission.WRITE_IMAGEVIDEO')
    hilog.info(domain, tag, '%{public}s', '  beforeAll requestPermissionsFromUser');
    atManager.requestPermissionsFromUser(context, arr,
      (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
        hilog.info(0x0000, 'testTag', '  requestPermissionsFromUser end');
      });
    await Utils.msSleep(5000);
    hilog.info(domain, tag, '%{public}s', '  beforeAll waitForComponent');
    for (let i = 0; i < 4; i++) {
      let dr = Driver.create();
      let power1 = await dr.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      let power2 = await dr.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
      await power1?.click();
      await power2?.click();
    }
    await Utils.msSleep(2000);
    console.info('  abilityTest beforeAll end');
  } catch (err) {
    hilog.error(0x0000, 'testTag', '  beforeAll failed, err: ' + err);
  }
}
export function sleep(ms: int): Promise<int> {
  return new Promise<int>((resolve) => {
    setTimeout(() => {
      resolve(0);
    }, ms);
  });
}
export async function createUserAlbum(testContext: common.Context, testName: string,
  albumName: string): Promise<void> {
  console.info(`${testName} createUserAlbum albumName: ${albumName}`);
  try {
    let albumName: string = 'newAlbumName' + new Date().getTime();
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest | null = photoAccessHelper.MediaAlbumChangeRequest.createAlbumRequest(testContext, albumName);
    await helper!.applyChanges(albumChangeRequest!);
    console.info(`${testName} createUserAlbum suc`);
  } catch (error) {
    console.error(`Failed to createUserAlbum! error: ${error}`);
  }
}
export function fetchOption(testName: string, key: string, value: string | number): photoAccessHelper.FetchOptions {
  const predicates = new dataSharePredicates.DataSharePredicates();
  predicates.equalTo(key, value);
  const ops: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  console.info(`${testName} queryOps: ${key} = ${value}`);
  return ops;
}
