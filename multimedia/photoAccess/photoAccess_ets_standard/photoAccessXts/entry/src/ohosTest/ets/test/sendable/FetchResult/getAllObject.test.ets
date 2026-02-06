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
import { common } from '@kit.AbilityKit';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getAllObject';

async function getAllObjectsPromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper =
    sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    console.info(`${testName} fetchResult: ${fetchResult.getCount()}`);
    let fetchCount = fetchResult.getCount();
    expect(fetchCount > 0).assertTrue();
    const allObj: Array<sendablePhotoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
    fetchResult.close();
    expect(allObj.length === fetchCount).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `${testName} failed; error: ${error}`);
    expect().assertFail();
    done();
  }
}

export default function sendableGetAllObjectTest() {
  describe('sendableGetAllObjectTest', () => {
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
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_ALL_OBJECTS_001
     * @tc.name      : albumName_sendable_promise_001
     * @tc.desc      : getAllObjects
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('albumName_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'albumName_sendable_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAllObjectsPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_ALL_OBJECTS_002
     * @tc.name      : albumName_sendable_promise_002
     * @tc.desc      : getAllObjects
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('albumName_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'albumName_sendable_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await getAllObjectsPromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_GET_ALL_OBJECTS_003
     * @tc.name      : albumName_sendable_promise_003
     * @tc.desc      : getAllObjects
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('albumName_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'albumName_sendable_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await getAllObjectsPromiseTest(done, testName, fetchOps);
    })
  })
}