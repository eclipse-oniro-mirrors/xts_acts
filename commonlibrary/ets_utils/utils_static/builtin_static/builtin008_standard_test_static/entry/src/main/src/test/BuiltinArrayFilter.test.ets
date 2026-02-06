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

export default function BuiltinArrayFilterTest() {
  describe("BuiltinArrayFilterTest", (): void => {
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
     * @tc.number TEST_FILTER_SHORT_ARRAY_0100
     * @tc.name   testBuiltinArrayFilter70001
     * @tc.desc   Test filtering positive numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70001";
      try {
        const arr: FixedArray<short> = [-10, 5, -3, 20, 0, 15];
        const result = filter(arr, (val: short) => val > 0);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(5);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0200
     * @tc.name   testBuiltinArrayFilter70002
     * @tc.desc   Test filtering boundary values (short range)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70002";
      try {
        const arr: FixedArray<short> = [-32768, 32767, 0, 100, -100];
        const result = filter(arr, (val: short) => val === -32768 || val === 32767);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(-32768);
        expect(result[1]).assertEqual(32767);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0300
     * @tc.name   testBuiltinArrayFilter70003
     * @tc.desc   Test filtering using both value and index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70003";
      try {
        const arr: FixedArray<short> = [10, 20, 30, 40, 50];
        const result = filter(arr, (val: short, idx: int) => val > 20 && idx % 2 === 0);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(30);
        expect(result[1]).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0400
     * @tc.name   testBuiltinArrayFilter70004
     * @tc.desc   Test filtering using array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70004";
      try {
        const arr: FixedArray<short> = [5, 10, 15, 20];
        const result = filter(arr, (val: short, idx: int, array: FixedArray<short>) => {
          return val % 5 === 0;
        });
        expect(result.length).assertEqual(4);
        expect(arr[0]).assertEqual(5);
        expect(arr[1]).assertEqual(10);
        expect(arr[2]).assertEqual(15);
        expect(arr[3]).assertEqual(20);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0500
     * @tc.name   testBuiltinArrayFilter70005
     * @tc.desc   Test filtering an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70005";
      try {
        const arr: FixedArray<short> = [];
        const result = filter(arr, () => true);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0600
     * @tc.name   testBuiltinArrayFilter70006
     * @tc.desc   Test that the original array is not modified
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70006";
      try {
        const original: FixedArray<short> = [100, 200, 300];
        const filtered = filter(original, (val: short) => val > 150);
        expect(original.length).assertEqual(3);
        expect(original[0]).assertEqual(100);
        expect(original[1]).assertEqual(200);
        expect(original[2]).assertEqual(300);
        expect(filtered.length).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILTER_SHORT_ARRAY_0800
     * @tc.name   testBuiltinArrayFilter70008
     * @tc.desc   Test filtering special values in short integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFilter70008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFilter70008";
      try {
        const original: FixedArray<short> = [0, -0, 1, -1];
        const filtered = filter(original,
          (v: short, k: int, arr: FixedArray<short>) => {
            return v !== 0 && k < arr.length;
          });
        expect(filtered.length).assertEqual(2);
        expect(filtered[0]).assertEqual(1);
        expect(filtered[1]).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_001
     * @tc.name   testBuiltinArrayFill13001
     * @tc.desc   Test basic functionality of fill method for long type arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13001";
      try {
        const original: FixedArray<long> = [100000000, 200000000, 300000000];
        const filled = fill(original, 9999999999, 1, 3);
        expect(filled[0]).assertEqual(100000000);
        expect(filled[1]).assertEqual(9999999999);
        expect(filled[2]).assertEqual(9999999999);
        expect(filled.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_002
     * @tc.name   testBuiltinArrayFill13002
     * @tc.desc   Test fill handling long type empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13002";
      try {
        const arr: FixedArray<long> = [];
        fill(arr, 1234567890);
        expect(arr.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_003
     * @tc.name   testBuiltinArrayFill13003
     * @tc.desc   Test fill handling large integers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13003";
      try {
        const arr: FixedArray<long> = [0, 1, 2];
        const largeNum = 9223372036854775807;
        fill(arr, largeNum);
        expect(arr[0]).assertEqual(largeNum);
        expect(arr[1]).assertEqual(largeNum);
        expect(arr[2]).assertEqual(largeNum);
        expect(arr.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_004
     * @tc.name   testBuiltinArrayFill13004
     * @tc.desc   Test fill handling negative long integers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13004";
      try {
        const arr: FixedArray<long> = [100, 200, 300];
        fill(arr, -50000000, 1);
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(-50000000);
        expect(arr[2]).assertEqual(-50000000);
        expect(arr.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_005
     * @tc.name   testBuiltinArrayFill13005
     * @tc.desc   Test fill for a partial range of long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13005";
      try {
        const arr: FixedArray<long> = [10000000, 20000000, 30000000, 40000000];
        fill(arr, 999999999, 1, 3);
        expect(arr[0]).assertEqual(10000000);
        expect(arr[1]).assertEqual(999999999);
        expect(arr[2]).assertEqual(999999999);
        expect(arr[3]).assertEqual(40000000);
        expect(arr.length).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_006
     * @tc.name   testBuiltinArrayFill13006
     * @tc.desc   Verify fill performs in-place operation on long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13006";
      try {
        const original: FixedArray<long> = [10000, 20000];
        const returned = fill(original, 30000);
        expect(returned === original).assertTrue();
        expect(original[0]).assertEqual(30000);
        expect(original[1]).assertEqual(30000);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_0010
     * @tc.name   testBuiltinArrayFill13010
     * @tc.desc   Test filling with the minimum long integer value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13010";
      try {
        const original: FixedArray<long> = [100000000, 200000000, 300000000];
        const minLong = -9223372036854775808;
        const filled = fill(original, minLong, 1, original.length);
        expect(filled[0]).assertEqual(100000000);
        expect(filled[1]).assertEqual(minLong);
        expect(filled[2]).assertEqual(minLong);
        expect(filled === original).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_LONG_ARRAY_0011
     * @tc.name   testBuiltinArrayFill13011
     * @tc.desc   Test invalid range fill
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill13011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill13011";
      try {
        const original: FixedArray<long> = [100000000, 200000000, 300000000];
        const filled = fill(original, 9999999999, 2, 1);
        expect(filled[0]).assertEqual(100000000);
        expect(filled[1]).assertEqual(200000000);
        expect(filled[2]).assertEqual(300000000);
        expect(filled === original).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_001
     * @tc.name   testBuiltinArrayFill14001
     * @tc.desc   Test basic functionality of fill method (specify start and end)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14001";
      try {
        const original: FixedArray<short> = [
          100 as short,
          200 as short,
          300 as short,
          400 as short,
          500 as short
        ];
        const filled = fill(original, 999 as short, 1 as int, 4 as int);
        expect(filled.length).assertEqual(5);
        expect(filled[0]).assertEqual(100);
        expect(filled[1]).assertEqual(999);
        expect(filled[2]).assertEqual(999);
        expect(filled[3]).assertEqual(999);
        expect(filled[4]).assertEqual(500);
        expect(original).assertEqual(filled);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_002
     * @tc.name   testBuiltinArrayFill14002
     * @tc.desc   Test fill method's default behavior without any optional parameters (fill entire array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14002";
      try {
        const original: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        const filled = fill(original, 999 as short);
        expect(filled[0]).assertEqual(999 as short);
        expect(filled[1]).assertEqual(999 as short);
        expect(filled[2]).assertEqual(999 as short);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_003
     * @tc.name   testBuiltinArrayFill14003
     * @tc.desc   Test fill method's default behavior with only start parameter (end defaults to array length)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14003";
      try {
        const original: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        const filled = fill(original, 555 as short, 1 as int);
        expect(filled[0]).assertEqual(100 as short);
        expect(filled[1]).assertEqual(555 as short);
        expect(filled[2]).assertEqual(555 as short);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_004
     * @tc.name   testBuiltinArrayFill14004
     * @tc.desc   Test fill method's default behavior with only end parameter (start defaults to 0)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14004";
      try {
        const original: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        const filled = fill(original, 111 as short, undefined, 2 as int);
        expect(filled[0]).assertEqual(111 as short);
        expect(filled[1]).assertEqual(111 as short);
        expect(filled[2]).assertEqual(300 as short);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_005
     * @tc.name   testBuiltinArrayFill14005
     * @tc.desc   Test fill method handling empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14005";
      try {
        const empty: FixedArray<short> = [] as FixedArray<short>;
        const filledEmpty = fill(empty, 123 as short);
        expect(filledEmpty.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_006
     * @tc.name   testBuiltinArrayFill14006
     * @tc.desc   Test fill method behavior when start > end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14006";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        const filled = fill(arr, 999 as short, 2 as int, 1 as int);
        expect(filled[0]).assertEqual(1 as short);
        expect(filled[1]).assertEqual(2 as short);
        expect(filled[2]).assertEqual(3 as short);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_007
     * @tc.name   testBuiltinArrayFill14007
     * @tc.desc   Test fill method handling negative indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14007";
      try {
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short];
        const filled = fill(arr, 999 as short, -2 as int, -1 as int);
        expect(filled[0]).assertEqual(10);
        expect(filled[1]).assertEqual(999);
        expect(filled[2]).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_008
     * @tc.name   testBuiltinArrayFill14008
     * @tc.desc   Test fill method handling out-of-bounds indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14008";
      try {
        const arr: FixedArray<short> = [5 as short, 6 as short, 7 as short];
        const filled = fill(arr, 888 as short, 1 as int, 100 as int);
        expect(filled[0]).assertEqual(5);
        expect(filled[1]).assertEqual(888);
        expect(filled[2]).assertEqual(888);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_009
     * @tc.name   testBuiltinArrayFill14009
     * @tc.desc   Verify fill is an in-place operation (modifies original array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14009";
      try {
        const original: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        const returned = fill(original, 999 as short, 0 as int, 3 as int);
        expect(returned === original).assertTrue();
        expect(original[0]).assertEqual(999);
        expect(original[1]).assertEqual(999);
        expect(original[2]).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0010
     * @tc.name   testBuiltinArrayFill14010_01
     * @tc.desc   Test filling with short boundary values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14010_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14010_01";
      try {
        const original: FixedArray<short> = [0 as short, 100 as short, -100 as short];
        const maxShort = 32767 as short;
        const minShort = -32768 as short;
        const filled = fill(original, maxShort, 1, 3);
        expect(filled[0]).assertEqual(0);
        expect(filled[1]).assertEqual(maxShort);
        expect(filled[2]).assertEqual(maxShort);
        fill(original, minShort);
        expect(original[0]).assertEqual(minShort);
        expect(original[1]).assertEqual(minShort);
        expect(original[2]).assertEqual(minShort);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0100
     * @tc.name   testBuiltinArrayFill14010_02
     * @tc.desc   Verify fill is an in-place operation (modifies original array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14010_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14010_02";
      try {
        const original: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        const returned = fill(original, 999 as short, 0 as int, 3 as int);
        expect(returned === original).assertTrue();
        expect(original[0]).assertEqual(999);
        expect(original[1]).assertEqual(999);
        expect(original[2]).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0200
     * @tc.name   testBuiltinArrayFill14020
     * @tc.desc   Verify fill uses default parameters (no start and end specified)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14020";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        fill(arr, 0 as short);
        expect(arr[0]).assertEqual(0 as short);
        expect(arr[1]).assertEqual(0 as short);
        expect(arr[2]).assertEqual(0 as short);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0300
     * @tc.name   testBuiltinArrayFill14030
     * @tc.desc   Verify fill can fill a partial range
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14030";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short];
        fill(arr, 9 as short, 1 as int, 3 as int);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0400
     * @tc.name   testBuiltinArrayFill14040
     * @tc.desc   Verify fill handles negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14040";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short, 4 as short];
        fill(arr, 5 as short, -2 as int);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(5);
        expect(arr[3]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0500
     * @tc.name   testBuiltinArrayFill14050
     * @tc.desc   Verify fill handles out-of-bounds indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14050";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        fill(arr, 9 as short, 1 as int, arr.length as int);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0600
     * @tc.name   testBuiltinArrayFill14060
     * @tc.desc   Verify fill handles empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14060";
      try {
        const arr: FixedArray<short> = [] as FixedArray<short>;
        fill(arr, 1 as short);
        expect(arr.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TEST_FILL_SHORT_ARRAY_0700
     * @tc.name   testBuiltinArrayFill14070
     * @tc.desc   Verify behavior with non-integer indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill14070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill14070";
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        fill(arr, 9 as short, 1.5 as int, 2.9 as int);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

  });
}