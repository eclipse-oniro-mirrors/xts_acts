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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function HeapSortTest() {
  describe("HeapSortTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0100
     * @tc.name   testBuiltinArrayFind30001
     * @tc.desc   Test finding existing double value in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30001";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double) => v === 3.3);
        expect(found).assertEqual(3.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0200
     * @tc.name   testBuiltinArrayFind30002
     * @tc.desc   Test case when double value doesn't exist in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30002";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4, 5.5];
        const found = find(arr, (v: double) => v === 6.6);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0300
     * @tc.name   testBuiltinArrayFind30003
     * @tc.desc   Test case for empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind30003";
      try {
        const emptyArr: FixedArray<double> = new FixedArray<double>(0);
        const found = find(emptyArr, (v: double) => v === 1.1);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0100
     * @tc.name   testBuiltinArrayFind60001
     * @tc.desc   Test finding existing long value in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60001";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000, 4000];
        const found = find(arr, (v: long) => v === 3000);
        expect(found).assertEqual(3000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0200
     * @tc.name   testBuiltinArrayFind60002
     * @tc.desc   Test case when long value doesn't exist in array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60002";
      try {
        const arr: FixedArray<long> = [1000, 2000, 3000];
        const found = find(arr, (v: long) => v === 5000);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0300
     * @tc.name   testBuiltinArrayFind60003
     * @tc.desc   Test case for empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60003";
      try {
        const emptyArr: FixedArray<long> = new FixedArray<long>(0);
        const found = find(emptyArr, (v: long) => v === 1000);
        expect(found).assertUndefined();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0500
     * @tc.name   testBuiltinArrayFind60005
     * @tc.desc   Test boundary value search for long
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60005";
      try {
        const arr: FixedArray<long> = [9223372036854775807, -9223372036854775808];
        const found1 = find(arr, (v: long) => v === 9223372036854775807);
        const found2 = find(arr, (v: long) => v === -9223372036854775808);
        expect(found1).assertEqual(9223372036854775807);
        expect(found2).assertEqual(-9223372036854775808);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_LONG_0800
     * @tc.name   testBuiltinArrayFind60008
     * @tc.desc   Test case for zero value in long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind60008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind60008";
      try {
        const arr: FixedArray<long> = [0, -0, 1000];
        const found = find(arr, (v: long) => v === 0);
        expect(found).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_FLOAT_0100
     * @tc.name   testBuiltinArrayFind40001
     * @tc.desc   Test basic find functionality (finding matching element)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFind40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFind40001";
      try {
        const arr: FixedArray<float> = [1.5f, 2.3f, 3.7f, 4.2f];
        const result = find(arr, (val: float) => val > 3);
        expect(result).assertEqual(3.7 as float);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0500
     * @tc.name   TESTBUILTINARRAYCONCAT6005
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation preserves original array order
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6005";
      try {
        const arr1: FixedArray<double> = [1.1, 2.2];
        const arr2: FixedArray<double> = [3.3, 4.4];
        const result = concat(arr1, arr2);
        expect(result[0]).assertEqual(1.1);
        expect(result[1]).assertEqual(2.2);
        expect(result[2]).assertEqual(3.3);
        expect(result[3]).assertEqual(4.4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0600
     * @tc.name   TESTBUILTINARRAYCONCAT6006
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with single-element arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6006";
      try {
        const arr1: FixedArray<double> = [5.5];
        const arr2: FixedArray<double> = [6.6];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(5.5);
        expect(result[1]).assertEqual(6.6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0700
     * @tc.name   TESTBUILTINARRAYCONCAT6007
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with zero-value elements
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6007";
      try {
        const arr1: FixedArray<double> = [0.0];
        const arr2: FixedArray<double> = [0.0, 0.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(0.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0800
     * @tc.name   TESTBUILTINARRAYCONCAT6008
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with decimal numbers
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6008";
      try {
        const arr1: FixedArray<double> = [1.23];
        const arr2: FixedArray<double> = [4.56];
        const result = concat(arr1, arr2);
        expect(result[0]).assertEqual(1.23);
        expect(result[1]).assertEqual(4.56);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_0900
     * @tc.name   TESTBUILTINARRAYCONCAT6009
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with large arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6009";
      try {
        const arr1: FixedArray<double> = [10.0, 20.0, 30.0];
        const arr2: FixedArray<double> = [40.0, 50.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(5);
        expect(result[4]).assertEqual(50.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT6_1000
     * @tc.name   TESTBUILTINARRAYCONCAT6010
     * @tc.type   FUNCTION
     * @tc.desc   Test chained concatenation
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT6010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT6010";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const temp = concat(arr1, arr2);
        const result = concat(temp, arr3);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0100
     * @tc.name   TESTBUILTINARRAYCONCAT7001
     * @tc.type   FUNCTION
     * @tc.desc   Test basic concatenation with two required arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7001";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0];
        const arr2: FixedArray<double> = [3.0];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0200
     * @tc.name   TESTBUILTINARRAYCONCAT7002
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with one required array and one variadic array
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7002";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0300
     * @tc.name   TESTBUILTINARRAYCONCAT7003
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with empty variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7003";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(1.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0400
     * @tc.name   TESTBUILTINARRAYCONCAT7004
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with multiple variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7004";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0];
        const arr3: FixedArray<double> = [3.0];
        const arr4: FixedArray<double> = [4.0];
        const result = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(4.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0500
     * @tc.name   TESTBUILTINARRAYCONCAT7005
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation preserves element order
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7005";
      try {
        const arr1: FixedArray<double> = [1.0];
        const arr2: FixedArray<double> = [2.0, 3.0];
        const arr3: FixedArray<double> = [4.0];
        const result = concat(arr1, arr2, arr3);
        expect(result[0]).assertEqual(1.0);
        expect(result[1]).assertEqual(2.0);
        expect(result[2]).assertEqual(3.0);
        expect(result[3]).assertEqual(4.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0600
     * @tc.name   TESTBUILTINARRAYCONCAT7006
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with single-element required arrays and no variadic arrays
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7006";
      try {
        const arr1: FixedArray<double> = [9.9];
        const arr2: FixedArray<double> = [8.8];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(9.9);
        expect(result[1]).assertEqual(8.8);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0700
     * @tc.name   TESTBUILTINARRAYCONCAT7007
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with large arrays (10+ elements)
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7007";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0, 3.0];
        const arr2: FixedArray<double> = [4.0, 5.0, 6.0];
        const arr3: FixedArray<double> = [7.0, 8.0, 9.0, 10.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(10);
        expect(result[9]).assertEqual(10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0800
     * @tc.name   TESTBUILTINARRAYCONCAT7008
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with negative and positive numbers mixed
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7008";
      try {
        const arr1: FixedArray<double> = [-1.5];
        const arr2: FixedArray<double> = [2.3];
        const arr3: FixedArray<double> = [-3.7];
        const result = concat(arr1, arr2, arr3);
        expect(result[0]).assertEqual(-1.5);
        expect(result[1]).assertEqual(2.3);
        expect(result[2]).assertEqual(-3.7);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_0900
     * @tc.name   TESTBUILTINARRAYCONCAT7009
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with duplicate values
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7009";
      try {
        const arr1: FixedArray<double> = [1.1, 1.1];
        const arr2: FixedArray<double> = [2.2, 2.2];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(2.2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_1000
     * @tc.name   TESTBUILTINARRAYCONCAT7010
     * @tc.type   FUNCTION
     * @tc.desc   Test chained concatenation with intermediate results
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7010";
      try {
        const base: FixedArray<double> = [0.5];
        const temp1 = concat(base, [1.5]);
        const temp2 = concat(temp1, [2.5]);
        const result = concat(temp2, [3.5]);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_1700
     * @tc.name   TESTBUILTINARRAYCONCAT7017
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with large arrays (10+ elements)
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7017";
      try {
        const arr1: FixedArray<double> = [1.0, 2.0, 3.0];
        const arr2: FixedArray<double> = [4.0, 5.0, 6.0];
        const arr3: FixedArray<double> = [7.0, 8.0, 9.0, 10.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(10);
        expect(result[9]).assertEqual(10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_1800
     * @tc.name   TESTBUILTINARRAYCONCAT7018
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with negative and positive numbers mixed
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7018";
      try {
        const arr1: FixedArray<double> = [-1.5];
        const arr2: FixedArray<double> = [2.3];
        const arr3: FixedArray<double> = [-3.7];
        const result = concat(arr1, arr2, arr3);
        expect(result[0]).assertEqual(-1.5);
        expect(result[1]).assertEqual(2.3);
        expect(result[2]).assertEqual(-3.7);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_1900
     * @tc.name   TESTBUILTINARRAYCONCAT7019
     * @tc.type   FUNCTION
     * @tc.desc   Test concatenation with duplicate values
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7019";
      try {
        const arr1: FixedArray<double> = [1.1, 1.1];
        const arr2: FixedArray<double> = [2.2, 2.2];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(2.2);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT7_2000
     * @tc.name   TESTBUILTINARRAYCONCAT7020
     * @tc.type   FUNCTION
     * @tc.desc   Test chained concatenation with intermediate results
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT7020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT7020";
      try {
        const base: FixedArray<double> = [0.5];
        const temp1 = concat(base, [1.5]);
        const temp2 = concat(temp1, [2.5]);
        const result = concat(temp2, [3.5]);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}