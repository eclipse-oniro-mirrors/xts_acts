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

const TAG = LOG_TAG + 'setColorSpace';

async function setColorSpacePromiseTest(done: Function, testName: string, opts: image.InitializationOptions,
  colorSpaceName: colorSpaceManager.ColorSpace) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let sendablePixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
    if (sendablePixelMap != undefined) {
      let csm: colorSpaceManager.ColorSpaceManager = await colorSpaceManager.create(colorSpaceName);
      await sendablePixelMap.setColorSpace(csm);
      let getColorSpace: colorSpaceManager.ColorSpaceManager = await sendablePixelMap.getColorSpace();
      let resultName = await getColorSpace.getColorSpaceName();
      expect(resultName === colorSpaceName).assertTrue();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableSetColorSpaceTest() {
  describe('sendableSetColorSpaceTest', () => {

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
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_001  //TODO 在colorSpaceManager.create(colorSpaceName) 中UNKNOWN 和CUSTOM 类型报错 18600001
     * @tc.name      : setColorSpace_sendable_promise_001
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('setColorSpace_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.UNKNOWN;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_002
     * @tc.name      : setColorSpace_sendable_promise_002
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_003
     * @tc.name      : setColorSpace_sendable_promise_003
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_004
     * @tc.name      : setColorSpace_sendable_promise_004
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_005
     * @tc.name      : setColorSpace_sendable_promise_005
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('setColorSpace_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.CUSTOM;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })*/

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_006
     * @tc.name      : setColorSpace_sendable_promise_006
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT709;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_007
     * @tc.name      : setColorSpace_sendable_promise_007
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_007';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT601_EBU;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_008
     * @tc.name      : setColorSpace_sendable_promise_008
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_008';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT601_SMPTE_C;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_009
     * @tc.name      : setColorSpace_sendable_promise_009
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_009';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT2020_HLG;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_010
     * @tc.name      : setColorSpace_sendable_promise_010
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_010';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT2020_PQ;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_011
     * @tc.name      : setColorSpace_sendable_promise_011
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_011';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_HLG;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_012
     * @tc.name      : setColorSpace_sendable_promise_012
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_012';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_PQ;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_013
     * @tc.name      : setColorSpace_sendable_promise_013
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_013';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_014
     * @tc.name      : setColorSpace_sendable_promise_014
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_014';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_015
     * @tc.name      : setColorSpace_sendable_promise_015
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_015';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_016
     * @tc.name      : setColorSpace_sendable_promise_016
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_016';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT709_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_017
     * @tc.name      : setColorSpace_sendable_promise_017
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_017';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT601_EBU_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_018
     * @tc.name      : setColorSpace_sendable_promise_018
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_018';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_019
     * @tc.name      : setColorSpace_sendable_promise_019
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_019';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_020
     * @tc.name      : setColorSpace_sendable_promise_020
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_020';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_021
     * @tc.name      : setColorSpace_sendable_promise_021
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_021';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_HLG_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_022
     * @tc.name      : setColorSpace_sendable_promise_022
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_022';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.P3_PQ_LIMIT;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_023
     * @tc.name      : setColorSpace_sendable_promise_023
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_023';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.LINEAR_P3;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_024
     * @tc.name      : setColorSpace_sendable_promise_024
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_024';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.LINEAR_SRGB;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_025
     * @tc.name      : setColorSpace_sendable_promise_025
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_025';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.LINEAR_BT709;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_026
     * @tc.name      : setColorSpace_sendable_promise_026
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_026';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.LINEAR_BT2020;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_027
     * @tc.name      : setColorSpace_sendable_promise_027
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_027';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_SRGB;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_028
     * @tc.name      : setColorSpace_sendable_promise_028
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_028';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3_SRGB;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_029
     * @tc.name      : setColorSpace_sendable_promise_029
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_029';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3_HLG;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })

    /**
     * @tc.number    : PIXEL_MAP_SET_COLOR_SPACE_030
     * @tc.name      : setColorSpace_sendable_promise_030
     * @tc.desc      : setColorSpace
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setColorSpace_sendable_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'setColorSpace_sendable_promise_030';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3_PQ;
      await setColorSpacePromiseTest(done, testName, opts, colorSpaceName);
    })
  })
}