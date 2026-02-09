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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { common } from '@kit.AbilityKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'getObjectByPosition';

async function getObjectByPositionPromiseTest(done: Function, testName: string,
  fetchOps: photoAccessHelper.FetchOptions, index: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
    sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    let fetchCount: number = fetchResult.getCount();
    expect(fetchCount > 0).assertTrue();
    const photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getObjectByPosition(index);
    fetchResult.getObjectByPosition(index).then(() => {
      console.info('photoAsset displayName: ', photoAsset.displayName);
      fetchResult.close();
      done();
    }).catch((err: BusinessError) => {
      console.error(`commitModify failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
      done();
    });
  } catch (error) {
    console.info(TAG, `${testName} failed; error: ${error.code} ${error}`);
    expect(error.code == ErrorCode.SYSTEM_INNER_ERROR_CODE || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

async function returnCount(fetchOps: photoAccessHelper.FetchOptions,) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
    sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
    await sendablePhAccessHelper.getAssets(fetchOps);
  let fetchCount: number = fetchResult.getCount();
  return fetchCount
}

export default function sendableGetObjectByPositionTest() {
  describe('sendableGetObjectByPositionTest', () => {
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
     * @tc.name   getObjectByPosition_sendable_promise_001
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_001
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchAllOption();
      const index = 0;
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_002
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_002
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchAllOption();
      const index = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index - 1);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_003
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_003 // TODO
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*    it('getObjectByPosition_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
          const testName = 'getObjectByPosition_sendable_promise_003';
          const fetchOps: photoAccessHelper.FetchOptions =
            fetchAllOption();
          const index = await returnCount(fetchOps);
          await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
        })*/

    /**
     * @tc.name   getObjectByPosition_sendable_promise_004
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_004
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const index = 0;
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_005
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_005
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_005';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);

      const index = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index - 1);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_006
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_006 // TODO
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*     it('getObjectByPosition_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
           const testName = 'getObjectByPosition_sendable_promise_006';
           const fetchOps: photoAccessHelper.FetchOptions =
             fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
           const index = await returnCount(fetchOps);
           await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
         })*/

    /**
     * @tc.name   getObjectByPosition_sendable_promise_007
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_007
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_007';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const index = 0;
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_008
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_008
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getObjectByPosition_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'getObjectByPosition_sendable_promise_008';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const index = await returnCount(fetchOps);
      await getObjectByPositionPromiseTest(done, testName, fetchOps, index - 1);
    })

    /**
     * @tc.name   getObjectByPosition_sendable_promise_009
     * @tc.number SENDABLE_FETCH_RESULT_GET_OBJECT_BY_POSITION_009 // TODO
     * @tc.desc   getObjectByPosition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*    it('getObjectByPosition_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
          const testName = 'getObjectByPosition_sendable_promise_009';
          const fetchOps: photoAccessHelper.FetchOptions =
            fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
          const index = await returnCount(fetchOps);
          await getObjectByPositionPromiseTest(done, testName, fetchOps, index);
        })*/
  })
}