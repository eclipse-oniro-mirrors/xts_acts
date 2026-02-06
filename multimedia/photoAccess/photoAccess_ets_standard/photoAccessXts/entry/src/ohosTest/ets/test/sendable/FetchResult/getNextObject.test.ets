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

const TAG = LOG_TAG + 'getNextObject';

async function getNextObjectPromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    expect(fetchResult !== undefined).assertTrue();
    let photoAssetFirst: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    expect(photoAssetFirst !== undefined).assertTrue();
    let photoAsset: sendablePhotoAccessHelper.PhotoAsset | undefined = undefined;
    if (!fetchResult.isAfterLast()) {
      photoAsset = await fetchResult.getNextObject();
      expect(photoAsset !== undefined).assertTrue();
    }
    fetchResult.close();
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `${testName} failed; error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function sendableGetNextObjectTest() {
  describe('sendableGetNextObjectTest', () => {
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
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_NEXT_OBJECT_001
     * @tc.name      : getNextObject_sendable_promise_001
     * @tc.desc      : getNextObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getNextObject_sendable_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getNextObjectPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_NEXT_OBJECT_002
     * @tc.name      : getNextObject_sendable_promise_002
     * @tc.desc      : getNextObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getNextObject_sendable_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getNextObjectPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_NEXT_OBJECT_003
     * @tc.name      : getNextObject_sendable_promise_003
     * @tc.desc      : getNextObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getNextObject_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getNextObject_sendable_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getNextObjectPromiseTest(done, testName, fetchOps);
    })
  })
}