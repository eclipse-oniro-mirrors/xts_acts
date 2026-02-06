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
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getEnumCount, getRandomNumber } from './utils';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

export default function brushTest() {
  describe('DrawingTsBrushTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testBrushSetColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0100
     * @tc.desc   Test for testBrushSetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColorNormal';
      const brush = new drawing.Brush();
      const colors: Array<common2D.Color> = [
        {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        {
          alpha: 245.3, red: 251.1, green: 10.1, blue: 12.1
        },
      ];
      for (let i = 0; i < colors.length; i++) {
        try {
          brush.setColor(colors[i]);
          console.info(msg + ` setColor succeeded`);
        } catch (e) {
          console.info(msg + ` setColor failed. Error code is: ${e.code}. Error message is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushSetColorNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0101
     * @tc.desc   Test for testBrushSetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorNull';
      const brush = new drawing.Brush();
      const colors: Array<Partial<common2D.Color>> = [
        {
          alpha: undefined, red: 0x00, green: 0xFF, blue: 0x00
        },
        {
          alpha: 0xFF, red: undefined, green: 0xFF, blue: 0x00
        },
        {
          alpha: 0xFF, red: 0x00, green: undefined, blue: 0x00
        },
        {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: undefined
        },
        {
          alpha: undefined, red: 0x00, green: 0xFF, blue: 0x00
        },
        {
          alpha: 0xFF, red: undefined, green: 0xFF, blue: 0x00
        },
        {
          alpha: 0xFF, red: 0x00, green: undefined, blue: 0x00
        },
        {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: undefined
        },
      ];
      for (let i = 0; i < colors.length; i++) {
        try {
          brush.setColor(colors[i] as common2D.Color);
          console.info(msg + ` setColor succeeded`);
        } catch (e) {
          console.info(msg + ` setColor failed. Error code is: ${e.code}. Error message is: ${e.message}`);
          expect(e.code).assertEqual(401);
        }
      }
      try {
        brush.setColor(null);
        console.info(msg + ` 1 setColor succeeded`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 1 setColor failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        brush.setColor(undefined);
        console.info(msg + ` 2 setColor succeeded`);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` 2 setColor failed. Error code is: ${e.code}. Error message is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0103
     * @tc.desc   Test for testBrushSetColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorMultipleCalls';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        const alpha = Math.floor(Math.random() * 256);
        const red = Math.floor(Math.random() * 256);
        const green = Math.floor(Math.random() * 256);
        const blue = Math.floor(Math.random() * 256);
        try {
          brush.setColor({
            alpha, red, green, blue
          });
          console.info(msg + ' setColor successed');
        } catch (e) {
          console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushSetColorBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0104
     * @tc.desc   Test for testBrushSetColorBoundaryValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorBoundaryValue';
      const brush = new drawing.Brush();
      const colors: Array<common2D.Color> = [
        {
          alpha: -1, red: 255, green: 0, blue: 255
        },
        {
          alpha: 256, red: 255, green: 0, blue: 255
        },
        {
          alpha: 255, red: -2, green: 0, blue: 255
        },
        {
          alpha: 255, red: 256, green: 0, blue: 255
        },
        {
          alpha: 255, red: 255, green: 256, blue: 255
        },
        {
          alpha: 255, red: 255, green: -1, blue: 255
        },
        {
          alpha: 255, red: 255, green: 0, blue: -1
        },
        {
          alpha: 255, red: 255, green: 0, blue: 256
        },
      ];
      for (let i = 0; i < colors.length; i++) {
        try {
          brush.setColor(colors[i]);
          console.info(msg + ' setColor successed');
        } catch (e) {
          console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`)
          expect(e.code).assertEqual(401);
        }
      }
    });

    /**
     * @tc.name   testBrushSetAntiAliasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0200
     * @tc.desc   Test for testBrushSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAntiAliasNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetAntiAliasNormal';
      const brush = new drawing.Brush();

      try {
        brush.setAntiAlias(true);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(false);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

    });

    /**
     * @tc.name   testBrushSetAntiAliasNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0201
     * @tc.desc   Test for testBrushSetAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAntiAliasNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAntiAliasNull';
      const brush = new drawing.Brush();

      try {
        brush.setAntiAlias(undefined);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setAntiAlias(null);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });


    /**
     * @tc.name   testBrushSetAntiAliasMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0203
     * @tc.desc   Test for testBrushSetAntiAliasMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAntiAliasMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAntiAliasMultipleCalls';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          brush.setAntiAlias(randomBoolean);
          console.info(msg + ' setAntiAlias successed');
        } catch (e) {
          console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushSetAlphaNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0300
     * @tc.desc   Test for testBrushSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAlphaNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetAlphaNormal';
      const brush = new drawing.Brush();

      try {
        brush.setAlpha(255);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(0);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(255.562);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetAlphaNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0301
     * @tc.desc   Test for testBrushSetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAlphaNull';
      const brush = new drawing.Brush();

      try {
        brush.setAlpha(undefined);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setAlpha(null);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetAlphaMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0303
     * @tc.desc   Test for testBrushSetAlphaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAlphaMultipleCalls';
      try {
        const brush = new drawing.Brush();
        for (let i = 0; i < 20; i++) {
          const randomAlpha = Math.floor(Math.random() * 256);
          brush.setAlpha(randomAlpha);
        }
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetColorFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0400
     * @tc.desc   Test for testBrushSetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColorFilterNormal';
      try {
        const brush = new drawing.Brush();
        brush.setColorFilter(drawing.ColorFilter.createLinearToSRGBGamma());
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetColorFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0401
     * @tc.desc   Test for testBrushSetColorFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorFilterNull';
      const brush = new drawing.Brush();

      try {
        brush.setColorFilter(undefined);
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setColorFilter(null);
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColorFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0403
     * @tc.desc   Test for testBrushSetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorFilterMultipleCalls';
      const brush = new drawing.Brush();
      try {
        for (let i = 0; i < 20; i++) {
          brush.setColorFilter(drawing.ColorFilter.createLinearToSRGBGamma());
        }
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetMaskFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0500
     * @tc.desc   Test for testBrushSetMaskFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetMaskFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetMaskFilterNormal';
      try {
        const brush = new drawing.Brush();
        brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10));
        console.info(msg + ' setMaskFilter successed');
      } catch (e) {
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetMaskFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0501
     * @tc.desc   Test for testBrushSetMaskFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetMaskFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetMaskFilterNull';
      try {
        const brush = new drawing.Brush();
        brush.setMaskFilter(undefined);
        brush.setMaskFilter(null);
        console.info(msg + ' setMaskFilter successed');
      } catch (e) {
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetMaskFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0503
     * @tc.desc   Test for testBrushSetMaskFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetMaskFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetMaskFilterMultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          const type = Math.floor(Math.random() * 4);
          brush.setMaskFilter(drawing.MaskFilter.createBlurMaskFilter(type, 10));
          console.info(msg + ' setMaskFilter successed');
        } catch (e) {
          console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

    });

    /**
     * @tc.name   testBrushSetShadowLayerNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0600
     * @tc.desc   Test for testBrushSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShadowLayerNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetShadowLayerNormal';
      try {
        const brush = new drawing.Brush();
        brush.setShadowLayer(drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        }));
        console.info(msg + ' setShadowLayer successed');
      } catch (e) {
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetShadowLayerNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0601
     * @tc.desc   Test for testBrushSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShadowLayerNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetShadowLayerNull';
      const brush = new drawing.Brush();

      try {
        brush.setShadowLayer(undefined);
        console.info(msg + ' setShadowLayer successed');
      } catch (e) {
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setShadowLayer(null);
        console.info(msg + ' setShadowLayer successed');
      } catch (e) {
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetShadowLayerMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0603
     * @tc.desc   Test for testBrushSetShadowLayerMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShadowLayerMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetShadowLayerMultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          const radius = Math.floor(getRandomNumber(1, 100));
          const dx = Math.floor(Math.random() * 100);
          const dy = Math.floor(Math.random() * 100);
          const color: common2D.Color = {
            alpha: Math.floor(Math.random() * 256),
            red: Math.floor(Math.random() * 256),
            green: Math.floor(Math.random() * 256),
            blue: Math.floor(Math.random() * 256),
          };
          brush.setShadowLayer(drawing.ShadowLayer.create(radius, dx, dy, color));
          console.info(msg + ' setShadowLayer successed');
        } catch (e) {
          console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

    });

    /**
     * @tc.name   testBrushSetBlendModeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0700
     * @tc.desc   Test for testBrushSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetBlendModeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetBlendModeNormal';
      const brush = new drawing.Brush();
      try {
        brush.setBlendMode(drawing.BlendMode.CLEAR);
        brush.setBlendMode(drawing.BlendMode.SRC);
        brush.setBlendMode(drawing.BlendMode.DST);
        brush.setBlendMode(drawing.BlendMode.SRC_OVER);
        brush.setBlendMode(drawing.BlendMode.DST_OVER);
        brush.setBlendMode(drawing.BlendMode.SRC_IN);
        brush.setBlendMode(drawing.BlendMode.DST_IN);
        brush.setBlendMode(drawing.BlendMode.SRC_OUT);
        brush.setBlendMode(drawing.BlendMode.DST_OUT);
        brush.setBlendMode(drawing.BlendMode.SRC_ATOP);
        brush.setBlendMode(drawing.BlendMode.DST_ATOP);
        brush.setBlendMode(drawing.BlendMode.XOR);
        brush.setBlendMode(drawing.BlendMode.PLUS);
        brush.setBlendMode(drawing.BlendMode.MODULATE);
        brush.setBlendMode(drawing.BlendMode.SCREEN);
        brush.setBlendMode(drawing.BlendMode.OVERLAY);
        brush.setBlendMode(drawing.BlendMode.DARKEN);
        brush.setBlendMode(drawing.BlendMode.LIGHTEN);
        brush.setBlendMode(drawing.BlendMode.COLOR_DODGE);
        brush.setBlendMode(drawing.BlendMode.COLOR_BURN);
        brush.setBlendMode(drawing.BlendMode.HARD_LIGHT);
        brush.setBlendMode(drawing.BlendMode.SOFT_LIGHT);
        brush.setBlendMode(drawing.BlendMode.DIFFERENCE);
        brush.setBlendMode(drawing.BlendMode.EXCLUSION);
        brush.setBlendMode(drawing.BlendMode.MULTIPLY);
        brush.setBlendMode(drawing.BlendMode.HUE);
        brush.setBlendMode(drawing.BlendMode.SATURATION);
        brush.setBlendMode(drawing.BlendMode.COLOR);
        brush.setBlendMode(drawing.BlendMode.LUMINOSITY);
        console.info(msg + ' setBlendMode successed');
      } catch (e) {
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetBlendModeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0701
     * @tc.desc   Test for testBrushSetBlendModeNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetBlendModeNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetBlendModeNull';
      const brush = new drawing.Brush();

      try {
        brush.setBlendMode(undefined);
        console.info(msg + ' setBlendMode successed');
      } catch (e) {
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        brush.setBlendMode(null);
        console.info(msg + ' setBlendMode successed');
      } catch (e) {
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetBlendModeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0703
     * @tc.desc   Test for testBrushSetBlendModeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetBlendModeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetBlendModeMultipleCalls';
      const brush = new drawing.Brush();

      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.BlendMode));
          brush.setBlendMode(randomEnum);
          console.info(msg + ' setBlendMode successed');
        } catch (e) {
          console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.name   testBrushSetColor12Normal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0800
     * @tc.desc   testBrushSetColor12Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor12Normal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColor12Normal';
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, 0);
        brush.setColor(245.3, 251.1, 10.1, 12.1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetColor12Null
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0801
     * @tc.desc   testBrushSetColor12Null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor12Null', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColor12Null';
      try {
        const brush = new drawing.Brush();
        brush.setColor(undefined, 255, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, undefined, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, undefined, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, undefined);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(null, 255, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, null, 0, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, null, 0);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, null);
        console.info(msg + 'setColor12 successed');
      } catch (e) {
        console.info(msg + `setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColor12MultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0803
     * @tc.desc   testBrushSetColor12MultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor12MultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColor12MultipleCalls';
      try {
        const brush = new drawing.Brush();
        for (let index = 0; index < 20; index++) {
          brush.setColor(Math.random() * 255, Math.random() * 255, Math.random() * 255, Math.random() * 255);
        }
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetColor12BoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0804
     * @tc.desc   testBrushSetColor12BoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor12BoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColor12BoundaryValue';
      try {
        const brush = new drawing.Brush();
        brush.setColor(-1, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, -1, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(256, 255, -1, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, -1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(256, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 256, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 256, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, 256);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetImageFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0900
     * @tc.desc   Test for testBrushSetImageFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetImageFilterNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetImageFilterNormal';
      const brush = new drawing.Brush();
      const imgFilter = new drawing.ImageFilter();

      try {
        brush.setImageFilter(imgFilter);
        console.info(msg + ' setImageFilter successed');
      } catch( e ) {
        console.info(msg + ` setImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setImageFilter(null);
        console.info(msg + ' setImageFilter(null) succeeded');
      } catch( e ) {
        console.info(msg + ` setImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushSetImageFilterNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0901
     * @tc.desc   Test for testBrushSetImageFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetImageFilterNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetImageFilterNull';
      const brush = new drawing.Brush();

      try {
        brush.setImageFilter(undefined);
        console.info(msg + ' setImageFilter(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` setImageFilter(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetImageFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0903
     * @tc.desc   Test for testBrushSetImageFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetImageFilterMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushSetImageFilterMultipleCalls';
      const brush = new drawing.Brush();
      const imgFilter = new drawing.ImageFilter();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          brush.setImageFilter(imgFilter);
          console.info(msg + ' setImageFilter succeeded');
        } catch( e ) {
          console.info(msg + ` setImageFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushGetColorFilterNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1000
     * @tc.desc   Test for testBrushGetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetColorFilterNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetColorFilterNormal';
      const brush = new drawing.Brush();

      try {
        let cf = drawing.ColorFilter.createLumaColorFilter();
        let cf2 = brush.getColorFilter();
        console.info(msg + ' getColorFilter successed,cf:' + cf2);
      } catch( e ) {
        console.info(msg + ` getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetColorFilterMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1002
     * @tc.desc   Test for testBrushGetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColorFilterMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetColorFilterMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let cf2 = brush.getColorFilter();
          console.info(msg + ' getColorFilter successed,cf:' + cf2);
        } catch( e ) {
          console.info(msg + ` getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushConstructorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1100
     * @tc.desc   Test for testBrushConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushConstructorNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushConstructorNormal';
      const brush = new drawing.Brush();

      try {
        let brush = new drawing.Brush();
        console.info(msg + ' drawing.Brush() successed');
      } catch( e ) {
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        let newBrush = new drawing.Brush(brush);
        console.info(msg + ' drawing.Brush() successed');
      } catch( e ) {
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setColor({
          alpha : 255 , red : 255 , green : 255 , blue : 255
        });
        let newBrush = new drawing.Brush(brush);
        console.info(msg + ' drawing.Brush() successed');
      } catch( e ) {
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushConstructorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1103
     * @tc.desc   Test for testBrushConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushConstructorMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushConstructorMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          brush.setColor(Math.random() * 255 , Math.random() * 255 , Math.random() * 255 , Math.random() * 255);
          const newBrush = new drawing.Brush(brush)
          console.info(msg + ' drawing.Brush succeeded');
        } catch( e ) {
          console.info(msg + ` drawing.Brush errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushGetAlphaNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1200
     * @tc.desc   Test for testBrushGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetAlphaNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetAlphaNormal';
      const brush = new drawing.Brush();

      try {
        let alpha = brush.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(128);
        let alpha = brush.getAlpha();
        expect(alpha == 128).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(255.1);
        let alpha = brush.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch( e ) {
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetAlphaMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1202
     * @tc.desc   Test for testBrushGetAlphaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetAlphaMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetAlphaMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let alpha = brush.getAlpha();
          expect(alpha == 255).assertTrue();
          console.info(msg + ' getAlpha successed,alpha:' + alpha);
        } catch( e ) {
          console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushIsAntiAliasNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1300
     * @tc.desc   Test for testBrushIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushIsAntiAliasNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushIsAntiAliasNormal';
      const brush = new drawing.Brush();

      try {
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(true);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == true).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(false);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch( e ) {
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushIsAntiAliasMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1302
     * @tc.desc   Test for testBrushIsAntiAliasMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushIsAntiAliasMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushIsAntiAliasMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let isAntiAlias = brush.isAntiAlias();
          expect(isAntiAlias == false).assertTrue();
          console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
        } catch( e ) {
          console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushGetColorNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1400
     * @tc.desc   Test for testBrushGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetColorNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetColorNormal';
      const brush = new drawing.Brush();

      try {
        let colorGet = brush.getColor();
        expect(colorGet != null).assertTrue();
        console.info(msg + ' getColor successed,colorGet:'+ JSON.stringify(colorGet));
      } catch( e ) {
        console.info(msg + ` getColor1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const colors: common2D.Color = {
          alpha : 0 , red : 0 , green : 0 , blue : 0
        }
        brush.setColor(colors);
        let colorGet = brush.getColor();
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 2 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor2 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 2 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch( e ) {
        console.info(msg + ` getColor2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        const colors: common2D.Color = {
          alpha : 255 , red : 255 , green : 255 , blue : 255
        }
        brush.setColor(colors);
        let colorGet = brush.getColor();
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor3 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 3 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor3 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 3 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch( e ) {
        console.info(msg + ` getColor3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushGetColorMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1402
     * @tc.desc   Test for testBrushGetColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColorMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetColorMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let colorGet = brush.getColor();
          expect(colorGet != null).assertTrue();
          console.info(msg + ' getColor successed');
        } catch( e ) {
          console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushSetShaderEffectNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1500
     * @tc.desc   Test for testBrushSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetShaderEffectNormal';
      const brush = new drawing.Brush();
      const shaderEffect = new drawing.ShaderEffect();

      try {
        brush.setShaderEffect(shaderEffect);
        console.info(msg + ' setShaderEffect successed');
      } catch( e ) {
        console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setShaderEffect(null);
        console.info(msg + ' setShaderEffect successed');
      } catch( e ) {
        console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetShaderEffectNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1501
     * @tc.desc   Test for testBrushSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectNull' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetShaderEffectNull';
      const brush = new drawing.Brush();

      try {
        brush.setShaderEffect(undefined);
        console.info(msg + ' setShaderEffect(undefined) succeeded');
      } catch( e ) {
        console.info(msg + ` setShaderEffect(undefined) errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testBrushSetShaderEffectMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1503
     * @tc.desc   Test for testBrushSetShaderEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShaderEffectMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushSetShaderEffectMultipleCalls';
      const brush = new drawing.Brush();
      const shaderEffect = new drawing.ShaderEffect();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          brush.setShaderEffect(shaderEffect);
          console.info(msg + ' setShaderEffect succeeded');
        } catch( e ) {
          console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testBrushResetNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1600
     * @tc.desc   Test for testBrushResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushResetNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushResetNormal';
      const brush = new drawing.Brush();

      try {
        brush.reset();
        console.info(msg + ' reset successed');
      } catch( e ) {
        console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setColor(255 , 255 , 0 , 0);
        brush.reset();
        console.info(msg + ' reset successed');
      } catch( e ) {
        console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testBrushResetMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1602
     * @tc.desc   Test for testBrushResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushResetMultipleCalls' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushResetMultipleCalls';
      const brush = new drawing.Brush();

      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          brush.reset();
          console.info(msg + ' reset succeeded');
        } catch( e ) {
          console.info(msg + ` reset errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetAndGetColor4fNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1700
     * @tc.desc   Test for testBrushSetAndGetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAndGetColor4fNormal' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetAndGetColor4fNormal';
      const brush = new drawing.Brush();
      let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG)
      let color4f:common2D.Color4f = {alpha:0.8, red:0.5, green:0.4, blue:0.7};
      try {
        brush.setColor4f(color4f, colorSpace);
        console.info(msg + ' setColor4f successed');
        let color = brush.getColor4f();
        console.info(msg + ' getColor4f successed color is: ' + JSON.stringify(color));
        let dif_alpha = Math.abs(color.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` setColor4f 1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        color4f = {alpha:1, red:1, green:1, blue:1};
        brush.setColor4f(color4f, colorSpace);
        console.info(msg + ' setColor4f 2 successed');
        let color2 = brush.getColor4f();
        console.info(msg + ' getColor4f 2 successed color2 is: ' + JSON.stringify(color2));
        let dif_alpha = Math.abs(color2.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color2.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color2.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color2.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` setColor4f 2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        color4f = {alpha:0, red:0, green:0, blue:0};
        brush.setColor4f(color4f, colorSpace);
        console.info(msg + ' setColor4f 3 successed');
        let color3 = brush.getColor4f();
        console.info(msg + ' getColor4f 3 successed color3 is: ' + JSON.stringify(color3));
        let dif_alpha = Math.abs(color3.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color3.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color3.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color3.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` setColor4f 3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        brush.setColor4f(color4f, null);
        console.info(msg + ' setColor4f 4 successed');
        let color4 = brush.getColor4f();
        console.info(msg + ' getColor4f 4 successed color4 is: ' + JSON.stringify(color4));
        let dif_alpha = Math.abs(color4.alpha-color4f.alpha);
        expect( dif_alpha < 0.0001).assertEqual(true);
        let dif_red = Math.abs(color4.red-color4f.red);
        expect( dif_red < 0.0001).assertEqual(true);
        let dif_green = Math.abs(color4.green-color4f.green);
        expect( dif_green < 0.0001).assertEqual(true);
        let dif_blue = Math.abs(color4.blue-color4f.blue);
        expect( dif_blue < 0.0001).assertEqual(true);
      } catch( e ) {
        console.info(msg + ` setColor4f 4 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetAndGetColor4fNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1701
     * @tc.desc   testBrushSetAndGetColor4fNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAndGetColor4fNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAndGetColor4fNull';
      const brush = new drawing.Brush();
      let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
      let color4f:common2D.Color4f = {alpha:0.8, red:0.5, green:0.4, blue:0.7};
      try {
        brush.setColor4f(null, colorSpace);
        console.info(msg + `setColor4f 1 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 1 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        brush.setColor4f(undefined, colorSpace);
        console.info(msg + `setColor4f 2 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 2 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        brush.setColor4f(null, null);
        console.info(msg + `setColor4f 3 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 3 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
      try {
        brush.setColor4f(color4f, undefined);
        console.info(msg + `setColor4f 4 successes`);
        expect().assertFail()
      } catch (e) {
        console.info(msg + `setColor4f 4 errorCode is: ${e.code} + errormsg is: ${e.message}}`);
        expect(e.code).assertEqual(401);
      }
    })
    /**
     * @tc.name   testBrushSetAndGetColor4fMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1702
     * @tc.desc   testBrushSetAndGetColor4fMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAndGetColor4fMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAndGetColor4fMultipleCalls';
      try {
        for (let i = 0; i < 20; i += 1) {
          const brush = new drawing.Brush();
          let colorSpace = colorSpaceManager.create(colorSpaceManager.ColorSpace.BT2020_HLG);
          let color4f:common2D.Color4f = {alpha:Math.random() *1, red:Math.random() *1, green:Math.random() *1, blue:Math.random() *1};
          console.info(msg + 'setColor4f  color4f is ' + JSON.stringify(color4f) +' step: ' +i);
          brush.setColor4f(color4f, colorSpace);
          console.info(msg + 'setColor4f success step is ' + i);
          let color = brush.getColor4f();
          console.info(msg + 'getColor4f success color is ' + JSON.stringify(color) +' step: ' +i);
          let dif_alpha = Math.abs(color.alpha-color4f.alpha);
          expect( dif_alpha < 0.0001).assertEqual(true);
          let dif_red = Math.abs(color.red-color4f.red);
          expect( dif_red < 0.0001).assertEqual(true);
          let dif_green = Math.abs(color.green-color4f.green);
          expect( dif_green < 0.0001).assertEqual(true);
          let dif_blue = Math.abs(color.blue-color4f.blue);
          expect( dif_blue < 0.0001).assertEqual(true);
        }
      } catch (e) {
        console.info(msg + `getColor4f errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
    /**
     * @tc.name   testBrushSetAndGetColor4fBoundaryValue
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1703
     * @tc.desc   testBrushSetAndGetColor4fBoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAndGetColor4fBoundaryValue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAndGetColor4fBoundaryValue';
      const brush = new drawing.Brush();
      try {
        brush.setColor4f( {alpha:1.1, red:1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 1 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:-0.999, red:1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 2 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 2 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:1.1, green:1, blue:1}, null);
        console.info(msg + `setColor4f 3 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 3 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:-0.999, green:1, blue:1}, null);
        console.info(msg + `setColor4f 4 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 4 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:1, green:1.1, blue:1}, null);
        console.info(msg + `setColor4f 5 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 5 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:1, green:-0.999, blue:1}, null);
        console.info(msg + `setColor4f 6 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 6 errorCode is:  ${e.code} + errormsg is: ${e.message} `);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:1, green:1, blue:1.1}, null);
        console.info(msg + `setColor4f 7 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 7 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
      try {
        brush.setColor4f( {alpha:1, red:1, green:1, blue:-0.999}, null);
        console.info(msg + `setColor4f 8 successes`);
      } catch (e) {
        console.info(msg + `setColor4f 8 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail()
      }
    })
  });
}