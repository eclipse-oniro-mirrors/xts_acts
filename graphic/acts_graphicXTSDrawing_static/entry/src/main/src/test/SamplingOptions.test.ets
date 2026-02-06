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
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_STATIC_0100
     * @tc.name      : testSamplingOptionsConstructorNormalStatic
     * @tc.desc      : Test for testSamplingOptionsConstructorNormal.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSamplingOptionsConstructorNormalStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, (): void => {
      const msg = 'testSamplingOptionsConstructorNormalStatic';
      try {
        new drawing.SamplingOptions();
        console.info(msg + ' SamplingOptions successed');
      } catch (e: BusinessError) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
      try {
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
        new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_LINEAR);
        console.info(msg + ' SamplingOptions successed');
      } catch (e: BusinessError) {
        console.info(msg + ` SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    : SUB_BASIC_GRAPHICS_SPECIAL_API_TS_DRAWING_SAMPLINGOPTIONS_STATIC_0103
     * @tc.name      : testSamplingOptionsConstructorMultipleCallsStatic
     * @tc.desc      : Test for testSamplingOptionsConstructorMultipleCalls.
     * @tc.size      : SmallTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSamplingOptionsConstructorMultipleCallsStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, (): void => {
      const msg = 'testSamplingOptionsConstructorMultipleCallsStatic';

      for (let i = 0; i < 20; i++) {
        try {
          new drawing.SamplingOptions();
          console.info(`${msg} SamplingOptions succeeded`);
        } catch (e: BusinessError) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }

      for (let i = 0; i < 20; i++) {
        try {
          new drawing.SamplingOptions(drawing.FilterMode.FILTER_MODE_NEAREST);
          console.info(`${msg} SamplingOptions with random enum value  succeeded`);
        } catch (e: BusinessError) {
          console.info(`${msg} SamplingOptions errorCode is:  ${e.code} + errormsg is: ${e.message}`);
          expect().assertFail();
        }
      }
    });
  })
}