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

const TAG = LOG_TAG + 'writePixelsSync';

async function writePixelsSyncPromiseTest(done: Function, testName: string, area: image.PositionArea) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.writePixelsSync(area);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableWritePixelsSyncTest() {
  describe('sendableWritePixelsSyncTest', () => {

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
     * @tc.number    : PIXEL_MAP_WRITE_PIXELS_SYNC_001
     * @tc.name      : writePixelsSync_sendable_promise_001
     * @tc.desc      : writePixelsSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('writePixelsSync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixelsSync_sendable_promise_001';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsSyncPromiseTest(done, testName, area);
    })

    /**
     * @tc.number    : PIXEL_MAP_WRITE_PIXELS_SYNC_002 //TODO 传入错误的参数 不会报错 但是在writePixels中会报错 但是返回的格式不对
     * @tc.name      : writePixelsSync_sendable_promise_002
     * @tc.desc      : writePixelsSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('writePixelsSync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixelsSync_sendable_promise_002';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 8,
        stride: 0,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsSyncPromiseTest(done, testName, area);
    })

    /**
     * @tc.number    : PIXEL_MAP_WRITE_PIXELS_SYNC_003 //TODO 传入错误的参数 不会报错 但是在writePixels中会报错 但是返回的格式不对
     * @tc.name      : writePixelsSync_sendable_promise_003
     * @tc.desc      : writePixelsSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('writePixelsSync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixelsSync_sendable_promise_003';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 1000,
        stride: 1000,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsSyncPromiseTest(done, testName, area)
    })

    /**
     * @tc.number    : PIXEL_MAP_WRITE_PIXELS_SYNC_004 //TODO 传入错误的参数 不会报错 但是在writePixels中会报错 但是返回的格式不对
     * @tc.name      : writePixelsSync_sendable_promise_004
     * @tc.desc      : writePixelsSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('writePixelsSync_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixelsSync_sendable_promise_004';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: -1,
        stride: -1,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsSyncPromiseTest(done, testName, area)
    })

    /**
     * @tc.number    : PIXEL_MAP_WRITE_PIXELS_SYNC_005 //TODO 传入错误的参数 不会报错 但是在writePixels中会报错 但是返回的格式不对
     * @tc.name      : writePixelsSync_sendable_promise_005
     * @tc.desc      : writePixelsSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('writePixelsSync_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixelsSync_sendable_promise_005';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(0),
        offset: 0,
        stride: 0,
        region: { size: { height: 0, width: 0 }, x: 0, y: 0 }
      };
      await writePixelsSyncPromiseTest(done, testName, area)
    })
  })
}