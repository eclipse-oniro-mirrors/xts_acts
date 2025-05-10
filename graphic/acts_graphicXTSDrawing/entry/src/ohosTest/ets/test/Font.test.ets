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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0100
     * @tc.name      : testFontEnableSubpixelNormal
     * @tc.desc      : Test for testFontEnableSubpixelNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontEnableSubpixelNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0101
     * @tc.name      : testFontEnableSubpixelNull
     * @tc.desc      : Test for testFontEnableSubpixelNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontEnableSubpixelNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0103
     * @tc.name      : testFontEnableSubpixelMultipleCalls
     * @tc.desc      : Test for testFontEnableSubpixelMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontEnableSubpixelMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0300
     * @tc.name      : testFontEnableLinearMetricsNormal
     * @tc.desc      : Test for testFontEnableLinearMetricsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontEnableLinearMetricsNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0301
     * @tc.name      : testFontEnableLinearMetricsNull
     * @tc.desc      : Test for testFontEnableLinearMetricsNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontEnableLinearMetricsNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0303
     * @tc.name      : testFontEnableLinearMetricsMultipleCalls
     * @tc.desc      : Test for testFontEnableLinearMetricsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontEnableLinearMetricsMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0400
     * @tc.name      : testFontSetGetSizeNormal
     * @tc.desc      : Test for testFontSetGetSizeNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetGetSizeNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0401
     * @tc.name      : testFontSetGetSizeNull
     * @tc.desc      : Test for testFontSetGetSizeNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetSizeNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0403
     * @tc.name      : testFontSetGetSizeMultipleCalls
     * @tc.desc      : Test for testFontSetGetSizeMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetSizeMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0404
     * @tc.name      : testFontSetGetSizeWhenNoSet
     * @tc.desc      : Test for testFontSetGetSizeWhenNoSet.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testFontSetGetSizeWhenNoSet', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0500
     * @tc.name      : testFontSetGetTypeFaceNormal
     * @tc.desc      : Test for testFontSetGetTypeFaceNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetGetTypeFaceNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0501
     * @tc.name      : testFontSetGetTypeFaceNull
     * @tc.desc      : Test for testFontSetGetTypeFaceNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetTypeFaceNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0503
     * @tc.name      : testFontSetGetTypeFaceMultipleCalls
     * @tc.desc      : Test for testFontSetGetTypeFaceMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetTypeFaceMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0504
     * @tc.name      : testFontSetGetTypeFaceWhenNoSet
     * @tc.desc      : Test for testFontSetGetTypeFaceWhenNoSet.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testFontSetGetTypeFaceWhenNoSet', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0600
     * @tc.name      : testFontGetMetricsNormal
     * @tc.desc      : Test for testFontGetMetricsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontGetMetricsNormal', DEFAULT, () => {
      const msg = 'testFontGetMetricsNormal';
      try {
        const font = new drawing.Font();
        let metrics = font.getMetrics();
        console.info(msg + ' getMetrics successed' + JSON.stringify(metrics));
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0602
     * @tc.name      : testFontGetMetricsMultipleCalls
     * @tc.desc      : Test for testFontGetMetricsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetMetricsMultipleCalls', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0700
     * @tc.name      : testFontMeasureTextNormal
     * @tc.desc      : Test for testFontMeasureTextNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontMeasureTextNormal', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0701
     * @tc.name      : testFontMeasureTextNull
     * @tc.desc      : Test for testFontMeasureTextNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontMeasureTextNull', DEFAULT, () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_0703
     * @tc.name      : testFontMeasureTextMultipleCalls
     * @tc.desc      : Test for testFontMeasureTextMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontMeasureTextMultipleCalls', DEFAULT, () => {
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