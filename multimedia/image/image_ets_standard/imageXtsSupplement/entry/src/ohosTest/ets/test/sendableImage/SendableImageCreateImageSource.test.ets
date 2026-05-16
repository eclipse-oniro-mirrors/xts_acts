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

import common from '@ohos.app.ability.common';
import { sendableImage } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { JSON } from '@kit.ArkTS';

const TAG = 'ImageSendableImagecreateImageSource';


export default function SendableImagecreateImageSourceTest() {
  describe('SendableImagecreateImageSourceTest', () => {

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
     * @tc.number  IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_001
     * @tc.name    IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_001
     * @tc.desc    Test createImageSource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const sendableImageSourceObj: sendableImage.ImageSource = sendableImage.createImageSource("");
        console.info(TAG, testName, 'createImageSource successful', JSON.stringify(sendableImageSourceObj),
          sendableImageSourceObj);
        expect(sendableImageSourceObj).assertUndefined();
        done();
      } catch (error) {
        console.info(TAG, testName, 'createImageSource fail', error);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number  IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_002
     * @tc.name    IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_002
     * @tc.desc    Test createImageSource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const sendableImageSourceObj: sendableImage.ImageSource = sendableImage.createImageSource(null as ESObject as ArrayBuffer);
        console.info(TAG, testName, 'createImageSource successful', JSON.stringify(sendableImageSourceObj),
          sendableImageSourceObj);
        expect(sendableImageSourceObj).assertUndefined();
        done();
      } catch (error) {
        console.info(TAG, testName, 'createImageSource fail', error);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.number  IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_003
     * @tc.name    IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_003
     * @tc.desc    Test createImageSource
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_SENDABLE_IMAGE_CREATE_IMAGE_SOURCE_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      const path = 'file://' + testContext.filesDir + "/" + "bluesky.jpg";
      console.info(TAG, testName, 'image case filePath is ' + path);
      try {
        const sendableImageSourceObj: sendableImage.ImageSource = sendableImage.createImageSource(undefined as ESObject as ArrayBuffer);
        console.info(TAG, testName, 'createImageSource successful', JSON.stringify(sendableImageSourceObj),
          sendableImageSourceObj);
        expect(sendableImageSourceObj).assertUndefined();
        done();
      } catch (error) {
        console.info(TAG, testName, 'createImageSource fail', error);
        expect().assertFail()
        done();
      }
    })
  })
}