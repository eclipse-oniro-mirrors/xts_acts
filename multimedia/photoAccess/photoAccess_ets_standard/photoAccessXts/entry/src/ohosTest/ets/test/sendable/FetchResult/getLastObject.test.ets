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
import { common } from '@kit.AbilityKit';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getLastObject';

async function getLastObjectPromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
      sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);

    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail()
      done();
    }
    if (fetchResult.getCount() === 0) {
      expect().assertFail();
      done();
    }
    let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
    expect(photoAsset !== undefined).assertTrue();
    expect(fetchResult.isAfterLast()).assertTrue();
    fetchResult.close();
    done();
  } catch (error) {
    console.info(TAG, `${testName} failed; error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function sendableGetLastObjectTest() {
  describe('sendableGetLastObjectTest', () => {
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
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_LAST_OBJECT_001
     * @tc.name      : getLastObject_sendable_promise_001
     * @tc.desc      : getLastObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getLastObject_sendable_promise_001';
      const fetchOption: photoAccessHelper.FetchOptions = fetchAllOption();
      await getLastObjectPromiseTest(done, testName, fetchOption);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_LAST_OBJECT_002
     * @tc.name      : getLastObject_sendable_promise_002
     * @tc.desc      : getLastObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getLastObject_sendable_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getLastObjectPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_LAST_OBJECT_003
     * @tc.name      : getLastObject_sendable_promise_003
     * @tc.desc      : getLastObject
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getLastObject_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getLastObject_sendable_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getLastObjectPromiseTest(done, testName, fetchOps);
    })
  })
}