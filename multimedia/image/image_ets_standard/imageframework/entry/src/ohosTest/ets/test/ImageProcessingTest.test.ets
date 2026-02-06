/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function ImageProcessingTest() {
  describe('imageProcessingTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(100);
      done();
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_Test_COLOR_SPACE_CONVERSION
     * @tc.name      Test_COLOR_SPACE_CONVERSION
     * @tc.desc      test TestOther
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_Test_COLOR_SPACE_CONVERSION', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.test_COLOR_SPACE_CONVERSION();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Test_COLOR_SPACE_CONVERSION catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_Test_DETAIL_ENHANCER
     * @tc.name      Test_DETAIL_ENHANCER
     * @tc.desc      test TestOther
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_Test_DETAIL_ENHANCER', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.test_DETAIL_ENHANCER();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Test_DETAIL_ENHANCER catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_Test_COMPOSITION
     * @tc.name      Test_COMPOSITION
     * @tc.desc      test TestOther
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_Test_COMPOSITION', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.test_COMPOSITION();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Test_COMPOSITION catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_Test_DECOMPOSITION
     * @tc.name      Test_DECOMPOSITION
     * @tc.desc      test TestOther
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_Test_DECOMPOSITION', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.test_DECOMPOSITION();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Test_DECOMPOSITION catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.number    SUB_Test_METADATA_GENERATION
     * @tc.name      Test_METADATA_GENERATION
     * @tc.desc      test TestOther
     * @tc.level     Level1
     * @tc.size      MediumTest
     * @tc.type      Function
     */
    it('SUB_Test_METADATA_GENERATION', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.test_METADATA_GENERATION();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Test_METADATA_GENERATION catch err: " + err);
        expect(false).assertEqual(0);
      }
    });
  })
}