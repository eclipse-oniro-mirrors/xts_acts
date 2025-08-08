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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { TestA } from '../testability/pages/InterfaceDefined';
import { sleep } from '../testability/pages/Utils';

export default function builtinsArrayPopTest() {
  describe('builtinsArrayPopTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0100
     * @tc.name builtinsArrayPopTest0100
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0100';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [1, 2];
        let array: number[] = [1, 2, 3];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        
        expect(newValue).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0200
     * @tc.name builtinsArrayPopTest0200
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0200';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [];
        let array: Array<number> = [];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertUndefined();
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0300
     * @tc.name builtinsArrayPopTest0300
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0300';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [];
        let array: Array<number> = [5];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertEqual(5);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0400
     * @tc.name builtinsArrayPopTest0400
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0400';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | undefined)[] = [];
        let array: Array<number | undefined> = [,];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertUndefined();
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0500
     * @tc.name builtinsArrayPopTest0500
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0500';
      console.info(`${caseName} test start`);
      try {
        let exp: (null|number)[] = [1, null, 3];
        let array: (null|number)[] = [1, null, 3, 4];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0600
     * @tc.name builtinsArrayPopTest0600
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0600';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | TestA)[] = [1, {
          a: 1
        }, {
          a: 1
        }, 3];

        let array: (number | TestA)[] = [1, {
          a: 1
        }, {
          a: 1
        }, 3, 4];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0700
     * @tc.name builtinsArrayPopTest0700
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0700';
      console.info(`${caseName} test start`);
      try {
        let exp: string[] = ['apple', 'banana'];
        let array: string[] = ['apple', 'banana', 'cherry'];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertEqual('cherry');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_POP_TEST_0800
     * @tc.name builtinsArrayPopTest0800
     * @tc.desc Testing pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayPopTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayPopTest0800';
      console.info(`${caseName} test start`);
      try {
        let exp: string[] = ['apple', ''];

        let array: string[] = ['apple', '', 'cherry'];
        let newValue = array.pop();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);

        expect(newValue).assertEqual('cherry');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}