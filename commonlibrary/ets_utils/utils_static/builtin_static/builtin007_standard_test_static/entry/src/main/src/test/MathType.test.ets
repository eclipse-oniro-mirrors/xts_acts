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

export default function mathTypeTest() {
  describe("mathTypeTest", (): void => {
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
    const getValidIntType = () => {
      const tempData: int = 0;
    };

    const getValidLambdaType = () => {
    };

    const getValidFunction = (): Function => {
      return () => "test result";
    };


    /**
     * @tc.number    MATH_FLOOR_001
     * @tc.name      testmathfloor0001
     * @tc.desc      Verify floor with positive decimal
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0001",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'Test case 0001 started');
        const input: double = 5.75;
        const expected: double = 5.0;
        expect(floor(input)).assertEqual(expected);
        done();
        console.log(domain, tag, 'Test case 0001 completed');
      });

    /**
     * @tc.number    MATH_FLOOR_002
     * @tc.name      testmathfloor0002
     * @tc.desc      Verify floor with negative decimal
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0002",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'Test case 0002 started');
        const input: double = -3.25;
        const expected: double = -4.0;
        expect(floor(input)).assertEqual(expected);
        done();
        console.log(domain, tag, 'Test case 0002 completed');
      });

    /**
     * @tc.number    MATH_FLOOR_003
     * @tc.name      testmathfloor0003
     * @tc.desc      Verify floor with integer input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0003",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'Test case 0003 started');
        const input: double = 10.0;
        const expected: double = 10.0;
        expect(floor(input)).assertEqual(expected);
        done();
        console.log(domain, tag, 'Test case 0003 completed');
      });

    /**
     * @tc.number    MATH_FLOOR_004
     * @tc.name      testmathfloor0004
     * @tc.desc      Verify floor with positive infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0004",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.POSITIVE_INFINITY;
        const expected: double = Number.POSITIVE_INFINITY;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_005
     * @tc.name      testmathfloor0005
     * @tc.desc      Verify floor with negative infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0005",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.NEGATIVE_INFINITY;
        const expected: double = Number.NEGATIVE_INFINITY;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_006
     * @tc.name      testmathfloor0006
     * @tc.desc      Verify floor with NaN input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0006",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.NaN;
        expect(isNaN(floor(input))).assertTrue();
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_007
     * @tc.name      testmathfloor0007
     * @tc.desc      Verify floor with large positive number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0007",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1.2345e+15;
        const expected: double = 1234500000000000.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_008
     * @tc.name      testmathfloor0008
     * @tc.desc      Verify floor with large negative number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0008",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -9.8765e+10;
        const expected: double = -98765000000.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_009
     * @tc.name      testmathfloor0009
     * @tc.desc      Verify floor with zero
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0009",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 0.0;
        const expected: double = 0.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_010
     * @tc.name      testmathfloor0010
     * @tc.desc      Verify floor with negative zero
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0010",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -0.0;
        const expected: double = -0.0;

        const result = floor(input);
        expect(result).assertEqual(expected);
        expect(1/result).assertEqual(Number.NEGATIVE_INFINITY);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_011
     * @tc.name      testmathfloor0011
     * @tc.desc      Verify floor with value at integer boundary (positive)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0011",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1.0000000000000001;
        const expected: double = 1.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_012
     * @tc.name      testmathfloor0012
     * @tc.desc      Verify floor with value at integer boundary (negative)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0012",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -1.9999999999999999;
        const expected: double = -2.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_013
     * @tc.name      testmathfloor0013
     * @tc.desc      Verify floor with maximum safe integer
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0013",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.MAX_SAFE_INTEGER - 0.5;
        const expected: double = Number.MAX_SAFE_INTEGER - 1;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_015
     * @tc.name      testmathfloor0015
     * @tc.desc      Verify floor with very small positive value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0015",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.MIN_VALUE;
        const expected: double = 0.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_016
     * @tc.name      testmathfloor0016
     * @tc.desc      Verify floor with very small negative value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0016",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -Number.MIN_VALUE;
        const expected: double = -1.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_017
     * @tc.name      testmathfloor0017
     * @tc.desc      Verify floor with value just below integer (positive)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0017",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 2.999999999999999;
        const expected: double = 2.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_019
     * @tc.name      testmathfloor0019
     * @tc.desc      Verify floor with exponent form (positive)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0019",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1.2345e-10;
        const expected: double = 0.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_020
     * @tc.name      testmathfloor0020
     * @tc.desc      Verify floor with exponent form (negative)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0020",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -5.6789e-15;
        const expected: double = -1.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_021
     * @tc.name      testmathfloor0021
     * @tc.desc      Verify floor with fractional part exactly 0.5 (positive)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0021",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 7.5;
        const expected: double = 7.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FLOOR_022
     * @tc.name      testmathfloor0022
     * @tc.desc      Verify floor with fractional part exactly 0.5 (negative)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfloor0022",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -7.5;
        const expected: double = -8.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number      MATH_FLOOR_023
     * @tc.name        testmathfloor0023
     * @tc.desc        Verify floor with denormalized number (positive)
     * @tc.level       LEVEL1
     * @tc.size        MEDIUMTEST
     * @tc.type        FUNCTION
     */
    it("testmathfloor0023",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        const input: double = Number.MIN_VALUE / 2;
        const expected: double = 0.0;
        expect(floor(input)).assertEqual(expected);
        done();
      });

    /**
      * @tc.number   MATH_HYPOT0001
      * @tc.name     testmathhypot0001
      * @tc.desc     Verify hypot with positive integers
      * @tc.level    LEVEL1
      * @tc.size     MEDIUMTEST
      * @tc.type     FUNCTION
      */
    it("testmathhypot0001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0001 start');
        expect(Math.hypot(3, 4)).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0001 end');
      });

    /**
      * @tc.number   MATH_HYPOT0002
      * @tc.name     testmathhypot0002
      * @tc.desc     Verify hypot with negative numbers
      * @tc.level    LEVEL1
      * @tc.size     MEDIUMTEST
      * @tc.type     FUNCTION
      */
    it("testmathhypot0002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0002 start');
        expect(Math.hypot(-3, -4)).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0002 end');
      });

    /**
     * @tc.number    MATH_HYPOT0003
     * @tc.name      testmathhypot0003
     * @tc.desc      Verify hypot with fractional values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0003 start');
        const result: number = Math.hypot(0.3, 0.4);
        const expected: number = 0.5;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0003 end');
      });

    /**
     * @tc.number    MATH_HYPOT0004
     * @tc.name      testmathhypot0004
     * @tc.desc      Verify hypot with positive infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0004 start');
        expect(Math.hypot(Number.POSITIVE_INFINITY, 5))
          .assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0004 end');
      });

    /**
     * @tc.number    MATH_HYPOT0005
     * @tc.name      testmathhypot0005
     * @tc.desc      Verify hypot with negative infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0005 start');
        expect(Math.hypot(Number.NEGATIVE_INFINITY, 5))
          .assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0005 end');
      });

    /**
     * @tc.number    MATH_HYPOT0006
     * @tc.name      testmathhypot0006
     * @tc.desc      Verify hypot with NaN
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0006 start');
        expect(Number.isNaN(Math.hypot(Number.NaN, 5))).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0006 end');
      });

    /**
     * @tc.number    MATH_HYPOT0007
     * @tc.name      testmathhypot0007
     * @tc.desc      Verify hypot with zero values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0007 start');
        expect(Math.hypot(0, 0)).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0007 end');
      });

    /**
     * @tc.number    MATH_HYPOT0008
     * @tc.name      testmathhypot0008
     * @tc.desc      Verify hypot with mixed signs
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0008 start');
        expect(Math.hypot(3, -4)).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0008 end');
      });

    /**
     * @tc.number    MATH_HYPOT0009
     * @tc.name      testmathhypot0009
     * @tc.desc      Verify hypot with large values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0009 start');
        const result: number = Math.hypot(1e100, 2e100);
        const expected: number = Math.sqrt(5) * 1e100;
        expect(Math.abs(result - expected) < 1e90).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0009 end');
      });

    /**
     * @tc.number    MATH_HYPOT0010
     * @tc.name      testmathhypot0010
     * @tc.desc      Verify hypot with three arguments
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0010 start');
        expect(Math.hypot(2, 3, 6)).assertEqual(7);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0010 end');
      });

    /**
     * @tc.number    MATH_FROUND_001
     * @tc.name      testmathfround0001
     * @tc.desc       Verify fround with integer value (exact representation)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0001",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 10.0;
        const expected: double = 10.0;
        expect(fround(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_002
     * @tc.name      testmathfround0002
     * @tc.desc      Verify fround with value that loses precision (1.337)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0002",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1.337;
        const expected: double = 1.3370000123977661;
        expect(fround(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_003
     * @tc.name      testmathfround0003
     * @tc.desc      Verify fround with negative value that loses precision (-5.05)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0003",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -5.05;
        const expected: double = -5.050000190734863;
        expect(fround(input)).assertEqual(expected);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_004
     * @tc.name      testmathfround0004
     * @tc.desc      Verify fround with positive infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0004",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.POSITIVE_INFINITY;
        expect(fround(input)).assertEqual(Number.POSITIVE_INFINITY);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_005
     * @tc.name      testmathfround0005
     * @tc.desc      Verify fround with negative infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0005",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.NEGATIVE_INFINITY;
        expect(fround(input)).assertEqual(Number.NEGATIVE_INFINITY);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_006
     * @tc.name      testmathfround0006
     * @tc.desc      Verify fround with NaN
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0006",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = Number.NaN;
        expect(isNaN(fround(input))).assertTrue();
        done();
      });

    /**
     * @tc.number    MATH_FROUND_007
     * @tc.name      testmathfround0007
     * @tc.desc      Verify fround with value that can be exactly represented (1.5)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0007",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1.5;
        expect(fround(input)).assertEqual(1.5);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_008
     * @tc.name      testmathfround0008
     * @tc.desc      Verify fround with large number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0008",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        const input: double = 3.4028234663852886e38;
        expect(fround(input)).assertEqual(3.4028234663852886e38);
        done();
      });

    /**
     * @tc.number   MATH_FROUND_009
     * @tc.name     testmathfround0009
     * @tc.desc     Verify fround with very small number
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathfround0009",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        const input: double = 1.401298464324817e-45;
        expect(fround(input)).assertEqual(1.401298464324817e-45);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_010
     * @tc.name      testmathfround0010
     * @tc.desc      Verify fround with value exceeding single-precision range
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0010",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = 1e40;
        expect(fround(input)).assertEqual(Number.POSITIVE_INFINITY);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_011
     * @tc.name      testmathfround0011
     * @tc.desc      Verify fround with denormalized number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0011",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        const input: double = Number.MIN_VALUE;
        expect(fround(input)).assertEqual(0.0);
        done();
      });

    /**
     * @tc.number    MATH_FROUND_012
     * @tc.name      testmathfround0012
     * @tc.desc      Verify fround with negative denormalized number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathfround0012",
      TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const input: double = -Number.MIN_VALUE;
        expect(fround(input)).assertEqual(-0.0);
        done();
      });

     /**
      * @tc.number   MATH_HYPOT_0011
      * @tc.name     testmathhypot0011
      * @tc.desc     Verify hypot with very small values
      * @tc.level    LEVEL1
      * @tc.size     MEDIUMTEST
      * @tc.type     FUNCTION
      */
    it("testmathhypot0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0011 start');
        const result: number = Math.hypot(1e-300, 2e-300);
        const expected: number = Math.sqrt(5) * 1e-300;
        expect(Math.abs(result - expected) < 1e-310).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0011 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0012
     * @tc.name      testmathhypot0012
     * @tc.desc      Verify hypot with one zero argument
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0012 start');
        expect(Math.hypot(0, 5)).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0012 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0013
     * @tc.name      testmathhypot0013
     * @tc.desc      Verify hypot with four arguments
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0013 start');
        expect(Math.hypot(1, 2, 2, 1)).assertEqual(Math.sqrt(10));
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0013 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0014
     * @tc.name      testmathhypot0014
     * @tc.desc      Verify hypot with Infinity and NaN
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0014 start');
        expect(Math.hypot(Number.POSITIVE_INFINITY, Number.NaN))
          .assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0014 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0015
     * @tc.name      testmathhypot0015
     * @tc.desc      Verify hypot with negative zero
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0015 start');
        expect(Math.hypot(-0, -0)).assertEqual(0);
        expect(1/Math.hypot(-0, -0)).assertEqual(Infinity);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0015 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0016
     * @tc.name      testmathhypot0016
     * @tc.desc      Verify hypot with mixed large and small values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0016",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0016 start');
        const result: number = Math.hypot(1e200, 1e-200);
        expect(result).assertEqual(1e200);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0016 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0017
     * @tc.name      testmathhypot0017
     * @tc.desc      Verify hypot with single argument
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0017 start');
        expect(Math.hypot(5)).assertEqual(5);
        expect(Math.hypot(-5)).assertEqual(5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0017 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0018
     * @tc.name      testmathhypot0018
     * @tc.desc      Verify hypot with maximum safe integers
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0018",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0018 start');
        const maxInt: number = Number.MAX_SAFE_INTEGER;
        const result: number = Math.hypot(maxInt, maxInt);
        const expected: number = Math.sqrt(2) * maxInt;
        expect(Math.abs(result - expected) < 1).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0018 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0019
     * @tc.name      testmathhypot0019
     * @tc.desc      Verify hypot with subnormal numbers
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0019",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0019 start');
        const minValue: number = Number.MIN_VALUE;
        const result: number = Math.hypot(minValue, minValue);
        const expected: number = Math.sqrt(2) * minValue;
        expect(Math.abs(result - expected) < 1e-320).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0019 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0020
     * @tc.name      testmathhypot0020
     * @tc.desc      Verify hypot with all NaN arguments
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0020",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0020 start');
        expect(Number.isNaN(Math.hypot(Number.NaN, Number.NaN))).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0020 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0021
     * @tc.name      testmathhypot0021
     * @tc.desc      Verify hypot with arguments causing overflow
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0021",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0021 start');
        const maxValue: number = Number.MAX_VALUE;
        const result: number = Math.hypot(maxValue, maxValue);
        expect(result).assertEqual(Infinity);
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0021 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0026
     * @tc.name      testmathhypot0026
     * @tc.desc      Verify hypot with identical arguments
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0026",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0026 start');
        const value: number = 7;
        const result: number = Math.hypot(value, value, value);
        const expected: number = Math.sqrt(3*value*value);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0026 end');
      });

    /**
     * @tc.number    MATH_HYPOT_0027
     * @tc.name      testmathhypot0027
     * @tc.desc      Verify hypot with decimal precision
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathhypot0027",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathhypot0027 start');
        const result: number = Math.hypot(0.1, 0.2);
        const expected: number = Math.sqrt(0.01 + 0.04);
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathhypot0027 end');
      });

    /**
     * @tc.number   MATH_IMUL_0100
     * @tc.name     testmathimul0001
     * @tc.desc     Verify imul with two positive integers
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0001", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(2, 3);
        expect(result).assertEqual(6);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0200
     * @tc.name     testmathimul0002
     * @tc.desc     Verify imul with negative and positive numbers
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0002", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(-5, 5);
        expect(result).assertEqual(-25);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0300
     * @tc.name     testmathimul0003
     * @tc.desc     Verify imul with fractional numbers (truncation behavior)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0003", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(2.5, 3.9);
        expect(result).assertEqual(6);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0400
     * @tc.name     testmathimul0004
     * @tc.desc     Verify imul with large numbers (32-bit overflow)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const a: double = 0xffffffff;
        const b: double = 2;
        const result: int = imul(a, b);
        expect(result).assertEqual(-2);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0500
     * @tc.name     testmathimul0005
     * @tc.desc     Verify imul with special values (Infinity)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0005", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(Infinity, 1);
        expect(result).assertEqual(0);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0600
     * @tc.name     testmathimul0006
     * @tc.desc     Verify imul with special values (NaN)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0006", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(NaN, 1);
        expect(result).assertEqual(0);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0700
     * @tc.name     testmathimul0007
     * @tc.desc     Verify imul with zero values
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0007", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(0, 100);
        expect(result).assertEqual(0);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0800
     * @tc.name     testmathimul0008
     * @tc.desc     Verify imul with maximum 32-bit integer values
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0008", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const maxInt: double = 0x7fffffff;
        const result: int = imul(maxInt, maxInt);
        expect(result).assertEqual(1);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_0900
     * @tc.name     testmathimul0009
     * @tc.desc     Verify imul with mixed integer and fractional values
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0009", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(10, 3.14159);
        expect(result).assertEqual(30);
        done();
      }
    );

    /**
     * @tc.number   MATH_IMUL_1000
     * @tc.name     testmathimul0010
     * @tc.desc     Verify imul with negative fractional values
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathimul0010", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: int = imul(-3.9, 4.2);
        expect(result).assertEqual(-12);
        done();
      }
    );

    /**
     * @tc.number   MATH_LOG_0001
     * @tc.name     testmathlog0001
     * @tc.desc     Verify log(1) equals 0
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0001 start');
        expect(Math.log(1)).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0001 end');
      });

    /**
     * @tc.number   MATH_LOG_0002
     * @tc.name     testmathlog0002
     * @tc.desc     Verify log(Math.E) equals 1
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0002 start');
        expect(Math.log(Math.E)).assertEqual(1);
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0002 end');
      });

    /**
     * @tc.number   MATH_LOG_0003
     * @tc.name     testmathlog0003
     * @tc.desc     Verify log(10) with precision
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0003 start');
        const num: double = 10.0;
        const result: number = Math.log(num);
        const expected: number = 2.302585092994046;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0003 end');
      });

    /**
     * @tc.number   MATH_LOG_0004
     * @tc.name     testmathlog0004
     * @tc.desc     Verify log(0) equals -Infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0004 start');
        expect(Math.log(0)).assertEqual(Number.NEGATIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0004 end');
      });

    /**
     * @tc.number   MATH_LOG_0005
     * @tc.name     testmathlog0005
     * @tc.desc     Verify log(Infinity) equals Infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0005 start');
        expect(Math.log(Number.POSITIVE_INFINITY))
          .assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0005 end');
      });

    /**
     * @tc.number   MATH_LOG_0006
     * @tc.name     testmathlog0006
     * @tc.desc     Verify log(-1) equals NaN
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0006 start');
        expect(Number.isNaN(Math.log(-1))).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0006 end');
      });

    /**
     * @tc.number   MATH_LOG_0007
     * @tc.name     testmathlog0007
     * @tc.desc     Verify log(NaN) equals NaN
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0007 start');
        expect(Number.isNaN(Math.log(Number.NaN))).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0007 end');
      });

    /**
     * @tc.number   MATH_LOG_0008
     * @tc.name     testmathlog0008
     * @tc.desc     Verify log(-Infinity) equals NaN
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0008 start');
        expect(Number.isNaN(Math.log(Number.NEGATIVE_INFINITY))).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0008 end');
      });

    /**
     * @tc.number   MATH_LOG_0009
     * @tc.name     testmathlog0009
     * @tc.desc     Verify log(0.5) with precision
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0009 start');
        const num: double = 0.5;
        const result: number = Math.log(num);
        const expected: number = -0.6931471805599453;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0009 end');
      });

    /**
     * @tc.number   MATH_LOG_0010
     * @tc.name     testmathlog0010
     * @tc.desc     Verify log(100) with precision
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0010 start');
        const num: double = 100.0;
        const result: number = Math.log(num);
        const expected: number = 4.605170185988092;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0010 end');
      });

    /**
     * @tc.number   MATH_LOG_0013
     * @tc.name     testmathlog0013
     * @tc.desc     Verify log(0.0) equals -Infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0013 start');
        expect(Math.log(0.0)).assertEqual(Number.NEGATIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0013 end');
      });

    /**
     * @tc.number   MATH_LOG_0014
     * @tc.name     testmathlog0014
     * @tc.desc     Verify log(1e-100) with precision
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0014 start');
        const result: number = Math.log(1e-100);
        const expected: number = -230.25850929940458;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0014 end');
      });

    /**
     * @tc.number   MATH_LOG_0015
     * @tc.name     testmathlog0015
     * @tc.desc     Verify log(1e100) with precision
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathlog0015 start');
        const result: number = Math.log(1e100);
        const expected: number = 230.25850929940458;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathlog0015 end');
      });

    /**
     * @tc.number   testmathexpm10002
     * @tc.name     testmathexpm10002
     * @tc.desc     Test expm1 with positive infinity, should return positive infinity.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10002", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathexpm10002 start');
        const input: number = Number.POSITIVE_INFINITY;
        const result: number = expm1(input);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'testmathexpm10002 end');
      });

    /**
     * @tc.number   MATH_EXPM1_0003
     * @tc.name     testmathexpm10003
     * @tc.desc     Test expm1 with negative infinity, should return -1.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathexpm10003 start');
        const input: number = Number.NEGATIVE_INFINITY;
        const result: number = expm1(input);
        expect(result).assertEqual(-1);
        done();
        console.log(domain, tag, '%{public}s', 'testmathexpm10003 end');
      });

    /**
     * @tc.number   MATH_EXPM1_0004
     * @tc.name     testExpm1WithZero
     * @tc.desc     Test expm1 with 0, should return 0.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testExpm1WithZero", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testExpm1WithZero start');
        const input: number = 0;
        const result: number = expm1(input);
        expect(result).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testExpm1WithZero end');
      });

    /**
     * @tc.number   MATH_EXPM1_0006
     * @tc.name     testExpm1WithNegativeValue
     * @tc.desc     Test expm1 with -1, should return approximately -0.63212.
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
    */
    it("testExpm1WithNegativeValue", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathexpm10006 start');
        const input: number = -1;
        const expected: number = -0.6321205588285577;
        const result: number = expm1(input);
        expect(Math.abs(result - expected) < 1e-12).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathexpm10006 end');
      });

   /**
    * @tc.number   MATH_EXPM1_0007
    * @tc.name     testmathexpm10007
    * @tc.desc     Test expm1 with NaN input
    * @tc.level    LEVEL1
    * @tc.size     MEDIUMTEST
    * @tc.type     FUNCTION
    */
    it("testmathexpm10007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10007 start');
      const result: number = expm1(Number.NaN);
      expect(isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10007 end');
    });

     /**
     * @tc.number   MATH_EXPM1_0008
     * @tc.name     testmathexpm10008
     * @tc.desc     Test expm1 with positive infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10008 start');
      const result: number = expm1(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10008 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0009
     * @tc.name     testmathexpm10009
     * @tc.desc     Test expm1 with negative infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10009 start');
      const result: number = expm1(Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(-1);
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10009 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0010
     * @tc.name     testmathexpm10010
     * @tc.desc     Test expm1 with zero input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10010 start');
      const result: number = expm1(0);
      expect(result).assertEqual(0);
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10010 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0011
     * @tc.name     testmathexpm10011
     * @tc.desc     Test expm1 with positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10011", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10011 start');
      const result: number = expm1(1);
      const expected: number = Math.exp(1) - 1;
      expect(Math.abs(result - expected) < 1e-10).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10011 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0001
     * @tc.name     testmathlog1p0001
     * @tc.desc     Test log1p with NaN input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0001", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0001 start');
      const result: double = log1p(NaN);
      expect(Number.isNaN(result)).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0001 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0002
     * @tc.name     testmathlog1p0002
     * @tc.desc     Test log1p with positive infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0002", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0002 start');
      const result: double = log1p(Infinity);
      expect(result).assertEqual(Infinity);
      console.log(domain, tag, '%{public}s', 'testmathlog1p0002 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0003
     * @tc.name     testmathlog1p0003
     * @tc.desc     Test log1p with negative infinity
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0003", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0003 start');
      const result: double = log1p(-Infinity);
      expect(Number.isNaN(result)).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0003 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0004
     * @tc.name     testmathlog1p0004
     * @tc.desc     Test log1p with zero input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0004", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0004 start');
      const result: double = log1p(0.0);
      expect(result).assertEqual(0.0);
      console.log(domain, tag, '%{public}s', 'testmathlog1p0004 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0005
     * @tc.name     testmathlog1p0005
     * @tc.desc     Test log1p with positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0005", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0005 start');
      const result: double = log1p(1.0);
      const expected: double = Math.log(2.0);
      expect(Math.abs(result - expected) < 1e-9).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0005 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0006
     * @tc.name     testmathlog1p0006
     * @tc.desc     Test log1p with negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0006", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0006 start');
      const num1: double = -0.5;
      const result: double = log1p(num1);
      const num2: double = 0.5;
      const expected: double = Math.log(num2);
      expect(Math.abs(result - expected) < 1e-9).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0006 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0007
     * @tc.name     testmathlog1p0007
     * @tc.desc     Test log1p with very small positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0007", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0007 start');
      const v: double = 1e-15;
      const result: double = log1p(v);
      expect(Math.abs(result - v) < 1e-15).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0007 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0008
     * @tc.name     testmathlog1p0008
     * @tc.desc     Test log1p with value close to -1 (but not less than -1)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0008", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0008 start');
      const v: double = -0.999999;
      const result: double = log1p(v);
      const expected: double = Math.log(0.000001);
      expect(Math.abs(result - expected) < 1e-6).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0008 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0009
     * @tc.name     testmathlog1p0009
     * @tc.desc     Test log1p with large positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0009", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0009 start');
      const v: double = 1e10;
      const result: double = log1p(v);
      const expected: double = Math.log(1e10 + 1);
      expect(Math.abs(result - expected) < 1e-6).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0009 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0010
     * @tc.name     testmathlog1p0010
     * @tc.desc     Test log1p with value exactly -1
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0010", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0010 start');
      const result: double = log1p(-1.0);
      expect(result).assertEqual(-Infinity);
      console.log(domain, tag, '%{public}s', 'testmathlog1p0010 end');
    });

    /**
     * @tc.number   MATH_LOG1P_0011
     * @tc.name     testmathlog1p0011
     * @tc.desc     Test log1p with value less than -1 (invalid input)
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog1p0011", TestType.FUNCTION | Size. MEDIUMTEST | Level.LEVEL1, (): void => {
      console.log(domain, tag, '%{public}s', 'testmathlog1p0011 start');
      const result: double = log1p(-1.000001);
      expect(Number.isNaN(result)).assertTrue();
      console.log(domain, tag, '%{public}s', 'testmathlog1p0011 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0012
     * @tc.name     testmathexpm10012
     * @tc.desc     Test expm1 with negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10012", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10012 start');
      const result: number = expm1(-1);
      const expected: number = Math.exp(-1) - 1;
      expect(Math.abs(result - expected) < 1e-10).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10012 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0013
     * @tc.name     testmathexpm10013
     * @tc.desc     Test expm1 with large positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10013", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10013 start');
      const result: number = expm1(10);
      const expected: number = Math.exp(10) - 1;
      expect(Math.abs(result - expected) < 1e-6).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10013 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0014
     * @tc.name     testmathexpm10014
     * @tc.desc     Test expm1 with very small positive value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10014", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10014 start');
      const input: number = 1e-10;
      const result: number = expm1(input);
      const approx: number = input + (input * input) / 2;
      expect(Math.abs(result - approx) < 1e-20).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10014 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0015
     * @tc.name     testmathexpm10015
     * @tc.desc     Test expm1 with very small negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10015", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10015 start');
      const input: number = -1e-10;
      const result: number = expm1(input);
      const approx: number = input + (input * input) / 2;
      expect(Math.abs(result - approx) < 1e-20).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10015 end');
    });

    /**
     * @tc.number   MATH_EXPM1_0016
     * @tc.name     testmathexpm10016
     * @tc.desc     Test expm1 with large negative value
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathexpm10016", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathexpm10016 start');
      const result: number = expm1(-100);
      expect(Math.abs(result - (-1)) < 1e-10).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathexpm10016 end');
    });

    /**
     * @tc.number   MATH_LOG2_0001
     * @tc.name     testmathlog20001
     * @tc.desc     Test log2 with positive infinity input
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it("testmathlog20001", TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0001 started');
      const result: number = log2(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
      done();
      console.log(domain, tag, 'Test 0001 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0002
     * @tc.name      testmathlog20002
     * @tc.desc      Test log2 with negative infinity input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0002 started');
      const result: number = log2(Number.NEGATIVE_INFINITY);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0002 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0003
     * @tc.name      testmathlog20003
     * @tc.desc      Test log2 with NaN input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0003 started');
      const result: number = log2(Number.NaN);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0003 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0004
     * @tc.name      testmathlog20004
     * @tc.desc      Test log2 with zero input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0004 started');
      const result: number = log2(0);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
      done();
      console.log(domain, tag, 'Test 0004 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0005
     * @tc.name      testmathlog20005
     * @tc.desc      Test log2 with integer input (power of 2)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0005 started');
      const result: number = log2(8);
      expect(result).assertEqual(3);
      done();
      console.log(domain, tag, 'Test 0005 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0006
     * @tc.name      testmathlog20006
     * @tc.desc      Test log2 with fractional input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0006 started');
      const result: number = log2(0.5);
      expect(result).assertEqual(-1);
      done();
      console.log(domain, tag, 'Test 0006 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0007
     * @tc.name      testmathlog20007
     * @tc.desc      Test log2 with negative number input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0007 started');
      const result: number = log2(-10);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0007 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0008
     * @tc.name      testmathlog20008
     * @tc.desc      Test log2 with precision validation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0008 started');
      const result: number = log2(10);
      expect(result > 3.32 && result < 3.33).assertTrue();
      done();
      console.log(domain, tag, 'Test 0008 completed');
    });

   /**
    * @tc.number     MATH_LOG10_0001
    * @tc.name       testmathlog100001
    * @tc.desc       Test log10 with positive infinity
    * @tc.level      LEVEL1
    * @tc.size       MEDIUMTEST
    * @tc.type       FUNCTION
    */
    it("testmathlog100001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100001 start');
      let v: double = Number.POSITIVE_INFINITY;
      let result: double = log10(v);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100001 end');
    });

    /**
     * @tc.number    MATH_LOG10_0002
     * @tc.name      testmathlog100002
     * @tc.desc      Test log10 with negative infinity
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100002 start');
      let v: double = Number.NEGATIVE_INFINITY;
      let result: double = log10(v);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100002 end');
    });

    /**
     * @tc.number    MATH_LOG10_0003
     * @tc.name      testmathlog100003
     * @tc.desc      Test log10 with NaN
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100003 start');
      let v: double = Number.NaN;
      let result: double = log10(v);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100003 end');
    });

    /**
     * @tc.number    MATH_LOG10_0004
     * @tc.name      testmathlog100004
     * @tc.desc      Test log10 with 0
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100004 start');
      let v: double = 0.0;
      let result: double = log10(v);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100004 end');
    });

    /**
     * @tc.number    MATH_LOG10_0008
     * @tc.name      testmathlog100008
     * @tc.desc      Test log10 with negative number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100008 start');
      let v: double = -1.0;
      let result: double = log10(v);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100008 end');
    });

    /**
     * @tc.number    MATH_LOG2_0009
     * @tc.name      testmathlog20009
     * @tc.desc      Test log2 with input 1 (should be 0)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0009 started');
      const result: number = log2(1);
      expect(result).assertEqual(0);
      done();
      console.log(domain, tag, 'Test 0009 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0010
     * @tc.name      testmathlog20010
     * @tc.desc      Test log2 with large input value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0010 started');
      const result: number = log2(1024);
      expect(result).assertEqual(10);
      done();
      console.log(domain, tag, 'Test 0010 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0011
     * @tc.name      testmathlog20011
     * @tc.desc      Test log2 with very small positive number
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0011 started');
      const result: number = log2(0.0009765625);
      expect(result).assertEqual(-10);
      done();
      console.log(domain, tag, 'Test 0011 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0012
     * @tc.name      testmathlog20012
     * @tc.desc      Test log2 with non-power-of-two input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0012 started');
      const result: number = log2(12);
      expect(result > 3.58 && result < 3.59).assertTrue();
      done();
      console.log(domain, tag, 'Test 0012 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0013
     * @tc.name      testmathlog20013
     * @tc.desc      Test log2 with negative fraction input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0013 started');
      const result: number = log2(-0.5);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0013 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0014
     * @tc.name      testmathlog20014
     * @tc.desc      Test log2 with input 2 (should be 1)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0014 started');
      const result: number = log2(2);
      expect(result).assertEqual(1);
      done();
      console.log(domain, tag, 'Test 0014 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0015
     * @tc.name      testmathlog20015
     * @tc.desc      Test log2 identity property (log2(2^x) = x)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0015 started');
      const exponent: number = 7;
      const value: number = Math.pow(2, exponent);
      const result: number = log2(value);
      expect(result).assertEqual(exponent);
      done();
      console.log(domain, tag, 'Test 0015 completed');
    });

    /**
     * @tc.number    MATH_LOG10_0019
     * @tc.name      testmathlog100019
     * @tc.desc      Test log10 with Number.MIN_VALUE (smallest positive number)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100019", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100019 start');
      let v: double = Number.MIN_VALUE;
      let result: double = log10(v);
      expect(result < 0).assertTrue();
      expect(Number.isFinite(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100019 end');
    });

    /**
     * @tc.number    MATH_LOG10_0020
     * @tc.name      testmathlog100020
     * @tc.desc      Test log10 with Number.MAX_VALUE (largest finite number)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog100020", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      
      console.log(domain, tag, '%{public}s', 'testmathlog100020 start');
      let v: double = Number.MAX_VALUE;
      let result: double = log10(v);
      expect(result > 0).assertTrue();
      expect(Number.isFinite(result)).assertTrue();
      done();
      console.log(domain, tag, '%{public}s', 'testmathlog100020 end');
    });

    /**
     * @tc.number    MATH_LOG2_0016
     * @tc.name      testmathlog20016
     * @tc.desc      Test log2 with Number.MAX_SAFE_INTEGER
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0016 started');
      const result: number = log2(Number.MAX_SAFE_INTEGER);
      expect(Number.isFinite(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0016 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0017
     * @tc.name      testmathlog20017
     * @tc.desc      Test log2 with Number.MIN_SAFE_INTEGER
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0017 started');
      const result: number = log2(Number.MIN_SAFE_INTEGER);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0017 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0018
     * @tc.name      testmathlog20018
     * @tc.desc      Test log2 with Number.MAX_VALUE
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0018 started');
      const result: number = log2(Number.MAX_VALUE);
      expect(Number.isFinite(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0018 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0019
     * @tc.name      testmathlog20019
     * @tc.desc      Test log2 with Number.MIN_VALUE
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0019 started');
      const result: number = log2(Number.MIN_VALUE);
      expect(result < -1000).assertTrue();
      done();
      console.log(domain, tag, 'Test 0019 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0020
     * @tc.name      testmathlog20020
     * @tc.desc      Test log2 with Number.EPSILON
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0020 started');
      const result: number = log2(Number.EPSILON);
      expect(result < 0).assertTrue();
      done();
      console.log(domain, tag, 'Test 0020 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0021
     * @tc.name      testmathlog20021
     * @tc.desc      Test log2 precision with fractional value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0021 started');
      const result: number = log2(1.5);
      expect(result > 0.584 && result < 0.585).assertTrue();
      done();
      console.log(domain, tag, 'Test 0021 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0022
     * @tc.name      testmathlog20022
     * @tc.desc      Test log2 with -1 input
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0022 started');
      const result: number = log2(-1);
      expect(Number.isNaN(result)).assertTrue();
      done();
      console.log(domain, tag, 'Test 0022 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0024
     * @tc.name      testmathlog20024
     * @tc.desc      Test log2 with very large exponent value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0024 started');
      const exponent: number = 100;
      const value: number = Math.pow(2, exponent);
      const result: number = log2(value);
      expect(result).assertEqual(exponent);
      done();
      console.log(domain, tag, 'Test 0024 completed');
    });

    /**
     * @tc.number    MATH_LOG2_0025
     * @tc.name      testmathlog20025
     * @tc.desc      Test log2 with very small exponent value
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathlog20025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      console.log(domain, tag, 'Test 0025 started');
      const exponent: number = -100;
      const value: number = Math.pow(2, exponent);
      const result: number = log2(value);
      expect(result).assertEqual(exponent);
      done();
      console.log(domain, tag, 'Test 0025 completed');
    });

    /**
     * @tc.number    MATH_MAX_0000
     * @tc.name      testmathmax0000
     * @tc.desc      Verify max returns larger value when first is greater
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax0000 started');
        const v: number = 15;
        const u: number = 10;
        const result: number = max(v, u);
        expect(result).assertEqual(v);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax0000 completed');
      });

    /**
     * @tc.number    MATH_MAX_0006
     * @tc.name      testmathmax0006
     * @tc.desc      Verify max with negative values (both negative)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const v: number = -5;
        const u: number = -10;
        const result: number = max(v, u);
        expect(result).assertEqual(-5);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0007
     * @tc.name      testmathmax0007
     * @tc.desc      Verify max with mixed positive/negative values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const v: number = -15;
        const u: number = 5;
        const result: number = max(v, u);
        expect(result).assertEqual(5);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0008
     * @tc.name      testmathmax0008
     * @tc.desc      Verify max at byte overflow boundary (255+1)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const v: number = 256;
        const u: number = 255;
        const result: number = max(v, u);
        expect(result).assertEqual(256);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0009
     * @tc.name      testmathmax0009
     * @tc.desc      Verify max with minimum byte values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const v: number = Number.MIN_VALUE;
        const u: number = 0;
        const result: number = max(v, u);
        expect(result).assertEqual(Number.MIN_VALUE);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0010
     * @tc.name      testmathmax0010
     * @tc.desc      Verify max when same value passed in reverse order
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const value: number = 100;
        const result1: number = max(value, value);
        const result2: number = max(value, value);
        expect(result1).assertEqual(result2);
        done();
      });

    /**
     * @tc.number    MATH_MAX_002
     * @tc.name      testmathmax1002
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1002 started');
        const result: number = max(2, 8);
        expect(result).assertEqual(8);
        done();
        console.log(domain, tag, 'testmathmax1002 completed');
      });

    /**
     * @tc.number    MATH_MAX_0011
     * @tc.name      testmathmax0011
     * @tc.desc      Verify max with decimal values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const result: number = max(3.14, 3.1416);
        expect(result).assertEqual(3.1416);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0012
     * @tc.name      testmathmax0012
     * @tc.desc      Verify max with negative decimal values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const result: number = max(-2.5, -1.8);
        expect(result).assertEqual(-1.8);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0013
     * @tc.name      testmathmax0013
     * @tc.desc      Verify max with extremely large values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const largeVal = Number.MAX_VALUE;
        const result: number = max(largeVal, largeVal / 2);
        expect(result).assertEqual(largeVal);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0014
     * @tc.name      testmathmax0014
     * @tc.desc      Verify max with extremely small negative values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const smallVal = Number.MIN_VALUE;
        const result: number = max(smallVal, -1 * Number.MAX_VALUE);
        expect(result).assertEqual(smallVal);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0015
     * @tc.name      testmathmax0015
     * @tc.desc      Verify max with different numeric representations
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const hexVal: number = 0xFF;
        const octalVal: number = 0o377;
        const result1: number = max(hexVal, 254);
        const result2: number = max(octalVal, 254);
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(255);
        done();
      });

    /**
     * @tc.number    MATH_MAX_001
     * @tc.name      testmathmax1001
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1001 started');
        const result: number = max(5, 3);
        expect(result).assertEqual(5);
        done();
        console.log(domain, tag, 'testmathmax1001 completed');
      });

    /**
     * @tc.number    MATH_MAX1_002
     * @tc.name      testmathmax1002_01
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1002_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1002_01 started');
        const result: number = max(2, 8);
        expect(result).assertEqual(8);
        done();
        console.log(domain, tag, 'testmathmax1002_01 completed');
      });

    /**
     * @tc.number    MATH_MAX_003
     * @tc.name      testmathmax1003
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1003 started');
        const result: number = max(4, 4);
        expect(result).assertEqual(4);
        done();
        console.log(domain, tag, 'testmathmax1003 completed');
      });

    /**
     * @tc.number    MATH_MAX1_004
     * @tc.name      testmathmax1004
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1004 started');
        const result: number = max(-5, -2);
        expect(result).assertEqual(-2);
        done();
        console.log(domain, tag, 'testmathmax1004 completed');
      });

    /**
     * @tc.number    MATH_MAX1_005
     * @tc.name      testmathmax1005
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax1005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax1005 started');
        const result: number = max(-10, 10);
        expect(result).assertEqual(10);
        done();
        console.log(domain, tag, 'testmathmax1005 completed');
      });

    /**
     * @tc.number  MATH_MAX_0026
     * @tc.name    testmathmax0026
     * @tc.desc    Verify max with exponent notation values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax0026",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const a: number = 1e3;
        const b: number = 2000;
        const result: number = max(a, b);
        expect(result).assertEqual(b);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0027
     * @tc.name      testmathmax0027
     * @tc.desc      Verify max with negative exponent notation
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0027",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const a: number = -2e3;
        const b: number = -1500;
        const result: number = max(a, b);
        expect(result).assertEqual(b);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0028
     * @tc.name      testmathmax0028
     * @tc.desc      Verify max comparison of different exponent notations
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0028",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const a: number = 5e4;
        const b: number = 50000;
        const result: number = max(a, b);
        expect(result).assertEqual(a);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0029
     * @tc.name      testmathmax0029
     * @tc.desc      Verify max with values after arithmetic operations
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0029",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const x: number = 100;
        const y: number = 200;
        const z: number = 150;
        const result1: number = max(x + y, y + z);
        const result2: number = max(x * y, y * z);
        expect(result1).assertEqual(y + z);
        expect(result2).assertEqual(y * z);
        done();
      });

    /**
     * @tc.number    MATH_MAX_0030
     * @tc.name      testmathmax0030
     * @tc.desc      Verify max in real-world scenario (sensor values)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax0030",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        const sensorA: number = 245;
        const sensorB: number = 230;
        const maxReading: number = max(sensorA, sensorB);
        expect(maxReading).assertEqual(sensorA);
        const threshold: number = 240;
        expect(maxReading > threshold).assertTrue();
        done();
      });

    /**
     * @tc.number    MATH_MAX2_001
     * @tc.name      testmathmax2001
     * @tc.desc      Test max with positive numbers (v > u)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax2001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2001 started');
        const result: number = max(10.5, 5.2);
        expect(result).assertEqual(10.5);
        console.log(domain, tag, '%{public}s', 'Assertion: 10.5 > 5.2');
        done();
      });

    /**
     * @tc.number    MATH_MAX2_002
     * @tc.name      testmathmax2002
     * @tc.desc      Test max with positive numbers (u > v)
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax2002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2002 started');
        const result: number = max(3.1, 7.8);
        expect(result).assertEqual(7.8);
        console.log(domain, tag, '%{public}s', 'Assertion: 7.8 > 3.1');
        done();
      });

    /**
     * @tc.number    MATH_MAX2_003
     * @tc.name      testmathmax2003
     * @tc.desc      Test max with negative numbers
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax2003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2003 started');
        const result: number = max(-15.3, -8.6);
        expect(result).assertEqual(-8.6);
        console.log(domain, tag, '%{public}s', 'Assertion: -8.6 > -15.3');
        done();
      });

    /**
     * @tc.number    MATH_MAX2_004
     * @tc.name      testmathmax2004
     * @tc.desc      Test max with equal values
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax2004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2004 started');
        const result: number = max(100.0, 100.0);
        expect(result).assertEqual(100.0);
        console.log(domain, tag, '%{public}s', 'Assertion: 100 == 100');
        done();
      });

    /**
     * @tc.number    MATH_MAX2_005
     * @tc.name      testmathmax2005
     * @tc.desc      Test max with mixed signs
     * @tc.level     LEVEL1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     */
    it("testmathmax2005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2005 started');
        const result: number = max(-5.5, 3.2);
        expect(result).assertEqual(3.2);
        console.log(domain, tag, '%{public}s', 'Assertion: 3.2 > -5.5');
        done();
      });
    });
}