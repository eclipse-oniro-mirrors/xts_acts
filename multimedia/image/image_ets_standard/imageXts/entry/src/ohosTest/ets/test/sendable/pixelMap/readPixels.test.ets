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

const TAG = LOG_TAG + 'readPixels';

async function readPixelsPromiseTest(done: Function, testName: string, area: image.PositionArea,
) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.readPixels(area);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function readPixelsAbnormalPromiseTest(done: Function, testName: string, area: image.PositionArea,
) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.readPixels(area);
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

export default function sendableReadPixelsTest() {
  describe('sendableReadPixelsTest', () => {

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
     * @tc.number    : PIXEL_MAP_READ_PIXELS_001
     * @tc.name      : readPixels_sendable_promise_001
     * @tc.desc      : readPixels
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('readPixels_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'readPixels_sendable_promise_001';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 0,
        stride: 8,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsPromiseTest(done, testName, area);
    })

    /**
     * @tc.number    : PIXEL_MAP_READ_PIXELS_002 //TODO 传入异常参数报错62980115 不规范 文档没有错误码
     * @tc.name      : readPixels_abnormal_sendable_promise_001
     * @tc.desc      : readPixels
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('readPixels_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'readPixels_abnormal_sendable_promise_001';
      const area: image.PositionArea = {
        pixels: new ArrayBuffer(8),
        offset: 8,
        stride: 0,
        region: { size: { height: 1, width: 2 }, x: 0, y: 0 }
      };
      await readPixelsAbnormalPromiseTest(done, testName, area);
    })
  })
}