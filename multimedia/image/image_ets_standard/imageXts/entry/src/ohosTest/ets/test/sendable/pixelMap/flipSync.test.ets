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

const TAG = LOG_TAG + 'flipSync';

async function flipSyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  horizontal: boolean, vertical: boolean) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.flipSync(horizontal, vertical);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function flipSyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  horizontal: ESObject, vertical: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.flipSync(horizontal, vertical);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.PARAM_ERROR_CODE || error.code == ErrorCode.Invalid_Image_Parameter).assertTrue();
    } else {
      expect(error == ErrorCode.PARAM_ERROR_CODE || error == ErrorCode.Invalid_Image_Parameter).assertTrue();
    }
    done();
  }
}

export default function sendableFlipSyncTest() {
  describe('sendableFlipSyncTest', () => {

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
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_001
     * @tc.name      : flipSync_sendable_promise_001
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let horizontal: boolean = false;
      let vertical: boolean = false;
      await flipSyncPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_002
     * @tc.name      : flipSync_sendable_promise_002
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal: boolean = true;
      let vertical: boolean = false;
      await flipSyncPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_003
     * @tc.name      : flipSync_sendable_promise_003
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal: boolean = true;
      let vertical: boolean = true;
      await flipSyncPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_004
     * @tc.name      : flipSync_sendable_promise_004
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal: boolean = false;
      let vertical: boolean = true;
      await flipSyncPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_005
     * @tc.name      : flipSync_abnormal_sendable_promise_001
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal = undefined;
      let vertical = undefined;
      await flipSyncAbnormalPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_006
     * @tc.name      : flipSync_abnormal_sendable_promise_002
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal = NaN;
      let vertical = NaN;
      await flipSyncAbnormalPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_007
     * @tc.name      : flipSync_abnormal_sendable_promise_003
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal = 0;
      let vertical = 1;
      await flipSyncAbnormalPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_008
     * @tc.name      : flipSync_abnormal_sendable_promise_004
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal = null;
      let vertical = null;
      await flipSyncAbnormalPromiseTest(done, testName, opts, horizontal, vertical);
    })

    /**
     * @tc.number    : PIXEL_MAP_FLIP_SYNC_009
     * @tc.name      : flipSync_abnormal_sendable_promise_005
     * @tc.desc      : flipSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('flipSync_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'flipSync_abnormal_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let horizontal = '';
      let vertical = '';
      await flipSyncAbnormalPromiseTest(done, testName, opts, horizontal, vertical);
    })
  })
}