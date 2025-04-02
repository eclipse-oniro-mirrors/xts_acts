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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getEnumCount, getRandomNumber } from './utils';

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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0100
     * @tc.name      : testBrushSetColorNormal
     * @tc.desc      : Test for testBrushSetColorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetColorNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0101
     * @tc.name      : testBrushSetColorNull
     * @tc.desc      : Test for testBrushSetColorNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColorNull', DEFAULT, () => {
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
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0103
     * @tc.name      : testBrushSetColorMultipleCalls
     * @tc.desc      : Test for testBrushSetColorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColorMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0104
     * @tc.name      : testBrushSetColorBoundaryValue
     * @tc.desc      : Test for testBrushSetColorBoundaryValue.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColorBoundaryValue', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0200
     * @tc.name      : testBrushSetAntiAliasNormal
     * @tc.desc      : Test for testBrushSetAntiAliasNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetAntiAliasNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0201
     * @tc.name      : testBrushSetAntiAliasNull
     * @tc.desc      : Test for testBrushSetAntiAliasNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetAntiAliasNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0203
     * @tc.name      : testBrushSetAntiAliasMultipleCalls
     * @tc.desc      : Test for testBrushSetAntiAliasMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetAntiAliasMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0300
     * @tc.name      : testBrushSetAlphaNormal
     * @tc.desc      : Test for testBrushSetAlphaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetAlphaNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0301
     * @tc.name      : testBrushSetAlphaNull
     * @tc.desc      : Test for testBrushSetAlphaNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetAlphaNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0303
     * @tc.name      : testBrushSetAlphaMultipleCalls
     * @tc.desc      : Test for testBrushSetAlphaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetAlphaMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0400
     * @tc.name      : testBrushSetColorFilterNormal
     * @tc.desc      : Test for testBrushSetColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetColorFilterNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0401
     * @tc.name      : testBrushSetColorFilterNull
     * @tc.desc      : Test for testBrushSetColorFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColorFilterNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0403
     * @tc.name      : testBrushSetColorFilterMultipleCalls
     * @tc.desc      : Test for testBrushSetColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColorFilterMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0500
     * @tc.name      : testBrushSetMaskFilterNormal
     * @tc.desc      : Test for testBrushSetMaskFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetMaskFilterNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0501
     * @tc.name      : testBrushSetMaskFilterNull
     * @tc.desc      : Test for testBrushSetMaskFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetMaskFilterNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0503
     * @tc.name      : testBrushSetMaskFilterMultipleCalls
     * @tc.desc      : Test for testBrushSetMaskFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetMaskFilterMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0600
     * @tc.name      : testBrushSetShadowLayerNormal
     * @tc.desc      : Test for testBrushSetShadowLayerNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetShadowLayerNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0601
     * @tc.name      : testBrushSetShadowLayerNull
     * @tc.desc      : Test for testBrushSetShadowLayerNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetShadowLayerNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0603
     * @tc.name      : testBrushSetShadowLayerMultipleCalls
     * @tc.desc      : Test for testBrushSetShadowLayerMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetShadowLayerMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0700
     * @tc.name      : testBrushSetBlendModeNormal
     * @tc.desc      : Test for testBrushSetBlendModeNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetBlendModeNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0701
     * @tc.name      : testBrushSetBlendModeNull
     * @tc.desc      : Test for testBrushSetBlendModeNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetBlendModeNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0703
     * @tc.name      : testBrushSetBlendModeMultipleCalls
     * @tc.desc      : Test for testBrushSetBlendModeMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetBlendModeMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0800
     * @tc.name      : testBrushSetColor12Normal
     * @tc.desc      : testBrushSetColor12Normal
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetColor12Normal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0801
     * @tc.name      : testBrushSetColor12Null
     * @tc.desc      : testBrushSetColor12Null
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColor12Null', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0803
     * @tc.name      : testBrushSetColor12MultipleCalls
     * @tc.desc      : testBrushSetColor12MultipleCalls
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColor12MultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0804
     * @tc.name      : testBrushSetColor12BoundaryValue
     * @tc.desc      : testBrushSetColor12BoundaryValue
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetColor12BoundaryValue', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0900
     * @tc.name      : testBrushSetImageFilterNormal
     * @tc.desc      : Test for testBrushSetImageFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetImageFilterNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0901
     * @tc.name      : testBrushSetImageFilterNull
     * @tc.desc      : Test for testBrushSetImageFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetImageFilterNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_0903
     * @tc.name      : testBrushSetImageFilterMultipleCalls
     * @tc.desc      : Test for testBrushSetImageFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetImageFilterMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1000
     * @tc.name      : testBrushGetColorFilterNormal
     * @tc.desc      : Test for testBrushGetColorFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushGetColorFilterNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1002
     * @tc.name      : testBrushGetColorFilterMultipleCalls
     * @tc.desc      : Test for testBrushGetColorFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushGetColorFilterMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1100
     * @tc.name      : testBrushConstructorNormal
     * @tc.desc      : Test for testBrushConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushConstructorNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1103
     * @tc.name      : testBrushConstructorMultipleCalls
     * @tc.desc      : Test for testBrushConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushConstructorMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1200
     * @tc.name      : testBrushGetAlphaNormal
     * @tc.desc      : Test for testBrushGetAlphaNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushGetAlphaNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1202
     * @tc.name      : testBrushGetAlphaMultipleCalls
     * @tc.desc      : Test for testBrushGetAlphaMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushGetAlphaMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1300
     * @tc.name      : testBrushIsAntiAliasNormal
     * @tc.desc      : Test for testBrushIsAntiAliasNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushIsAntiAliasNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1302
     * @tc.name      : testBrushIsAntiAliasMultipleCalls
     * @tc.desc      : Test for testBrushIsAntiAliasMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushIsAntiAliasMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1400
     * @tc.name      : testBrushGetColorNormal
     * @tc.desc      : Test for testBrushGetColorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushGetColorNormal' , DEFAULT , () => {
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
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:'+ JSON.stringify(colorGet));
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
        expect(JSON.stringify(colorGet) == JSON.stringify(colors)).assertTrue();
        console.info(msg + ' getColor3 successed,colorGet:'+ JSON.stringify(colorGet));
      } catch( e ) {
        console.info(msg + ` getColor3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1402
     * @tc.name      : testBrushGetColorMultipleCalls
     * @tc.desc      : Test for testBrushGetColorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushGetColorMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1500
     * @tc.name      : testBrushSetShaderEffectNormal
     * @tc.desc      : Test for testBrushSetShaderEffectNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetShaderEffectNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1501
     * @tc.name      : testBrushSetShaderEffectNull
     * @tc.desc      : Test for testBrushSetShaderEffectNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushSetShaderEffectNull' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1503
     * @tc.name      : testBrushSetShaderEffectMultipleCalls
     * @tc.desc      : Test for testBrushSetShaderEffectMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushSetShaderEffectMultipleCalls' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1600
     * @tc.name      : testBrushResetNormal
     * @tc.desc      : Test for testBrushResetNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testBrushResetNormal' , DEFAULT , () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_1602
     * @tc.name      : testBrushResetMultipleCalls
     * @tc.desc      : Test for testBrushResetMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testBrushResetMultipleCalls' , DEFAULT , () => {
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
  });
}