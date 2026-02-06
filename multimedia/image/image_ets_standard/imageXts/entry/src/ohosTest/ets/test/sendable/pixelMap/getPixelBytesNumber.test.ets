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

const TAG = LOG_TAG + 'getPixelBytesNumber';

async function getPixelBytesNumberPromiseTest(done: Function, testName: string, opts: image.InitializationOptions) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      let rowCount: number = await sendablePixelMap.getPixelBytesNumber();
      expect(JSON.stringify(rowCount) !== undefined).assertTrue();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableGetPixelBytesNumberTest() {
  describe('sendableGetPixelBytesNumberTest', () => {

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
     * @tc.name   getPixelBytesNumber_sendable_promise_001
     * @tc.number PIXEL_MAP_GET_PIXEL_BYTES_NUMBER_001
     * @tc.desc   getPixelBytesNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumber_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getPixelBytesNumber_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await getPixelBytesNumberPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   getPixelBytesNumber_sendable_promise_002
     * @tc.number PIXEL_MAP_GET_PIXEL_BYTES_NUMBER_001
     * @tc.desc   getPixelBytesNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumber_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getPixelBytesNumber_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      await getPixelBytesNumberPromiseTest(done, testName, opts);
    })
  })
}