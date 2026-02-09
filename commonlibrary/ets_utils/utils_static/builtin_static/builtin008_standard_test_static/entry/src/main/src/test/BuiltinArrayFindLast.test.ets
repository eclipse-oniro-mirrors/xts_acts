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
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BuiltinArrayFindLastTest() {
  describe("BuiltinArrayFindLastTest", (): void => {
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_1000_01
     * @tc.name   testBuiltinArrayFindLast0010
     * @tc.desc   Test basic findLast operation within FixedArray<boolean>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindLast0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindLast0010";
      try {
        const boolArray: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        const result = findLast(boolArray, (elem) => elem === true);
        expect(result).assertEqual(true);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_2000
     * @tc.name   testBuiltinArrayFindLast0020EdgeCase
     * @tc.desc   Test findLast with empty array and no matching elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindLast0020EdgeCase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindLast0020EdgeCase";
      try {
        const emptyArray: FixedArray<boolean> = [] as FixedArray<boolean>;
        const result1 = findLast(emptyArray, (elem) => elem);
        expect(result1).assertUndefined();
        const falseArray: FixedArray<boolean> = [false, false] as FixedArray<boolean>;
        const result2 = findLast(falseArray, (elem) => elem === true);
        expect(result2).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_1000_01
     * @tc.name   testFindLastBoolBasic0010
     * @tc.desc   Test basic findLast operation with boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBoolBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBoolBasic0010";
      try {
        const boolArray: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        const result = findLast(boolArray, (value) => value);
        expect(result).assertEqual(true);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_2000
     * @tc.name   testFindLastBoolWithIndex0020
     * @tc.desc   Test findLast with callback using index and array parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBoolWithIndex0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBoolWithIndex0020";
      try {
        const boolArray: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        const result = findLast(boolArray, (value, index) => index % 2 === 0 && value);
        expect(result).assertEqual(undefined);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_3000
     * @tc.name   testFindLastBoolEmpty0030
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBoolEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBoolEmpty0030";
      try {
        const emptyArray: FixedArray<boolean> = [] as FixedArray<boolean>;
        const result = findLast(emptyArray, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_4000
     * @tc.name   testFindLastBoolEdgeCases0040
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBoolEdgeCases0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBoolEdgeCases0040";
      try {
        const singleArray: FixedArray<boolean> = [true] as FixedArray<boolean>;
        const result = findLast(singleArray, (value) => value);
        expect(result).assertTrue();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_5000
     * @tc.name   testFindLastBoolAllProcessed0050
     * @tc.desc   Test when all elements are processed
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBoolAllProcessed0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBoolAllProcessed0050";
      try {
        const boolArray: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        const result = findLast(boolArray, () => true);
        expect(result).assertTrue();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_FIXEDARRAY_FINDLAST_600_01
     * @tc.name   testBuiltinArrayfindLast0006
     * @tc.desc   Testing findLast() function with edge cases
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0006";
      try {
        let emptyArr: FixedArray<byte> = [] as FixedArray<byte>;
        let result1 = findLast(emptyArr, (value) => value > 0);
        expect(result1).assertEqual(undefined);
        let singleArr: FixedArray<byte> = [5] as FixedArray<byte>;
        let result2 = findLast(singleArr, (value) => value > 3);
        expect(result2).assertEqual(5);
        let result3 = findLast(singleArr, (value) => value < 3);
        expect(result3).assertEqual(undefined);
        let multiArr: FixedArray<byte> = [1, 3, 5, 7] as FixedArray<byte>;
        let result4 = findLast(multiArr, (value) => value > 2);
        expect(result4).assertEqual(7);
        let result5 = findLast(multiArr, (value) => value > 10);
        expect(result5).assertEqual(undefined);
        let indexCheck = findLast(multiArr, (_, index) => index === 2);
        expect(indexCheck).assertEqual(5);
        let arrayRefCheck = findLast(multiArr, (value, _, arr) => value === arr[3]);
        expect(arrayRefCheck).assertEqual(7);
        let exactMatch = findLast(multiArr, (value) => value === 5);
        expect(exactMatch).assertEqual(5);
        let lastElement = findLast(multiArr, (value) => value === 7);
        expect(lastElement).assertEqual(7);
        let notFound = findLast(multiArr, (value) => value === 9);
        expect(notFound).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BYTE_1000
     * @tc.name   testFindLastByteBasic0010
     * @tc.desc   Test basic findLast operation with byte array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastByteBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastByteBasic0010";
      try {
        const byteArray: FixedArray<byte> = [1, 3, 5, 7, 9] as FixedArray<byte>;
        const result: Byte | undefined = findLast(byteArray, (v: byte) => v > 5);
        expect(result).assertEqual(9);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BYTE_3000
     * @tc.name   testFindLastByteEmpty0030
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastByteEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastByteEmpty0030";
      try {
        const emptyArray: FixedArray<byte> = [] as FixedArray<byte>;
        const result: Byte | undefined = findLast(emptyArray, () => true);
        expect(result).assertEqual(undefined);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BYTE_4000
     * @tc.name   testFindLastByteEdgeCases0040
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastByteEdgeCases0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastByteEdgeCases0040";
      try {
        const singleArray: FixedArray<byte> = [42] as FixedArray<byte>;
        const result: Byte | undefined = findLast(singleArray, (v: byte) => v === 42);
        expect(result).assertEqual(42);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BYTE_5000
     * @tc.name   testFindLastByteNoMatch0050
     * @tc.desc   Test when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastByteNoMatch0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastByteNoMatch0050";
      try {
        const byteArray: FixedArray<byte> = [2, 4, 6, 8] as FixedArray<byte>;
        const result: Byte | undefined = findLast(byteArray, (v: byte) => v % 2 !== 0);
        expect(result).assertEqual(undefined);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_1000_02
     * @tc.name   testBuiltinArrayFindLastIntEven0010
     * @tc.desc   Test findLast with FixedArray<int> - find last even number
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindLastIntEven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindLastIntEven0010";
      try {
        const intArray: FixedArray<int> = [1, 3, 4, 7, 8, 10, 15] as FixedArray<int>;
        const result = findLast(intArray, (elem: int) => elem % 2 === 0);
        expect(result).assertEqual(10);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_1000_03
     * @tc.name   testBuiltinArrayFindLastBoolTrue0010
     * @tc.desc   Test findLast with FixedArray<boolean> - find last true value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindLastBoolTrue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindLastBoolTrue0010";
      try {
        const boolArray: FixedArray<boolean> = [false, true, false, true, false] as FixedArray<boolean>;
        const result = findLast(boolArray, (elem: boolean) => elem === true);
        expect(result).assertTrue();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_1000_04
     * @tc.name   testBuiltinArrayFindLastEmptyFloat0010
     * @tc.desc   Test findLast with empty FixedArray<float>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFindLastEmptyFloat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFindLastEmptyFloat0010";
      try {
        const emptyFloatArray: FixedArray<float> = [] as FixedArray<float>;
        const result = findLast(emptyFloatArray, (elem: float) => elem > 0);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_FIXEDARRAY_FINDLAST_600
     * @tc.name   testBuiltinArrayfindLast0006_1
     * @tc.desc   Testing findLast() function with edge cases
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0006_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayfindLast0006";
      try {
        const emptyArr: FixedArray<double> = [] as FixedArray<double>;
        const result1 = findLast(emptyArr, (value) => value > 0);
        expect(result1).assertEqual(undefined);
        const singleArr: FixedArray<double> = [5.0] as FixedArray<double>;
        const result2 = findLast(singleArr, (value) => value > 3);
        expect(result2).assertEqual(5.0);
        const result3 = findLast(singleArr, (value) => value < 3);
        expect(result3).assertEqual(undefined);
        const multiArr: FixedArray<double> = [1.0, 3.0, 5.0, 7.0] as FixedArray<double>;
        const result4 = findLast(multiArr, (value) => value > 2);
        expect(result4).assertEqual(7.0);
        const result5 = findLast(multiArr, (value) => value > 10);
        expect(result5).assertEqual(undefined);
        const indexCheck = findLast(multiArr, (_, index) => index === 2);
        expect(indexCheck).assertEqual(5.0);
        const arrayRefCheck = findLast(multiArr, (value, _, arr) => value === arr[1]);
        expect(arrayRefCheck).assertEqual(3.0);
        const exactMatch = findLast(multiArr, (value) => value === 5.0);
        expect(exactMatch).assertEqual(5.0);
        const lastElement = findLast(multiArr, (value) => value === 7.0);
        expect(lastElement).assertEqual(7.0);
        const notFound = findLast(multiArr, (value) => value === 9.0);
        expect(notFound).assertEqual(undefined);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_DOUBLE_1000
     * @tc.name   testFindLastBasic0010
     * @tc.desc   Test basic findLast operation finds last matching element
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastBasic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastBasic0010";
      try {
        const arr: FixedArray<double> = [1.5, 2.3, 3.7, 2.3] as FixedArray<double>;
        const result = findLast(arr, (val) => val > 2);
        expect(result).assertEqual(2.3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_DOUBLE_2000
     * @tc.name   testFindLastWithIndex0020
     * @tc.desc   Test findLast with index parameter in predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastWithIndex0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastWithIndex0020";
      try {
        const arr: FixedArray<double> = [1.1, 2.2, 3.3, 4.4] as FixedArray<double>;
        const result = findLast(arr, (_, index) => index % 2 === 0);
        expect(result).assertEqual(3.3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_DOUBLE_3000
     * @tc.name   testFindLastEmpty0030
     * @tc.desc   Test findLast returns undefined on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastEmpty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastEmpty0030";
      try {
        const emptyArr: FixedArray<double> = [] as FixedArray<double>;
        const result = findLast(emptyArr, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_DOUBLE_4000
     * @tc.name   testFindLastNoMatch0040
     * @tc.desc   Test findLast returns undefined when no elements match
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastNoMatch0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastNoMatch0040";
      try {
        const arr: FixedArray<double> = [1.5, 2.5, 3.5] as FixedArray<double>;
        const result = findLast(arr, val => val > 5);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

   /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_DOUBLE_5000
     * @tc.name   testFindLastEdgeCase0050
     * @tc.desc   Test findLast with single-element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testFindLastEdgeCase0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testFindLastEdgeCase0050";
      try {
        const singleArr: FixedArray<double> = [9.9] as FixedArray<double>;
        const result = findLast(singleArr, val => val < 10);
        expect(result).assertEqual(9.9);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_0300
     * @tc.name   testBuiltinArrayfindLast0003
     * @tc.desc   Test basic findLast operation within FixedArray<float>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0003";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 2.2f, 5.5f] as FixedArray<float>;
        const result = findLast(floatArray, (elem: float) => elem > 2.5);
        expect(result).assertEqual(5.5);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_0400
     * @tc.name   testBuiltinArrayfindLast0004
     * @tc.desc   Test findLast with empty array and no matching elements in FixedArray<float>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0004";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        const result1 = findLast(emptyArray, (elem: float) => elem > 0);
        expect(result1).assertUndefined();
        const lowArray: FixedArray<float> = [0.1f, 0.2f, 0.3f] as FixedArray<float>;
        const result2 = findLast(lowArray, (elem: float) => elem > 1);
        expect(result2).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_FLOAT_0600
     * @tc.name   testBuiltinArrayfindLast0006_3
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0006_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testBuiltinArrayfindLast0006_3';
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        const result = findLast(emptyArray, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_FLOAT_0700
     * @tc.name   testBuiltinArrayfindLast0007
     * @tc.desc   Test when no element satisfies predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = 'testBuiltinArrayfindLast0007';
      try {
        const floatArray: FixedArray<float> = [1.0f, 2.0f, 3.0f] as FixedArray<float>;
        const result = findLast(floatArray, (v: float) => v > 10.0);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_0800
     * @tc.name   testBuiltinArrayfindLast0008
     * @tc.desc   Test basic findLast operation within FixedArray<int>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0008";
      try {
        const intArray: FixedArray<int> = [1, 3, 5, 3, 7] as FixedArray<int>;
        const result = findLast(intArray, (elem: int) => elem > 4);
        expect(result).assertEqual(7);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_0900
     * @tc.name   testBuiltinArrayfindLast0009
     * @tc.desc   Test findLast with empty array and no matching elements in FixedArray<int>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0009";
      try {
        const emptyArray: FixedArray<int> = [] as FixedArray<int>;
        const result1 = findLast(emptyArray, (elem: int) => elem > 0);
        expect(result1).assertUndefined();
        const noMatchArray: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        const result2 = findLast(noMatchArray, (elem: int) => elem > 10);
        expect(result2).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_1000_02
     * @tc.name   testBuiltinArrayfindLast0010
     * @tc.desc   Test basic findLast operation with boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0010";
      try {
        const boolArray: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        const result = findLast(boolArray, (v: boolean) => v);
        expect(result).assertEqual(true);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_1200
     * @tc.name   testBuiltinArrayfindLast0012
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0012";
      try {
        const emptyArray: FixedArray<boolean> = [] as FixedArray<boolean>;
        const result = findLast(emptyArray, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_1300
     * @tc.name   testBuiltinArrayfindLast0013
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0013";
      try {
        const singleArray: FixedArray<boolean> = [true] as FixedArray<boolean>;
        const result = findLast(singleArray, (v) => v);
        expect(result).assertTrue();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_BOOL_1400
     * @tc.name   testBuiltinArrayfindLast0014
     * @tc.desc   Test when no elements satisfy the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0014";
      try {
        const boolArray: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        const result = findLast(boolArray, (v: boolean) => v);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_1500
     * @tc.name   testBuiltinArrayfindLast0015
     * @tc.desc   Test basic findLast operation within FixedArray<long>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0015";
      try {
        const longArray: FixedArray<long> = [1000, 2000, 3000, 2000, 4000] as FixedArray<long>;
        const result = findLast(longArray, (elem: long) => elem > 2500);
        expect(result).assertEqual(4000);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_1600
     * @tc.name   testBuiltinArrayfindLast0016
     * @tc.desc   Test edge cases for findLast in FixedArray<long>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0016";
      try {
        const emptyArray: FixedArray<long> = [] as FixedArray<long>;
        const result1 = findLast(emptyArray, (elem: long) => elem > 0);
        expect(result1).assertUndefined();
        const noMatchArray: FixedArray<long> = [1000, 2000, 3000] as FixedArray<long>;
        const result2 = findLast(noMatchArray, (elem: long) => elem > 5000);
        expect(result2).assertUndefined();
        const mixedArray: FixedArray<long> = [15, 32, 47, 64] as FixedArray<long>;
        const result3 = findLast(mixedArray, (elem: long) => elem % 2 === 0);
        expect(result3).assertEqual(64);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_1700
     * @tc.name   testBuiltinArrayfindLast0017
     * @tc.desc   Test basic findLast operation with long array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0017";
      try {
        const longArray: FixedArray<long> = [10, 20, 30] as FixedArray<long>;
        const result = findLast(longArray, (val: long) => val < 25);
        expect(result).assertEqual(20);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_1900
     * @tc.name   testBuiltinArrayfindLast0019
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0019";
      try {
        const emptyArray: FixedArray<long> = [] as FixedArray<long>;
        const result = findLast(emptyArray, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2000
     * @tc.name   testBuiltinArrayfindLast0020
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0020";
      try {
        const singleArray: FixedArray<long> = [100] as FixedArray<long>;
        const result = findLast(singleArray, (val: long) => val === 100);
        expect(result).assertEqual(100);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2100
     * @tc.name   testBuiltinArrayfindLast0021
     * @tc.desc   Test when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0021";
      try {
        const longArray: FixedArray<long> = [1, 2, 3] as FixedArray<long>;
        const result = findLast(longArray, (val: long) => val > 10);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2200
     * @tc.name   testBuiltinArrayfindLast0022
     * @tc.desc   Test finding last element greater than threshold in FixedArray<long>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0022";
      try {
        const longArray: FixedArray<long> = [1000, 2000, 3000, 4000] as FixedArray<long>;
        const result = findLast(longArray, (elem: long) => elem > 2500);
        expect(result).assertEqual(4000);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2300
     * @tc.name   testBuiltinArrayfindLast0023
     * @tc.desc   Test finding last element using index parameter in FixedArray<long>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0023";
      try {
        const longArray: FixedArray<long> = [10, 20, 30, 40] as FixedArray<long>;
        const result = findLast(longArray, (_, index) => index % 2 === 0);
        expect(result).assertEqual(30);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2400
     * @tc.name   testBuiltinArrayfindLast0024
     * @tc.desc   Test finding first element in reverse traversal (last element matches)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0024";
      try {
        const longArray: FixedArray<long> = [5, 15, 25, 35] as FixedArray<long>;
        const result = findLast(longArray, (elem: long) => elem > 30);
        expect(result).assertEqual(35);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_LONG_2500
     * @tc.name   testBuiltinArrayfindLast0025
     * @tc.desc   Test finding element at start of array in reverse traversal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0025";
      try {
        const longArray: FixedArray<long> = [100, 200, 300, 400] as FixedArray<long>;
        const result = findLast(longArray, (elem: long) => elem < 150);
        expect(result).assertEqual(100);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_SHORT_2600
     * @tc.name   testBuiltinArrayfindLast0026
     * @tc.desc   Test basic findLast operation with short array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0026";
      try {
        const shortArray: FixedArray<short> = [10, 20, 30] as FixedArray<short>;
        const result = findLast(shortArray, (val: short) => val > 20);
        expect(result).assertEqual(30);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_SHORT_2800
     * @tc.name   testBuiltinArrayfindLast0028
     * @tc.desc   Test findLast on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0028";
      try {
        const emptyArray: FixedArray<short> = [] as FixedArray<short>;
        const result = findLast(emptyArray, () => true);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_SHORT_2900
     * @tc.name   testBuiltinArrayfindLast0029
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0029";
      try {
        const singleArray: FixedArray<short> = [42] as FixedArray<short>;
        const result = findLast(singleArray, (val) => val === 42);
        expect(result).assertEqual(42);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLAST_SHORT_3000
     * @tc.name   testBuiltinArrayfindLast0030
     * @tc.desc   Test when no element satisfies the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLast0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLast0030";
      try {
        const shortArray: FixedArray<short> = [2, 4, 6] as FixedArray<short>;
        const result = findLast(shortArray, (val) => val % 2 !== 0);
        expect(result).assertUndefined();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3100
     * @tc.name   testBuiltinArrayfindLastIndex0031
     * @tc.desc   Test basic findLastIndex operation with boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0031";
      try {
        const boolArray: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        const result = findLastIndex(boolArray, (elem: boolean) => elem === true);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3300
     * @tc.name   testBuiltinArrayfindLastIndex0033
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0033";
      try {
        const boolArray: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        const result = findLastIndex(boolArray, (elem: boolean) => elem === true);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3400
     * @tc.name   testBuiltinArrayfindLastIndex0034
     * @tc.desc   Test edge cases (first/last element and empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0034";
      try {
        const emptyArray: FixedArray<boolean> = [] as FixedArray<boolean>;
        const emptyResult = findLastIndex(emptyArray, () => true);
        expect(emptyResult).assertEqual(-1);
        const singleArray: FixedArray<boolean> = [true] as FixedArray<boolean>;
        const singleResult = findLastIndex(singleArray, elem => elem);
        expect(singleResult).assertEqual(0);
        const lastElemArray: FixedArray<boolean> = [false, true] as FixedArray<boolean>;
        const lastResult = findLastIndex(lastElemArray, elem => elem);
        expect(lastResult).assertEqual(1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3500
     * @tc.name   testBuiltinArrayfindLastIndex0035
     * @tc.desc   Test when all elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0035";
      try {
        const boolArray: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        const result = findLastIndex(boolArray, elem => elem === true);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3700
     * @tc.name   testBuiltinArrayfindLastIndex0037
     * @tc.desc   Test basic findLastIndex operation with byte array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0037";
      try {
        const byteArray: FixedArray<byte> = [10, 20, 30, 20, 40] as FixedArray<byte>;
        const result = findLastIndex(byteArray, (elem: byte) => elem === 20);
        expect(result).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_3900
     * @tc.name   testBuiltinArrayfindLastIndex0039
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0039";
      try {
        const byteArray: FixedArray<byte> = [1, 2, 3] as FixedArray<byte>;
        const result = findLastIndex(byteArray, (elem: byte) => elem > 10);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4000
     * @tc.name   testBuiltinArrayfindLastIndex0040
     * @tc.desc   Test edge cases (first/last element and empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0040";
      try {
        const emptyArray: FixedArray<byte> = [] as FixedArray<byte>;
        const emptyResult = findLastIndex(emptyArray, () => true);
        expect(emptyResult).assertEqual(-1);
        const singleArray: FixedArray<byte> = [99] as FixedArray<byte>;
        const singleResult = findLastIndex(singleArray, elem => elem === 99);
        expect(singleResult).assertEqual(0);
        const lastElemArray: FixedArray<byte> = [0, 0, 123] as FixedArray<byte>;
        const lastResult = findLastIndex(lastElemArray, elem => elem === 123);
        expect(lastResult).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4100
     * @tc.name   testBuiltinArrayfindLastIndex0041
     * @tc.desc   Test when all elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0041";
      try {
        const byteArray: FixedArray<byte> = [7, 7, 7] as FixedArray<byte>;
        const result = findLastIndex(byteArray, elem => elem === 7);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4200
     * @tc.name   testBuiltinArrayfindLastIndex0042
     * @tc.desc   Test basic findLastIndex operation with double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0042";
      try {
        const doubleArray: FixedArray<double> = [1.1, 2.2, 3.3, 2.2] as FixedArray<double>;
        const result = findLastIndex(doubleArray, (elem: double) => elem === 2.2);
        expect(result).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4400
     * @tc.name   testBuiltinArrayfindLastIndex0044
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0044";
      try {
        const doubleArray: FixedArray<double> = [1.1, 1.2, 1.3] as FixedArray<double>;
        const result = findLastIndex(doubleArray, (elem: double) => elem === 9.9);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4500
     * @tc.name   testBuiltinArrayfindLastIndex0045
     * @tc.desc   Test edge cases (first/last element and empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0045";
      try {
        const emptyArray: FixedArray<double> = [] as FixedArray<double>;
        const emptyResult = findLastIndex(emptyArray, () => true);
        expect(emptyResult).assertEqual(-1);
        const singleArray: FixedArray<double> = [42.0] as FixedArray<double>;
        const singleResult = findLastIndex(singleArray, elem => elem === 42.0);
        expect(singleResult).assertEqual(0);
        const lastElemArray: FixedArray<double> = [0.0, 99.9] as FixedArray<double>;
        const lastResult = findLastIndex(lastElemArray, elem => elem === 99.9);
        expect(lastResult).assertEqual(1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4600
     * @tc.name   testBuiltinArrayfindLastIndex0046
     * @tc.desc   Test when all elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0046";
      try {
        const doubleArray: FixedArray<double> = [5.5, 5.5, 5.5] as FixedArray<double>;
        const result = findLastIndex(doubleArray, elem => elem === 5.5);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_4800
     * @tc.name   testBuiltinArrayfindLastIndex0048
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0048";
      try {
        const floatArray: FixedArray<float> = [1.1f, 1.2f, 1.3f] as FixedArray<float>;
        const result = findLastIndex(floatArray, (elem: float) => elem > 2.0);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_FLOAT_4900
     * @tc.name   testBuiltinArrayfindLastIndex0049
     * @tc.desc   Test basic findLastIndex operation with float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0049";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 2.2f] as FixedArray<float>;
        const index = findLastIndex(floatArray, (el: float) => el > 2.0);
        expect(index).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_FLOAT_5100
     * @tc.name   testBuiltinArrayfindLastIndex0051
     * @tc.desc   Test findLastIndex on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0051";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        const index = findLastIndex(emptyArray, () => true);
        expect(index).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_FLOAT_5200
     * @tc.name   testBuiltinArrayfindLastIndex0052
     * @tc.desc   Test edge case with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0052";
      try {
        const singleArray: FixedArray<float> = [5.5f] as FixedArray<float>;
        const indexFound = findLastIndex(singleArray, (el: float) => el > 5.0);
        const indexNotFound = findLastIndex(singleArray, (el: float) => el < 5.0);
        expect(indexFound).assertEqual(0);
        expect(indexNotFound).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_FLOAT_5300
     * @tc.name   testBuiltinArrayfindLastIndex0053
     * @tc.desc   Test when no elements satisfy the predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0053";
      try {
        const floatArray: FixedArray<float> = [1.1f, 2.2f, 3.3f] as FixedArray<float>;
        const index = findLastIndex(floatArray, (el: float) => el > 5.0);
        expect(index).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_INT_5400
     * @tc.name   testBuiltinArrayfindLastIndex0054
     * @tc.desc   Test basic findLastIndex operation with int array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0054";
      try {
        const intArray: FixedArray<int> = [1, 2, 3, 2, 5] as FixedArray<int>;
        const result = findLastIndex(intArray, (elem: int) => elem === 2);
        expect(result).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_INT_5600
     * @tc.name   testBuiltinArrayfindLastIndex0056
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0056";
      try {
        const intArray: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        const result = findLastIndex(intArray, (elem: int) => elem === 9);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_INT_5700
     * @tc.name   testBuiltinArrayfindLastIndex0057
     * @tc.desc   Test edge cases (first/last element and empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0057";
      try {
        const emptyArray: FixedArray<int> = [] as FixedArray<int>;
        const emptyResult = findLastIndex(emptyArray, () => true);
        expect(emptyResult).assertEqual(-1);
        const singleArray: FixedArray<int> = [42] as FixedArray<int>;
        const singleResult = findLastIndex(singleArray, elem => elem === 42);
        expect(singleResult).assertEqual(0);
        const lastElemArray: FixedArray<int> = [0, 99] as FixedArray<int>;
        const lastResult = findLastIndex(lastElemArray, elem => elem === 99);
        expect(lastResult).assertEqual(1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_INT_5800
     * @tc.name   testBuiltinArrayfindLastIndex0058
     * @tc.desc   Test when all elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0058";
      try {
        const intArray: FixedArray<int> = [5, 5, 5] as FixedArray<int>;
        const result = findLastIndex(intArray, elem => elem === 5);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_SHORT_6000
     * @tc.name  testBuiltinArrayfindLastIndex0060
     * @tc.desc  Test basic findLastIndex operation with short array
     * @tc.size  MEDIUMTEST
     * @tc.type  FUNCTION
     * @tc.level LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0060";
      try {
        const shortArray: FixedArray<short> = [1, 2, 3, 2, 5] as FixedArray<short>;
        const result = findLastIndex(shortArray, (elem: short) => elem === 2);
        expect(result).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_SHORT_6200
     * @tc.name   testBuiltinArrayfindLastIndex0062
     * @tc.desc   Test findLastIndex returns -1 when no elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0062";
      try {
        const shortArray: FixedArray<short> = [1, 2, 3] as FixedArray<short>;
        const result = findLastIndex(shortArray, (elem: short) => elem === 9);
        expect(result).assertEqual(-1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_SHORT_6300
     * @tc.name   testBuiltinArrayfindLastIndex0063
     * @tc.desc   Test edge cases (first/last element and empty array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0063";
      try {
        const emptyArray: FixedArray<short> = [] as FixedArray<short>;
        const emptyResult = findLastIndex(emptyArray, () => true);
        expect(emptyResult).assertEqual(-1);
        const singleArray: FixedArray<short> = [42] as FixedArray<short>;
        const singleResult = findLastIndex(singleArray, elem => elem === 42);
        expect(singleResult).assertEqual(0);
        const lastElemArray: FixedArray<short> = [0, 99] as FixedArray<short>;
        const lastResult = findLastIndex(lastElemArray, elem => elem === 99);
        expect(lastResult).assertEqual(1);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FINDLASTINDEX_SHORT_6400
     * @tc.name   testBuiltinArrayfindLastIndex0064
     * @tc.desc   Test when all elements satisfy predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayfindLastIndex0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayfindLastIndex0064";
      try {
        const shortArray: FixedArray<short> = [5, 5, 5] as FixedArray<short>;
        const result = findLastIndex(shortArray, elem => elem === 5);
        expect(result).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  });
}