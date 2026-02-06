/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BuiltinArrayFindIndexTest() {
  describe("BuiltinArrayFindIndexTest", (): void => {
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
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_001
     * @tc.name   testBuiltinArrayFindIndex10001
     * @tc.desc   Test basic functionality of findIndex method (find first true value)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10001";
      try {
        const arr: FixedArray<boolean> = [false, false, true, false, true];
        const index = findIndex(arr, (v: boolean) => v === true);
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_002
     * @tc.name   testBuiltinArrayFindIndex10002
     * @tc.desc   Test findIndex method when no match is found
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10002";
      try {
        const arr: FixedArray<boolean> = [false, false, false];
        const index = findIndex(arr, (v: boolean) => v === true);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_004
     * @tc.name   testBuiltinArrayFindIndex10004
     * @tc.desc   Test findIndex method matching the first element
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10004";
      try {
        const arr: FixedArray<boolean> = [true, false, false];
        const index = findIndex(arr, (v: boolean) => v === true);
        expect(index).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_005
     * @tc.name   testBuiltinArrayFindIndex10005
     * @tc.desc   Test findIndex method matching the last element
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10005";
      try {
        const arr: FixedArray<boolean> = [false, false, true];
        const index = findIndex(arr, (v: boolean) => v === true);
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_006
     * @tc.name   testBuiltinArrayFindIndex10006
     * @tc.desc   Test findIndex method handling empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10006";
      try {
        const emptyArr: FixedArray<boolean> = [];
        const index = findIndex(emptyArr, (v: boolean) => v === true);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_007
     * @tc.name   testBuiltinArrayFindIndex10007
     * @tc.desc   Test findIndex method with complex condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10007";
      try {
        const arr: FixedArray<boolean> = [false, true, false, true, false];
        let count = 0;
        const index = findIndex(arr, (v: boolean) => {
          if (v === true) {
            count++;
            return count === 2;
          }
          return false;
        });
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_008
     * @tc.name   testBuiltinArrayFindIndex10008
     * @tc.desc   Test findIndex method with complex condition (finding the Nth match)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10008";
      try {
        const arr: FixedArray<boolean> = [false, true, false, true, false];
        let count = 0;
        const secondTrueIndex = findIndex(arr, (v: boolean) => {
          if (v === true) {
            return ++count === 2;
          }
          return false;
        });
        expect(secondTrueIndex).assertEqual(3);
        count = 0;
        const notFoundIndex = findIndex(arr, (v: boolean) => {
          if (v === true) {
            return ++count === 3;
          }
          return false;
        });
        expect(notFoundIndex).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BOOLEAN_ARRAY_009
     * @tc.name   testBuiltinArrayFindIndex10009
     * @tc.desc   Test early exit behavior in complex conditions
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10009";
      try {
        const arr: FixedArray<boolean> = [false, true, false, true, false];
        let operations = 0;
        const index = findIndex(arr, (v: boolean) => {
          operations++;
          return v === true;
        });
        expect(index).assertEqual(1);
        expect(operations).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BYTE_ARRAY_001
     * @tc.name   testBuiltinArrayFindIndex10012
     * @tc.desc   Test basic functionality of findIndex (find specific byte value)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10012";
      try {
        const arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04];
        const index = findIndex(arr, (v: byte) => v === 0x03 as byte);
        expect(index).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BYTE_ARRAY_002
     * @tc.name   testBuiltinArrayFindIndex10013
     * @tc.desc   Test findIndex when no match is found
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10013";
      try {
        const arr: FixedArray<byte> = [0x10, 0x20, 0x30];
        const index = findIndex(arr, (v: byte) => v === 0x40 as byte);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BYTE_ARRAY_005
     * @tc.name   testBuiltinArrayFindIndex10015
     * @tc.desc   Test findIndex matching the last element
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10015";
      try {
        const arr: FixedArray<byte> = [0x11, 0x22, 0x33, 0x44];
        const index = findIndex(arr, (v: byte) => v === 0x44 as byte);
        expect(index).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_BYTE_ARRAY_006
     * @tc.name   testBuiltinArrayFindIndex10016
     * @tc.desc   Test findIndex handling empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex10016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex10016";
      try {
        const emptyArr: FixedArray<byte> = [];
        const index = findIndex(emptyArr, (v: byte) => v === 0x00 as byte);
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FIND_INDEX_CHAR_ARRAY_006
     * @tc.name   testBuiltinArrayFindIndex20006
     * @tc.desc   Test findIndex handling empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindIndex20006";
      try {
        const emptyArr: FixedArray<char> = new FixedArray<char>(0);
        const index = findIndex(emptyArr, (v: char) => v === 'a'.charCodeAt(0));
        expect(index).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0200
     * @tc.name   testBuiltinArrayCopyWithin20017
     * @tc.desc   Testing copyWithin with negative target index (should count from end)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin20017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, -2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(1);
        expect(result[4]).assertEqual(2);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0300
     * @tc.name   testBuiltinArrayCopyWithin30017
     * @tc.desc   Testing copyWithin with target greater than array length (no copy should occur)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin30017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, 10);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0400
     * @tc.name   testBuiltinArrayCopyWithin40017
     * @tc.desc   Testing copyWithin on empty array (should return same empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin40017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin40017";
      try {
        let arr: FixedArray<number> = [];
        let result = copyWithin(arr, 0);
        expect(result.length).assertEqual(0);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0500
     * @tc.name   testBuiltinArrayCopyWithin50017
     * @tc.desc   Testing copyWithin with target 0 (should copy to beginning)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin50017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin50017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, 0);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0600
     * @tc.name   testBuiltinArrayCopyWithin60017
     * @tc.desc   Testing copyWithin on single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin60017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin60017";
      try {
        let arr: FixedArray<number> = [42];
        let result = copyWithin(arr, 0);
        expect(result[0]).assertEqual(42);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0700
     * @tc.name   testBuiltinArrayCopyWithin70017
     * @tc.desc   Testing copyWithin with target at array end (no copy should occur)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin70017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin70017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, arr.length);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0800
     * @tc.name   testBuiltinArrayCopyWithin80017
     * @tc.desc   Testing copyWithin with target one less than length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin80017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin80017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, arr.length - 1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(1);
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_0900
     * @tc.name   testBuiltinArrayCopyWithin90017
     * @tc.desc   Testing that copyWithin modifies original array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin90017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin90017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let originalRef = arr;
        let result = copyWithin(arr, 2);
        expect(originalRef[2]).assertEqual(1);
        expect(originalRef[3]).assertEqual(2);
        expect(originalRef[4]).assertEqual(3);
        expect(arr === originalRef).assertTrue();
        expect(result === originalRef).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_COPYWITHIN_1000
     * @tc.name   testBuiltinArrayCopyWithin100017
     * @tc.desc   Testing copyWithin with NaN values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayCopyWithin100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin100017";
      try {
        let arr: FixedArray<number> = [1, NaN, 3, 4, 5];
        let result = copyWithin(arr, 3);
        expect(result[0]).assertEqual(1);
        expect(isNaN(result[1] as number)).assertTrue();
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(1);
        expect(isNaN(result[4] as number)).assertTrue();
        expect(arr === result).assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_CONCAT_0100
     * @tc.name   testBuiltinArrayconcat6001
     * @tc.desc   Test basic concatenation of two FixedArray<double> with positive numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayconcat6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat6001";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0];
        const arr2: FixedArray<double> = [3.0, 4.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1.0);
        expect(result[3]).assertEqual(4.0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_CONCAT_0200
     * @tc.name   testBuiltinArrayconcat6002
     * @tc.desc   Test concatenation with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayconcat6002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat6002";
      try {
        const arr1: FixedArray<double> = [];
        const arr2: FixedArray<double> = [1.5, 2.5];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[1]).assertEqual(2.5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_CONCAT_300
     * @tc.name   testBuiltinArrayconcat6003
     * @tc.desc   Test concatenation of multiple arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayconcat6003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat6003";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_CONCAT_400
     * @tc.name   testBuiltinArrayconcat6004
     * @tc.desc   Test concatenation with negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayconcat6004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat6004";
      try {
        const arr1: FixedArray<double> = [-1.5];
        const arr2: FixedArray<double> = [-2.5];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[1]).assertEqual(-2.5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_CONCAT_500
     * @tc.name   testBuiltinArrayconcat6005
     * @tc.desc   Test concatenation preserves original array order
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayconcat6005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat6005";
      try {
        const arr1: FixedArray<double> = [1.1, 2.2];
        const arr2: FixedArray<double> = [3.3, 4.4];
        const result = concat(arr1, arr2);
        expect(result[0]).assertEqual(1.1);
        expect(result[1]).assertEqual(2.2);
        expect(result[2]).assertEqual(3.3);
        expect(result[3]).assertEqual(4.4);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_DOUBLE_1000
     * @tc.name   testFindIndexDoubleBasic0010
     * @tc.desc   Test basic findIndex operation with double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexDoubleBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexDoubleBasic0010";
      try {
        const arr: FixedArray<double> = [1.2, 2.3, 3.4, 4.5] as FixedArray<double>;
        const idx = findIndex(arr, (v: double) => v > 3.0);
        expect(idx).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_DOUBLE_3000
     * @tc.name   testFindIndexDoubleNotFound0030
     * @tc.desc   Test findIndex when no element satisfies predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexDoubleNotFound0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexDoubleNotFound0030";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        const idx = findIndex(arr, (v: double) => v > 10.0);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_DOUBLE_4000
     * @tc.name   testFindIndexDoubleEdgeCase0040
     * @tc.desc   Test edge case with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexDoubleEdgeCase0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexDoubleEdgeCase0040";
      try {
        const arr: FixedArray<double> = [42.0] as FixedArray<double>;
        const idx = findIndex(arr, (v: double) => v === 42.0);
        expect(idx).assertEqual(0);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_DOUBLE_5000
     * @tc.name   testFindIndexDoubleEmpty0050
     * @tc.desc   Test findIndex on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexDoubleEmpty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexDoubleEmpty0050";
      try {
        const arr: FixedArray<double> = [] as FixedArray<double>;
        const idx = findIndex(arr, () => true);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_1000
     * @tc.name   testBuiltinArrayFindIndex0010
     * @tc.desc   Test basic findIndex operation within FixedArray<float>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindIndex0010";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f] as FixedArray<float>;
        const result = findIndex(floatArray, (elem) => elem > 3.0);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_0200
     * @tc.name   testBuiltinArrayFindIndex0002
     * @tc.desc   Test findIndex with empty array and no matching elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindIndex0002";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        const result1 = findIndex(emptyArray, (elem) => elem > 0);
        expect(result1).assertEqual(-1);
        const noMatchArray: FixedArray<float> = [1.1f, 2.2f] as FixedArray<float>;
        const result2 = findIndex(noMatchArray, (elem) => elem > 5.0);
        expect(result2).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_FLOAT_1000
     * @tc.name   testFindIndexFloatBasic0010
     * @tc.desc   Test basic findIndex operation (value exists)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexFloatBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexFloatBasic0010";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f] as FixedArray<float>;
        const idx = findIndex(floatArray, (v: float) => v > 3.0);
        expect(idx).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_FLOAT_2000
     * @tc.name   testFindIndexFloatNotFound0020
     * @tc.desc   Test findIndex when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexFloatNotFound0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexFloatNotFound0020";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f] as FixedArray<float>;
        const idx = findIndex(floatArray, (v: float) => v > 5.0);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_FLOAT_3000
     * @tc.name   testFindIndexFloatEmpty0030
     * @tc.desc   Test findIndex on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexFloatEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexFloatEmpty0030";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        const idx = findIndex(emptyArray, () => true);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_1000_01
     * @tc.name   testFindIndexIntBasic0010_01
     * @tc.desc   Test basic findIndex operation with integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntBasic0010_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntBasic0010_01";
      try {
        const intArray: FixedArray<int> = [5, 8, 13, 21] as FixedArray<int>;
        const idx = findIndex(intArray, (value: int) => value === 13);
        expect(idx).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_3000
     * @tc.name   testFindIndexIntNotFound0030
     * @tc.desc   Test findIndex on empty array (returns -1)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntNotFound0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntNotFound0030";
      try {
        const emptyArray: FixedArray<int> = [] as FixedArray<int>;
        const idx = findIndex(emptyArray, () => true);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_4000_01
     * @tc.name   testFindIndexIntEdgeCases0040
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntEdgeCases0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntEdgeCases0040";
      try {
        const singleArray: FixedArray<int> = [42] as FixedArray<int>;
        const idx = findIndex(singleArray, (value: int) => value === 42);
        expect(idx).assertEqual(0);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_5000
     * @tc.name   testFindIndexIntAllProcessed0050
     * @tc.desc   Test when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntAllProcessed0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntAllProcessed0050";
      try {
        const intArray: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        const idx = findIndex(intArray, (value: int) => value > 10);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_1000
     * @tc.name   testFindIndexIntBasic0010_02
     * @tc.desc   Test basic usage: find first positive number
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntBasic0010_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntBasic0010_02";
      try {
        const intArray: FixedArray<int> = [-3, -1, 4, 7] as FixedArray<int>;
        const idx = findIndex(intArray, (v: int) => v > 0);
        expect(idx).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_INT_2000
     * @tc.name   testFindIndexIntNotFound0020
     * @tc.desc   Test when no element satisfies predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexIntNotFound0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexIntNotFound0020";
      try {
        const intArray: FixedArray<int> = [1, 3, 5] as FixedArray<int>;
        const idx = findIndex(intArray, (v: int) => v % 2 === 0);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_LONG_1000
     * @tc.name   testFindIndexLongBasic0010
     * @tc.desc   Test basic findIndex operation with long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexLongBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexLongBasic0010";
      try {
        const longArray: FixedArray<long> = [10, 20, 30] as FixedArray<long>;
        const idx = findIndex(longArray, (value: long) => value === 20);
        expect(idx).assertEqual(1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_LONG_3000
     * @tc.name   testFindIndexLongEmpty0030
     * @tc.desc   Test findIndex on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexLongEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexLongEmpty0030";
      try {
        const emptyArray: FixedArray<long> = [] as FixedArray<long>;
        const idx = findIndex(emptyArray, () => true);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_LONG_4000
     * @tc.name   testFindIndexLongEdgeCases0040
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexLongEdgeCases0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexLongEdgeCases0040";
      try {
        const singleArray: FixedArray<long> = [42] as FixedArray<long>;
        const idx = findIndex(singleArray, (value: long) => value === 42);
        expect(idx).assertEqual(0);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_LONG_5000
     * @tc.name   testFindIndexLongNotFound0050
     * @tc.desc   Test when no element matches the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexLongNotFound0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexLongNotFound0050";
      try {
        const longArray: FixedArray<long> = [1, 2, 3] as FixedArray<long>;
        const idx = findIndex(longArray, (value: long) => value === 99);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_SHORT_1000
     * @tc.name   testFindIndexBasic0010
     * @tc.desc   Test basic findIndex operation with short array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexBasic0010";
      try {
        const shortArray: FixedArray<short> = [1, 3, 5, 7] as FixedArray<short>;
        const idx = findIndex(shortArray, (value: short) => value === 5);
        expect(idx).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_SHORT_3000
     * @tc.name   testFindIndexNotFound0030
     * @tc.desc   Test findIndex when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexNotFound0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexNotFound0030";
      try {
        const shortArray: FixedArray<short> = [1, 2, 3] as FixedArray<short>;
        const idx = findIndex(shortArray, (value: short) => value > 10);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_SHORT_4000
     * @tc.name   testFindIndexEmpty0040
     * @tc.desc   Test findIndex on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexEmpty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexEmpty0040";
      try {
        const emptyArray: FixedArray<short> = [] as FixedArray<short>;
        const idx = findIndex(emptyArray, () => true);
        expect(idx).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDINDEX_SHORT_5000
     * @tc.name   testFindIndexEdgeSingle0050
     * @tc.desc   Test edge case with single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindIndexEdgeSingle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindIndexEdgeSingle0050";
      try {
        const singleArray: FixedArray<short> = [42] as FixedArray<short>;
        const idx = findIndex(singleArray, (value: short) => value === 42);
        expect(idx).assertEqual(0);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}