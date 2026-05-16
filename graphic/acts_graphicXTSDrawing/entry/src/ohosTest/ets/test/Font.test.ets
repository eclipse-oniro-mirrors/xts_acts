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
import { getEnumCount } from './utils';


export default function fontTest() {
  describe('DrawingTsFontTest', () => {
    const DEFAULT = 0;
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
     * @tc.name   testFontEnableSubpixelNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0100
     * @tc.desc   Test for testFontEnableSubpixelNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontEnableSubpixelNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontEnableSubpixelNormal';
      let font = new drawing.Font();

      try {
        font.enableSubpixel(true);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.enableSubpixel(false);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontEnableSubpixelNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0101
     * @tc.desc   Test for testFontEnableSubpixelNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableSubpixelNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableSubpixelNull';
      let font = new drawing.Font(); // Create a new Font object

      try {
        // Attempt to call enableSubpixel method with undefined
        font.enableSubpixel(undefined);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Attempt to call enableSubpixel method with null
        font.enableSubpixel(null);
        console.info(msg + ' enableSubpixel succeeded');
      } catch (e) {
        console.info(msg + ` enableSubpixel failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontEnableSubpixelMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0103
     * @tc.desc   Test for testFontEnableSubpixelMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableSubpixelMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableSubpixelMultipleCalls';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random boolean value
        let randomBool = Math.random() < 0.5;

        try {
          // Attempt to call enableSubpixel method with a random boolean value
          font.enableSubpixel(randomBool);
          console.info(`${msg} enableSubpixel succeeded for call ${i + 1}`);
        } catch (e) {
          console.info(`${msg} enableSubpixel failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontEnableLinearMetricsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0300
     * @tc.desc   Test for testFontEnableLinearMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontEnableLinearMetricsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontEnableLinearMetricsNormal';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      try {
        // Step 2: Attempt to call enableLinearMetrics method with true
        font.enableLinearMetrics(true);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Step 3: Attempt to call enableLinearMetrics method with false
        font.enableLinearMetrics(false);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontEnableLinearMetricsNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0301
     * @tc.desc   Test for testFontEnableLinearMetricsNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableLinearMetricsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableLinearMetricsNull';
      let font = new drawing.Font(); // Create a new Font object

      try {
        // Attempt to call enableLinearMetrics method with undefined
        font.enableLinearMetrics(undefined);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Attempt to call enableLinearMetrics method with null
        font.enableLinearMetrics(null);
        console.info(msg + ' enableLinearMetrics succeeded');
      } catch (e) {
        console.info(msg + ` enableLinearMetrics failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontEnableLinearMetricsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0303
     * @tc.desc   Test for testFontEnableLinearMetricsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontEnableLinearMetricsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontEnableLinearMetricsMultipleCalls';
      let font = new drawing.Font(); // Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random boolean value
        let randomBool = Math.random() < 0.5;

        try {
          // Attempt to call enableLinearMetrics method with a random boolean value
          font.enableLinearMetrics(randomBool);
          console.info(`${msg} enableLinearMetrics succeeded for call ${i + 1}`);
        } catch (e) {
          console.info(`${msg} enableLinearMetrics failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetGetSizeNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0400
     * @tc.desc   Test for testFontSetGetSizeNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetGetSizeNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetGetSizeNormal';
      let font = new drawing.Font(); // Create a new Font object

      try {
        // Attempt to call setSize method with 5
        font.setSize(5);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Attempt to call getSize method
        const size = font.getSize();
        expect(size).assertEqual(5);
        console.info(msg + ' getSize succeeded');
      } catch (e) {
        console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Attempt to call setSize method with 0
        font.setSize(0);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        // Corresponding call to getSize method
        const size = font.getSize();
        expect(size).assertEqual(0);
        console.info(msg + ' getSize succeeded');
      } catch (e) {
        console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetGetSizeNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0401
     * @tc.desc   Test for testFontSetGetSizeNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetSizeNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetSizeNull';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      try {
        // Step 2: Attempt to call setSize method with undefined
        font.setSize(undefined);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        // Step 3: Attempt to call setSize method with null
        font.setSize(null);
        console.info(msg + ' setSize succeeded');
      } catch (e) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetGetSizeMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0403
     * @tc.desc   Test for testFontSetGetSizeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetSizeMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetSizeMultipleCalls';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random size value
        let randomSize = Math.floor(Math.random() * 100);

        try {
          // Step 2: Attempt to call setSize method with a random size value
          font.setSize(randomSize);
          console.info(`${msg} setSize succeeded for call ${i + 1}`);
        } catch (e) {
          console.info(`${msg} setSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }

        try {
          // Step 3: Corresponding call to getSize method
          let size = font.getSize();
          console.info(`${msg} getSize succeeded for call ${i + 1}`);
          expect(size).assertEqual(randomSize);
        } catch (e) {
          console.info(`${msg} getSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetGetSizeWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0404
     * @tc.desc   Test for testFontSetGetSizeWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontSetGetSizeWhenNoSet', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontSetGetSizeWhenNoSet';
      let font = new drawing.Font();
      try {
        font.getSize();
        console.info(msg + ' getSize successed');
      } catch (e) {
        console.info(msg + ` getSize errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testFontSetGetTypeFaceNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0500
     * @tc.desc   Test for testFontSetGetTypeFaceNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontSetGetTypeFaceNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontSetGetTypeFaceNormal';
      let font = new drawing.Font();

      try {
        font.setTypeface(new drawing.Typeface());
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.getTypeface();
        console.info(msg + ' getTypeface succeeded');
      } catch (e) {
        console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // todo: how to create a customTypeface?
      let customTypeface = new drawing.Typeface();

      try {
        font.setTypeface(customTypeface);
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.getTypeface();
        console.info(msg + ' getTypeface succeeded');
      } catch (e) {
        console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontSetGetTypeFaceNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0501
     * @tc.desc   Test for testFontSetGetTypeFaceNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetTypeFaceNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetTypeFaceNull';
      let font = new drawing.Font();

      try {
        font.setTypeface(undefined);
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.setTypeface(null);
        console.info(msg + ' setTypeface succeeded');
      } catch (e) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontSetGetTypeFaceMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0503
     * @tc.desc   Test for testFontSetGetTypeFaceMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontSetGetTypeFaceMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontSetGetTypeFaceMultipleCalls';
      let font = new drawing.Font();
      for (let i = 0; i < 20; i++) {
        try {
          font.setTypeface(new drawing.Typeface());
          font.getTypeface();
          console.info(`${msg} getTypeface succeeded`);
        } catch (e) {
          console.info(`${msg} setTypeface or getTypeface failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.name   testFontSetGetTypeFaceWhenNoSet
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0504
     * @tc.desc   Test for testFontSetGetTypeFaceWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFontSetGetTypeFaceWhenNoSet', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, () => {
      const msg = 'testFontSetGetTypeFaceWhenNoSet';
      try {
        const font = new drawing.Font();
        font.getTypeface();
        console.info(msg + ' getTypeface successed');
      } catch (e) {
        console.info(msg + ` getTypeface errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.name   testFontGetMetricsNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0600
     * @tc.desc   Test for testFontGetMetricsNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontGetMetricsNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontGetMetricsNormal';
      try {
        const font = new drawing.Font();
        let metrics = font.getMetrics();
        console.info(msg + ' getMetrics successed' + JSON.stringify(metrics));
        let aaa = metrics.flags & drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID
        let aaa1 = metrics.flags & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID
        let aaa2 = metrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID
        let aaa3 = metrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID
        let aaa4 = metrics.flags & drawing.FontMetricsFlags.BOUNDS_INVALID
        console.log(msg + '1yc '+aaa);
        console.log(msg + '2yc '+aaa1);
        console.log(msg + '3yc '+aaa2);
        console.log(msg + '4yc '+aaa3);
        console.log(msg + '5yc '+aaa4);
        expect(metrics.flags & drawing.FontMetricsFlags.UNDERLINE_THICKNESS_VALID).assertEqual(1);
        expect(metrics.flags & drawing.FontMetricsFlags.UNDERLINE_POSITION_VALID).assertEqual(2);
        expect(metrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_THICKNESS_VALID).assertEqual(4);
        expect(metrics.flags & drawing.FontMetricsFlags.STRIKETHROUGH_POSITION_VALID).assertEqual(8);
        expect(metrics.flags & drawing.FontMetricsFlags.BOUNDS_INVALID).assertEqual(16);
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
        console.info(msg + ` getMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontGetMetricsMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0602
     * @tc.desc   Test for testFontGetMetricsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontGetMetricsMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontGetMetricsMultipleCalls';

      for (let i = 0; i < 20; i++) {
        try {
          const font = new drawing.Font();
          font.setSize(10 + i);
          const result = font.getMetrics();
          expect(!!result).assertTrue();
          console.info(`${msg} getMetrics succeeded for font ${i}`);
        } catch (e) {
          console.info(`${msg} getMetrics failed for font ${i}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });


    /**
     * @tc.name   testFontMeasureTextNormal
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0700
     * @tc.desc   Test for testFontMeasureTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFontMeasureTextNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testFontMeasureTextNormal';

      let font = new drawing.Font();
      try {
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF16);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_UTF32);
        font.measureText("drawing", drawing.TextEncoding.TEXT_ENCODING_GLYPH_ID);
        console.info(msg + ' measureText successed');
      } catch (e) {
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
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        font.measureText("", drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureText successed');
      } catch (e) {
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   testFontMeasureTextNull
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0701
     * @tc.desc   Test for testFontMeasureTextNull.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureTextNull';
      let font = new drawing.Font();

      try {
        font.measureText(undefined, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureText succeeded');
      } catch (e) {
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.measureText("drawing", undefined);
        console.info(msg + ' measureText succeeded');
      } catch (e) {
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.measureText(null, drawing.TextEncoding.TEXT_ENCODING_UTF8);
        console.info(msg + ' measureText succeeded');
      } catch (e) {
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        font.measureText("drawing", null);
        console.info(msg + ' measureText succeeded');
      } catch (e) {
        console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.name   testFontMeasureTextMultipleCalls
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0703
     * @tc.desc   Test for testFontMeasureTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testFontMeasureTextMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testFontMeasureTextMultipleCalls';
      let font = new drawing.Font();

      for (let i = 0; i < 20; i++) {
        const randomString = Math.random().toString(36).substring(2, 12);
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.TextEncoding));
        try {
          let width = font.measureText(randomString, randomEnum);
          expect(width > 0).assertTrue();
          console.info(msg + ' measureText succeeded');
        } catch (e) {
          console.info(msg + ` measureText errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

  });
}