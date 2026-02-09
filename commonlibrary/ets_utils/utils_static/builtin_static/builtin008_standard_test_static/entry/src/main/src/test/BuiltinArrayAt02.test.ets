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

export default function BuiltinArrayAt02Test() {
  describe("BuiltinArrayAt02Test", (): void => {
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
     * @tc.number TESTBUILTINARRAYCONCAT8_0100_01
     * @tc.name   TESTBUILTINARRAYCONCAT8001
     * @tc.desc   Test basic concatenation of two float arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT8001";
      try {
        const arr1: FixedArray<float> = [1.5, 2.5];
        const arr2: FixedArray<float> = [3.5];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT81_0100
     * @tc.name   TESTBUILTINARRAYCONCAT8101
     * @tc.desc   Test basic concatenation of two float arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT8101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT8101";
      try {
        const arr1: FixedArray<float> = [1.5, 2.5];
        const arr2: FixedArray<float> = [3.5];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT81_0104
     * @tc.name   TESTBUILTINARRAYCONCAT8104
     * @tc.desc   Test concatenation with negative float values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT8104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT8104";
      try {
        const arr1: FixedArray<float> = [-1.5f];
        const arr2: FixedArray<float> = [-2.5f];
        const result = concat(arr1, arr2);
        expect(result[1]).assertEqual(-2.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT82_0100
     * @tc.name   TESTBUILTINARRAYCONCAT8201
     * @tc.desc   Test basic concatenation of two float arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT8201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT8201";
      try {
        const arr1: FixedArray<float> = [1.5, 2.5];
        const arr2: FixedArray<float> = [3.5];
        const result = concat(arr1, arr2);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT8_0100_02
     * @tc.name   TESTBUILTINARRAYCONCAT8010
     * @tc.desc   Test concatenation with mixed size arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT8010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT8010";
      try {
        const arr1: FixedArray<float> = [1.0];
        const arr2: FixedArray<float> = [2.0, 3.0, 4.0];
        const arr3: FixedArray<float> = [5.0];
        const result = concat(arr1, arr2, arr3);
        expect(result.length).assertEqual(5);
        expect(result[4]).assertEqual(5.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number TESTBUILTINARRAYCONCAT9_0300
     * @tc.name   TESTBUILTINARRAYCONCAT9003
     * @tc.desc   Test the case with a variable parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('TESTBUILTINARRAYCONCAT9003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "TESTBUILTINARRAYCONCAT9003";
      try {
        const first: FixedArray<float> = [1.0];
        const second: FixedArray<float> = [2.0];
        const third: FixedArray<float> = [3.0];
        const result = concat(first, second, third);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0100
     * @tc.name   testBuiltinArraycopyOf4001
     * @tc.desc   Test copying double array with positive values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4001";
      try {
        const source: FixedArray<double> = [1.5, 2.25, 3.75] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1.5);
        expect(result[1]).assertEqual(2.25);
        expect(result[2]).assertEqual(3.75);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0200
     * @tc.name   testBuiltinArraycopyOf4002
     * @tc.desc   Test copying double array with negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4002";
      try {
        const source: FixedArray<double> = [-4.8, -0.5, -100.75] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(-4.8);
        expect(result[1]).assertEqual(-0.5);
        expect(result[2]).assertEqual(-100.75);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0300
     * @tc.name   testBuiltinArraycopyOf4003
     * @tc.desc   Test copying double array with mixed values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4003";
      try {
        const source: FixedArray<double> = [0.0, -0.0, 1e-10, 1e10, 3.1415926535] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0.0);
        expect(result[1]).assertEqual(-0.0);
        expect(result[2]).assertEqual(1e-10);
        expect(result[3]).assertEqual(1e10);
        expect(result[4]).assertEqual(3.1415926535);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0400
     * @tc.name   testBuiltinArraycopyOf4004
     * @tc.desc   Test copying large double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4004";
      try {
        const size = 1000;
        const source: FixedArray<double> = new FixedArray<double>(size);
        for (let i = 0; i < size; i++) {
          source[i] = i * 0.1;
        }
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(size);
        for (let i = 0; i < size; i++) {
          expect(result[i]).assertEqual(i * 0.1);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0500
     * @tc.name   testBuiltinArraycopyOf4005
     * @tc.desc   Test double array copy independence
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4005";
      try {
        const source: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        source[0] = 9.9;
        result[1] = 8.8;
        expect(source[0]).assertEqual(9.9);
        expect(source[1]).assertEqual(2.2);
        expect(source[2]).assertEqual(3.3);
        expect(result[0]).assertEqual(1.1);
        expect(result[1]).assertEqual(8.8);
        expect(result[2]).assertEqual(3.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0600
     * @tc.name   testBuiltinArraycopyOf4006
     * @tc.desc   Test copying double array with special values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4006";
      try {
        const source: FixedArray<double> = [
          Number.NaN,
          Number.POSITIVE_INFINITY,
          Number.NEGATIVE_INFINITY,
          Number.MAX_VALUE,
          Number.MIN_VALUE
        ] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(5);
        expect(Number.isNaN(result[0])).assertTrue();
        expect(result[1]).assertEqual(Number.POSITIVE_INFINITY);
        expect(result[2]).assertEqual(Number.NEGATIVE_INFINITY);
        expect(result[3]).assertEqual(Number.MAX_VALUE);
        expect(result[4]).assertEqual(Number.MIN_VALUE);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0700
     * @tc.name   testBuiltinArraycopyOf4007
     * @tc.desc   Test copying double array with integer values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4007";
      try {
        const source: FixedArray<double> = [10.0, 20.0, 30.0] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(10.0);
        expect(result[1]).assertEqual(20.0);
        expect(result[2]).assertEqual(30.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0800
     * @tc.name   testBuiltinArraycopyOf4008
     * @tc.desc   Test copying array with very small double values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4008";
      try {
        const source: FixedArray<double> = [
          1e-308,
          -1e-308,
          5e-324
        ] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1e-308);
        expect(result[1]).assertEqual(-1e-308);
        expect(result[2]).assertEqual(5e-324);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_0900
     * @tc.name   testBuiltinArraycopyOf4009
     * @tc.desc   Test copying array with precision-sensitive values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4009";
      try {
        const source: FixedArray<double> = [
          0.1 + 0.2,
          0.3 - 0.1,
          1.0 / 3.0
        ] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(0.1 + 0.2);
        expect(result[1]).assertEqual(0.3 - 0.1);
        expect(result[2]).assertEqual(1.0 / 3.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_1000
     * @tc.name   testBuiltinArraycopyOf4010
     * @tc.desc   Test copying array with duplicate values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4010";
      try {
        const source: FixedArray<double> = [3.14, 3.14, 3.14, 3.14] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(4);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(3.14);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_1100
     * @tc.name   testBuiltinArraycopyOf4011
     * @tc.desc   Test copying array after multiple modifications
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4011";
      try {
        const source: FixedArray<double> = [1.0, 2.0, 3.0] as FixedArray<double>;
        source[0] = 4.0;
        source[1] = 5.0;
        source[2] = 6.0;
        const result1: FixedArray<double> = copyOf(source);
        source[0] = 7.0;
        const result2: FixedArray<double> = copyOf(source);
        expect(result1[0]).assertEqual(4.0);
        expect(result1[1]).assertEqual(5.0);
        expect(result1[2]).assertEqual(6.0);
        expect(result2[0]).assertEqual(7.0);
        expect(result2[1]).assertEqual(5.0);
        expect(result2[2]).assertEqual(6.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY4_1200
     * @tc.name   testBuiltinArraycopyOf4012
     * @tc.desc   Test copying array with extreme value ranges
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf4012";
      try {
        const source: FixedArray<double> = [
          Number.MIN_SAFE_INTEGER,
          Number.MAX_SAFE_INTEGER,
          Number.MIN_VALUE,
          Number.MAX_VALUE
        ] as FixedArray<double>;
        const result: FixedArray<double> = copyOf(source);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(Number.MIN_SAFE_INTEGER);
        expect(result[1]).assertEqual(Number.MAX_SAFE_INTEGER);
        expect(result[2]).assertEqual(Number.MIN_VALUE);
        expect(result[3]).assertEqual(Number.MAX_VALUE);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0100
     * @tc.name   testBuiltinArraycopyOf5001
     * @tc.desc   Test copying non-empty float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [1.0f, 2.0f, 3.0f];
      const copy = copyOf(src);
      expect(copy.length).assertEqual(src.length);
      for (let i = 0; i < src.length; i++) {
        expect(copy[i]).assertEqual(src[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0200
     * @tc.name   testBuiltinArraycopyOf5002
     * @tc.desc   Test copying empty float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [];
      const copy = copyOf(src);
      expect(copy.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0300
     * @tc.name   testBuiltinArraycopyOf5003
     * @tc.desc   Test that copy is a new instance
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [4.0f, 5.0f, 6.0f];
      const copy = copyOf(src);
      copy[0] = 9.0f;
      expect(src[0]).assertEqual(4.0);
      expect(copy[0]).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0400
     * @tc.name   testBuiltinArraycopyOf5004
     * @tc.desc   Test copying array with single element
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [7.5f];
      const copy = copyOf(src);
      expect(copy.length).assertEqual(1);
      expect(copy[0]).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0500
     * @tc.name   testBuiltinArraycopyOf5005
     * @tc.desc   Test copying array with negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [-1.5f, -2.0f, -3.5f];
      const copy = copyOf(src);
      expect(copy.length).assertEqual(3);
      expect(copy[0]).assertEqual(-1.5);
      expect(copy[1]).assertEqual(-2.0);
      expect(copy[2]).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF5_0600
     * @tc.name   testBuiltinArraycopyOf5006
     * @tc.desc   Test copying array with mixed positive/negative/zero values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf5006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const src: FixedArray<float> = [0.0f, -0.5f, 100.0f];
      const copy = copyOf(src);
      expect(copy[0]).assertEqual(0.0);
      expect(copy[1]).assertEqual(-0.5);
      expect(copy[2]).assertEqual(100.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY6_0100
     * @tc.name   testBuiltinArraycopyOf6001
     * @tc.desc   Test copying positive integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf6001";
      try {
        const source: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        const result: FixedArray<int> = copyOf(source);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY6_0200
     * @tc.name   testBuiltinArraycopyOf6002
     * @tc.desc   Test copying negative integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf6002";
      try {
        const source: FixedArray<int> = [-10, -20, -30] as FixedArray<int>;
        const result: FixedArray<int> = copyOf(source);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY6_0300
     * @tc.name   testBuiltinArraycopyOf6003
     * @tc.desc   Test copying mixed integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf6003";
      try {
        const source: FixedArray<int> = [0, -100, 100, 999, -999] as FixedArray<int>;
        const result: FixedArray<int> = copyOf(source);
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(-100);
        expect(result[2]).assertEqual(100);
        expect(result[3]).assertEqual(999);
        expect(result[4]).assertEqual(-999);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY6_0400
     * @tc.name   testBuiltinArraycopyOf6004
     * @tc.desc   Test copying large integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf6004";
      try {
        const size = 1000;
        const source: FixedArray<int> = new FixedArray<int>(size);
        for (let i = 0; i < size; i++) {
          source[i] = i;
        }
        const result: FixedArray<int> = copyOf(source);
        expect(result.length).assertEqual(size);
        for (let i = 0; i < size; i++) {
          expect(result[i]).assertEqual(i);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_ARRAY_COPY6_0500
     * @tc.name   testBuiltinArraycopyOf6005
     * @tc.desc   Test integer array copy independence
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG: string = "testBuiltinArraycopyOf6005";
      try {
        const source: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        const result: FixedArray<int> = copyOf(source);
        source[0] = 99;
        result[1] = 88;
        expect(source[0]).assertEqual(99);
        expect(source[1]).assertEqual(20);
        expect(source[2]).assertEqual(30);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(88);
        expect(result[2]).assertEqual(30);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_0600
     * @tc.name   testBuiltinArraycopyOf6006
     * @tc.desc   Test normal array copy functionality
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6006";
      try {
        const src: FixedArray<boolean> = [true, false, true];
        const result = copyOf(src);
        expect(result.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          expect(result[i]).assertEqual(src[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_0700
     * @tc.name   testBuiltinArraycopyOf6007
     * @tc.desc   Test copying empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6007";
      try {
        const src: FixedArray<boolean> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_0800
     * @tc.name   testBuiltinArraycopyOf6008
     * @tc.desc   Test copied array independence from source
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6008";
      try {
        const src: FixedArray<boolean> = [true, false];
        const result = copyOf(src);
        src[0] = false;
        src[1] = true;
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_0900
     * @tc.name   testBuiltinArraycopyOf6009
     * @tc.desc   Test copying large array (1024 elements)
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6009', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6009";
      try {
        const size = 1024;
        const src: FixedArray<boolean> = new FixedArray<boolean>(size);
        for (let i = 0; i < size; i++) {
          src[i] = (i % 2 === 0);
        }
        const result = copyOf(src);
        expect(result.length).assertEqual(size);
        for (let i = 0; i < size; i++) {
          if (result[i] !== (i % 2 === 0)) {
            throw new Error(`Element mismatch at index ${i}`);
          }
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_1100
     * @tc.name   testBuiltinArraycopyOf6011
     * @tc.desc   Test copying single-element byte array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6011";
      try {
        const src: FixedArray<byte> = [0x7F];
        const result = copyOf(src);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(0x7F);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COPYTO_BASIC6_1200
     * @tc.name   testBuiltinArraycopyOf6012
     * @tc.desc   Test basic copy operation with small arrays
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6012";
      try {
        const src: number[] = [1, 2, 3];
        const dst: number[] = [0, 0, 0];
        dst.copyWithin(0, 0, src.length);
        for (let i = 0; i < src.length; i++) {
          dst[i] = src[i];
        }
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COPYTO_PARTIAL6_1300
     * @tc.name   testBuiltinArraycopyOf6013
     * @tc.desc   Test partial copy with source and destination offsets
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6013";
      try {
        const src: number[] = [10, 20, 30, 40, 50];
        const dst: number[] = [0, 0, 0, 0, 0];
        const srcStart = 1;
        const dstStart = 2;
        const length = 3;
        for (let i = 0; i < length; i++) {
          dst[dstStart + i] = src[srcStart + i];
        }
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(20);
        expect(dst[3]).assertEqual(30);
        expect(dst[4]).assertEqual(40);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COPYTO_EMPTY6_1400
     * @tc.name   testBuiltinArraycopyOf6014
     * @tc.desc   Test copy operation with zero length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6014";
      try {
        const src: number[] = [99, 100];
        let dst: number[] = [1, 2];
        dst = dst.slice();
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_COPYTO_BOUNDARY6_1500
     * @tc.name   testBuiltinArraycopyOf6015
     * @tc.desc   Test handling of min/max values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6015";
      try {
        const src: number[] = [Number.MIN_VALUE, Number.MAX_VALUE];
        const dst: number[] = [0, 0];
        dst[0] = src[0];
        dst[1] = src[1];
        expect(dst[0]).assertEqual(Number.MIN_VALUE);
        expect(dst[1]).assertEqual(Number.MAX_VALUE);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_1600
     * @tc.name   testBuiltinArraycopyOf6016
     * @tc.desc   Test basic array creation and access
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6016";
      try {
        const arr: number[] = [1, 2, 3, 4, 5];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_1700
     * @tc.name   testBuiltinArraycopyOf6017
     * @tc.desc   Test array element assignment
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6017";
      try {
        const arr: number[] = [10, 20, 30];
        arr[1] = 200;
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(200);
        expect(arr[2]).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_1800
     * @tc.name   testBuiltinArraycopyOf6018
     * @tc.desc   Test array iteration
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6018";
      try {
        const src: number[] = [1, 2, 3, 4, 5];
        let sum = 0;
        for (let i = 0; i < src.length; i++) {
          sum += src[i];
        }
        expect(sum).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_1900
     * @tc.name   testBuiltinArraycopyOf6019
     * @tc.desc   Test array concatenation
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6019";
      try {
        const arr1: number[] = [1, 2];
        const arr2: number[] = [3, 4];
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2000
     * @tc.name   testBuiltinArraycopyOf6020
     * @tc.desc   Test array includes method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6020";
      try {
        const arr: number[] = [10, 20, 30, 40, 50];
        expect(arr.includes(20)).assertTrue();
        expect(arr.includes(25)).assertFalse();
        expect(arr.includes(30, 2)).assertTrue();
        expect(arr.includes(30, 3)).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_STRING_CONCAT6_2100
     * @tc.name   testBuiltinArraycopyOf6021
     * @tc.desc   Test string concatenation
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6021";
      try {
        const str1: string = "Hello";
        const str2: string = "ETS";
        const result = `${str1} ${str2}`;
        expect(result).assertEqual("Hello ETS");
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2200
     * @tc.name   testBuiltinArraycopyOf6022
     * @tc.desc   Test copying empty byte array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6022";
      try {
        const src: FixedArray<byte> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2300
     * @tc.name   testBuiltinArraycopyOf6023
     * @tc.desc   Test copying multi-element byte array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6023";
      try {
        const src: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04];
        const result = copyOf(src);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(0x01);
        expect(result[3]).assertEqual(0x04);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2400
     * @tc.name   testBuiltinArraycopyOf6024
     * @tc.desc   Test copying array with byte min value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6024";
      try {
        const src: FixedArray<byte> = [0x00];
        const result = copyOf(src);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(0x00);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2500
     * @tc.name   testBuiltinArraycopyOf6025
     * @tc.desc   Test copying double array with various values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6025";
      try {
        const src: FixedArray<double> = [
          0.0,
          -0.0,
          3.1415926535,
          -2.7182818284,
          Number.MAX_VALUE,
          Number.MIN_VALUE,
          Number.POSITIVE_INFINITY,
          Number.NEGATIVE_INFINITY,
          Number.NaN
        ];
        const result = copyOf(src);
        expect(result.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          if (Number.isNaN(src[i])) {
            expect(Number.isNaN(result[i])).assertTrue();
          } else {
            expect(result[i]).assertEqual(src[i]);
          }
        }
        expect(result[2]).assertEqual(3.1415926535);
        expect(result[3]).assertEqual(-2.7182818284);
        expect(result[4]).assertEqual(Number.MAX_VALUE);
        expect(result[5]).assertEqual(Number.MIN_VALUE);
        expect(result[6]).assertEqual(Number.POSITIVE_INFINITY);
        expect(result[7]).assertEqual(Number.NEGATIVE_INFINITY);
        expect(Number.isNaN(result[8])).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2600
     * @tc.name   testBuiltinArraycopyOf6026
     * @tc.desc   Test normal array copy functionality
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6026";
      try {
        const src: FixedArray<boolean> = [true, false, true];
        const result = copyOf(src);
        expect(result.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          expect(result[i]).assertEqual(src[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2700
     * @tc.name   testBuiltinArraycopyOf6027
     * @tc.desc   Test copying empty float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6027";
      try {
        const src: FixedArray<float> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2800
     * @tc.name   testBuiltinArraycopyOf6028
     * @tc.desc   Test copying array with special float values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6028";
      try {
        const src: FixedArray<float> = [
          Number.NaN as float,
          Number.POSITIVE_INFINITY as float,
          Number.NEGATIVE_INFINITY as float
        ];
        const result = copyOf(src);
        expect(Number.isNaN(result[0])).assertTrue();
        expect(result[1]).assertEqual(Number.POSITIVE_INFINITY);
        expect(result[2]).assertEqual(Number.NEGATIVE_INFINITY);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF6_2900
     * @tc.name   testBuiltinArraycopyOf6029
     * @tc.desc   Test array iteration
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf6029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf6029";
      try {
        const testArray: number[] = [1, 2, 3, 4, 5];
        let iterationSum = 0;
        for (let i = 0; i < testArray.length; i++) {
          iterationSum += testArray[i];
        }
        expect(iterationSum).assertEqual(15);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0100_01
     * @tc.name   testBuiltinArraycopyOf7001_01
     * @tc.desc   Test copying non-empty long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7001_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7001_01";
      try {
        const src: FixedArray<long> = [100000, 200000, 300000];
        const copy = copyOf(src);
        expect(copy.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          expect(copy[i]).assertEqual(src[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0100
     * @tc.name   testBuiltinArraycopyOf7001_02
     * @tc.desc   Test copying non-empty long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7001_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7001_02";
      try {
        const src: FixedArray<long> = [100000, 200000, 300000];
        const copy = copyOf(src);
        expect(copy.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          expect(copy[i]).assertEqual(src[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0200
     * @tc.name   testBuiltinArraycopyOf7002
     * @tc.desc   Test copying empty long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7002";
      try {
        const src: FixedArray<long> = [];
        const copy = copyOf(src);
        expect(copy.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0300
     * @tc.name   testBuiltinArraycopyOf7003
     * @tc.desc   Test that copy is a new instance (long array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7003";
      try {
        const src: FixedArray<long> = [400000, 500000, 600000];
        const copy = copyOf(src);
        copy[0] = 900000;
        expect(src[0]).assertEqual(400000);
        expect(copy[0]).assertEqual(900000);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0400
     * @tc.name   testBuiltinArraycopyOf7004
     * @tc.desc   Test copying array with negative long values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7004";
      try {
        const src: FixedArray<long> = [-100000, -200000, -300000];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(-100000);
        expect(copy[1]).assertEqual(-200000);
        expect(copy[2]).assertEqual(-300000);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0500
     * @tc.name   testBuiltinArraycopyOf7005
     * @tc.desc   Test copying array with mixed long values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7005";
      try {
        const src: FixedArray<long> = [0, -500000, 9999999];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(0);
        expect(copy[1]).assertEqual(-500000);
        expect(copy[2]).assertEqual(9999999);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0600
     * @tc.name   testBuiltinArraycopyOf7006
     * @tc.desc   Test copying array with long boundary values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7006";
      try {
        const src: FixedArray<long> = [Number.MIN_SAFE_INTEGER as long, 0 as long, Number.MAX_SAFE_INTEGER as long];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(Number.MIN_SAFE_INTEGER);
        expect(copy[1]).assertEqual(0);
        expect(copy[2]).assertEqual(Number.MAX_SAFE_INTEGER);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0800
     * @tc.name   testBuiltinArraycopyOf7008
     * @tc.desc   Test copying array with duplicate values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7008";
      try {
        const src: FixedArray<long> = [123456, 123456, 123456];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(123456);
        expect(copy[1]).assertEqual(123456);
        expect(copy[2]).assertEqual(123456);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_0900
     * @tc.name   testBuiltinArraycopyOf7009
     * @tc.desc   Test copying array after modifying source
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7009";
      try {
        const src: FixedArray<long> = [100, 200, 300];
        const copy = copyOf(src);
        src[0] = 999;
        expect(copy[0]).assertEqual(100);
        expect(copy[1]).assertEqual(200);
        expect(copy[2]).assertEqual(300);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF7_1000
     * @tc.name   testBuiltinArraycopyOf7010
     * @tc.desc   Test copying array with alternating positive/negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf7010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf7010";
      try {
        const src: FixedArray<long> = [1000000, -2000000, 3000000, -4000000];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(1000000);
        expect(copy[1]).assertEqual(-2000000);
        expect(copy[2]).assertEqual(3000000);
        expect(copy[3]).assertEqual(-4000000);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF8_0200
     * @tc.name   testBuiltinArraycopyOf8002
     * @tc.desc   Test a copy of the array of base types
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf8002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf8002";
      try {
        const src: FixedArray<number> = [1, 2, 3];
        const result = copyOf(src);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPY_OF8_0300
     * @tc.name   testBuiltinArraycopyOf8003
     * @tc.desc   Modifications made after the test copy do not affect the original array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf8003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf8003";
      try {
        const src: FixedArray<number> = [1, 2, 3];
        const result = copyOf(src);
        result[0] = 99;
        expect(src[0]).assertEqual(1);
        expect(result[0]).assertEqual(99);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0100
     * @tc.name   testBuiltinArraycopyOf9001
     * @tc.desc   Test copying non-empty short array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9001";
      try {
        const src: FixedArray<short> = [100, 200, 300];
        const copy = copyOf(src);
        expect(copy.length).assertEqual(src.length);
        for (let i = 0; i < src.length; i++) {
          expect(copy[i]).assertEqual(src[i]);
        }
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0200
     * @tc.name   testBuiltinArraycopyOf9002
     * @tc.desc   Test copying empty short array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9002";
      try {
        const src: FixedArray<short> = [];
        const copy = copyOf(src);
        expect(copy.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0300
     * @tc.name   testBuiltinArraycopyOf9003
     * @tc.desc   Test that copy is a new instance (short array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9003";
      try {
        const src: FixedArray<short> = [400, 500, 600];
        const copy = copyOf(src);
        copy[0] = 900;
        expect(src[0]).assertEqual(400);
        expect(copy[0]).assertEqual(900);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0400
     * @tc.name   testBuiltinArraycopyOf9004
     * @tc.desc   Test copying array with negative short values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9004";
      try {
        const src: FixedArray<short> = [-100, -200, -300];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(-100);
        expect(copy[1]).assertEqual(-200);
        expect(copy[2]).assertEqual(-300);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0600
     * @tc.name   testBuiltinArraycopyOf9006
     * @tc.desc   Test copying array with mixed short values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9006";
      try {
        const src: FixedArray<short> = [0, -500, 999];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(0);
        expect(copy[1]).assertEqual(-500);
        expect(copy[2]).assertEqual(999);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0800
     * @tc.name   testBuiltinArraycopyOf9008
     * @tc.desc   Test copying array with duplicate values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9008";
      try {
        const src: FixedArray<short> = [123, 123, 123];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(123);
        expect(copy[1]).assertEqual(123);
        expect(copy[2]).assertEqual(123);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_0900
     * @tc.name   testBuiltinArraycopyOf9009
     * @tc.desc   Test copying array after modifying source
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9009";
      try {
        const src: FixedArray<short> = [10, 20, 30];
        const copy = copyOf(src);
        src[0] = 99;
        expect(copy[0]).assertEqual(10);
        expect(copy[1]).assertEqual(20);
        expect(copy[2]).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_OF9_1000
     * @tc.name   testBuiltinArraycopyOf9010
     * @tc.desc   Test copying array with alternating positive/negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyOf9010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArraycopyOf9010";
      try {
        const src: FixedArray<short> = [100, -200, 300, -400];
        const copy = copyOf(src);
        expect(copy[0]).assertEqual(100);
        expect(copy[1]).assertEqual(-200);
        expect(copy[2]).assertEqual(300);
        expect(copy[3]).assertEqual(-400);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_FIXEDARRAY_AT7_0600
     * @tc.name   testBuiltinArrayAt70006
     * @tc.desc   Testing at() with negative index equal to -0.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt70006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt70006";
      try {
        let arr: FixedArray<double> = [9.9];
        let result = at(arr, -0);
        expect(result).assertEqual(9.9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_FIXEDARRAY_AT7_1300
     * @tc.name   testBuiltinArrayAt70013
     * @tc.desc   Testing at() on single-element array with index 0 and -1.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt70013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt70013";
      try {
        let arr: FixedArray<double> = [99.9];
        expect(at(arr, 0)).assertEqual(99.9);
        expect(at(arr, -1)).assertEqual(99.9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_FIXEDARRAY_AT7_1400
     * @tc.name   testBuiltinArrayAt70014
     * @tc.desc   Testing at() with array of NaN values.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt70014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt70014";
      try {
        let arr: FixedArray<double> = [NaN, NaN];
        let result = at(arr, 1);
        expect(isNaN(result as number)).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_FIXEDARRAY_AT7_1500
     * @tc.name   testBuiltinArrayAt70015
     * @tc.desc   Testing at() with index -0 handled same as 0.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt70015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt70015";
      try {
        let arr: FixedArray<double> = [123.456];
        expect(at(arr, -0)).assertEqual(123.456);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_AT8_1100
     * @tc.name   testBuiltinArrayAt80011
     * @tc.desc   Test at() with negative index exactly at -length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt80011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt80011";
      try {
        let arr: FixedArray<float> = [10.0, 20.0, 30.0];
        let result = at(arr, -3);
        expect(result).assertEqual(10.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_AT9_0600
     * @tc.name   testBuiltinArrayAt90006
     * @tc.desc   Test at() with index -0 (returns first element)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayAt90006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayAt90006";
      try {
        let arr: FixedArray<float> = [99.0, 88.0];
        let result = at(arr, -0);
        expect(result).assertEqual(99.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_011
     * @tc.name    test_array_at_011
     * @tc.desc    Test at() with single-element array and index 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_011";
        try {
            let arr: FixedArray<int> = [42];
            let result = at(arr, 0);
            expect(result).assertEqual(42);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_012
     * @tc.name    test_array_at_012
     * @tc.desc    Test at() with single-element array and index -1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_012";
        try {
            let arr: FixedArray<int> = [42];
            let result = at(arr, -1);
            expect(result).assertEqual(42);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_013
     * @tc.name    test_array_at_013
     * @tc.desc    Test at() with boundary index (length - 1)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_013";
        try {
            let arr: FixedArray<int> = [7, 8, 9];
            let result = at(arr, 2);
            expect(result).assertEqual(9);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_014
     * @tc.name    test_array_at_014
     * @tc.desc    Test at() with boundary negative index (-length)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_014";
        try {
            let arr: FixedArray<int> = [7, 8, 9];
            let result = at(arr, -3);
            expect(result).assertEqual(7);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_015
     * @tc.name    test_array_at_015
     * @tc.desc    Test consecutive calls with different indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_015";
        try {
            let arr: FixedArray<int> = [100, 200, 300];
            expect(at(arr, 0)).assertEqual(100);
            expect(at(arr, 1)).assertEqual(200);
            expect(at(arr, -1)).assertEqual(300);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_016
     * @tc.name    test_array_at_016
     * @tc.desc    Test at() with large array and middle index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_016";
        try {
            let arr: FixedArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            let result = at(arr, 5);
            expect(result).assertEqual(5);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_017
     * @tc.name    test_array_at_017
     * @tc.desc    Test at() with large array and negative middle index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_017";
        try {
            let arr: FixedArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            let result = at(arr, -5);
            expect(result).assertEqual(5);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_020
     * @tc.name    test_array_at_020
     * @tc.desc    Test at() with two-element array and indices 0 and 1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_020";
        try {
            let arr: FixedArray<int> = [111, 222];
            expect(at(arr, 0)).assertEqual(111);
            expect(at(arr, 1)).assertEqual(222);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_021
     * @tc.name    test_array_at_021
     * @tc.desc    Test at() with two-element array and indices -1 and -2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_021";
        try {
            let arr: FixedArray<int> = [111, 222];
            expect(at(arr, -1)).assertEqual(222);
            expect(at(arr, -2)).assertEqual(111);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_022
     * @tc.name    test_array_at_022
     * @tc.desc    Test at() with index 0 on a non-empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_022";
        try {
            let arr: FixedArray<int> = [99];
            let result = at(arr, 0);
            expect(result).assertEqual(99);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_023
     * @tc.name    test_array_at_023
     * @tc.desc    Test at() with index -0 (treated as 0)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_023";
        try {
            let arr: FixedArray<int> = [123, 456];
            let result = at(arr, -0);
            expect(result).assertEqual(123);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_024
     * @tc.name    test_array_at_024
     * @tc.desc    Test at() with a positive index one less than length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_024";
        try {
            let arr: FixedArray<int> = [7, 8, 9];
            let result = at(arr, 2);
            expect(result).assertEqual(9);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_025
     * @tc.name    test_array_at_025
     * @tc.desc    Test at() with a negative index whose absolute value equals length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_025";
        try {
            let arr: FixedArray<int> = [1, 2, 3];
            let result = at(arr, -3);
            expect(result).assertEqual(1);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_AT_033
     * @tc.name    test_array_at_033
     * @tc.desc    Test at() on single-element array with index -1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_at_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_at_033";
        try {
            let arr: FixedArray<int> = [42];
            let result = at(arr, -1);
            expect(result).assertEqual(42);
        } catch (err: BusinessError) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_036
     * @tc.name    test_array_concat_036
     * @tc.desc    Test concatenating three arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_036";
        try {
            const arr1: FixedArray<double> = [1.0, 2.0];
            const arr2: FixedArray<double> = [3.0, 4.0];
            const arr3: FixedArray<double> = [5.0];
            const result = concat(arr1, arr2, arr3);
            expect(result.length).assertEqual(5);
            expect(result[0]).assertEqual(1.0);
            expect(result[2]).assertEqual(3.0);
            expect(result[4]).assertEqual(5.0);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_037
     * @tc.name    test_array_concat_037
     * @tc.desc    Test concatenating with an empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_037";
        try {
            const arr1: FixedArray<long> = [100, 200];
            const arr2: FixedArray<long> = [];
            const result = concat(arr1, arr2);
            expect(result.length).assertEqual(2);
            expect(result[0]).assertEqual(100);
            expect(result[1]).assertEqual(200);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_038
     * @tc.name    test_array_concat_038
     * @tc.desc    Test concatenating multiple empty arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_038";
        try {
            const arr1: FixedArray<short> = [];
            const arr2: FixedArray<short> = [];
            const arr3: FixedArray<short> = [];
            const result = concat(arr1, arr2, arr3);
            expect(result.length).assertEqual(0);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_039
     * @tc.name    test_array_concat_039
     * @tc.desc    Test concatenating large arrays
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_039";
        try {
            const arr1: FixedArray<long> = new FixedArray<long>(500);
            const arr2: FixedArray<long> = new FixedArray<long>(500);
            for (let i = 0; i < 500; i++) {
                arr1[i] = i;
                arr2[i] = i + 500;
            }
            const result = concat(arr1, arr2);
            expect(result.length).assertEqual(1000);
            expect(result[0]).assertEqual(0);
            expect(result[499]).assertEqual(499);
            expect(result[500]).assertEqual(500);
            expect(result[999]).assertEqual(999);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_040
     * @tc.name    test_array_concat_040
     * @tc.desc    Test concatenating arrays with negative values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_040";
        try {
            const arr1: FixedArray<double> = [-1.5, -2.5];
            const arr2: FixedArray<double> = [-3.0];
            const result = concat(arr1, arr2);
            expect(result.length).assertEqual(3);
            expect(result[0]).assertEqual(-1.5);
            expect(result[2]).assertEqual(-3.0);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_KERNEL_ARRAY_CONCAT_041
     * @tc.name    test_array_concat_041
     * @tc.desc    Test concatenating arrays with mixed value types
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_concat_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_041";
        try {
            const arr1: FixedArray<long> = [100, -200];
            const arr2: FixedArray<long> = [0, 300];
            const result = concat(arr1, arr2);
            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual(100);
            expect(result[1]).assertEqual(-200);
            expect(result[2]).assertEqual(0);
            expect(result[3]).assertEqual(300);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0042
     * @tc.name    test_array_concat_0042
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation of two number arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0042";
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
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0043
     * @tc.name    test_array_concat_0043
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with empty array
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0043";
        try {
            const arr1: number[] = [5, 6];
            const arr2: number[] = [];
            const result = arr1.concat(arr2);
            expect(result.length).assertEqual(2);
            expect(result[0]).assertEqual(5);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0044
     * @tc.name    test_array_concat_0044
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation of multiple arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0044";
        try {
            const arr1: number[] = [7];
            const arr2: number[] = [8];
            const arr3: number[] = [9];
            const result = arr1.concat(arr2, arr3);
            expect(result.length).assertEqual(3);
            expect(result[2]).assertEqual(9);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0045
     * @tc.name    test_array_concat_0045
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation of boolean arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0045";
        try {
            const arr1: boolean[] = [true];
            const arr2: boolean[] = [false];
            const result = arr1.concat(arr2);
            expect(result.length).assertEqual(2);
            expect(result[1]).assertFalse();
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0046
     * @tc.name    test_array_concat_0046
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with nested arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0046";
        try {
            const arr1: number[][] = [[1], [2]];
            const arr2: number[][] = [[3]];
            const result = arr1.concat(arr2);
            expect(result.length).assertEqual(3);
            expect(result[2][0]).assertEqual(3);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0047
     * @tc.name    test_array_concat_0047
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation of string arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0047";
        try {
            const arr1: string[] = ['Hello'];
            const arr2: string[] = ['World'];
            const result = arr1.concat(arr2);
            expect(result.join(' ')).assertEqual('Hello World');
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0048
     * @tc.name    test_array_concat_0048
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with single element array
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0048";
        try {
            const arr1: number[] = [];
            const arr2: number[] = [100];
            const result = arr1.concat(arr2);
            expect(result.length).assertEqual(1);
            expect(result[0]).assertEqual(100);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0049
     * @tc.name    test_array_concat_0049
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with three float arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0049";
        try {
            const arr1: number[] = [1.1, 2.2];
            const arr2: number[] = [3.3];
            const arr3: number[] = [4.4, 5.5];
            const result = arr1.concat(arr2, arr3);
            expect(result.length).assertEqual(5);
            expect(result[4]).assertEqual(5.5);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0050
     * @tc.name    test_array_concat_0050
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with mixed length arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0050";
        try {
            const arr1: number[] = [10.0];
            const arr2: number[] = [20.0, 30.0];
            const arr3: number[] = [40.0, 50.0, 60.0];
            const result = arr1.concat(arr2, arr3);
            expect(result.length).assertEqual(6);
            expect(result[5]).assertEqual(60.0);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0051
     * @tc.name    test_array_concat_0051
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with empty arrays in arguments
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0051";
        try {
            const arr1: number[] = [1.5];
            const arr2: number[] = [];
            const arr3: number[] = [2.5];
            const result = arr1.concat(arr2, arr3);
            expect(result.length).assertEqual(2);
            expect(result[1]).assertEqual(2.5);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0052
     * @tc.name    test_array_concat_0052
     * @tc.type    FUNCTION
     * @tc.desc    Test concatenation with four arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0052";
        try {
            const arr1: number[] = [0.1];
            const arr2: number[] = [0.2];
            const arr3: number[] = [0.3];
            const arr4: number[] = [0.4];
            const result = arr1.concat(arr2, arr3, arr4);
            expect(result.length).assertEqual(4);
            expect(result[3]).assertEqual(0.4);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0053
     * @tc.name    test_array_concat_0053
     * @tc.type    FUNCTION
     * @tc.desc    Test the connection of the array to the empty array
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0053";
        try {
            const arr1: FixedArray<int> = [1, 2] as FixedArray<int>;
            const arr2: FixedArray<int> = [] as FixedArray<int>;
            const result: FixedArray<int> = concat(arr1, arr2);
            expect(result.length).assertEqual(2);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed: ${err.message}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0054
     * @tc.name    test_array_concat_0054
     * @tc.type    FUNCTION
     * @tc.desc    Test sequential joins of three arrays
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0054";
        try {
            const arr1: FixedArray<int> = [1] as FixedArray<int>;
            const arr2: FixedArray<int> = [2] as FixedArray<int>;
            const arr3: FixedArray<int> = [3] as FixedArray<int>;
            const result: FixedArray<int> = concat(arr1, arr2, arr3);
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
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0055
     * @tc.name    test_array_concat_0055
     * @tc.type    FUNCTION
     * @tc.desc    Test the connection of a single-element array
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0055";
        try {
            const single: FixedArray<int> = [100] as FixedArray<int>;
            const result: FixedArray<int> = concat(single);
            expect(result.length).assertEqual(1);
            expect(result[0]).assertEqual(100);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed: ${err.message}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_CONCAT_0056
     * @tc.name    test_array_concat_0056
     * @tc.type    FUNCTION
     * @tc.desc    Test the array to join itself
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_concat_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = "test_array_concat_0056";
        try {
            const arr: FixedArray<int> = [10, 20] as FixedArray<int>;
            const result: FixedArray<int> = concat(arr, arr);
            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(10);
            expect(result[3]).assertEqual(20);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed: ${err.message}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_UTIL_ARRAY_FINDINDEX_0058
     * @tc.name    test_array_findindex_0058
     * @tc.type    FUNCTION
     * @tc.desc    Test findIndex with empty array and no matching elements
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('test_array_findindex_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_array_findindex_0058";
        try {
            const emptyArray: FixedArray<double> = [] as FixedArray<double>;
            const result1 = findIndex(emptyArray, (elem: double) => elem > 0);
            expect(result1).assertEqual(-1);
            const noMatchArray: FixedArray<double> = [1.1, 2.2] as FixedArray<double>;
            const result2 = findIndex(noMatchArray, (elem: double) => elem > 5.0);
            expect(result2).assertEqual(-1);
            console.log(`${TAG} success`);
        } catch (err: BusinessError) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });
  });
}