/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getEnumCount } from './utils';

export default function colorFilterTest() {
  describe('DrawingTsColorFilterTest', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 3, size: {
          height: 100, width: 100
        }
      }
      pixel = await image.createPixelMap(color, opts);
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0100
     * @tc.name      : testColorFilterCreateBlendModeColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateBlendModeColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNormal';

      try {
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.CLEAR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OVER);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OVER);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_IN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_IN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OUT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OUT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_ATOP);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_ATOP);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.XOR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.PLUS);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MODULATE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SCREEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.OVERLAY);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DARKEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LIGHTEN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_DODGE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_BURN);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HARD_LIGHT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SOFT_LIGHT);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DIFFERENCE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.EXCLUSION);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MULTIPLY);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HUE);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SATURATION);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR);
        drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LUMINOSITY);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 254.66, red: 254.555, green: 125.3, blue: 10.222
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0101
     * @tc.name      : testColorFilterCreateBlendModeColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNull';

      try {
        drawing.ColorFilter.createBlendModeColorFilter(undefined, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter(undefined, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0103
     * @tc.name      : testColorFilterCreateBlendModeColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterMultipleCalls';

      for (let i = 0; i < 20; i++) {
        const randomColor: common2D.Color = {
          alpha: Math.floor(Math.random() * 256),
          red: Math.floor(Math.random() * 256),
          green: Math.floor(Math.random() * 256),
          blue: Math.floor(Math.random() * 256)
        };
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.BlendMode));

        try {
          drawing.ColorFilter.createBlendModeColorFilter(randomColor, randomEnum);
          console.info(msg + ' createBlendModeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0104
     * @tc.name      : testColorFilterCreateBlendModeColorFilterBoundaryValue
     * @tc.desc      : Test for testColorFilterCreateBlendModeColorFilterBoundaryValue.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateBlendModeColorFilterBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterBoundaryValue';

      const randomColor : common2D.Color = {
        alpha: Math.floor(Math.random() * 256),
        red: Math.floor(Math.random() * 256),
        green: Math.floor(Math.random() * 256),
        blue: Math.floor(Math.random() * 256)
      };
      const enumCount = getEnumCount(drawing.BlendMode);
      for (let i = 0; i < enumCount; i++) {
        try {
          drawing.ColorFilter.createBlendModeColorFilter(randomColor, i);
          console.info(msg + ' createBlendModeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: -1, red: 255, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 256, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: -1, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 256, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: -1, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 256
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: -1
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0200
     * @tc.name      : testColorFilterCreateComposeColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateComposeColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateComposeColorFilterNormal';

      let colorFilter1: drawing.ColorFilter | null = null;
      try {
        colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let colorFilter2: drawing.ColorFilter | null = null;
      try {
        colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.DST);
        console.info(msg + ' createBlendModeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, drawing.ColorFilter.createSRGBGammaToLinear());
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(drawing.ColorFilter.createSRGBGammaToLinear(), colorFilter2);
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(drawing.ColorFilter.createSRGBGammaToLinear(), drawing.ColorFilter.createLumaColorFilter());
        console.info(msg + ' createComposeColorFilter successed');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0201
     * @tc.name      : testColorFilterCreateComposeColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateComposeColorFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateComposeColorFilterNull';

      let colorFilter1: drawing.ColorFilter | null = null;
      let colorFilter2: drawing.ColorFilter | null = null;
      try {
        colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC);
        colorFilter2 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.DST);
      } catch (e) {
        console.info(`createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(undefined, colorFilter2);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, undefined);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(null, colorFilter2);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createComposeColorFilter(colorFilter1, null);
        console.info(msg + ' createComposeColorFilter succeeded');
      } catch (e) {
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0203
     * @tc.name      : testColorFilterCreateComposeColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateComposeColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateComposeColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateComposeColorFilterMultipleCalls';
      const filters = [
        drawing.ColorFilter.createSRGBGammaToLinear(),
        drawing.ColorFilter.createLumaColorFilter(),
        drawing.ColorFilter.createLinearToSRGBGamma(),
      ];
      for (let i = 0; i < 20; i++) {
        const randomFilter1 = filters[Math.floor(Math.random() * 3)];
        const randomFilter2 = filters[Math.floor(Math.random() * 3)];
        try {
          drawing.ColorFilter.createComposeColorFilter(randomFilter1, randomFilter2);
          console.info(msg + ' createComposeColorFilter succeeded');
        } catch (e) {
          console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0300
     * @tc.name      : testColorFilterCreateLinearToSRGBGammaNormal
     * @tc.desc      : Test for testColorFilterCreateLinearToSRGBGammaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateLinearToSRGBGammaNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaNormal';
      try {
        drawing.ColorFilter.createLinearToSRGBGamma();
        console.info(msg + ' createLinearToSRGBGamma successed');
      } catch (e) {
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0302
     * @tc.name      : testColorFilterCreateLinearToSRGBGammaMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateLinearToSRGBGammaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLinearToSRGBGammaMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createLinearToSRGBGamma();
          console.info(msg + ' createLinearToSRGBGamma successed');
        }
      } catch (e) {
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0400
     * @tc.name      : testColorFilterCreateSRGBGammaToLinearNormal
     * @tc.desc      : Test for testColorFilterCreateSRGBGammaToLinearNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateSRGBGammaToLinearNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearNormal';
      try {
        drawing.ColorFilter.createSRGBGammaToLinear();
        console.info(msg + ' createSRGBGammaToLinear successed');
      } catch (e) {
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0402
     * @tc.name      : testColorFilterCreateSRGBGammaToLinearMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateSRGBGammaToLinearMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateSRGBGammaToLinearMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createSRGBGammaToLinear();
          console.info(msg + ' createSRGBGammaToLinear successed');
        }
      } catch (e) {
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0500
     * @tc.name      : testColorFilterCreateLumaColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateLumaColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateLumaColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateLumaColorFilterNormal';
      try {
        drawing.ColorFilter.createLumaColorFilter();
        console.info(msg + ' createLumaColorFilter successed');
      } catch (e) {
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0502
     * @tc.name      : testColorFilterCreateLumaColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateLumaColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLumaColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateLumaColorFilterMultipleCalls';
      try {
        for (let i = 0; i < 20; i++) {
          drawing.ColorFilter.createLumaColorFilter();
          console.info(msg + ' createLumaColorFilter successed');
        }
      } catch (e) {
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0600
     * @tc.name      : testColorFilterCreateMatrixColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateMatrixColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateMatrixColorFilterNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterNormal';
      const matrix_ = [
        1, 0, 0, 0, 0, // 红色通道
        0, 1, 0, 0, 0, // 绿色通道
        0, 0, 1, 0, 0, // 蓝色通道
        0, 0, 0, 1, 0// 透明度通道
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix_);
        expect(colorFilter != null || colorFilter != undefined).assertTrue()
        console.info(msg + ' createMatrixColorFilter successed,colorFilter:' + colorFilter);
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0601
     * @tc.name      : testColorFilterCreateMatrixColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateMatrixColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateMatrixColorFilterNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterNull';
      try {
        drawing.ColorFilter.createMatrixColorFilter(null);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createMatrixColorFilter(undefined);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0603
     * @tc.name      : testColorFilterCreateMatrixColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateMatrixColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateMatrixColorFilterMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterMultipleCalls';
      for ( let i = 0 ; i < 20 ; i ++ ) {
        const matrix: number[] = Array(20).fill(0).map(() => Math.random() * 10 - 5);
        try {
          let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix);
          expect(colorFilter != null || colorFilter != undefined).assertTrue()
          console.info(msg + ' createMatrixColorFilter successed,colorFilter:' + colorFilter);
        } catch( e ) {
          console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0604
     * @tc.name      : testColorFilterCreateMatrixColorFilterAbnormal
     * @tc.desc      : Test for testColorFilterCreateMatrixColorFilterAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateMatrixColorFilterAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterAbnormal';
      try {
        drawing.ColorFilter.createMatrixColorFilter([]);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const matrix: number[] = Array(19).fill(0).map(() => Math.random() * 10 - 5);
        drawing.ColorFilter.createMatrixColorFilter(matrix);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }

      try {
        const matrix: number[] = Array(21).fill(0).map(() => Math.random() * 10 - 5);
        drawing.ColorFilter.createMatrixColorFilter(matrix);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch( e ) {
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0700
     * @tc.name      : testColorFilterCreateLightingColorFilterNormal
     * @tc.desc      : Test for testColorFilterCreateLightingColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testColorFilterCreateLightingColorFilterNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testColorFilterCreateLightingColorFilterNormal';
      let mulColor : common2D.Color = { alpha: 0, red: 0, green: 0, blue: 0};
      let addColor : common2D.Color = { alpha: 255, red: 255, green: 255, blue: 255};
      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter(mulColor, addColor);
        console.info(msg + ' createLightingColorFilter colorFilter successed');
        expect(colorFilter != null || colorFilter != undefined).assertTrue()
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let colorFilter2 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter2 successed');
        expect(colorFilter2 != null || colorFilter2 != undefined).assertTrue()
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let colorFilter3 = drawing.ColorFilter.createLightingColorFilter(0xFFFFFFFF, 0x00000000);
        console.info(msg + ' createLightingColorFilter colorFilter3 successed');
        expect(colorFilter3 != null || colorFilter3 != undefined).assertTrue()
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let colorFilter4 = drawing.ColorFilter.createLightingColorFilter(300, 100.2);
        console.info(msg + ' createLightingColorFilter colorFilter4 successed');
        expect(colorFilter4 != null || colorFilter4 != undefined).assertTrue()
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0701
     * @tc.name      : testColorFilterCreateLightingColorFilterNull
     * @tc.desc      : Test for testColorFilterCreateLightingColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 4
     */
    it('testColorFilterCreateLightingColorFilterNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4 , () => {
      const msg = 'testColorFilterCreateLightingColorFilterNull';
      let mulColor : common2D.Color = { alpha: 0, red: 0, green: 0, blue: 20 };
      let addColor : common2D.Color = { alpha: 0, red: 0, green: 0, blue: 125 };
      try {
        let colorFilter = drawing.ColorFilter.createLightingColorFilter(null, addColor);
        console.info(msg + ' createLightingColorFilter colorFilter successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter2 = drawing.ColorFilter.createLightingColorFilter(undefined, addColor);
        console.info(msg + ' createLightingColorFilter colorFilter2 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter3 = drawing.ColorFilter.createLightingColorFilter(mulColor, null);
        console.info(msg + ' createLightingColorFilter colorFilter3 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter4 = drawing.ColorFilter.createLightingColorFilter(mulColor, undefined);
        console.info(msg + ' createLightingColorFilter colorFilter4 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0702
     * @tc.name      : testColorFilterCreateLightingColorFilterMultipleCalls
     * @tc.desc      : Test for testColorFilterCreateLightingColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testColorFilterCreateLightingColorFilterMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2 , () => {
      const msg = 'testColorFilterCreateLightingColorFilterMultipleCalls';
      for (let i = 0; i < 20; i++) {
        let randomNumber1 = Math.floor(Math.random() * 100);
        let randomNumber2 = Math.floor(Math.random() * 200);
        console.info(msg + ` randomNumber1 is: ${randomNumber1}, randomNumber2 is: ${randomNumber2}, step i is: ${i}}`);
        try {
          let colorFilter = drawing.ColorFilter.createLightingColorFilter(randomNumber1, randomNumber2);
          console.info(msg + ' createLightingColorFilter colorFilter successed' + i);
          expect(colorFilter != null || colorFilter != undefined).assertTrue()
        } catch( e ) {
          console.info(msg + ` createLightingColorFilter colorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_0703
     * @tc.name      : testColorFilterCreateLightingColorFilterAbnormal
     * @tc.desc      : Test for testColorFilterCreateLightingColorFilterAbnormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testColorFilterCreateLightingColorFilterAbnormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateLightingColorFilterAbnormal';
      let mulColor : common2D.Color = { alpha: 0, red: 0, green: 0, blue: 0};
      let addColor : common2D.Color = { alpha: 255, red: 0, green: 0, blue: 125 };
      try {
        let colorFilter1 = drawing.ColorFilter.createLightingColorFilter(mulColor, 200);
        expect(colorFilter1 != null || colorFilter1 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let colorFilter2 = drawing.ColorFilter.createLightingColorFilter(0xffff0000, addColor );
        console.info(msg + ' createLightingColorFilter colorFilter2 successed');
        expect(colorFilter2 != null || colorFilter2 != undefined).assertTrue();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      mulColor = { alpha: -1, red: 0, green: 0, blue: 0};
      try {
        let colorFilter3 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter3 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter4 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter4 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor = { alpha: 256, red: 0, green: 0, blue: 0};
      try {
        let colorFilter5 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter5 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter5 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter6 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter6 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter6 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor  = { alpha: 255, red: -1, green: 0, blue: 0};
      try {
        let colorFilter7 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter7 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter7 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter8 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter8 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter8 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor  = { alpha: 255, red: 256, green: 0, blue: 0};
      try {
        let colorFilter9 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter9 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter10 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter10 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor = { alpha: 255, red: 255, green: -1, blue: 0};
      try {
        let colorFilter9 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter9 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter9 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter10 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter10 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter10 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor = { alpha: 255, red: 255, green: 256, blue: 0};
      try {
        let colorFilter11 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter11 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter11 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter12 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter12 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter12 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor = { alpha: 255, red: 255, green: 255, blue: -1};
      try {
        let colorFilter13 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter13 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter13 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter14 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter14 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter14 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      mulColor = { alpha: 255, red: 255, green: 255, blue: 256};
      try {
        let colorFilter15 = drawing.ColorFilter.createLightingColorFilter(mulColor , addColor );
        console.info(msg + ' createLightingColorFilter colorFilter15 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter15 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
      try {
        let colorFilter16 = drawing.ColorFilter.createLightingColorFilter(addColor , mulColor );
        console.info(msg + ' createLightingColorFilter colorFilter16 successed');
        expect().assertFail();
      } catch( e ) {
        console.info(msg + ` createLightingColorFilter colorFilter16 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  });
}