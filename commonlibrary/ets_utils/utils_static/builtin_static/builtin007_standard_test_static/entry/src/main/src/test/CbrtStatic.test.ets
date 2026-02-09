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
export default function CbrtStaticTest() {

  describe("CbrtStaticTest", (): void => {
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
     * @tc.number SUB_MATH_CBRT_STATIC_1200
     * @tc.name   testMathCbrtWith0_125
     * @tc.desc   Test cbrt function with decimal 0.125
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWith0_125", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWith0_125';
      try {
        
        let result: number = Math.cbrt(0.125);
        let expected: number = 0.5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1300
     * @tc.name   testMathCbrtWith0_216
     * @tc.desc   Test cbrt function with decimal 0.216
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWith0_216", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWith0_216';
      try {
        
        let result: number = Math.cbrt(0.216);
        let expected: number = 0.6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1500
     * @tc.name   testMathCbrtWith0_512
     * @tc.desc   Test cbrt function with decimal 0.512
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWith0_512", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWith0_512';
      try {
        
        let result: number = Math.cbrt(0.512);
        let expected: number = 0.8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1600
     * @tc.name   testMathCbrtWith0_729
     * @tc.desc   Test cbrt function with decimal 0.729
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWith0_729", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWith0_729';
      try {
        
        let result: number = Math.cbrt(0.729);
        let expected: number = 0.9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1700
     * @tc.name   testMathCbrtWithInt64
     * @tc.desc   Test cbrt function with integer 64
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt64", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt64';
      try {
        
        let result: number = Math.cbrt(64);
        let expected: number = 4;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1800
     * @tc.name   testMathCbrtWithInt125
     * @tc.desc   Test cbrt function with integer 125
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt125", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt125';
      try {
        
        let result: number = Math.cbrt(125);
        let expected: number = 5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_1900
     * @tc.name   testMathCbrtWithInt216
     * @tc.desc   Test cbrt function with integer 216
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt216", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt216';
      try {
        
        let result: number = Math.cbrt(216);
        let expected: number = 6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_2000
     * @tc.name   testMathCbrtWithInt343
     * @tc.desc   Test cbrt function with integer 343
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt343", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt343';
      try {
        
        let result: number = Math.cbrt(343);
        let expected: number = 7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_2100
     * @tc.name   testMathCbrtWithInt512
     * @tc.desc   Test cbrt function with integer 512
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt512", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt512';
      try {
        
        let result: number = Math.cbrt(512);
        let expected: number = 8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_2200
     * @tc.name   testMathCbrtWithInt729
     * @tc.desc   Test cbrt function with integer 729
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt729", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt729';
      try {
        
        let result: number = Math.cbrt(729);
        let expected: number = 9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_2300
     * @tc.name   testMathCbrtWithInt1000
     * @tc.desc   Test cbrt function with integer 1000
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithInt1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithInt1000';
      try {
        
        let result: number = Math.cbrt(1000);
        let expected: number = 10;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_2400
     * @tc.name   testMathCbrtWithNegInt8
     * @tc.desc   Test cbrt function with negative integer -8
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testMathCbrtWithNegInt8", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegInt8';
      try {
        
        let result: number = Math.cbrt(-8);
        let expected: number = -2;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
 * @tc.number SUB_MATH_CBRT_STATIC_2500
 * @tc.name   testMathCbrtWithNegInt27
 * @tc.desc   Test cbrt function with negative integer -27
 * @tc.size   MEDIUMTEST
 * @tc.type   FUNCTION
 * @tc.level  LEVEL1
 */
    it("testMathCbrtWithNegInt27", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegInt27';
      try {
        
        let result: number = Math.cbrt(-27);
        let expected: number = -3;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_2600
    * @tc.name   testMathCbrtWithNegInt64
    * @tc.desc   Test cbrt function with negative integer -64
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithNegInt64", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegInt64';
      try {
        
        let result: number = Math.cbrt(-64);
        let expected: number = -4;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_2700
    * @tc.name   testMathCbrtWithNegInt125
    * @tc.desc   Test cbrt function with negative integer -125
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithNegInt125", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegInt125';
      try {
        
        let result: number = Math.cbrt(-125);
        let expected: number = -5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_2800
    * @tc.name   testMathCbrtWithNegDecimal0_125
    * @tc.desc   Test cbrt function with negative decimal -0.125
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithNegDecimal0_125", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegDecimal0_125';
      try {
        
        let result: number = Math.cbrt(-0.125);
        let expected: number = -0.5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_2900
    * @tc.name   testMathCbrtWithNegDecimal0_216
    * @tc.desc   Test cbrt function with negative decimal -0.216
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithNegDecimal0_216", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithNegDecimal0_216';
      try {
        
        let result: number = Math.cbrt(-0.216);
        let expected: number = -0.6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_3000
    * @tc.name   testMathCbrtWithZero
    * @tc.desc   Test cbrt function with zero
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithZero", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithZero';
      try {
        
        let result: number = Math.cbrt(0);
        let expected: number = 0;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_3100
    * @tc.name   testMathCbrtWithSmallPosDecimal0_001
    * @tc.desc   Test cbrt function with small positive decimal 0.001
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithSmallPosDecimal0_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithSmallPosDecimal0_001';
      try {
        
        let result: number = Math.cbrt(0.001);
        let expected: number = 0.1;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_3200
    * @tc.name   testMathCbrtWithSmallNegDecimal0_001
    * @tc.desc   Test cbrt function with small negative decimal -0.001
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithSmallNegDecimal0_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithSmallNegDecimal0_001';
      try {
        
        let result: number = Math.cbrt(-0.001);
        let expected: number = -0.1;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number SUB_MATH_CBRT_STATIC_3300
    * @tc.name   testMathCbrtWithLargeInt1331
    * @tc.desc   Test cbrt function with large integer 1331
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    * @tc.level  LEVEL1
    */
    it("testMathCbrtWithLargeInt1331", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testMathCbrtWithLargeInt1331';
      try {
        
        let result: number = Math.cbrt(1331);
        let expected: number = 11;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3400
     * @tc.name   testCbrtStatic3400
     * @tc.desc   Test cbrt function with large integer 1728
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3400';
      try {
        
        let result: number = Math.cbrt(1728);
        let expected: number = 12;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3500
     * @tc.name   testCbrtStatic3500
     * @tc.desc   Test cbrt function with large integer 2197
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3500';
      try {
        
        let result: number = Math.cbrt(2197);
        let expected: number = 13;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3600
     * @tc.name   testCbrtStatic3600
     * @tc.desc   Test cbrt function with large integer 2744
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3600';
      try {
        
        let result: number = Math.cbrt(2744);
        let expected: number = 14;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3700
     * @tc.name   testCbrtStatic3700
     * @tc.desc   Test cbrt function with large integer 3375
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3700';
      try {
        
        let result: number = Math.cbrt(3375);
        let expected: number = 15;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3800
     * @tc.name   testCbrtStatic3800
     * @tc.desc   Test cbrt function with large integer 4096
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3800';
      try {
        
        let result: number = Math.cbrt(4096);
        let expected: number = 16;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_3900
     * @tc.name   testCbrtStatic3900
     * @tc.desc   Test cbrt function with large integer 4913
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic3900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic3900';
      try {
        
        let result: number = Math.cbrt(4913);
        let expected: number = 17;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4000
     * @tc.name   testCbrtStatic4000
     * @tc.desc   Test cbrt function with large integer 5832
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4000';
      try {
        
        let result: number = Math.cbrt(5832);
        let expected: number = 18;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4100
     * @tc.name   testCbrtStatic4100
     * @tc.desc   Test cbrt function with large integer 6859
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4100';
      try {
        
        let result: number = Math.cbrt(6859);
        let expected: number = 19;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4200
     * @tc.name   testCbrtStatic4200
     * @tc.desc   Test cbrt function with large integer 8000
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4200';
      try {
        
        let result: number = Math.cbrt(8000);
        let expected: number = 20;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4300
     * @tc.name   testCbrtStatic4300
     * @tc.desc   Test cbrt function with decimal 1.728
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4300';
      try {
        
        let result: number = Math.cbrt(1.728);
        let expected: number = 1.2;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4400
     * @tc.name   testCbrtStatic4400
     * @tc.desc   Test cbrt function with decimal 2.197
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4400';
      try {
        
        let result: number = Math.cbrt(2.197);
        let expected: number = 1.3;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4600
     * @tc.name   testCbrtStatic4600
     * @tc.desc   Test cbrt function with decimal 3.375
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4600';
      try {
        
        let result: number = Math.cbrt(3.375);
        let expected: number = 1.5;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4700
     * @tc.name   testCbrtStatic4700
     * @tc.desc   Test cbrt function with decimal 4.096
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4700';
      try {
        
        let result: number = Math.cbrt(4.096);
        let expected: number = 1.6;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4800
     * @tc.name   testCbrtStatic4800
     * @tc.desc   Test cbrt function with decimal 4.913
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4800';
      try {
        
        let result: number = Math.cbrt(4.913);
        let expected: number = 1.7;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_4900
     * @tc.name   testCbrtStatic4900
     * @tc.desc   Test cbrt function with decimal 5.832
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic4900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic4900';
      try {
        
        let result: number = Math.cbrt(5.832);
        let expected: number = 1.8;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_MATH_CBRT_STATIC_5000
     * @tc.name   testCbrtStatic5000
     * @tc.desc   Test cbrt function with decimal 6.859
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it("testCbrtStatic5000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
      const TAG = 'testCbrtStatic5000';
      try {
        
        let result: number = Math.cbrt(6.859);
        let expected: number = 1.9;
        expect(result).assertEqual(expected);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    });
}