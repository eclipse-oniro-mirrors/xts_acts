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
import { LOG_TAG } from '../common';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'ImagePixelMapConvertPixelFormatTestSupp';


export default function ImagePixelMapConvertPixelFormatTest() {
  describe('ImagePixelMapConvertPixelFormatTest', () => {

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
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_001
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_001
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_001';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ASTC_4x4);
        console.info(TAG,'Success convertPixelFormat')
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })



    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_002
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_002
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_002';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.YCBCR_P010);
        console.info(TAG,'Success convertPixelFormat')
        done();
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_003
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_003
     * @tc.desc   枚举覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_003';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.RGBA_1010102);
        console.info(TAG,'Success convertPixelFormat')
        done()
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })

    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_004
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_004
     * @tc.desc   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_004';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.UNKNOWN);
        console.info(TAG,'Success convertPixelFormat')
        done()
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })


    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_005
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_005
     * @tc.desc   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_005';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ARGB_8888);
        console.info(TAG,'Success convertPixelFormat')
        done()
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })



    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_006
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_006
     * @tc.desc   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_006';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.ALPHA_8);
        console.info(TAG,'Success convertPixelFormat')
        done()
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })


    /**
     * @tc.name   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_007
     * @tc.number IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_007
     * @tc.desc   IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_PIXEL_MAP_CONVERT_PIXEL_FORMAT_007';
      const path = 'test8.png';
      try {
        const color: ArrayBuffer = new ArrayBuffer(96);
        console.info(TAG,'color')
        let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
        console.info(TAG,'opts')
        let pixelMap: PixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,'pixelMap')
        pixelMap.convertPixelFormat(image.PixelMapFormat.YCRCB_P010);
        console.info(TAG,'Success convertPixelFormat')
        done()
      } catch (error) {
        console.error(TAG, testName, 'failed; error:', JSON.stringify(error), error.code);
        expect().assertFail()
        done();
      }
    })
  })
}