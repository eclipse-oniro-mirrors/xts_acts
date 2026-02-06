/*
 * Copyright (C) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './Util.test';
import { BusinessError } from '@ohos.base';

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
     * @tc.name   testBrushSetColorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0100
     * @tc.desc   Test for testBrushSetColorNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColorNormalStatic';
      const brush = new drawing.Brush();
      const colors: Array<common2D.Color> = [
        {
          alpha: 255, red: 255, green: 0, blue: 0
        },
        {
          alpha: 245, red: 251, green: 10, blue: 12
        },
      ];
      for (let i = 0; i < colors.length; i++) {
        try {
          brush.setColor(colors[i]);
          console.info(msg + ` setColor succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setColor failed. Error code is: ${e.code}. Error message is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0103
     * @tc.desc   Test for testBrushSetColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        const alpha: int = Math.floor(Math.random() * 256).toInt();
        const red: int = Math.floor(Math.random() * 256).toInt();
        const green: int = Math.floor(Math.random() * 256).toInt();
        const blue: int = Math.floor(Math.random() * 256).toInt();
        try {
          brush.setColor({
            alpha, red, green, blue
          });
          console.info(msg + ' setColor successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetColorBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0104
     * @tc.desc   Test for testBrushSetColorBoundaryValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorBoundaryValueStatic';
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
          e = e as BusinessError;
          console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`)
          expect(e.code).assertEqual(401);
        }
      }
    });
    /**
     * @tc.name   testBrushSetAntiAliasNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0200
     * @tc.desc   Test for testBrushSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAntiAliasNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetAntiAliasNormalStatic';
      const brush = new drawing.Brush();
      try {
        brush.setAntiAlias(true);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        brush.setAntiAlias(false);
        console.info(msg + ' setAntiAlias successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetAntiAliasMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0203
     * @tc.desc   Test for testBrushSetAntiAliasMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAntiAliasMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAntiAliasMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          brush.setAntiAlias(randomBoolean);
          console.info(msg + ' setAntiAlias successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetAlphaNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0300
     * @tc.desc   Test for testBrushSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetAlphaNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetAlphaNormalStatic';
      const brush = new drawing.Brush();
      try {
        brush.setAlpha(255);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        brush.setAlpha(0);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        brush.setAlpha(100);
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetAlphaMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0303
     * @tc.desc   Test for testBrushSetAlphaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetAlphaMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetAlphaMultipleCallsStatic';
      try {
        const brush = new drawing.Brush();
        for (let i = 0; i < 20; i++) {
          const randomAlpha = Math.floor(Math.random() * 256).toInt();
          brush.setAlpha(randomAlpha);
        }
        console.info(msg + ' setAlpha successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0400
     * @tc.desc   Test for testBrushSetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColorFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColorFilterNormalStatic';
      try {
        const brush = new drawing.Brush();
        let colorFilter:drawing.ColorFilter | undefined= drawing.ColorFilter.createLinearToSRGBGamma();
        if(colorFilter !== undefined) {
          brush.setColorFilter(colorFilter);
          console.info(msg + ' setColorFilter successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColorFilterNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0401
     * @tc.desc   Test for testBrushSetColorFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorFilterNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorFilterNullStatic';
      const brush = new drawing.Brush();
      try {
        brush.setColorFilter(null);
        console.info(msg + ' setColorFilter successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0403
     * @tc.desc   Test for testBrushSetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColorFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColorFilterMultipleCallsStatic';
      const brush = new drawing.Brush();
      let setColorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
      try {
        if(setColorFilter !== undefined){
          for (let i = 0; i < 20; i++) {
            brush.setColorFilter(setColorFilter);
            console.info(msg + ' setColorFilter successed');
          }
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetMaskFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0500
     * @tc.desc   Test for testBrushSetMaskFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetMaskFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetMaskFilterNormalStatic';
      try {
        const brush = new drawing.Brush();
        let maskFilter =  drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10)
        if(maskFilter !== undefined){
          brush.setMaskFilter(maskFilter);
          console.info(msg + ' setMaskFilter successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetMaskFilterNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0501
     * @tc.desc   Test for testBrushSetMaskFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetMaskFilterNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetMaskFilterNullStatic';
      try {
        const brush = new drawing.Brush();
        brush.setMaskFilter(null);
        console.info(msg + ' setMaskFilter successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testBrushSetMaskFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0503
     * @tc.desc   Test for testBrushSetMaskFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetMaskFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetMaskFilterMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          let maskFilter = drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
          if(maskFilter !== undefined) {
            brush.setMaskFilter(maskFilter);
            console.info(msg + ' setMaskFilter successed');
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetShadowLayerNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0600
     * @tc.desc   Test for testBrushSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShadowLayerNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetShadowLayerNormalStatic';
      try {
        const brush = new drawing.Brush();
        let shadowLayer = drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF, red: 0x00, green: 0xFF, blue: 0x00
        })
        if( shadowLayer !== undefined){
          brush.setShadowLayer(shadowLayer);
          console.info(msg + ' setShadowLayer successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetShadowLayerNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0601
     * @tc.desc   Test for testBrushSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShadowLayerNullStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetShadowLayerNullStatic';
      const brush = new drawing.Brush();
      try {
        brush.setShadowLayer(null);
        console.info(msg + ' setShadowLayer successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetShadowLayerMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0603
     * @tc.desc   Test for testBrushSetShadowLayerMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShadowLayerMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetShadowLayerMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          const radius = Math.floor(getRandomNumber(1, 100));
          const dx = Math.floor(Math.random() * 100);
          const dy = Math.floor(Math.random() * 100);
          const color: common2D.Color = {
            alpha: Math.floor(Math.random() * 256).toInt(),
            red: Math.floor(Math.random() * 256).toInt(),
            green: Math.floor(Math.random() * 256).toInt(),
            blue: Math.floor(Math.random() * 256).toInt(),
          };
          let shadowLayer = drawing.ShadowLayer.create(radius, dx, dy, color);
          if(shadowLayer !== undefined){
            brush.setShadowLayer(shadowLayer);
            console.info(msg + ' setShadowLayer successed');
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetBlendModeNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0700
     * @tc.desc   Test for testBrushSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetBlendModeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetBlendModeNormalStatic';
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
        e = e as BusinessError;
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetBlendModeMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0703
     * @tc.desc   Test for testBrushSetBlendModeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetBlendModeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetBlendModeMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          brush.setBlendMode(drawing.BlendMode.CLEAR);
          console.info(msg + ' setBlendMode successed');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetColor12NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0800
     * @tc.desc   testBrushSetColor12Normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetColor12NormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testBrushSetColor12NormalStatic';
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, 0);
        brush.setColor(245, 251, 10, 12);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetColor12MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0803
     * @tc.desc   testBrushSetColor12MultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor12MultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColor12MultipleCallsStatic';
      try {
        const brush = new drawing.Brush();
        for (let index = 0; index < 20; index++) {
          let alpha = Math.floor(Math.random() * 255).toInt();
          let red = Math.floor(Math.random() * 255).toInt();
          let green = Math.floor(Math.random() * 255).toInt();
          let blue = Math.floor(Math.random() * 255).toInt();
          brush.setColor(alpha, red, green, blue);
        }
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testBrushSetColor12BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0804
     * @tc.desc   testBrushSetColor12BoundaryValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetColor12BoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testBrushSetColor12BoundaryValueStatic';
      try {
        const brush = new drawing.Brush();
        brush.setColor(-1, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, -1, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(256, 255, -1, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, -1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(256, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 256, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 256, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const brush = new drawing.Brush();
        brush.setColor(255, 255, 0, 256);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testBrushSetImageFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0900
     * @tc.desc   Test for testBrushSetImageFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetImageFilterNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetImageFilterNormalStatic';
      const brush = new drawing.Brush();
      let imgFilter:drawing.ImageFilter | undefined = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.DECAL);
      if(imgFilter !== undefined) {
        try {
          brush.setImageFilter(imgFilter);
          console.info(msg + ' setImageFilter successed');
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` setImageFilter errorCode 1 is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
        try {
          brush.setImageFilter(null);
          console.info(msg + ' setImageFilter(null) succeeded');
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` setImageFilter errorCode 2 is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetImageFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_0903
     * @tc.desc   Test for testBrushSetImageFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetImageFilterMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushSetImageFilterMultipleCallsStatic';
      const brush = new drawing.Brush();
      let imgFilter:drawing.ImageFilter | undefined = drawing.ImageFilter.createBlurImageFilter(5, 10, drawing.TileMode.DECAL);
      if(imgFilter !== undefined) {
        for (let i = 0; i < 20; i++) {
          try {
            brush.setImageFilter(imgFilter);
            console.info(msg + ' setImageFilter succeeded');
          } catch (e) {
            e = e as BusinessError;
            console.info(msg + ` setImageFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });
    /**
     * @tc.name   testBrushGetColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1000
     * @tc.desc   Test for testBrushGetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetColorFilterNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetColorFilterNormalStatic';
      const brush = new drawing.Brush();
      try {
        let cf = drawing.ColorFilter.createLumaColorFilter();
        let cf2 = brush.getColorFilter();
        console.info(msg + ' 1 getColorFilter successed,cf:' + cf2);
        expect(cf2 == undefined).assertTrue();
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` 1 getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let setColorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        if (setColorFilter != undefined) {
          brush.setColorFilter(setColorFilter!);
        }
        let filter = brush.getColorFilter();
        console.info(msg + ' 2 getColorFilter successed,cf:' + filter);
        if(filter == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` 2 getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushGetColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1002
     * @tc.desc   Test for testBrushGetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColorFilterMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetColorFilterMultipleCallsStatic';
      const brush = new drawing.Brush();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let cf2 = brush.getColorFilter();
          console.info(msg + ' getColorFilter successed,cf:' + cf2);
          expect(cf2 == undefined).assertTrue();
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` getColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushConstructorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1100
     * @tc.desc   Test for testBrushConstructorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushConstructorNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushConstructorNormalStatic';
      const brush = new drawing.Brush();
      try {
        let brush = new drawing.Brush();
        console.info(msg + ' drawing.Brush() successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        let newBrush = new drawing.Brush(brush);
        console.info(msg + ' drawing.Brush() successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        brush.setColor({
          alpha : 255 , red : 255 , green : 255 , blue : 255
        });
        let newBrush = new drawing.Brush(brush);
        console.info(msg + ' drawing.Brush() successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` drawing.Brush() errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushConstructorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1103
     * @tc.desc   Test for testBrushConstructorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushConstructorMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushConstructorMultipleCallsStatic';
      const brush = new drawing.Brush();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let alpha = Math.floor(Math.random() * 255).toInt();
          let red = Math.floor(Math.random() * 255).toInt();
          let green = Math.floor(Math.random() * 255).toInt();
          let blue = Math.floor(Math.random() * 255).toInt();
          brush.setColor(alpha, red, green, blue);
          const newBrush = new drawing.Brush(brush)
          console.info(msg + ' drawing.Brush succeeded');
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` drawing.Brush errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushGetAlphaNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1200
     * @tc.desc   Test for testBrushGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetAlphaNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetAlphaNormalStatic';
      const brush = new drawing.Brush();

      try {
        let alpha = brush.getAlpha();
        expect(alpha == 255).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(128);
        let alpha = brush.getAlpha();
        expect(alpha == 128).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAlpha(0);
        let alpha = brush.getAlpha();
        expect(alpha == 0).assertTrue();
        console.info(msg + ' getAlpha successed,alpha:' + alpha);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushGetAlphaMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1202
     * @tc.desc   Test for testBrushGetAlphaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetAlphaMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetAlphaMultipleCallsStatic';
      const brush = new drawing.Brush();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let alpha = brush.getAlpha();
          expect(alpha == 255).assertTrue();
          console.info(msg + ' getAlpha successed,alpha:' + alpha);
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` getAlpha errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushIsAntiAliasNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1300
     * @tc.desc   Test for testBrushIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushIsAntiAliasNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushIsAntiAliasNormalStatic';
      const brush = new drawing.Brush();

      try {
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(true);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == true).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }

      try {
        brush.setAntiAlias(false);
        let isAntiAlias = brush.isAntiAlias();
        expect(isAntiAlias == false).assertTrue();
        console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushIsAntiAliasMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1302
     * @tc.desc   Test for testBrushIsAntiAliasMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushIsAntiAliasMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushIsAntiAliasMultipleCallsStatic';
      const brush = new drawing.Brush();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let isAntiAlias = brush.isAntiAlias();
          expect(isAntiAlias == false).assertTrue();
          console.info(msg + ' isAntiAlias successed,isAntiAlias:' + isAntiAlias);
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` isAntiAlias errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushGetColorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1400
     * @tc.desc   Test for testBrushGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushGetColorNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushGetColorNormalStatic';
      const brush = new drawing.Brush();
      try {
        let colorGet = brush.getColor();
        expect(colorGet != null).assertTrue();
        console.info(msg + ' getColor successed,colorGet:'+ JSON.stringify(colorGet));
        if(colorGet == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getColor1 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        const colors: common2D.Color = {
          alpha : 0 , red : 0 , green : 0 , blue : 0
        }
        brush.setColor(colors);
        let colorGet = brush.getColor() as common2D.Color;
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor2 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 2 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor2 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 2 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getColor2 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        const colors: common2D.Color = {
          alpha : 255 , red : 255 , green : 255 , blue : 255
        }
        brush.setColor(colors);
        let colorGet = brush.getColor() as common2D.Color;
        expect(colors.alpha == colorGet.alpha).assertTrue();
        expect(colors.red == colorGet.red).assertTrue();
        expect(colors.green == colorGet.green).assertTrue();
        expect(colors.blue == colorGet.blue).assertTrue();
        console.info(msg + ' getColor3 successed,colorGet:'+ JSON.stringify(colorGet));
        console.info(`${msg} 3 colorGet.alpha: ${colorGet.alpha} colorGet.red: ${colorGet.red} colorGet.green: ${colorGet.green} colorGet.blue: ${colorGet.blue}`);
        console.info(msg + ' getColor3 successed,colors:'+ JSON.stringify(colors));
        console.info(`${msg} 3 colors.alpha: ${colors.alpha} colors.red: ${colors.red} colors.green: ${colors.green} colors.blue: ${colors.blue}`);
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` getColor3 errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushGetColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1402
     * @tc.desc   Test for testBrushGetColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushGetColorMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushGetColorMultipleCallsStatic';
      const brush = new drawing.Brush();
      for ( let i = 0 ; i < 20 ; i ++ ) {
        try {
          let colorGet = brush.getColor();
          expect(colorGet != null).assertTrue();
          console.info(msg + ' getColor successed');
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` getColor errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testBrushSetShaderEffectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1500
     * @tc.desc   Test for testBrushSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushSetShaderEffectNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testBrushSetShaderEffectNormalStatic';
      const brush = new drawing.Brush();
      let shaderEffect = drawing.ShaderEffect.createLinearGradient({x: 100, y: 100}, {x: 300, y: 300},
        [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
      try {
        if(shaderEffect !== undefined){
          brush.setShaderEffect(shaderEffect);
          console.info(msg + ' setShaderEffect successed');
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` setShaderEffect errorCode 1 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
      try {
        brush.setShaderEffect(null);
        console.info(msg + ' setShaderEffect null successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` setShaderEffect errorCode 2 is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushSetShaderEffectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1503
     * @tc.desc   Test for testBrushSetShaderEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushSetShaderEffectMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testBrushSetShaderEffectMultipleCallsStatic';
      const brush = new drawing.Brush();
      let shaderEffect:drawing.ShaderEffect | undefined= drawing.ShaderEffect.createLinearGradient({x: 100, y: 100},
        {x: 300, y: 300}, [0xFF00FF00.toInt(), 0xFFFF0000.toInt()], drawing.TileMode.REPEAT);
      if(shaderEffect !== undefined){
        for ( let i = 0 ; i < 20 ; i ++ ) {
          try {
            brush.setShaderEffect(shaderEffect);
            console.info(msg + ' setShaderEffect succeeded');
          } catch(e) {
            e = e as BusinessError ;
            console.info(msg + ` setShaderEffect errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
            expect().assertFail();
          }
        }
      }
    });
    /**
     * @tc.name   testBrushResetNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1600
     * @tc.desc   Test for testBrushResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBrushResetNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const msg = 'testBrushResetNormalStatic';
      const brush = new drawing.Brush();
      try {
        brush.reset();
        console.info(msg + ' reset successed');
      } catch (e) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        brush.setColor(255, 255, 0, 0);
        brush.reset();
        console.info(msg + ' reset successed');
      } catch (e) {
        console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testBrushResetMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_BRUSH_STATIC_1602
     * @tc.desc   Test for testBrushResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBrushResetMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const msg = 'testBrushResetMultipleCallsStatic';
      const brush = new drawing.Brush();
      for (let i = 0; i < 20; i++) {
        try {
          brush.reset();
          console.info(msg + ' reset succeeded');
        } catch (e) {
          console.info(msg + ` reset errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  });
}