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

export default function Array_05Test() {
  describe('Array_05Test', (): void => {
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
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0100
     * @tc.name    testSliceFunctionWithBooleanArray0001
     * @tc.desc    Testing slice function on FixedArray<boolean> with valid start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0001";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 2;
        const result = slice(array, start);
        const arr: FixedArray<boolean> = [true, false, true];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0200
     * @tc.name    testSliceFunctionWithBooleanArray0002
     * @tc.desc    Testing slice function on FixedArray<boolean> with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0002";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = -2;
        const result = slice(array, start);
        const arr: FixedArray<boolean> = [false, true];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0300
     * @tc.name    testSliceFunctionWithBooleanArray0003
     * @tc.desc    Testing slice function on FixedArray<boolean> with start index equal to array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0003";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = array.length;
        const result = slice(array, start);
        const expected: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0400
     * @tc.name    testSliceFunctionWithBooleanArray0004
     * @tc.desc    Testing slice function on FixedArray<boolean> with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0004";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = array.length + 1;
        const result = slice(array, start);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0500
     * @tc.name    testSliceFunctionWithBooleanArray0005
     * @tc.desc    Testing slice function on FixedArray<boolean> with valid start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0005";
      try {
        const array: FixedArray<boolean> = [];
        const start: int = 0;
        const result = slice(array, start);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0600
     * @tc.name    testSliceFunctionWithBooleanArray0006
     * @tc.desc    Test basic slicing functionality
     * @tc.size: SmallTest
     * @tc.type    Function
     * @tc.level: Level 1
     */
    it('testSliceFunctionWithBooleanArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0006";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [false, true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0700
     * @tc.name    testSliceFunctionWithBooleanArray0007
     * @tc.desc    Testing slice function on FixedArray<boolean> with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0007";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = -3;
        const end: int = 4;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0800
     * @tc.name    testSliceFunctionWithBooleanArray0008
     * @tc.desc    Testing slice function on FixedArray<boolean> with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0008";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<boolean> = [false, true, false];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_0900
     * @tc.name    testSliceFunctionWithBooleanArray0009
     * @tc.desc    Testing slice function on FixedArray<boolean> with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0009";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [true, false, true];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1000
     * @tc.name    testSliceFunctionWithBooleanArray0010
     * @tc.desc    Testing slice function on FixedArray<boolean> with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0010";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 8;
        const end: int = 2;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1100
     * @tc.name    testSliceFunctionWithBooleanArray0011
     * @tc.desc    Testing slice function on FixedArray<boolean> with negative start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0011";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = -3;
        const end: int = -1;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1200
     * @tc.name    testSliceFunctionWithBooleanArray0012
     * @tc.desc    Testing slice function on FixedArray<boolean> with start and end index equal to array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0012";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = array.length;
        const end: int = array.length;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString()); // Expected output: []
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1300
     * @tc.name    testSliceFunctionWithBooleanArray0013
     * @tc.desc    Testing slice function on FixedArray<boolean> with start and end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testSliceFunctionWithBooleanArray0013";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = array.length + 1;
        const end: int = array.length + 3;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1400
     * @tc.name    testSliceFunctionWithByteArray0014
     * @tc.desc    Testing slice function on an empty FixedArray<byte>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0014";
      try {
        const array: FixedArray<boolean> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1500
     * @tc.name    testSliceFunctionWithBooleanArray0015
     * @tc.desc    Testing slice function with valid start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0015";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [false, true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1600
     * @tc.name    testSliceFunctionWithBooleanArray0016
     * @tc.desc    Testing slice function with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0016";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = -3;
        const end: int = 4;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1700
     * @tc.name    testSliceFunctionWithBooleanArray0017
     * @tc.desc    Testing slice function with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0017";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [false, true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1800
     * @tc.name    testSliceFunctionWithBooleanArray0018
     * @tc.desc    Testing slice function with negative start and end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0018";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = -4;
        const end: int = -1;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [false, true, false];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_1900
     * @tc.name    testSliceFunctionWithBooleanArray0019
     * @tc.desc    Testing slice function with start index equal to end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0019";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 2;
        const end: int = 2;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2000
     * @tc.name    testSliceFunctionWithBooleanArray0020
     * @tc.desc    Testing slice function with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0020";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const expected: FixedArray<boolean> = [true, false, true];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2100
     * @tc.name    testSliceFunctionWithBooleanArray0021
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0021";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = 8;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2200
     * @tc.name    testSliceFunctionWithBooleanArray0022
     * @tc.desc    Testing slice function with start and end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0022";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const start: int = array.length + 1;
        const end: int = array.length + 3;
        const result = slice(array, start, end);
        const arr: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(arr.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2300
     * @tc.name    testSliceFunctionWithBooleanArray0023
     * @tc.desc    Testing slice function with start and end as default.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0023";
      try {
        const array: FixedArray<boolean> = [true, false, true, false, true];
        const result = slice(array); //start,endΪĬ  ֵ
        const expected: FixedArray<boolean> = [true, false, true, false, true];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2400
     * @tc.name    testSliceFunctionWithBooleanArray0024
     * @tc.desc    Testing slice function on an empty FixedArray<boolean>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0024";
      try {
        const array: FixedArray<boolean> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<boolean> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2500
     * @tc.name    testSliceFunctionWithBooleanArray0025
     * @tc.desc    Testing slice function on FixedArray<byte> with valid start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithBooleanArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithBooleanArray0025";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 2;
        const result = slice(array, start);
        const expected: FixedArray<byte> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2600
     * @tc.name    testSliceFunctionWithByteArray0026
     * @tc.desc    Testing slice function on FixedArray<byte> with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0026";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = -2;
        const result = slice(array, start);
        const expected: FixedArray<byte> = [4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2700
     * @tc.name    testSliceFunctionWithByteArray0027
     * @tc.desc    Testing slice function on FixedArray<byte> with start index equal to array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0027";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = array.length;
        const result = slice(array, start);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2800
     * @tc.name    testSliceFunctionWithByteArray0028
     * @tc.desc    Testing slice function on FixedArray<byte> with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0028";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = array.length + 1;
        const result = slice(array, start);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_2900
     * @tc.name    testSliceFunctionWithByteArray0029
     * @tc.desc    Testing slice function on empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0029";
      try {
        const array: FixedArray<byte> = [];
        const start: int = 0;
        const result = slice(array, start);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3000
     * @tc.name    testSliceFunctionWithByteArray0030
     * @tc.desc    Testing slice function on FixedArray<byte> with valid start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0030";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3100
     * @tc.name    testSliceFunctionWithByteArray0031
     * @tc.desc    Testing slice function on FixedArray<byte> with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0031";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = -3;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3200
     * @tc.name    testSliceFunctionWithByteArray0032
     * @tc.desc    Testing slice function on FixedArray<byte> with negative start and end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0032";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = -3;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3300
     * @tc.name    testSliceFunctionWithByteArray0033
     * @tc.desc    Testing slice function on FixedArray<byte> with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0033";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3400
     * @tc.name    testSliceFunctionWithByteArray0034
     * @tc.desc    Testing slice function on FixedArray<byte> with start index equal to end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0034";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = array.length;
        const end: int = array.length;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3500
     * @tc.name    testSliceFunctionWithByteArray0035
     * @tc.desc    Testing slice function on FixedArray<byte> with start and end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0035";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = array.length + 1;
        const end: int = array.length + 3;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3600
     * @tc.name    testSliceFunctionWithByteArray0036
     * @tc.desc    Testing slice function on FixedArray<byte> with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0036";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3700
     * @tc.name    testSliceFunctionWithByteArray0037
     * @tc.desc    Testing slice function on FixedArray<byte> with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0037";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 9;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3800
     * @tc.name    testSliceFunctionWithByteArray0038
     * @tc.desc    Testing slice function on FixedArray<byte> with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0038";
      try {
        const array: FixedArray<byte> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_3900
     * @tc.name    testSliceFunctionWithByteArray0039
     * @tc.desc    Testing slice function with valid start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0039";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4000
     * @tc.name    testSliceFunctionWithByteArray0040
     * @tc.desc    Testing slice function with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0040";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = -3;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4100
     * @tc.name    testSliceFunctionWithByteArray0041
     * @tc.desc    Testing slice function with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0041";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [2, 3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4200
     * @tc.name    testSliceFunctionWithByteArray0042
     * @tc.desc    Testing slice function with negative start index and negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0042";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = -3;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4300
     * @tc.name    testSliceFunctionWithByteArray0043
     * @tc.desc    Testing slice function with start index equal to end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0043";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 2;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4400
     * @tc.name    testSliceFunctionWithByteArray0044
     * @tc.desc    Testing slice function with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0044";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4500
     * @tc.name    testSliceFunctionWithByteArray0045
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0045";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = 9;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4600
     * @tc.name    testSliceFunctionWithByteArray0046
     * @tc.desc    Testing slice function with end and start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0046";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const start: int = array.length + 1;
        const end: int = array.length + 3;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4700
     * @tc.name    testSliceFunctionWithByteArray0047
     * @tc.desc    Testing slice function on an empty FixedArray<byte>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0047";
      try {
        const array: FixedArray<byte> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<byte> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_4800
     * @tc.name    testSliceFunctionWithByteArray0048
     * @tc.desc    Testing slice function with start and end as default.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithByteArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithByteArray0048";
      try {
        const array: FixedArray<byte> = [1, 2, 3, 4, 5];
        const result = slice(array); //start,endΪĬ  ֵ
        const expected: FixedArray<byte> = [1, 2, 3, 4, 5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_5300
     * @tc.name    testSliceFunctionWithCharArray0053
     * @tc.desc    Testing slice function on an empty FixedArray<char>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithCharArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithCharArray0053";
      try {
        const array: FixedArray<char> = [];
        const start: int = 0;
        const result = slice(array, start);
        const expected: FixedArray<char> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_6200
     * @tc.name    testSliceFunctionWithEmptyArray0062
     * @tc.desc    Testing slice function on an empty FixedArray<char>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEmptyArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEmptyArray0062";
      try {
        const array: FixedArray<char> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<char> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7200
     * @tc.name    testSliceFunctionWithEmptyArray0072
     * @tc.desc    Testing slice function on an empty FixedArray<char>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEmptyArray0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEmptyArray0072";
      try {
        const array: FixedArray<char> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<char> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7300
     * @tc.name    testSliceFunctionWithNormalStart0073
     * @tc.desc    Testing slice function with valid start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNormalStart0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNormalStart0073";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 2;
        const result = slice(array, start);
        const expected: FixedArray<double> = [3.3, 4.4, 5.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7400
     * @tc.name    testSliceFunctionWithNegativeStart0074
     * @tc.desc    Testing slice function with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeStart0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeStart0074";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = -3;
        const result = slice(array, start);
        const expected: FixedArray<double> = [3.3, 4.4, 5.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7500
     * @tc.name    testSliceFunctionWithStartEqualsLength0075
     * @tc.desc    Testing slice function with start index equal to array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartEqualsLength0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartEqualsLength0075";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = array.length;
        const result = slice(array, start);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7600
     * @tc.name    testSliceFunctionWithStartOutOfBounds0076
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartOutOfBounds0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartOutOfBounds0076";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = array.length + 1;
        const result = slice(array, start);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7700
     * @tc.name    testSliceFunctionWithEmptyArray0077
     * @tc.desc    Testing slice function on an empty FixedArray<double>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEmptyArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEmptyArray0077";
      try {
        const array: FixedArray<double> = [];
        const start: int = 0;
        const result = slice(array, start);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7800
     * @tc.name    testSliceFunctionWithNormalRange0078
     * @tc.desc    Testing slice function with valid start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNormalRange0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNormalRange0078";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_7900
     * @tc.name    testSliceFunctionWithNegativeStart0079
     * @tc.desc    Testing slice function with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeStart0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeStart0079";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = -4;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8000
     * @tc.name    testSliceFunctionWithNegativeEnd0080
     * @tc.desc    Testing slice function with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeEnd0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeEnd0080";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8100
     * @tc.name    testSliceFunctionWithStartEqualsEnd0081
     * @tc.desc    Testing slice function with start index equal to end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartEqualsEnd0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartEqualsEnd0081";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 2;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8200
     * @tc.name    testSliceFunctionWithStartOutOfBounds0082
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartOutOfBounds0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartOutOfBounds0082";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 10;
        const end: int = 12;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8300
     * @tc.name    testSliceFunctionWithEndOutOfBounds0083
     * @tc.desc    Testing slice function with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEndOutOfBounds0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEndOutOfBounds0083";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [3.3, 4.4, 5.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8400
     * @tc.name    testSliceFunctionWithEndOutOfBounds0084
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEndOutOfBounds0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEndOutOfBounds0084";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 10;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8500
     * @tc.name    testSliceFunctionWithEmptyArray0085
     * @tc.desc    Testing slice function on an empty FixedArray<double>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEmptyArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEmptyArray0085";
      try {
        const array: FixedArray<double> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8600
     * @tc.name    testSliceFunctionWithNormalRange0086
     * @tc.desc    Testing slice function with valid start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNormalRange0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNormalRange0086";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 1;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8700
     * @tc.name    testSliceFunctionWithDefaultParams0087
     * @tc.desc    Testing slice function with default start and end indices.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithDefaultParams0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithDefaultParams0087";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const result = slice(array); //start,endΪĬ  ֵ
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8800
     * @tc.name    testSliceFunctionWithNegativeStart0088
     * @tc.desc    Testing slice function with negative start index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeStart0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeStart0088";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = -3;
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_8900
     * @tc.name    testSliceFunctionWithNegativeStart0089
     * @tc.desc    Testing slice function with negative start and end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeStart0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeStart0089";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = -3;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9000
     * @tc.name    testSliceFunctionWithNegativeEnd0090
     * @tc.desc    Testing slice function with negative end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithNegativeEnd0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithNegativeEnd0090";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 1;
        const end: int = -1;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9100
     * @tc.name    testSliceFunctionWithStartEqualsEnd0091
     * @tc.desc    Testing slice function with start index equal to end index.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartEqualsEnd0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartEqualsEnd0091";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 2;
        const end: int = 2;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9200
     * @tc.name    testSliceFunctionWithStartOutOfBounds0092
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithStartOutOfBounds0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithStartOutOfBounds0092";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 10;
        const end: int = 12;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9300
     * @tc.name    testSliceFunctionWithEndOutOfBounds0093
     * @tc.desc    Testing slice function with end index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEndOutOfBounds0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEndOutOfBounds0093";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 2;
        const end: int = 10;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [3.3, 4.4, 5.5];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9400
     * @tc.name    testSliceFunctionWithEndOutOfBounds0094
     * @tc.desc    Testing slice function with start index greater than array length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEndOutOfBounds0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEndOutOfBounds0094";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 15;
        const end: int = 3;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9500
     * @tc.name    testSliceFunctionWithEmptyArray0095
     * @tc.desc    Testing slice function on an empty FixedArray<double>.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithEmptyArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithEmptyArray0095";
      try {
        const array: FixedArray<double> = [];
        const start: int = 0;
        const end: int = 0;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9600
     * @tc.name    testSliceFunctionWithInvalidNegativeStart0096
     * @tc.desc    Testing slice function with negative start index out of range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithInvalidNegativeStart0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithInvalidNegativeStart0096";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = -10; //      ҳ     Χ
        const end: int = 4;
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMON_LIBRARY_UTIL_BASE_SLICE_9700
     * @tc.name    testSliceFunctionWithInvalidNegativeEnd0097
     * @tc.desc    Testing slice function with negative end index out of range.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSliceFunctionWithInvalidNegativeEnd0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testSliceFunctionWithInvalidNegativeEnd0097";
      try {
        const array: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const start: int = 1;
        const end: int = -10; //
        const result = slice(array, start, end);
        const expected: FixedArray<double> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

  });
}