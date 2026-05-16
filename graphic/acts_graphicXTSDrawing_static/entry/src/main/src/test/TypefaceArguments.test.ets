/**
 * @tc.name   testTypefaceArgumentsConstructorNormalStatic
 * @tc.number testTypefaceArgumentsConstructorNormalStatic
 * @tc.desc   testTypefaceArgumentsConstructorNormalStatic
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
/*
 * Copyright (c) 2025-2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { BusinessError } from '@ohos.base';

export default function typefaceTest() {
  describe('DrawingTsTypefaceArgumentsTest', () => {

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
     * @tc.name      testTypefaceArgumentsConstructorNormalStatic
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0100
     * @tc.desc      Test for testTypefaceArgumentsConstructorNormalStatic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTypefaceArgumentsConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testTypefaceArgumentsConstructorNormalStatic';
      try {
        let typeFaceArgument = new drawing.TypefaceArguments();
        console.info(msg + ' TypefaceArguments successed');
      } catch (e) {
        console.info(msg + ` TypefaceArguments errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name      testTypefaceArgumentsConstructorMultipleCallsStatic
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0101
     * @tc.desc      Test for testTypefaceArgumentsConstructorMultipleCallsStatic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTypefaceArgumentsConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypefaceArgumentsConstructorMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          console.info(msg + ' TypefaceArguments successed step: ' + i);
        } catch (e) {
          console.info(msg + ` TypefaceArguments errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name      testTypefaceArgumentsAddVariationNormalStatic
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0200
     * @tc.desc      Test for testTypefaceArgumentsAddVariationNormalStatic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTypefaceArgumentsAddVariationNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, () => {
      const msg = 'testTypefaceArgumentsAddVariationNormalStatic';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        typeFaceArgument.addVariation('wght', 100);
        console.info(msg + ' TypefaceArguments typeFaceArgument successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments typeFaceArgument errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        let str = "/system/fonts/HarmonyOS_Sans_SC.ttf";
        let font = new drawing.Font();
        typeFaceArgument.addVariation('wght', 100);
        let myTypeFace = drawing.Typeface.makeFromFileWithArguments(str, typeFaceArgument);
        console.info(msg + ' makeFromFileWithArguments myTypeFace successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` makeFromFileWithArguments myTypeFace errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', 1);
        console.info(msg + ' TypefaceArguments 1 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments 1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', -1);
        console.info(msg + ' TypefaceArguments -1 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments -1 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', 900);
        console.info(msg + ' TypefaceArguments 900 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments 900 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', 901);
        console.info(msg + ' TypefaceArguments 901 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments 901 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', 1.5);
        console.info(msg + ' TypefaceArguments 1.5 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments 1.5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wght', -1.5);
        console.info(msg + ' TypefaceArguments -1.5 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments -1.5 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('9999', 100);
        console.info(msg + ' TypefaceArguments 9999 100 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments 9999 100 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('a123', 100);
        console.info(msg + ' TypefaceArguments a123 100 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments a123 100 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wdth', 100);
        console.info(msg + ' TypefaceArguments wdth 100 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments wdth 100 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        typeFaceArgument.addVariation('wdth', 0);
        console.info(msg + ' TypefaceArguments wdth 0 successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` TypefaceArguments wdth 0 errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name      testTypefaceArgumentsAddVariationCallsStatic
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0201
     * @tc.desc      Test for testTypefaceArgumentsAddVariationCallsStatic.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTypefaceArgumentsAddVariationCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypefaceArgumentsAddVariationCallsStatic';

      let font = new drawing.Font();
      let typeface = font.getTypeface();
      for (let i = 0; i < 20; i++) {
        try {
          let typeFaceArgument = new drawing.TypefaceArguments();
          typeFaceArgument.addVariation('wght', Math.random() * 200)
          console.info(msg + ' addVariation successed step: ' + i);
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` addVariation errorCode is:  ${e.code} + errormsg is: ${e.message} step: ${i}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name      testTypefaceArgumentsAddVariationAbnormalStatic
     * @tc.number    SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_TYPEFACEARGUMENTS_STATIC_0202
     * @tc.desc      testTypefaceArgumentsAddVariationAbnormalStatic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testTypefaceArgumentsAddVariationAbnormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testTypefaceArgumentsAddVariationAbnormalStatic';
      let typeFaceArgument = new drawing.TypefaceArguments();
      try {
        typeFaceArgument.addVariation('wghta', 100);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` addVariation wghta errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
      try {
        typeFaceArgument.addVariation('wgh', 100);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` addVariation wgh errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
      try {
        typeFaceArgument.addVariation('√123', 100);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` addVariation √123 errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
      try {
        typeFaceArgument.addVariation('※×√×', 100);
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` addVariation ※×√× errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
      try {
        typeFaceArgument.addVariation('11w×', 100)
        expect().assertFail();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` addVariation 11w× errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
      try {
        typeFaceArgument.addVariation('', 100);
        expect().assertFail();
      } catch (e) {
        console.info(msg + ` addVariation '' errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(25900001)
      }
    });
  })
}