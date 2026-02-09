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
export default function math01Test() {

  describe("math01Test", () => {
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
     * @tc.number  TES_TMA_THMIN_10001
     * @tc.name    testmathmin10001
     * @tc.desc    Check min function with positive numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10001 start');
      let a: number = 5.0;
      let b: number = 10.0;
      let expected: number = 5.0;
      try {
        let result: number = Math.min(a, b);
        expect(result).assertEqual(expected);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin10001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10001 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10002
     * @tc.name    testmathmin10002
     * @tc.desc    Check min function with negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10002 start');
      let a: number = -5.0;
      let b: number = -10.0;
      let expected: number = -10.0;
      try {
        let result: number = Math.min(a, b);
        expect(result).assertEqual(expected);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin10002 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10002 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10003
     * @tc.name    testmathmin10003
     * @tc.desc    Check min function with positive and negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10003 start');
      let a: number = 5.0;
      let b: number = -10.0;
      let expected: number = -10.0;
      try {
        let result: number = Math.min(a, b);
        expect(result).assertEqual(expected);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin10003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10003 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10004
     * @tc.name    testmathmin10004
     * @tc.desc    Check min function with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10004 start');
      let a: number = 5.0;
      let b: number = 5.0;
      let expected: number = 5.0;
      try {
        let result: number = Math.min(a, b);
        expect(result).assertEqual(expected);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin10004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10004 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10005
     * @tc.name    testmathmin10005
     * @tc.desc    Check min with zero and positive number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10005 start');
      try {
        expect(Math.min(0, 10)).assertEqual(0);
        expect(Math.min(3.14, 0)).assertEqual(0);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10005 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10006
     * @tc.name    testmathmin10006
     * @tc.desc    Check min with zero and negative number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10006 start');
      try {
        expect(Math.min(0, -5)).assertEqual(-5);
        expect(Math.min(-2.5, 0)).assertEqual(-2.5);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10006 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10007
     * @tc.name    testmathmin10007
     * @tc.desc    Check min with large magnitude numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10007 start');
      try {
        expect(Math.min(Number.MAX_VALUE, Number.MAX_VALUE - 1)).assertEqual(Number.MAX_VALUE - 1);
        expect(Math.min(-Number.MAX_VALUE, -Number.MAX_VALUE + 1)).assertEqual(-Number.MAX_VALUE);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10007 end');
      }
    });

    /**
     * @tc.number  TES_TMA-THMIN_10008
     * @tc.name    testmathmin10008
     * @tc.desc    Check min with non-integer values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10008 start');
      try {
        expect(Math.min(3.14159, 3.14)).assertEqual(3.14);
        expect(Math.min(-0.0001, -0.00001)).assertEqual(-0.0001);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10008 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10009
     * @tc.name    testmathmin10009
     * @tc.desc    Check min with special numeric values (Infinity)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10009 start');
      try {
        expect(Math.min(Infinity, 100)).assertEqual(100);
        expect(Math.min(-Infinity, -100)).assertEqual(-Infinity);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10009 end');
      }
    });

    /**
     * @tc.number  TES_TMA_THMIN_10010
     * @tc.name    testmathmin10010
     * @tc.desc    Check min with special numeric values (NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10010 start');
      try {
        expect(isNaN(Math.min(NaN, 5))).assertTrue();
        expect(isNaN(Math.min(10, NaN))).assertTrue();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10010 end');
      }
    });

    /**
     * @tc.number  TES_TMA_HMIN_10011
     * @tc.name    testmathmin10011
     * @tc.desc    Check min with multiple arguments
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10011 start');
      try {
        expect(Math.min(10, 5, 8, 2, 15)).assertEqual(2);
        expect(Math.min(-10, -5, 0, -20)).assertEqual(-20);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10011 end');
      }
    });

    /**
     * @tc.number  TsE_TMA_HMIN_10014
     * @tc.name    testmathmin10014
     * @tc.desc    Check min with very small fractional values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10014 start');
      try {
        expect(Math.min(0.0000000001, 0.0000000002)).assertEqual(0.0000000001);
        expect(Math.min(1e-15, 2e-15)).assertEqual(1e-15);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10014 end');
      }
    });

    /**
     * @tc.number  TsE_TMA_HMIN_10015
     * @tc.name    testmathmin10015
     * @tc.desc    Check min with different numeric types (integer vs float)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10015 start');
      try {
        expect(Math.min(5, 5.0)).assertEqual(5);
        expect(Math.min(3, 2.999)).assertEqual(2.999);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10015 end');
      }
    });

    /**
     * @tc.number  TETMATHMIN_10016
     * @tc.name    testmathmin10016
     * @tc.desc    Check min with more than two arguments
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10016 start');
      try {
        expect(Math.min(15, 8, 20, 3, 25)).assertEqual(3);
        expect(Math.min(-5, -10, 0, -15, 10)).assertEqual(-15);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10016 end');
      }
    });

    /**
     * @tc.number  TSE_TMA_HMIN_1017
     * @tc.name    testmathmin1017
     * @tc.desc    Check min with mixed special values (Infinity and NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin1017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin1017 start');
      try {
        expect(isNaN(Math.min(Infinity, NaN))).assertTrue();
        expect(Math.min(-Infinity, Number.MIN_VALUE)).assertEqual(-Infinity);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin1017 end');
      }
    });

    /**
     * @tc.number  TSE_TMA_HMIN_10018
     * @tc.name    testmathmin10018
     * @tc.desc    Check min with maximum safe integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
    */
    it("testmathmin10018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin10018 start');
      try {
        expect(Math.min(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER - 1))
          .assertEqual(Number.MAX_SAFE_INTEGER - 1);
        expect(Math.min(Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER + 1))
          .assertEqual(Number.MIN_SAFE_INTEGER);
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin10018 end');
      }
    });

    /**
     * @tc.number  TSE_TMAH_MIN_20001
     * @tc.name    testmathmin20001
     * @tc.desc    Positive dividend and divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20001 start');
      try {
        const result = mod(10.0, 3.0);
        expect(result).assertEqual(1.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20001 end');
      }
    });

    /**
     * @tc.number  TSE_TMAH_MIN_20002
     * @tc.name    testmathmin20002
     * @tc.desc    Negative dividend and positive divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20002 start');
      try {
        const result = mod(-10.0, 3.0);
        expect(result).assertEqual(-1.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20002 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20002 end');
      }
    });

    /**
     * @tc.number  TSE_TMAH_MIN_20003
     * @tc.name    testmathmin20003
     * @tc.desc    Positive dividend and negative divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20003 start');
      try {
        const result = mod(10.0, -3.0);
        expect(result).assertEqual(1.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20003 end');
      }
    });

    /**
     * @tc.number  TSE_TMAH_MIN_20004
     * @tc.name    testmathmin20004
     * @tc.desc    Negative dividend and divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20004 start');
      try {
        const result = mod(-10.0, -3.0);
        expect(result).assertEqual(-1.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20004 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20005
     * @tc.name    testmathmin20005
     * @tc.desc    Division by zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20005 start');
      try {
        const result = mod(5.0, 0.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20005 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20005 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20006
     * @tc.name    testmathmin20006
     * @tc.desc    Infinity dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20006 start');
      try {
        const result = mod(Infinity, 3.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20006 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20006 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20007
     * @tc.name    testmathmin20007
     * @tc.desc    Negative infinity divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20007 start');
      try {
        const result = mod(5.0, -Infinity);
        expect(result).assertEqual(5.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20007 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20007 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20008
     * @tc.name    testmathmin20008
     * @tc.desc    NaN input
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20008 start');
      try {
        const result = mod(NaN, NaN);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20008 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20008 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20009
     * @tc.name    testmathmin20009
     * @tc.desc    Large numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20009 start');
      try {
        const result = mod(1e20, 3.0);
        expect(result).assertEqual(1.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20009 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20009 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20010
     * @tc.name    testmathmin20010
     * @tc.desc    Zero dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20010 start');
      try {
        const result = mod(0.0, 5.0);
        expect(result).assertEqual(0.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20010 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20010 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20011
     * @tc.name    testmathmin20011
     * @tc.desc    Infinity dividend and divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20011 start');
      try {
        const result = mod(Infinity, Infinity);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20011 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20011 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20012
     * @tc.name    testmathmin20012
     * @tc.desc    Negative infinity dividend and divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20012 start');
      try {
        const result = mod(-Infinity, -Infinity);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20012 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20012 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20013
     * @tc.name    testmathmin20013
     * @tc.desc    Mixed-sign infinities
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20013 start');
      try {
        const result1 = mod(Infinity, -Infinity);
        const result2 = mod(-Infinity, Infinity);
        expect(isNaN(result1)).assertTrue();
        expect(isNaN(result2)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20013 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20013 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20014
     * @tc.name    testmathmin20014
     * @tc.desc    Zero dividend with zero divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20014 start');
      try {
        const result = mod(0.0, 0.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20014 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20014 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20015
     * @tc.name    testmathmin20015
     * @tc.desc    Zero dividend with Infinity divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20015 start');
      try {
        const result1 = mod(0.0, Infinity);
        const result2 = mod(0.0, -Infinity);
        expect(result1).assertEqual(0.0);
        expect(result2).assertEqual(0.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20015 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20015 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20016
     * @tc.name    testmathmin20016
     * @tc.desc    NaN with valid divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20016 start');
      try {
        const result = mod(NaN, 5.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20016 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20016 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20017
     * @tc.name    testmathmin20017
     * @tc.desc    Valid dividend with NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20017 start');
      try {
        const result = mod(10.0, NaN);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20017 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20017 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20018
     * @tc.name    testmathmin20018
     * @tc.desc    Infinity divisor with finite dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20018 start');
      try {
        const result1 = mod(15.0, Infinity);
        const result2 = mod(-15.0, Infinity);
        expect(result1).assertEqual(15.0);
        expect(result2).assertEqual(-15.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20018 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20018 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20019
     * @tc.name    testmathmin20019
     * @tc.desc    Negative infinity divisor with finite dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20019 start');
      try {
        const result1 = mod(15.0, -Infinity);
        const result2 = mod(-15.0, -Infinity);
        expect(result1).assertEqual(15.0);
        expect(result2).assertEqual(-15.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20019 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20019 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20020
     * @tc.name    testmathmin20020
     * @tc.desc    Dividend equal to divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20020 start');
      try {
        const result1 = mod(7.0, 7.0);
        const result2 = mod(-7.0, -7.0);
        expect(result1).assertEqual(0.0);
        expect(result2).assertEqual(-0.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20020 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20020 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20021
     * @tc.name    testmathmin20021
     * @tc.desc    Positive zero dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20021 start');
      try {
        const result = mod(0.0, 5.0);
        expect(result).assertEqual(0.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20021 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20021 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20023
     * @tc.name    TEST_MATH_MIN_20023
     * @tc.desc    Very small positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("TEST_MATH_MIN_20023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20023 start');
      try {
        const result = mod(Number.MIN_VALUE, 2.0);
        expect(result).assertEqual(Number.MIN_VALUE);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20023 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20023 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20024
     * @tc.name    testmathmin20024
     * @tc.desc    Very large values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20024 start');
      try {
        const divisor = Number.MAX_VALUE / 2;
        const result = mod(Number.MAX_VALUE, divisor);
        expect(Math.abs(result) < 1e-10).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20024 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20024 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20025
     * @tc.name    testmathmin20025
     * @tc.desc    Dividend slightly larger than divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20025 start');
      try {
        const result = mod(3.000000000000001, 3.0);
        const expected = 0.000000000000001;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20025 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20025 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20026
     * @tc.name    testmathmin20026
     * @tc.desc    Floating-point precision test (0.1+0.2 mod 0.1)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20026 start');
      try {
        const result = mod(0.1 + 0.2, 0.1);
        expect(Math.abs(result) < 1e-15).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20026 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20026 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20027
     * @tc.name    testmathmin20027
     * @tc.desc    Equal positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20027 start');
      try {
        const result = mod(7.5, 7.5);
        expect(result).assertEqual(0.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20027 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20027 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20029
     * @tc.name    testmathmin20029
     * @tc.desc    Subnormal number as dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20029 start');
      try {
        const subnormal = Number.MIN_VALUE / 2.0;
        const result = mod(subnormal, 2.0);
        expect(result).assertEqual(subnormal);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20029 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20029 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20030
     * @tc.name    testmathmin20030
     * @tc.desc    Divisor is negative zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20030 start');
      try {
        const result = mod(5.0, -0.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20030 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20030 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20031
     * @tc.name    testmathmin20031
     * @tc.desc    Dividend is negative infinity, divisor is finite
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20031 start');
      try {
        const result = mod(-Infinity, 3.0);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20031 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20031 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20032
     * @tc.name    testmathmin20032
     * @tc.desc    Both values negative infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20032 start');
      try {
        const result = mod(-Infinity, -Infinity);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20032 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20032 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20033
     * @tc.name    testmathmin20033
     * @tc.desc    Negative dividend with positive divisor (fractional)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20033 start');
      try {
        const result = mod(-10.5, 3.0);
        expect(result).assertEqual(-1.5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20033 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20033 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20034
     * @tc.name    testmathmin20034
     * @tc.desc    Positive dividend with negative divisor (fractional)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20034 start');
      try {
        const result = mod(10.5, -3.0);
        expect(result).assertEqual(1.5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20034 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20034 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20035
     * @tc.name    testmathmin20035
     * @tc.desc    Both values NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20035 start');
      try {
        const result = mod(NaN, NaN);
        expect(isNaN(result)).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20035 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20035 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20036
     * @tc.name    testmathmin20036
     * @tc.desc    Very close values (precision boundary)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20036 start');
      try {
        const value = 1.0000000000000002;
        const result = mod(value, 1.0);
        const expected = 0.0000000000000002;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20036 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20036 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20037
     * @tc.name    testmathmin20037
     * @tc.desc    Divisor is positive infinity, dividend finite
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20037 start');
      try {
        const result = mod(15.0, Infinity);
        expect(result).assertEqual(15.0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20037 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20037 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20038
     * @tc.name    testmathmin20038
     * @tc.desc    Dividend is MAX_VALUE, divisor is 1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20038 start');
      try {
        const result = mod(Number.MAX_VALUE, 1.0);
        expect(Math.abs(result) < 1e-10).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20038 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20038 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20039
     * @tc.name    testmathmin20039
     * @tc.desc    Dividend is MIN_VALUE, divisor is 1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20039 start');
      try {
        const result = mod(Number.MIN_VALUE, 1.0);
        expect(result).assertEqual(Number.MIN_VALUE);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20039 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20039 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_20040
     * @tc.name    testmathmin20040
     * @tc.desc    Mixed signs with fractional result
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin20040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin20040 start');
      try {
        const result = mod(-7.3, 3.2);
        const expected = -0.9;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin20040 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin20040 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30001
     * @tc.name    testmathmin30001
     * @tc.desc    Two positive integers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30001 start');
      try {
        expect(min(5, 10)).assertEqual(5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30001 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30002
     * @tc.name    testmathmin30002
     * @tc.desc    Two positive integers (second smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30002 start');
      try {
        expect(min(15, 8)).assertEqual(8);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30002 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30002 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30003
     * @tc.name    testmathmin30003
     * @tc.desc    Two negative integers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30003 start');
      try {
        expect(min(-10, -5)).assertEqual(-10);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30003 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_530004
     * @tc.name    testmathmin30004
     * @tc.desc    Two negative integers (second smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30004 start');
      try {
        expect(min(-3, -8)).assertEqual(-8);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30004 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30005
     * @tc.name    testmathmin30005
     * @tc.desc    Positive and negative integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30005 start');
      try {
        expect(min(7, -3)).assertEqual(-3);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30005 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30005 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30006
     * @tc.name    testmathmin30006
     * @tc.desc    Equal integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30006 start');
      try {
        expect(min(100, 100)).assertEqual(100);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30006 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30006 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30007
     * @tc.name    testmathmin30007
     * @tc.desc    Zero and positive integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30007 start');
      try {
        expect(min(0, 5)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30007 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30007 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30008
     * @tc.name    testmathmin30008
     * @tc.desc    Zero and negative integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30008 start');
      try {
        expect(min(0, -5)).assertEqual(-5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30008 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30008 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30009
     * @tc.name    testmathmin30009
     * @tc.desc    Maximum and minimum integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30009 start');
      try {
        const maxInt = Number.MAX_SAFE_INTEGER;
        const minInt = Number.MIN_SAFE_INTEGER;
        expect(min(maxInt, minInt)).assertEqual(minInt);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30009 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30009 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30010
     * @tc.name    testmathmin30010
     * @tc.desc    Large positive integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30010 start');
      try {
        expect(min(1000000, 999999)).assertEqual(999999);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30010 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30010 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30011
     * @tc.name    testmathmin30011
     * @tc.desc    Both zero → NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30011 start');
      try {
        expect(isNaN(mod(0, 0))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30011 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30011 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30012
     * @tc.name    testmathmin30012
     * @tc.desc    Negative infinity divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30012 start');
      try {
        expect(isNaN(mod(Number.NEGATIVE_INFINITY, 3))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30012 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30012 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30013
     * @tc.name    testmathmin30013
     * @tc.desc    Both positive infinity → NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30013 start');
      try {
        expect(isNaN(mod(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30013 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30013 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30014
     * @tc.name    testmathmin30014
     * @tc.desc    NaN dividend
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30014 start');
      try {
        expect(isNaN(mod(5, Number.NaN))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30014 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30014 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30015
     * @tc.name    testmathmin30015
     * @tc.desc    NaN divisor
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30022 start');
      try {
        expect(isNaN(mod(Number.NaN, 3))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30015 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30015 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30023_01
     * @tc.name    testmathmin30023
     * @tc.desc    Both NaN → NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30016 start');
      try {
        expect(isNaN(mod(Number.NaN, Number.NaN))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30016 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30016 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30017
     * @tc.name    testmathmin30017
     * @tc.desc    Two positive integers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30017 start');
      try {
        expect(min(2, 5)).assertEqual(2);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30017 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30017 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30019
     * @tc.name    testmathmin30019
     * @tc.desc    Both zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30019 start');
      try {
        expect(min(0, 0)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30019 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30019 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30018
     * @tc.name    testmathmin30018
     * @tc.desc    Two negative integers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30018 start');
      try {
        expect(min(-10, -1)).assertEqual(-10);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30018 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30018 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30020
     * @tc.name    testmathmin30020
     * @tc.desc    Minimum safe integer and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30020 start');
      try {
        expect(min(Number.MIN_SAFE_INTEGER, 0)).assertEqual(Number.MIN_SAFE_INTEGER);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30020 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30020 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30021
     * @tc.name    testmathmin30021
     * @tc.desc    Maximum safe integer and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30021 start');
      try {
        expect(min(Number.MAX_SAFE_INTEGER, 0)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30021 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30021 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30022
     * @tc.name    testmathmin30022
     * @tc.desc    Minimum safe integer and negative integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30022 start');
      try {
        expect(min(Number.MIN_SAFE_INTEGER, -1)).assertEqual(Number.MIN_SAFE_INTEGER);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30022 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30022 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30023
     * @tc.name    testmathmin3023
     * @tc.desc    Maximum safe integer and positive integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin3023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin3023 start');
      try {
        expect(min(Number.MAX_SAFE_INTEGER, 1)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin3023 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin3023 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30024
     * @tc.name    testmathmin30024
     * @tc.desc    Negative and positive (negative first)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30024 start');
      try {
        expect(min(-3, 7)).assertEqual(-3);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30024 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30024 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_30025
     * @tc.name    testmathmin30025
     * @tc.desc    Equal negative integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin30025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin30025 start');
      try {
        expect(min(-5, -5)).assertEqual(-5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin30025 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin30025 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40001
     * @tc.name    testmathmin40001
     * @tc.desc    First number is smaller
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40001 start');
      try {
        expect(min(5, 10)).assertEqual(5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40001 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40002
     * @tc.name    testmathmin40002
     * @tc.desc    Second number is smaller
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40002 start');
      try {
        expect(min(100, 50)).assertEqual(50);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40002 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40002 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40003
     * @tc.name    testmathmin40003
     * @tc.desc    Negative numbers (first is smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40003 start');
      try {
        expect(min(-10, -5)).assertEqual(-10);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40003 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40004
     * @tc.name    testmathmin40004
     * @tc.desc    Negative numbers (second is smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40004 start');
      try {
        expect(min(-3, -8)).assertEqual(-8);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40004 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40005
     * @tc.name    testmathmin40005
     * @tc.desc    Positive and negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40005 start');
      try {
        expect(min(15, -20)).assertEqual(-20);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40005 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40005 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40006
     * @tc.name    testmathmin40006
     * @tc.desc    Zero and positive number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40006 start');
      try {
        expect(min(0, 100)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40006 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40006 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40007
     * @tc.name    testmathmin40007
     * @tc.desc    Zero and negative number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40007 start');
      try {
        expect(min(-50, 0)).assertEqual(-50);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40007 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40007 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40008
     * @tc.name    testmathmin40008
     * @tc.desc    Both numbers are zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40008 start');
      try {
        expect(min(0, 0)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40008 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40008 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40009
     * @tc.name    testmathmin40009
     * @tc.desc    Large negative integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40009 start');
      try {
        expect(min(-999999, -1000000)).assertEqual(-1000000);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40009 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40009 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40010
     * @tc.name    testmathmin40010
     * @tc.desc    Equal positive numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40010 start');
      try {
        expect(min(123456, 123456)).assertEqual(123456);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40010 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40010 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40011
     * @tc.name    testmathmin40011
     * @tc.desc    Equal negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40011 start');
      try {
        expect(min(-7, -7)).assertEqual(-7);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40011 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40011 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40012
     * @tc.name    testmathmin40012
     * @tc.desc    MAX_SAFE_INTEGER boundary
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40012 start');
      try {
        const maxSafe = Number.MAX_SAFE_INTEGER;
        expect(min(maxSafe, maxSafe - 1)).assertEqual(maxSafe - 1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40012 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40012 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40013
     * @tc.name    testmathmin40013
     * @tc.desc    MIN_SAFE_INTEGER boundary
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40013 start');
      try {
        const minSafe = Number.MIN_SAFE_INTEGER;
        expect(min(minSafe, minSafe + 1)).assertEqual(minSafe);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40013 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40013 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40014
     * @tc.name    testmathmin40014
     * @tc.desc    Floating point numbers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40014 start');
      try {
        expect(min(3.14, 5.67)).assertEqual(3.14);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40014 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40014 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40015
     * @tc.name    testmathmin40015
     * @tc.desc    Floating point numbers with precision
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40015 start');
      try {
        expect(min(0.1 + 0.2, 0.3)).assertEqual(0.3);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40015 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40015 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40016
     * @tc.name    testmathmin40016
     * @tc.desc    Positive infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40016 start');
      try {
        expect(min(Infinity, 100)).assertEqual(100);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40016 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40016 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40017
     * @tc.name    testmathmin40017
     * @tc.desc    Negative infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40017 start');
      try {
        expect(min(-Infinity, -1000)).assertEqual(-Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40017 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40017 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40018
     * @tc.name    testmathmin40018
     * @tc.desc    NaN handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40018 start');
      try {
        expect(Number.isNaN(min(NaN, 5))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40018 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40018 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40019
     * @tc.name    testmathmin40019
     * @tc.desc    Very close floating point values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40019 start');
      try {
        expect(min(0.000000000000001, 0.000000000000002))
          .assertEqual(0.000000000000001);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40019 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40019 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40020
     * @tc.name    testmathmin40020
     * @tc.desc    Very large positive numbers (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40020 start');
      try {
        expect(min(1e100, 2e100)).assertEqual(1e100);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40020 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40020 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40021
     * @tc.name    testmathmin40021
     * @tc.desc    Very large negative numbers (second smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40021 start');
      try {
        expect(min(-1e100, -2e100)).assertEqual(-2e100);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40021 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40021 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40025
     * @tc.name    testmathmin40025
     * @tc.desc    MAX_VALUE boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40025 start');
      try {
        expect(min(Number.MAX_VALUE, Number.MAX_VALUE/2)).assertEqual(Number.MAX_VALUE/2);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40025 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40025 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40026
     * @tc.name    testmathmin40026
     * @tc.desc    Positive infinity vs negative infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40026 start');
      try {
        expect(min(Infinity, -Infinity)).assertEqual(-Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40026 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40026 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40027
     * @tc.name    testmathmin40027
     * @tc.desc    Two NaN values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40027 start');
      try {
        expect(Number.isNaN(min(NaN, NaN))).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40027 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40027 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40028
     * @tc.name    testmathmin40028
     * @tc.desc    Mixed integer and float (integer smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40028 start');
      try {
        expect(min(3, 4.5)).assertEqual(3);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40028 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40028 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40029
     * @tc.name    testmathmin40029
     * @tc.desc    Mixed integer and float (float smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40029 start');
      try {
        expect(min(7.2, 5)).assertEqual(5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40029 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40029 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40030
     * @tc.name    testmathmin40030
     * @tc.desc    Values near epsilon
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40030 start');
      try {
        expect(min(Number.EPSILON, Number.EPSILON * 2)).assertEqual(Number.EPSILON);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40030 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40030 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_40031
     * @tc.name    testmathmin40031
     * @tc.desc    Subnormal numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin40031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin40031 start');
      try {
        const subnormal = Number.MIN_VALUE / 2;
        expect(min(subnormal, 0)).assertEqual(subnormal);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin40031 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin40031 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50001
     * @tc.name    testmathmin50001
     * @tc.desc    Basic positive values (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50001 start');
      try {
        expect(min(5, 10)).assertEqual(5);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50001 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50003
     * @tc.name    testmathmin50003
     * @tc.desc    Negative values (first smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50003 start');
      try {
        expect(min(-20, -10)).assertEqual(-20);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50003 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50004
     * @tc.name    testmathmin50004
     * @tc.desc    Negative values (second smaller)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50004 start');
      try {
        expect(min(-5, -15)).assertEqual(-15);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50004 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50005
     * @tc.name    testmathmin50005
     * @tc.desc    Mixed positive/negative values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50005 start');
      try {
        expect(min(30, -30)).assertEqual(-30);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50005 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50005 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50006
     * @tc.name    testmathmin50006
     * @tc.desc    Zero and positive value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50006 start');
      try {
        expect(min(0, 200)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50006 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50006 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50007
     * @tc.name    testmathmin50007
     * @tc.desc    Zero and negative value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50007 start');
      try {
        expect(min(-100, 0)).assertEqual(-100);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50007 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50007 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50008
     * @tc.name    testmathmin50008
     * @tc.desc    Equal values (positive)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50008 start');
      try {
        expect(min(123, 123)).assertEqual(123);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50008 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50008 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50009
     * @tc.name    testmathmin50009
     * @tc.desc    Equal values (negative)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50009 start');
      try {
        expect(min(-45, -45)).assertEqual(-45);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50009 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50009 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50010
     * @tc.name    testmathmin50010
     * @tc.desc    SHORT boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50010 start');
      try {
        expect(min(-32768, 32767)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50010 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50010 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50011
     * @tc.name    testmathmin50011
     * @tc.desc    SHORT_MAX and SHORT_MIN boundary values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50011 start');
      try {
        expect(min(32767, -32768)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50011 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50011 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50012
     * @tc.name    testmathmin50012
     * @tc.desc    Both values zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50012 start');
      try {
        expect(min(0, 0)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50012 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50012 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50014
     * @tc.name    testmathmin50014
     * @tc.desc    SHORT_MAX and positive value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50014 start');
      try {
        expect(min(32767, 1)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50014 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50014 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50015
     * @tc.name    testmathmin50015
     * @tc.desc    SHORT_MIN and negative value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50015 start');
      try {
        expect(min(-32768, -1)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50015 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50015 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50016
     * @tc.name    testmathmin50016
     * @tc.desc    Positive infinity handling (should clamp to SHORT_MAX)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50016 start');
      try {
        const largeVal = Number.MAX_SAFE_INTEGER;
        expect(min(largeVal, 10)).assertEqual(10);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50016 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50016 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50017
     * @tc.name    testmathmin50017
     * @tc.desc    Negative infinity handling (should clamp to SHORT_MIN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50017 start');
      try {
        const smallVal = Number.MIN_SAFE_INTEGER;
        expect(min(smallVal, -10)).assertEqual(smallVal > -32768 ? -10 : smallVal);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50017 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50017 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50018
     * @tc.name    testmathmin50018
     * @tc.desc    Near boundary values (SHORT_MAX-1 and SHORT_MAX)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50018 start');
      try {
        expect(min(32766, 32767)).assertEqual(32766);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50018 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50018 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50019
     * @tc.name    testmathmin50019
     * @tc.desc    Near boundary values (SHORT_MIN and SHORT_MIN+1)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50019 start');
      try {
        expect(min(-32768, -32767)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50019 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50019 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50020
     * @tc.name    testmathmin50020
     * @tc.desc    Large positive difference
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50020 start');
      try {
        expect(min(10000, 10)).assertEqual(10);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50020 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50020 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50021
     * @tc.name    testmathmin50021
     * @tc.desc    Both values SHORT_MAX (boundary equal)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50021 start');
      try {
        expect(min(32767, 32767)).assertEqual(32767);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50021 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50021 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50022
     * @tc.name    testmathmin50022
     * @tc.desc    Both values SHORT_MIN (boundary equal)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50022 start');
      try {
        expect(min(-32768, -32768)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50022 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50022 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50023
     * @tc.name    testmathmin50023
     * @tc.desc    SHORT_MIN and small positive
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50023 start');
      try {
        expect(min(-32768, 1)).assertEqual(-32768);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50023 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50023 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50024
     * @tc.name    testmathmin50024
     * @tc.desc    SHORT_MAX and small negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50024 start');
      try {
        expect(min(32767, -1)).assertEqual(-1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50024 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50024 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50026
     * @tc.name    testmathmin50026
     * @tc.desc    Small negative difference (-1 and -2)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50026 start');
      try {
        expect(min(-1, -2)).assertEqual(-2);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50026 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50026 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50027
     * @tc.name    testmathmin50027
     * @tc.desc    Positive and negative with same magnitude (1 and -1)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50027 start');
      try {
        expect(min(1, -1)).assertEqual(-1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50027 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50027 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50028
     * @tc.name    testmathmin50028
     * @tc.desc    SHORT_MAX-1 and SHORT_MIN+1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50028 start');
      try {
        expect(min(32766, -32767)).assertEqual(-32767);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50028 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50028 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50029
     * @tc.name    testmathmin50029
     * @tc.desc    SHORT_MIN+1 and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50029 start');
      try {
        expect(min(-32767, 0)).assertEqual(-32767);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50029 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50029 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50030
     * @tc.name    testmathmin50030
     * @tc.desc    SHORT_MAX-1 and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50030 start');
      try {
        expect(min(32766, 0)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50030 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50030 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50031
     * @tc.name    testmathmin50031
     * @tc.desc    Positive near boundary (32766 and 32765)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50031 start');
      try {
        expect(min(32766, 32765)).assertEqual(32765);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50031 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50031 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50032
     * @tc.name    testmathmin50032
     * @tc.desc    Negative near boundary (-32767 and -32766)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50032 start');
      try {
        expect(min(-32767, -32766)).assertEqual(-32767);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50032 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50032 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MIN_50035
     * @tc.name    testmathmin50035
     * @tc.desc    MAX_SAFE_INTEGER and MIN_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin50035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathmin50035 start');
      try {
        expect(min(Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER)).assertEqual(Number.MIN_SAFE_INTEGER);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathmin50035 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathmin50035 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60001
     * @tc.name    testmathpower60001
     * @tc.desc    Test power function with normal positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60001 start');
      try {
        expect(power(2, 3)).assertEqual(8);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60001 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60001 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60002
     * @tc.name    testmathpower60002
     * @tc.desc    Test power function with negative base
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60002 start');
      try {
        expect(power(-2, 3)).assertEqual(-8);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60002 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60002 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60003
     * @tc.name    testmathpower60003
     * @tc.desc    Test power function with zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60003 start');
      try {
        expect(power(5, 0)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60003 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60003 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60004
     * @tc.name    testmathpower60004
     * @tc.desc    Test power function with zero base
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60004 start');
      try {
        expect(power(0, 5)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60004 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60004 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60005
     * @tc.name    testmathpower60005
     * @tc.desc    Test power function with base as doubleNaN and exponent as doubleInf
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60005 start');
      try {
        const result = power(NaN, Infinity);
        expect(result !== result).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60005 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60005 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60006
     * @tc.name    testmathpower60006
     * @tc.desc    Test power function with base as doubleInf and exponent as doubleInf
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60006 start');
      try {
        expect(power(Infinity, Infinity)).assertEqual(Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60006 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60006 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60007
     * @tc.name    testmathpower60007
     * @tc.desc    Test power function with base as doubleInf and exponent as doubleNegInf
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60007 start');
      try {
        expect(power(Infinity, -Infinity)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60007 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60007 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60008
     * @tc.name    testmathpower60008
     * @tc.desc    Test power function with base as doubleNegInf and exponent as odd integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60008 start');
      try {
        expect(power(-Infinity, 3)).assertEqual(-Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60008 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60008 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60009
     * @tc.name    testmathpower60009
     * @tc.desc    Test power function with base as doubleNegInf and exponent as even integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60009 start');
      try {
        expect(power(-Infinity, 2)).assertEqual(Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60009 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60009 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60010
     * @tc.name    testmathpower60010
     * @tc.desc    Test power function with exponent as NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60010 start');
      try {
        const result = power(2, NaN);
        expect(result !== result).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60010 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60010 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60011
     * @tc.name    testmathpower60011
     * @tc.desc    Test power function with zero base and zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60011 start');
      try {
        expect(power(0, 0)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60011 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60011 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60012
     * @tc.name    testmathpower60012
     * @tc.desc    Test power function with negative exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60012 start');
      try {
        expect(power(2, -3)).assertEqual(0.125);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60012 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60012 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60013
     * @tc.name    testmathpower60013
     * @tc.desc    Test power function with fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60013 start');
      try {
        expect(power(4, 0.5)).assertEqual(2);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60013 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60013 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60014
     * @tc.name    testmathpower60014
     * @tc.desc    Test power function with negative base and fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60014 start');
      try {
        const result = power(-4, 0.5);
        expect(result !== result).assertTrue();
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60014 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60014 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60015
     * @tc.name    testmathpower60015
     * @tc.desc    Test power function with base as doubleInf and exponent as negative number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60015 start');
      try {
        expect(power(Infinity, -2)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60015 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60015 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60016
     * @tc.name    testmathpower60016
     * @tc.desc    Test power function with base as doubleNegInf and exponent as negative odd integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60016 start');
      try {
        expect(1/power(-Infinity, -3)).assertEqual(-Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60016 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60016 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60017
     * @tc.name    testmathpower60017
     * @tc.desc    Test power function with base as NaN and exponent as zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60017 start');
      try {
        expect(power(NaN, 0)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60017 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60017 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60018
     * @tc.name    testmathpower60018
     * @tc.desc    Test power function with base as negative value and exponent as integer
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60018 start');
      try {
        expect(power(-3, 4)).assertEqual(81);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60018 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60018 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60023
     * @tc.name    testmathpower60023
     * @tc.desc    Test power with irrational exponent (π)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60023 start');
      try {
        const result = power(Math.E, Math.PI);
        expect(result).assertLarger(23.1);
        expect(result).assertLess(23.15);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60023 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60023 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60024
     * @tc.name    testmathpower60024
     * @tc.desc    Test power with base +0 and negative exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60024 start');
      try {
        expect(power(0, -5)).assertEqual(Infinity);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60024 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60024 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60026
     * @tc.name    testmathpower60026
     * @tc.desc    Test power with exponent as doubleMin and base >1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60026 start');
      try {
        expect(power(2, Number.MIN_VALUE)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60026 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60026 end');
      }
    });

    /**
     * @tc.number  TEST_MATH_POWER60027
     * @tc.name    testmathpower60027
     * @tc.desc    Test power with base 1 and exponent Infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower60027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'testmathpower60027 start');
      try {
        expect(power(1, Infinity)).assertEqual(1);
      } catch (error) {
        console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower60027 failed:', error);
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'testmathpower60027 end');
      }
    });
    });
}