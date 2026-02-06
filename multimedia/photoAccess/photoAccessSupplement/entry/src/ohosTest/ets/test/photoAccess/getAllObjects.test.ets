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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import {
  getPermission,
  driveFn,
  fetchOption,
  photoKeys,
} from '../common';
import common from '@ohos.app.ability.common';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';

const TAG = 'getAllObjectsSupp';


export default function getAllObjectsTest() {
  describe('getAllObjectsTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });



    /**
     * @tc.name   fetchResult_getAllObjects_promise_004
     * @tc.number fetchResult_getAllObjects_promise_004
     * @tc.desc   getAllObjects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getAllObjects_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getAllObjects_promise_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.ORIENTATION, 'orientation');
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        console.info(`${testName} fetchResult: ${fetchResult.getCount()}`);
        let fetchCount = fetchResult.getCount();
        expect(fetchCount == 0).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   fetchResult_getAllObjects_callback_004
     * @tc.number fetchResult_getAllObjects_callback_004
     * @tc.desc   getAllObjects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fetchResult_getAllObjects_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_getAllObjects_callback_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.ORIENTATION, 'orientation');
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOps);
        if (fetchResult === undefined) {
          expect().assertFail()
          done();
        }
        let fetchCount: number = fetchResult.getCount();
        if (fetchCount === undefined || fetchCount < 0) {
          expect().assertFail();
          done();
        }
        fetchResult.getAllObjects((err, photoAssetList) => {
          fetchResult.close();
          if (photoAssetList !== undefined) {
            console.info(TAG, 'photoAssetList length: ', photoAssetList.length);
            expect(photoAssetList.length == 0).assertTrue();
          } else {
            console.error(TAG, `photoAssetList length failed with err: ${err.code}, ${err.message}`);
            expect().assertFail();
          }
          done();
        });
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testName);
        expect().assertFail();
        done();
      }
    })


  })
}