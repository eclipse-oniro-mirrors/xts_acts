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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'release';

async function releasePromiseTest(done: Function, testName: string) {
  try {
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    await imagePackerApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function releaseCallbackTest(done: Function, testName: string) {
  try {
    const imagePackerApi: image.ImagePacker = await image.createImagePacker();
    imagePackerApi.release((err: BusinessError) => {
      if (err) {
        console.error(TAG, `Failed to release image packaging.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in releasing image packaging.');
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}


export default function imagePackerReleaseTest() {
  describe('imagePackerReleaseTest', () => {

    beforeAll(async () => {
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
     * @tc.number    : IMAGE_SOURCE_RELEASE_001
     * @tc.name      : imagePacker_release_promise_001
     * @tc.desc      : imagePacker_release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_release_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_release_promise_001';
      await releasePromiseTest(done, testName);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_RELEASE_002
     * @tc.name      : imagePacker_release_callback_001
     * @tc.desc      : imagePacker_release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imagePacker_release_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imagePacker_release_callback_001';
      await releaseCallbackTest(done, testName);
    })
  })
}