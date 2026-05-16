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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'sendableGetObjectByPositionSupp';

async function sendableGetObjectByPositionPromiseTest(testName: string, callback: (fetchResult:sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset>) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
    console.info(TAG, testName,'sendablePhotoAccessHelper.FetchResult success: ', fetchResult, callback);
    callback(fetchResult);
}
let power: ESObject;

export default function sendablePhotoAccessHelperGetObjectByPositionTest() {
  describe('sendablePhotoAccessHelperGetObjectByPositionTest', () => {
    let dr = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('empty');
    });


    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001
     * @tc.desc    sendable phAccessHelper.getObjectByPosition index 0
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_001';
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(0);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002
     * @tc.desc    sendable phAccessHelper.getObjectByPosition index -1
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_002';
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(-1);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        // expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003
     * @tc.desc    phAccessHelper.getObjectByPosition index 1
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_003';
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(1);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_004
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_004
     * @tc.desc    phAccessHelper.getObjectByPosition index ''
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_004';
      AppStorage.setOrCreate('empty','')
      let num:number = AppStorage.get('empty') as ESObject;
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(num);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
      }
      done();
    })
    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_005
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_005
     * @tc.desc    phAccessHelper.getObjectByPosition index null
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_005';
      AppStorage.setOrCreate('empty',null)
      let num:number = AppStorage.get('empty') as ESObject;
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(num);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
      }
      done();
    })
    /**
     * @tc.number  SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_006
     * @tc.name    SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_006
     * @tc.desc    phAccessHelper.getObjectByPosition index undefined
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_GET_OBJECT_BY_POSITION_PROMISE_006';
      AppStorage.setOrCreate('empty',undefined)
      let num:number = AppStorage.get('empty') as ESObject;
      try {
        await sendableGetObjectByPositionPromiseTest(testName, async (fetchResult) => {
          let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(num);
          console.info(TAG, testName,'photoAsset ByPositionPromise displayName: ', photoAsset.displayName);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error?.code}`);
      }
      done();
    })
  })
}