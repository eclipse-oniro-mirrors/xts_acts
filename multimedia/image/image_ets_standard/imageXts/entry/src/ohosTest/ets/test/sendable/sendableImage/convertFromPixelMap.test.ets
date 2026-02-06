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

const TAG = LOG_TAG + 'convertFromPixelMap';

async function convertFromPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMap);
    expect(sendablePixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function convertFromPixelMapAbnormalPromiseTest(done: Function, testName: string, pixelMap: ESObject) {
  try {
    let sendablePixelMap: sendableImage.PixelMap = await sendableImage.convertFromPixelMap(pixelMap);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Image_Initialization_Abnormal).assertTrue();
      done();
    } else {
      expect(error.code == ErrorCode.Image_Initialization_Abnormal).assertTrue();
      done();
    }
  }
}

export default function sendableConvertFromPixelMapTest() {
  describe('sendableConvertFromPixelMapTest', () => {

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
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_001
     * @tc.name      : sendableImage_convertFromPixelMap_sendable_promise_001
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await convertFromPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_002
     * @tc.name      : sendableImage_convertFromPixelMap_sendable_promise_002
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await convertFromPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_003
     * @tc.name      : sendableImage_convertFromPixelMap_sendable_promise_003
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_sendable_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(4000000);
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await convertFromPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_004
     * @tc.name      : sendableImage_convertFromPixelMap_sendable_promise_004
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_sendable_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await convertFromPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_005
     * @tc.name      : sendableImage_convertFromPixelMap_sendable_promise_005
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_sendable_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(0);
      let opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 4 } };
      await convertFromPixelMapPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_006
     * @tc.name      : sendableImage_convertFromPixelMap_abnormal_sendable_promise_001
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_abnormal_sendable_promise_001';
      let pixelMap: ESObject = null;
      await convertFromPixelMapAbnormalPromiseTest(done, testName, pixelMap);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_007
     * @tc.name      : sendableImage_convertFromPixelMap_abnormal_sendable_promise_002
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_abnormal_sendable_promise_002';
      let pixelMap: ESObject = undefined;
      await convertFromPixelMapAbnormalPromiseTest(done, testName, pixelMap);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_008
     * @tc.name      : sendableImage_convertFromPixelMap_abnormal_sendable_promise_003
     * @tc.desc      : sendableImage_convertFromPixelMap
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_convertFromPixelMap_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_convertFromPixelMap_abnormal_sendable_promise_003';
      let pixelMap: ESObject = {};
      await convertFromPixelMapAbnormalPromiseTest(done, testName, pixelMap);
    })
  })
}