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

const TAG = LOG_TAG + 'cropSync';

async function cropSyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  region: image.Region) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.cropSync(region);
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function cropSyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  region: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.cropSync(region);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableCropSyncTest() {
  describe('sendableCropSyncTest', () => {

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
     * @tc.name   cropSync_sendable_promise_001
     * @tc.number PIXEL_MAP_CROP_SYNC_001
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
      await cropSyncPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_sendable_promise_002
     * @tc.number PIXEL_MAP_CROP_SYNC_002
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 60, width: 40 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
      await cropSyncPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_sendable_promise_003
     * @tc.number PIXEL_MAP_CROP_SYNC_003
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: image.Region = { x: -10, y: -10, size: { height: 100, width: 100 } };
      await cropSyncPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_sendable_promise_004
     * @tc.number PIXEL_MAP_CROP_SYNC_004
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      await cropSyncPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_sendable_promise_005
     * @tc.number PIXEL_MAP_CROP_SYNC_005
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: image.Region = { x: 500, y: 500, size: { height: 500, width: 500 } };
      await cropSyncPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_CROP_SYNC_006
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 0, width: 0 } };
      await cropSyncAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_CROP_SYNC_007
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: image.Region = { x: -10, y: -10, size: { height: -10, width: -10 } };
      await cropSyncAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_abnormal_sendable_promise_003
     * @tc.number PIXEL_MAP_CROP_SYNC_008
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: ESObject = {};
      await cropSyncAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_abnormal_sendable_promise_004
     * @tc.number PIXEL_MAP_CROP_SYNC_009
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: ESObject = undefined;
      await cropSyncAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.name   cropSync_abnormal_sendable_promise_005
     * @tc.number PIXEL_MAP_CROP_SYNC_010
     * @tc.desc   cropSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cropSync_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'cropSync_abnormal_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      let region: ESObject = null;
      await cropSyncAbnormalPromiseTest(done, testName, opts, region);
    })
  })
}