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

const TAG = LOG_TAG + 'convertToPixelMap';

async function convertToPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    let pixelMap: image.PixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function convertToPixelMapAbnormalPromiseTest(done: Function, testName: string, sendablePixelMap: ESObject) {
  try {
    let pixelMap: image.PixelMap = sendableImage.convertToPixelMap(sendablePixelMap);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error?.code == ErrorCode.Image_Initialization_Abnormal).assertTrue();
      done();
    } else {
      expect(error == ErrorCode.Image_Initialization_Abnormal).assertTrue();
      done();
    }
  }
}

export default function sendableConvertToPixelMapTest() {
  describe('sendableConvertToPixelMapTest', () => {

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
     * @tc.name   sendableImage_convertToPixelMap_sendable_promise_001
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_001
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await convertToPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_convertToPixelMap_sendable_promise_002
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_002
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(4000000);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await convertToPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_convertToPixelMap_sendable_promise_003
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_003
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_sendable_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(4000000);
      let opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await convertToPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_convertToPixelMap_abnormal_sendable_promise_001
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_004
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_abnormal_sendable_promise_001';
      const sendablePixelMap: ESObject = {};
      await convertToPixelMapAbnormalPromiseTest(done, testName, sendablePixelMap);
    })

    /**
     * @tc.name   sendableImage_convertToPixelMap_abnormal_sendable_promise_002
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_005
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_abnormal_sendable_promise_002';
      const sendablePixelMap: ESObject = undefined;
      await convertToPixelMapAbnormalPromiseTest(done, testName, sendablePixelMap);
    })

    /**
     * @tc.name   sendableImage_convertToPixelMap_abnormal_sendable_promise_003
     * @tc.number SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_PROMISE_006
     * @tc.desc   sendableImage_convertToPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_convertToPixelMap_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertToPixelMap_abnormal_sendable_promise_003';
      const sendablePixelMap: ESObject = null;
      await convertToPixelMapAbnormalPromiseTest(done, testName, sendablePixelMap);
    })
  })
}