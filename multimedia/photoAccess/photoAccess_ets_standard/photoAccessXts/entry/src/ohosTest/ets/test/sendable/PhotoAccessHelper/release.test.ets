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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'sendableReleaseTest';

async function releaseSendablePromiseTest(done: Function) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    await sendablePhAccessHelper.release();
    done();
  } catch (error) {
    console.info(TAG, `release failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

export default function sendablePhotoAccessHelperReleaseTest() {
  describe('sendablePhotoAccessHelperReleaseTest', () => {
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
     * @tc.name   release_sendable_promise_001
     * @tc.number SENDABLE_PHOTO_ACCESS_HELPER_RELEASE_SENDABLE_001
     * @tc.desc   promise, release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_sendable_promise_001';
      console.info(TAG, testName);
      await releaseSendablePromiseTest(done);
    })
  })
}