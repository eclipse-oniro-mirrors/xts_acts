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
import { colorSpaceManager } from '@kit.ArkGraphics2D';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'applyColorSpace';

async function applyColorSpacePromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  colorSpaceName: colorSpaceManager.ColorSpace) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      await sendablePixelMap.applyColorSpace(targetColorSpace);
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function applyColorSpaceAbnormalPromiseTest(done: Function, testName: string, targetColorSpace: ESObject) {
  try {
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    await sendablePixelMap.applyColorSpace(targetColorSpace);
    done();
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

export default function sendableApplyColorSpaceTest() {
  describe('sendableApplyColorSpaceTest', () => {

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
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_001
     * @tc.name      : applyColorSpace_sendable_promise_001
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_002
     * @tc.name      : applyColorSpace_sendable_promise_002
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_003
     * @tc.name      : applyColorSpace_sendable_promise_003
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_004
     * @tc.name      : applyColorSpace_sendable_promise_004
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_005
     * @tc.name      : applyColorSpace_sendable_promise_005
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT601_EBU;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_006
     * @tc.name      : applyColorSpace_sendable_promise_006
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3_PQ;
      await applyColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_007
     * @tc.name      : applyColorSpace_abnormal_sendable_promise_001
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_abnormal_sendable_promise_001';
      let targetColorSpace = undefined;
      await applyColorSpaceAbnormalPromiseTest(done, testName, targetColorSpace);
    })

    /**
     * @tc.number    : PIXEL_MAP_APPLY_COLOR_SPACE_008
     * @tc.name      : applyColorSpace_abnormal_sendable_promise_002
     * @tc.desc      : applyColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('applyColorSpace_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'applyColorSpace_abnormal_sendable_promise_002';
      let targetColorSpace = null;
      await applyColorSpaceAbnormalPromiseTest(done, testName, targetColorSpace);
    })
  })
}