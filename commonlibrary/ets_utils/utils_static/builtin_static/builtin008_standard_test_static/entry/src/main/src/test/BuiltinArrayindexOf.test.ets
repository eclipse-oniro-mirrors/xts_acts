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

export default function BuiltinArrayindexOfTest() {
  describe("BuiltinArrayindexOfTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEXOF_0015
     * @tc.name   testBuiltinArrayindexOf0015
     * @tc.desc   Testing indexOf with existing value at start position
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayindexOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayindexOf0015";
      try {
        const testArray = [5 as short, 10 as short, 15 as short, 20 as short] as FixedArray<short>;
        const result = indexOf(testArray, 5 as short, 0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEXOF_0016
     * @tc.name   testBuiltinArrayindexOf0016
     * @tc.desc   Testing indexOf with non-existing value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayindexOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayindexOf0016";
      try {
        const testArray = [5 as short, 10 as short, 15 as short, 20 as short] as FixedArray<short>;
        const result = indexOf(testArray, 25 as short, 0);
        expect(result).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0101
     * @tc.name   testBuiltinArrayFind40002
     * @tc.desc   Test returning undefined when no match is found
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40002";
      try {
        const arr: FixedArray<float> = [1.1f, 2.2f, 3.3f];
        const result = find(arr, (val) => val > 5);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0102
     * @tc.name   testBuiltinArrayFind40003
     * @tc.desc   Test returning undefined for empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40003";
      try {
        const arr: FixedArray<float> = [];
        const result = find(arr, () => true);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0103
     * @tc.name   testBuiltinArrayFind40004
     * @tc.desc   Test terminating traversal immediately after finding a match
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40004";
      try {
        const arr: FixedArray<float> = [1.0f, 2.0f, 3.0f, 4.0f];
        let callCount = 0;
        const result = find(arr, (val) => {
          callCount++;
          return val === 2.0;
        });
        expect(result).assertEqual(2.0);
        expect(callCount).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0500
     * @tc.name   testBuiltinArrayFind40005
     * @tc.desc   Test sparse float array scenario
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40005";
      try {
        const arr: FixedArray<float> = [1.0f, 2.0f, 3.0f, 4.0f];
        let callCount = 0;
        const result = find(arr, (val) => {
          callCount++;
          return val === 2.0;
        });
        expect(result).assertEqual(2.0);
        expect(callCount).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0100
     * @tc.name   testBuiltinArrayFindInt50001
     * @tc.desc   Test basic find functionality (finding matching element)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50001";
      try {
        const arr: FixedArray<int> = [10, 20, 30];
        const result = find(arr, (val) => val === 20);
        expect(result).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0200
     * @tc.name   testBuiltinArrayFindInt50002
     * @tc.desc   Test integer find with index condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50002";
      try {
        const arr: FixedArray<int> = [100, 200, 300];
        const result = find(arr, (val, idx) => idx === 2 && val === 300);
        expect(result).assertEqual(300);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0300
     * @tc.name   testBuiltinArrayFindInt50003
     * @tc.desc   Test case when no matching integer is found
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50003";
      try {
        const arr: FixedArray<int> = [5, 10, 15];
        const result = find(arr, (val) => val === 20);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0400
     * @tc.name   testBuiltinArrayFindInt50004
     * @tc.desc   Test empty array scenario
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50004";
      try {
        const arr: FixedArray<int> = [];
        const result = find(arr, (val) => val === 10);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0500
     * @tc.name   testBuiltinArrayFindInt50005
     * @tc.desc   Test using full parameters (value, index, array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50005";
      try {
        const arr: FixedArray<int> = [50, 60, 70];
        const result = find(arr, (val, idx, array) =>
        val === 60 && idx === 1 && array.length === 3
        );
        expect(result).assertEqual(60);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0600
     * @tc.name   testBuiltinArrayFindInt50006
     * @tc.desc   Test terminating traversal immediately after finding a match
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50006";
      try {
        const arr: FixedArray<int> = [1, 2, 3, 4];
        let callCount = 0;
        const result = find(arr, (val) => {
          callCount++;
          return val === 2;
        });
        expect(result).assertEqual(2);
        expect(callCount).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0700
     * @tc.name   testBuiltinArrayFindInt50007
     * @tc.desc   Test negative number search
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50007";
      try {
        const arr: FixedArray<int> = [-10, -20, -30];
        expect(find(arr, (val) => val === -20)).assertEqual(-20);
        expect(find(arr, (val) => val === -5)).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_0800
     * @tc.name   testBuiltinArrayFindInt50008
     * @tc.desc   Test integer boundary value search
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50008";
      try {
        const arr: FixedArray<int> = [2147483647, -2147483648, 0];
        expect(find(arr, (v) => v === 2147483647)).assertEqual(2147483647);
        expect(find(arr, (v) => v === -2147483648)).assertEqual(-2147483648);
        expect(find(arr, (v) => v === 0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_INT_1000
     * @tc.name   testBuiltinArrayFindInt50010
     * @tc.desc   Test callback function throwing exception
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindInt50010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindInt50010";
      let hasThrown = false;
      try {
        const arr: FixedArray<int> = [10, 20, 30];
        find(arr, (val, idx) => {
          if (idx === 1) {
            throw new Error("Callback error");
          }
          return val === 20;
        });
      } catch (e) {
        hasThrown = true;
        expect((e as Error).message).assertEqual("Callback error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0100
     * @tc.name   testBuiltinArrayFindShort70001
     * @tc.desc   Test basic search functionality (positive number scenario)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70001";
      try {
        const arr: FixedArray<short> = [100, 200, 300];
        const result = find(arr, (val) => val === 200);
        expect(result).assertEqual(200);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0200
     * @tc.name   testBuiltinArrayFindShort70002
     * @tc.desc   Test search for negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70002";
      try {
        const arr: FixedArray<short> = [-100, -200, -300];
        const result = find(arr, (val) => val === -200);
        expect(result).assertEqual(-200);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0300
     * @tc.name   testBuiltinArrayFindShort70003
     * @tc.desc   Test scenario where no match is found
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70003";
      try {
        const arr: FixedArray<short> = [10, 20, 30];
        const result = find(arr, (val) => val === 40);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0400
     * @tc.name   testBuiltinArrayFindShort70004
     * @tc.desc   Test empty array scenario
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70004";
      try {
        const arr: FixedArray<short> = [];
        const result = find(arr, (val) => val === 10);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0500
     * @tc.name   testBuiltinArrayFindShort70005
     * @tc.desc   Test search with index condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70005";
      try {
        const arr: FixedArray<short> = [100, 200, 300];
        const result = find(arr, (val, idx) => idx === 1 && val === 200);
        expect(result).assertEqual(200);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0600
     * @tc.name   testBuiltinArrayFindShort70006
     * @tc.desc   Test early termination of iteration
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70006";
      try {
        const arr: FixedArray<short> = [1, 2, 3, 4];
        let callCount = 0;
        const result = find(arr, (val) => {
          callCount++;
          return val === 3;
        });
        expect(result).assertEqual(3);
        expect(callCount).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0700
     * @tc.name   testBuiltinArrayFindShort70007
     * @tc.desc   Test complete parameter passing
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindShort70007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFindShort70007";
      try {
        const arr: FixedArray<short> = [50, 60, 70];
        const result = find(arr, (val, idx, array) =>
        val === 60 && idx === 1 && array.length === 3
        );
        expect(result).assertEqual(60);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0100
     * @tc.name   testBuiltinArrayFilter0001
     * @tc.desc   Test filtering all true values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0001";
      try {
        const arr: FixedArray<boolean> = [true, false, true, false];
        const result = filter(arr, (val) => val === true);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0200
     * @tc.name   testBuiltinArrayFilter0002
     * @tc.desc   Test filtering an array of all false values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0002";
      try {
        const arr: FixedArray<boolean> = [false, false, false];
        const result = filter(arr, (val) => val === true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0300
     * @tc.name   testBuiltinArrayFilter0003
     * @tc.desc   Test filtering an array of all true values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0003";
      try {
        const arr: FixedArray<boolean> = [true, true, true];
        const result = filter(arr, (val) => val === true);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0400
     * @tc.name   testBuiltinArrayFilter0004
     * @tc.desc   Test filtering an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0004";
      try {
        const arr: FixedArray<boolean> = [];
        const result = filter(arr, (val) => val === true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0500
     * @tc.name   testBuiltinArrayFilter0005
     * @tc.desc   Test filtering with index condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0005";
      try {
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = filter(arr, (val, idx) => idx % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0600
     * @tc.name   testBuiltinArrayFilter0006
     * @tc.desc   Test filtering using array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0006";
      try {
        const arr: FixedArray<boolean> = [true, false, true];
        const result = filter(arr, (val, idx, array) =>
        val === true && array.length === 3
        );
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0700
     * @tc.name   testBuiltinArrayFilter0007
     * @tc.desc   Test filtering with mixed conditions
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0007";
      try {
        const arr: FixedArray<boolean> = [true, false, true, false, true];
        const result = filter(arr, (val, idx) => val && idx > 1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0800
     * @tc.name   testBuiltinArrayFilter0008
     * @tc.desc   Test that the original array is not modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0008";
      try {
        const original: FixedArray<boolean> = [true, false, true];
        const copy = [...original];
        filter(original, (val) => val === false);
        expect(original.length).assertEqual(copy.length);
        expect(original[0]).assertEqual(copy[0]);
        expect(original[1]).assertEqual(copy[1]);
        expect(original[2]).assertEqual(copy[2]);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_0900
     * @tc.name   testBuiltinArrayFilter0009_01
     * @tc.desc   Test filtering with complex conditions
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter0009_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter0009_01";
      try {
        const arr: FixedArray<boolean> = [true, false, true, false, true, false];
        const result = filter(arr, (val, idx) =>
        val && (idx % 2 === 0 || idx > 3)
        );
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(true);
        expect(result[2]).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_1500
     * @tc.name   testBuiltinArrayFilter00015
     * @tc.desc   Test behavior when the callback function throws an exception
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter00015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter00015";
      let hasThrown = false;
      try {
        const arr: FixedArray<boolean> = [true, false, true];
        filter(arr, (val, idx) => {
          if (idx === 1) {
            throw new Error("Test error");
          }
          return val;
        });
      } catch (e) {
        hasThrown = true;
        expect((e as Error).message).assertEqual("Test error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0100
     * @tc.name   testBuiltinArrayFilter10001
     * @tc.desc   Test basic functionality of filter method (filtering out even numbers)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10001";
      try {
        const original: FixedArray<byte> = [1, 2, 3, 4, 5];
        const filtered = filter(original, (v: byte) => v % 2 === 0);
        expect(filtered[0]).assertEqual(2);
        expect(filtered[1]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0200
     * @tc.name   testBuiltinArrayFilter10002
     * @tc.desc   Test filter handling of an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10002";
      try {
        const empty: FixedArray<byte> = [];
        const result = filter(empty, (v: byte) => v > 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0300
     * @tc.name   testBuiltinArrayFilter10003
     * @tc.desc   Test filter retaining all elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10003";
      try {
        const arr: FixedArray<byte> = [10, 20, 30];
        const result = filter(arr, (v: byte) => true);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0400
     * @tc.name   testBuiltinArrayFilter10004
     * @tc.desc   Test filter removing all elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10004";
      try {
        const arr: FixedArray<byte> = [1, 3, 5];
        const result = filter(arr, (v: byte) => v % 2 === 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0500
     * @tc.name   testBuiltinArrayFilter10005
     * @tc.desc   Test filter using index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10005";
      try {
        const arr: FixedArray<byte> = [10, 20, 30, 40];
        const result = filter(arr, (v: byte, k: int) => k % 2 === 0);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0600
     * @tc.name   testBuiltinArrayFilter10006
     * @tc.desc   Verify filter returns a new array (non-mutating)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10006";
      try {
        const original: FixedArray<byte> = [1, 2, 3];
        const filtered = filter(original, (v: byte) => v > 1);
        expect(filtered === original).assertFalse();
        expect(original[0]).assertEqual(1);
        expect(original[1]).assertEqual(2);
        expect(original[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0700
     * @tc.name   testBuiltinArrayFilter10007
     * @tc.desc   Test filter behavior when callback function throws an exception
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10007";
      let hasThrown = false;
      try {
        const arr: FixedArray<byte> = [1, 2, 3];
        filter(arr, (v: byte, idx: int) => {
          if (idx === 1) {
            throw new Error("Callback error");
          }
          return v % 2 === 0;
        });
      } catch (e) {
        hasThrown = true;
        console.info(`${TAG} succeed: ${e}`);
        expect((e as Error).message).assertEqual("Callback error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FILTER_BYTE_0800
     * @tc.name   testBuiltinArrayFilter10008
     * @tc.desc   Test filter handling of byte boundary values (0 and 255)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter10008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter10008";
      try {
        const arr: FixedArray<byte> = [0 as byte, (255).toByte(), 1 as byte];
        const result = filter(arr, (v: byte) => v === 0 as byte || v === (255).toByte());
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(0 as byte);
        expect(result[1]).assertEqual((255).toByte());
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0100
     * @tc.name   testBuiltinArrayFilter40001
     * @tc.desc   Test handling of an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40001";
      try {
        const arr: FixedArray<float> = [];
        const result = filter(arr, (val) => val > 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0200
     * @tc.name   testBuiltinArrayFilter40002
     * @tc.desc   Test filtering with index condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40002";
      try {
        const arr: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f];
        const result = filter(arr, (val, idx) => idx % 2 === 1);
        expect(Math.abs(result[0] - 2.2) < 0.000001).assertTrue();
        expect(Math.abs(result[1] - 4.4) < 0.000001).assertTrue();
        expect(result.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0300
     * @tc.name   testBuiltinArrayFilter40003
     * @tc.desc   Test filtering within a range (interval condition)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40003";
      const FLOAT_PRECISION = 0.000001;
      try {
        const arr: FixedArray<float> = [0.5f, 1.5f, 2.5f, 3.5f, 4.5f];
        const result = filter(arr, (val) => val > 1.0 && val < 4.0);
        expect(Math.abs(result[0] - 1.5) < FLOAT_PRECISION).assertTrue();
        expect(Math.abs(result[1] - 2.5) < FLOAT_PRECISION).assertTrue();
        expect(Math.abs(result[2] - 3.5) < FLOAT_PRECISION).assertTrue();
        expect(result.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0400
     * @tc.name   testBuiltinArrayFilter40004
     * @tc.desc   Test that the original array is not modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40004";
      try {
        const original: FixedArray<float> = [1.1f, 2.2f, 3.3f];
        const copy = [...original];
        filter(original, (val) => val > 2.0);
        expect(original.length).assertEqual(copy.length);
        expect(Math.abs(original[0] - copy[0]) < 0.000001).assertTrue();
        expect(Math.abs(original[1] - copy[1]) < 0.000001).assertTrue();
        expect(Math.abs(original[2] - copy[2]) < 0.000001).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0500
     * @tc.name   testBuiltinArrayFilter40005
     * @tc.desc   Test filtering with compound conditions
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40005";
      try {
        const arr: FixedArray<float> = [1.5f, -2.5f, 3.5f, -4.5f, 5.5f];
        const result = filter(arr, (val) => val > 0 && Math.abs(val) > 2.0);
        expect(result.length).assertEqual(2);
        expect(Math.abs(result[0] - 3.5) < 0.000001).assertTrue();
        expect(Math.abs(result[1] - 5.5) < 0.000001).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_BUILTIN_ARRAY_FILTER_FLOAT_0600
     * @tc.name   testBuiltinArrayFilter40006
     * @tc.desc   Test callback function throwing an exception
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter40006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter40006";
      let hasThrown = false;
      try {
        const arr: FixedArray<float> = [1.1f, 2.2f, 3.3f];
        filter(arr, (val, idx) => {
          if (idx === 1) {
            throw new Error("Test error");
          }
          return val > 2.0;
        });
      } catch (e) {
        hasThrown = true;
        console.info(`${TAG} succeed: ${e}`);
        expect((e as Error).message).assertEqual("Test error");
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number TEST_FILTER_CHAR_ARRAY_0400
     * @tc.name   testBuiltinArrayFilter20004
     * @tc.desc   Test filter handling of an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter20004";
      try {
        const empty: FixedArray<char> = new FixedArray<char>(0);
        const filtered = filter(empty, (v: char, _k: int, _arr: FixedArray<char>) =>
        v > 'a'.charCodeAt(0)
        );
        expect(filtered.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_001
     * @tc.name   testBuiltinArrayFilter30001
     * @tc.desc   Test basic functionality of filter method (filtering specific values)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30001";
      try {
        const original: FixedArray<double> = [1.5, 2.3, 3.7, 4.0, 5.2];
        const filtered = filter(original, (v: double) => v > 3.0);
        expect(filtered[0]).assertEqual(3.7);
        expect(filtered[1]).assertEqual(4.0);
        expect(filtered[2]).assertEqual(5.2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_002
     * @tc.name   testBuiltinArrayFilter30002
     * @tc.desc   Test filter method handling floating-point precision
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30002";
      try {
        const original: FixedArray<double> = [0.1 + 0.2, 1.0 / 3.0, Math.PI];
        const filtered = filter(original, (v: double) => v > 0.3 && v !== 0.1 + 0.2);
        expect(filtered[0]).assertEqual(1.0 / 3.0);
        expect(filtered[1]).assertEqual(Math.PI);
        expect(filtered.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_003
     * @tc.name   testBuiltinArrayFilter30003
     * @tc.desc   Test filter method handling special values (NaN/Infinity)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30003";
      try {
        const original: FixedArray<double> = [NaN, Infinity, -Infinity, 1.5];
        const filtered = filter(original, (v: double) => isFinite(v));
        expect(filtered[0]).assertEqual(1.5);
        expect(filtered.length).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_004
     * @tc.name   testBuiltinArrayFilter30004
     * @tc.desc   Test filter method using index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30004";
      try {
        const original: FixedArray<double> = [10.1, 20.2, 30.3, 40.4];
        const filtered = filter(original, (v: double, k: int) => k % 2 === 1);
        expect(filtered.length).assertEqual(2);
        expect(filtered[0]).assertEqual(20.2);
        expect(filtered[1]).assertEqual(40.4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_005
     * @tc.name   testBuiltinArrayFilter30005
     * @tc.desc   Test filter method handling value ranges
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30005";
      try {
        const original: FixedArray<double> = [-1.5, 0.0, 1.5, 2.5, 3.5];
        const filtered = filter(original, (v: double) => v >= 0.0 && v <= 3.0);
        expect(filtered[0]).assertEqual(0.0);
        expect(filtered[1]).assertEqual(1.5);
        expect(filtered[2]).assertEqual(2.5);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_006
     * @tc.name   testBuiltinArrayFilter30006
     * @tc.desc   Test filter method using complete callback parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30006";
      try {
        const original: FixedArray<double> = [1.1, 2.2, 3.3, 4.4];
        const filtered = filter(original, (v: double, k: int, arr: FixedArray<double>) => {
          return k < arr.length - 1;
        });
        expect(filtered[0]).assertEqual(1.1);
        expect(filtered[1]).assertEqual(2.2);
        expect(filtered[2]).assertEqual(3.3);
        expect(filtered.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_DOUBLE_ARRAY_007
     * @tc.name   testBuiltinArrayFilter30007
     * @tc.desc   Test filtering of very large and very small values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter30007";
      try {
        const original: FixedArray<double> = [
          Number.MAX_VALUE,
          Number.MIN_VALUE,
          1.0e-300,
          1.0e+300,
          1.5
        ];
        const filtered = filter(original,
          (v: double, k: int, arr: FixedArray<double>) => {
            return v > Number.MIN_VALUE && v < Number.MAX_VALUE;
          });
        expect(filtered.length).assertEqual(3);
        expect(filtered[0]).assertEqual(1.0e-300);
        expect(filtered[1]).assertEqual(1.0e+300);
        expect(filtered[2]).assertEqual(1.5);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0100
     * @tc.name   testBuiltinArrayFilter50001
     * @tc.desc   Test filtering even numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50001";
      try {
        const arr: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        const result = filter(arr, (val) => val % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0200
     * @tc.name   testBuiltinArrayFilter50002
     * @tc.desc   Test boundary values (maximum/minimum integers)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50002";
      try {
        const MAX_INT = 2147483647;
        const MIN_INT = -2147483648;
        const arr: FixedArray<int> = [MIN_INT, 0, MAX_INT];
        const result = filter(arr, (val) => val >= 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(MAX_INT);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0300
     * @tc.name   testBuiltinArrayFilter50003
     * @tc.desc   Test filtering with index condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50003";
      try {
        const arr: FixedArray<int> = [10, 20, 30, 40, 50];
        const result = filter(arr, (val, idx) => idx % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(30);
        expect(result[2]).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0400
     * @tc.name   testBuiltinArrayFilter50004
     * @tc.desc   Test handling of an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50004";
      try {
        const arr: FixedArray<int> = [];
        const result = filter(arr, (val) => val > 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0500
     * @tc.name   testBuiltinArrayFilter50005
     * @tc.desc   Test all matches scenario
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50005";
      try {
        const arr: FixedArray<int> = [5, 10, 15];
        const result = filter(arr, (val) => val > 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(5);
        expect(result[1]).assertEqual(10);
        expect(result[2]).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0600
     * @tc.name   testBuiltinArrayFilter50006
     * @tc.desc   Test no matches scenario
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50006";
      try {
        const arr: FixedArray<int> = [1, 3, 5];
        const result = filter(arr, (val) => val % 2 === 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0700
     * @tc.name   testBuiltinArrayFilter50007
     * @tc.desc   Test that the original array is not modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50007";
      try {
        const original: FixedArray<int> = [1, 2, 3];
        const copy = [...original];
        filter(original, (val) => val > 1);
        expect(original.length).assertEqual(copy.length);
        expect(original[0]).assertEqual(copy[0]);
        expect(original[1]).assertEqual(copy[1]);
        expect(original[2]).assertEqual(copy[2]);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_INT_ARRAY_0800
     * @tc.name   testBuiltinArrayFilter50008
     * @tc.desc   Test complete parameter passing
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter50008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter50008";
      try {
        const arr: FixedArray<int> = [100, 200, 300];
        const result = filter(arr, (val, idx, array) =>
        val > 150 && idx < 2 && array.length === 3
        );
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(200);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0100
     * @tc.name   testBuiltinArrayFilter60001
     * @tc.desc   Test filtering even numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60001";
      try {
        const arr: FixedArray<long> = [1, 2, 3, 4, 5, 6];
        const result = filter(arr, (val: long) => val % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(6);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0200
     * @tc.name   testBuiltinArrayFilter60002
     * @tc.desc   Test filtering using index parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60002";
      try {
        const arr: FixedArray<long> = [10, 20, 30, 40, 50];
        const result = filter(arr, (val: long, idx: int) => idx % 2 === 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(30);
        expect(result[2]).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0300
     * @tc.name   testBuiltinArrayFilter60003
     * @tc.desc   Test filtering using array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60003";
      try {
        const arr: FixedArray<long> = [1, 2, 3, 4];
        const result = filter(arr, (val: long, idx: int, array: FixedArray<long>) =>
        val === array[0]
        );
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0400
     * @tc.name   testBuiltinArrayFilter60004
     * @tc.desc   Test filtering an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60004";
      try {
        const arr: FixedArray<long> = [];
        const result = filter(arr, () => true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0500
     * @tc.name   testBuiltinArrayFilter60005
     * @tc.desc   Test filtering with no matches
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60005";
      try {
        const arr: FixedArray<long> = [1, 3, 5, 7];
        const result = filter(arr, (val: long) => val % 2 === 0);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0600
     * @tc.name   testBuiltinArrayFilter60006
     * @tc.desc   Test that the original array is not modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60006";
      try {
        const original: FixedArray<long> = [1, 2, 3, 4];
        const filtered = filter(original, (val: long) => val % 2 === 0);
        expect(original.length).assertEqual(4);
        expect(original[0]).assertEqual(1);
        expect(original[1]).assertEqual(2);
        expect(original[2]).assertEqual(3);
        expect(original[3]).assertEqual(4);
        expect(filtered.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_LONG_ARRAY_0700
     * @tc.name   testBuiltinArrayFilter60007
     * @tc.desc   Test filtering long integer boundary values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter60007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter60007";
      try {
        const MAX_LONG = 9223372036854775807;
        const MIN_LONG = -9223372036854775808;
        const original: FixedArray<long> = [MIN_LONG, 0, MAX_LONG];
        const filtered = filter(original,
          (v: long, k: int, arr: FixedArray<long>) => {
            return v >= 0 && k < arr.length;
          });
        expect(filtered.length).assertEqual(2);
        expect(filtered[0]).assertEqual(0);
        expect(filtered[1]).assertEqual(MAX_LONG);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    });
}