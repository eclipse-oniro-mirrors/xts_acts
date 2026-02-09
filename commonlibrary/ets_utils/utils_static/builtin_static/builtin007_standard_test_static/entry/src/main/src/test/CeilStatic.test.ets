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
export default function CeilStaticTest() {

  describe("CeilStaticTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100)
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
     * @tc.number SUB_MATH_CEIL_STATIC_0100
     * @tc.name   testCeilStatic0100
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0100';
      try {
        
        let result: number = Math.ceil(4.3);
        let expected: number = 5.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0200
     * @tc.name   testCeilStatic0200
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0200';
      try {
        
        let result: number = Math.ceil(2.7);
        let expected: number = 3.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0300
     * @tc.name   testCeilStatic0300
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0300';
      try {
        
        let result: number = Math.ceil(1.1);
        let expected: number = 2.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0400
     * @tc.name   testCeilStatic0400
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0400';
      try {
        
        let result: number = Math.ceil(5.9);
        let expected: number = 6.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0500
     * @tc.name   testCeilStatic0500
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0500';
      try {
        
        let result: number = Math.ceil(0.1);
        let expected: number = 1.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0600
     * @tc.name   testCeilStatic0600
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0600';
      try {
        
        let result: number = Math.ceil(3.5);
        let expected: number = 4.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0700
     * @tc.name   testCeilStatic0700
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0700';
      try {
        
        let result: number = Math.ceil(7.2);
        let expected: number = 8.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0800
     * @tc.name   testCeilStatic0800
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0800';
      try {
        
        let result: number = Math.ceil(8.8);
        let expected: number = 9.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_0900
     * @tc.name   testCeilStatic0900
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic0900';
      try {
        
        let result: number = Math.ceil(9.4);
        let expected: number = 10.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1000
     * @tc.name   testCeilStatic1000
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1000';
      try {
        
        let result: number = Math.ceil(6.6);
        let expected: number = 7.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1100
     * @tc.name   testCeilStatic1100
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1100';
      try {
        
        let result: number = Math.ceil(-4.3);
        let expected: number = -4.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1200
     * @tc.name   testCeilStatic1200
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1200';
      try {
        
        let result: number = Math.ceil(-2.7);
        let expected: number = -2.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1300
     * @tc.name   testCeilStatic1300
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1300';
      try {
        
        let result: number = Math.ceil(-1.1);
        let expected: number = -1.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1400
     * @tc.name   testCeilStatic1400
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1400';
      try {
        
        let result: number = Math.ceil(-5.9);
        let expected: number = -5.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1500
     * @tc.name   testCeilStatic1500
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1500';
      try {
        
        let result: number = Math.ceil(-0.1);
        let expected: number = 0.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1600
     * @tc.name   testCeilStatic1600
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1600';
      try {
        
        let result: number = Math.ceil(-3.5);
        let expected: number = -3.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1700
     * @tc.name   testCeilStatic1700
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1700';
      try {
        
        let result: number = Math.ceil(-7.2);
        let expected: number = -7.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1800
     * @tc.name   testCeilStatic1800
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1800';
      try {
        
        let result: number = Math.ceil(-8.8);
        let expected: number = -8.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_1900
     * @tc.name   testCeilStatic1900
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic1900';
      try {
        
        let result: number = Math.ceil(-9.4);
        let expected: number = -9.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2000
     * @tc.name   testCeilStatic2000
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2000';
      try {
        
        let result: number = Math.ceil(-6.6);
        let expected: number = -6.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2100
     * @tc.name   testCeilStatic2100
     * @tc.desc   Test ceil function with zero
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2100';
      try {
        
        let result: number = Math.ceil(0.0);
        let expected: number = 0.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2200
     * @tc.name   testCeilStatic2200
     * @tc.desc   Test ceil function with positive integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2200';
      try {
        
        let result: number = Math.ceil(5.0);
        let expected: number = 5.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2300
     * @tc.name   testCeilStatic2300
     * @tc.desc   Test ceil function with negative integer
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2300';
      try {
        
        let result: number = Math.ceil(-3.0);
        let expected: number = -3.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2400
     * @tc.name   testCeilStatic2400
     * @tc.desc   Test ceil function with small positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2400';
      try {
        
        let result: number = Math.ceil(0.01);
        let expected: number = 1.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2500
     * @tc.name   testCeilStatic2500
     * @tc.desc   Test ceil function with small negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2500';
      try {
        
        let result: number = Math.ceil(-0.01);
        let expected: number = 0.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_2600
     * @tc.name   testCeilStatic2600
     * @tc.desc   Test ceil function with large positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic2600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic2600';
      try {
        
        let result: number = Math.ceil(99.9);
        let expected: number = 100.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3400
     * @tc.name   testCeilStatic3400
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3400';
      try {
        
        let result: number = Math.ceil(8.1);
        let expected: number = 9.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3500
     * @tc.name   testCeilStatic3500
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3500';
      try {
        
        let result: number = Math.ceil(-8.9);
        let expected: number = -8.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3600
     * @tc.name   testCeilStatic3600
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3600';
      try {
        
        let result: number = Math.ceil(20.25);
        let expected: number = 21.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3700
     * @tc.name   testCeilStatic3700
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3700';
      try {
        
        let result: number = Math.ceil(-20.75);
        let expected: number = -20.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3800
     * @tc.name   testCeilStatic3800
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3800';
      try {
        
        let result: number = Math.ceil(1.99);
        let expected: number = 2.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_3900
     * @tc.name   testCeilStatic3900
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic3900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic3900';
      try {
        
        let result: number = Math.ceil(-1.01);
        let expected: number = -1.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4000
     * @tc.name   testCeilStatic4000
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4000';
      try {
        
        let result: number = Math.ceil(50.5);
        let expected: number = 51.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4100
     * @tc.name   testCeilStatic4100
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4100';
      try {
        
        let result: number = Math.ceil(-50.5);
        let expected: number = -50.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4200
     * @tc.name   testCeilStatic4200
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4200';
      try {
        
        let result: number = Math.ceil(3.14);
        let expected: number = 4.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4300
     * @tc.name   testCeilStatic4300
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4300';
      try {
        
        let result: number = Math.ceil(-3.14);
        let expected: number = -3.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4400
     * @tc.name   testCeilStatic4400
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4400';
      try {
        
        let result: number = Math.ceil(11.11);
        let expected: number = 12.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4500
     * @tc.name   testCeilStatic4500
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4500';
      try {
        
        let result: number = Math.ceil(-11.99);
        let expected: number = -11.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4600
     * @tc.name   testCeilStatic4600
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4600';
      try {
        
        let result: number = Math.ceil(0.99);
        let expected: number = 1.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4700
     * @tc.name   testCeilStatic4700
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4700';
      try {
        
        let result: number = Math.ceil(-0.99);
        let expected: number = 0.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4800
     * @tc.name   testCeilStatic4800
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic4800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4800';
      try {
        
        let result: number = Math.ceil(33.33);
        let expected: number = 34.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_4900
     * @tc.name   testCeilStatic4900
     * @tc.desc   Test ceil function with negative decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
it("testCeilStatic4900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic4900';
      try {
        
        let result: number = Math.ceil(-33.67);
        let expected: number = -33.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CEIL_STATIC_5000
     * @tc.name   testCeilStatic5000
     * @tc.desc   Test ceil function with positive decimal
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCeilStatic5000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCeilStatic5000';
      try {
        
        let result: number = Math.ceil(77.77);
        let expected: number = 78.0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    });
}