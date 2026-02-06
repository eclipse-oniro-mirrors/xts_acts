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

import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { driveFn, getPermission, fetchAllOption, fetchOption, photoKeys, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'close';

async function closePromiseTest(done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
      await sendablePhAccessHelper.getAssets(fetchOps);
    if (fetchResult === undefined) {
      expect().assertFail();
      done();
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

export default function sendableCloseTest() {
  describe('sendableCloseTest', () => {

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
     * @tc.number    : SENDABLE_FETCH_RESULT_CLOSE_001
     * @tc.name      : close_sendable_001
     * @tc.desc      : close fetchResult
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_sendable_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_sendable_001';
      const fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await closePromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_CLOSE_002
     * @tc.name      : close_sendable_002
     * @tc.desc      : close fetchResult
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_sendable_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      await closePromiseTest(done, testName, fetchOps);
    })

    /**
     * @tc.number    : SENDABLE_FETCH_RESULT_CLOSE_003
     * @tc.name      : close_sendable_003
     * @tc.desc      : close fetchResult
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('close_sendable_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'close_sendable_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      await closePromiseTest(done, testName, fetchOps);
    })
  })
}