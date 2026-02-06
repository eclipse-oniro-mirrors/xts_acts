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

const TAG = LOG_TAG + 'isAfterLast';

async function isAfterLastTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
      sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    let fetchCount = fetchResult.getCount();
    if (fetchCount > 0) {
      expect(fetchResult !== undefined).assertTrue();
      let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
      expect(photoAsset !== undefined).assertTrue();
      let isAfter = await fetchResult.isAfterLast();
      expect(isAfter).assertTrue();
      fetchResult.close();
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

export default function sendableIsAfterLastTest() {
  describe('sendableIsAfterLastTest', () => {
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
     * @tc.number    : SENDABLE_FETCH_RESULT_IS_AFTER_LAST_001
     * @tc.name      : isAfterLast_sendable_001
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isAfterLast_sendable_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isAfterLast_sendable_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await isAfterLastTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_IS_AFTER_LAST_002
     * @tc.name      : isAfterLast_sendable_002
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isAfterLast_sendable_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'isAfterLast_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await isAfterLastTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_IS_AFTER_LAST_003
     * @tc.name      : isAfterLast_sendable_003
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('isAfterLast_sendable_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'isAfterLast_sendable_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await isAfterLastTest(done, testName, fetchOps);
    })
  })
}