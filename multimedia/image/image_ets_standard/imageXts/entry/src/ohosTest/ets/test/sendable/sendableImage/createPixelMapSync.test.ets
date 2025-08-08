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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'createPixelMapSync';

async function createPixelMapSyncPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = sendableImage.createPixelMapSync(color, opts);
    if (pixelMap !== undefined) {
      expect(pixelMap.isEditable === opts.editable).assertTrue();
      done();
    } else {
      console.info(TAG, `failed; error: pixelMap is undefined`, JSON.stringify(pixelMap), testName);
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapSyncAbnormalPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = sendableImage.createPixelMapSync(color, opts);
    if (pixelMap !== undefined) {
      expect(pixelMap.isEditable === opts.editable).assertTrue();
      done();
    } else {
      console.info(TAG, `failed; error: pixelMap is undefined`, JSON.stringify(pixelMap), testName);
      expect().assertFail();
      done();
    }
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


export default function sendableCreatePixelMapSyncTest() {
  describe('sendableCreatePixelMapSyncTest', () => {

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
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_001
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_001
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_002
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_002
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_003
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_003
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_004
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_004
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_005
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_005
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_006
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_006
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_007
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_007
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_008
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_008
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_009
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_009
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_010
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_010
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV21, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_011
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_011
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV12, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_012
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_012
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMapSync_sendable_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_013
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_013
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMapSync_sendable_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_014
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_014
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMapSync_sendable_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_015
     * @tc.name      : sendableImage_createPixelMapSync_sendable_promise_015
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createPixelMapSync_sendable_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_sendable_promise_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_016
     * @tc.name      : sendableImage_createPixelMapSync_abnormal_sendable_promise_004
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMapSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    :SENDABLE_IMAGE_CREATE_PIXEL_MAP_SYNC_017
     * @tc.name      : sendableImage_createPixelMapSync_abnormal_sendable_promise_005
     * @tc.desc      : sendableImage_createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createPixelMapSync_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(0);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts);
    })*/
  })
}