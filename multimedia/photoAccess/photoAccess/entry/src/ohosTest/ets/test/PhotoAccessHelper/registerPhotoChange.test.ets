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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit'
import {
  photoKeys,
  sleep,
  driveFn,
  getPermission,
  pushCreateAsset
} from '../common'
import { dataSharePredicates } from '@kit.ArkData'

export default function registerPhotoChangeTest () {
  describe('registerPhotoChangeTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fileNameList: Array<string> = ['registerPhotoChange_01.jpg'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      await pushCreateAsset(testContext, fileNameList);
    });

    const NOTIFY_CHANGE_UPDATE = photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_UPDATE;

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTER_PHOTOCHANGE_CALLBACK_001
     * @tc.name      : register_photoChange_callback_001
     * @tc.desc      : listening motify file title, type NOTIFY_CHANGE_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('register_photoChange_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'register_photoChange_callback_001';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        const ops : photoAccessHelper.FetchOptions = {
          fetchColumns: [photoKeys.TITLE],
          predicates: predicates
        };
        const fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops);
        console.log(`${testNum} :: fetchResult is undefined ? ${fetchResult === undefined}`);
        expect(fetchResult !== undefined).assertTrue();
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        fetchResult.close();
        let count = 0;
        await sleep(550);
        helper.on('photoChange', async (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.off('photoChange');
          expect(changeData.type).assertEqual(NOTIFY_CHANGE_UPDATE);
        });
        await sleep(550);
        const newTitle = testNum + photoAsset.get(photoKeys.TITLE);
        photoAsset.set(photoKeys.TITLE, newTitle);
        await photoAsset.commitModify();
        await sleep(1000);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}