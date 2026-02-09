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

const TAG = LOG_TAG + 'scale';

async function scalePromiseTest(done: Function, testName: string, opts: image.InitializationOptions, scaleX: number,
  scaleY: number) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.scale(scaleX, scaleY);
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function scaleAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  scaleX: ESObject, scaleY: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.scale(scaleX, scaleY);
      done();
    } else {
      expect().assertFail();
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

export default function sendableScaleTest() {
  describe('sendableScaleTest', () => {

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
     * @tc.name   scale_sendable_promise_001
     * @tc.number PIXEL_MAP_SCALE_001
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let scaleX: number = 2.0;
      let scaleY: number = 1.0;
      await scalePromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_sendable_promise_002
     * @tc.number PIXEL_MAP_SCALE_002
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = 0;
      let scaleY: number = 0;
      await scalePromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_sendable_promise_003
     * @tc.number PIXEL_MAP_SCALE_003
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = 999;
      let scaleY: number = 999;
      await scalePromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_sendable_promise_004
     * @tc.number PIXEL_MAP_SCALE_004  //TODO 可以传负数??
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX: number = -1;
      let scaleY: number = -1;
      await scalePromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_SCALE_005
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = NaN;
      let scaleY = NaN;
      await scaleAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_SCALE_006
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = null;
      let scaleY = null;
      await scaleAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_abnormal_sendable_promise_003
     * @tc.number PIXEL_MAP_SCALE_007
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = undefined;
      let scaleY = undefined;
      await scaleAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })

    /**
     * @tc.name   scale_abnormal_sendable_promise_004
     * @tc.number PIXEL_MAP_SCALE_008
     * @tc.desc   scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scale_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'scale_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let scaleX = '0';
      let scaleY = '0';
      await scaleAbnormalPromiseTest(done, testName, opts, scaleX, scaleY);
    })
  })
}