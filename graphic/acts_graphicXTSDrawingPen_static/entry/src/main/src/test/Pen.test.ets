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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { getRandomNumber } from './Util.test';
import { BusinessError } from '@ohos.base';

export default function penTest() {
  describe('DrawingTsPenTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {

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
     * @tc.name   testPenSetColorNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0100
     * @tc.desc   Test for testPenSetColorNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColorNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetColorNormalStatic';
      const pen = new drawing.Pen();
      try {
        const color : common2D.Color ={
          alpha: 255,
          red: 255,
          green: 0,
          blue: 0
        }
        pen.setColor(color);
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        const color : common2D.Color = {
          alpha: 245,
          red: 251,
          green: 10,
          blue: 12
        }
        pen.setColor(color);
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetColorMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0103
     * @tc.desc   Test for testPenSetColorMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColorMultipleCallsStatic';
      try {
        const pen = new drawing.Pen();
        for (let i = 0; i < 20; i++) {
          const color : common2D.Color = {
            alpha: Math.floor(Math.random() * 256).toInt(),
            red: Math.floor(Math.random() * 256).toInt(),
            green: Math.floor(Math.random() * 256).toInt(),
            blue: Math.floor(Math.random() * 256).toInt(),
          };
          pen.setColor(color);
        }
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetColorBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0104
     * @tc.desc   Test for testPenSetColorBoundaryValueStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorBoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColorBoundaryValueStatic';
      const pen = new drawing.Pen();

      try {
        pen.setColor({
          alpha: -1,
          red: 255,
          green: 0,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 256,
          red: 255,
          green: 0,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: -2,
          green: 0,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: 256,
          green: 0,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: 255,
          green: 256,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: 255,
          green: -1,
          blue: 255
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: 255,
          green: 0,
          blue: -1
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        pen.setColor({
          alpha: 255,
          red: 255,
          green: 0,
          blue: 256
        });
        console.info(msg + ' setColor successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });


    /**
     * @tc.name   testPenSetStrokeWidthNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0200
     * @tc.desc   Test for testPenSetStrokeWidthNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetStrokeWidthNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetStrokeWidthNormalStatic';
      const pen = new drawing.Pen();

      try {
        pen.setStrokeWidth(20);
        console.info(msg + ' setStrokeWidth(20) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setStrokeWidth(20) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(1.1);
        console.info(msg + ' setStrokeWidth(1.1) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setStrokeWidth(1.1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(0);
        console.info(msg + ' setStrokeWidth(0) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setStrokeWidth(0) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setStrokeWidth(-1);
        console.info(msg + ' setStrokeWidth(-1) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setStrokeWidth(-1) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetStrokeWidthMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0203
     * @tc.desc   Test for testPenSetStrokeWidthMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetStrokeWidthMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetStrokeWidthMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomStrokeWidth = Math.random() * 100; // Generate a random stroke width
          pen.setStrokeWidth(randomStrokeWidth);
          console.info(msg + ' setStrokeWidth(' + randomStrokeWidth + ') succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setStrokeWidth errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.name   testPenSetAntiAliasNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0300
     * @tc.desc   Test for testPenSetAntiAliasNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAntiAliasNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetAntiAliasNormalStatic';
      const pen = new drawing.Pen();

      try {
        pen.setAntiAlias(true);
        console.info(msg + ' setAntiAlias(true) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAntiAlias(true) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAntiAlias(false);
        console.info(msg + ' setAntiAlias(false) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAntiAlias(false) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetAntiAliasMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0303
     * @tc.desc   Test for testPenSetAntiAliasMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAntiAliasMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetAntiAliasMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          pen.setAntiAlias(randomBoolean);
          console.info(msg + ' setAntiAlias(' + randomBoolean + ') succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAntiAlias errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetAlphaNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0400
     * @tc.desc   Test for testPenSetAlphaNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAlphaNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetAlphaNormalStatic';
      const pen = new drawing.Pen();

      try {
        pen.setAlpha(255);
        console.info(msg + ' setAlpha(255) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha(255) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(0);
        console.info(msg + ' setAlpha(0) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha(0) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        pen.setAlpha(255);
        console.info(msg + ' setAlpha(255.562) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setAlpha(255.562) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetAlphaMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0403
     * @tc.desc   Test for testPenSetAlphaMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAlphaMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetAlphaMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomAlpha = Math.floor(Math.random() * 256).toInt();
          pen.setAlpha(randomAlpha);
          console.info(msg + ' setAlpha(' + randomAlpha + ') succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setAlpha errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0500
     * @tc.desc   Test for testPenSetColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColorFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetColorFilterNormalStatic';
      try {
        const pen = new drawing.Pen();
        let colorFilter: drawing.ColorFilter | undefined = drawing.ColorFilter.createLinearToSRGBGamma();
        if (colorFilter) {
          pen.setColorFilter(colorFilter);
          console.info(msg + ' setColorFilter successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetColorFilterNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0501
     * @tc.desc   Test for testPenSetColorFilterNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorFilterNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColorFilterNullStatic';
      const pen = new drawing.Pen();
      try {
        pen.setColorFilter(null);
        console.info(msg + ' setColorFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColorFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0503
     * @tc.desc   Test for testPenSetColorFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColorFilterMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          let colorFilter: drawing.ColorFilter | undefined = drawing.ColorFilter.createLinearToSRGBGamma();
          if (colorFilter) {
            pen.setColorFilter(colorFilter);
            console.info(msg + ' setColorFilter successed');
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetMaskFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0600
     * @tc.desc   Test for testPenSetMaskFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetMaskFilterNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetMaskFilterNormalStatic';
      try {
        const pen = new drawing.Pen();
        let maskFilter: drawing.MaskFilter | undefined =
          drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10)
        if (maskFilter) {
          pen.setMaskFilter(maskFilter);
          console.info(msg + ' setMaskFilter successed');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetMaskFilterNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0601
     * @tc.desc   Test for testPenSetMaskFilterNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMaskFilterNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetMaskFilterNullStatic';
      const pen = new drawing.Pen();
      try {
        pen.setMaskFilter(null);
        console.info(msg + ' setMaskFilter(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setMaskFilter(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetMaskFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0603
     * @tc.desc   Test for testPenSetMaskFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMaskFilterMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetMaskFilterMultipleCallsStatic';
      const pen = new drawing.Pen();
      let itemList: drawing.BlurType[] = [
        drawing.BlurType.NORMAL,
        drawing.BlurType.SOLID,
        drawing.BlurType.OUTER,
        drawing.BlurType.INNER
      ];
      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(4 * Math.random()).toInt();
          const randomValue = Math.floor(Math.random() * 100) + 1;
          let maskFilter: drawing.MaskFilter | undefined =
            drawing.MaskFilter.createBlurMaskFilter(itemList[randomEnum], randomValue)
          if (maskFilter) {
            pen.setMaskFilter(maskFilter);
            console.info(msg + ' setMaskFilter(' + itemList[randomEnum] + ', ' + randomValue + ') succeeded');
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetShadowLayerNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0700
     * @tc.desc   Test for testPenSetShadowLayerNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetShadowLayerNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetShadowLayerNormalStatic';
      try {
        const pen = new drawing.Pen();
        let shadowLayer: drawing.ShadowLayer | undefined = drawing.ShadowLayer.create(3, -3, 3, {
          alpha: 0xFF,
          red: 0x00,
          green: 0xFF,
          blue: 0x00
        })
        if (shadowLayer) {
          pen.setShadowLayer(shadowLayer);
          console.info(msg + ' setShadowLayer succeeded');
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetShadowLayerNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0701
     * @tc.desc   Test for testPenSetShadowLayerNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetShadowLayerNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetShadowLayerNullStatic';
      const pen = new drawing.Pen();
      try {
        pen.setShadowLayer(null);
        console.info(msg + ' setShadowLayer(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setShadowLayer(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetShadowLayerMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0703
     * @tc.desc   Test for testPenSetShadowLayerMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetShadowLayerMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetShadowLayerMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomColor: common2D.Color = {
            alpha: Math.floor(Math.random() * 256).toInt(),
            red: Math.floor(Math.random() * 256).toInt(),
            green: Math.floor(Math.random() * 256).toInt(),
            blue: Math.floor(Math.random() * 256).toInt(),
          };
          let shadowLayer: drawing.ShadowLayer | undefined =
            drawing.ShadowLayer.create(Math.random() * 100, Math.random() * 100, Math.random() * 100, randomColor)
          if (shadowLayer) {
            pen.setShadowLayer(shadowLayer);
            console.info(msg + ' setShadowLayer succeeded');
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setShadowLayer errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testPenSetBlendModeNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0800
     * @tc.desc   Test for testPenSetBlendModeNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetBlendModeNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetBlendModeNormalStatic';
      try {
        const pen = new drawing.Pen();
        pen.setBlendMode(drawing.BlendMode.SRC);
        console.info(msg + ' setBlendMode successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetBlendModeMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0803
     * @tc.desc   Test for testPenSetBlendModeMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetBlendModeMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetBlendModeMultipleCallsStatic';
      const pen = new drawing.Pen();
      let itemList: drawing.BlendMode[] = [
        drawing.BlendMode.CLEAR,
        drawing.BlendMode.SRC,
        drawing.BlendMode.DST,
        drawing.BlendMode.SRC_OVER,
        drawing.BlendMode.DST_OVER,
        drawing.BlendMode.SRC_IN,
        drawing.BlendMode.DST_IN,
        drawing.BlendMode.SRC_OUT,
        drawing.BlendMode.DST_OUT,
        drawing.BlendMode.SRC_ATOP,
        drawing.BlendMode.DST_ATOP,
        drawing.BlendMode.XOR,
        drawing.BlendMode.PLUS,
        drawing.BlendMode.MODULATE,
        drawing.BlendMode.SCREEN,
        drawing.BlendMode.OVERLAY,
        drawing.BlendMode.DARKEN,
        drawing.BlendMode.LIGHTEN,
        drawing.BlendMode.COLOR_DODGE,
        drawing.BlendMode.COLOR_BURN,
        drawing.BlendMode.HARD_LIGHT,
        drawing.BlendMode.SOFT_LIGHT,
        drawing.BlendMode.DIFFERENCE,
        drawing.BlendMode.EXCLUSION,
        drawing.BlendMode.MULTIPLY,
        drawing.BlendMode.HUE,
        drawing.BlendMode.SATURATION,
        drawing.BlendMode.COLOR,
        drawing.BlendMode.LUMINOSITY
      ];
      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(29 * Math.random()).toInt();
        try {
          pen.setBlendMode(itemList[randomEnum]);
          console.info(msg + ' setBlendMode succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setBlendMode errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testPenSetGetJoinStyleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0900
     * @tc.desc   Test for testPenSetGetJoinStyleNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetGetJoinStyleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetGetJoinStyleNormalStatic';
      const pen = new drawing.Pen();
      try {
        pen.setJoinStyle(drawing.JoinStyle.ROUND_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.ROUND_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.MITER_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.MITER_JOIN);
        pen.setJoinStyle(drawing.JoinStyle.BEVEL_JOIN);
        expect(pen.getJoinStyle()).assertEqual(drawing.JoinStyle.BEVEL_JOIN);
        console.info(msg + ' setJoinStyle successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetGetJoinStyleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0903
     * @tc.desc   Test for testPenSetGetJoinStyleMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetGetJoinStyleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetGetJoinStyleMultipleCallsStatic';
      const pen = new drawing.Pen();
      let itemList: drawing.JoinStyle[] = [
        drawing.JoinStyle.MITER_JOIN,
        drawing.JoinStyle.BEVEL_JOIN,
        drawing.JoinStyle.ROUND_JOIN
      ];
      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          pen.setJoinStyle(itemList[randomEnum]);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          pen.getJoinStyle();
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          pen.setJoinStyle(itemList[randomEnum]);
          const anotherJoinStyle = pen.getJoinStyle();
          expect(itemList[randomEnum]).assertEqual(anotherJoinStyle);
          console.info(msg + ' setJoinStyle succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetJoinStyleWhenNoSetJoinStyle
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_0904
     * @tc.desc   Test for testPenGetJoinStyleWhenNoSetJoinStyle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetJoinStyleWhenNoSetJoinStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPenGetJoinStyleWhenNoSetJoinStyle';
      const pen = new drawing.Pen();
      try {
        pen.getJoinStyle();
        console.info(msg + ' getJoinStyle successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getJoinStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetGetCapStyleNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1000
     * @tc.desc   Test for testPenSetGetCapStyleNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetGetCapStyleNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetGetCapStyleNormalStatic';
      const pen = new drawing.Pen();
      try {
        pen.setCapStyle(drawing.CapStyle.SQUARE_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.SQUARE_CAP);
        pen.setCapStyle(drawing.CapStyle.FLAT_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.FLAT_CAP);
        pen.setCapStyle(drawing.CapStyle.ROUND_CAP);
        expect(pen.getCapStyle()).assertEqual(drawing.CapStyle.ROUND_CAP);
        console.info(msg + ' setCapStyle successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetGetCapStyleMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1003
     * @tc.desc   Test for testPenSetGetCapStyleMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetGetCapStyleMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetGetCapStyleMultipleCallsStatic';
      const pen = new drawing.Pen();
      let itemList: drawing.CapStyle[] = [
        drawing.CapStyle.FLAT_CAP,
        drawing.CapStyle.ROUND_CAP,
        drawing.CapStyle.SQUARE_CAP
      ];
      // Step 1: Set the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          pen.setCapStyle(itemList[randomEnum]);
          console.info(msg + ' setCapStyle(' + itemList[randomEnum] + ') succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      // Step 2: Get the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          pen.getCapStyle();
          console.info(msg + ' getCapStyle succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` getCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      // Step 3: Alternate setting and getting the cap style 20 times
      for (let i = 0; i < 20; i++) {
        try {
          const randomEnum = Math.floor(3 * Math.random()).toInt();
          pen.setCapStyle(itemList[randomEnum]);
          console.info(msg + ' setCapStyle(' + itemList[randomEnum] + ') succeeded');
          const anotherCapStyle = pen.getCapStyle();
          expect(itemList[randomEnum]).assertEqual(anotherCapStyle);
          console.info(msg + ' setCapStyle and getCapStyle succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenGetCapStyleWhenNoSetCapStyleStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1004
     * @tc.desc   Test for testPenGetCapStyleWhenNoSetCapStyleStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetCapStyleWhenNoSetCapStyleStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const msg = 'testPenGetCapStyleWhenNoSetCapStyleStatic';
      const pen = new drawing.Pen();
      try {
        pen.getCapStyle();
        console.info(msg + ' getCapStyle successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getCapStyle errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetDitherNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1100
     * @tc.desc   Test for testPenSetDitherNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetDitherNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetDitherNormalStatic';
      const pen = new drawing.Pen();
      try {
        pen.setDither(true);
        console.info(msg + ' setDither successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        pen.setDither(false);
        console.info(msg + ' setDither successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetDitherMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1103
     * @tc.desc   Test for testPenSetDitherMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetDitherMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetDitherMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const randomBoolean = Math.random() < 0.5;
          pen.setDither(randomBoolean);
          console.info(msg + ' setDither(' + randomBoolean + ') succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setDither errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testPenSetPathEffectNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1200
     * @tc.desc   Test for testPenSetPathEffectNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetPathEffectNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetPathEffectNormalStatic';
      const pen = new drawing.Pen();
      try {
        const dashPathEffect: drawing.PathEffect | undefined = drawing.PathEffect.createDashPathEffect([30, 10], 0);
        if (dashPathEffect) {
          pen.setPathEffect(dashPathEffect);
        }
        console.info(msg + ' setPathEffect successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetPathEffectNullStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1201
     * @tc.desc   Test for testPenSetPathEffectNullStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetPathEffectNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetPathEffectNullStatic';
      const pen = new drawing.Pen();
      try {
        // Step 2: Set the path effect to null
        pen.setPathEffect(null);
        console.info(msg + ' setPathEffect(null) succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setPathEffect(null) errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testPenSetPathEffectMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1203
     * @tc.desc   Test for testPenSetPathEffectMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetPathEffectMultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetPathEffectMultipleCallsStatic';
      const pen = new drawing.Pen();

      for (let i = 0; i < 20; i++) {
        try {
          const dashPathEffect: drawing.PathEffect | undefined = drawing.PathEffect.createDashPathEffect([30, 10], 0);
          if (dashPathEffect) {
            pen.setPathEffect(dashPathEffect);
          }
          console.info(msg + ' setPathEffect succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` setPathEffect errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.name   testPenSetColor12NormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1300
     * @tc.desc   testPenSetColor12NormalStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColor12NormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const msg = 'testPenSetColor12NormalStatic';
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, 0);
        pen.setColor(245, 251, 10, 12);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testPenSetColor12MultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1303
     * @tc.desc   testPenSetColor12MultipleCallsStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColor12MultipleCallsStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColor12MultipleCallsStatic';
      try {
        const pen = new drawing.Pen();
        for (let index = 0; index < 20; index++) {
          pen.setColor(getRandomNumber(0, 255).toInt(), getRandomNumber(0, 255).toInt(),
            getRandomNumber(0, 255).toInt(),
            getRandomNumber(0, 255).toInt());
        }
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testPenSetColor12BoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_PEN_STATIC_1304
     * @tc.desc   testPenSetColor12BoundaryValueStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColor12BoundaryValueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      const msg = 'testPenSetColor12BoundaryValueStatic';
      try {
        const pen = new drawing.Pen();
        pen.setColor(-1, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, -1, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(256, 255, -1, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, -1);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(256, 255, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 256, 0, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 256, 0);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
      try {
        const pen = new drawing.Pen();
        pen.setColor(255, 255, 0, 256);
        console.info(msg + ' setColor12 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setColor12 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
  });
}