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

export default function BuiltinArrayconcatTest() {
  describe("BuiltinArrayconcatTest", (): void => {
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0100_01
     * @tc.name    testBuiltinArrayconcat10001
     * @tc.desc    concat
     * @tc.level   Level 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a: FixedArray<int> = new FixedArray<int>(0);
      const b: FixedArray<int> = new FixedArray<int>(0);
      const res: FixedArray<int> = concat(a, b);
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0200_01
     * @tc.name    testBuiltinArrayconcat1002
     * @tc.desc    concat
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a: FixedArray<int> = new FixedArray<int>(2);
      a[0] = 10;
      a[1] = 20;
      const b: FixedArray<int> = new FixedArray<int>(0);
      const res: FixedArray<int> = concat(a, b);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10);
      expect(res[1]).assertEqual(20);
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0300_02
     * @tc.name    testBuiltinArrayconcat10003_01
     * @tc.desc    concat
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat10003_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a: FixedArray<int> = new FixedArray<int>(1);
      a[0] = 1;
      const b: FixedArray<int> = new FixedArray<int>(2);
      b[0] = 2;
      b[1] = 3;
      const c: FixedArray<int> = new FixedArray<int>(1);
      c[0] = 4;
      const res: FixedArray<int> = concat(a, b, c);
      expect(res.length).assertEqual(4);
      expect(res[0]).assertEqual(1);
      expect(res[1]).assertEqual(2);
      expect(res[2]).assertEqual(3);
      expect(res[3]).assertEqual(4);
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_11001
     * @tc.name    testBuiltinArrayconcat11001
     * @tc.desc    Test basic concatenation of two non-empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat11001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat11001";
      try {
        const arr1: FixedArray<int> = [1, 2] as FixedArray<int>;
        const arr2: FixedArray<int> = [3, 4] as FixedArray<int>;
        const result: FixedArray<int> = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_11002
     * @tc.name    testBuiltinArrayconcat11002
     * @tc.desc    Test concatenation with multiple arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat11002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat11002";
      try {
        const arr1: FixedArray<int> = [1] as FixedArray<int>;
        const arr2: FixedArray<int> = [2] as FixedArray<int>;
        const arr3: FixedArray<int> = [3] as FixedArray<int>;
        const arr4: FixedArray<int> = [4] as FixedArray<int>;
        const result: FixedArray<int> = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_11003
     * @tc.name    testBuiltinArrayconcat11003
     * @tc.desc    Test concatenation with empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat11003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat11003";
      try {
        const emptyArr: FixedArray<int> = [] as FixedArray<int>;
        const nonEmptyArr: FixedArray<int> = [5, 6] as FixedArray<int>;
        const result1: FixedArray<int> = concat(emptyArr, nonEmptyArr);
        expect(result1.length).assertEqual(2);
        expect(result1[0]).assertEqual(5);
        expect(result1[1]).assertEqual(6);
        const result2: FixedArray<int> = concat(nonEmptyArr, emptyArr);
        expect(result2.length).assertEqual(2);
        expect(result2[0]).assertEqual(5);
        expect(result2[1]).assertEqual(6);
        const result3: FixedArray<int> = concat(emptyArr, emptyArr);
        expect(result3.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_11004
     * @tc.name    testBuiltinArrayconcat11004
     * @tc.desc    Test concatenation order preservation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat11004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat11004";
      try {
        const arr1: FixedArray<int> = [10, 20] as FixedArray<int>;
        const arr2: FixedArray<int> = [30, 40] as FixedArray<int>;
        const arr3: FixedArray<int> = [50] as FixedArray<int>;
        const result: FixedArray<int> = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
        expect(result[3]).assertEqual(40);
        expect(result[4]).assertEqual(50);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_12001
     * @tc.name    testBuiltinArrayconcat12001
     * @tc.desc    Test concatenation of two non-empty long arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat12001";
      try {
        const arr1: FixedArray<long> = [1000000000, 2000000000] as FixedArray<long>;
        const arr2: FixedArray<long> = [3000000000] as FixedArray<long>;
        const result: FixedArray<long> = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1000000000);
        expect(result[1]).assertEqual(2000000000);
        expect(result[2]).assertEqual(3000000000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_12002
     * @tc.name    testBuiltinArrayconcat12002
     * @tc.desc    Test concatenation with multiple long arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat12002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat12002";
      try {
        const base: FixedArray<long> = [1] as FixedArray<long>;
        const arr1: FixedArray<long> = [2, 3] as FixedArray<long>;
        const arr2: FixedArray<long> = [4] as FixedArray<long>;
        const arr3: FixedArray<long> = [5, 6, 7] as FixedArray<long>;
        const result: FixedArray<long> = concat(base, arr1, arr2, arr3);
        expect(result.length).assertEqual(7);
        for (let i = 0; i < 7; i++) {
          expect(result[i]).assertEqual(i + 1);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_12003
     * @tc.name    testBuiltinArrayconcat12003
     * @tc.desc    Test concatenation with empty long arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat12003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat12003";
      try {
        const emptyArr: FixedArray<long> = [] as FixedArray<long>;
        const singleItem: FixedArray<long> = [9999999999] as FixedArray<long>;
        const result1: FixedArray<long> = concat(emptyArr, singleItem);
        expect(result1.length).assertEqual(1);
        expect(result1[0]).assertEqual(9999999999);
        const result2: FixedArray<long> = concat(singleItem, emptyArr);
        expect(result2.length).assertEqual(1);
        expect(result2[0]).assertEqual(9999999999);
        const result3: FixedArray<long> = concat(emptyArr, emptyArr, emptyArr);
        expect(result3.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_12004
     * @tc.name    testBuiltinArrayconcat12004
     * @tc.desc    Test concatenation of long arrays with negative values and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat12004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat12004";
      try {
        const arr1: FixedArray<long> = [-1000000000, 0] as FixedArray<long>;
        const arr2: FixedArray<long> = [2000000000, -3000000000] as FixedArray<long>;
        const result: FixedArray<long> = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(-1000000000);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(2000000000);
        expect(result[3]).assertEqual(-3000000000);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_13001
     * @tc.name    testBuiltinArrayconcat13001
     * @tc.desc    Test basic concatenation of two long arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat13001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat13001";
      try {
        const arr1: FixedArray<long> = [100, 200] as FixedArray<long>;
        const arr2: FixedArray<long> = [300] as FixedArray<long>;
        const result: FixedArray<long> = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(100);
        expect(result[1]).assertEqual(200);
        expect(result[2]).assertEqual(300);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_13002_01
     * @tc.name    testBuiltinArrayconcat13002_01
     * @tc.desc    Test concatenation with one additional array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat13002_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat13002_01";
      try {
        const arr1: FixedArray<long> = [1] as FixedArray<long>;
        const arr2: FixedArray<long> = [2] as FixedArray<long>;
        const arr3: FixedArray<long> = [3] as FixedArray<long>;
        const result: FixedArray<long> = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_13002_02
     * @tc.name    testBuiltinArrayconcat13002_02
     * @tc.desc    Test concatenation with one additional array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat13002_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat13002_02";
      try {
        const arr1: FixedArray<long> = [1] as FixedArray<long>;
        const arr2: FixedArray<long> = [2] as FixedArray<long>;
        const arr3: FixedArray<long> = [3] as FixedArray<long>;
        const result: FixedArray<long> = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_13003
     * @tc.name    testBuiltinArrayconcat13003
     * @tc.desc    Test concatenation with multiple additional arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat13003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat13003";
      try {
        const base: FixedArray<long> = [10] as FixedArray<long>;
        const first: FixedArray<long> = [20] as FixedArray<long>;
        const more1: FixedArray<long> = [30] as FixedArray<long>;
        const more2: FixedArray<long> = [40, 50] as FixedArray<long>;
        const result: FixedArray<long> = concat(base, first, more1, more2);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
        expect(result[3]).assertEqual(40);
        expect(result[4]).assertEqual(50);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_13004
     * @tc.name    testBuiltinArrayconcat13004
     * @tc.desc    Test concatenation with empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat13004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat13004";
      try {
        const empty: FixedArray<long> = [] as FixedArray<long>;
        const single: FixedArray<long> = [1000] as FixedArray<long>;
        const anotherEmpty: FixedArray<long> = [] as FixedArray<long>;
        const result1: FixedArray<long> = concat(empty, single, anotherEmpty);
        expect(result1.length).assertEqual(1);
        expect(result1[0]).assertEqual(1000);
        const result2: FixedArray<long> = concat(single, empty);
        expect(result2.length).assertEqual(1);
        expect(result2[0]).assertEqual(1000);
        const result3: FixedArray<long> = concat(empty, empty, empty);
        expect(result3.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14001
     * @tc.name    testBuiltinArrayconcat14001
     * @tc.desc    Test basic concatenation of two short arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14001";
      try {
        const arr1: FixedArray<short> = [10, 20] as FixedArray<short>;
        const arr2: FixedArray<short> = [30] as FixedArray<short>;
        const result: FixedArray<short> = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(30);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14002
     * @tc.name    testBuiltinArrayconcat14002
     * @tc.desc    Test concatenation with multiple short arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14002";
      try {
        const base: FixedArray<short> = [1] as FixedArray<short>;
        const arr1: FixedArray<short> = [2, 3] as FixedArray<short>;
        const arr2: FixedArray<short> = [4] as FixedArray<short>;
        const result: FixedArray<short> = concat(base, arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14003
     * @tc.name    testBuiltinArrayconcat14003
     * @tc.desc    Test concatenation with empty short arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14003";
      try {
        const emptyArr: FixedArray<short> = [] as FixedArray<short>;
        const nonEmptyArr: FixedArray<short> = [100] as FixedArray<short>;
        const result1: FixedArray<short> = concat(emptyArr, nonEmptyArr);
        expect(result1.length).assertEqual(1);
        expect(result1[0]).assertEqual(100);
        const result2: FixedArray<short> = concat(nonEmptyArr, emptyArr);
        expect(result2.length).assertEqual(1);
        expect(result2[0]).assertEqual(100);
        const result3: FixedArray<short> = concat(emptyArr, emptyArr, emptyArr);
        expect(result3.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14005
     * @tc.name    testBuiltinArrayconcat14005
     * @tc.desc    Test concatenation with mixed size arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14005";
      try {
        const smallArr: FixedArray<short> = [1, 2] as FixedArray<short>;
        const mediumArr: FixedArray<short> = [3, 4, 5] as FixedArray<short>;
        const largeArr: FixedArray<short> = [6, 7, 8, 9] as FixedArray<short>;
        const result: FixedArray<short> = concat(smallArr, mediumArr, largeArr);
        expect(result.length).assertEqual(9);
        for (let i = 0; i < 9; i++) {
          expect(result[i]).assertEqual(i + 1);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14006
     * @tc.name    testBuiltinArrayconcat14006
     * @tc.desc    Test concatenation with negative short values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14006";
      try {
        const arr1: FixedArray<short> = [-10, -20] as FixedArray<short>;
        const arr2: FixedArray<short> = [-30] as FixedArray<short>;
        const result: FixedArray<short> = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(-10);
        expect(result[1]).assertEqual(-20);
        expect(result[2]).assertEqual(-30);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14007
     * @tc.name    testBuiltinArrayconcat14007
     * @tc.desc    Test concatenation with single-element arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14007";
      try {
        const arr1: FixedArray<short> = [1] as FixedArray<short>;
        const arr2: FixedArray<short> = [2] as FixedArray<short>;
        const arr3: FixedArray<short> = [3] as FixedArray<short>;
        const arr4: FixedArray<short> = [4] as FixedArray<short>;
        const result: FixedArray<short> = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(4);
        for (let i = 0; i < 4; i++) {
          expect(result[i]).assertEqual(i + 1);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14008
     * @tc.name    testBuiltinArrayconcat14008
     * @tc.desc    Test concatenation with mixed empty and non-empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14008";
      try {
        const empty1: FixedArray<short> = [] as FixedArray<short>;
        const nonEmpty: FixedArray<short> = [5, 6] as FixedArray<short>;
        const empty2: FixedArray<short> = [] as FixedArray<short>;
        const result: FixedArray<short> = concat(empty1, nonEmpty, empty2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(5);
        expect(result[1]).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14009
     * @tc.name    testBuiltinArrayconcat14009
     * @tc.desc    Test concatenation with arrays containing zero values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14009";
      try {
        const zeros: FixedArray<short> = [0, 0, 0] as FixedArray<short>;
        const values: FixedArray<short> = [1, 0, -1] as FixedArray<short>;
        const result: FixedArray<short> = concat(zeros, values);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(1);
        expect(result[4]).assertEqual(0);
        expect(result[5]).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_14010
     * @tc.name    testBuiltinArrayconcat14010
     * @tc.desc    Test concatenation with arrays of different lengths
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat14010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat14010";
      try {
        const shortArr: FixedArray<short> = [100] as FixedArray<short>;
        const mediumArr: FixedArray<short> = [200, 201] as FixedArray<short>;
        const longArr: FixedArray<short> = [300, 301, 302] as FixedArray<short>;
        const result: FixedArray<short> = concat(shortArr, mediumArr, longArr);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(100);
        expect(result[1]).assertEqual(200);
        expect(result[2]).assertEqual(201);
        expect(result[3]).assertEqual(300);
        expect(result[4]).assertEqual(301);
        expect(result[5]).assertEqual(302);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0100
     * @tc.name    testBuiltinArrayconcat15001
     * @tc.desc    Test concatenating two non-empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15001";
      try {
        const arr1: FixedArray<short> = [1, 2];
        const arr2: FixedArray<short> = [3, 4];
        const result: FixedArray<short> = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0200
     * @tc.name    testBuiltinArrayconcat15002
     * @tc.desc    Test concatenating multiple arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15002";
      try {
        const arr1: FixedArray<short> = [1];
        const arr2: FixedArray<short> = [2];
        const arr3: FixedArray<short> = [3];
        const arr4: FixedArray<short> = [4];
        const result: FixedArray<short> = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0300
     * @tc.name    testBuiltinArrayconcat15003
     * @tc.desc    Test concatenating with empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15003";
      try {
        const arr1: FixedArray<short> = [];
        const arr2: FixedArray<short> = [5, 6];
        const arr3: FixedArray<short> = [];
        const result: FixedArray<short> = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(5);
        expect(result[1]).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0400
     * @tc.name    testBuiltinArrayconcat15004
     * @tc.desc    Test concatenating single-element arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15004";
      try {
        const arr1: FixedArray<short> = [10];
        const arr2: FixedArray<short> = [20];
        const result: FixedArray<short> = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0600
     * @tc.name    testBuiltinArrayconcat15006
     * @tc.desc    Test concatenating arrays with negative values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15006";
      try {
        const arr1: FixedArray<short> = [-1, -2];
        const arr2: FixedArray<short> = [-3, -4];
        const arr3: FixedArray<short> = [-5];
        const result: FixedArray<short> = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(-1);
        expect(result[1]).assertEqual(-2);
        expect(result[2]).assertEqual(-3);
        expect(result[3]).assertEqual(-4);
        expect(result[4]).assertEqual(-5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_CONCAT_0800
     * @tc.name    testBuiltinArrayconcat15008
     * @tc.desc    Test concatenating with no additional arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat15008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArrayconcat15008";
      try {
        const arr1: FixedArray<short> = [5, 10];
        const arr2: FixedArray<short> = [15];
        const result: FixedArray<short> = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(5);
        expect(result[1]).assertEqual(10);
        expect(result[2]).assertEqual(15);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0100
     * @tc.name    testBuiltinArraycopyOf1001
     * @tc.desc    Test copying a non-empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1001";
      try {
        const src: FixedArray<boolean> = [true, false, true];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertTrue();
        expect(result[1]).assertFalse();
        expect(result[2]).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0200
     * @tc.name    testBuiltinArraycopyOf1002
     * @tc.desc    Test copying an empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1002";
      try {
        const src: FixedArray<boolean> = [];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0300
     * @tc.name    testBuiltinArraycopyOf1003
     * @tc.desc    Test copying single-element boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1003";
      try {
        const src: FixedArray<boolean> = [false];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0400
     * @tc.name    testBuiltinArraycopyOf1004
     * @tc.desc    Test copied array is independent from source
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1004";
      try {
        const src: FixedArray<boolean> = [true, true];
        const copy: FixedArray<boolean> = copyOf(src);
        src[0] = false;
        expect(copy[0]).assertTrue();
        expect(copy[1]).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY_2001
     * @tc.name    testBuiltinArraycopyOf2001
     * @tc.desc    Test copying a non-empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf2001";
      try {
        const source: FixedArray<byte> = [1, 2, 3] as FixedArray<byte>;
        const result: FixedArray<byte> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY_2002
     * @tc.name    testBuiltinArraycopyOf2002
     * @tc.desc    Test copying an empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf2002";
      try {
        const source: FixedArray<byte> = [] as FixedArray<byte>;
        const result: FixedArray<byte> = copyOf(source);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY_2003
     * @tc.name    testBuiltinArraycopyOf2003
     * @tc.desc    Test that copied array is a new instance
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf2003";
      try {
        const source: FixedArray<byte> = [4, 5, 6] as FixedArray<byte>;
        const result: FixedArray<byte> = copyOf(source);
        expect(result === source).assertFalse();
        source[0] = 99 as byte;
        expect(result[0]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0600
     * @tc.name    testBuiltinArraycopyOf1006
     * @tc.desc    Test copying array with all true values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1006";
      try {
        const src: FixedArray<boolean> = [true, true, true];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertTrue();
        expect(result[1]).assertTrue();
        expect(result[2]).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0700
     * @tc.name    testBuiltinArraycopyOf1007
     * @tc.desc    Test copying array with all false values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1007";
      try {
        const src: FixedArray<boolean> = [false, false, false];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertFalse();
        expect(result[1]).assertFalse();
        expect(result[2]).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_0800
     * @tc.name    testBuiltinArraycopyOf1008
     * @tc.desc    Test copying array with single true value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf1008";
      try {
        const src: FixedArray<boolean> = [true];
        const result: FixedArray<boolean> = copyOf(src);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY_2009
     * @tc.name    testBuiltinArraycopyOf2009
     * @tc.desc    Test copying array after source modification
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf2009";
      try {
        const source: FixedArray<byte> = [1, 2] as FixedArray<byte>;
        source[0] = 3 as byte;
        source[1] = 4 as byte;
        const result: FixedArray<byte> = copyOf(source);
        expect(result[0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_COPYOF_1200
     * @tc.name    testBuiltinArraycopyOf3002
     * @tc.desc    Test copying empty char array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyOf3002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf3002";
      try {
        const src: FixedArray<char> = [];
        const result: FixedArray<char> = copyOf(src);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7021
     * @tc.name    testBuiltinArrayconcat7021
     * @tc.desc    Test concatenating two integer arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7021";
      try {
        const firstArray: number[] = [1, 2, 3];
        const secondArray: number[] = [4, 5, 6];
        const concatenatedArray = firstArray.concat(secondArray);
        expect(concatenatedArray.length).assertEqual(6);
        expect(concatenatedArray[0]).assertEqual(1);
        expect(concatenatedArray[3]).assertEqual(4);
        expect(concatenatedArray[5]).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7023
     * @tc.name    testBuiltinArrayconcat7023
     * @tc.desc    Test concatenating with empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7023";
      try {
        const dataArray: number[] = [10, 20];
        const emptyArray: number[] = [];
        const result = dataArray.concat(emptyArray);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7024
     * @tc.name    testBuiltinArrayconcat7024
     * @tc.desc    Test concatenating single element array with multiple arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7024";
      try {
        const singleArray: number[] = [100];
        const multiArray: number[] = [200, 300];
        const result = singleArray.concat(multiArray);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(100);
        expect(result[1]).assertEqual(200);
        expect(result[2]).assertEqual(300);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7025
     * @tc.name    testBuiltinArrayconcat7025
     * @tc.desc    Test concatenating string arrays with special characters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7025";
      try {
        const arr1: string[] = ["Hello", "World"];
        const arr2: string[] = ["!", "?"];
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual("Hello");
        expect(result[3]).assertEqual("?");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7026
     * @tc.name    testBuiltinArrayconcat7026
     * @tc.desc    Test concatenating boolean arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7026";
      try {
        const boolArray1: boolean[] = [true, false];
        const boolArray2: boolean[] = [false, true];
        const result = boolArray1.concat(boolArray2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(true);
        expect(result[3]).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7028
     * @tc.name    testBuiltinArrayconcat7028
     * @tc.desc    Test concatenating multiple empty arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7028";
      try {
        const empty1: number[] = [];
        const empty2: number[] = [];
        const empty3: number[] = [];
        const result = empty1.concat(empty2, empty3);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7029
     * @tc.name    testBuiltinArrayconcat7029
     * @tc.desc    Test concatenation preserves element order with mixed array lengths
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7029";
      try {
        const arr1: number[] = [1];
        const arr2: number[] = [2, 3];
        const arr3: number[] = [4];
        const result = arr1.concat(arr2, arr3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7030
     * @tc.name    testBuiltinArrayconcat7030
     * @tc.desc    Test concatenation with single element arrays
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7030";
      try {
        const arr1: string[] = ["a"];
        const arr2: string[] = ["b"];
        const arr3: string[] = ["c"];
        const result = arr1.concat(arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual("a");
        expect(result[1]).assertEqual("b");
        expect(result[2]).assertEqual("c");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_7031
     * @tc.name    testBuiltinArrayconcat7031
     * @tc.desc    Test concatenation with arrays of different lengths
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat7031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat7031";
      try {
        const shortArray: number[] = [10];
        const longArray: number[] = [20, 30, 40];
        const result = shortArray.concat(longArray);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[3]).assertEqual(40);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8021
     * @tc.name    testBuiltinArrayconcat8021
     * @tc.desc    Test concatenation with negative float values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8021";
      try {
        const negativeFloats1: number[] = [-1.5, -2.75];
        const negativeFloats2: number[] = [-3.25];
        const result = negativeFloats1.concat(negativeFloats2);
        expect(result[0]).assertEqual(-1.5);
        expect(result[1]).assertEqual(-2.75);
        expect(result[2]).assertEqual(-3.25);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8022
     * @tc.name    testBuiltinArrayconcat8022
     * @tc.desc    Test concatenation with positive and negative integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8022";
      try {
        const positives: number[] = [10, 20];
        const negatives: number[] = [-30, -40];
        const result = positives.concat(negatives);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(20);
        expect(result[2]).assertEqual(-30);
        expect(result[3]).assertEqual(-40);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8023
     * @tc.name    testBuiltinArrayconcat8023
     * @tc.desc    Test concatenation with very small float values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8023";
      try {
        const smallFloats1: number[] = [0.0001, 0.0002];
        const smallFloats2: number[] = [-0.0003, -0.0004];
        const result = smallFloats1.concat(smallFloats2);
        expect(result[0]).assertEqual(0.0001);
        expect(result[1]).assertEqual(0.0002);
        expect(result[2]).assertEqual(-0.0003);
        expect(result[3]).assertEqual(-0.0004);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8024
     * @tc.name    testBuiltinArrayconcat8024
     * @tc.desc    Test concatenation with large negative float values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8024";
      try {
        const largeNegatives: number[] = [-1000000.5, -2000000.75];
        const moreNegatives: number[] = [-3000000.25];
        const result = largeNegatives.concat(moreNegatives);
        expect(result[0]).assertEqual(-1000000.5);
        expect(result[1]).assertEqual(-2000000.75);
        expect(result[2]).assertEqual(-3000000.25);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8025
     * @tc.name    testBuiltinArrayconcat8025
     * @tc.desc    Test concatenation with mixed float and integer values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8025";
      try {
        const integers: number[] = [-5, 10];
        const floats: number[] = [3.14, -2.718];
        const result = integers.concat(floats);
        expect(result[0]).assertEqual(-5);
        expect(result[1]).assertEqual(10);
        expect(result[2]).assertEqual(3.14);
        expect(result[3]).assertEqual(-2.718);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8026
     * @tc.name    testBuiltinArrayconcat8026
     * @tc.desc    Test concatenation with random positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayconcat8026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8026";
      try {
        const arr1: number[] = [42, 7.5];
        const arr2: number[] = [99, 3.14];
        const result = arr1.concat(arr2);
        expect(result[0]).assertEqual(42);
        expect(result[2]).assertEqual(99);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8027
     * @tc.name    testBuiltinArrayconcat8027
     * @tc.desc    Test concatenation with mixed sign values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat8027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8027";
      try {
        const positives: number[] = [15, 30];
        const negatives: number[] = [-45, -60];
        const result = positives.concat(negatives);
        expect(result[1]).assertEqual(30);
        expect(result[3]).assertEqual(-60);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8028
     * @tc.name    testBuiltinArrayconcat8028
     * @tc.desc    Test concatenation with fractional values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat8028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8028";
      try {
        const fractions: number[] = [0.25, 0.5];
        const moreFractions: number[] = [0.75, 1.0];
        const result = fractions.concat(moreFractions);
        expect(result[0]).assertEqual(0.25);
        expect(result[3]).assertEqual(1.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8029
     * @tc.name    testBuiltinArrayconcat8029
     * @tc.desc    Test concatenation with random integer values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat8029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8029";
      try {
        const first: number[] = [100, 200];
        const second: number[] = [300, 400];
        const result = first.concat(second);
        expect(result[0]).assertEqual(100);
        expect(result[1]).assertEqual(200);
        expect(result[3]).assertEqual(400);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_8030
     * @tc.name    testBuiltinArrayconcat8030
     * @tc.desc    Test concatenation with diverse values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat8030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat8030";
      try {
        const values: number[] = [-3.5, 0, 7.2];
        const moreValues: number[] = [15, -22.8];
        const result = values.concat(moreValues);
        expect(result[1]).assertEqual(0);
        expect(result[4]).assertEqual(-22.8);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9010
     * @tc.name    testBuiltinArrayconcat9010
     * @tc.desc    Test concat method with two number arrays, verify the concatenated array length and last element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9010";
      try {
        const arr1: number[] = [1, 2];
        const arr2: number[] = [3, 4];
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9011
     * @tc.name    testBuiltinArrayconcat9011
     * @tc.desc    Test concat method with a number array and an empty array verify original array remains unchanged
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9011";
      try {
        const arr1: number[] = [10, 20];
        const emptyArr: number[] = [];
        const result = arr1.concat(emptyArr);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9013
     * @tc.name    testBuiltinArrayconcat9013_02
     * @tc.desc    Test concat method with three number arrays verify concatenated array length and elements
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9013_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9013_02";
      try {
        const arr1: number[] = [1, 2];
        const arr2: number[] = [3, 4];
        const arr3: number[] = [5, 6];
        const result = arr1.concat(arr2, arr3);
        expect(result.length).assertEqual(6);
        expect(result[5]).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9017
     * @tc.name    testBuiltinArrayconcat9017
     * @tc.desc    Test concat method with two string arrays and verify concatenated string result
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9017";
      try {
        const words1: string[] = ["Hello"];
        const words2: string[] = ["World"];
        const result = words1.concat(words2);
        expect(result[0] + " " + result[1]).assertEqual("Hello World");
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9016
     * @tc.name    testBuiltinArrayconcat9016
     * @tc.desc    Test that original array remains unchanged after concat operation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9016";
      try {
        const original: number[] = [5, 10];
        const toAdd: number[] = [15];
        original.concat(toAdd);
        expect(original.length).assertEqual(2);
        expect(original[0]).assertEqual(5);
        expect(original[1]).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9015
     * @tc.name    testBuiltinArrayconcat9015
     * @tc.desc    Test concat method with a single-element array and empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9015";
      try {
        const arr: number[] = [100];
        const emptyArr: number[] = [];
        const result = arr.concat(emptyArr);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(100);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9019
     * @tc.name    testBuiltinArrayconcat9019
     * @tc.desc    Test concat method with large arrays (100 elements each) and verify all elements
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9019";
      try {
        const bigArray1: number[] = [];
        const bigArray2: number[] = [];
        for (let i = 0; i < 100; i++) {
          bigArray1.push(i);
          bigArray2.push(i + 100);
        }
        const result = bigArray1.concat(bigArray2);
        expect(result.length).assertEqual(200);
        expect(result[0]).assertEqual(0);
        expect(result[99]).assertEqual(99);
        expect(result[100]).assertEqual(100);
        expect(result[199]).assertEqual(199);
        expect(result[50]).assertEqual(50);
        expect(result[150]).assertEqual(150);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_9022
     * @tc.name    testBuiltinArrayconcat9022
     * @tc.desc    Test that modifying concatenated result doesn't affect original arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat9022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayconcat9022";
      try {
        const original: number[] = [100, 200, 300];
        const toAdd: number[] = [400, 500];
        const result = original.concat(toAdd);
        result[0] = 999;
        result[4] = 888;
        expect(original.length).assertEqual(3);
        expect(original[0]).assertEqual(100);
        expect(original[1]).assertEqual(200);
        expect(original[2]).assertEqual(300);
        expect(toAdd.length).assertEqual(2);
        expect(toAdd[0]).assertEqual(400);
        expect(toAdd[1]).assertEqual(500);
        expect(result[0]).assertEqual(999);
        expect(result[4]).assertEqual(888);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
	
    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0200_01
     * @tc.name    testBuiltinArrayconcat0002
     * @tc.desc    Testing concatenation with an empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat0002";
      try {
        let arr1: FixedArray<boolean> = [true, false];
        let arr2: FixedArray<boolean> = [];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0300_01
     * @tc.name    testBuiltinArrayconcat0003
     * @tc.desc    Testing concatenation with multiple arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat0003";
      try {
        let arr1: FixedArray<boolean> = [true];
        let arr2: FixedArray<boolean> = [false];
        let arr3: FixedArray<boolean> = [true, true];
        let result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0400_01
     * @tc.name    testBuiltinArrayconcat0004
     * @tc.desc    Testing concatenation with only one array (no additional arrays)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat0004";
      try {
        let arr1: FixedArray<boolean> = [true, false, true];
        let result = concat(arr1);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0100
     * @tc.name    testBuiltinArrayconcat1001
     * @tc.desc    Test basic concatenation of two boolean arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat1001";
      try {
        let arr1: FixedArray<boolean> = [true, false];
        let arr2: FixedArray<boolean> = [false, true];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(false);
        expect(result[3]).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0200_02
     * @tc.name    testBuiltinArrayconcat102
     * @tc.desc    Test concatenation with one empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat102";
      try {
        let arr1: FixedArray<boolean> = [true, false];
        let arr2: FixedArray<boolean> = [];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0300_02
     * @tc.name    testBuiltinArrayconcat10003
     * @tc.desc    Test concatenation with multiple arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat10003";
      try {
        let arr1: FixedArray<boolean> = [true];
        let arr2: FixedArray<boolean> = [false];
        let arr3: FixedArray<boolean> = [true, true];
        let arr4: FixedArray<boolean> = [false, false];
        let result = concat(arr1, arr2, arr3, arr4);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(true);
        expect(result[4]).assertEqual(false);
        expect(result[5]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0400_02
     * @tc.name    testBuiltinArrayconcat10004
     * @tc.desc    Test concatenation of single-element arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat10004";
      try {
        let arr1: FixedArray<boolean> = [true];
        let arr2: FixedArray<boolean> = [false];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0500_01
     * @tc.name    testBuiltinArrayconcat10005
     * @tc.desc    Test concatenation with all true values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat10005";
      try {
        let arr1: FixedArray<boolean> = [true, true];
        let arr2: FixedArray<boolean> = [true];
        let arr3: FixedArray<boolean> = [true, true, true];
        let result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(6);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(true);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0100_02
     * @tc.name    testBuiltinArrayconcat20001
     * @tc.desc    Testing basic concatenation of two byte arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat20001";
      try {
        let arr1: FixedArray<byte> = [1, 2, 3];
        let arr2: FixedArray<byte> = [4, 5, 6];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(1);
        expect(result[3]).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0200
     * @tc.name    testBuiltinArrayconcat20002
     * @tc.desc    Testing concatenation with an empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat20002";
      try {
        let arr1: FixedArray<byte> = [1, 2, 3];
        let arr2: FixedArray<byte> = [];
        let result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0300_01
     * @tc.name    testBuiltinArrayconcat20003
     * @tc.desc    Testing concatenation with multiple arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat20003";
      try {
        let arr1: FixedArray<byte> = [1];
        let arr2: FixedArray<byte> = [2, 3];
        let arr3: FixedArray<byte> = [4, 5, 6];
        let result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(6);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[5]).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0400
     * @tc.name    testBuiltinArrayconcat20004
     * @tc.desc    Testing concatenation with only one array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat20004";
      try {
        let arr1: FixedArray<byte> = [1, 2, 3];
        let result = concat(arr1);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_CONCAT_0500
     * @tc.name    testBuiltinArrayconcat20005
     * @tc.desc    Testing concatenation with single-element arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat20005";
      try {
        let arr1: FixedArray<byte> = [1];
        let arr2: FixedArray<byte> = [2];
        let arr3: FixedArray<byte> = [3];
        let result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BYTEARRAY_CONCAT_0100
     * @tc.name    testBuiltinArrayconcat30001
     * @tc.desc    Test concatenation of two byte arrays with predefined data.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat30001";
      try {
        let a: FixedArray<byte> = [0x01, 0x02] as FixedArray<byte>;
        let b: FixedArray<byte> = [0x03, 0x04] as FixedArray<byte>;
        let result = concat(a, b);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(0x01);
        expect(result[3]).assertEqual(0x04);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BYTEARRAY_CONCAT_0200
     * @tc.name    testBuiltinArrayconcat30002
     * @tc.desc    Test concatenation with an empty predefined byte array.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat30002";
      try {
        let a: FixedArray<byte> = [] as FixedArray<byte>;
        let b: FixedArray<byte> = [0x01, 0x02] as FixedArray<byte>;
        let result = concat(a, b);
        expect(result.length).assertEqual(2);
        expect(result[1]).assertEqual(0x02);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BYTEARRAY_CONCAT_0300
     * @tc.name    testBuiltinArrayconcat30003
     * @tc.desc    Test concatenation with multiple predefined byte arrays.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat30003";
      try {
        let a: FixedArray<byte> = [0x01] as FixedArray<byte>;
        let b: FixedArray<byte> = [0x02] as FixedArray<byte>;
        let c: FixedArray<byte> = [0x03] as FixedArray<byte>;
        let result = concat(a, b, c);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(0x03);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BYTEARRAY_CONCAT_0400
     * @tc.name    testBuiltinArrayconcat30004
     * @tc.desc    Verify the order of concatenated predefined byte arrays.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat30004";
      try {
        let a: FixedArray<byte> = [0x01] as FixedArray<byte>;
        let b: FixedArray<byte> = [0x02] as FixedArray<byte>;
        let result = concat(a, b);
        expect(result[0]).assertEqual(0x01);
        expect(result[1]).assertEqual(0x02);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BYTEARRAY_CONCAT_0500
     * @tc.name    testBuiltinArrayconcat30005
     * @tc.desc    Verify the length of concatenated large predefined byte arrays.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayconcat30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayconcat30005";
      try {
        let a: FixedArray<byte> = [0x00, 0x00, 0x00, 0x00, 0x00] as FixedArray<byte>;
        let b: FixedArray<byte> = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00] as FixedArray<byte>;
        let result = concat(a, b);
        expect(result.length).assertEqual(11);  5 + 6
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

  });
}