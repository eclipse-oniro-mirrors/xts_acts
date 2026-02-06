

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

import { image, sendableImage } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Size } from '@ohos/hypium';
import { LOG_TAG } from '../common';

const TAG = LOG_TAG + 'SendableImageSourceCreatePixelMapTestSupp';



export default function SendableImageSourceCreatePixelMapTest() {
  describe('SendableImageSourceCreatePixelMapTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('emptyString','')
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString')

    });

    /**
     * @tc.name   SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001
     * @tc.number SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001
     * @tc.desc   第1个参数为空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001';
      try {
        const buf: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'buf')
        const sendableImageSource: sendableImage.ImageSource = sendableImage.createImageSource(buf);
        console.info(TAG,'sendableImageSource')
        await sendableImageSource.createPixelMap(AppStorage.get('emptyString'))
        console.info(TAG,'Success createPixelMap')
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect(error.code).assertEqual(undefined)
        done();
      }
    });

    /**
     * @tc.name   SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002
     * @tc.number SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002
     * @tc.desc   第1个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002';
      try {
        const buf: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'buf')
        const sendableImageSource: sendableImage.ImageSource = sendableImage.createImageSource(buf);
        console.info(TAG,'sendableImageSource')
        await sendableImageSource.createPixelMap(null as ESObject)
        console.info(TAG,'Success createPixelMap')
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect(error.code).assertEqual(undefined)
        done();
      }
    });

    /**
     * @tc.name   SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003
     * @tc.number SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003';
      try {
        const buf: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'buf')
        const sendableImageSource: sendableImage.ImageSource = sendableImage.createImageSource(buf);
        console.info(TAG,'sendableImageSource')
        await sendableImageSource.createPixelMap(undefined as ESObject)
        console.info(TAG,'Success createPixelMap')
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect(error.code).assertEqual(undefined)
        done();
      }
    });
  });
}