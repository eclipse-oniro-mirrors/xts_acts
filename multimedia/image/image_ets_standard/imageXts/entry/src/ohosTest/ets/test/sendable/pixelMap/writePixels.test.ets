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

const TAG = LOG_TAG + 'writePixels';

async function writePixelsPromiseTest(done: Function, testName: string, area: image.PositionArea,
) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.writePixels(area);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function writePixelsAbnormalPromiseTest(done: Function, testName: string, area: image.PositionArea,
) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    let bufferArr: Uint8Array = new Uint8Array(area.pixels);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = i + 1;
    }
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.writePixels(area);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error?.code).assertEqual(ErrorCode.Invalid_Image_Parameter);
      done();
    } else {
      expect(error).assertEqual(ErrorCode.Invalid_Image_Parameter);
      done();
    }
  }
}

export default function sendableWritePixelsTest() {
  describe('sendableWritePixelsTest', () => {

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
     * @tc.name   writePixels_sendable_promise_001
     * @tc.number PIXEL_MAP_WRITE_PIXELS_001
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('writePixels_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixels_sendable_promise_001';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(96),
        offset: 0,
        stride: 24,
        region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
      };
      await writePixelsPromiseTest(done, testName, area);
    })

    /**
     * @tc.name   writePixels_sendable_promise_002
     * @tc.number PIXEL_MAP_WRITE_PIXELS_002
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('writePixels_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixels_sendable_promise_002';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await writePixelsPromiseTest(done, testName, area);
    })

    /**
     * @tc.name   writePixels_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_WRITE_PIXELS_003
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('writePixels_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixels_abnormal_sendable_promise_001';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 80,
        region: { size: { height: 10, width: 20 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalPromiseTest(done, testName, area);
    })

    /**
     * @tc.name   writePixels_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_WRITE_PIXELS_004
     * @tc.desc   writePixels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('writePixels_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'writePixels_abnormal_sendable_promise_002';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 80,
        region: { size: { height: 10, width: 20 }, x: 0, y: 0 }
      };
      await writePixelsAbnormalPromiseTest(done, testName, area);
    })
  })
}