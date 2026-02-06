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

const TAG = LOG_TAG + 'opacity';

async function opacityPromiseTest(done: Function, testName: string, opts: image.InitializationOptions, rate: number) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      await sendablePixelMap.opacity(rate);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacityAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  rate: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      await sendablePixelMap.opacity(rate);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error?.code == ErrorCode.Invalid_Image_Parameter).assertTrue();
      done();
    } else {
      expect(error == ErrorCode.Invalid_Image_Parameter).assertTrue();
      done();
    }
  }
}

export default function sendableOpacityTest() {
  describe('sendableOpacityTest', () => {

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
     * @tc.name   opacity_sendable_promise_001
     * @tc.number PIXEL_MAP_OPACITY_001
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacityPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_sendable_promise_002
     * @tc.number PIXEL_MAP_OPACITY_002
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.0000001;
      await opacityPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_sendable_promise_003
     * @tc.number PIXEL_MAP_OPACITY_003
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate: number = 1;
      await opacityPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_OPACITY_004 //TODO 传入rate不符合区间范围(0,1] 错误码格式不对 为62980115 文档没错误码参考
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate: number = 1.1;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_OPACITY_005 //TODO 传入rate不符合区间范围(0,1] 错误码格式不对 为62980115
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate: number = 0;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_003
     * @tc.number PIXEL_MAP_OPACITY_006 //TODO 传入rate不符合区间范围(0,1] 错误码格式不对 为62980115
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate: number = -1;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_004
     * @tc.number PIXEL_MAP_OPACITY_007 //TODO 传入NaN不会报错
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate: number = NaN;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_005
     * @tc.number PIXEL_MAP_OPACITY_008 //TODO 传入异常参数 错误码格式不对 为62980115
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate = null;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_006
     * @tc.number PIXEL_MAP_OPACITY_009 //TODO 传入异常参数 错误码格式不对 为62980115
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate = undefined;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacity_abnormal_sendable_promise_007
     * @tc.number PIXEL_MAP_OPACITY_010 //TODO 传入异常参数 错误码格式不对 为62980115
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacity_abnormal_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacity_abnormal_sendable_promise_007';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let rate = undefined;
      await opacityAbnormalPromiseTest(done, testName, opts, rate);
    })
  })
}