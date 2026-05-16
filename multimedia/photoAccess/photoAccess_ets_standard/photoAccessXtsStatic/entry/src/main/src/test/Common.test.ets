/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { Component, Context } from '@kit.ArkUI';
import Utils from './Util.test';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { expect, Hypium } from '../../../hypium';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';

export const LOG_TAG = '[PhotoAccessXts].';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const COMMON_WAIT_DURATION: number = 500;

const domain = 0x0000;
const tag = 'ListTest';

const TAG = LOG_TAG + 'common';


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
    // 相机权限
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

export async function createMovingPhoto(testNum: string, context: Context, titleName: string):Promise<photoAccessHelper.PhotoAsset> {
  let photoAsset: photoAccessHelper.PhotoAsset | null = null;
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
    let extension: string = 'jpg';
    let options: photoAccessHelper.CreateOptions = {
      title: titleName,
      subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
    }
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null=
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension, options);
    console.log(`${testNum} :: create assetChangeRequest success`);
    let imageUri = context.filesDir + '/test_mov_1.jpg';
    let videoUri = context.filesDir + '/test_mov_1.mp4';
    console.info(testNum, imageUri, videoUri);
    assetChangeRequest!.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, imageUri);
    assetChangeRequest!.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
    console.log(`${testNum} :: add resource success`);
    await phAccessHelper!.applyChanges(assetChangeRequest!);
    console.log(`${testNum} :: applyChange success`);
    photoAsset = assetChangeRequest!.getAsset();
  } catch (error) {
    console.error(`${testNum} :: create moving photo failed, error is ${error}`);
  }
  return photoAsset!;
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