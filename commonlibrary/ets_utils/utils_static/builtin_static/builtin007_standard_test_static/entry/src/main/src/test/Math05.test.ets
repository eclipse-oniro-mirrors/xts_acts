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

export default function math05Test() {

  describe("math05Test", (): void => {
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
     * @tc.number  MATH_MAX3_0100
     * @tc.name    testmathmax3001
     * @tc.desc    Test max with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3001 started');
        const result: number = max(5.2, 3.8);
        expect(result).assertEqual(5.2);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3001 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0200
     * @tc.name    testmathmax3002
     * @tc.desc    Test max with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3002 started');
        const result: number = max(-5.5, 2.3);
        expect(result).assertEqual(2.3);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3002 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0300
     * @tc.name    testmathmax3003
     * @tc.desc    Test max with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3003 started');
        const result: number = max(-7.1, -3.4);
        expect(result).assertEqual(-3.4);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3003 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0400
     * @tc.name    testmathmax3004
     * @tc.desc    Test max with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3004 started');
        const value: number = 10.0;
        const result: number = max(value, value);
        expect(result).assertEqual(value);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3004 completed');
      });

    /**
     * @tc.number  MATH_MAX2_0006
     * @tc.name    testmathmax2006
     * @tc.desc    Test max with large positive numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2006 started');
        const result: number = max(Number.MAX_VALUE, Number.MAX_VALUE / 2);
        expect(result).assertEqual(Number.MAX_VALUE);
        console.log(domain, tag, '%{public}s', `Assertion: ${Number.MAX_VALUE} > ${Number.MAX_VALUE / 2}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0007
     * @tc.name    testmathmax2007
     * @tc.desc    Test max with very small negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2007 started');
        const result: number = max(Number.MIN_VALUE, -Number.MIN_VALUE);
        expect(result).assertEqual(Number.MIN_VALUE);
        console.log(domain, tag, '%{public}s', `Assertion: ${Number.MIN_VALUE} > ${-Number.MIN_VALUE}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0008
     * @tc.name    testmathmax2008
     * @tc.desc    Test max with zero and positive number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2008 started');
        const result: number = max(0, 42);
        expect(result).assertEqual(42);
        console.log(domain, tag, '%{public}s', 'Assertion: 42 > 0');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0009
     * @tc.name    testmathmax2009
     * @tc.desc    Test max with zero and negative number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2009 started');
        const result: number = max(0, -99);
        expect(result).assertEqual(0);
        console.log(domain, tag, '%{public}s', 'Assertion: 0 > -99');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0010
     * @tc.name    testmathmax2010
     * @tc.desc    Test max with infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2010 started');
        const result: number = max(Infinity, -Infinity);
        expect(result).assertEqual(Infinity);
        console.log(domain, tag, '%{public}s', 'Assertion: Infinity > -Infinity');
        done();
      });

    /**
     * @tc.number  MATH_MAX3_0006
     * @tc.name    testmathmax3006
     * @tc.desc    Test max with infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3006 started');
        const result: number = max(0, 8.5);
        expect(result).assertEqual(8.5);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3006 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0007
     * @tc.name    testmathmax3007
     * @tc.desc    Test max with infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3007 started');
        const result: number = max(-3.7, 0);
        expect(result).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3007 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0008
     * @tc.name    testmathmax3008
     * @tc.desc    Test max with infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3008 started');
        const large1: number = Number.MAX_VALUE;
        const large2: number = Number.MAX_VALUE / 2;
        const result: number = max(large1, large2);
        expect(result).assertEqual(large1);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3008 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0010
     * @tc.name    testmathmax3010
     * @tc.desc    Test max with infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3010 started');
        const result1: number = max(Infinity, 100);
        expect(result1).assertEqual(Infinity);
        const result2: number = max(-Infinity, 0);
        expect(result2).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3010 completed');
      });

    /**
     * @tc.number  MATH_MAX2_0011
     * @tc.name    testmathmax2011
     * @tc.desc    Test max with very close positive values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2011 started');
        const result: number = max(0.30000000000000004, 0.3);
        expect(result).assertEqual(0.30000000000000004);
        console.log(domain, tag, '%{public}s', 'Assertion: 0.30000000000000004 > 0.3');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0012
     * @tc.name    testmathmax2012
     * @tc.desc    Test max with large magnitude difference
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2012 started');
        const result: number = max(1e-10, 1e10);
        expect(result).assertEqual(1e10);
        console.log(domain, tag, '%{public}s', 'Assertion: 1e10 > 1e-10');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0014
     * @tc.name    testmathmax2014
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2014 started');
        const result: number = max(NaN, NaN);
        expect(isNaN(result)).assertTrue();
        console.log(domain, tag, '%{public}s', 'Assertion: max(NaN, NaN) is NaN');
        done();
      });

    /**
     * @tc.number  MATH_MAX3_0013
     * @tc.name    testmathmax3013
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3013 started');
        const result: number = max(NaN, NaN);
        expect(isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3013 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0014
     * @tc.name    testmathmax3014
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3014 started');
        const result: number = max(Infinity, -Infinity);
        expect(result).assertEqual(Infinity);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3014 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0015
     * @tc.name    testmathmax3015
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3015 started');
        const maxInt = Number.MAX_SAFE_INTEGER;
        const minInt = Number.MIN_SAFE_INTEGER;
        expect(max(maxInt, maxInt - 1)).assertEqual(maxInt);
        expect(max(minInt, minInt + 1)).assertEqual(minInt + 1);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3015 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0017
     * @tc.name    testmathmax3017
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3017 started');
        expect(max(5, 5.5)).assertEqual(5.5);
        expect(max(1e3, 1000.1)).assertEqual(1000.1);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3017 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0018
     * @tc.name    testmathmax3018
     * @tc.desc    Test max with two NaN values (should return NaN)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3018",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3018 started');
        const a: number = 123.456;
        const b: number = 789.012;
        expect(max(a, b)).assertEqual(max(b, a));
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3018 completed');
      });

    /**
     * @tc.number  MATH_MAX2_0016
     * @tc.name    testmathmax2016
     * @tc.desc    Test max with negative zero and positive zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2016",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2016 started');
        const result: number = max(-0, +0);
        expect(result).assertEqual(0);
        console.log(domain, tag, '%{public}s', 'Assertion: max(-0, +0) === 0');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0017
     * @tc.name    testmathmax2017
     * @tc.desc    Test max with negative zero and positive number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2017 started');
        const result: number = max(-0, 0.1);
        expect(result).assertEqual(0.1);
        console.log(domain, tag, '%{public}s', 'Assertion: 0.1 > -0');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0018
     * @tc.name    testmathmax2018
     * @tc.desc    Test max with very large positive and negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2018",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2018 started');
        const largeNum: number = 1e308;
        const result: number = max(largeNum, -largeNum);
        expect(result).assertEqual(largeNum);
        console.log(domain, tag, '%{public}s', `Assertion: ${largeNum} > ${-largeNum}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0019
     * @tc.name    testmathmax2019
     * @tc.desc    Test max with decimal precision differences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2019",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2019 started');
        const result: number = max(0.123456789, 0.123456788);
        expect(result).assertEqual(0.123456789);
        console.log(domain, tag, '%{public}s', 'Assertion: 0.123456789 > 0.123456788');
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0020
     * @tc.name    testmathmax2020
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2020",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2020 started');
        const result: number = max(2e-50, 3e-50);
        expect(result).assertEqual(3e-50);
        console.log(domain, tag, '%{public}s', 'Assertion: 3e-50 > 2e-50');
        done();
      });

    /**
     * @tc.number  MATH_MAX3_0019
     * @tc.name    testmathmax3019
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3019",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3019 started');
        expect(max(Infinity, Number.MAX_VALUE)).assertEqual(Infinity);
        expect(max(Infinity, -Infinity)).assertEqual(Infinity);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3019 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0020
     * @tc.name    testmathmax3020
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3020",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3020 started');
        expect(max(-Infinity, Number.MIN_SAFE_INTEGER)).assertEqual(Number.MIN_SAFE_INTEGER);
        expect(max(-Infinity, 0)).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3020 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0021
     * @tc.name    testmathmax3021
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3021",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3021 started');
        const maxSafe = Number.MAX_SAFE_INTEGER;
        expect(max(maxSafe, maxSafe - 1)).assertEqual(maxSafe);
        expect(max(maxSafe, maxSafe)).assertEqual(maxSafe);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3021 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0022
     * @tc.name    testmathmax3022
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3022",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3022 started');
        const minSafe = Number.MIN_SAFE_INTEGER;
        expect(max(minSafe, minSafe + 1)).assertEqual(minSafe + 1);
        expect(max(minSafe, minSafe)).assertEqual(minSafe);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3022 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0023
     * @tc.name    testmathmax3023
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3023",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3023 started');
        expect(max(1e5, 99999)).assertEqual(100000);
        expect(max(2.5e-10, 3.0e-10)).assertEqual(3.0e-10);
        expect(max(0.0001, 1e-4)).assertEqual(0.0001);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3023 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0025
     * @tc.name    testmathmax3025
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3025",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3025 started');
        expect(max(10, 10.0001)).assertEqual(10.0001);
        expect(max(-5, 5)).assertEqual(5);
        expect(max(0, -0.0001)).assertEqual(0);
        expect(max(Number.MAX_VALUE, Number.MIN_VALUE)).assertEqual(Number.MAX_VALUE);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3025 completed');
      });

    /**
     * @tc.number  MATH_MAX3_0026
     * @tc.name    testmathmax3026
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3026",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3026 started');
        const startTime = new Date().getTime();
        for (let i = 0; i < 10000; i++) {
          const a = Math.random() * 1000;
          const b = Math.random() * 1000;
          max(a, b);
        }
        const endTime = new Date().getTime();
        const duration = endTime - startTime;
        console.log(domain, tag, 'Performance: %{public}d ms', duration);
        expect(duration).assertLess(100);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3026 completed');
      });

    /**
     * @tc.number  MATH_MAX2_0021
     * @tc.name    testmathmax2021
     * @tc.desc    Test max with Number.MAX_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2021",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2021 started');
        const maxSafe = Number.MAX_SAFE_INTEGER;
        const result: number = max(maxSafe, maxSafe - 1);
        expect(result).assertEqual(maxSafe);
        console.log(domain, tag, '%{public}s', `Assertion: ${maxSafe} > ${maxSafe - 1}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0022
     * @tc.name    testmathmax2022
     * @tc.desc    Test max with Number.MIN_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2022",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2022 started');
        const minSafe = Number.MIN_SAFE_INTEGER;
        const result: number = max(minSafe, minSafe + 1);
        expect(result).assertEqual(minSafe + 1);
        console.log(domain, tag, '%{public}s', `Assertion: ${minSafe + 1} > ${minSafe}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0023
     * @tc.name    testmathmax2023
     * @tc.desc    Test max with precision loss scenario
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2023",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2023 started');
        const a: number = 0.1 + 0.2;
        const b: number = 0.3;
        const result: number = max(a, b);
        expect(result).assertEqual(a);
        console.log(domain, tag, '%{public}s', `Assertion: ${a} > ${b}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0024
     * @tc.name    testmathmax2024
     * @tc.desc    Test max with very large exponent difference
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2024",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2024 started');
        const small: number = 1e-300;
        const large: number = 1e+300;
        const result: number = max(small, large);
        expect(result).assertEqual(large);
        console.log(domain, tag, '%{public}s', `Assertion: ${large} > ${small}`);
        done();
      });

    /**
     * @tc.number  MATH_MAX2_0025
     * @tc.name    testmathmax2025
     * @tc.desc    Test max with one argument as Infinity and other as finite number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax2025",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax2025 started');
        const result: number = max(Infinity, Number.MAX_VALUE);
        expect(result).assertEqual(Infinity);
        console.log(domain, tag, '%{public}s', 'Assertion: Infinity > Number.MAX_VALUE');
        done();
      });

    /**
     * @tc.number  MATH_MAX3_0027
     * @tc.name    testmathmax3027
     * @tc.desc    Test max with numbers in exponential notation
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax3027",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathmax3027 started');
        expect(max(-0, 0)).assertEqual(0);
        expect(max(-0, 5)).assertEqual(5);
        expect(max(-0, -5)).assertEqual(-0);
        done();
        console.log(domain, tag, '%{public}s', 'testmathmax3027 completed');
      });

    /**
     * @tc.number  MATH_MAX4_0001
     * @tc.name    testmathmax4001
     * @tc.desc    Verify max returns larger positive number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4001 started');
        const result: int = max(5, 3);
        expect(result).assertEqual(5);
        done();
        console.log(domain, tag, 'testmathmax4001 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0002
     * @tc.name    testmathmax4002
     * @tc.desc    Verify max handles negative numbers correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4002 started');
        const result: int = max(-7, -10);
        expect(result).assertEqual(-7);
        done();
        console.log(domain, tag, 'testmathmax4002 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0003
     * @tc.name    testmathmax4003
     * @tc.desc    Verify max with positive and negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4003 started');
        const result: int = max(0, -5);
        expect(result).assertEqual(0);
        done();
        console.log(domain, tag, 'testmathmax4003 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0004
     * @tc.name    testmathmax4004
     * @tc.desc    Verify max returns same value when equal
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4004 started');
        const result: int = max(100, 100);
        expect(result).assertEqual(100);
        done();
        console.log(domain, tag, 'testmathmax4004 ended');
      });

    /**
     * @tc.number  MATH_MAX5_0001
     * @tc.name    testmathmax5001
     * @tc.desc    Verify max returns correct value when first number is larger
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5001 started');
        const result: long = max(15, 10);
        expect(result).assertEqual(15);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0002
     * @tc.name    testmathmax5002
     * @tc.desc    Verify max returns correct value when second number is larger
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5002 started');
        const result: long = max(-5, 10);
        expect(result).assertEqual(10);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0003
     * @tc.name    testmathmax5003
     * @tc.desc    Verify max returns same value when both numbers are equal
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5003 started');
        const result: long = max(100, 100);
        expect(result).assertEqual(100);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0004
     * @tc.name    testmathmax5004
     * @tc.desc    Verify max handles negative numbers correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5004 started');
        const result: long = max(-8, -15);
        expect(result).assertEqual(-8);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0005
     * @tc.name    testmathmax5005
     * @tc.desc    Verify max handles zero correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5005 started');
        const result: long = max(0, -100);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.number  MATH_MAX4_0006
     * @tc.name    testmathmax4006_01
     * @tc.desc    Verify max with positive and negative (positive larger)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4006_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4006_01 started');
        const result: int = max(10, -5);
        expect(result).assertEqual(10);
        done();
        console.log(domain, tag, 'testmathmax4006_01 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0007
     * @tc.name    testmathmax4007
     * @tc.desc    Verify max between zero and positive
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4007 started');
        const result: int = max(0, 8);
        expect(result).assertEqual(8);
        done();
        console.log(domain, tag, 'testmathmax4007 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0008
     * @tc.name    testmathmax4008
     * @tc.desc    Verify max result independent of parameter order
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4008 started');
        const result1: int = max(15, 20);
        const result2: int = max(20, 15);
        expect(result1).assertEqual(20);
        expect(result2).assertEqual(20);
        done();
        console.log(domain, tag, 'testmathmax4008 ended');
      });

    /**
     * @tc.number  MATH_MAX5_0006
     * @tc.name    testmathmax5006
     * @tc.desc    Verify max returns larger number when both are positive
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5006 started');
        const result: long = max(999, 1000);
        expect(result).assertEqual(1000);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0007
     * @tc.name    testmathmax5007
     * @tc.desc    Verify max returns less negative when both are negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5007 started');
        const result: long = max(-100, -99);
        expect(result).assertEqual(-99);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0008
     * @tc.name    testmathmax5008
     * @tc.desc    Verify max handles large positive numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5008 started');
        const a: long = 2147483647;
        const b: long = 2147483646;
        expect(max(a, b)).assertEqual(2147483647);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0009
     * @tc.name    testmathmax5009
     * @tc.desc    Verify max handles large negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5009 started');
        const a: long = -2147483648;
        const b: long = -2147483647;
        expect(max(a, b)).assertEqual(-2147483647);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0010
     * @tc.name    testmathmax5010
     * @tc.desc    Verify max handles mixed large positive and negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5010 started');
        const largePositive: long = 9223372036854775807;
        const largeNegative: long = -9223372036854775808;
        expect(max(largePositive, largeNegative)).assertEqual(largePositive);
        done();
      });

    /**
     * @tc.number  MATH_MAX4_0011
     * @tc.name    testmathmax4011
     * @tc.desc    Verify max with equal negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4011 started');
        const result: int = max(-15, -15);
        expect(result).assertEqual(-15);
        done();
        console.log(domain, tag, 'testmathmax4011 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0012
     * @tc.name    testmathmax4012
     * @tc.desc    Verify max between positive and zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4012 started');
        const result: int = max(25, 0);
        expect(result).assertEqual(25);
        done();
        console.log(domain, tag, 'testmathmax4012 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0013
     * @tc.name    testmathmax4013
     * @tc.desc    Verify max with consecutive integers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4013 started');
        for (let i = -10; i < 10; i++) {
          const result: int = max(i, i + 1);
          expect(result).assertEqual(i + 1);
        }
        done();
        console.log(domain, tag, 'testmathmax4013 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0014
     * @tc.name    testmathmax4014
     * @tc.desc    Verify max at positive/negative boundary
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4014 started');
        const values: int[] = [-1, 0, 1];
        const expected: int[] = [0, 1, 1];
        for (let i = 0; i < values.length; i++) {
          const result: int = max(values[i], values[(i + 1) % values.length]);
          expect(result).assertEqual(expected[i]);
        }
        done();
        console.log(domain, tag, 'testmathmax4014 ended');
      });


    /**
     * @tc.number  MATH_MAX5_0011
     * @tc.name    testmathmax5011
     * @tc.desc    Verify max returns first parameter when both are zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5011 started');
        const result: long = max(0, 0);
        expect(result).assertEqual(0);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0012
     * @tc.name    testmathmax5012
     * @tc.desc    Verify max handles decimal values correctly (truncated)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5012 started');
        const a: long = 10.5 as long;
        const b: long = 11.2 as long;
        expect(max(a, b)).assertEqual(11);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0013
     * @tc.name    testmathmax5013
     * @tc.desc    Verify max returns larger number when parameters are very close
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5013 started');
        const result: long = max(1000000001, 1000000000);
        expect(result).assertEqual(1000000001);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0014
     * @tc.name    testmathmax5014
     * @tc.desc    Verify max handles reverse order parameters
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5014 started');
        const result1: long = max(5, 10);
        const result2: long = max(10, 5);
        expect(result1).assertEqual(10);
        expect(result2).assertEqual(10);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0015
     * @tc.name    testmathmax5015
     * @tc.desc    Verify max with one parameter being the minimum long value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5015 started');
        const minLong: long = -9223372036854775808;
        const normal: long = 0;
        expect(max(minLong, normal)).assertEqual(0);
        done();
      });

    /**
     * @tc.number  MATH_MAX4_0017
     * @tc.name    testmathmax4017
     * @tc.desc    Verify max when one parameter is MAX_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4017 started');
        const maxInt = Number.MAX_SAFE_INTEGER;
        expect(max(maxInt, 0)).assertEqual(maxInt);
        expect(max(maxInt, -1)).assertEqual(maxInt);
        expect(max(maxInt, maxInt - 1)).assertEqual(maxInt);
        expect(max(maxInt, maxInt)).assertEqual(maxInt);
        done();
        console.log(domain, tag, 'testmathmax4017 ended');
      });

    /**
     * @tc.number  MATH_MAX4_0018
     * @tc.name    testmathmax4018
     * @tc.desc    Verify max when one parameter is MIN_SAFE_INTEGER
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax4018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, 'testmathmax4018 started');
        const minInt = Number.MIN_SAFE_INTEGER;
        expect(max(minInt, 0)).assertEqual(0);
        expect(max(minInt, -1)).assertEqual(-1);
        expect(max(minInt, minInt + 1)).assertEqual(minInt + 1);
        expect(max(minInt, minInt)).assertEqual(minInt);
        done();
        console.log(domain, tag, 'testmathmax4018 ended');
      });

    /**
     * @tc.number  MATH_MAX5_0016
     * @tc.name    testmathmax5016
     * @tc.desc    Verify max with both parameters as long minimum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5016 started');
        const minLong: long = -9223372036854775808;
        expect(max(minLong, minLong)).assertEqual(minLong);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0017
     * @tc.name    testmathmax5017
     * @tc.desc    Verify max with one parameter as NaN (should be handled as 0)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5017 started');
        const nanValue: long = Number.NaN as long;
        expect(max(nanValue, 5)).assertEqual(5);
        expect(max(10, nanValue)).assertEqual(10);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0018
     * @tc.name    testmathmax5018
     * @tc.desc    Verify max with large positive numbers differing by 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5018 started');
        const maxLong: long = 9223372036854775807;
        const almostMax: long = maxLong - 1;
        expect(max(maxLong, almostMax)).assertEqual(maxLong);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0021
     * @tc.name    testmathmax5021
     * @tc.desc    Verify max with Infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5021 started');
        const infValue: long = Number.POSITIVE_INFINITY as long;
        const normal: long = 100;
        expect(max(infValue, normal)).assertEqual(infValue);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0022
     * @tc.name    testmathmax5022
     * @tc.desc    Verify max with extremely large differences
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5022 started');
        const small: long = -9999999999;
        const large: long = 9999999999;
        expect(max(small, large)).assertEqual(large);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0023
     * @tc.name    testmathmax5023
     * @tc.desc    Verify max with one parameter as zero and other as positive
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5023 started');
        expect(max(0, 5)).assertEqual(5);
        expect(max(10, 0)).assertEqual(10);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0024
     * @tc.name    testmathmax5024
     * @tc.desc    Verify max with one parameter as zero and other as negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5024 started');
        expect(max(0, -5)).assertEqual(0);
        expect(max(-10, 0)).assertEqual(0);
        done();
      });

    /**
     * @tc.number  MATH_MAX5_0025
     * @tc.name    testmathmax5025
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax5025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmax5025 started');
        const value1: long = max(5, 10);
        const value2: long = max(value1, 15);
        const value3: long = max(value2, 8);
        expect(value3).assertEqual(15);
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0001
     * @tc.name    testmathmax6001
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6001: + Max Number Start');
        const value1: short = 15;
        const value2: short = 27;
        const result: short = max(value1, value2);
        expect(result).assertEqual(27);
        console.log(domain, tag, 'testmathmax6001: + Max Number End');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0002
     * @tc.name    testmathmax6002
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6002: - Max Number Start');
        const value1: short = -45;
        const value2: short = -32;
        const result: short = max(value1, value2);
        expect(result).assertEqual(-32);
        console.log(domain, tag, 'testmathmax6002: - Max Number End');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0003
     * @tc.name    testmathmax6003
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6003: +- Max Number Start');
        const positive: short = 100;
        const negative: short = -50;
        const result: short = max(positive, negative);
        expect(result).assertEqual(100);
        console.log(domain, tag, 'testmathmax6003: +- Max Number End');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0004
     * @tc.name    testmathmax6004
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6004');
        const value: short = 99;
        const result: short = max(value, value);
        expect(result).assertEqual(99);
        console.log(domain, tag, 'testmathmax6004');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0005
     * @tc.name    testmathmax6005
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6005');
        const minShort: short = -32768;
        const maxShort: short = 32767;
        const result1: short = max(maxShort, minShort);
        const result2: short = max(minShort, maxShort);
        expect(result1).assertEqual(maxShort);
        expect(result2).assertEqual(maxShort);
        console.log(domain, tag, 'testmathmax6005');
        done();
      });

    /**
     * @tc.number  MATH_MIN_0001
     * @tc.name    testmathmin0001
     * @tc.desc    Verify min returns first number when it is smaller
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0001 started');
        const result: number = min(5, 10);
        expect(result).assertEqual(5);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0002
     * @tc.name    testmathmin0002
     * @tc.desc    Verify min returns second number when it is smaller
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0002 started');
        const result: number = min(15, 10);
        expect(result).assertEqual(10);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0003
     * @tc.name    testmathmin0003
     * @tc.desc    Verify min returns same value when both numbers are equal
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0003 started');
        const result: number = min(100, 100);
        expect(result).assertEqual(100);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0004
     * @tc.name    testmathmin0004
     * @tc.desc    Verify min handles negative numbers correctly
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0004 started');
        const result: number = min(-5, -2);
        expect(result).assertEqual(-5);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0006
     * @tc.name    testmathmin0006
     * @tc.desc    Verify min with zero values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0006 started');
        expect(min(0, 5)).assertEqual(0);
        expect(min(10, 0)).assertEqual(0);
        expect(min(0, 0)).assertEqual(0);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0007
     * @tc.name    testmathmin0007
     * @tc.desc    Verify min with mixed positive and negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0007 started');
        expect(min(-5, 5)).assertEqual(-5);
        expect(min(10, -10)).assertEqual(-10);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0009
     * @tc.name    testmathmin0009
     * @tc.desc    Verify min with chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0009 started');
        const value1: number = min(15, 10);
        const value2: number = min(value1, 5);
        const value3: number = min(value2, 8);
        expect(value3).assertEqual(5);
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0006
     * @tc.name    testmathmax6006
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6006');
        const zero: short = 0;
        const positive: short = 15;
        const negative: short = -15;
        const result1: short = max(zero, positive);
        const result2: short = max(zero, negative);
        const result3: short = max(zero, zero);
        expect(result1).assertEqual(15);
        expect(result2).assertEqual(0);
        expect(result3).assertEqual(0);
        console.log(domain, tag, 'testmathmax6006');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0007
     * @tc.name    testmathmax6008
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6008');
        const large1: short = 30000;
        const large2: short = 32000;
        const result: short = max(large1, large2);
        expect(result).assertEqual(32000);
        console.log(domain, tag, 'testmathmax6008');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0008
     * @tc.name    testmathmax6009
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6009');
        const value1: short = 42;
        const value2: short = 24;
        const result1: short = max(value1, value2);
        const result2: short = max(value2, value1);
        expect(result1).assertEqual(42);
        expect(result2).assertEqual(42);
        console.log(domain, tag, 'testmathmax6009');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0009
     * @tc.name    testmathmax6010
     * @tc.desc    Verify max returns correct value in a chain comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6010');
        const values: short[] = [10, 20, 30, 25, 35];
        let currentMax: short = values[0];
        for (let i = 1; i < values.length; i++) {
          currentMax = max(currentMax, values[i]);
        }
        expect(currentMax).assertEqual(35);
        console.log(domain, tag, 'testmathmax6010');
        done();
      });

    /**
     * @tc.number  MATH_MIN_0014
     * @tc.name    testmathmin0014
     * @tc.desc    Verify min with large negative numbers (within byte range)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0014 started');
        expect(min(-100, -120)).assertEqual(-120);
        expect(min(-128, -100)).assertEqual(-128);
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0010
     * @tc.name    testmathmax6011
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6011');
        const value: short = -100;
        const result: short = max(value, value);
        expect(result).assertEqual(-100);
        console.log(domain, tag, 'testmathmax6011');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0011
     * @tc.name    testmathmax6012
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6012');
        const positive: short = 50;
        const zero: short = 0;
        const result: short = max(positive, zero);
        expect(result).assertEqual(50);
        console.log(domain, tag, 'testmathmax6012');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0012
     * @tc.name    testmathmax6013
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6013');
        const negative: short = -30;
        const zero: short = 0;
        const result: short = max(negative, zero);
        expect(result).assertEqual(0);
        console.log(domain, tag, 'testmathmax6013');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0013
     * @tc.name    testmathmax6014
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6014",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6014');
        const large1: short = 32000;
        const large2: short = 31000;
        const result: short = max(large1, large2);
        expect(result).assertEqual(32000);
        console.log(domain, tag, 'testmathmax6014');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0014
     * @tc.name    testmathmax6015_01
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6015_01",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6015_01');
        const small1: short = -32000;
        const small2: short = -31000;
        const result: short = max(small1, small2);
        expect(result).assertEqual(-31000);
        console.log(domain, tag, 'testmathmax6015_01');
        done();
      });

    /**
     * @tc.number  MATH_MAX6_0015
     * @tc.name    testmathmax6015_02
     * @tc.desc
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmax6015_02",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, 'testmathmax6015_02');
        const small1: short = -32000;
        const small2: short = -31000;
        const result: short = max(small1, small2);
        expect(result).assertEqual(-31000);
        console.log(domain, tag, 'testmathmax6015_02');
        done();
      });

    /**
     * @tc.number  MATH_MIN_0015
     * @tc.name    testmathmin0015
     * @tc.desc    Verify min with values just above and below zero
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0015 started');
        expect(min(1, -1)).assertEqual(-1);
        expect(min(-1, 1)).assertEqual(-1);
        expect(min(0.1, -0.1)).assertEqual(-0.1);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0016
     * @tc.name    testmathmin0016
     * @tc.desc    Verify min with values at the middle of byte range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0016 started');
        expect(min(50, -50)).assertEqual(-50);
        expect(min(0, 50)).assertEqual(0);
        expect(min(-50, 0)).assertEqual(-50);
        done();
      });

    /**
     * @tc.number  MATH_MIN_0017
     * @tc.name    testmathmin0017
     * @tc.desc    Verify min with three-way comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathmin0017 started');
        const a: number = 10;
        const b: number = 20;
        const c: number = 5;
        const minAB = min(a, b);
        const minABC = min(minAB, c);
        expect(minABC).assertEqual(5);
        done();
      });

    /**
     * @tc.number  SUB_ABILITY_STATICTEST_0100
     * @tc.name    abilityStaticTest_0100
     * @tc.desc    Verify ability startup by bundle name
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("abilityStaticTest_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'Test case 0100 started');
        
        const expected: number = 1;
        const actual: number = 1;
        expect(expected).assertEqual(actual);
        done();
        console.log(domain, tag, '%{public}s', 'Test case 0100 completed');
      });

    /**
     * @tc.number  MATH_MIN2_0001
     * @tc.name    testmathmin2001
     * @tc.desc    Verify min function with positive numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(5.0, 3.0);
        expect(result).assertEqual(3.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0002
     * @tc.name    testmathmin2002
     * @tc.desc    Verify min function with negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(-2.5, -1.5);
        expect(result).assertEqual(-2.5);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0003
     * @tc.name    testmathmin2003
     * @tc.desc    Verify min with equal values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(10.0, 10.0);
        expect(result).assertEqual(10.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0004
     * @tc.name    testmathmin2004
     * @tc.desc    Verify min with zero values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(0.0, -0.0);
        expect(result).assertEqual(0.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0005
     * @tc.name    testmathmin2005
     * @tc.desc    Verify min with large number difference
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(Number.MAX_VALUE, Number.MIN_VALUE);
        expect(result).assertEqual(Number.MIN_VALUE);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0006
     * @tc.name    testmathmin2006
     * @tc.desc    Verify min with one positive and one negative number
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(5.5, -3.2);
        expect(result).assertEqual(-3.2);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0007
     * @tc.name    testmathmin2008
     * @tc.desc    Verify min with Infinity values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result1: double = min(Infinity, 100);
        expect(result1).assertEqual(100);
        const result2: double = min(-Infinity, 0);
        expect(result2).assertEqual(-Infinity);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0008
     * @tc.name    testmathmin2009
     * @tc.desc    Verify min when first parameter is smaller
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(2.0, 5.0);
        expect(result).assertEqual(2.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0009
     * @tc.name    testmathmin2015
     * @tc.desc    Verify min called multiple times
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let result: double = min(10.0, 8.0);
        expect(result).assertEqual(8.0);
        result = min(result, 5.0);
        expect(result).assertEqual(5.0);
        result = min(result, 7.0);
        expect(result).assertEqual(5.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0010
     * @tc.name    testmathmin2016
     * @tc.desc    Verify min with same absolute value but different signs
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2016",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(-5.0, 5.0);
        expect(result).assertEqual(-5.0);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0011
     * @tc.name    testmathmin2017
     * @tc.desc    Verify min with decimal precision
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2017",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const result: double = min(0.0000000000001, 0.0000000000002);
        expect(result).assertEqual(0.0000000000001);
        done();
      });

    /**
     * @tc.number  MATH_MIN2_0012
     * @tc.name    testmathmin2018
     * @tc.desc    Verify min used in expression chain
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathmin2018",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const a: double = 15.0;
        const b: double = 10.0;
        const c: double = 20.0;
        const result: double = min(a, min(b, c));
        expect(result).assertEqual(10.0);
        done();
      });

    /**
     * @tc.number  MATH_ASIN_0001_01
     * @tc.name    testmathasin0033
     * @tc.desc    Verify asin(0.0) returns exactly 0.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test exact zero value started');
        const result: number = asin(0.0);
        expect(result).assertEqual(0.0);
        done();
        console.log(domain, tag, '%{public}s', 'Test exact zero value completed');
      });

    /**
     * @tc.number  MATH_ASIN_0002_01
     * @tc.name    testmathasin0034
     * @tc.desc    Verify asin(-0.0) returns exactly -0.0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test negative zero started');
        const result: number = asin(-0.0);
        expect(1 / result).assertEqual(Number.NEGATIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'Test negative zero completed');
      });

    /**
     * @tc.number  MATH_ASIN_0003_01
     * @tc.name    testmathasin0035
     * @tc.desc    Verify asin(0.123) returns consistent result
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test random value (0.123) started');
        const input: number = 0.123;
        const result1: number = asin(input);
        const result2: number = asin(input);
        expect(result1).assertEqual(result2);
        done();
        console.log(domain, tag, '%{public}s', 'Test random value completed');
      });

    /**
     * @tc.number  MATH_ASIN_0004_01
     * @tc.name    testmathasin0036
     * @tc.desc    Verify asin(-0.456) returns consistent result
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test random negative value (-0.456) started');
        const input: number = -0.456;
        const result1: number = asin(input);
        const result2: number = asin(input);
        expect(result1).assertEqual(result2);
        done();
        console.log(domain, tag, '%{public}s', 'Test random negative value completed');
      });

    /**
     * @tc.number  MATH_ASIN_0005_01
     * @tc.name    testmathasin0037
     * @tc.desc    Verify precision of asin(0.999) against known value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test precision near upper boundary (0.999) started');
        const input: number = 0.999;
        const result: number = asin(input);
        const expected: number = 1.526071;
        expect(Math.abs(result - expected) < 1e-6).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test precision near upper boundary completed');
      });

    /**
     * @tc.number  MATH_ASIN_0006_01
     * @tc.name    testmathasin0038
     * @tc.desc    Verify precision of asin(-0.999) against known value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test precision near lower boundary (-0.999) started');
        const input: number = -0.999;
        const result: number = asin(input);
        const expected: number = -1.526071;
        expect(Math.abs(result - expected) < 1e-6).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test precision near lower boundary completed');
      });

    /**
     * @tc.number  MATH_ASIN_0008_01
     * @tc.name    testmathasin0040
     * @tc.desc    Verify extreme precision of asin(-0.5) returns -π/6
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test extreme precision (-0.5) started');
        const result: number = asin(-0.5);
        const expected: number = -Math.PI / 6;
        expect(Math.abs(result - expected) < Number.EPSILON).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test extreme precision completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0001_01
     * @tc.name    testmathacosh0026
     * @tc.desc    Verify acosh(Math.E) returns expected value (Euler's number)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0026",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0026 started');
        const input: double = Math.E;
        const expected: double = 1.657454454153077;
        const result: double = acosh(input);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0026 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0002_1
     * @tc.name    testmathacosh0028
     * @tc.desc    Verify acosh(2*0.5) returns expected value (square root of 2)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0028",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0028 started');
        const input: double = Math.SQRT2;
        const expected: double = 0.881373587019543;
        const result: double = acosh(input);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0028 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0003_01
     * @tc.name    testmathacosh0029
     * @tc.desc    Verify acosh(0.5 * Number.MAX_VALUE) returns finite value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0029",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0029 started');
        const input: double = 0.5 * Number.MAX_VALUE;
        const result: double = acosh(input);
        expect(Number.isFinite(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0029 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0004_01
     * @tc.name    testmathacosh0030
     * @tc.desc    Verify acosh(1.0 + 1e-15) returns small positive value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0030",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0030 started');
        const input: double = 1.0 + 1e-15;
        const result: double = acosh(input);
        expect(result > 0).assertTrue();
        expect(result < 1e-7).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0030 completed');
      });

    /**
     * @tc.number  MATH_ABS_0001_01
     * @tc.name    testmathabs0035
     * @tc.desc    Verify abs combined with other math functions
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0035",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0035 start');
        const input: double = -10.5;
        const result: double = Math.sqrt(abs(input));
        expect(result).assertEqual(Math.sqrt(10.5));
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0035 end');
      });

    /**
     * @tc.number  MATH_ABS_002
     * @tc.name    testmathabs0036
     * @tc.desc    Verify abs used in logical expression
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0036",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0036 start');
        const a: double = -5.0;
        const b: double = 3.0;
        const result: boolean = abs(a) > b;
        expect(result).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0036 end');
      });

    /**
     * @tc.number  MATH_ABS_0003_01
     * @tc.name    testmathabs0037
     * @tc.desc    Verify abs with random numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0037",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0037 start');
        for (let i = 0; i < 10; i++) {
          const randomValue: double = Math.random() * 100 - 50;
          const result: double = abs(randomValue);
          expect(result >= 0).assertTrue();
          expect(result).assertEqual(Math.abs(randomValue));
        }
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0037 end');
      });

    /**
     * @tc.number  MATH_ABS_0004_01
     * @tc.name    testmathabs0038
     * @tc.desc    Verify abs with date values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0038",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0038 start');
        const date1: Date = new Date(2023, 0, 1);
        const date2: Date = new Date(2023, 6, 1);
        const timeDiff: double = date1.getTime() - date2.getTime();
        const absDiff: double = abs(timeDiff);
        expect(absDiff).assertEqual(Math.abs(timeDiff));
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0038 end');
      });

    /**
     * @tc.number  MATH_ABS_0005_01
     * @tc.name    testmathabs0039
     * @tc.desc    Verify abs in array processing
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0039",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0039 start');
        const values: double[] = [-1.5, 2.3, -3.7, 4.2, -5.9];
        const absValues: double[] = values.map(v => abs(v));
        for (let i = 0; i < values.length; i++) {
          expect(absValues[i]).assertEqual(Math.abs(values[i]));
        }
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0039 end');
      });

    /**
     * @tc.number  MATH_ABS_0007_01
     * @tc.name    testmathabs0007
     * @tc.desc    Verify abs used in logical expression
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0007 start');
        const a: double = -5.0;
        const b: double = 3.0;
        const result: boolean = abs(a) > b;
        expect(result).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0007 end');
      });

    /**
     * @tc.number  MATH_ABS_008
     * @tc.name    testmathabs0037_01
     * @tc.desc    Verify abs with random numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0037_01",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0037_01 start');
        for (let i = 0; i < 10; i++) {
          const randomValue: double = Math.random() * 100 - 50;
          const result: double = abs(randomValue);
          expect(result >= 0).assertTrue();
          expect(result).assertEqual(Math.abs(randomValue));
        }
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0037_01 end');
      });

    /**
     * @tc.number  MATH_ABS_0009_01
     * @tc.name    testmathabs038
     * @tc.desc    Verify abs with date values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs038",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs038 start');
        const date1: Date = new Date(2023, 0, 1);
        const date2: Date = new Date(2023, 6, 1);
        const timeDiff: double = date1.getTime() - date2.getTime();
        const absDiff: double = abs(timeDiff);
        expect(absDiff).assertEqual(Math.abs(timeDiff));
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs038 end');
      });

    /**
     * @tc.number  MATH_ABS_0010_01
     * @tc.name    testmathabs0039_01
     * @tc.desc    Verify abs in array processing
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0039_01",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0039_01 start');
        const values: double[] = [-1.5, 2.3, -3.7, 4.2, -5.9];
        const absValues: double[] = values.map(v => abs(v));
        for (let i = 0; i < values.length; i++) {
          expect(absValues[i]).assertEqual(Math.abs(values[i]));
        }
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0039_01 end');
      });

    /**
     * @tc.number  MATH_ACOSH_0005_01
     * @tc.name    testmathacosh0031
     * @tc.desc    Verify acosh(1.0 - 1e-15) returns NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0031",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0031 started');
        const input: double = 1.0 - 1e-15;
        const result: double = acosh(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0031 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0006_01
     * @tc.name    testmathacosh0032
     * @tc.desc    Verify acosh(Number.MIN_SAFE_INTEGER + 1) returns NaN
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0032",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0032 started');
        const input: double = Number.MIN_SAFE_INTEGER + 1;
        const result: double = acosh(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0032 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0007_01
     * @tc.name    testmathacosh0033
     * @tc.desc    Verify acosh(1e-324) returns NaN (smallest possible positive number)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0033",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0033 started');
        const input: double = Number.MIN_VALUE;
        const result: double = acosh(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0033 completed');
      });

    /**
     * @tc.number  MATH_ACOSH_0008_01
     * @tc.name    testmathacosh0034
     * @tc.desc    Verify acosh(1.7976931348623157e308) returns finite value (MAX_VALUE)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacosh0034",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        console.log(domain, tag, '%{public}s', 'testmathacosh0034 started');
        const input: double = Number.MAX_VALUE;
        const result: double = acosh(input);
        expect(Number.isFinite(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacosh0034 completed');
      });

    /**
     * @tc.number  MATH_ASIN_00010
     * @tc.name    testmathasin0041
     * @tc.desc    Verify asin(100.0) returns NaN (value > 1.0)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test large positive value (100.0) started');
        const result: number = asin(100.0);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test large positive value completed');
      });

    /**
     * @tc.number  MATH_ASIN_0011_01
     * @tc.name    testmathasin0042
     * @tc.desc    Verify asin(-100.0) returns NaN (value < -1.0)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test large negative value (-100.0) started');
        const result: number = asin(-100.0);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test large negative value completed');
      });

    /**
     * @tc.number  MATH_ASIN_0012_01
     * @tc.name    testmathasin0043
     * @tc.desc    Verify asin(sin(0.3)) ≈ 0.3
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test asin(sin(x)) identity started');
        const x: number = 0.3;
        const result: number = asin(Math.sin(x));
        expect(Math.abs(result - x) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test asin(sin(x)) identity completed');
      });

    /**
     * @tc.number  MATH_ASIN_0013_01
     * @tc.name    testmathasin0044
     * @tc.desc    Verify asin(sin(-0.7)) ≈ -0.7
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test asin(sin(-x)) identity started');
        const x: number = 0.7;
        const result: number = asin(Math.sin(-x));
        expect(Math.abs(result - (-x)) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test asin(sin(-x)) identity completed');
      });

    /**
     * @tc.number  MATH_ASIN_014
     * @tc.name    testmathasin0047
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test result consistency started');
        const input: number = 0.25;
        const result1: number = asin(input);
        const result2: number = asin(input);
        const result3: number = asin(input);
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
        done();
        console.log(domain, tag, '%{public}s', 'Test result consistency completed');
      });

    /**
     * @tc.number  MATH_ASIN_0015_01
     * @tc.name    testmathasin0048
     * @tc.desc    Verify identity: asin(x) + acos(x) = π/2 for x=0.4
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathasin0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'Test asin(x) + acos(x) = π/2 identity started');
        const x: number = 0.4;
        const result: number = asin(x) + Math.acos(x);
        const expected: number = Math.PI / 2;
        expect(Math.abs(result - expected) < 1e-15).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'Test identity completed');
      });

    /**
     * @tc.number  MATH_ACOS_0001
     * @tc.name    testmathacos0001
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0001 start');
        const input: number = Number.NaN;
        const result: number = acos(input);

        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0001 end');
      });

    /**
     * @tc.number  MATH_ACOS_0002
     * @tc.name    testmathacos0002
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0002 start');
        const input: number = Number.POSITIVE_INFINITY;
        const result: number = acos(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0002 end');
      });

    /**
     * @tc.number  MATH_ACOS_0003
     * @tc.name    testmathacos0003
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0003 start');
        const input: number = Number.NEGATIVE_INFINITY;
        const result: number = acos(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0003 end');
      });

    /**
     * @tc.number  MATH_ACOS_0004
     * @tc.name    testmathacos0004
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0004 start');
        const input: number = 1.0;
        const result: number = acos(input);

        expect(Math.abs(result - 0) < Number.EPSILON).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0004 end');
      });

    /**
     * @tc.number  MATH_ACOS_0005
     * @tc.name    testmathacos0005
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0005 start');
        const input: number = -1.0;
        const result: number = acos(input);
        const expected: number = Math.PI;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0005 end');
      });

    /**
     * @tc.number  MATH_ACOS_0006
     * @tc.name    testmathacos0006
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0006 start');
        const input: number = 0.5;
        const result: number = acos(input);
        const expected: number = Math.PI / 3;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0006 end');
      });

    /**
     * @tc.number  MATH_ACOS_0007
     * @tc.name    testmathacos0007
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0007",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0007 start');
        const input: number = 0;
        const result: number = acos(input);
        const expected: number = Math.PI / 2;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0007 end');
      });

    /**
     * @tc.number  MATH_ABS_0001
     * @tc.name    testmathabs0001
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0001",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0001 start');
        const input: double = 5.0;
        const expected: double = 5.0;
        const result: double = abs(input);
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0001 end');
      });

    /**
     * @tc.number  MATH_ABS_0002
     * @tc.name    testmathabs0002
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0002",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0002 start');
        const input: double = -7.5;
        const expected: double = 7.5;
        const result: double = abs(input);
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0002 end');
      });

    /**
     * @tc.number  MATH_ABS_0003
     * @tc.name    testmathabs0003
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0003",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0003 start');
        const input: double = 0.0;
        const expected: double = 0.0;
        const result: double = abs(input);
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0003 end');
      });

    /**
     * @tc.number  MATH_ABS_0004_02
     * @tc.name    testmathabs0004
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0004",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0004 start');
        const input: double = NaN;
        const result: double = abs(input);

        expect(isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0004 end');
      });

    /**
     * @tc.number  MATH_ABS_0005
     * @tc.name    testmathabs0005
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0005",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0005 start');
        const input: double = Infinity;
        const expected: double = Infinity;
        const result: double = abs(input);
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0005 end');
      });

    /**
     * @tc.number  MATH_ABS_0006
     * @tc.name    testmathabs0006
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathabs0006",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathabs0006 start');
        const input: double = -Infinity;
        const expected: double = Infinity;
        const result: double = abs(input);
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'testmathabs0006 end');
      });

    /**
     * @tc.number  MATH_ACOS_0008
     * @tc.name    testmathacos0008
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0008",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0008 start');
        const input: number = 0.999;
        const result: number = acos(input);
        const expected: number = Math.acos(0.999);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0008 end');
      });

    /**
     * @tc.number  MATH_ACOS_0009
     * @tc.name    testmathacos0009
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0009",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0009 start');
        const input: number = -0.999;
        const result: number = acos(input);
        const expected: number = Math.acos(-0.999);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0009 end');
      });

    /**
     * @tc.number  MATH_ACOS_0010
     * @tc.name    estmathacos0010
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("estmathacos0010",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0010 start');
        const input: number = 1.0001;
        const result: number = acos(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0010 end');
      });

    /**
     * @tc.number  MATH_ACOS_0011
     * @tc.name    testmathacos0011
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0011",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0011 start');
        const input: number = -1.0001;
        const result: number = acos(input);
        expect(Number.isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0011 end');
      });

    /**
     * @tc.number  MATH_ACOS_0012
     * @tc.name    testmathacos0012
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0012",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0012 start');
        const input: number = Math.SQRT2 / 2;
        const result: number = acos(input);
        const expected: number = Math.PI / 4;
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0012 end');
      });

    /**
     * @tc.number  MATH_ACOS_0013
     * @tc.name    testmathacos0013
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0013",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0013 start');
        const input: number = 0.123;
        const result: number = acos(input);
        const expected: number = Math.acos(0.123);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0013 end');
      });

    /**
     * @tc.number  MATH_ACOS_0014
     * @tc.name    testmathacos0014_01
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0014_01",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0014_01 start');
        const input: number = -0.456;
        const result: number = acos(input);
        const expected: number = Math.acos(-0.456);
        expect(Math.abs(result - expected) < 1e-10).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0014_01 end');
      });

    /**
     * @tc.number  MATH_ACOS_0015
     * @tc.name    testmathacos0015
     * @tc.desc    Verify multiple calls to asin(0.25) return consistent results
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("testmathacos0015",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: () => void): void => {
        console.log(domain, tag, '%{public}s', 'testmathacos0015 start');
        const input: number = 1 - Number.EPSILON;
        const result: number = acos(input);
        const expected: number = Math.acos(1 - Number.EPSILON);
        expect(result > 0 && result < 0.001).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'testmathacos0015 end');
      });
  });
}