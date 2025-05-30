/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayValuesTest() {
  describe('builtinsArrayValuesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ARRAY_VALUES_TEST_0100
     * @tc.name builtinsArrayValuesTest0100
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayValuesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayValuesTest0100';
      console.info(`${caseName} test start`);
      try {
        let array: number[] = [1, 2, 3];
        let newValue = array.values();
        expect(newValue.next().value).assertEqual(1);
        expect(newValue.next().value).assertEqual(2);
        expect(newValue.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_VALUES_TEST_0200
     * @tc.name builtinsArrayValuesTest0200
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayValuesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayValuesTest0200';
      console.info(`${caseName} test start`);
      try {
        let array: number[] = [];
        let newValue = array.values();
        expect(newValue.next().value).assertUndefined();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_VALUES_TEST_0300
     * @tc.name builtinsArrayValuesTest0300
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayValuesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayValuesTest0300';
      console.info(`${caseName} test start`);
      try {
        let array: (number | undefined)[] = [1, , 3];
        let newValue = array.values();
        expect(newValue.next().value).assertEqual(1);
        expect(newValue.next().value).assertUndefined();
        expect(newValue.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_VALUES_TEST_0400
     * @tc.name builtinsArrayValuesTest0400
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayValuesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayValuesTest0400';
      console.info(`${caseName} test start`);
      try {
        let array: (number | undefined)[] = [undefined, 2, 3];
        let newValue = array.values();
        expect(newValue.next().value).assertUndefined();
        expect(newValue.next().value).assertEqual(2);
        expect(newValue.next().value).assertEqual(3);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}