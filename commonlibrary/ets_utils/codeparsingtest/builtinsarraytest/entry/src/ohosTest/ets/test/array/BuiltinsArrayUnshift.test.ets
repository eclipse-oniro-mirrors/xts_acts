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
import { TestA } from '../../testability/pages/InterfaceDefined';
import { sleep } from '../../testability/pages/Utils';


export default function builtinsArrayUnshiftTest() {
  describe('builtinsArrayUnshiftTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0100
     * @tc.name builtinsArrayUnshiftTest0100
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0100';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [4, 1, 2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(4);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(4);
        expect(array[0]).assertEqual(4);
        expect(array[1]).assertEqual(1);
        expect(array[2]).assertEqual(2);
        expect(array[3]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0200
     * @tc.name builtinsArrayUnshiftTest0200
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0200';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [4, 5, 1, 2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(4, 5);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array[0]).assertEqual(4);
        expect(array[1]).assertEqual(5);
        expect(array[2]).assertEqual(1);
        expect(array[3]).assertEqual(2);
        expect(array[4]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0300
     * @tc.name builtinsArrayUnshiftTest0300
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0300';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [1];
        let array: number[] = [];
        let newValue = array.unshift(1);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual(1);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0400
     * @tc.name builtinsArrayUnshiftTest0400
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0400';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [4, 5, 6, 1, 2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(4, 5, 6);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(6);
        expect(array[0]).assertEqual(4);
        expect(array[1]).assertEqual(5);
        expect(array[2]).assertEqual(6);
        expect(array[3]).assertEqual(1);
        expect(array[4]).assertEqual(2);
        expect(array[5]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0500
     * @tc.name builtinsArrayUnshiftTest0500
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0500';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [1, 2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(3);
        expect(array[0]).assertEqual(1);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0600
     * @tc.name builtinsArrayUnshiftTest0600
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0600';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [2, 2, 1, 2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(2, 2);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(2);
        expect(array[2]).assertEqual(1);
        expect(array[3]).assertEqual(2);
        expect(array[4]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0700
     * @tc.name builtinsArrayUnshiftTest0700
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0700';
      console.info(`${caseName} test start`);
      try {
        let array: (number | TestA | Function)[] = [1, 2, 3];
        let newValue = array.unshift({
          a: 1
        }, () => {
        });
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
        expect(array).assertDeepEquals(array);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0800
     * @tc.name builtinsArrayUnshiftTest0800
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0800';
      console.info(`${caseName} test start`);
      try {
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(...Array(1000).fill(0));
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1003);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0900
     * @tc.name builtinsArrayUnshiftTest0900
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest0900';
      console.info(`${caseName} test start`);
      try {
        let array: Array<number | Array<Array<number>>> = [1, 2, 3];
        let newValue = array.unshift([[4, 5], [6, 7]]);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(4);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1000
     * @tc.name builtinsArrayUnshiftTest1000
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest1000';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | null | undefined)[] = [null, undefined, 1, 2, 3];
        let array: (number | null | undefined)[] = [1, 2, 3];
        let newValue = array.unshift(null, undefined);
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
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1100
     * @tc.name builtinsArrayUnshiftTest1100
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest1100';
      console.info(`${caseName} test start`);
      try {
        let array: number[] = [1, 2, 3];
        let newValue = array.unshift(Infinity, NaN);
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(5);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1200
     * @tc.name builtinsArrayUnshiftTest1200
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest1200';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | string)[] = ['a', 'b', 1, 2, 3];
        let array: (number | string)[] = [1, 2, 3];
        let newValue = array.unshift('a', 'b');
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
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1300
     * @tc.name builtinsArrayUnshiftTest1300
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest1300';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | boolean)[] = [true, false, 1, 2, 3];
        let array: (number | boolean)[] = [1, 2, 3];
        let newValue = array.unshift(true, false);
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
     * @tc.number SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1400
     * @tc.name builtinsArrayUnshiftTest1400
     * @tc.desc Testing unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayUnshiftTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayUnshiftTest1400';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | TestA)[] = [{
          a: 1
        }, 1, 2, 3];
        let array: (number | TestA)[] = [1, 2, 3];
        let newValue = array.unshift({
          a: 1
        });
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
  })
}