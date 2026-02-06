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
import { TestA } from '../../testability/pages/InterfaceDefined';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsReadonlyArrayEveryTest() {
  describe('builtinsReadonlyArrayEveryTest', () => {
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0100
     * @tc.name builtinsReadonlyArrayEveryTest0100
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsReadonlyArrayEveryTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0100';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0200
     * @tc.name builtinsReadonlyArrayEveryTest0200
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0200';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 2);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0300
     * @tc.name builtinsReadonlyArrayEveryTest0300
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0300';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0400
     * @tc.name builtinsReadonlyArrayEveryTest0400
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0400';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [5];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0500
     * @tc.name builtinsReadonlyArrayEveryTest0500
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0500';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [0];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0600
     * @tc.name builtinsReadonlyArrayEveryTest0600
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0600';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 0];

        let res = arr.every((x: number, index: number, originArr: readonly number[]) => x > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0700
     * @tc.name builtinsReadonlyArrayEveryTest0700
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0700';
      console.info(`${caseName} test start`);
      try {
        let arr = [1, , 3];

        let res = arr.every(x => Number(x) > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0800
     * @tc.name builtinsReadonlyArrayEveryTest0800
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0800';
      console.info(`${caseName} test start`);
      try {
        let arr = [1, , 0];

        let res = arr.every(x => Number(x) > 0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertFalse();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_0900
     * @tc.name builtinsReadonlyArrayEveryTest0900
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest0900';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3];

        let res = arr.every((x) => {
          return x > 0;
        }, {
          x: 1
        })
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_1000
     * @tc.name builtinsReadonlyArrayEveryTest1000
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest1000';
      console.info(`${caseName} test start`);
      try {
        let arr: ReadonlyArray<string> = ['a', 'b', 'c'];

        let res = arr.every(x => x.length > 0);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_1100
     * @tc.name builtinsReadonlyArrayEveryTest1100
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest1100';
      console.info(`${caseName} test start`);
      try {
        let arr: ReadonlyArray<TestA> = [{
          a: 1
        }, {
          a: 2
        }, {
          a: 3
        }];

        let res = arr.every(obj => obj.a! > 0);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_1200
     * @tc.name builtinsReadonlyArrayEveryTest1200
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest1200';
      console.info(`${caseName} test start`);
      try {
        let arr: ReadonlyArray<number> = Array(1000000).fill(1);
        console.info('====', arr.length);
        let res = arr.every(x => x > 0);

        expect(res).assertTrue();
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_EVERY_TEST_1300
     * @tc.name builtinsReadonlyArrayEveryTest1300
     * @tc.desc readonlyArray every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayEveryTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayEveryTest1300';
      console.info(`${caseName} test start`);
      try {
        let res = [null, undefined, 3].every((element) => element !== null);

        expect(res).assertFalse()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}