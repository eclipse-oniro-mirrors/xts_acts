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
import common from '@ohos.app.ability.common';
import { fetchAllOption, getPermission, driveFn, fetchOption, photoKeys, photoType, LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'isAfterLast';

async function isLastAfterPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOps);
    let fetchCount = await fetchResult.getCount();
    if (fetchCount > 0) {
      let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
      const afterLast = await fetchResult.isAfterLast();
      expect(afterLast).assertTrue();
      await fetchResult.close();
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function isAfterLastTest() {
  describe('isAfterLastTest', () => {

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
     * @tc.number    : FETCH_RESULT_IS_AFTER_LAST_001
     * @tc.name      : fetchResult_isAfterLast_promise_001
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('fetchResult_isAfterLast_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_isAfterLast_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await isLastAfterPromiseTest(done, fetchOps, testName);
    })

    /**
     * @tc.number    : FETCH_RESULT_IS_AFTER_LAST_002
     * @tc.name      : fetchResult_isAfterLast_promise_002
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('fetchResult_isAfterLast_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_isAfterLast_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await isLastAfterPromiseTest(done, fetchOps, testName);
    })

    /**
     * @tc.number    : FETCH_RESULT_IS_AFTER_LAST_003
     * @tc.name      : fetchResult_isAfterLast_promise_003
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('fetchResult_isAfterLast_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'fetchResult_isAfterLast_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await isLastAfterPromiseTest(done, fetchOps, testName);
    })
  })
}