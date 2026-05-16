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

const TAG = LOG_TAG + 'rotateSync';

async function rotateSyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  angle: number) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.rotateSync(angle);
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function rotateSyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  angle: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.rotateSync(angle);
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Parameter || error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    } else {
      expect(error == ErrorCode.Invalid_Image_Parameter || error == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    }
    done();
  }
}

export default function sendableRotateSyncTest() {
  describe('sendableRotateSyncTest', () => {

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
     * @tc.name   rotateSync_sendable_promise_001
     * @tc.number PIXEL_MAP_ROTATE_SYNC_001
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let angle: number = 0;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_sendable_promise_002
     * @tc.number PIXEL_MAP_ROTATE_SYNC_002
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle: number = 90.0;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_sendable_promise_003
     * @tc.number PIXEL_MAP_ROTATE_SYNC_003
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle: number = 360;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_sendable_promise_004
     * @tc.number PIXEL_MAP_ROTATE_SYNC_004
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle: number = -360;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_sendable_promise_005
     * @tc.number PIXEL_MAP_ROTATE_SYNC_005
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle: number = 9999.99;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_sendable_promise_006
     * @tc.number PIXEL_MAP_ROTATE_SYNC_006
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('rotateSync_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle: number = -9999.99;
      await rotateSyncPromiseTest(done, testName, opts, angle);
    })

    /**
     * @tc.name   rotateSync_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_ROTATE_SYNC_007
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('rotateSync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle = NaN;
      await rotateSyncAbnormalPromiseTest(done, testName, opts, angle);
    })*/

    /**
     * @tc.name   rotateSync_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_ROTATE_SYNC_008
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('rotateSync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle = undefined;
      await rotateSyncAbnormalPromiseTest(done, testName, opts, angle);
    })*/

    /**
     * @tc.name   rotateSync_abnormal_sendable_promise_003
     * @tc.number PIXEL_MAP_ROTATE_SYNC_009
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('rotateSync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle = undefined;
      await rotateSyncAbnormalPromiseTest(done, testName, opts, angle);
    })*/

    /**
     * @tc.name   rotateSync_abnormal_sendable_promise_004
     * @tc.number PIXEL_MAP_ROTATE_SYNC_010
     * @tc.desc   rotateSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('rotateSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'rotateSync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let angle = '0';
      await rotateSyncAbnormalPromiseTest(done, testName, opts, angle);
    })*/
  })
}