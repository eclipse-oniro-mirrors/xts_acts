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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll, Size } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'ImagePixelMapCropTestSupp';


export default function ImagePixelMapCropTest() {
  describe('ImagePixelMapCropTest', () => {
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
     * @tc.name   IMAGE_AUXILIARY_PICTURE_CROP_REGION_001
     * @tc.number IMAGE_AUXILIARY_PICTURE_CROP_REGION_001
     * @tc.desc   第1个参数为空对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_AUXILIARY_PICTURE_CROP_REGION_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_CROP_REGION_001';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(AppStorage.get('emptyString'))
        console.info(TAG,'Success crop')
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PIXEL_MAP_CROP_002
     * @tc.number IMAGE_PIXEL_MAP_CROP_002
     * @tc.desc   第1个参数为null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_PIXEL_MAP_CROP_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CROP_002';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(null)
        console.info(TAG,'Success crop')
        done();
      } catch (error) {
        console.info(TAG, testName, `Null region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PIXEL_MAP_CROP_003
     * @tc.number IMAGE_PIXEL_MAP_CROP_003
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_PIXEL_MAP_CROP_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CROP_003';
      const path = 'test_exif.jpg';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(undefined);
        console.info(TAG,'Success crop')
        done();
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });

    /**
     * @tc.name   IMAGE_PIXEL_MAP_CROP_004
     * @tc.number IMAGE_PIXEL_MAP_CROP_004
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_PIXEL_MAP_CROP_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CROP_004';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(null, (err: BusinessError) => {
          console.info(TAG, 'Success crop')
          if (err) {
            console.error(`Failed to crop pixelmap. code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("Succeeded in cropping pixelmap.");
          }
          done()
        })
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PIXEL_MAP_CROP_005
     * @tc.number IMAGE_PIXEL_MAP_CROP_005
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_PIXEL_MAP_CROP_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CROP_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(undefined, (err: BusinessError) => {
          console.info(TAG, 'Success crop')
          if (err) {
            console.error(`Failed to crop pixelmap. code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("Succeeded in cropping pixelmap.");
          }
          done()
        })
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   IMAGE_PIXEL_MAP_CROP_006
     * @tc.number IMAGE_PIXEL_MAP_CROP_006
     * @tc.desc   第1个参数为undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IMAGE_PIXEL_MAP_CROP_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CROP_006';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.crop(AppStorage.get('emptyString'), (err: BusinessError) => {
          console.info(TAG, 'Success crop')
          if (err) {
            console.error(`Failed to crop pixelmap. code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("Succeeded in cropping pixelmap.");
          }
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `Undefined region test failed; error: ${error}, code: ${error.code}`);
        expect().assertFail()
        done();
      }
    });
  });
}