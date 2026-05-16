/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function Array_04Test() {
  describe('Array_04Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0100
     * @tc.name    testJoin0001
     * @tc.desc    Testing join function with a single element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0001";
      try {
        let array: FixedArray<long> = [123];
        let result = join(array);
        expect(result).assertEqual("123");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0200
     * @tc.name    testJoin0002
     * @tc.desc    Testing join function with multiple elements and default separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0002";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array);
        expect(result).assertEqual("123,456,789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0300
     * @tc.name    testJoin0003
     * @tc.desc    Testing join function with multiple elements and custom separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0003";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array, "-");
        expect(result).assertEqual("123-456-789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0400
     * @tc.name    testJoin0004
     * @tc.desc    Testing join function with undefined separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0004";
      try {
        let array: FixedArray<long> = [123, 456, 789];
        let result = join(array, undefined);
        expect(result).assertEqual("123,456,789");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0500
     * @tc.name    testJoin0005
     * @tc.desc    Testing join function with an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0005";
      try {
        let array: FixedArray<long> = [];
        let result = join(array);
        expect(result).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0600
     * @tc.name    testJoin0006
     * @tc.desc    Testing join function with a single-element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0006";
      try {
        let self: FixedArray<short> = [1];
        let result = join(self);
        expect(result).assertEqual("1");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0700
     * @tc.name    testJoin0007
     * @tc.desc    Testing join function with a multi-element array and default separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0007";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self);
        expect(result).assertEqual("1,2,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0800
     * @tc.name    testJoin0008
     * @tc.desc    Testing join function with a multi-element array and custom separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0008";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self, "-");
        expect(result).assertEqual("1-2-3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_0900
     * @tc.name    testJoin0009
     * @tc.desc    Testing join function with a multi-element array and undefined separator
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0009";
      try {
        let self: FixedArray<short> = [1, 2, 3];
        let result = join(self, undefined);
        expect(result).assertEqual("1,2,3");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_JOIN_1000
     * @tc.name    testJoin0010
     * @tc.desc    Testing join function with an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testJoin0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let TAG = "testJoin0010";
      try {
        let self: FixedArray<short> = [];
        let result = join(self);
        expect(result).assertEqual("");
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0100
     * @tc.name    testLastIndexOf0001
     * @tc.desc    Testing lastIndexOf with normal values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0001";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = 3;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0200
     * @tc.name    testLastIndexOf0002
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0002";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = false;
        let fromIndex = 2;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0300
     * @tc.name    testLastIndexOf0003
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0003";
      try {
        let arr: FixedArray<boolean> = [];
        let element = true;
        let fromIndex = 0;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0400
     * @tc.name    testLastIndexOf0004
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0004";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = -2;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0500
     * @tc.name    testLastIndexOf0005
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0005";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true];
        let element = true;
        let fromIndex = 10;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0600
     * @tc.name    testLastIndexOf0006
     * @tc.desc    Testing lastIndexOf with all elements matching
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0006";
      try {
        let arr: FixedArray<boolean> = [true, true, true, true, true];
        let element = true;
        let fromIndex = 3;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0700
     * @tc.name    testLastIndexOf0007
     * @tc.desc    Testing lastIndexOf with no elements matching
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0007";
      try {
        let arr: FixedArray<boolean> = [false, false, false, false, false];
        let element = true;
        let fromIndex = 4;
        let result = lastIndexOf(arr, element, fromIndex);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0800
     * @tc.name    testLastIndexOf0008
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0008";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_0900
     * @tc.name    testLastIndexOf0009
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is in the array and fromIndex to 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0009";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true, 2);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1000
     * @tc.name    testLastIndexOf0010
     * @tc.desc    Test the lastIndexOf interface by passing the parameter value to a boolean element which is not in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0010";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('-1');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1100
     * @tc.name    testLastIndexOf0011
     * @tc.desc    Test the lastIndexOf interface with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0011";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let index = lastIndexOf(arr, true, -2);
        expect(String(index)).assertEqual('2');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1200
     * @tc.name    testLastIndexOf0012
     * @tc.desc    Test the lastIndexOf interface with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0012";
      try {
        let arr: FixedArray<boolean> = [];
        let index = lastIndexOf(arr, true);
        expect(String(index)).assertEqual('-1');
      } catch (err: BusinessError) {
        console.error(`${TAG} err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1300
     * @tc.name    testLastIndexOf0013
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0013";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 2, 5];
        const result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1400
     * @tc.name    testLastIndexOf0014
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0014";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1500
     * @tc.name    testLastIndexOf0015
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0015";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1600
     * @tc.name    testLastIndexOf0016
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0016";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1700
     * @tc.name    testLastIndexOf0017
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0017";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1800
     * @tc.name    testLastIndexOf0018
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0018";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1900
     * @tc.name    testLastIndexOf0019
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0019";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, -2);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_1900_01
     * @tc.name    testLastIndexOf0019_01
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0019_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0019_01";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, 10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2100
     * @tc.name    testLastIndexOf0021
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0021";
      try {
        const arr: FixedArray<number> = [100, 110, 120, 111, 101];
        const result = lastIndexOf(arr, 100, 2);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2200
     * @tc.name    testLastIndexOf0022
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0022";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2300
     * @tc.name    testLastIndexOf0023
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0023";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = lastIndexOf(arr, 6.6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2400
     * @tc.name    testLastIndexOf0024
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0024";
      try {
        let arr: FixedArray<double> = [];
        let result = lastIndexOf(arr, 1.1, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2500
     * @tc.name    testLastIndexOf0025
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0025";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2600
     * @tc.name    testLastIndexOf0026
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0026";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2700
     * @tc.name    testLastIndexOf0027
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0027";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 2.2, 5.5];
        let result = lastIndexOf(arr, 2.2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2800
     * @tc.name    testLastIndexOf0028
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0028";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_2900
     * @tc.name    testLastIndexOf0029
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0029";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3000
     * @tc.name    testLastIndexOf0030
     * @tc.desc    Testing lastIndexOf with default fromIndex (no fromIndex parameter)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0030";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3200
     * @tc.name    testLastIndexOf0032
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0032";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3300
     * @tc.name    testLastIndexOf0033
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0033";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3400
     * @tc.name    testLastIndexOf0034
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0034";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 2.2, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3500
     * @tc.name    testLastIndexOf0035
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0035";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 1.1, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3600
     * @tc.name    testLastIndexOf0036
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0036";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3700
     * @tc.name    testLastIndexOf0037
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0037";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3800
     * @tc.name    testLastIndexOf0038
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0038";
      try {
        let arr: FixedArray<number> = [6.6, 7.7, 11.0, 8.8, 5.5];
        let result = lastIndexOf(arr, 8.8);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_3900
     * @tc.name    testLastIndexOf0039
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0039";
      try {
        let arr: FixedArray<number> = [3.0, 9.0, 3.0, 2.0, 8.0];
        let result = lastIndexOf(arr, 2.0, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4000
     * @tc.name    testLastIndexOf0040
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0040";
      try {
        let arr: FixedArray<number> = [8.0, 9.0, 1.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4100
     * @tc.name    testLastIndexOf0041
     * @tc.desc    Testing lastIndexOf with default fromIndex (no fromIndex parameter)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0041";
      try {
        let arr: FixedArray<number> = [6.0, 9.0, 8.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4300
     * @tc.name    testLastIndexOf0043
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0043";
      try {
        let arr: FixedArray<number> = [6.0, 9.0, 8.0, 2.0, 5.0];
        let result = lastIndexOf(arr, 2.0, 3);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4400
     * @tc.name    testLastIndexOf0044
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0044";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4500
     * @tc.name    testLastIndexOf0045
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0045";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4600
     * @tc.name    testLastIndexOf0046
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0046";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4700
     * @tc.name    testLastIndexOf0047
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0047";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4800
     * @tc.name    testLastIndexOf0048
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0048";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_4900
     * @tc.name    testLastIndexOf0049
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0049";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5000
     * @tc.name    testLastIndexOf0050
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0050";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5100
     * @tc.name    testLastIndexOf0051
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0051";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5300
     * @tc.name    testLastIndexOf0053
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0053";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5400
     * @tc.name    testLastIndexOf0054
     * @tc.desc    Test lastIndexOf with element found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0054";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = lastIndexOf(arr, 2, 4);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5500
     * @tc.name    testLastIndexOf0055
     * @tc.desc    Test lastIndexOf with element not found in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0055";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 6, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5600
     * @tc.name    testLastIndexOf0056
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0056";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5700
     * @tc.name    testLastIndexOf0057
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0057";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5800
     * @tc.name    testLastIndexOf0058
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0058";
      try {
        const arr: FixedArray<number> = [];
        const result = lastIndexOf(arr, 4, 2);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_5900
     * @tc.name    testLastIndexOf0059
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0059";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6000
     * @tc.name    testLastIndexOf0060
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0060";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6100
     * @tc.name    testLastIndexOf0061
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0061";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 10);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6300
     * @tc.name    testLastIndexOf0063
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testLastIndexOf0063";
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = lastIndexOf(arr, 4, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6400
     * @tc.name    testLastIndexOf0064
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0064";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 3);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_6500
     * @tc.name    testLastIndexOf0065
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0065";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 6000, 3);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_7800
     * @tc.name    testLastIndexOf0078
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0078";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 3000, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_7900
     * @tc.name    testLastIndexOf0079
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0079";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8000
     * @tc.name    testLastIndexOf0080
     * @tc.desc    Testing lastIndexOf with fromIndex out of bounds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0080";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 10);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8100
     * @tc.name    testLastIndexOf0081
     * @tc.desc    Testing lastIndexOf with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0081";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 4);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8200
     * @tc.name    testLastIndexOf0082
     * @tc.desc    Testing lastIndexOf with element not found
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0082";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 6000, 4);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8300
     * @tc.name    testLastIndexOf0083
     * @tc.desc    Testing lastIndexOf with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0083";
      try {
        let arr: FixedArray<number> = [];
        let result = lastIndexOf(arr, 6000, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8400
     * @tc.name    testLastIndexOf0084
     * @tc.desc    Testing lastIndexOf with negative fromIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0084";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8500
     * @tc.name    testLastIndexOf0085
     * @tc.desc    Testing lastIndexOf with fromIndex greater than array length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0085";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000, 10);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LASTINDEXOF_8600
     * @tc.name    testLastIndexOf0086
     * @tc.desc    Testing lastIndexOf without fromIndex parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLastIndexOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLastIndexOf0086";
      try {
        let arr: FixedArray<number> = [1000, 2000, 3000, 4000, 5000];
        let result = lastIndexOf(arr, 3000);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0100
     * @tc.name    testLowerBoundSearch0001
     * @tc.desc    Testing lowerBoundSearch with key found in array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0001";
      try {
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0200
     * @tc.name    testLowerBoundSearch0002
     * @tc.desc    Testing lowerBoundSearch with key not found (all elements < key)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0002";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0300
     * @tc.name    testLowerBoundSearch0003
     * @tc.desc    Testing lowerBoundSearch with key not found (all elements >= key)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0003";
      try {
        let arr: FixedArray<boolean> = [true, true, true];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0400
     * @tc.name    testLowerBoundSearch0004
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0004";
      try {
        let arr: FixedArray<boolean> = [];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0500
     * @tc.name    testLowerBoundSearch0005
     * @tc.desc    Testing lowerBoundSearch with key at the beginning
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0005";
      try {
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0600
     * @tc.name    testLowerBoundSearch0006
     * @tc.desc    Testing lowerBoundSearch with key at the beginning
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0006";
      try {
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, false);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0700
     * @tc.name    testLowerBoundSearch0007
     * @tc.desc    Testing lowerBoundSearch with key=true, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0007";
      try {
        let arr: FixedArray<boolean> = [false, false, true, true];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0800
     * @tc.name    testLowerBoundSearch0008
     * @tc.desc    Testing lowerBoundSearch with key=true, no true elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0008";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let result = lowerBoundSearch(arr, true, 0, arr.length);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_0900
     * @tc.name    testLowerBoundSearch0009
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0009";
      try {
        let arr: FixedArray<boolean> = [];
        let result = lowerBoundSearch(arr, true, 0, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1000
     * @tc.name    testLowerBoundSearch0010
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0010";
      try {
        let arr: FixedArray<boolean> = [false, true, false, true];
        let result = lowerBoundSearch(arr, true, 2, 4);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1100
     * @tc.name    testLowerBoundSearch0011
     * @tc.desc    Testing lowerBoundSearch with key present in the middle of the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0011";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 30);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1200
     * @tc.name    testLowerBoundSearch0012
     * @tc.desc    Testing lowerBoundSearch with key smaller than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0012";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 5);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1300
     * @tc.name    testLowerBoundSearch0013
     * @tc.desc    Testing lowerBoundSearch with key larger than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0013";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 60);
        expect(result).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1400
     * @tc.name    testLowerBoundSearch0014
     * @tc.desc    Testing lowerBoundSearch with key not present but within array range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0014";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 25);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1500
     * @tc.name    testLowerBoundSearch0015
     * @tc.desc    Testing lowerBoundSearch with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0015";
      try {
        let arr: FixedArray<number> = [10, 20, 20, 20, 30];
        let result = lowerBoundSearch(arr, 20);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1600
     * @tc.name    testLowerBoundSearch0016
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0016";
      try {
        let arr: FixedArray<number> = [];
        let result = lowerBoundSearch(arr, 10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1700
     * @tc.name    testLowerBoundSearch0017
     * @tc.desc    Testing lowerBoundSearch with key=true, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0017";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 30, 0, 5);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1800
     * @tc.name    testLowerBoundSearch0018
     * @tc.desc    Testing lowerBoundSearch with key=true, no true elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0018";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 60, 0, 5);
        expect(result).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1900
     * @tc.name    testLowerBoundSearch0019
     * @tc.desc    Testing lowerBoundSearch with key=false, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0019";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 5, 0, 5);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2000
     * @tc.name    testLowerBoundSearch0020
     * @tc.desc    Testing lowerBoundSearch with key=false, no false elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0020";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 10, 0, 5);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2100
     * @tc.name    testLowerBoundSearch0021
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0021";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 50, 0, 5);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2200
     * @tc.name    testLowerBoundSearch0022
     * @tc.desc    Testing lowerBoundSearch with partial range (up to index 3)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0022";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 45, 0, 4); // Searching up to index 3 (value 40)
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2300
     * @tc.name    testLowerBoundSearch0023
     * @tc.desc    Testing lowerBoundSearch with key=true, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0023";
      try {
        let arr: FixedArray<number> = [];
        let result = lowerBoundSearch(arr, 10, 0, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2700
     * @tc.name    testLowerBoundSearch0027
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0027";
      try {
        let arr: FixedArray<number> = [10, 20, 20, 20, 30];
        let result = lowerBoundSearch(arr, 20, 0, 5);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_2800
     * @tc.name    testLowerBoundSearch0028
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0028";
      try {
        let arr: FixedArray<number> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 35, 1, 4); // Searching from index 1 to 3
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_3900
     * @tc.name    testLowerBoundSearch0039
     * @tc.desc    Testing lowerBoundSearch with key present in array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0039";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4000
     * @tc.name    testLowerBoundSearch0040
     * @tc.desc    Testing lowerBoundSearch with key not present, but greater than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0040";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 6.0);
        expect(result).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4100
     * @tc.name    testLowerBoundSearch0041
     * @tc.desc    Testing lowerBoundSearch with key not present, but smaller than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0041";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 0.0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4200
     * @tc.name    testLowerBoundSearch0042
     * @tc.desc    Testing lowerBoundSearch with key present multiple times
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0042";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 2.0, 2.0, 3.0];
        let result = lowerBoundSearch(arr, 2.0);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4300
     * @tc.name    testLowerBoundSearch0043
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0043";
      try {
        let arr: FixedArray<double> = [];
        let result = lowerBoundSearch(arr, 5.0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4400
     * @tc.name    testLowerBoundSearch0044
     * @tc.desc    Testing lowerBoundSearch with key present at the end of the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0044";
      try {
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 5.0);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4500
     * @tc.name    testLowerBoundSearch0045
     * @tc.desc    Testing lowerBoundSearch with key present in array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0045";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = lowerBoundSearch(arr, 3.3, 0, arr.length - 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4600
     * @tc.name    testLowerBoundSearch0046
     * @tc.desc    Testing lowerBoundSearch with key not present, but greater than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0046";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = lowerBoundSearch(arr, 3.5, 0, arr.length - 1);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4700
     * @tc.name    testLowerBoundSearch0047
     * @tc.desc    Testing lowerBoundSearch with key not present, but smaller than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0047";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = lowerBoundSearch(arr, 0.5, 0, arr.length - 1);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_4800
     * @tc.name    testLowerBoundSearch0048
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0048";
      try {
        let arr: FixedArray<double> = [];
        let result = lowerBoundSearch(arr, 1.0, 0, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5000
     * @tc.name    testLowerBoundSearch0050
     * @tc.desc    Testing lowerBoundSearch with normal value, element exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0050";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0 as float);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5100
     * @tc.name    testLowerBoundSearch0051
     * @tc.desc    Testing lowerBoundSearch with element not found, should return insertion point
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0051";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0 as float);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5200
     * @tc.name    testLowerBoundSearch0052
     * @tc.desc     Testing lowerBoundSearch when all elements are less than key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0052";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 6.0 as float);
        expect(result).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5300
     * @tc.name    testLowerBoundSearch0053
     * @tc.desc    Testing lowerBoundSearch when all elements are greater than key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0053";
      try {
        let arr: FixedArray<float> = [2.0, 3.0, 4.0, 5.0, 6.0];
        let result = lowerBoundSearch(arr, 1.0 as float);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5400
     * @tc.name    testLowerBoundSearch0054
     * @tc.desc    Testing lowerBoundSearch with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0054";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 2.0, 2.0, 3.0];
        let result = lowerBoundSearch(arr, 2.0 as float);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5500
     * @tc.name    testLowerBoundSearch0055
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0055";
      try {
        let arr: FixedArray<float> = [];
        let result = lowerBoundSearch(arr, 1.0 as float);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5600
     * @tc.name    testLowerBoundSearch0056
     * @tc.desc    Testing lowerBoundSearch with key at the end of array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0056";
      try {
        let arr: FixedArray<float> = [1.0, 3.0, 5.0, 7.0, 9.0];
        let result = lowerBoundSearch(arr, 9.0 as float);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_5700
     * @tc.name    testLowerBoundSearch0057
     * @tc.desc    Testing lowerBoundSearch with key at the start of array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0057";
      try {
        let arr: FixedArray<float> = [1.0, 3.0, 5.0, 7.0, 9.0];
        let result = lowerBoundSearch(arr, 1.0 as float);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6000
     * @tc.name    testLowerBoundSearch0060
     * @tc.desc    Testing lowerBoundSearch with normal value, key exists
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0060";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0, 0, arr.length);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6100
     * @tc.name    testLowerBoundSearch0061
     * @tc.desc    Testing lowerBoundSearch with key not found, return insertion point
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0061";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0, 0, arr.length);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6200
     * @tc.name    testLowerBoundSearch0062
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0062";
      try {
        let arr: FixedArray<number> = [];
        let result = lowerBoundSearch(arr, 3.0, 0, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6300
     * @tc.name    testLowerBoundSearch0063
     * @tc.desc    Testing lowerBoundSearch when all elements are less than key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0063";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 3.0];
        let result = lowerBoundSearch(arr, 4.0, 0, arr.length);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6400
     * @tc.name    testLowerBoundSearch0064
     * @tc.desc    Testing lowerBoundSearch when all elements are greater than key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0064";
      try {
        let arr: FixedArray<number> = [3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 2.0, 0, arr.length);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6500
     * @tc.name    testLowerBoundSearch0065
     * @tc.desc    Testing lowerBoundSearch with duplicate keys, return first occurrence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0065";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 2.0, 2.0, 3.0];
        let result = lowerBoundSearch(arr, 2.0, 0, arr.length);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6600
     * @tc.name    testLowerBoundSearch0066
     * @tc.desc    Testing lowerBoundSearch with custom startIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0066";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0, 2, arr.length);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6700
     * @tc.name    testLowerBoundSearch0067
     * @tc.desc    Testing lowerBoundSearch with custom endIndex
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0067";
      try {
        let arr: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
        let result = lowerBoundSearch(arr, 3.0, 0, 3);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6800
     * @tc.name    testLowerBoundSearch0068
     * @tc.desc    Test basic cases where the key exists in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0068";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 30 as int);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_6900
     * @tc.name    testLowerBoundSearch0069
     * @tc.desc    Test cases where the key does not exist in the array but there are larger elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0069";
      try {
        let arr: FixedArray<int> = [10, 20, 40, 50];
        let result = lowerBoundSearch(arr, 30 as int);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7000
     * @tc.name    testLowerBoundSearch0070
     * @tc.desc    Test cases where all elements are smaller than the key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0070";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 60 as int);
        expect(result).assertEqual(arr.length);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7100
     * @tc.name    testLowerBoundSearch0071
     * @tc.desc    Test cases where all elements are larger than the key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0071";
      try {
        let arr: FixedArray<int> = [20, 30, 40, 50, 60];
        let result = lowerBoundSearch(arr, 10 as int);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7200
     * @tc.name    testLowerBoundSearch0072
     * @tc.desc    Test cases with duplicate keys in the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0072";
      try {
        let arr: FixedArray<int> = [10, 20, 20, 20, 30];
        let result = lowerBoundSearch(arr, 20 as int);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7300
     * @tc.name    testLowerBoundSearch0073
     * @tc.desc    Test cases with an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0073";
      try {
        let arr: FixedArray<int> = [];
        let result = lowerBoundSearch(arr, 10 as int);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7400
     * @tc.name    testLowerBoundSearch0074
     * @tc.desc    Test cases where the key is at the start of the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0074";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 10 as int);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7500
     * @tc.name    testLowerBoundSearch0075
     * @tc.desc    Test cases where the key is at the end of the array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0075";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40, 50];
        let result = lowerBoundSearch(arr, 50 as int);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7600
     * @tc.name    testLowerBoundSearch0076
     * @tc.desc    Test arrays containing negative numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0076";
      try {
        let arr: FixedArray<int> = [-50, -30, 0, 20, 40];
        let result = lowerBoundSearch(arr, -10 as int);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7700
     * @tc.name    testLowerBoundSearch0077
     * @tc.desc    Test arrays containing large numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0077";
      try {
        let arr: FixedArray<int> = [1000000, 2000000, 3000000];
        let result = lowerBoundSearch(arr, 2500000 as int);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7800
     * @tc.name    testLowerBoundSearch0078
     * @tc.desc    Testing lowerBoundSearch with key present in array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0078";
      try {
        let arr: FixedArray<int> = [1, 3, 5, 7, 9];
        let result = lowerBoundSearch(arr, 5, 0, arr.length);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_7900
     * @tc.name    testLowerBoundSearch0079
     * @tc.desc    Testing lowerBoundSearch with key not present, should return insertion point
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0079";
      try {
        let arr: FixedArray<int> = [1, 3, 5, 7, 9];
        let result = lowerBoundSearch(arr, 6, 0, arr.length);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8000
     * @tc.name    testLowerBoundSearch0080
     * @tc.desc    Testing lowerBoundSearch with key smaller than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0080";
      try {
        let arr: FixedArray<int> = [3, 5, 7, 9, 11];
        let result = lowerBoundSearch(arr, 2, 0, arr.length);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8100
     * @tc.name    testLowerBoundSearch0081
     * @tc.desc    Testing lowerBoundSearch with key larger than all elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0081";
      try {
        let arr: FixedArray<int> = [3, 5, 7, 9, 11];
        let result = lowerBoundSearch(arr, 12, 0, arr.length);
        expect(result).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8200
     * @tc.name    testLowerBoundSearch0082
     * @tc.desc    Testing lowerBoundSearch with empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0082";
      try {
        let arr: FixedArray<int> = [];
        let result = lowerBoundSearch(arr, 5, 0, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8300
     * @tc.name    testLowerBoundSearch0083
     * @tc.desc    Testing lowerBoundSearch with key present multiple times, should return first occurrence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0083";
      try {
        let arr: FixedArray<int> = [1, 3, 3, 3, 5];
        let result = lowerBoundSearch(arr, 3, 0, arr.length);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8400
     * @tc.name    testLowerBoundSearch0084
     * @tc.desc    Testing lowerBoundSearch with search range within array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0084";
      try {
        let arr: FixedArray<int> = [1, 3, 5, 7, 9, 11];
        let result = lowerBoundSearch(arr, 7, 2, 5); // Search in [5, 7, 9]
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8500
     * @tc.name    testLowerBoundSearch0085
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0085";
      try {
        let arr: FixedArray<short> = [1, 3, 5, 7, 9];
        let index = lowerBoundSearch(arr, 5 as short);
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8600
     * @tc.name    testLowerBoundSearch0086
     * @tc.desc    Testing the key is the first element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0086";
      try {
        let arr: FixedArray<short> = [5, 10, 15];
        let index = lowerBoundSearch(arr, 5 as short)
        expect(index).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8700
     * @tc.name    testLowerBoundSearch0087
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0087";
      try {
        let arr: FixedArray<short> = [10];
        let index = lowerBoundSearch(arr, 10 as short);
        expect(index).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8800
     * @tc.name    testLowerBoundSearch0088
     * @tc.desc    Testing the key is the last element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0088";
      try {
        let arr: FixedArray<short> = [10, 20, 30];
        let index = lowerBoundSearch(arr, 30 as short)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_8900
     * @tc.name    testLowerBoundSearch0089
     * @tc.desc    Testing Type.of with null.(more than max)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0089";
      try {
        let arr: FixedArray<short> = [2, 4, 6, 8];
        let index = lowerBoundSearch(arr, 10 as short);
        expect(index).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9000
     * @tc.name    testLowerBoundSearch0090
     * @tc.desc    Testing Type.of with null.(repeat)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0090";
      try {
        let arr: FixedArray<short> = [10, 20, 20, 30];
        let index = lowerBoundSearch(arr, 20 as short);
        expect(index).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9100
     * @tc.name    testLowerBoundSearch0091
     * @tc.desc    Testing value parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0091";
      try {
        let arr: FixedArray<short> = [10, 20, 30, 40, 50];
        let index = lowerBoundSearch(arr, 30 as short, 2, 4)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9200
     * @tc.name    testLowerBoundSearch0092
     * @tc.desc    Testing invalid interval parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0092";
      try {
        let arr: FixedArray<short> = [10, 20];
        lowerBoundSearch(arr, 10 as short, 3, 1);
        expect().assertFail();
      } catch (err: RangeError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.message).assertEqual("lowerBoundSearch: bounds verification failed")
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9300
     * @tc.name    testLowerBoundSearch0093
     * @tc.desc    Testing Unsorted array scenario (although prohibited by the interface, the behavior needs to be verified)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0093";
      try {
        let arr: FixedArray<short> = [30, 10, 20];
        let index = lowerBoundSearch(arr, 15 as short);
        expect(index >= 0 && index <= arr.length).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err instanceof RangeError).assertFalse();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9400
     * @tc.name    testLowerBoundSearch0094
     * @tc.desc    Testing Handle boundary values for short type
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0094";
      try {
        let arr: FixedArray<short> = [-32768, 0, 32767];
        let index = lowerBoundSearch(arr, 32767 as short)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9500
     * @tc.name    testLowerBoundSearch0095
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0095";
      try {
        let arr: FixedArray<long> = [1, 3, 5, 7, 9];
        let index = lowerBoundSearch(arr, 5 as long);
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9600
     * @tc.name    testLowerBoundSearch0096
     * @tc.desc    Testing the key is the first element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0096";
      try {
        let arr: FixedArray<long> = [5, 10, 15];
        let index = lowerBoundSearch(arr, 5 as long)
        expect(index).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9700
     * @tc.name    testLowerBoundSearch0097
     * @tc.desc    Testing Type of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0097";
      try {
        let arr: FixedArray<long> = [10];
        let index = lowerBoundSearch(arr, 10 as long);
        expect(index).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9800
     * @tc.name    testLowerBoundSearch0098
     * @tc.desc    Testing the key is the last element.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0098";
      try {
        let arr: FixedArray<long> = [10, 20, 30];
        let index = lowerBoundSearch(arr, 30 as long)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_9900
     * @tc.name    testLowerBoundSearch0099
     * @tc.desc    Testing Type.of with null.(more than max)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0099";
      try {
        let arr: FixedArray<long> = [2, 4, 6, 8];
        let index = lowerBoundSearch(arr, 10 as long);
        expect(index).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1000_01
     * @tc.name    testLowerBoundSearch0100
     * @tc.desc    Testing Type.of with null.(repeat)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0100";
      try {
        let arr: FixedArray<long> = [10, 20, 20, 30];
        let index = lowerBoundSearch(arr, 20 as long);
        expect(index).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1010
     * @tc.name    testLowerBoundSearch0101
     * @tc.desc    Testing valid interval parameter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0101";
      try {
        let arr: FixedArray<long> = [10, 20, 30, 40, 50];
        let index = lowerBoundSearch(arr, 30 as long, 2, 4)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1020
     * @tc.name    testLowerBoundSearch0102
     * @tc.desc    Testing invalid interval parameter.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0102";
      try {
        let arr: FixedArray<long> = [10, 20];
        lowerBoundSearch(arr, 10 as long, 3, 1);
        expect().assertFail();
      } catch (err: RangeError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err.message).assertEqual("lowerBoundSearch: bounds verification failed")
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1030
     * @tc.name    testLowerBoundSearch1030
     * @tc.desc    Testing Unsorted array scenario. (although prohibited by the interface, the behavior needs to be verified)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch1030";
      try {
        let arr: FixedArray<long> = [30, 10, 20];
        let index = lowerBoundSearch(arr, 15 as long);
        expect(index >= 0 && index <= arr.length).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect(err instanceof RangeError).assertFalse();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_LOWERBOUNDSEARCH_1040
     * @tc.name    testLowerBoundSearch0104
     * @tc.desc    Testing Handle boundary values for short type.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testLowerBoundSearch0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testLowerBoundSearch0104";
      try {
        let arr: FixedArray<long> = [-9223372036854775808, 0, 9223372036854775807];
        let index = lowerBoundSearch(arr, 9223372036854775807 as long)
        expect(index).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}