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

const TAG = LOG_TAG + 'createPremultipliedPixelMap';

async function createPremultipliedPixelMapCallbackTest(done: Function, testName: string, color: ArrayBuffer,
  optsForUnpre: image.InitializationOptions, optsForPre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
    let dstPixelMap = image.createPixelMapSync(optsForPre);
    image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
      if (error) {
        console.error(TAG, `Failed to convert pixelmap, error code is ${error},${error.code}`, testName);
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

async function createPremultipliedPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  optsForUnpre: image.InitializationOptions, optsForPre: image.InitializationOptions) {
  try {
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
    let dstPixelMap = image.createPixelMapSync(optsForPre);
    await image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function createPremultipliedPixelMapTest() {
  describe('createPremultipliedPixelMapTest', () => {

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
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_001
     * @tc.name      : createPremultipliedPixelMap_callback_001
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPremultipliedPixelMap_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_callback_001';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_002
     * @tc.name      : createPremultipliedPixelMap_callback_002
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPremultipliedPixelMap_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_callback_002';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_003  //TODO  能修改optsForUnpre 里的editable 但是optsForPre editable  不能修改 （应该都不能修改
     * @tc.name      : createPremultipliedPixelMap_callback_003
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPremultipliedPixelMap_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_callback_003';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_004 //TODO 错误码error而不是error.code
     * @tc.name      : createPremultipliedPixelMap_callback_004
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPremultipliedPixelMap_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_callback_004';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_005
     * @tc.name      : createPremultipliedPixelMap_callback_005
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPremultipliedPixelMap_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_callback_005';
      const color: ArrayBuffer = new ArrayBuffer(1000 * 1000 * 4);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 1000, width: 1000 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 1000, width: 1000 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapCallbackTest(done, testName, color, optsForUnpre, optsForPre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_006
     * @tc.name      : createPremultipliedPixelMap_promise_001
     * @tc.desc      : createPremultipliedPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPremultipliedPixelMap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapPromiseTest(done, testName, color, optsForUnpre, optsForPre);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_007 //TODO 在callback返回中 异常会中断 但是在promise中会走错误断言
     * @tc.name      : createPremultipliedPixelMap_promise_002
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPremultipliedPixelMap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapPromiseTest(done, testName, color, optsForUnpre, optsForPre);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PREMULTIPLIED_PIXEL_MAP_008
     * @tc.name      : createPremultipliedPixelMap_promise_003
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPremultipliedPixelMap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPremultipliedPixelMap_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(16);
      let optsForUnpre: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.UNPREMUL
      };
      let optsForPre: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 2, width: 2 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPremultipliedPixelMapPromiseTest(done, testName, color, optsForUnpre, optsForPre);
    })
  })
}