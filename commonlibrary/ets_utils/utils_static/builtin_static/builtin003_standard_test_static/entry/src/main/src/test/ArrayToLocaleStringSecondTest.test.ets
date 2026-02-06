/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ArrayToLocaleStringSecondTest() {
  describe('ArrayToLocaleStringSecondTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0100
     * @tc.name ArrayToLocaleStringSecondTest0100
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          6.6 as float,
          10.1 as float
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('6.6,10.1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0200
     * @tc.name ArrayToLocaleStringSecondTest0200
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -6.6 as float,
          -10.1 as float
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-6.6,-10.1');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0300
     * @tc.name ArrayToLocaleStringSecondTest0300
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.88e+6 as float];
        const result = toLocaleString(arr);
        expect(result).assertEqual('9,880,000');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0400
     * @tc.name ArrayToLocaleStringSecondTest0400
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.22e-5 as float];
        const result = toLocaleString(arr);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0500
     * @tc.name ArrayToLocaleStringSecondTest0500
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float];
        const result = toLocaleString(arr);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0600
     * @tc.name ArrayToLocaleStringSecondTest0600
     * @tc.desc test toLocaleString(self: FixedArray<float>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000000.0 as float];
        const result = toLocaleString(arr);
        expect(result).assertEqual('1,000,000');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0700
     * @tc.name ArrayToLocaleStringSecondTest0700
     * @tc.desc test  toLocaleString(se1lf: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          6.6 as float,
          10.1 as float
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0800
     * @tc.name ArrayToLocaleStringSecondTest0800
     * @tc.desc test  toLocaleString(self: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -6.6 as float,
          -10.1 as float
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_0900
     * @tc.name ArrayToLocaleStringSecondTest0900
     * @tc.desc test  toLocaleString(self: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.88e+6 as float];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1000
     * @tc.name ArrayToLocaleStringSecondTest1000
     * @tc.desc test  toLocaleString(self: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.22e-5 as float];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1100
     * @tc.name ArrayToLocaleStringSecondTest1100
     * @tc.desc test  toLocaleString(self: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1200
     * @tc.name ArrayToLocaleStringSecondTest1200
     * @tc.desc test  toLocaleString(self: FixedArray<float>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000000.0 as float];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1300
     * @tc.name ArrayToLocaleStringSecondTest1300
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          6.6 as float,
          10.1 as float
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1400
     * @tc.name ArrayToLocaleStringSecondTest1400
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [
          -6.6 as float,
          -10.1 as float
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1500
     * @tc.name ArrayToLocaleStringSecondTest1500
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.88e+6 as float];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1600
     * @tc.name ArrayToLocaleStringSecondTest1600
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.22e-5 as float];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1700
     * @tc.name ArrayToLocaleStringSecondTest1700
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [0.0 as float];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1800
     * @tc.name ArrayToLocaleStringSecondTest1800
     * @tc.desc test toLocaleString(self: FixedArray<float>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1000000.0 as float];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_1900
     * @tc.name ArrayToLocaleStringSecondTest1900
     * @tc.desc test toLocaleString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 100];
        const result = toLocaleString(arr);
        expect(result).assertEqual('6,100');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2000
     * @tc.name ArrayToLocaleStringSecondTest2000
     * @tc.desc test toLocaleString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -100];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-6,-100');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2100
     * @tc.name ArrayToLocaleStringSecondTest2100
     * @tc.desc test toLocaleString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0];
        const result = toLocaleString(arr);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2200
     * @tc.name ArrayToLocaleStringSecondTest2200
     * @tc.desc test toLocaleString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [
          Int.MIN_VALUE,
          Int.MAX_VALUE
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-2,147,483,648,2,147,483,647');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2300
     * @tc.name ArrayToLocaleStringSecondTest2300
     * @tc.desc test toLocaleString(self: FixedArray<int>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [66, 66, 66, 66];
        const result = toLocaleString(arr);
        expect(result).assertEqual('66,66,66,66');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2400
     * @tc.name ArrayToLocaleStringSecondTest2400
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 100];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2500
     * @tc.name ArrayToLocaleStringSecondTest2500
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -100];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2600
     * @tc.name ArrayToLocaleStringSecondTest2600
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2700
     * @tc.name ArrayToLocaleStringSecondTest2700
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [
          Int.MIN_VALUE,
          Int.MAX_VALUE
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2800
     * @tc.name ArrayToLocaleStringSecondTest2800
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [66, 66, 66, 66];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_2900
     * @tc.name ArrayToLocaleStringSecondTest2900
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [6, 100];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3000
     * @tc.name ArrayToLocaleStringSecondTest3000
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [-6, -100];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3100
     * @tc.name ArrayToLocaleStringSecondTest3100
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [0];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3200
     * @tc.name ArrayToLocaleStringSecondTest3200
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [
          Int.MIN_VALUE,
          Int.MAX_VALUE
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3300
     * @tc.name ArrayToLocaleStringSecondTest3300
     * @tc.desc test toLocaleString(self: FixedArray<int>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [66, 66, 66, 66];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3400
     * @tc.name ArrayToLocaleStringSecondTest3400
     * @tc.desc test toLocaleString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long];
        const result = toLocaleString(arr);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3500
     * @tc.name ArrayToLocaleStringSecondTest3500
     * @tc.desc test toLocaleString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          123456789 as long,
          987654321 as long
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('123,456,789,987,654,321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3600
     * @tc.name ArrayToLocaleStringSecondTest3600
     * @tc.desc test toLocaleString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          -123456789 as long,
          -987654321 as long
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-123,456,789,-987,654,321');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3700
     * @tc.name ArrayToLocaleStringSecondTest3700
     * @tc.desc test toLocaleString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 50, 100, 200];
        const result = toLocaleString(arr);
        expect(result).assertEqual('10,50,100,200');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3800
     * @tc.name ArrayToLocaleStringSecondTest3800
     * @tc.desc test toLocaleString(self: FixedArray<long>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          Long.MIN_VALUE as long,
          Long.MAX_VALUE as long
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-9,223,372,036,854,775,808,9,223,372,036,854,775,807');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_3900
     * @tc.name ArrayToLocaleStringSecondTest3900
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4000
     * @tc.name ArrayToLocaleStringSecondTest4000
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          123456789 as long,
          987654321 as long
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4100
     * @tc.name ArrayToLocaleStringSecondTest4100
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          -123456789 as long,
          -987654321 as long
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4200
     * @tc.name ArrayToLocaleStringSecondTest4200
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 50, 100, 200];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4300
     * @tc.name ArrayToLocaleStringSecondTest4300
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          Long.MIN_VALUE as long,
          Long.MAX_VALUE as long
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4400
     * @tc.name ArrayToLocaleStringSecondTest4400
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [0 as long];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4500
     * @tc.name ArrayToLocaleStringSecondTest4500
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          123456789 as long,
          987654321 as long
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4600
     * @tc.name ArrayToLocaleStringSecondTest4600
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          -123456789 as long,
          -987654321 as long
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4700
     * @tc.name ArrayToLocaleStringSecondTest4700
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [10, 50, 100, 200];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4800
     * @tc.name ArrayToLocaleStringSecondTest4800
     * @tc.desc test toLocaleString(self: FixedArray<long>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [
          Long.MIN_VALUE as long,
          Long.MAX_VALUE as long
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_4900
     * @tc.name ArrayToLocaleStringSecondTest4900
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = toLocaleString(arr);
        expect(result).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5000
     * @tc.name ArrayToLocaleStringSecondTest5000
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          500 as short,
          1000 as short
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('100,500,1,000');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5100
     * @tc.name ArrayToLocaleStringSecondTest5100
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -100 as short,
          -500 as short,
          -1000 as short
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-100,-500,-1,000');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5200
     * @tc.name ArrayToLocaleStringSecondTest5200
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short];
        const result = toLocaleString(arr);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5300
     * @tc.name ArrayToLocaleStringSecondTest5300
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [Short.MIN_VALUE as short];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-32,768');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5400
     * @tc.name ArrayToLocaleStringSecondTest5400
     * @tc.desc test toLocaleString(self: FixedArray<short>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MAX_VALUE as short
        ];
        const result = toLocaleString(arr);
        expect(result).assertEqual('32,767');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5500
     * @tc.name ArrayToLocaleStringSecondTest5500
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5600
     * @tc.name ArrayToLocaleStringSecondTest5600
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          500 as short,
          1000 as short
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5700
     * @tc.name ArrayToLocaleStringSecondTest5700
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -100 as short,
          -500 as short,
          -1000 as short
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5800
     * @tc.name ArrayToLocaleStringSecondTest5800
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_5900
     * @tc.name ArrayToLocaleStringSecondTest5900
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MIN_VALUE as short,
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6000
     * @tc.name ArrayToLocaleStringSecondTest6000
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MAX_VALUE as short,
        ];
        const locales: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6100
     * @tc.name ArrayToLocaleStringSecondTest6100
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6200
     * @tc.name ArrayToLocaleStringSecondTest6200
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          100 as short,
          500 as short,
          1000 as short
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6300
     * @tc.name ArrayToLocaleStringSecondTest6300
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          -100 as short,
          -500 as short,
          -1000 as short
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6400
     * @tc.name ArrayToLocaleStringSecondTest6400
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [0 as short];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6500
     * @tc.name ArrayToLocaleStringSecondTest6500
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MIN_VALUE as short,
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_SECOND_TEST_6600
     * @tc.name ArrayToLocaleStringSecondTest6600
     * @tc.desc test toLocaleString(self: FixedArray<short>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringSecondTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [
          Short.MAX_VALUE as short,
        ];
        const locales: object = {};
        const options: object = {};
        let errorOccurred: boolean = false;
        let errorContainsKeyword: boolean = false;
        try {
          toLocaleString(arr, locales, options);
        } catch (e) {
          errorOccurred = true;
          errorContainsKeyword = e.toString().includes('not implemented');
        }
        expect(errorOccurred).assertTrue();
        expect(errorContainsKeyword).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}