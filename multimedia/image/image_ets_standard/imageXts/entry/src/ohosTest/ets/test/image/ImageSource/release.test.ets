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
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs';

const TAG = LOG_TAG + 'release';

async function releasePromiseTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    let file = await fs.access(path);
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    await imageSourceApi.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function releaseCallbackTest(done: Function, testName: string, pathUri: string) {
  try {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const path = 'file://' + testContext.filesDir + "/" + pathUri;
    const imageSourceApi: image.ImageSource = await image.createImageSource(path);
    imageSourceApi.release((err: BusinessError) => {
      if (err) {
        expect().assertFail();
      } else {
        console.info(`release success`);
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function imageSourceReleaseTest() {
  describe('imageSourceReleaseTest', () => {

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
     * @tc.name      : imageSource_release_promise_001
     * @tc.desc      : imageSource_release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_release_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_release_promise_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      await copyImageToSandbox(fileName, path);
      await releasePromiseTest(done, testName, path);
    })

    /**
     * @tc.number    : IMAGE_SOURCE_RELEASE_002
     * @tc.name      : imageSource_release_callback_001
     * @tc.desc      : imageSource_release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('imageSource_release_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSource_release_callback_001';
      const fileName = 'test.jpeg';
      const path = new Date().getTime() + 'test.jpeg';
      await copyImageToSandbox(fileName, path);
      await releaseCallbackTest(done, testName, path);
    })
  })
}