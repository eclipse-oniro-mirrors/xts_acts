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

import { sendableImage } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG, copyImageToSandbox } from '../../common';

const TAG = LOG_TAG + 'release';

async function releasePromiseTest(done: Function, testName: string, path: string,) {
  try {
    const sendableImageSourceApi: sendableImage.ImageSource = sendableImage.createImageSource(path);
    sendableImageSourceApi.release().then(() => {
      console.info('Succeeded in releasing the image source instance.');
      done();
    }).catch((error: BusinessError) => {
      console.error(TAG,
        `Failed to release the image source instance. code ${error.code}, message is ${error.message}`);
      expect().assertFail();
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertTrue();
    done();
  }
}

export default function sendableImageSourceReleaseTest() {
  describe('sendableImageSourceReleaseTest', () => {

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
     * @tc.name   imageSourceRelease_sendable_promise_001
     * @tc.number IMAGE_SOURCE_IMAGE_SOURCE_RELEASE_001
     * @tc.desc   release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSourceRelease_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSourceRelease_sendable_promise_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.jpg'
      const path = 'Abc123.jpg'
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      await copyImageToSandbox(fileName, path)
      await releasePromiseTest(done, testName, pathUrl)
    })

    /**
     * @tc.name   imageSourceRelease_sendable_promise_002
     * @tc.number IMAGE_SOURCE_IMAGE_SOURCE_RELEASE_002
     * @tc.desc   release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSourceRelease_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSourceRelease_sendable_promise_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test7.png';
      const path = 'Abc123.png';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      await copyImageToSandbox(fileName, path);
      await releasePromiseTest(done, testName, pathUrl);
    })

    /**
     * @tc.name   imageSourceRelease_sendable_promise_003
     * @tc.number IMAGE_SOURCE_IMAGE_SOURCE_RELEASE_003
     * @tc.desc   release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('imageSourceRelease_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageSourceRelease_sendable_promise_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const fileName = 'test.svg';
      const path = '全是汉字的.svg';
      const pathUrl: string = 'file://' + testContext.filesDir + "/" + path;
      await copyImageToSandbox(fileName, path);
      await releasePromiseTest(done, testName, pathUrl);
    })
  })
}