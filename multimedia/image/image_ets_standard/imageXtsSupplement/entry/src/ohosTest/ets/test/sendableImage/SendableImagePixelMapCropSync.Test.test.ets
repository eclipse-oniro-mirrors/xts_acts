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


const TAG = LOG_TAG + 'SendableImagePixelMapCropSyncTestSupp';



export default function SendableImagePixelMapCropSyncTest() {
  describe('SendableImagePixelMapCropSyncTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('empty_value','')
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('empty_value')

    });

    /**
     * @tc.name   SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001
     * @tc.number SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001
     * @tc.desc   第1个参数为空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_001';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        console.info(TAG,'sendablePixelMap')
        let pixelMap : image.PixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        console.info(TAG,'pixelMap')
        pixelMap.cropSync(AppStorage.get('empty_value'))
        console.info(TAG,'Success cropSync')
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002
     * @tc.number SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002
     * @tc.desc   第1个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_002';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        console.info(TAG,'sendablePixelMap')
        let pixelMap : image.PixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        console.info(TAG,'pixelMap')
        pixelMap.cropSync(null)
        console.info(TAG,'Success cropSync')
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003
     * @tc.number SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_CROP_SYNC_003';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
        console.info(TAG,'sendablePixelMap')
        let pixelMap : image.PixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
        pixelMap.cropSync(undefined);
        console.info(TAG, 'Success cropSync')
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
  });
}