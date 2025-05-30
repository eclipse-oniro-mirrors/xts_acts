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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsReadonlyArrayValuesTest() {
  describe('builtinsReadonlyArrayValuesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_VALUES_TEST_0100
     * @tc.name builtinsReadonlyArrayValuesTest0100
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsReadonlyArrayValuesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayValuesTest0100';
      console.info(`${caseName} test start`);
      try {
        let array: readonly number[] = [1, 2, 3];
        let newValue = array.values();
        expect(newValue.next().value).assertEqual(1);
        expect(newValue.next().value).assertEqual(2);
        expect(newValue.next().value).assertEqual(3);
        expect(array.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_VALUES_TEST_0200
     * @tc.name builtinsReadonlyArrayValuesTest0200
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayValuesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayValuesTest0200';
      console.info(`${caseName} test start`);
      try {
        let array: readonly number[] = [];
        let newValue = array.values();
        expect(newValue.next().value).assertUndefined();
        expect(array.toString()).assertEqual('');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_VALUES_TEST_0300
     * @tc.name builtinsReadonlyArrayValuesTest0300
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayValuesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayValuesTest0300';
      console.info(`${caseName} test start`);
      try {
        let array: readonly (number | undefined)[] = [1, , 3];
        let newValue = array.values();
        expect(newValue.next().value).assertEqual(1);
        expect(newValue.next().value).assertUndefined();
        expect(newValue.next().value).assertEqual(3);
        expect(array.toString()).assertEqual('1,,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_VALUES_TEST_0400
     * @tc.name builtinsReadonlyArrayValuesTest0400
     * @tc.desc Testing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayValuesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayValuesTest0400';
      console.info(`${caseName} test start`);
      try {
        let array: readonly (number | undefined)[] = [undefined, 2, 3];
        let newValue = array.values();
        expect(newValue.next().value).assertUndefined();
        expect(newValue.next().value).assertEqual(2);
        expect(newValue.next().value).assertEqual(3);
        expect(array.toString()).assertEqual(',2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}