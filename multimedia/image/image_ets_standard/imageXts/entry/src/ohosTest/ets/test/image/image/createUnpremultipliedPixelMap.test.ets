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

const TAG = LOG_TAG + 'createUnpremultipliedPixelMap';

async function createUnpremultipliedPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  optsForPre: image.InitializationOptions, optsForUnpre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createUnpremultipliedPixelMapCallbackTest(done: Function, testName: string, color: ArrayBuffer,
  optsForPre: image.InitializationOptions, optsForUnpre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let srcPixelmap = image.createPixelMapSync(color, optsForPre);
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
      if (error) {
        console.error(TAG, `Failed to convert pixelmap, error code is ${error}`);
        expect().assertFail();
        done();
      } else {
        console.info(TAG, 'Succeeded in converting pixelmap.');
        done();
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function createUnpremultipliedPixelMapSyncTest() {
  describe('createUnpremultipliedPixelMapSyncTest', () => {

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
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_001
     * @tc.name      : createUnpremultipliedPixelMap_promise_001
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_002
     * @tc.name      : createUnpremultipliedPixelMap_promise_002
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNKNOWN
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_003
     * @tc.name      : createUnpremultipliedPixelMap_promise_003
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_004
     * @tc.name      : createUnpremultipliedPixelMap_promise_004
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_005
     * @tc.name      : createUnpremultipliedPixelMap_promise_005
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_006
     * @tc.name      : createUnpremultipliedPixelMap_promise_006
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_007
     * @tc.name      : createUnpremultipliedPixelMap_promise_007
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_008
     * @tc.name      : createUnpremultipliedPixelMap_promise_008
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_009
     * @tc.name      : createUnpremultipliedPixelMap_promise_009
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_010
     * @tc.name      : createUnpremultipliedPixelMap_promise_010
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_011
     * @tc.name      : createUnpremultipliedPixelMap_promise_011
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_012
     * @tc.name      : createUnpremultipliedPixelMap_promise_012
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_013
     * @tc.name      : createUnpremultipliedPixelMap_promise_013
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapPromiseTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_014
     * @tc.name      : createUnpremultipliedPixelMap_callback_001
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_001';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_015
     * @tc.name      : createUnpremultipliedPixelMap_callback_002
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_002';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNKNOWN
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_016
     * @tc.name      : createUnpremultipliedPixelMap_callback_003
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_003';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_017 //TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_004
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_004';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_018 //TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_005
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_005';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_019
     * @tc.name      : createUnpremultipliedPixelMap_callback_006
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createUnpremultipliedPixelMap_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_006';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_020 //TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_007
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_007';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_021 //TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_008
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_008';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_022 //TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_009
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_009';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_023 //TODO 超时
     * @tc.name      : createUnpremultipliedPixelMap_callback_010
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_010';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_024 //TODO 超时
     * @tc.name      : createUnpremultipliedPixelMap_callback_011
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_011';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_025//TODO 超时
     * @tc.name      : createUnpremultipliedPixelMap_callback_012
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_012';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_UN_PREMULTIPLIED_PIXEL_MAP_026//TODO 中断
     * @tc.name      : createUnpremultipliedPixelMap_callback_013
     * @tc.desc      : createUnpremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createUnpremultipliedPixelMap_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createUnpremultipliedPixelMap_callback_013';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createUnpremultipliedPixelMapCallbackTest(done, testName, color, optsForPre, optsForUnpre);
    })*/
  })
}