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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'releaseTest';

async function releaseCallbackTest(done: Function) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper.release((err) => {
      if (err !== undefined) {
        console.info(TAG, `release failed; err: ${err.code}, ${err.message}`);
        expect().assertFail();
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `release catch failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function releasePromiseTest(done: Function) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    await helper.release();
    done();
  } catch (error) {
    console.info(TAG, `release failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code).assertEqual(ErrorCode.SYSTEM_INNER_ERROR_CODE);
    done();
  }
}

export default function releaseTest() {
  describe('releaseTest', () => {
    beforeAll(() => {
      console.info(TAG, 'beforeAll case.');
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
     * @tc.name   release_callback_test_001
     * @tc.number PHOTO_ACCESS_HELPER_RELEASE_001
     * @tc.desc   callback, release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_callback_test_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_callback_test_001';
      console.info(TAG, testName);
      await releaseCallbackTest(done);
    })

    /**
     * @tc.name   release_promise_test_001
     * @tc.number PHOTO_ACCESS_HELPER_RELEASE_002
     * @tc.desc   promise, release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_promise_test_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_promise_test_001';
      console.info(TAG, testName);
      await releasePromiseTest(done);
    })
  })
}