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
import { BusinessError } from '@ohos.base';


export default function fontTest() {
  describe('DrawingTsFontTest', () => {
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
     * @tc.name   testFontEnableSubpixelNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0100
     * @tc.desc   Test for testFontEnableSubpixelNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontEnableSubpixelNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontEnableSubpixelNormalStatic';
      let font = new drawing.Font();

      try {
        font.enableSubpixel(true);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableSubpixel(false);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontEnableSubpixelMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0103
     * @tc.desc   Test for testFontEnableSubpixelMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableSubpixelMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableSubpixelMultipleCallsStatic';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random boolean value
        let randomBool = Math.random() < 0.5;

        try {
          // Attempt to call enableSubpixel method with a random boolean value
          font.enableSubpixel(randomBool);
          console.info(`${msg} enableSubpixel succeeded for call ${i + 1}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} enableSubpixel failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontEnableLinearMetricsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0300
     * @tc.desc   Test for testFontEnableLinearMetricsNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontEnableLinearMetricsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontEnableLinearMetricsNormalStatic';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      try {
        // Step 2: Attempt to call enableLinearMetrics method with true
        font.enableLinearMetrics(true);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Step 3: Attempt to call enableLinearMetrics method with false
        font.enableLinearMetrics(false);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontEnableLinearMetricsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0303
     * @tc.desc   Test for testFontEnableLinearMetricsMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableLinearMetricsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableLinearMetricsMultipleCallsStatic';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random boolean value
        let randomBool = Math.random() < 0.5;

        try {
          // Attempt to call enableLinearMetrics method with a random boolean value
          font.enableLinearMetrics(randomBool);
          console.info(`${msg} enableLinearMetrics succeeded for call ${i + 1}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} enableLinearMetrics failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetGetSizeNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0400
     * @tc.desc   Test for testFontSetGetSizeNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetGetSizeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetGetSizeNormalStatic';
      let font = new drawing.Font(); // Create a new Font object

      try {
        // Attempt to call setSize method with 5
        font.setSize(5);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Attempt to call getSize method
        const size = font.getSize();
        expect(size).assertEqual(5);
        console.info(msg + ' getSize succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Attempt to call setSize method with 0
        font.setSize(0);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Corresponding call to getSize method
        const size = font.getSize();
        expect(size).assertEqual(0);
        console.info(msg + ' getSize succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetGetSizeMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0403
     * @tc.desc   Test for testFontSetGetSizeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetSizeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetSizeMultipleCallsStatic';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random size value
        let randomSize = Math.floor(Math.random() * 100);

        try {
          // Step 2: Attempt to call setSize method with a random size value
          font.setSize(randomSize);
          console.info(`${msg} setSize succeeded for call ${i + 1}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} setSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }

        try {
          // Step 3: Corresponding call to getSize method
          let size = font.getSize();
          console.info(`${msg} getSize succeeded for call ${i + 1}`);
          expect(size).assertEqual(randomSize);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} getSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetGetSizeWhenNoSetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0404
     * @tc.desc   Test for testFontSetGetSizeWhenNoSet.Static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontSetGetSizeWhenNoSetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontSetGetSizeWhenNoSetStatic';
      let font = new drawing.Font();
      try {
        font.getSize();
        console.info(msg + ' getSize successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getSize errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetGetTypeFaceNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0500
     * @tc.desc   Test for testFontSetGetTypeFaceNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetGetTypeFaceNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetGetTypeFaceNormalStatic';
      let font = new drawing.Font();

      try {
        font.setTypeface(new drawing.Typeface());
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let typeface = font.getTypeface();
        if(typeface == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        console.info(msg + ' getTypeface succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // todo: how to create a customTypeface?
      let customTypeface = new drawing.Typeface();

      try {
        font.setTypeface(customTypeface);
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        let typeface = font.getTypeface();
        if(typeface == undefined){
          console.info(msg + ' 2 test failed');
          expect().assertFail();
        }
        console.info(msg + ' getTypeface succeeded');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontSetGetTypeFaceMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0503
     * @tc.desc   Test for testFontSetGetTypeFaceMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetTypeFaceMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetTypeFaceMultipleCallsStatic';
      let font = new drawing.Font();
      for (let i = 0; i < 20; i++) {
        try {
          font.setTypeface(new drawing.Typeface());
          font.getTypeface();
          console.info(`${msg} getTypeface succeeded`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} setTypeface or getTypeface failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontSetGetTypeFaceWhenNoSetStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0504
     * @tc.desc   Test for testFontSetGetTypeFaceWhenNoSetStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontSetGetTypeFaceWhenNoSetStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontSetGetTypeFaceWhenNoSetStatic';
      try {
        const font = new drawing.Font();
        font.getTypeface();
        console.info(msg + ' getTypeface successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getTypeface errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetMetricsNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0600
     * @tc.desc   Test for testFontGetMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetMetricsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetMetricsNormalStatic';
      try {
        const font = new drawing.Font();
        let metrics = font.getMetrics() as drawing.FontMetrics;
        console.info(msg + ' getMetrics successed' + JSON.stringify(metrics));
        if(metrics == undefined){
          console.info(msg + ' 1 test failed');
          expect().assertFail();
        }
        expect(metrics.flags !== null).assertTrue();
        expect(metrics.top !== null).assertTrue();
        expect(metrics.ascent !== null).assertTrue();
        expect(metrics.descent !== null).assertTrue();
        expect(metrics.bottom !== null).assertTrue();
        expect(metrics.leading !== null).assertTrue();
        expect(metrics.avgCharWidth !== null).assertTrue();
        expect(metrics.avgCharWidth !== null).assertTrue();
        expect(metrics.xMin !== null).assertTrue();
        expect(metrics.xMax !== null).assertTrue();
        expect(metrics.xHeight !== null).assertTrue();
        expect(metrics.capHeight !== null).assertTrue();
        expect(metrics.underlineThickness !== null).assertTrue();
        expect(metrics.underlinePosition !== null).assertTrue();
        expect(metrics.strikethroughThickness !== null).assertTrue();
        expect(metrics.strikethroughPosition !== null).assertTrue();
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` getMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontGetMetricsMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0602
     * @tc.desc   Test for testFontGetMetricsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetMetricsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontGetMetricsMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          const font = new drawing.Font();
          font.setSize(10 + i);
          const result = font.getMetrics();
          expect(!!result).assertTrue();
          console.info(`${msg} getMetrics succeeded for font ${i}`);
        } catch (e) {
          e = e as BusinessError;
          console.info(`${msg} getMetrics failed for font ${i}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.name   testFontMeasureTextNormalStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0700
     * @tc.desc   Test for testFontMeasureTextNormalStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureTextNormalStatic';

      let font = new drawing.Font();
      try {
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF16);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF32);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        console.info(msg + ' measureText successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.measureText("中文魑認識", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.measureText("中文魑認識", drawing.TextEncoding.TEXT_ENCODING_UTF16);
        font.measureText("中文魑認識", drawing.TextEncoding.TEXT_ENCODING_UTF32);
        font.measureText("中文魑認識", drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        console.info(msg + ' measureText successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.measureText("", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureText successed');
      } catch (e) {
        e = e as BusinessError;
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.name   testFontMeasureTextMultipleCallsStatic
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0703
     * @tc.desc   Test for testFontMeasureTextMultipleCallsStatic.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureTextMultipleCallsStatic';
      let font = new drawing.Font();
      let itemList: drawing.TextEncoding[]= [
        drawing.TextEncoding.TEXT_ENCODING_UTF8,
        drawing.TextEncoding.TEXT_ENCODING_UTF16,
        drawing.TextEncoding.TEXT_ENCODING_UTF32,
        drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID
      ];
      for (let i = 0; i < 20; i++) {
        const randomString = Math.random().toString(36).substring(2, 12);
        console.info(msg + ' randomString  is: ' + randomString);
        const randomEnum = Math.floor(Math.random() * 4).toInt();
        console.info(msg + ' randomEnum  is: ' + randomEnum);
        try {
          let width = font.measureText(randomString, itemList[randomEnum]);
          console.info(msg + ' measureText width is: ' + width + ' step is: ' + i);
          expect(width >= 0).assertTrue();
          console.info(msg + ' measureText succeeded');
        } catch (e) {
          e = e as BusinessError;
          console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  });
}