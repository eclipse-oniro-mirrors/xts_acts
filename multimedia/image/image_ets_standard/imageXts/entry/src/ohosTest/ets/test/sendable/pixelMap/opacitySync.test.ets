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

const TAG = LOG_TAG + 'opacitySync';

async function opacitySyncPromiseTest(done: Function, testName: string, opts: image.InitializationOptions, rate: number
) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.opacitySync(rate);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacitySyncAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  rate: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      sendablePixelMap.opacitySync(rate);
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

export default function sendableOpacitySyncTest() {
  describe('sendableOpacitySyncTest', () => {

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
     * @tc.name   opacitySync_sendable_promise_001
     * @tc.number PIXEL_MAP_OPACITY_SYNC_001
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacitySyncPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_sendable_promise_002
     * @tc.number PIXEL_MAP_OPACITY_SYNC_002
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate: number = 0.00001;
      await opacitySyncPromiseTest(done, testName, opts, rate);
    })


    /**
     * @tc.name   opacitySync_sendable_promise_003
     * @tc.number PIXEL_MAP_OPACITY_SYNC_003
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate: number = 1;
      await opacitySyncPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_OPACITY_SYNC_04 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate: number = 2;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_OPACITY_SYNC_005 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate: number = 0;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_003
     * @tc.number PIXEL_MAP_OPACITY_SYNC_006 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate: number = -1;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_004
     * @tc.number PIXEL_MAP_OPACITY_SYNC_007 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate = NaN;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_005
     * @tc.number PIXEL_MAP_OPACITY_SYNC_008//TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate = undefined;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_006
     * @tc.number PIXEL_MAP_OPACITY_SYNC_009 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate = null;
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })

    /**
     * @tc.name   opacitySync_abnormal_sendable_promise_007
     * @tc.number PIXEL_MAP_OPACITY_SYNC_010 //TODO 传入的rate超出区间范围(0,1]后 不报错
     * @tc.desc   opacitySync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('opacitySync_abnormal_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'opacitySync_abnormal_sendable_promise_007';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let rate = '0';
      await opacitySyncAbnormalPromiseTest(done, testName, opts, rate);
    })
  })
}

