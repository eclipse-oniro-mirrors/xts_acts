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

const TAG = LOG_TAG + 'scaleSync';

async function scaleSyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions, scaleX: number,
  scaleY: number
) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.scaleSync(scaleX, scaleY);
      done()
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function scaleSyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  scaleX: ESObject, scaleY: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.scaleSync(scaleX, scaleY);
      done()
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

export default function sendableScaleSyncTest() {
  describe('sendableScaleSyncTest', () => {

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
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_001
     * @tc.name      : scaleSync_sendable_promise_001
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('scaleSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      await scaleSyncPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_002
     * @tc.name      : scaleSync_sendable_promise_002
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('scaleSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = 0;
      let scaleY: number = 0;
      await scaleSyncPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_003
     * @tc.name      : scaleSync_sendable_promise_003
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('scaleSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = 99;
      let scaleY: number = 99;
      await scaleSyncPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_004
     * @tc.name      : scaleSync_sendable_promise_004
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('scaleSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = -1;
      let scaleY: number = -10;
      await scaleSyncPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_005
     * @tc.name      : scaleSync_abnormal_sendable_promise_001
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('scaleSync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = NaN;
      let scaleY = NaN;
      await scaleSyncAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_006
     * @tc.name      : scaleSync_abnormal_sendable_promise_002
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('scaleSync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = null;
      let scaleY = null;
      await scaleSyncAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_007
     * @tc.name      : scaleSync_abnormal_sendable_promise_003
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('scaleSync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = undefined;
      let scaleY = undefined;
      await scaleSyncAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_SCALE_SYNC_008
     * @tc.name      : scaleSync_abnormal_sendable_promise_004
     * @tc.desc      : scaleSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('scaleSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'scaleSync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = '0';
      let scaleY = '0';
      await scaleSyncAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })*/
  })
}

