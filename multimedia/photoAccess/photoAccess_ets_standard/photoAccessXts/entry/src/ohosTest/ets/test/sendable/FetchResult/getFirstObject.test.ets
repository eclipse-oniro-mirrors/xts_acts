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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { common } from '@kit.AbilityKit';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getFirstObject';

async function getFirstObjectPromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
    sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    expect(fetchResult !== undefined).assertTrue();
    let fetchCount = fetchResult.getCount();
    if (fetchCount > 0) {
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      console.info('photoAsset displayName: ', photoAsset.displayName);
      expect(photoAsset !== undefined).assertTrue();
      done();
    }
    fetchResult.close();
    done();
  } catch (error) {
    console.info(TAG, `${testName} failed; error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function sendableGetFirstObjectTest() {
  describe('sendableGetFirstObjectTest', () => {
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
     * @tc.name   getFirstObject_sendable_promise_001
     * @tc.number SENDABLE_FETCH_RESULT_GET_FIRST_OBJECT_001
     * @tc.desc   getFirstObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFirstObject_sendable_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      getFirstObjectPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.name   getFirstObject_sendable_promise_002
     * @tc.number SENDABLE_FETCH_RESULT_GET_FIRST_OBJECT_002
     * @tc.desc   getFirstObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFirstObject_sendable_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      getFirstObjectPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.name   getFirstObject_sendable_promise_003
     * @tc.number SENDABLE_FETCH_RESULT_GET_FIRST_OBJECT_003
     * @tc.desc   getFirstObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getFirstObject_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getFirstObject_sendable_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      getFirstObjectPromiseTest(done, testName, fetchOps);
    })
  })
}