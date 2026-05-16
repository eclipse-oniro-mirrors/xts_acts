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
import image from '@ohos.multimedia.image';
import drawing from '@ohos.graphics.drawing';
import common2D from '@ohos.graphics.common2D';
import { BusinessError } from '@ohos.base';

export default function colorFilterTest() {
  describe('DrawingTsColorFilterTest', () => {
    let pixel: image.PixelMap;
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      const color: ArrayBuffer = new ArrayBuffer(40000); // 96为需要创建的像素buffer大小，取值为：height * width *4
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: {
          height: 100,
          width: 100
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
     * @tc.name   testColorFilterCreateBlendModeColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0100
     * @tc.desc   Test for testColorFilterCreateBlendModeColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateBlendModeColorFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterNormalStatic';
      try {
        let colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.CLEAR);
        if(colorFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC);
        if(colorFilter == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST);
        if(colorFilter == undefined){
          console.info(msg + ' 3 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OVER);
        if(colorFilter == undefined){
          console.info(msg + ' 4 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OVER);
        if(colorFilter == undefined){
          console.info(msg + ' 5 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_IN);
        if(colorFilter == undefined){
          console.info(msg + ' 6 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_IN);
        if(colorFilter == undefined){
          console.info(msg + ' 7 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_OUT);
        if(colorFilter == undefined){
          console.info(msg + ' 8 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_OUT);
        if(colorFilter == undefined){
          console.info(msg + ' 9 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SRC_ATOP);
        if(colorFilter == undefined){
          console.info(msg + ' 10 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DST_ATOP);
        if(colorFilter == undefined){
          console.info(msg + ' 11 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.XOR);
        if(colorFilter == undefined){
          console.info(msg + ' 12 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.PLUS);
        if(colorFilter == undefined){
          console.info(msg + ' 13 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MODULATE);
        if(colorFilter == undefined){
          console.info(msg + ' 14 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SCREEN);
        if(colorFilter == undefined){
          console.info(msg + ' 15 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.OVERLAY);
        if(colorFilter == undefined){
          console.info(msg + ' 16 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DARKEN);
        if(colorFilter == undefined){
          console.info(msg + ' 17 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LIGHTEN);
        if(colorFilter == undefined){
          console.info(msg + ' 18 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_DODGE);
        if(colorFilter == undefined){
          console.info(msg + ' 19 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR_BURN);
        if(colorFilter == undefined){
          console.info(msg + ' 20 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HARD_LIGHT);
        if(colorFilter == undefined){
          console.info(msg + ' 21 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SOFT_LIGHT);
        if(colorFilter == undefined){
          console.info(msg + ' 22 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.DIFFERENCE);
        if(colorFilter == undefined){
          console.info(msg + ' 23 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.EXCLUSION);
        if(colorFilter == undefined){
          console.info(msg + ' 24 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.MULTIPLY);
        if(colorFilter == undefined){
          console.info(msg + ' 25 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.HUE);
        if(colorFilter == undefined){
          console.info(msg + ' 26 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.SATURATION);
        if(colorFilter == undefined){
          console.info(msg + ' 27 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.COLOR);
        if(colorFilter == undefined){
          console.info(msg + ' 28 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter({alpha: 255, red: 255, green: 0, blue: 0}, drawing.BlendMode.LUMINOSITY);
        if(colorFilter == undefined){
          console.info(msg + ' 29 test failed');
          expect().assertFail();
        }
        console.info(msg + ' createBlendModeColorFilter successed');
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter(100, drawing.BlendMode.LUMINOSITY);
        if(colorFilter == undefined){
          console.info(msg + ' 30 test failed');
          expect().assertFail();
        }
        colorFilter = drawing.ColorFilter.createBlendModeColorFilter(255, drawing.BlendMode.COLOR);
        if(colorFilter == undefined){
          console.info(msg + ' 31 test failed');
          expect().assertFail();
        }
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testColorFilterCreateBlendModeColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0103
     * @tc.desc   Test for testColorFilterCreateBlendModeColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeColorFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterMultipleCallsStatic';
      let itemList: drawing.BlendMode[]= [
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
        const randomColor: common2D.Color = {
          alpha: Math.floor(Math.random() * 256).toInt(),
          red: Math.floor(Math.random() * 256).toInt(),
          green: Math.floor(Math.random() * 256).toInt(),
          blue: Math.floor(Math.random() * 256).toInt()
        };
        try {
          let colorFilter = drawing.ColorFilter.createBlendModeColorFilter(randomColor, itemList[i]);
          console.info(msg + ' createBlendModeColorFilter succeeded');
          if(colorFilter == undefined){
            console.info(msg + ' test failed step: ' + i);
            expect().assertFail();
          }
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testColorFilterCreateBlendModeColorFilterBoundaryValueStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0104
     * @tc.desc   Test for testColorFilterCreateBlendModeColorFilterBoundaryValue.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateBlendModeColorFilterBoundaryValueStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateBlendModeColorFilterBoundaryValueStatic';
      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: -1, red: 255, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 256, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: -1, green: 0, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 256, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: -1, blue: 255
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 256
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: -1
        }, drawing.BlendMode.SRC);
        console.info(msg + ' createBlendModeColorFilter succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });
    /**
     * @tc.name   testColorFilterCreateComposeColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0200
     * @tc.desc   Test for testColorFilterCreateComposeColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateComposeColorFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateComposeColorFilterNormalStatic';

      let colorFilter1: drawing.ColorFilter | null = null;
      try {
        colorFilter1 = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.SRC) as drawing.ColorFilter;
        console.info(msg + ' createBlendModeColorFilter successed');
        if(colorFilter1 == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      let colorFilter2: drawing.ColorFilter | null = null;
      try {
        colorFilter2  = drawing.ColorFilter.createBlendModeColorFilter({
          alpha: 255, red: 255, green: 0, blue: 0
        }, drawing.BlendMode.DST) as drawing.ColorFilter;
        console.info(msg + ' createBlendModeColorFilter successed');
        if(colorFilter2 == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createBlendModeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        if(colorFilter1 && colorFilter2){
          let colorFilter = drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
          console.info(msg + ' createComposeColorFilter successed');
          if(colorFilter == undefined){
            console.info(msg + ' 3 test failed');
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter2 = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter1 && colorFilter2){
          let colorFilter = drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
          console.info(msg + ' createComposeColorFilter successed');
          if(colorFilter == undefined){
            console.info(msg + ' 4 test failed');
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter1 = drawing.ColorFilter.createSRGBGammaToLinear();
        if(colorFilter1 && colorFilter2){
          let colorFilter = drawing.ColorFilter.createComposeColorFilter(colorFilter1, colorFilter2);
          console.info(msg + ' createComposeColorFilter successed');
          if(colorFilter == undefined){
            console.info(msg + ' 5 test failed');
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let colorFilter1 = drawing.ColorFilter.createSRGBGammaToLinear();
        let colorFilter2 = drawing.ColorFilter.createLumaColorFilter();
        if(colorFilter1 && colorFilter2){
          let colorFilter = drawing.ColorFilter.createComposeColorFilter(colorFilter1,colorFilter2 );
          console.info(msg + ' createComposeColorFilter successed');
          if(colorFilter == undefined){
            console.info(msg + ' 6 test failed');
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testColorFilterCreateComposeColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0203
     * @tc.desc   Test for testColorFilterCreateComposeColorFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateComposeColorFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateComposeColorFilterMultipleCallsStatic';
      const filters = [
        drawing.ColorFilter.createSRGBGammaToLinear(),
        drawing.ColorFilter.createLumaColorFilter(),
        drawing.ColorFilter.createLinearToSRGBGamma(),
      ];
      for (let i = 0; i < 20; i++) {
        const randomFilter1 = filters[Math.floor(Math.random() * 3).toInt()];
        const randomFilter2 = filters[Math.floor(Math.random() * 3).toInt()];
        if(randomFilter1 && randomFilter2){
          try {
            drawing.ColorFilter.createComposeColorFilter(randomFilter1, randomFilter2);
            console.info(msg + ' createComposeColorFilter succeeded');
          } catch(e) {
            e = e as BusinessError ;
            console.info(msg + ` createComposeColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
            expect().assertFail();
          }
        }
      }
    });

    /**
     * @tc.name   testColorFilterCreateLinearToSRGBGammaNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0300
     * @tc.desc   Test for testColorFilterCreateLinearToSRGBGammaNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateLinearToSRGBGammaNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaNormalStatic';
      try {
        let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
        console.info(msg + ' createLinearToSRGBGamma successed');
        if(colorFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateLinearToSRGBGammaMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0302
     * @tc.desc   Test for testColorFilterCreateLinearToSRGBGammaMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLinearToSRGBGammaMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateLinearToSRGBGammaMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i++) {
          let colorFilter = drawing.ColorFilter.createLinearToSRGBGamma();
          console.info(msg + ' createLinearToSRGBGamma successed');
          if(colorFilter == undefined){
            console.info(msg + ' 1 test failed');
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLinearToSRGBGamma errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateSRGBGammaToLinearNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0400
     * @tc.desc   Test for testColorFilterCreateSRGBGammaToLinearNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateSRGBGammaToLinearNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearNormalStatic';
      try {
        let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
        console.info(msg + ' createSRGBGammaToLinear successed');
        if(colorFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateSRGBGammaToLinearMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0402
     * @tc.desc   Test for testColorFilterCreateSRGBGammaToLinearMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateSRGBGammaToLinearMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateSRGBGammaToLinearMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i++) {
          let colorFilter = drawing.ColorFilter.createSRGBGammaToLinear();
          console.info(msg + ' createSRGBGammaToLinear successed');
          if(colorFilter == undefined){
            console.info(msg + '  test failed step: ' + i);
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createSRGBGammaToLinear errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateLumaColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0500
     * @tc.desc   Test for testColorFilterCreateLumaColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateLumaColorFilterNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testColorFilterCreateLumaColorFilterNormalStatic';
      try {
        let colorFilter = drawing.ColorFilter.createLumaColorFilter();
        console.info(msg + ' createLumaColorFilter successed');
        if(colorFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateLumaColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0502
     * @tc.desc   Test for testColorFilterCreateLumaColorFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateLumaColorFilterMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testColorFilterCreateLumaColorFilterMultipleCallsStatic';
      try {
        for (let i = 0; i < 20; i++) {
          let colorFilter = drawing.ColorFilter.createLumaColorFilter();
          console.info(msg + ' createLumaColorFilter successed');
          if(colorFilter == undefined){
            console.info(msg + ' test failed step: ' + i);
            expect().assertFail();
          }
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createLumaColorFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testColorFilterCreateMatrixColorFilterNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0600
     * @tc.desc   Test for testColorFilterCreateMatrixColorFilterNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColorFilterCreateMatrixColorFilterNormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterNormalStatic';
      const matrix_: number[] = [
        1, 0, 0, 0, 0, // 红色通道
        0, 1, 0, 0, 0, // 绿色通道
        0, 0, 1, 0, 0, // 蓝色通道
        0, 0, 0, 1, 0// 透明度通道
      ];
      try {
        let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix_);
        expect(colorFilter != null || colorFilter != undefined).assertTrue()
        console.info(msg + ' createMatrixColorFilter successed,colorFilter:' + colorFilter);
        if(colorFilter == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testColorFilterCreateMatrixColorFilterMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0603
     * @tc.desc   Test for testColorFilterCreateMatrixColorFilterMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixColorFilterMultipleCallsStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterMultipleCallsStatic';
      for ( let i = 0 ; i < 20 ; i ++ ) {
        let matrix: Array<number> = [
          1, 0, 0, 0, 0,
          0, 1, 0, 0, 0,
          0, 0, 100, 0, 0,
          0, 0, 0, 1, 0
        ];
        try {
          let colorFilter = drawing.ColorFilter.createMatrixColorFilter(matrix);
          expect(colorFilter != null || colorFilter != undefined).assertTrue()
          console.info(msg + ' createMatrixColorFilter successed,colorFilter:' + colorFilter);
          if(colorFilter == undefined){
            console.info(msg + ' test failed step: ' + i);
            expect().assertFail();
          }
        } catch(e) {
          e = e as BusinessError ;
          console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
          expect().assertFail();
        }
      }

    });

    /**
     * @tc.name   testColorFilterCreateMatrixColorFilterAbnormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_COLORFILTER_STATIC_0604
     * @tc.desc   Test for testColorFilterCreateMatrixColorFilterAbnormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testColorFilterCreateMatrixColorFilterAbnormalStatic' , TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3 , () => {
      const msg = 'testColorFilterCreateMatrixColorFilterAbnormalStatic';
      try {
        drawing.ColorFilter.createMatrixColorFilter([]);
        console.info(msg + ' createMatrixColorFilter successed');
      } catch(e) {
        e = e as BusinessError ;
        console.info(msg + ` createMatrixColorFilter errorCode is:  ${ e.code } + errormsg is: ${ e.message }`);
        expect(e.code).assertEqual(401);
      }
    });
  });
}