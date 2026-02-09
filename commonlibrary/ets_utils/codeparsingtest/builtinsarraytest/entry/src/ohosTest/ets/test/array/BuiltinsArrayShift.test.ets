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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it , Level, TestType, Size} from '@ohos/hypium';
import { TestA } from '../../testability/pages/InterfaceDefined';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayShiftTest() {
  describe('builtinsArrayShiftTest', () => {
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
     * @tc.name   builtinsArrayShiftTest0100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0100
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayShiftTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0100';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [2, 3];
        let array: number[] = [1, 2, 3];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(3);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayShiftTest0200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0200
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0200';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [];
        let array: number[] = [];
        let newValue = array.shift();
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
     * @tc.name   builtinsArrayShiftTest0300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0300
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0300';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [];
        let array: number[] = [5];
        let newValue = array.shift();
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
     * @tc.name   builtinsArrayShiftTest0400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0400
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0400';
      console.info(`${caseName} test start`);
      try {
        let exp: number[] = [2, 3, 4, 5];
        let array: number[] = [1, 2, 3, 4, 5];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertEqual(2);
        expect(array[1]).assertEqual(3);
        expect(array[2]).assertEqual(4);
        expect(array[3]).assertEqual(5);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayShiftTest0500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0500
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0500';
      console.info(`${caseName} test start`);
      try {
        let exp: (null | number)[] = [null, 3, 4];
        let array: (null | number)[] = [1, null, 3, 4];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array[0]).assertNull();
        expect(array[1]).assertEqual(3);
        expect(array[2]).assertEqual(4);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayShiftTest0600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0600
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0600';
      console.info(`${caseName} test start`);
      try {
        let exp: (number | TestA)[] = [{
          a: 1
        }, {
          a: 1
        }, 3, 4];
        let array: (number | TestA)[] = [1, {
          a: 1
        }, {
          a: 1
        }, 3, 4];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual(1);
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayShiftTest0700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0700
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0700';
      console.info(`${caseName} test start`);
      try {
        let exp: string[] = ['banana', 'cherry'];
        let array: string[] = ['apple', 'banana', 'cherry'];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual('apple');
        expect(array[0]).assertEqual('banana');
        expect(array[1]).assertEqual('cherry');
        expect(array).assertDeepEquals(exp);
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsArrayShiftTest0800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0800
     * @tc.desc   Testing shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayShiftTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      const caseName = 'builtinsArrayShiftTest0800';
      console.info(`${caseName} test start`);
      try {
        let exp: string[] = ['', 'cherry'];
        let array: string[] = ['apple', '', 'cherry'];
        let newValue = array.shift();
        console.info(caseName + 'newValue is: ' + newValue);
        console.info(caseName + 'array length is:' + array.length);
        expect(newValue).assertEqual('apple');
        expect(array[0]).assertEqual('');
        expect(array[1]).assertEqual('cherry');
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