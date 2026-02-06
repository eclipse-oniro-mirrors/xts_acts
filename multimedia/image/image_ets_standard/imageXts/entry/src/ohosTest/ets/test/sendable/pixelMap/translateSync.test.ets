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

const TAG = LOG_TAG + 'translateSync';

async function translateSyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  translateX: number, translateY: number) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.translateSync(translateX, translateY);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function translateSyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  translateX: ESObject, translateY: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      await sendablePixelMap.translateSync(translateX, translateY);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Parameter || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    } else {
      expect(error == ErrorCode.Invalid_Image_Parameter || error == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    }
    done();
  }
}

export default function sendableTranslateSyncTest() {
  describe('sendableTranslateSyncTest', () => {

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
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_001
     * @tc.name      : translateSync_sendable_promise_001
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let translateX: number = 2.0;
      let translateY: number = 1.0;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_002
     * @tc.name      : translateSync_sendable_promise_002
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let translateX: number = 360;
      let translateY: number = 360;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_003
     * @tc.name      : translateSync_sendable_promise_003
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = 0;
      let translateY: number = 0;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_004
     * @tc.name      : translateSync_sendable_promise_004
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -10;
      let translateY: number = -10;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_005
     * @tc.name      : translateSync_sendable_promise_005
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -99;
      let translateY: number = 99;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_006
     * @tc.name      : translateSync_sendable_promise_006
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translateSync_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -9999;
      let translateY: number = 9999;
      await translateSyncPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_007
     * @tc.name      : translateSync_abnormal_sendable_promise_001
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('translateSync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = NaN;
      let translateY = NaN;
      await translateSyncAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_008
     * @tc.name      : translateSync_abnormal_sendable_promise_002
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('translateSync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = null;
      let translateY = null;
      await translateSyncAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_009
     * @tc.name      : translateSync_abnormal_sendable_promise_003
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('translateSync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = undefined;
      let translateY = undefined;
      await translateSyncAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_SYNC_010
     * @tc.name      : translateSync_abnormal_sendable_promise_004
     * @tc.desc      : translateSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('translateSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'translateSync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = 'dad';
      let translateY = 'dad';
      await translateSyncAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })*/
  })
}