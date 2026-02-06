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

const TAG = LOG_TAG + 'crop';

async function cropPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  region: image.Region) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.crop(region);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function cropAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  region: ESObject) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      await sendablePixelMap.crop(region);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Cropping_Exceptions || error.code == ErrorCode.Invalid_Image_Parameter)
        .assertTrue();
    } else {
      expect(error == ErrorCode.Cropping_Exceptions || error == ErrorCode.Invalid_Image_Parameter).assertTrue();
    }
    done();
  }
}


export default function sendableCropTest() {
  describe('sendableCropTest', () => {

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
     * @tc.number    : PIXEL_MAP_CROP_001
     * @tc.name      : crop_sendable_promise_001
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
      await cropPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_002
     * @tc.name      : crop_sendable_promise_002
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 200, width: 200 } };
      let region: image.Region = { x: 100, y: 100, size: { height: 100, width: 100 } };
      await cropPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_003 //TODO 传入的region里的height>PixelMap里的height报code为62980109 文档上没有 在Image错误码中为裁剪错误
     * @tc.name      : crop_abnormal_sendable_promise_001
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 10, width: 10 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_004
     * @tc.name      : crop_abnormal_sendable_promise_002
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: image.Region = { x: 10, y: 0, size: { height: 100, width: 100 } };
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_005
     * @tc.name      : crop_abnormal_sendable_promise_003
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: image.Region = { x: -10, y: -5, size: { height: 100, width: 100 } };
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_006
     * @tc.name      : crop_abnormal_sendable_promise_004
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 0, width: 0 } };
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_007
     * @tc.name      : crop_abnormal_sendable_promise_005
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: image.Region = { x: 0, y: 0, size: { height: 0, width: 0 } };
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_008
     * @tc.name      : crop_abnormal_sendable_promise_006
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: ESObject = {};
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_009
     * @tc.name      : crop_abnormal_sendable_promise_007
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_007';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: ESObject = undefined;
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })

    /**
     * @tc.number    : PIXEL_MAP_CROP_010
     * @tc.name      : crop_abnormal_sendable_promise_008
     * @tc.desc      : crop
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('crop_abnormal_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'crop_abnormal_sendable_promise_008';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 100, width: 100 } };
      let region: ESObject = null;
      await cropAbnormalPromiseTest(done, testName, opts, region);
    })
  })
}