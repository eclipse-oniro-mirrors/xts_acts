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

export default function math02Test() {

  describe("math02Test", (): void => {
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
     * @tc.number  TEST_MATH_POWER70001
     * @tc.name    testmathpower70001
     * @tc.desc    Test power2 function with positive infinity exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70001 start');
        try {
          const result = power2(Infinity);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70001 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70001 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70002
     * @tc.name    testmathpower70002
     * @tc.desc    Test power2 function with negative infinity exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70002 start');
        try {
          const result = power2(-Infinity);
          expect(result === 0).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70002 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70002 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70003
     * @tc.name    testmathpower70003
     * @tc.desc    Test power2 function with NaN exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70003 start');
        try {
          const result = power2(NaN);
          expect(result !== result).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70003 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70003 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70004
     * @tc.name    testmathpower70004
     * @tc.desc    Test power2 function with positive zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70004 start');
        try {
          const result = power2(0.0);
          expect(result === 1.0).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70004 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70004 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70005
     * @tc.name    testmathpower70005
     * @tc.desc    Test power2 function with negative zero exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70005 start');
        try {
          const result = power2(-0.0);
          expect(result === 1.0).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70005 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70005 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70006
     * @tc.name    testmathpower70006
     * @tc.desc    Test power2 function with positive integer exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70006 start');
        try {
          const result = power2(3);
          expect(result === 8).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70006 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70006 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70007
     * @tc.name    testmathpower70007
     * @tc.desc    Test power2 function with negative integer exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70007 start');
        try {
          const result = power2(-3);
          expect(result === 0.125).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70007 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70007 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70008
     * @tc.name    testmathpower70008
     * @tc.desc    Test power2 function with positive fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70008 start');
        try {
          const result = power2(0.5);
          expect(result === Math.sqrt(2)).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70008 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70008 end');
        }
      });

    /**
     * @tc.number  tTEST_MATH_POWER70009
     * @tc.name    testmathpower70009
     * @tc.desc    Test power2 function with negative fractional exponent
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70009 start');
        try {
          const result = power2(-0.5);
          const expected = 1 / Math.sqrt(2);
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70009 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70009 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70010
     * @tc.name    testmathpower70010
     * @tc.desc    Test power2 function with exponent as positive infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70010 start');
        try {
          const result = power2(Infinity);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70010 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70010 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70011
     * @tc.name    testmathpower70011
     * @tc.desc    Test power2 function with exponent 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70011 start');
        try {
          const result = power2(1);
          expect(result === 2).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70011 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70011 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70012
     * @tc.name    testmathpower70012
     * @tc.desc    Test power2 function with exponent -1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70012 start');
        try {
          const result = power2(-1);
          expect(result === 0.5).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70012 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70012 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70013
     * @tc.name    testmathpower70013
     * @tc.desc    Test power2 function with exponent 1024 (overflow)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70013 start');
        try {
          const result = power2(1024);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70013 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70013 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70015
     * @tc.name    testmathpower70015
     * @tc.desc    Test power2 function with exponent 1023 (max finite value)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70015 start');
        try {
          const result = power2(1023);
          const expected = 8.98846567431158e307;
          const epsilon = 1e292;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70015 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70015 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70016
     * @tc.name    testmathpower70016
     * @tc.desc    Test power2 function with exponent -1023 (min non-zero value)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70016 start');
        try {
          const result = power2(-1023);
          const expected = 1.1125369292536007e-308;
          const epsilon = 1e-320;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70016 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70016 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70017
     * @tc.name    testmathpower70017
     * @tc.desc    Test power2 function with exponent 2.5
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70017 start');
        try {
          const result = power2(2.5);
          const expected = 4 * Math.sqrt(2);
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70017 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70017 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70018
     * @tc.name    testmathpower70018
     * @tc.desc    Test power2 function with exponent -2.5
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70018 start');
        try {
          const result = power2(-2.5);
          const expected = 1 / (4 * Math.sqrt(2));
          const epsilon = 1e-6;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70018 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70018 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70019
     * @tc.name    testmathpower70019
     * @tc.desc    Test power2 function with exponent Number.MAX_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70019 start');
        try {
          const result = power2(Number.MAX_SAFE_INTEGER);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70019 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70019 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70020
     * @tc.name    testmathpower70020
     * @tc.desc    Test power2 function with exponent Number.MIN_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70020 start');
        try {
          const result = power2(Number.MIN_SAFE_INTEGER);
          expect(result === 0).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70020 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70020 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70021
     * @tc.name    testmathpower70021
     * @tc.desc    Test power2 with exponent as MAX_VALUE
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70021 start');
        try {
          const result = power2(Number.MAX_VALUE);
          expect(result === Infinity).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70021 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70021 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70022
     * @tc.name    testmathpower70022
     * @tc.desc    Test power2 with exponent as MIN_VALUE
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70022 start');
        try {
          const result = power2(Number.MIN_VALUE);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - 1) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70022 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70022 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70023
     * @tc.name    testmathpower70023
     * @tc.desc    Test power2 with exponent as EPSILON
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70023 start');
        try {
          const result = power2(Number.EPSILON);
          const expected = 1 + Number.EPSILON * Math.LN2;
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70023 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70023 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70025
     * @tc.name    testmathpower70025
     * @tc.desc    Test power2 with exponent 53 (max safe integer boundary)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70025 start');
        try {
          const result = power2(53);
          expect(result === 9007199254740992).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70025 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70025 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70026
     * @tc.name    testmathpower70026
     * @tc.desc    Test power2 with exponent -1074 (smallest denormalized)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70026 start');
        try {
          const result = power2(-1074);
          expect(result === Number.MIN_VALUE).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70026 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70026 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70027
     * @tc.name    testmathpower70027
     * @tc.desc    Test power2 with exponent 0.0001 (small positive fraction)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70027 start');
        try {
          const result = power2(0.0001);
          const expected = Math.pow(2, 0.0001);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70027 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70027 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_POWER70028
     * @tc.name    testmathpower70028
     * @tc.desc    Test power2 with exponent -0.0001 (small negative fraction)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathpower70028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathpower70028 start');
        try {
          const result = power2(-0.0001);
          const expected = Math.pow(2, -0.0001);
          const epsilon = 1e-15;
          const isClose = Math.abs(result - expected) < epsilon;
          expect(isClose).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathpower70028 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathpower70028 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80001
     * @tc.name    testmathrandom80001
     * @tc.desc    Test random function returns a value in [0.0, 1.0)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathrandom80001 start');
        try {
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathrandom80001 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathrandom80001 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80002
     * @tc.name    testmathrandom80002
     * @tc.desc    Test random function without seed
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathrandom80002 start');
        try {
          const result1 = random();
          const result2 = random();
          expect(result1 !== result2).assertTrue();
        } catch (error) {
          console.log(domain, tag, '%{public}s, error: %{public}s', 'testmathrandom80002 failed:', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testmathrandom80002 end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80004
     * @tc.name    testmathrandom80004
     * @tc.desc    Verify different seeds produce different sequences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testSeedChangeBehavior start');
        try {
          seedRandom(999);
          const seqA = random();
          seedRandom(1000);
          const seqB = random();
          expect(seqA === seqB).assertFalse();
        } catch (error) {
          console.log(domain, tag, 'Seed change test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testSeedChangeBehavior end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80006
     * @tc.name    testmathrandom80006
     * @tc.desc    Verify minimum return value boundary
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomLowerBound start');
        try {
          let minValue = 1.0;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val < minValue) {
              minValue = val;
            }
          }
          expect(minValue).assertLargerOrEqual(0.0);
          console.log(domain, tag, 'Minimum observed value: %{public}f', minValue);
        } catch (error) {
          console.log(domain, tag, 'Lower bound test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomLowerBound end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80007
     * @tc.name     testmathrandom80007
     * @tc.desc    Verify maximum return value is strictly less than 1.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomUpperBound start');
        try {
          let maxValue = 0.0;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val > maxValue) {
              maxValue = val;
            }
          }
          expect(maxValue).assertLess(1.0);
          console.log(domain, tag, 'Maximum observed value: %{public}f', maxValue);
        } catch (error) {
          console.log(domain, tag, 'Upper bound test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomUpperBound end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80009
     * @tc.name    testmathrandom80009
     * @tc.desc    Verify values span the full [0.0, 1.0) range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomValueSpread start');
        try {
          let hasNearZero = false;
          let hasNearOne = false;
          for (let i = 0; i < 100; i++) {
            const val = random();
            if (val < 0.1) {
              hasNearZero = true;
            }
            if (val > 0.9) {
              hasNearOne = true;
            }
          }
          expect(hasNearZero && hasNearOne).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'Value spread test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomValueSpread end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80010
     * @tc.name    testmathrandom80010
     * @tc.desc    Verify negative seeds produce valid sequences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomWithNegativeSeed start');
        try {
          seedRandom(-123456);
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'Negative seed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomWithNegativeSeed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80011
     * @tc.name    testmathrandom80011
     * @tc.desc    Verify consecutive values in a sequence are distinct
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomSequenceUniqueness start');
        try {
          const values = new Set<number>();
          const sequenceLength = 100;
          for (let i = 0; i < sequenceLength; i++) {
            values.add(random());
          }
          expect(values.size).assertLarger(sequenceLength * 0.99);
        } catch (error) {
          console.log(domain, tag, 'Sequence uniqueness test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomSequenceUniqueness end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80012
     * @tc.name    testmathrandom80012
     * @tc.desc    Verify sequence continues correctly without reseeding
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomWithoutReseeding start');
        try {
          seedRandom(100);
          const first = random();
          const second = random();
          const third = random();
          expect(first !== second && second !== third).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'Sequence continuation test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomWithoutReseeding end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80013
     * @tc.name    testmathrandom80013
     * @tc.desc    Verify seed=0 produces valid sequence
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomWithZeroSeed start');
        try {
          seedRandom(0);
          const result = random();
          expect(result >= 0.0 && result < 1.0).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'Zero seed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomWithZeroSeed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_RANDOM_80015
     * @tc.name    testmathrandom80015
     * @tc.desc    Verify reseeding changes sequence mid-stream
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrandom80015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testRandomAfterReseed start');
        try {
          seedRandom(555);
          const val1 = random();
          const val2 = random();
          seedRandom(556);
          const val3 = random();
          expect(val1 === val3).assertFalse();
        } catch (error) {
          console.log(domain, tag, 'Mid-sequence reseed test failed: %{public}s', error);
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'testRandomAfterReseed end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90001
     * @tc.name    testmathrem90001
     * @tc.desc    Verify remainder when dividend is zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'ZeroDividend start');
        try {
          expect(rem(0.0, 5.5)).assertEqual(0.0);
          expect(rem(0.0, -3.2)).assertEqual(0.0);
        } catch (error) {
          console.log(domain, tag, 'ZeroDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'ZeroDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90002
     * @tc.name    testmathrem90002
     * @tc.desc    Verify remainder with special values (Infinity/NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'SpecialValues start');
        try {
          expect(isNaN(rem(NaN, 2.0))).assertTrue();
          expect(isNaN(rem(2.0, NaN))).assertTrue();
          expect(isNaN(rem(Infinity, 2.0))).assertTrue();
          expect(isNaN(rem(-Infinity, 2.0))).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'SpecialValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'SpecialValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90003
     * @tc.name    testmathrem90003
     * @tc.desc    Verify remainder when divisor is zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'DivisorZero start');
        try {
          expect(isNaN(rem(5.5, 0.0))).assertTrue();
          expect(isNaN(rem(-3.2, 0.0))).assertTrue();
        } catch (error) {
          console.log(domain, tag, 'DivisorZero failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'DivisorZero end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90004
     * @tc.name    testmathrem90004
     * @tc.desc    Verify banker's rounding behavior
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingBehavior start');
        try {
          expect(rem(5.0, 2.0)).assertEqual(1.0);
          expect(rem(7.0, 2.0)).assertEqual(-1.0);
          expect(rem(9.0, 2.0)).assertEqual(1.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingBehavior failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingBehavior end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90005
     * @tc.name    testmathrem90005
     * @tc.desc    Verify remainder for positive dividends and divisors
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'PositiveDivision start');
        try {
          expect(rem(6.0, 3.0)).assertEqual(0.0);
          expect(rem(10.0, 3.0)).assertEqual(1.0);
          expect(rem(11.0, 4.0)).assertEqual(-1.0);
          expect(rem(8.5, 1.0)).assertEqual(0.5);
        } catch (error) {
          console.log(domain, tag, 'PositiveDivision failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'PositiveDivision end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90006
     * @tc.name    testmathrem90006
     * @tc.desc    Verify remainder with negative dividends
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'NegativeDividend start');
        try {
          expect(rem(-5.0, 2.0)).assertEqual(-1.0);
          expect(rem(-7.5, 1.0)).assertEqual(0.5);
          expect(rem(-11.0, 4.0)).assertEqual(1.0);
        } catch (error) {
          console.log(domain, tag, 'NegativeDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'NegativeDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90007
     * @tc.name    testmathrem90007
     * @tc.desc    Verify remainder with negative divisors
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem90007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'NegativeDivisor start');
        try {
          expect(rem(5.0, -2.0)).assertEqual(1.0);
          expect(rem(8.5, -1.0)).assertEqual(0.5);
          expect(rem(10.0, -3.0)).assertEqual(1.0);
        } catch (error) {
          console.log(domain, tag, 'NegativeDivisor failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'NegativeDivisor end');
        }
      });

    /**
     * @tc.number  TEST_MATH_REM_90009
     * @tc.name    testmathrem9009_01
     * @tc.desc    Verify remainder when |dividend| < |divisor|
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathrem9009_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'SmallDividend start');
        try {
          expect(rem(2.5, 5.0)).assertEqual(2.5);
          expect(rem(3.5, 7.0)).assertEqual(3.5);
          expect(rem(3.0, 5.0)).assertEqual(-2.0);
        } catch (error) {
          console.log(domain, tag, 'SmallDividend failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'SmallDividend end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10001
     * @tc.name    testmathround10001
     * @tc.desc    Verify basic rounding behavior (positive/negative)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingBasic start');
        try {
          expect(round(2.3)).assertEqual(2.0);
          expect(round(2.7)).assertEqual(3.0);
          expect(round(5.0)).assertEqual(5.0);
          expect(round(-2.3)).assertEqual(-2.0);
          expect(round(-2.7)).assertEqual(-3.0);
          expect(round(-5.0)).assertEqual(-5.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingBasic failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingBasic end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10002
     * @tc.name    testmathround10002
     * @tc.desc    Verify special value handling (NaN/Infinity)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingSpecial start');
        try {
          expect(isNaN(round(NaN))).assertTrue();
          expect(round(Infinity)).assertEqual(Infinity);
          expect(round(-Infinity)).assertEqual(-Infinity);
          expect(round(0.0)).assertEqual(0.0);
          expect(round(-0.0)).assertEqual(-0.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingSpecial failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingSpecial end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10003
     * @tc.name    testmathround10003
     * @tc.desc    Verify rounding at midpoint (0.5) with even/odd integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingHalfway start');
        try {
          expect(round(2.5)).assertEqual(3.0);
          expect(round(3.5)).assertEqual(4.0);
          expect(round(4.5)).assertEqual(5.0);
          expect(round(-2.5)).assertEqual(-2.0);
          expect(round(-3.5)).assertEqual(-3.0);
          expect(round(-4.5)).assertEqual(-4.0);
          expect(round(0.5)).assertEqual(1.0);
          expect(round(-0.5)).assertEqual(-0.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingHalfway failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingHalfway end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10005
     * @tc.name    testmathround10005
     * @tc.desc    Verify integer values remain unchanged
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingIntegers start');
        try {
          expect(round(0.0)).assertEqual(0.0);
          expect(round(1.0)).assertEqual(1.0);
          expect(round(1000000.0)).assertEqual(1000000.0);
          expect(round(-0.0)).assertEqual(-0.0);
          expect(round(-1.0)).assertEqual(-1.0);
          expect(round(-1000000.0)).assertEqual(-1000000.0);
          expect(round(1e15)).assertEqual(1000000000000000.0);
          expect(round(-2e20)).assertEqual(-200000000000000000000.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingIntegers failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingIntegers end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10006
     * @tc.name    testmathround10006
     * @tc.desc    Verify denormalized number handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingSubnormal start');
        try {
          const minDouble = Number.MIN_VALUE;
          expect(round(minDouble)).assertEqual(0.0);
          expect(round(-minDouble)).assertEqual(-0.0);
          expect(round(0.0000000000000001)).assertEqual(0.0);
          expect(round(-0.0000000000000001)).assertEqual(-0.0);
          expect(round(0.5000000000000001)).assertEqual(1.0);
          expect(round(-0.5000000000000001)).assertEqual(-1.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingSubnormal failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingSubnormal end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10007
     * @tc.name    testmathround10007
     * @tc.desc    Verify rounding of large numbers (within safe integer range)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingLargeValues start');
        try {
          const maxSafeInt = 9007199254740991;
          expect(round(maxSafeInt - 0.5)).assertEqual(maxSafeInt - 1);
          expect(round(maxSafeInt + 0.4)).assertEqual(maxSafeInt);
          expect(round(maxSafeInt + 0.5)).assertEqual(maxSafeInt + 1);
          expect(round(-maxSafeInt + 0.5)).assertEqual(-maxSafeInt + 1);
          expect(round(-maxSafeInt - 0.5)).assertEqual(-maxSafeInt - 1);
        } catch (error) {
          console.log(domain, tag, 'RoundingLargeValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingLargeValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10010
     * @tc.name    testmathround10010
     * @tc.desc    Verify rounding at extreme values (near Number.MAX_VALUE)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingExtremes start');
        try {
          const maxValue = Number.MAX_VALUE;
          expect(round(maxValue)).assertEqual(maxValue);
          expect(round(-maxValue)).assertEqual(-maxValue);
          expect(round(maxValue - 0.5)).assertEqual(maxValue);
          expect(round(-maxValue + 0.5)).assertEqual(-maxValue + 1);
          expect(round(Infinity)).assertEqual(Infinity);
          expect(round(-Infinity)).assertEqual(-Infinity);
        } catch (error) {
          console.log(domain, tag, 'RoundingExtremes failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingExtremes end');
        }
      });

    /**
     * @tc.number  TEST_MATH_ROUND_10011
     * @tc.name    testmathround10011
     * @tc.desc    Verify edge cases in decimal representations
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathround10011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'RoundingDecimalEdgeCases start');
        try {
          expect(round(1.23456789)).assertEqual(1.0);
          expect(round(-9.87654321)).assertEqual(-10.0);
          expect(round(123456789.5)).assertEqual(123456790.0);
          expect(round(-123456789.5)).assertEqual(-123456789.0);
          expect(round(0.1 + 0.2)).assertEqual(0.0);
          expect(round(-(0.1 + 0.2))).assertEqual(-0.0);
        } catch (error) {
          console.log(domain, tag, 'RoundingDecimalEdgeCases failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'RoundingDecimalEdgeCases end');
        }
      });

    /**
     * @tc.number  TEST_MATH_MATH_11001
     * @tc.name    testmath11001
     * @tc.desc    Verify handling of NaN and infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnSpecialValues start');
      try {
        expect(isNaN(scalbn(NaN, 5))).assertTrue();
        expect(scalbn(Infinity, 10)).assertEqual(Infinity);
        expect(scalbn(-Infinity, -5)).assertEqual(-Infinity);
      } catch (error) {
        console.log(domain, tag, 'ScalbnSpecialValues failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnSpecialValues end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11002
     * @tc.name    testmath11002
     * @tc.desc    Verify handling at exponent boundaries
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnExponentBoundaries start');
      try {
        expect(scalbn(1.0, 1024)).assertEqual(Infinity);
        expect(scalbn(1.0, -1075)).assertEqual(0);
        expect(scalbn(Number.MAX_VALUE, 1)).assertEqual(Infinity);
        expect(scalbn(Number.MIN_VALUE, -1)).assertEqual(0);
      } catch (error) {
        console.log(domain, tag, 'ScalbnExponentBoundaries failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnExponentBoundaries end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11003
     * @tc.name    testmath11003
     * @tc.desc    Verify edge case handling
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnSpecialCases start');
      try {
        expect(scalbn(Number.MAX_SAFE_INTEGER, 1)).assertEqual(Number.MAX_SAFE_INTEGER * 2);
        expect(scalbn(Number.MIN_SAFE_INTEGER, 1)).assertEqual(Number.MIN_SAFE_INTEGER * 2);
        const minDouble = Number.MIN_VALUE;
        expect(scalbn(minDouble, 1)).assertEqual(minDouble * 2);
        expect(scalbn(minDouble, -1)).assertEqual(0);
        expect(scalbn(1.7976931348623157e308, 1)).assertEqual(Infinity);
      } catch (error) {
        console.log(domain, tag, 'ScalbnSpecialCases failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnSpecialCases end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11004
     * @tc.name    testmath11004
     * @tc.desc    Verify basic scaling operations
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnBasicOperations start');
      try {
        expect(scalbn(3, 2)).assertEqual(12);
        expect(scalbn(1.5, 3)).assertEqual(12);
        expect(scalbn(0.5, -1)).assertEqual(0.25);
        expect(scalbn(-2, 4)).assertEqual(-32);
        expect(scalbn(-0.25, -2)).assertEqual(-0.0625);
        expect(scalbn(123.456, 0)).assertEqual(123.456);
        expect(scalbn(-789.012, 0)).assertEqual(-789.012);
      } catch (error) {
        console.log(domain, tag, 'ScalbnBasicOperations failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnBasicOperations end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11005
     * @tc.name    testmath11005
     * @tc.desc    Verify precision handling for fractional values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnPrecisionHandling start');
      try {
        expect(scalbn(1.000000000000001, 50))
          .assertClose(1.1258999068426243e15, 1e-2);
        const result1 = scalbn(0.9999999999999999, -40);
        const expected1 = 9.094947017729283e-13;
        expect(Math.abs(result1 - expected1) < 1e-25).assertTrue();
        expect(scalbn(Number.EPSILON, 52)).assertClose(1, 1e-15);
        const result2 = scalbn(1 + Number.EPSILON, 0);
        const expected2 = 1.0000000000000002;
        expect(Math.abs(result2 - expected2) < 1e-16).assertTrue();
      } catch (error) {
        console.log(domain, tag, 'ScalbnPrecisionHandling failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnPrecisionHandling end');
      }
    });

    /**
     * @tc.number  TEST_MATH_MATH_11008
     * @tc.name    testmath11008
     * @tc.desc    Verify handling of extreme exponent values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmath11008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.log(domain, tag, '%{public}s', 'ScalbnExtremeValues start');
      try {
        expect(scalbn(1, 1023)).assertClose(8.98846567431158e307, 1e292);
        expect(scalbn(1, 1024)).assertEqual(Infinity);
        const minValue = scalbn(1, -1074);
        expect(minValue > 0).assertTrue();
        expect(minValue).assertEqual(5e-324);
        expect(scalbn(1, -1075)).assertEqual(0);
        expect(scalbn(Number.MAX_VALUE, 1)).assertEqual(Infinity);
        expect(scalbn(Number.MAX_VALUE, -1)).assertClose(8.98846567431158e307, 1e292);
        expect(scalbn(-Number.MAX_VALUE, 1)).assertEqual(-Infinity);
        expect(scalbn(-Number.MAX_VALUE, -1)).assertClose(-8.98846567431158e307, 1e292);
      } catch (error) {
        console.log(domain, tag, 'ScalbnExtremeValues failed: %{public}s', JSON.stringify(error));
        expect().assertFail();
      } finally {
        done();
        console.log(domain, tag, '%{public}s', 'ScalbnExtremeValues end');
      }
    });

    /**
     * @tc.number  TEST_MATH_SIGN_12001
     * @tc.name    testmathsign12001
     * @tc.desc    Verify trunc function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12001 start');
        try {
          expect(trunc(3.2)).assertEqual(3.0);
          expect(trunc(5.9)).assertEqual(5.0);
          expect(trunc(7.0)).assertEqual(7.0);
          console.log(domain, tag, '%{public}s', 'testMathSign12001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12002
     * @tc.name    testmathsign12002
     * @tc.desc    Verify trunc function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12002 start');
        try {
          expect(trunc(-3.2)).assertEqual(-3.0);
          expect(trunc(-5.9)).assertEqual(-5.0);
          expect(trunc(-7.0)).assertEqual(-7.0);
          console.log(domain, tag, '%{public}s', 'testMathSign12002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12003
     * @tc.name    testmathsign12003
     * @tc.desc    Verify trunc function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12003 start');
        try {
          expect(trunc(0.0)).assertEqual(0.0);
          expect(trunc(-0.0)).assertEqual(-0.0);
          console.log(domain, tag, '%{public}s', 'testMathSign12003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12004
     * @tc.name    testmathsign12004_01
     * @tc.desc    Verify trunc function with very small numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12004_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12004_01 start');
        try {
          expect(trunc(1e-14)).assertEqual(0.0);
          expect(trunc(-1e-14)).assertEqual(-0.0);
          console.log(domain, tag, '%{public}s', 'testMathSign12004_01 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12004_01: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12005
     * @tc.name    testmathsign12005
     * @tc.desc    Verify trunc function with very large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathsign12005 start');
        try {
          expect(trunc(Number.MAX_VALUE)).assertEqual(Number.MAX_VALUE);
          expect(trunc(-Number.MAX_VALUE)).assertEqual(-Number.MAX_VALUE);
          console.log(domain, tag, '%{public}s', 'testmathsign12005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12006
     * @tc.name    testmathsign12006
     * @tc.desc    Verify trunc function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12006 start');
        try {
          expect(trunc(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
          expect(trunc(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathSign12006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12007
     * @tc.name    testmathsign12007
     * @tc.desc    Verify trunc function with NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12007 start');
        try {
          expect(Number.isNaN(trunc(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSign12007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12008
     * @tc.name    testmathsign12008
     * @tc.desc    Verify sign function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12008 start');
        try {
          expect(sign(3.2)).assertEqual(1);
          expect(sign(5.9)).assertEqual(1);
          expect(sign(7.0)).assertEqual(1);
          expect(sign(Number.MAX_VALUE)).assertEqual(1);
          console.log(domain, tag, '%{public}s', 'testMathSign12008 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12009
     * @tc.name    testmathsign12009
     * @tc.desc    Verify sign function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12009 start');
        try {
          expect(sign(-3.2)).assertEqual(-1);
          expect(sign(-5.9)).assertEqual(-1);
          expect(sign(-7.0)).assertEqual(-1);
          expect(sign(-Number.MAX_VALUE)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign12009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12010
     * @tc.name    testmathsign12010_01
     * @tc.desc    Verify sign function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12010_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12010_01 start');
        try {
          expect(sign(0.0)).assertEqual(0);
          expect(sign(-0.0)).assertEqual(0);
          console.log(domain, tag, '%{public}s', 'testMathSign12010_01 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12010_01: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12011
     * @tc.name    testmathsign12011
     * @tc.desc    Verify sign function with positive infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12011 start');
        try {
          expect(sign(Number.POSITIVE_INFINITY)).assertEqual(1);
          console.log(domain, tag, '%{public}s', 'testMathSign12011 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12011: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12012
     * @tc.name    testmathsign12012
     * @tc.desc    Verify sign function with negative infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testmathsign12012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12012 start');
        try {
          expect(sign(Number.NEGATIVE_INFINITY)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign12012 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12012: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12016
     * @tc.name    testMathSign12016
     * @tc.desc    Verify sign function with values exactly at the 1e-13 threshold
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign12016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12016 start');
        try {
          expect(sign(1e-13)).assertEqual(1);
          expect(sign(-1e-13)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign12016 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12016: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_12018
     * @tc.name    testMathSign12018
     * @tc.desc    Verify sign function correctly handles values around zero
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign12018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign12018 start');
        try {
          expect(sign(9e-14)).assertEqual(1);
          expect(sign(1.1e-13)).assertEqual(1);
          expect(sign(-9e-14)).assertEqual(-1);
          expect(sign(-1.1e-13)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign12018 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign12018: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13001
     * @tc.name    testmathnewError13001
     * @tc.desc    Verify sign with common mathematical constants
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathnewError13001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'SignCommonValues start');
        try {
          expect(sign(Math.PI)).assertEqual(1);
          expect(sign(Math.E)).assertEqual(1);
          expect(sign(-Math.PI)).assertEqual(-1);
          expect(sign(-Math.E)).assertEqual(-1);
          expect(sign(Math.LN2)).assertEqual(1);
          expect(sign(Math.LN10)).assertEqual(1);
          expect(sign(-Math.LOG2E)).assertEqual(-1);
          expect(sign(-Math.LOG10E)).assertEqual(-1);
          expect(sign(Math.sin(0))).assertEqual(0);
          expect(sign(Math.cos(Math.PI))).assertEqual(-1);
          expect(sign(Math.tan(Math.PI / 4))).assertEqual(1);
          expect(sign(Math.exp(1))).assertEqual(1);
          expect(sign(Math.exp(0))).assertEqual(1);
          expect(sign(Math.exp(-100))).assertEqual(1);
        } catch (error) {
          console.log(domain, tag, 'SignCommonValues failed: %{public}s', JSON.stringify(error));
          expect().assertFail();
        } finally {
          done();
          console.log(domain, tag, '%{public}s', 'SignCommonValues end');
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_1301
     * @tc.name    testMathSignbit13001
     * @tc.desc    Verify signbit function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13001 start');
        try {
          expect(signbit(3.2)).assertFalse();
          expect(signbit(5.9)).assertFalse();
          expect(signbit(7.0)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13002
     * @tc.name    testMathSignbit13002
     * @tc.desc    Verify signbit function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13002 start');
        try {
          expect(signbit(-3.2)).assertTrue();
          expect(signbit(-5.9)).assertTrue();
          expect(signbit(-7.0)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13003
     * @tc.name    testMathSignbit13003
     * @tc.desc    Verify signbit function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13003 start');
        try {
          expect(signbit(0.0)).assertFalse();
          expect(signbit(-0.0)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13004
     * @tc.name    testMathSignbit13004
     * @tc.desc    Verify signbit function with very small numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13004 start');
        try {
          expect(signbit(0.1)).assertFalse();
          expect(signbit(-0.1)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13005
     * @tc.name    testMathSignbit13005
     * @tc.desc    Verify signbit function with very large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13005 start');
        try {
          expect(signbit(Number.MAX_VALUE)).assertFalse();
          expect(signbit(-Number.MAX_VALUE)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13006
     * @tc.name    testMathSignbit13006
     * @tc.desc    Verify signbit function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13006 start');
        try {
          expect(signbit(Number.POSITIVE_INFINITY)).assertFalse();
          expect(signbit(Number.NEGATIVE_INFINITY)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13008
     * @tc.name    testMathSignbit13008
     * @tc.desc    Verify signbit function with very small negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13008 start');
        try {
          expect(signbit(-0.0000001)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13008 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13009
     * @tc.name    testMathSignbit13009
     * @tc.desc    Verify signbit function with very small positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13009 start');
        try {
          expect(signbit(0.0000001)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13010
     * @tc.name    testMathSignbit13010
     * @tc.desc    Verify signbit function with maximum positive number
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13010 start');
        try {
          expect(signbit(Number.MAX_VALUE)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13010 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13010: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13011
     * @tc.name    testMathSignbit13011
     * @tc.desc    Verify signbit function with minimum negative number
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13011 start');
        try {
          expect(signbit(-Number.MAX_VALUE)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13011 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13011: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13012
     * @tc.name    testMathSignbit13012
     * @tc.desc    Verify signbit function with positive infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13012 start');
        try {
          expect(signbit(Number.POSITIVE_INFINITY)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13012 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13012: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13013
     * @tc.name    testMathSignbit13013
     * @tc.desc    Verify signbit function with negative infinity
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13013 start');
        try {
          expect(signbit(Number.NEGATIVE_INFINITY)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13013 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13013: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13014
     * @tc.name    testMathSignbit13014
     * @tc.desc    Verify signbit function with negative zero
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13014 start');
        try {
          expect(signbit(-0.0)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13014 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13014: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13016
     * @tc.name    testMathSignbit13016
     * @tc.desc    Verify signbit function with a positive integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13016 start');
        try {
          expect(signbit(10)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13016 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13016: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13017
     * @tc.name    testMathSignbit13017
     * @tc.desc    Verify signbit function with a negative integer
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13017 start');
        try {
          expect(signbit(-10)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13017 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13017: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGNBIT_13018
     * @tc.name    testMathSignbit13018
     * @tc.desc    Verify signbit function with positive zero
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSignbit13018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSignbit13018 start');
        try {
          expect(signbit(0.0)).assertFalse();
          console.log(domain, tag, '%{public}s', 'testMathSignbit13018 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSignbit13018: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14001
     * @tc.name    testMathSign14001
     * @tc.desc    Verify sign function with positive numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14001 start');
        try {
          expect(sign(3.2)).assertEqual(1);
          expect(sign(5.9)).assertEqual(1);
          expect(sign(7.0)).assertEqual(1);
          console.log(domain, tag, '%{public}s', 'testMathSign14001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14002
     * @tc.name    testMathSign14002
     * @tc.desc    Verify sign function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14002 start');
        try {
          expect(sign(-3.2)).assertEqual(-1);
          expect(sign(-5.9)).assertEqual(-1);
          expect(sign(-7.0)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign14002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14003
     * @tc.name    testMathSign14003
     * @tc.desc    Verify sign function with zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14003 start');
        try {
          expect(sign(0.0)).assertEqual(0);
          expect(sign(-0.0)).assertEqual(0);
          console.log(domain, tag, '%{public}s', 'testMathSign14003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14004
     * @tc.name    testMathSign14004
     * @tc.desc    Verify sign function with very small numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14004 start');
        try {
          expect(sign(1e-14)).assertEqual(1);
          expect(sign(-1e-14)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign14004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14005
     * @tc.name    testMathSign14005
     * @tc.desc    Verify sign function with very large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14005 start');
        try {
          expect(sign(Number.MAX_VALUE)).assertEqual(1);
          expect(sign(-Number.MAX_VALUE)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign14005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIGN_14006
     * @tc.name    testMathSign14006
     * @tc.desc    Verify sign function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSign14006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSign14006 start');
        try {
          expect(sign(Number.POSITIVE_INFINITY)).assertEqual(1);
          expect(sign(Number.NEGATIVE_INFINITY)).assertEqual(-1);
          console.log(domain, tag, '%{public}s', 'testMathSign14006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSign14006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14007
     * @tc.name    testMathSin14007
     * @tc.desc    Verify sin function with positive angles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14007 start');
        try {
          expect(Math.abs(sin(Math.PI / 2) - 1.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(Math.PI / 4) - Math.sqrt(2) / 2) < 1e-10).assertTrue();
          expect(Math.abs(sin(Math.PI / 6) - 0.5) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14008
     * @tc.name    testMathSin14008
     * @tc.desc    Verify sin function with negative angles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14008 start');
        try {
          expect(Math.abs(sin(-Math.PI / 2) + 1.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(-Math.PI / 4) + Math.sqrt(2) / 2) < 1e-10).assertTrue();
          expect(Math.abs(sin(-Math.PI / 6) + 0.5) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14008 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14009
     * @tc.name    testMathSin14009
     * @tc.desc    Verify sin function with zero angle
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14009 start');
        try {
          expect(sin(0.0)).assertEqual(0.0);
          expect(sin(-0.0)).assertEqual(-0.0);
          console.log(domain, tag, '%{public}s', 'testMathSin14009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14010
     * @tc.name    testMathSin14010
     * @tc.desc    Verify sin function with very small angles
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14010 start');
        try {
          const verySmall = 1e-10;
          expect(Math.abs(sin(verySmall) - verySmall) < 1e-20).assertTrue();
          expect(Math.abs(sin(-verySmall) + verySmall) < 1e-20).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14010 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14010: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14012
     * @tc.name    testMathSin14012
     * @tc.desc    Verify sin function with multiples of PI
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14012 start');
        try {
          expect(Math.abs(sin(Math.PI) - 0.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(2 * Math.PI) - 0.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(-Math.PI) - 0.0) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14012 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14012: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14013
     * @tc.name    testMathSin14013
     * @tc.desc    Verify sin function with PI/2 multiples
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14013 start');
        try {
          expect(Math.abs(sin(Math.PI / 2) - 1.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(3 * Math.PI / 2) + 1.0) < 1e-10).assertTrue();
          expect(Math.abs(sin(-Math.PI / 2) + 1.0) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14013 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14013: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14014
     * @tc.name    testMathSin14014
     * @tc.desc    Verify sin function with NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14014 start');
        try {
          expect(isNaN(sin(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14014 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14014: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SIN_14015
     * @tc.name    testMathSin14015
     * @tc.desc    Verify sin function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSin14015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSin14015 start');
        try {
          expect(isNaN(sin(Number.POSITIVE_INFINITY))).assertTrue();
          expect(isNaN(sin(Number.NEGATIVE_INFINITY))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSin14015 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSin14015: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16002
     * @tc.name    testMathSinh16002
     * @tc.desc    Verify sinh function with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16002 start');
        try {
          expect(Math.abs(sinh(-0.0) - 0.0) < 1e-10).assertTrue();
          expect(Math.abs(sinh(-1.0) - (-1.1752011936438014)) < 1e-10).assertTrue();
          expect(Math.abs(sinh(-2.0) - (-3.626860407847019)) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16003
     * @tc.name    testMathSinh16003
     * @tc.desc    Verify sinh function with zero value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16003 start');
        try {
          expect(Math.abs(sinh(0.0) - 0.0) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16004
     * @tc.name    testMathSinh16004
     * @tc.desc    Verify sinh function with very small numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16004 start');
        try {
          expect(Math.abs(sinh(1e-10) - 1e-10) < 1e-10).assertTrue();
          expect(Math.abs(sinh(-1e-10) - (-1e-10)) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16005
     * @tc.name    testMathSinh16005
     * @tc.desc    Verify sinh function with very large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16005 start');
        try {
          expect(sinh(Number.MAX_VALUE)).assertEqual(Number.POSITIVE_INFINITY);
          expect(sinh(-Number.MAX_VALUE)).assertEqual(Number.NEGATIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathSinh16005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16006
     * @tc.name    testMathSinh16006
     * @tc.desc    Verify sinh function with infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16006 start');
        try {
          expect(sinh(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
          expect(sinh(Number.NEGATIVE_INFINITY)).assertEqual(Number.NEGATIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathSinh16006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16007
     * @tc.name    testMathSinh16007
     * @tc.desc    Verify sinh function with NaN
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16007 start');
        try {
          expect(Number.isNaN(sinh(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16007: ${error}`);
          expect().assertFail();
        }
      })

    /**
     * @tc.number  TEST_MATH_SINH_16009
     * @tc.name    testMathSinh16009
     * @tc.desc    Verify sinh function with boundary values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16009 start');
        try {
          expect(Math.abs(sinh(Number.MIN_VALUE) - 0.0) < 1e-10).assertTrue();
          expect(Math.abs(sinh(-Number.MIN_VALUE) - 0.0) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SINH_16015
     * @tc.name    testMathSinh16015
     * @tc.desc    Verify sinh function input range
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSinh16015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSinh16015 start');
        try {
          expect(sinh(Number.MAX_VALUE)).assertEqual(Number.POSITIVE_INFINITY);
          expect(sinh(-Number.MAX_VALUE)).assertEqual(Number.NEGATIVE_INFINITY);
          expect(Math.abs(sinh(1e-300) - 1e-300) < 1e-310).assertTrue();
          expect(Math.abs(sinh(-1e-300) - (-1e-300)) < 1e-310).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSinh16015 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSinh16015: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17001
     * @tc.name    testMathSqrt17001
     * @tc.desc    Verify sqrt function with a negative number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17001 start');
        try {
          expect(Number.isNaN(sqrt(-1.0))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSqrt17001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17005
     * @tc.name    testMathSqrt17005
     * @tc.desc    Verify sqrt function with negative infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17002 start');
        try {
          expect(Number.isNaN(sqrt(Number.NEGATIVE_INFINITY))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSqrt17002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17006
     * @tc.name    testMathSqrt17006
     * @tc.desc    Verify sqrt function with NaN.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17003 start');
        try {
          expect(Number.isNaN(sqrt(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSqrt17003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17007
     * @tc.name    testMathSqrt17007
     * @tc.desc    Verify sqrt function with zero input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17004 start');
        try {
          expect(sqrt(0.0)).assertEqual(0.0);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17008
     * @tc.name    testMathSqrt17008
     * @tc.desc    Verify sqrt function with positive infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17005 start');
        try {
          expect(sqrt(Number.POSITIVE_INFINITY)).assertEqual(Number.POSITIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17009
     * @tc.name    testMathSqrt17009
     * @tc.desc    Verify sqrt function with perfect square input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17006 start');
        try {
          expect(sqrt(25.0)).assertEqual(5.0);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17010
     * @tc.name    testMathSqrt170010
     * @tc.desc    Verify sqrt function with fractional input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17007 start');
        try {
          expect(sqrt(0.25)).assertEqual(0.5);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17011
     * @tc.name    testMathSqrt170011
     * @tc.desc    Verify sqrt function with very large input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17008 start');
        try {
          const largeNum = 1e308;
          expect(sqrt(largeNum)).assertEqual(1e154);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17008 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17008: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17012
     * @tc.name    testMathSqrt17012
     * @tc.desc    Verify sqrt function with small positive input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17009 start');
        try {
          const smallNum = 1e-300;
          expect(sqrt(smallNum)).assertEqual(1e-150);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17009 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17009: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17013
     * @tc.name    testMathSqrt17013
     * @tc.desc    Verify sqrt function with irrational result.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17010 start');
        try {
          const result = sqrt(2);
          const squared = result * result;
          expect(Math.abs(squared - 2.0) < 1e-15).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSqrt17010 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17010: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17014
     * @tc.name    testMathSqrt17014
     * @tc.desc    Verify sqrt function with negative zero.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17011 start');
        try {
          const result = sqrt(-0.0);
          expect(1 / result).assertEqual(Number.NEGATIVE_INFINITY);
          console.log(domain, tag, '%{public}s', 'testMathSqrt17011 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17011: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_SQRT_17015
     * @tc.name    testMathSqrt17015
     * @tc.desc    Verify sqrt function with large negative input.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathSqrt17015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathSqrt17012 start');
        try {
          expect(Number.isNaN(sqrt(-1e308))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathSqrt17012 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathSqrt17012: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18001_01
     * @tc.name    testMathTan18001
     * @tc.desc    Verify tan function with NaN.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18001 start');
        try {
          expect(Number.isNaN(tan(Number.NaN))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18001 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18001: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18002
     * @tc.name    testMathTan18002
     * @tc.desc    Verify tan function with positive infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18002 start');
        try {
          expect(Number.isNaN(tan(Number.POSITIVE_INFINITY))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18002 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18002: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18001_02
     * @tc.name    testMathTan18001_01
     * @tc.desc    Verify tan function with negative infinity.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18001_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18003 start');
        try {
          expect(Number.isNaN(tan(Number.NEGATIVE_INFINITY))).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18003 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18003: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18004
     * @tc.name    testMathTan18004
     * @tc.desc    Verify tan function returns 0 for positive zero.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18004 start');
        try {
          expect(tan(0.0)).assertEqual(0.0);
          console.log(domain, tag, '%{public}s', 'testMathTan18004 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18004: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18005
     * @tc.name    testMathTan18005
     * @tc.desc    Verify tan function returns 0 for negative zero.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18005 start');
        try {
          expect(tan(-0.0)).assertEqual(-0.0);
          console.log(domain, tag, '%{public}s', 'testMathTan18005 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18005: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18006
     * @tc.name    testMathTan18006
     * @tc.desc    Verify tan function approaches +Infinity near π/2 from left.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18006 start');
        try {
          const epsilon = 1e-15;
          const result = tan(Math.PI / 2 - epsilon);
          expect(result > 0).assertTrue();
          expect(Math.log(result) > 20).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18006 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18006: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18007
     * @tc.name    testMathTan18007
     * @tc.desc    Verify tan function approaches -Infinity near π/2 from right.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18007 start');
        try {
          const result = tan(Math.PI / 2 + 1e-10);
          expect(result < -1e10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18007 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18007: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18011
     * @tc.name    testMathTan18011
     * @tc.desc    Verify tan(ε) ≈ ε for very small values.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18011 start');
        try {
          const epsilon = 1e-10;
          const result = tan(epsilon);
          const relativeError = Math.abs((result - epsilon) / epsilon);
          expect(relativeError < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18011 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18011: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18013
     * @tc.name    testMathTan18013
     * @tc.desc    Verify tan(π) ≈ 0.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18013 start');
        try {
          const result = tan(Math.PI);
          expect(Math.abs(result) < 1e-10).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18013 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18013: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18014
     * @tc.name    testMathTan18014
     * @tc.desc    Verify tan function with large value returns finite number.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18014 start');
        try {
          const largeValue = 1e10;
          const result = tan(largeValue);
          expect(Number.isFinite(result) || Number.isNaN(result)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18014 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18014: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18016
     * @tc.name    testMathTan18016
     * @tc.desc    Verify behavior near π/2 asymptote.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18016 start');
        try {
          const epsilon = 1e-6;
          const leftResult = tan(Math.PI / 2 - epsilon);
          expect(leftResult > 1e6).assertTrue();
          const rightResult = tan(Math.PI / 2 + epsilon);
          expect(rightResult < -1e6).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18016 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18016: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18017
     * @tc.name    testMathTan18017
     * @tc.desc    Verify tan with very small denormalized values.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18017 start');
        try {
          const denormal = Number.MIN_VALUE / 2;
          const result = tan(denormal);
          expect(Math.abs(result - denormal) < 1e-20).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18017 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18017: ${error}`);
          expect().assertFail();
        }
      });

    /**
     * @tc.number  TEST_MATH_TAN_18018
     * @tc.name    testMathTan18018
     * @tc.desc    Verify tan with Number.MAX_VALUE.
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testMathTan18018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testMathTan18018 start');
        try {
          const result = tan(Number.MAX_VALUE);
          expect(Number.isFinite(result) || Number.isNaN(result)).assertTrue();
          console.log(domain, tag, '%{public}s', 'testMathTan18018 end');
          done();
        } catch (error) {
          console.log(domain, tag, '%{public}s', `Error in testMathTan18018: ${error}`);
          expect().assertFail();
        }
      });
  });
}