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

export default function builtinsReadonlyArrayConcatTest() {
  describe('builtinsReadonlyArrayConcatTest', () => {
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0100
     * @tc.name builtinsReadonlyArrayConcatTest0100
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsReadonlyArrayConcatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0100';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(4);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0200
     * @tc.name builtinsReadonlyArrayConcatTest0200
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0200';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4,5';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat([4, 5]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0300
     * @tc.name builtinsReadonlyArrayConcatTest0300
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0300';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4,5,6';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(4, 5, 6);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0400
     * @tc.name builtinsReadonlyArrayConcatTest0400
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0400';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4,5,6,7';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat([4, 5], [6, 7]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0500
     * @tc.name builtinsReadonlyArrayConcatTest0500
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0500';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4,5,6';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(4, [5, 6]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0600
     * @tc.name builtinsReadonlyArrayConcatTest0600
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0600';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,4,5,6';
        let arr: readonly (number | number[])[] = [1, 2, 3];

        let res = arr.concat([[4, 5], 6]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0700
     * @tc.name builtinsReadonlyArrayConcatTest0700
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0700';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,,3,4,5';
        let arr: readonly (number | undefined)[] = [1, , 3];

        let res = arr.concat([4, 5]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0800
     * @tc.name builtinsReadonlyArrayConcatTest0800
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0800';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3';
        let arr: readonly (number | undefined)[] = [1, 2, 3];

        let res = arr.concat();
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_0900
     * @tc.name builtinsReadonlyArrayConcatTest0900
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest0900';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3';
        let arr: readonly (number | undefined)[] = [1, 2, 3];

        let res = arr.concat([]);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1000
     * @tc.name builtinsReadonlyArrayConcatTest1000
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1000';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,[object Object]';
        let arr: readonly (number | TestA)[] = [1, 2, 3];

        let res: (number | TestA)[] = arr.concat({
          a: 4, b: 5
        });
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1100
     * @tc.name builtinsReadonlyArrayConcatTest1100
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1100';
      console.info(`${caseName} test start`);
      try {
        let arr: readonly number[] = [1, 2, 3];

        const arr2 = [];
        arr2['abc'] = 111;
        arr2['aaa'] = 222;

        let res = arr.concat(arr2);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual('1,2,3');
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1200
     * @tc.name builtinsReadonlyArrayConcatTest1200
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1200';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,';
        let arr: readonly (number | undefined)[] = [1, 2, 3];

        let res: (number | undefined)[] = arr.concat(undefined);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1300
     * @tc.name builtinsReadonlyArrayConcatTest1300
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1300';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,';
        let arr: readonly (number | null)[] = [1, 2, 3];

        let res: (number | null)[] = arr.concat(null);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1400
     * @tc.name builtinsReadonlyArrayConcatTest1400
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1400';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,NaN';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(NaN);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1500
     * @tc.name builtinsReadonlyArrayConcatTest1500
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1500';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1600
     * @tc.name builtinsReadonlyArrayConcatTest1600
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1600';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,undefined';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('undefined');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1700
     * @tc.name builtinsReadonlyArrayConcatTest1700
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1700';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,null';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('null');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1800
     * @tc.name builtinsReadonlyArrayConcatTest1800
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1800';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_1900
     * @tc.name builtinsReadonlyArrayConcatTest1900
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest1900';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,\ud83d\udc46';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('\ud83d\udc46');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_2000
     * @tc.name builtinsReadonlyArrayConcatTest2000
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest2000';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,\udc04';
        let arr: readonly (number | string)[] = [1, 2, 3];

        let res: (number | string)[] = arr.concat('\udc04');
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_2100
     * @tc.name builtinsReadonlyArrayConcatTest2100
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest2100';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,1,0,0';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(Math.floor(1.5), 0, -0);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_2200
     * @tc.name builtinsReadonlyArrayConcatTest2200
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest2200';
      console.info(`${caseName} test start`);
      try {
        const exp: string = '1,2,3,2.220446049250313e-16,5e-324,1.7976931348623157e+308,-Infinity,Infinity';
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res.toString()).assertEqual(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_CONCAT_TEST_2300
     * @tc.name builtinsReadonlyArrayConcatTest2300
     * @tc.desc readonlyArray concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayConcatTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      const caseName = 'builtinsReadonlyArrayConcatTest2300';
      console.info(`${caseName} test start`);
      try {
        const exp: number[] = [1, 2, 3, 123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3];
        let arr: readonly number[] = [1, 2, 3];

        let res: number[] = arr.concat(123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3);
        console.info(`${caseName} res length is = ${res.length}`);

        expect(res).assertDeepEquals(exp);
        expect(arr.toString()).assertEqual('1,2,3');
      } catch (err) {
        console.error(`${caseName} failed, error: ${err.message}`);
        expect().assertFail();
      }
      done();
      console.info(`${caseName} test end`);
    })
  })
}