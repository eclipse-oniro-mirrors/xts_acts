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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getCount';

async function getCountPromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    const fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
    }
    let fetchCount: number = await fetchResult.getCount();
    if (fetchCount === undefined || fetchCount < 0) {
      expect().assertFail();
      done();
    }
    fetchResult.close();
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}, ${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableGetCountTest() {
  describe('sendableGetCountTest', () => {
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
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_COUNT_001
     * @tc.name      : getCount_sendable_promise_001
     * @tc.desc      : getCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCount_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getCount_sendable_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getCountPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_COUNT_002
     * @tc.name      : getCount_sendable_promise_002
     * @tc.desc      : getCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCount_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getCount_sendable_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getCountPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_COUNT_003
     * @tc.name      : getCount_sendable_promise_003
     * @tc.desc      : getCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCount_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getCount_sendable_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getCountPromiseTest(done, testName, fetchOps);
    })
  })
}