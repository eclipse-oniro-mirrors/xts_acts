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

const TAG = LOG_TAG + 'translate';

async function translatePromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  translateX: number, translateY: number) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      await sendablePixelMap.translate(translateX, translateY);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function translateAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  translateX: ESObject, translateY: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      await sendablePixelMap.translate(translateX, translateY);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Invalid_Image_Parameter).assertTrue();
    } else {
      expect(error == ErrorCode.Invalid_Image_Parameter).assertTrue();
    }
    done();
  }
}

export default function sendableTranslateTest() {
  describe('sendableTranslateTest', () => {

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
     * @tc.number    : PIXEL_MAP_TRANSLATE_001
     * @tc.name      : translate_sendable_promise_001
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let translateX: number = 2.0;
      let translateY: number = 1.0;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_002
     * @tc.name      : translate_sendable_promise_002
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let translateX: number = 360;
      let translateY: number = 360;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_003
     * @tc.name      : translate_sendable_promise_003
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = 0;
      let translateY: number = 0;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_004
     * @tc.name      : translate_sendable_promise_004
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -10;
      let translateY: number = -10;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_005
     * @tc.name      : translate_sendable_promise_005
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -99;
      let translateY: number = 99;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_006
     * @tc.name      : translate_sendable_promise_006
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX: number = -9999;
      let translateY: number = 9999;
      await translatePromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_007
     * @tc.name      : translate_abnormal_sendable_promise_001
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = NaN;
      let translateY = NaN;
      await translateAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_008
     * @tc.name      : translate_abnormal_sendable_promise_002
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = null;
      let translateY = null;
      await translateAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_009
     * @tc.name      : translate_abnormal_sendable_promise_003
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = undefined;
      let translateY = undefined;
      await translateAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })

    /**
     * @tc.number    : PIXEL_MAP_TRANSLATE_010
     * @tc.name      : translate_abnormal_sendable_promise_004
     * @tc.desc      : translate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('translate_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'translate_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let translateX = '0';
      let translateY = '0';
      await translateAbnormalPromiseTest(done, testName, opts, translateX, translateY);
    })
  })
}