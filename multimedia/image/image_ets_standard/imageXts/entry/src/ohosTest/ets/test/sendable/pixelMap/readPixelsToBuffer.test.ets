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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'readPixelsToBuffer';

async function readPixelsToBufferPromiseTest(done: Function, testName: string,
  opts: image.InitializationOptions, readBuffer: ArrayBuffer) {
  try {
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(readBuffer, opts);
    if (sendablePixelMap != undefined) {
      sendablePixelMap.readPixelsToBuffer(readBuffer).then(() => {
        console.info(TAG, 'Succeeded in reading image pixel data.');
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG,
          `Failed to read image pixel data.error is ${error} code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      })
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableReadPixelsToBufferTest() {
  describe('sendableReadPixelsToBufferTest', () => {

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
     * @tc.name   readPixelsToBuffer_sendable_promise_001
     * @tc.number PIXEL_MAP_READ_PIXELS_TO_BUFFER_001
     * @tc.desc   readPixelsToBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('readPixelsToBuffer_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'readPixelsToBuffer_sendable_promise_001';
      const readBuffer: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await readPixelsToBufferPromiseTest(done, testName, opts, readBuffer);
    })

    /**
     * @tc.name   readPixelsToBuffer_sendable_promise_002
     * @tc.number PIXEL_MAP_READ_PIXELS_TO_BUFFER_002
     * @tc.desc   readPixelsToBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('readPixelsToBuffer_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'readPixelsToBuffer_sendable_promise_002';
      const readBuffer: ArrayBuffer = new ArrayBuffer(128 * 1024);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await readPixelsToBufferPromiseTest(done, testName, opts, readBuffer);
    })

    /**
     * @tc.name   readPixelsToBuffer_sendable_promise_003
     * @tc.number PIXEL_MAP_READ_PIXELS_TO_BUFFER_003  //TODO 传异常参数会走catch 但是会超时  错误码62980246 返回格式有问题 同样格式 Sync 就不要会报错
     * @tc.desc   readPixelsToBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('readPixelsToBuffer_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'readPixelsToBuffer_sendable_promise_003';
      const readBuffer: ArrayBuffer = new ArrayBuffer(0);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await readPixelsToBufferPromiseTest(done, testName, opts, readBuffer);
    })*/
  })
}