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
import { image } from '@kit.ImageKit';
import { ErrorCode } from '../../CommonErrorCode';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPixelMap';

async function createPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = await sendableImage.createPixelMap(color, opts)
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapAbnormalPromiseTest(done: Function, testName: string, color: ESObject,
  opts: ESObject) {
  try {
    let pixelMap = await sendableImage.createPixelMap(color, opts)
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error & error.code) {
      expect(error.code == ErrorCode.Operation_Failed).assertTrue();
      done();
    } else {
      expect(error == ErrorCode.Operation_Failed).assertTrue();
      done();
    }
  }
}

export default function sendableCreatePixelMap() {
  describe('sendableCreatePixelMap', () => {

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
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_001
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_001
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_002
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_002
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_003
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_003
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_004
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_004
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_005
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_005
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_006
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_006
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_007
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_007
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_008
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_008
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_009
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_009
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV21, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_010
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_010
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV12, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_011  //TODO error为 62980096 code为undefined
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_011
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMap_sendable_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_012 //TODO error为 62980096 code为undefined
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_012
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMap_sendable_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_013 //TODO error为 62980096 code为undefined
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_013
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMap_sendable_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_014
     * @tc.name      : sendableImage_createPixelMap_sendable_promise_014
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMap_sendable_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      await createPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_015
     * @tc.name      : createPixelMap_abnormal_sendable_promise_001
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMap_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_abnormal_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_016
     * @tc.name      : createPixelMap_abnormal_sendable_promise_002
     * @tc.desc      : sendableImage_createPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMap_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_abnormal_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(0);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts);
    })
  })
}