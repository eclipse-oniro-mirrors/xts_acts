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

export default function maskFilterTest() {
  describe('DrawingTsMaskFilterTest', () => {
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0100
     * @tc.name      : testCreateBlurMaskFilterNormal
     * @tc.desc      : Test for testCreateBlurMaskFilterNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testCreateBlurMaskFilterNormal', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, () => {
      const msg = 'testCreateBlurMaskFilterNormal';

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10);
        console.info(msg + ' createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.NORMAL, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.SOLID, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, 10.5);
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.INNER, 10.5);
        console.info(msg + ' createBlurMaskFilter successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0101
     * @tc.name      : testCreateBlurMaskFilterNull
     * @tc.desc      : Test for testCreateBlurMaskFilterNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateBlurMaskFilterNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateBlurMaskFilterNull';

      try {
        drawing.MaskFilter.createBlurMaskFilter(undefined, 10);
        console.info(msg + ' createBlurMaskFilter(undefined, 10) successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, undefined);
        console.info(msg + ' createBlurMaskFilter(drawing.BlurType.OUTER, undefined) successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(undefined, 10);
        console.info(msg + ' createBlurMaskFilter(undefined, 10) successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        drawing.MaskFilter.createBlurMaskFilter(drawing.BlurType.OUTER, undefined);
        console.info(msg + ' createBlurMaskFilter(drawing.BlurType.OUTER, undefined) successed');
      } catch (e) {
        console.info(msg + ` createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_MASKFILTER_0103
     * @tc.name      : testCreateBlurMaskFilterMultipleCalls
     * @tc.desc      : Test for testCreateBlurMaskFilterMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateBlurMaskFilterMultipleCalls', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, () => {
      const msg = 'testCreateBlurMaskFilterMultipleCalls';

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * (getEnumCount(drawing.BlurType)));
        const randomValue = Math.random() * 10 + 1;

        try {
          drawing.MaskFilter.createBlurMaskFilter(randomEnum, randomValue);
          console.info(`${msg} createBlurMaskFilter with ${randomEnum}, ${randomValue} succeeded`);
        } catch (e) {
          console.info(`${msg} createBlurMaskFilter errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

  })
}