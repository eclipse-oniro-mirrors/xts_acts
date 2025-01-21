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

export default function samplingOptionsTest() {
  describe('DrawingTsSamplingOptionsTest', () => {
    const DEFAULT = 0;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0100
     * @tc.name      : testSamplingOptionsConstructorNormal
     * @tc.desc      : Test for testSamplingOptionsConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSamplingOptionsConstructorNormal', DEFAULT, () => {
      const msg = 'testSamplingOptionsConstructorNormal';
      try {
        new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0101
     * @tc.name      : testSamplingOptionsConstructorNull
     * @tc.desc      : Test for testSamplingOptionsConstructorNull.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSamplingOptionsConstructorNull', DEFAULT, () => {
      const msg = 'testSamplingOptionsConstructorNull';

      try {
        new drawing.SamplingOptions(undefined);
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        new drawing.SamplingOptions(null);
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0102
     * @tc.name      : testSamplingOptionsConstructorMismatch
     * @tc.desc      : Test for testSamplingOptionsConstructorMismatch.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSamplingOptionsConstructorMismatch', DEFAULT, () => {
      const msg = 'testSamplingOptionsConstructorMismatch';

      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST, drawing.FilterMode.FILTER_MODE_NEAREST);
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }

      try {
        new drawing.SamplingOptions('s');
        console.info(msg + ' SamplingOptions successed');
      } catch (e) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect(e.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_0103
     * @tc.name      : testSamplingOptionsConstructorMultipleCalls
     * @tc.desc      : Test for testSamplingOptionsConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSamplingOptionsConstructorMultipleCalls', DEFAULT, () => {
      const msg = 'testSamplingOptionsConstructorMultipleCalls';

      for (let i = 0; i < 20; i++) {
        try {
          new drawing.SamplingOptions();
          console.info(`${msg} SamplingOptions succeeded`);
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        const randomEnum = Math.floor(Math.random() * getEnumCount(drawing.FilterMode));
        try {
          new drawing.SamplingOptions(randomEnum);
          console.info(`${msg} SamplingOptions with random enum value ${randomEnum} succeeded`);
        } catch (e) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });

  })
}