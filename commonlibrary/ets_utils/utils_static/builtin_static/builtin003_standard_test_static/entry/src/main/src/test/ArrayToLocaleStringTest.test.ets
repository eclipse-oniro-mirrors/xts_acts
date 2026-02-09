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

export default function ArrayToLocaleStringTest() {
  describe('ArrayToLocaleStringTest', ():void => {
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0100
     * @tc.name ArrayToLocaleStringTest0100
     * @tc.desc test toLocaleString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = toLocaleString(arr);
        expect(result).assertEqual('true,false,true');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0200
     * @tc.name ArrayToLocaleStringTest0200
     * @tc.desc test toLocaleString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
        const result = toLocaleString(arr);
        expect(result).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0300
     * @tc.name ArrayToLocaleStringTest0300
     * @tc.desc test toLocaleString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true];
        const result = toLocaleString(arr);
        expect(result).assertEqual('true,true,true');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0400
     * @tc.name ArrayToLocaleStringTest0400
     * @tc.desc test toLocaleString(self: FixedArray<boolean>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false];
        const result = toLocaleString(arr);
        expect(result).assertEqual('false,false,false');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0500
     * @tc.name ArrayToLocaleStringTest0500
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, false];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0600
     * @tc.name ArrayToLocaleStringTest0600
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0700
     * @tc.name ArrayToLocaleStringTest0700
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0800
     * @tc.name ArrayToLocaleStringTest0800
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_0900
     * @tc.name ArrayToLocaleStringTest0900
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, true];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1000
     * @tc.name ArrayToLocaleStringTest1000
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1100
     * @tc.name ArrayToLocaleStringTest1100
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {;
        const caseName = 'ArrayToLocaleStringTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true, false];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1200
     * @tc.name ArrayToLocaleStringTest1200
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, true, true, true];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1300
     * @tc.name ArrayToLocaleStringTest1300
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false, false, false, false];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1400
     * @tc.name ArrayToLocaleStringTest1400
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1500
     * @tc.name ArrayToLocaleStringTest1500
     * @tc.desc test toLocaleString(self: FixedArray<boolean>, locales: Object, options: Object): string return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1600
     * @tc.name ArrayToLocaleStringTest1600
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127];
        const result = toLocaleString(arr);
        expect(result).assertEqual('127');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1700
     * @tc.name ArrayToLocaleStringTest1700
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-128');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1800
     * @tc.name ArrayToLocaleStringTest1800
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50, 60];
        const result = toLocaleString(arr);
        expect(result).assertEqual('10,20,30,40,50,60');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_1900
     * @tc.name ArrayToLocaleStringTest1900
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-60, -40, -20];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-60,-40,-20');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2000
     * @tc.name ArrayToLocaleStringTest2000
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = toLocaleString(arr);
        expect(result).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2100
     * @tc.name ArrayToLocaleStringTest2100
     * @tc.desc test toLocaleString(self: FixedArray<byte>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0x01, 0x02];
        const result = toLocaleString(arr);
        expect(result).assertEqual('1,2');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2200
     * @tc.name ArrayToLocaleStringTest2200
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2300
     * @tc.name ArrayToLocaleStringTest2300
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10, 20, 30, 60];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2400
     * @tc.name ArrayToLocaleStringTest2400
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2500
     * @tc.name ArrayToLocaleStringTest2500
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2600
     * @tc.name ArrayToLocaleStringTest2600
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0b1100100];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2700
     * @tc.name ArrayToLocaleStringTest2700
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2800
     * @tc.name ArrayToLocaleStringTest2800
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_2900
     * @tc.name ArrayToLocaleStringTest2900
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0, 30, 60];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3000
     * @tc.name ArrayToLocaleStringTest3000
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [127];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3100
     * @tc.name ArrayToLocaleStringTest3100
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [-128];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3200
     * @tc.name ArrayToLocaleStringTest3200
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0b00011001, 0b00110111];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3300
     * @tc.name ArrayToLocaleStringTest3300
     * @tc.desc test toLocaleString(self: FixedArray<byte>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [0];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3400
     * @tc.name ArrayToLocaleStringTest3400
     * @tc.desc test toLocaleString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x69.toChar()]
        const result = toLocaleString(arr);
        const expected: string = 'H,i';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3500
     * @tc.name ArrayToLocaleStringTest3500
     * @tc.desc test toLocaleString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()]
        const result = toLocaleString(arr);
        const expected: string = 'A,B,C';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3600
     * @tc.name ArrayToLocaleStringTest3600
     * @tc.desc test toLocaleString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = []
        const result = toLocaleString(arr);
        const expected: string = '';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3700
     * @tc.name ArrayToLocaleStringTest3700
     * @tc.desc test toLocaleString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()]
        const result = toLocaleString(arr);
        const expected: string = '1,2,3';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3800
     * @tc.name ArrayToLocaleStringTest3800
     * @tc.desc test toLocaleString(self: FixedArray<char>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x21.toChar(), 0x3F.toChar(), 0x40.toChar()]
        const result = toLocaleString(arr);
        const expected: string = '!,?,@';
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_3900
     * @tc.name ArrayToLocaleStringTest3900
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x69.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4000
     * @tc.name ArrayToLocaleStringTest4000
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x0041.toChar(), 0x0042.toChar(), 0x0043.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4100
     * @tc.name ArrayToLocaleStringTest4100
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4200
     * @tc.name ArrayToLocaleStringTest4200
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4300
     * @tc.name ArrayToLocaleStringTest4300
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x21.toChar(), 0x3F.toChar(), 0x40.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4400
     * @tc.name ArrayToLocaleStringTest4400
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x48.toChar(), 0x69.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4500
     * @tc.name ArrayToLocaleStringTest4500
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x41.toChar(), 0x42.toChar(), 0x43.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4600
     * @tc.name ArrayToLocaleStringTest4600
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4700
     * @tc.name ArrayToLocaleStringTest4700
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x31.toChar(), 0x32.toChar(), 0x33.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4800
     * @tc.name ArrayToLocaleStringTest4800
     * @tc.desc test toLocaleString(self: FixedArray<char>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [0x21.toChar(), 0x3F.toChar(), 0x40.toChar()];
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
        console.info(`${caseName}, test pass`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_4900
     * @tc.name ArrayToLocaleStringTest4900
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1234.12, 7890.78];
        const result = toLocaleString(arr);
        expect(result).assertEqual('1,234.12,7,890.78');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5000
     * @tc.name ArrayToLocaleStringTest5000
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1234.12, -7890.78];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-1,234.12,-7,890.78');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5100
     * @tc.name ArrayToLocaleStringTest5100
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = toLocaleString(arr);
        expect(result).assertEqual('');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5200
     * @tc.name ArrayToLocaleStringTest5200
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1000, 2000, 6000];
        const result = toLocaleString(arr);
        expect(result).assertEqual('1,000,2,000,6,000');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5300
     * @tc.name ArrayToLocaleStringTest5300
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [NaN];
        const result = toLocaleString(arr);
        expect(result).assertEqual('NaN');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5400
     * @tc.name ArrayToLocaleStringTest5400
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [Infinity];
        const result = toLocaleString(arr);
        expect(result).assertEqual('∞');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5500
     * @tc.name ArrayToLocaleStringTest5500
     * @tc.desc test toLocaleString(self: FixedArray<double>) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-Infinity];
        const result = toLocaleString(arr);
        expect(result).assertEqual('-∞');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5600
     * @tc.name ArrayToLocaleStringTest5600
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1234.12, 7890.78];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5700
     * @tc.name ArrayToLocaleStringTest5700
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1234.12, -7890.78];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5800
     * @tc.name ArrayToLocaleStringTest5800
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_5900
     * @tc.name ArrayToLocaleStringTest5900
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1000, 2000, 6000];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6000
     * @tc.name ArrayToLocaleStringTest6000
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [NaN];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6100
     * @tc.name ArrayToLocaleStringTest6100
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [Infinity];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6200
     * @tc.name ArrayToLocaleStringTest6200
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-Infinity];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6300
     * @tc.name ArrayToLocaleStringTest6300
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1234.12, 7890.78];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6400
     * @tc.name ArrayToLocaleStringTest6400
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-1234.12, -7890.78];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6500
     * @tc.name ArrayToLocaleStringTest6500
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6600
     * @tc.name ArrayToLocaleStringTest6600
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1000, 2000, 6000];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6700
     * @tc.name ArrayToLocaleStringTest6700
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [NaN];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6800
     * @tc.name ArrayToLocaleStringTest6800
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [Infinity];
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
     * @tc.number ARRAY_TO_LOCALE_STRING_TEST_6900
     * @tc.name ArrayToLocaleStringTest6900
     * @tc.desc test toLocaleString(self: FixedArray<double>, locales: Object, options: Object) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayToLocaleStringTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'ArrayToLocaleStringTest6900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [-Infinity];
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