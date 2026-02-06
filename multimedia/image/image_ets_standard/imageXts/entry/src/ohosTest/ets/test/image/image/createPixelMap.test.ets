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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPixelMap';

async function createPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = await image.createPixelMap(color, opts)
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapCallbackTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
      if (error) {
        console.error(TAG, `Failed to create pixelmap. code is ${error.code}, message is ${error.message}`);
        expect().assertFail()
        done();
      } else {
        console.info(TAG, 'Succeeded in creating pixelmap.');
        expect(pixelMap.isEditable === opts.editable).assertTrue();
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail()
    done();
  }
}

export default function createPixelMapTest() {
  describe('createPixelMapTest', () => {

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
     * @tc.name   createPixelMap_promise_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_001
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_002
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(1000 * 1000 * 4);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 1000, width: 1000 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_003
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_004
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_005
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_006
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_007
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_008
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_009
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_010
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_promise_011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_011
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('createPixelMap_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.name   createPixelMap_promise_012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_012
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('createPixelMap_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.name   createPixelMap_promise_013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_013
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_014
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_015
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_016
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_017
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_018
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_019
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_020
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_021
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_022
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_023
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })

    /**
     * @tc.name   createPixelMap_callback_011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_024
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('createPixelMap_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })*/

    /**
     * @tc.name   createPixelMap_callback_012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_025
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('createPixelMap_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })*/

    /**
     * @tc.name   createPixelMap_callback_013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_026
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts);
    })
  })
}