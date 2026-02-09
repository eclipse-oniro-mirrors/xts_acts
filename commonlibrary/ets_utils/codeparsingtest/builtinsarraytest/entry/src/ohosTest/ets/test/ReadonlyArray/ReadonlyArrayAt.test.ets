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
import { CustomAny, fnArr, fnArrTwo } from '../../testability/pages/ReadonlyArrayUtils';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsReadonlyArrayAtTest() {
  describe('builtinsReadonlyArrayAtTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   builtinsReadonlyArrayAtTest0100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0100
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsReadonlyArrayAtTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0100';
      console.info(`${caseName} test start`);
      try {
        const exp: number = 1;
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0200
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0200';
      console.info(`${caseName} test start`);
      try {
        const exp: number = 3;
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(2);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0300
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0300';
      console.info(`${caseName} test start`);
      try {
        const exp: number = 5;
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(-1);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0400
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0400';
      console.info(`${caseName} test start`);
      try {
        const exp: number = 3;
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(-3);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0500
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0500
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0500';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(5);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0600
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0600
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0600';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(10);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0700
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0700
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0700';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(-6);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0800
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0800
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0800';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(-10);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest0900
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_0900
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest0900';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [];

        let res: number | undefined = (arr as CustomAny).at(0);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1000
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1000
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1000';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [];

        let res: number | undefined = (arr as CustomAny).at(-1);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1100
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1100';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(2.5);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(3);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1200
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1200';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(-2.5);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(4);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1300
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1300';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at('2');
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(3);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1400
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1400';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at('-1');
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(5);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1500
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1500
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1500';
      console.info(`${caseName} test start`);
      try {
        fnArr()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertContain('TypeError');
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1600
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1600
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1600';
      console.info(`${caseName} test start`);
      try {
        fnArrTwo()
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertContain('TypeError');
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1700
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1700
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1700';
      console.info(`${caseName} test start`);
      try {
        // Number.EPSILON
        let arr: readonly number[] = [2, 3, 1, 4];

        let res: number | undefined = (arr as CustomAny).at(Number.EPSILON);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(2);
        expect(arr.toString()).assertEqual('2,3,1,4');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1800
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1800
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1800';
      console.info(`${caseName} test start`);
      try {
        // Number.MIN_VALUE
        let arr: readonly number[] = [2, 3, 1, 5];

        let res: number | undefined = (arr as CustomAny).at(Number.MIN_VALUE);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(2);
        expect(arr.toString()).assertEqual('2,3,1,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest1900
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_1900
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest1900';
      console.info(`${caseName} test start`);
      try {
        // Number.MAX_VALUE
        let arr: readonly number[] = [2, 3, 1, 6];

        let res: number | undefined = (arr as CustomAny).at(Number.MAX_VALUE);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('2,3,1,6');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest2000
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_2000
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest2000';
      console.info(`${caseName} test start`);
      try {
        // -Infinity
        let arr: readonly number[] = [];

        let res: number | undefined = (arr as CustomAny).at(-Infinity);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest2100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_2100
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest2100';
      console.info(`${caseName} test start`);
      try {
        // Infinity
        let arr: readonly number[] = [];

        let res: number | undefined = (arr as CustomAny).at(Infinity);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest2200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_2200
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest2200';
      console.info(`${caseName} test start`);
      try {
        let x = '2';
        // x+x
        let arr: readonly number[] = [1, 2, 3];

        let res: number | undefined = (arr as CustomAny).at(x + x);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertUndefined();
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest2300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_2300
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest2300';
      console.info(`${caseName} test start`);
      try {
        let x = 2;
        // x*x
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(x * x);
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(5);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   builtinsReadonlyArrayAtTest2400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_AT_TEST_2400
     * @tc.desc   readonlyArray at
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayAtTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayAtTest2400';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3, 4, 5];

        let res: number | undefined = (arr as CustomAny).at(Math.floor(3.6));
        console.info(`${caseName} res is = ${res}`);

        expect(res).assertEqual(4);
        expect(arr.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}