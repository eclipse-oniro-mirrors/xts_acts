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

const TAG = LOG_TAG + 'getColorSpace';

async function getColorSpacePromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  colorSpaceName: colorSpaceManager.ColorSpace) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);

    if (sendablePixelMap != undefined) {
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      await sendablePixelMap.setColorSpace(csm);
      await sendablePixelMap.getColorSpace();
      done();
    }
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableGetColorSpaceTest() {
  describe('sendableGetColorSpaceTest', () => {

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
     * @tc.name   getColorSpace_sendable_promise_001
     * @tc.number PIXEL_MAP_getColorSpace_sendable_promise_001
     * @tc.desc   getColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getColorSpace_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT;
      await getColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.name   getColorSpace_sendable_promise_002
     * @tc.number PIXEL_MAP_getColorSpace_sendable_promise_002
     * @tc.desc   getColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getColorSpace_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      await getColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.name   getColorSpace_sendable_promise_003
     * @tc.number PIXEL_MAP_getColorSpace_sendable_promise_003
     * @tc.desc   getColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getColorSpace_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 600, width: 400 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_PQ;
      await getColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.name   getColorSpace_sendable_promise_004
     * @tc.number PIXEL_MAP_getColorSpace_sendable_promise_004
     * @tc.desc   getColorSpace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getColorSpace_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getColorSpace_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_HLG_LIMIT;
      await getColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })
  })
}