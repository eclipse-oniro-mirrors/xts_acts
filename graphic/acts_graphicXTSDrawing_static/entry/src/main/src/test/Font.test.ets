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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from "../../../hypium/index";
import drawing from '@ohos.graphics.drawing';
import { getEnumCount } from './utils';
import { BusinessError } from '@ohos.base';


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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0400
     * @tc.name      : testFontSetGetSizeNormalStatic
     * @tc.desc      : Test for testFontSetGetSizeNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetGetSizeNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testFontSetGetSizeNormalStatic';
      let font = new drawing.Font(); // Create a new Font object

      try {
        // Attempt to call setSize method with 5
        font.setSize(5);
        console.info(msg + ' setSize succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // try {
      //   // Attempt to call getSize method
      //   const size = font.getSize();
      //   expect(size).assertEqual(5);
      //   console.info(msg + ' getSize succeeded');
      // } catch (e: BusinessError) {
      //   console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
      //   expect().assertFail();
      // }

      try {
        // Attempt to call setSize method with 0
        font.setSize(0);
        console.info(msg + ' setSize succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` setSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // try {
      //   // Corresponding call to getSize method
      //   const size = font.getSize();
      //   expect(size).assertEqual(0);
      //   console.info(msg + ' getSize succeeded');
      // } catch (e: BusinessError) {
      //   console.info(msg + ` getSize failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
      //   expect().assertFail();
      // }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0403
     * @tc.name      : testFontSetGetSizeMultipleCallsStatic
     * @tc.desc      : Test for testFontSetGetSizeMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetSizeMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testFontSetGetSizeMultipleCallsStatic';
      let font = new drawing.Font(); // Step 1: Create a new Font object

      for (let i = 0; i < 20; i++) {
        // Generate a random size value
        let randomSize = Math.floor(Math.random() * 100);

        try {
          // Step 2: Attempt to call setSize method with a random size value
          font.setSize(randomSize);
          console.info(`${msg} setSize succeeded for call ${i + 1}`);
        } catch (e: BusinessError) {
          console.info(`${msg} setSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }

        // try {
        //   // Step 3: Corresponding call to getSize method
        //   let size = font.getSize();
        //   console.info(`${msg} getSize succeeded for call ${i + 1}`);
        //   expect(size).assertEqual(randomSize);
        // } catch (e: BusinessError) {
        //   console.info(`${msg} getSize failed for call ${i + 1}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
        //   expect().assertFail();
        // }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0500
     * @tc.name      : testFontSetGetTypeFaceNormalStatic
     * @tc.desc      : Test for testFontSetGetTypeFaceNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontSetGetTypeFaceNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testFontSetGetTypeFaceNormalStatic';
      let font = new drawing.Font();

      try {
        font.setTypeface(new drawing.Typeface());
        console.info(msg + ' setTypeface succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // try {
      //   font.getTypeface();
      //   console.info(msg + ' getTypeface succeeded');
      // } catch (e: BusinessError) {
      //   console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
      //   expect().assertFail();
      // }

      // todo: how to create a customTypeface?
      let customTypeface = new drawing.Typeface();

      try {
        font.setTypeface(customTypeface);
        console.info(msg + ' setTypeface succeeded');
      } catch (e: BusinessError) {
        console.info(msg + ` setTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
        expect().assertFail();
      }

      // try {
      //   font.getTypeface();
      //   console.info(msg + ' getTypeface succeeded');
      // } catch (e: BusinessError) {
      //   console.info(msg + ` getTypeface failed, errorCode is:  ${e.code}, errorMessage is: ${e.message}`);
      //   expect().assertFail();
      // }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0503
     * @tc.name      : testFontSetGetTypeFaceMultipleCallsStatic
     * @tc.desc      : Test for testFontSetGetTypeFaceMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontSetGetTypeFaceMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testFontSetGetTypeFaceMultipleCallsStatic';
      let font = new drawing.Font();
      for (let i = 0; i < 20; i++) {
        try {
          font.setTypeface(new drawing.Typeface());
          // font.getTypeface();
          // console.info(`${msg} getTypeface succeeded`);
        } catch (e: BusinessError) {
          console.info(`${msg} setTypeface or getTypeface failed, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0600
     * @tc.name      : testFontGetMetricsNormalStatic
     * @tc.desc      : Test for testFontGetMetricsNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testFontGetMetricsNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testFontGetMetricsNormalStatic';
      try {
        const font = new drawing.Font();
        let metrics = font.getMetrics();
        console.info(msg + ' getMetrics successed' + JSON.stringify(metrics));
        // expect(metrics.flags !== null).assertTrue();
        expect(metrics.top !== null).assertTrue();
        expect(metrics.ascent !== null).assertTrue();
        expect(metrics.descent !== null).assertTrue();
        expect(metrics.bottom !== null).assertTrue();
        // expect(metrics.leading !== null).assertTrue();
        // expect(metrics.avgCharWidth !== null).assertTrue();
        // expect(metrics.avgCharWidth !== null).assertTrue();
        // expect(metrics.xMin !== null).assertTrue();
        // expect(metrics.xMax !== null).assertTrue();
        // expect(metrics.xHeight !== null).assertTrue();
        // expect(metrics.capHeight !== null).assertTrue();
        // expect(metrics.underlineThickness !== null).assertTrue();
        // expect(metrics.underlinePosition !== null).assertTrue();
        // expect(metrics.strikethroughThickness !== null).assertTrue();
        // expect(metrics.strikethroughPosition !== null).assertTrue();
      } catch (e: BusinessError) {
        console.info(msg + ` getMetrics errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });
    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_FONT_STATIC_0602
     * @tc.name      : testFontGetMetricsMultipleCallsStatic
     * @tc.desc      : Test for testFontGetMetricsMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testFontGetMetricsMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testFontGetMetricsMultipleCallsStatic';
      for (let i = 0; i < 20; i++) {
        try {
          const font = new drawing.Font();
          font.setSize(10 + i);
          const result = font.getMetrics();
          expect(!!result).assertTrue();
          console.info(`${msg} getMetrics succeeded for font ${i}`);
        } catch (e: BusinessError) {
          console.info(`${msg} getMetrics failed for font ${i}, errorCode is: ${e.code}, errorMessage is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

  });
}