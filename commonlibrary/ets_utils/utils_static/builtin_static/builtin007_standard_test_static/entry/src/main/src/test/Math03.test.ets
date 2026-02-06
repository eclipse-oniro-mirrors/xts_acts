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

export default function math03Test() {
	
  describe("math03Test", (): void => {
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
     * @tc.number  TEST_MATH_TANH_19001
     * @tc.name    testMathTanh19001
     * @tc.desc    Verify tanh function with NaN.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTanh19001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTanh19001 start');
        try {
          expect(Number.isNaN(tanh(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTanh19001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTanh19001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TANH_19002
     * @tc.name    testMathTanh19002
     * @tc.desc    Verify tanh function with positive infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTanh19002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTanh19002 start');
        try {
          expect(tanh(Number.POSITIVE_INFINITY)).assertEqual(1.0);
          console.log(domain, tag, '%{public}s', 'testMathTanh19002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTanh19002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TANH_19003
     * @tc.name    testMathTanh19003
     * @tc.desc    Verify tanh function with negative infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTanh19003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTanh19003 start');
        try {
          expect(tanh(Number.NEGATIVE_INFINITY)).assertEqual(-1.0);
          console.log(domain, tag, '%{public}s', 'testMathTanh19003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTanh19003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TANH_19004
     * @tc.name    testMathTanh19004
     * @tc.desc    Verify tanh function with zero input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTanh19004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTanh19004 start');
        try {
          expect(tanh(0.0)).assertEqual(0.0);
          console.log(domain, tag, '%{public}s', 'testMathTanh19004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTanh19004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TANH_19009
     * @tc.name    testMathTanh19009
     * @tc.desc    Verify tanh function with maximum finite number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTanh19009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTanh19009 start');
        try {
          expect(tanh(Number.MAX_VALUE)).assertEqual(1.0);
          console.log(domain, tag, '%{public}s', 'testMathTanh19009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTanh19009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20001
     * @tc.name    testMathTrunc20001
     * @tc.desc    Verify trunc function with NaN.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20001 start');
        try {
          expect(Number.isNaN(trunc(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTrunc20001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20002
     * @tc.name    testMathTrunc20002
     * @tc.desc    Verify trunc function with positive fractional number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20002 start');
        try {
          expect(trunc(3.14159)).assertEqual(3.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20003
     * @tc.name    testMathTrunc20003
     * @tc.desc    Verify trunc function with negative fractional number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20003 start');
        try {
          expect(trunc(-2.71828)).assertEqual(-2.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20004
     * @tc.name    testMathTrunc20004
     * @tc.desc    Verify trunc function with very small fractional number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20004 start');
        try {
          expect(trunc(0.000000001)).assertEqual(0.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20005
     * @tc.name    testMathTrunc20005
     * @tc.desc    Verify trunc function with negative integer (no fractional part).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20005 start');
        try {
          expect(trunc(-99.0)).assertEqual(-99.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20006
     * @tc.name    testMathTrunc20006
     * @tc.desc    Verify trunc function with positive infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20006 start');
        try {
          expect(trunc(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20007
     * @tc.name    testMathTrunc20007
     * @tc.desc    Verify trunc function with negative infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20007 start');
        try {
          expect(trunc(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20008
     * @tc.name    testMathTrunc20008
     * @tc.desc    Verify trunc function with large positive number (within safe integer range).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20008 start');
        try {
          const largePos = Number.MAX_SAFE_INTEGER - 0.5;
          expect(trunc(largePos)).assertEqual(Number.MAX_SAFE_INTEGER - 1);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20008 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20009
     * @tc.name    testMathTrunc20009
     * @tc.desc    Verify trunc function with large negative number (within safe integer range).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20009 start');
        try {
          const largeNeg = Number.MIN_SAFE_INTEGER + 0.5;
          expect(trunc(largeNeg)).assertEqual(-9007199254740990);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20010
     * @tc.name    testMathTrunc20010
     * @tc.desc    Verify trunc function with positive integer (no fractional part).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20010 start');
        try {
          expect(trunc(42.0)).assertEqual(42.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20010 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20010: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20013
     * @tc.name    testMathTrunc20013
     * @tc.desc    Verify trunc function with value just below MAX_SAFE_INTEGER.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20013 start');
        try {
          const maxSafeMinusHalf = Number.MAX_SAFE_INTEGER - 0.5;
          expect(trunc(maxSafeMinusHalf)).assertEqual(Number.MAX_SAFE_INTEGER - 1);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20013 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20013: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20014
     * @tc.name    testMathTrunc20014
     * @tc.desc    Verify trunc function with value just above MIN_SAFE_INTEGER.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20014 start');
        try {
          const minSafePlusHalf = Number.MIN_SAFE_INTEGER + 0.5;
          expect(trunc(minSafePlusHalf)).assertEqual(-9007199254740990);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20014 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20014: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20015
     * @tc.name    testMathTrunc20015
     * @tc.desc    Verify trunc function with positive zero.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20015 start');
        try {
          expect(trunc(0.0)).assertEqual(0.0);
          expect(1 / trunc(0.0)).assertEqual(Infinity);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20015 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20015: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20016
     * @tc.name    testMathTrunc20016
     * @tc.desc    Verify trunc function with negative zero.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20016 start');
        try {
          expect(trunc(-0.0)).assertEqual(-0.0);
          expect(1 / trunc(-0.0)).assertEqual(-Infinity);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20016 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20016: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20017
     * @tc.name    testMathTrunc20017
     * @tc.desc    Verify trunc function with smallest positive value (Number.MIN_VALUE).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20017 start');
        try {
          expect(trunc(Number.MIN_VALUE)).assertEqual(0.0);
          expect(1 / trunc(Number.MIN_VALUE)).assertEqual(Infinity);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20017 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20017: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20018
     * @tc.name    testMathTrunc20018
     * @tc.desc    Verify trunc function with smallest negative value (-Number.MIN_VALUE).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20018 start');
        try {
          expect(trunc(-Number.MIN_VALUE)).assertEqual(-0.0);
          expect(1 / trunc(-Number.MIN_VALUE)).assertEqual(-Infinity);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20018 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20018: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20019
     * @tc.name    testMathTrunc20019
     * @tc.desc    Verify trunc function with large positive integer (beyond safe integer).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20019 start');
        try {
          const largeExact = Math.pow(2, 53);
          expect(trunc(largeExact)).assertEqual(largeExact);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20019 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20019: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20020
     * @tc.name    testMathTrunc20020
     * @tc.desc    Verify trunc function with large negative integer (beyond safe integer).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20020 start');
        try {
          const largeExactNeg = -Math.pow(2, 53);
          expect(trunc(largeExactNeg)).assertEqual(largeExactNeg);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20020 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20020: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20021
     * @tc.name    testMathTrunc20021
     * @tc.desc    Verify trunc function with large fractional value (2^50 + 0.5).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20021 start');
        try {
          const baseVal = Math.pow(2, 50);
          const testVal = baseVal + 0.5;
          expect(trunc(testVal)).assertEqual(baseVal);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20021 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20021: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TRUNC_20022
     * @tc.name    testMathTrunc20022
     * @tc.desc    Verify trunc function with float precision artifact (0.1 + 0.2).
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTrunc20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTrunc20022 start');
        try {
          const floatSum = 0.1 + 0.2;
          expect(trunc(floatSum)).assertEqual(0.0);
          console.log(domain, tag, '%{public}s', 'testMathTrunc20022 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTrunc20022: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_STATIC_OF_21001
     * @tc.name    testStaticOf21001
     * @tc.desc    Verify typed array creation and manipulation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testStaticOf21001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testStaticOf21001 start');
        try {
          const sourceArray: number[] = [10, 20, 30, 40];
          const typedArray = new Int32Array(sourceArray);
          expect(typedArray instanceof Int32Array).assertTrue();
          expect(typedArray.length).assertEqual(4);
          expect(typedArray[0]).assertEqual(10);
          expect(typedArray[1]).assertEqual(20);
          expect(typedArray[2]).assertEqual(30);
          expect(typedArray[3]).assertEqual(40);
          sourceArray[0] = 99;
          expect(typedArray[0]).assertEqual(10);
          console.log(domain, tag, '%{public}s', 'testStaticOf21001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testStaticOf21001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_STATIC_OF_21002
     * @tc.name    testStaticOf21002
     * @tc.desc    Verify typed array handles boundary values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testStaticOf21002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testStaticOf21002 start');
        try {
          const boundaryValues: number[] = [32767, -32768, 0];
          const typedArray = new Int32Array(boundaryValues);
          expect(typedArray.length).assertEqual(3);
          expect(typedArray[0]).assertEqual(32767);
          expect(typedArray[1]).assertEqual(-32768);
          expect(typedArray[2]).assertEqual(0);
          console.log(domain, tag, '%{public}s', 'testStaticOf21002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testStaticOf21002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_STATIC_OF_21003
     * @tc.name    testStaticOf21003
     * @tc.desc    Verify empty typed array creation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testStaticOf21003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testStaticOf21003 start');
        try {
          const emptyArray = new Int32Array(0);
          expect(emptyArray.length).assertEqual(0);
          expect(emptyArray.byteLength).assertEqual(0);
          expect(emptyArray.toString()).assertEqual('');
          console.log(domain, tag, '%{public}s', 'testStaticOf21003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testStaticOf21003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_STATIC_OF_21004
     * @tc.name    testStaticOf21004
     * @tc.desc    Verify large typed array handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testStaticOf21004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testStaticOf21004 start');
        try {
          const size = 10000;
          const largeArray = new Int32Array(size);
          for (let i = 0; i < size; i++) {
            largeArray[i] = i % 100;
          }
          expect(largeArray.length).assertEqual(size);
          expect(largeArray[9999]).assertEqual(99);
          expect(largeArray[5000]).assertEqual(0);
          const startTime = new Date().getTime();
          let sum = 0;
          for (let i = 0; i < size; i++) {
            sum += largeArray[i];
          }
          const duration = new Date().getTime() - startTime;
          console.log(domain, tag, 'Large array processing time: %{public}dms', duration);
          expect(sum).assertEqual(495000);
          console.log(domain, tag, '%{public}s', 'testStaticOf21004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testStaticOf21004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_STATIC_OF_21006
     * @tc.name    testStaticOf21006
     * @tc.desc    Verify set() copies values correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testStaticOf21006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testStaticOf21006 start');
        try {
          const source = new Int16Array([10, 20, 30]);
          const dest = new Int16Array(5);
          dest.set(source, 1);
          expect(dest[0]).assertEqual(0);
          expect(dest[1]).assertEqual(10);
          expect(dest[2]).assertEqual(20);
          expect(dest[3]).assertEqual(30);
          expect(dest[4]).assertEqual(0);
          dest.set(new Int16Array([99, 100]), 3);
          expect(dest[3]).assertEqual(99);
          expect(dest[4]).assertEqual(100);
          expect(source[0]).assertEqual(10);
          console.log(domain, tag, '%{public}s', 'testStaticOf21006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testStaticOf21006: ${error}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  TEST_MATH_SCALBN_22001
     * @tc.name    testMathScalbn22001
     * @tc.desc    Verify scalbn(3.0, 4) = 48.0 (3 * 2^4)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22001 start');
        try {
          expect(scalbn(3.0, 4)).assertEqual(48.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22002
     * @tc.name    testMathScalbn22002
     * @tc.desc    Verify scalbn(8.0, -2) = 2.0 (8 * 2^-2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22002 start');
        try {
          expect(scalbn(8.0, -2)).assertEqual(2.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22003
     * @tc.name    testMathScalbn22003
     * @tc.desc    Verify scalbn(-5.0, 3) = -40.0 (-5 * 2^3)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22003 start');
        try {
          expect(scalbn(-5.0, 3)).assertEqual(-40.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22004
     * @tc.name    testMathScalbn22004
     * @tc.desc    Verify scalbn(0.0, 100) = 0.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22004 start');
        try {
          expect(scalbn(0.0, 100)).assertEqual(0.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22005
     * @tc.name    testMathScalbn22005
     * @tc.desc    Verify scalbn(NaN, 5) returns NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22005 start');
        try {
          expect(Number.isNaN(scalbn(NaN, 5))).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22006
     * @tc.name    testMathScalbn22006
     * @tc.desc    Verify scalbn(Infinity, 10) returns Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22006 start');
        try {
          expect(scalbn(Infinity, 10)).assertEqual(Infinity);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22007
     * @tc.name    testMathScalbn22007
     * @tc.desc    Verify scalbn(-Infinity, -5) returns -Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22007 start');
        try {
          expect(scalbn(-Infinity, -5)).assertEqual(-Infinity);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22008
     * @tc.name    testMathScalbn22008
     * @tc.desc    Verify scalbn(1.0, 1023) returns correct large value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22008 start');
        try {
          const result = scalbn(1.0, 1023);
          const expected = 8.98846567431158e307;
          expect(Math.abs(result - expected) < 1e292).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22009
     * @tc.name    testMathScalbn22009
     * @tc.desc    Verify scalbn(1.0, -1022) returns correct small value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22009 start');
        try {
          expect(scalbn(1.0, -1022)).assertEqual(2.2250738585072014e-308);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22010
     * @tc.name    testMathScalbn22010
     * @tc.desc    Verify scalbn(1.0, 1024) returns Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22010 start');
        try {
          expect(scalbn(1.0, 1024)).assertEqual(Infinity);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22011
     * @tc.name    testMathScalbn22011
     * @tc.desc    Verify scalbn(1.0, -1075) returns 0.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22011 start');
        try {
          expect(scalbn(1.0, -1075)).assertEqual(0.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22012
     * @tc.name    testMathScalbn22012
     * @tc.desc    Verify scalbn(0.75, 2) = 3.0 (0.75 * 2^2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22012 start');
        try {
          expect(scalbn(0.75, 2)).assertEqual(3.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22013
     * @tc.name    testMathScalbn22013
     * @tc.desc    Verify scalbn(3.14, 0) returns the original value (3.14)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22013 start');
        try {
          expect(scalbn(3.14, 0)).assertEqual(3.14);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22015
     * @tc.name    testMathScalbn22015
     * @tc.desc    Verify scalbn(denormalized value, 10) returns normalized value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22015 start');
        try {
          const denorm = 1.0e-310;
          const result = scalbn(denorm, 10);
          expect(result).assertEqual(denorm * 1024);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22017
     * @tc.name    testMathScalbn22017
     * @tc.desc    Verify scalbn(1.0, 1000000000) returns Infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22017 start');
        try {
          expect(scalbn(1.0, 1000000000)).assertEqual(Infinity);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22018
     * @tc.name    testMathScalbn22018
     * @tc.desc    Verify scalbn(1.0, -1000000000) returns 0.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22018 start');
        try {
          expect(scalbn(1.0, -1000000000)).assertEqual(0.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22019
     * @tc.name    testMathScalbn22019
     * @tc.desc    Verify scalbn(1.0000000000000002, 53) returns exact value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22019 start');
        try {
          const base = 1.0000000000000002;
          const result = scalbn(base, 53);
          expect(result).assertEqual(9007199254740994.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22020
     * @tc.name    testMathScalbn22020
     * @tc.desc    Verify scalbn(-0.0, 10) preserves negative zero
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22020 start');
        try {
          const result = scalbn(-0.0, 10);
          expect(1 / result).assertEqual(-Infinity);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22021
     * @tc.name    testMathScalbn22021
     * @tc.desc    Verify scalbn(Number.MAX_SAFE_INTEGER, 1) returns exact value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22021 start');
        try {
          const maxSafe = Number.MAX_SAFE_INTEGER;
          expect(scalbn(maxSafe, 1)).assertEqual(maxSafe * 2);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22022
     * @tc.name    testMathScalbn22022
     * @tc.desc    Verify scalbn(Number.MIN_SAFE_INTEGER, -1) returns exact value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22022 start');
        try {
          const minSafe = Number.MIN_SAFE_INTEGER;
          expect(scalbn(minSafe, -1)).assertEqual(minSafe / 2);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22023
     * @tc.name    testMathScalbn22023
     * @tc.desc    Verify scalbn(1e-320, 20) returns normalized value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22023 start');
        try {
          const subnormal = 1e-320;
          const result = scalbn(subnormal, 20);
          expect(result).assertEqual(subnormal * 1048576);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22024
     * @tc.name    testMathScalbn22024
     * @tc.desc    Verify scalbn(1.0, -1074) returns minimum denormalized value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22024 start');
        try {
          const result = scalbn(1.0, -1074);
          expect(result).assertEqual(5e-324);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22025
     * @tc.name    testMathScalbn22025
     * @tc.desc    Verify scalbn(-4.0, -2) returns -1.0 (-4 * 2^-2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22025 start');
        try {
          expect(scalbn(-4.0, -2)).assertEqual(-1.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22026
     * @tc.name    testMathScalbn22026
     * @tc.desc    Verify scalbn(0.1, 50) returns correct value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22026 start');
        try {
          const result = scalbn(0.1, 50);
          const expected = 0.1 * Math.pow(2, 50);
          expect(Math.abs(result - expected) < 1e-6).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22027
     * @tc.name    testMathScalbn22027
     * @tc.desc    Verify scalbn(1e-100, -100) returns 7.888609052210118e-131
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22027 start');
        try {
          const result = scalbn(1e-100, -100);
          const expected = 7.888609052210118e-131;
          expect(Math.abs(result - expected) / expected < 1e-15).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22028
     * @tc.name    testMathScalbn22028
     * @tc.desc    Verify scalbn(1.0, 1023) is finite but large
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22028 start');
        try {
          const result = scalbn(1.0, 1023);
          expect(isFinite(result) && result > 1e300).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22029
     * @tc.name    testMathScalbn22029
     * @tc.desc    Verify scalbn(1.0, -1022) is finite but small
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22029 start');
        try {
          const result = scalbn(1.0, -1022);
          expect(isFinite(result) && result > 0 && result < 1e-300).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SCALBN_22030
     * @tc.name    testMathScalbn22030
     * @tc.desc    Verify scalbn(2.5, 3) = 20.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathScalbn22030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathScalbn22030 start');
        try {
          expect(scalbn(2.5, 3)).assertEqual(20.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23000
     * @tc.name    testMathAtan23000_01
     * @tc.desc    Verify atan(NaN) returns NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23000_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23000_01 start');
        try {
          const result: number = atan(NaN);
          expect(isNaN(result)).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23001
     * @tc.name    testMathAtan23001
     * @tc.desc    Verify atan(Infinity) ≈ π/2 (1.5708)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23001 start');
        try {
          const expected: number = Math.PI / 2;
          const result: number = atan(Infinity);
          expect(Math.abs(result - expected) < 1e-4).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23002
     * @tc.name    testMathAtan23002
     * @tc.desc    Verify atan(-Infinity) ≈ -π/2 (-1.5708)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23002 start');
        try {
          const expected: number = -Math.PI / 2;
          const result: number = atan(-Infinity);
          expect(Math.abs(result - expected) < 1e-4).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23003
     * @tc.name    testMathAtan23003
     * @tc.desc    Verify atan(0) = 0, atan(1) ≈ 0.7854 (π/4)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23003 start');
        try {
          expect(atan(0.0)).assertEqual(0.0);
          const pi4: number = Math.PI / 4;
          const result: number = atan(1.0);
          expect(Math.abs(result - pi4) < 1e-4).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23004
     * @tc.name    testMathAtan23004
     * @tc.desc    Verify atan(+0.0) = 0.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23004 start');
        try {
          expect(atan(+0.0)).assertEqual(0.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23005
     * @tc.name    testMathAtan23005
     * @tc.desc    Verify atan(-0.0) = -0.0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23005 start');
        try {
          expect(atan(-0.0)).assertEqual(-0.0);
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23006
     * @tc.name    testMathAtan23006
     * @tc.desc    Verify atan(1e-10) ≈ 1e-10
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23006 start');
        try {
          const smallValue: number = 1e-10;
          const result: number = atan(smallValue);
          expect(Math.abs(result - smallValue) < 1e-20).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23007
     * @tc.name    testMathAtan23007
     * @tc.desc    Verify atan(-1e-10) ≈ -1e-10
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23007 start');
        try {
          const smallValue: number = -1e-10;
          const result: number = atan(smallValue);
          expect(Math.abs(result - smallValue) < 1e-20).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23008
     * @tc.name    testMathAtan23008
     * @tc.desc    Verify atan(1e10) ≈ π/2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23008 start');
        try {
          const expected: number = Math.PI / 2;
          const result: number = atan(1e10);
          expect(Math.abs(result - expected) < 1e-5).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_23009
     * @tc.name    testMathAtan23009
     * @tc.desc    Verify atan(-1e10) ≈ -π/2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathAtan23009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan23009 start');
        try {
          const expected: number = -Math.PI / 2;
          const result: number = atan(-1e10);
          expect(Math.abs(result - expected) < 1e-5).assertTrue();
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_ATAN_24001
     * @tc.name    testMathAtan24001
     * @tc.desc    Verify atan2 with positive infinity for both parameters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24001 start');
        const y: number = Number.POSITIVE_INFINITY;
        const x: number = Number.POSITIVE_INFINITY;
        const expected: number = Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24001 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24001 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24003
     * @tc.name    testMathAtan24003
     * @tc.desc    Verify atan2 with NaN for both parameters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24003 start');
        const y: number = Number.NaN;
        const x: number = Number.NaN;
        try {
          const result: number = Math.atan2(y, x);
          expect(Number.isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24003 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24003 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24004
     * @tc.name    testMathAtan24004
     * @tc.desc    Verify atan2 with positive x-axis value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24004 start');
        const y: number = 0;
        const x: number = 10;
        const expected: number = 0;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24004 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24004 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24005
     * @tc.name    testMathAtan24005
     * @tc.desc    Verify atan2 with negative y-axis value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24005 start');
        const y: number = -5;
        const x: number = 0;
        const expected: number = -Math.PI / 2;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24005 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24005 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24006
     * @tc.name    testMathAtan24006
     * @tc.desc    Verify atan2 in second quadrant
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24006 start');
        const y: number = 5;
        const x: number = -5;
        const expected: number = Math.PI * 3 / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24006 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24006 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24008
     * @tc.name    testMathAtan24008
     * @tc.desc    Verify atan2 with positive y-axis value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24008 start');
        const y: number = 5;
        const x: number = 0;
        const expected: number = Math.PI / 2;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24008 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24008 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24009
     * @tc.name    testMathAtan24009
     * @tc.desc    Verify atan2 with positive x-axis and negative y-axis
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24009 start');
        const y: number = -1;
        const x: number = 1;
        const expected: number = -Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24009 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24009 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24010
     * @tc.name    testMathAtan24010
     * @tc.desc    Verify atan2 in third quadrant
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24010 start');
        const y: number = -5;
        const x: number = -5;
        const expected: number = -Math.PI * 3 / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24010 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24010 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24011
     * @tc.name    testMathAtan24011
     * @tc.desc    Verify atan2 with large positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24011 start');
        const y: number = 1e300;
        const x: number = 1e300;
        const expected: number = Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24011 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24011 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24012
     * @tc.name    testMathAtan24012
     * @tc.desc    Verify atan2 with very small values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24012 start');
        const y: number = 1e-300;
        const x: number = 1e-300;
        const expected: number = Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24012 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24012 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24013
     * @tc.name    testMathAtan24013
     * @tc.desc    Verify atan2 with positive y and negative x (second quadrant)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24013 start');
        const y: number = 1;
        const x: number = -1;
        const expected: number = Math.PI * 3 / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24013 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24013 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24014
     * @tc.name    testMathAtan24014
     * @tc.desc    Verify atan2 with negative y and positive x (fourth quadrant)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24014 start');
        const y: number = -1;
        const x: number = 1;
        const expected: number = -Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24014 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24014 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24015
     * @tc.name    testMathAtan24015
     * @tc.desc    Verify atan2 with positive infinity and finite x
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24015 start');
        const y: number = Number.POSITIVE_INFINITY;
        const x: number = 1;
        const expected: number = Math.PI / 2;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24015 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24015 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24016
     * @tc.name    testMathAtan24016
     * @tc.desc    Verify atan2 with negative infinity and finite x
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24016 start');
        const y: number = Number.NEGATIVE_INFINITY;
        const x: number = 1;
        const expected: number = -Math.PI / 2;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24016 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24016 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24017
     * @tc.name    testMathAtan24017
     * @tc.desc    Verify atan2 with finite y and positive infinity x
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24017 start');
        const y: number = 1;
        const x: number = Number.POSITIVE_INFINITY;
        const expected: number = 0;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24017 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24017 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24018
     * @tc.name    testMathAtan24018
     * @tc.desc    Verify atan2 with finite y and negative infinity x
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24018 start');
        const y: number = 1;
        const x: number = Number.NEGATIVE_INFINITY;
        const expected: number = Math.PI;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24018 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24018 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24019
     * @tc.name    testMathAtan24019
     * @tc.desc    Verify atan2 with zero and positive zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24019 start');
        const y: number = 0;
        const x: number = 0;
        const expected: number = 0;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24019 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24019 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24021
     * @tc.name    testMathAtan24021
     * @tc.desc    Verify atan2 with exact π/4 value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24021 start');
        const y: number = 1;
        const x: number = 1;
        const expected: number = Math.PI / 4;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24021 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24021 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATAN_24022
     * @tc.name    testMathAtan24022
     * @tc.desc    Verify atan2 with large difference in magnitude
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathAtan24022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathAtan24022 start');
        const y: number = 1e-300;
        const x: number = 1e300;
        const expected: number = 0;
        try {
          const result: number = Math.atan2(y, x);
          expect(result).assertEqual(expected);
        } catch (error) {
          console.log(domain, tag, 'testMathAtan24022 failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathAtan24022 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25001
     * @tc.name    testMathatanh25001
     * @tc.desc    Check atanh with NaN input
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25001 start');
        try {
          const result: number = atanh(NaN);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25001 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25001 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25002
     * @tc.name    testMathatanh25002
     * @tc.desc    Check atanh with positive infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25002 start');
        try {
          const result: number = atanh(Infinity);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25002 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25002 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25003
     * @tc.name    testMathatanh25003
     * @tc.desc    Check atanh with negative infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25003 start');
        try {
          const result: number = atanh(-Infinity);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25003 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25003 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25004
     * @tc.name    testMathatanh25004
     * @tc.desc    Check atanh with zero input
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25004 start');
        try {
          const result: number = atanh(0.0);
          expect(result).assertEqual(0.0);
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25004 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25004 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25007
     * @tc.name    testMathatanh25007
     * @tc.desc    Check atanh with input > 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25007 start');
        try {
          const result: number = atanh(1.1);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25007 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25007 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25008
     * @tc.name    testMathatanh25008
     * @tc.desc    Check atanh with input < -1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25008 start');
        try {
          const result: number = atanh(-1.1);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25008 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25008 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25009
     * @tc.name    testMathatanh25009
     * @tc.desc    Check atanh with input exactly 1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25009 start');
        try {
          const result: number = atanh(1.0);
          expect(result).assertEqual(Infinity);
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25009 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25009 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25010
     * @tc.name    testMathatanh25010
     * @tc.desc    Check atanh with input exactly -1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25010 start');
        try {
          const result: number = atanh(-1.0);
          expect(result).assertEqual(-Infinity);
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25010 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25010 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25019
     * @tc.name    testMathatanh25019
     * @tc.desc    Check atanh with very large positive value (should be NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25019 start');
        try {
          const result: number = atanh(Number.MAX_VALUE);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25019 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25019 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25020
     * @tc.name    testMathatanh25020
     * @tc.desc    Check atanh with very large negative value (should be NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25020 start');
        try {
          const result: number = atanh(-Number.MAX_VALUE);
          expect(isNaN(result)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25020 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25020 end');
        }
      });

    /**
     * @tc.number TEST_MATH_ATANH_25021
     * @tc.name    testMathatanh25031_01
     * @tc.desc    Check atanh with input exactly 0.0 (edge case)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testMathatanh25031_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathatanh25021 start');
        try {
          const result: number = atanh(0.0);
          expect(result).assertEqual(0.0);
          expect(1 / result).assertEqual(Infinity);
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testMathatanh25021 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testMathatanh25031_01 end');
        }
      });
  });
}