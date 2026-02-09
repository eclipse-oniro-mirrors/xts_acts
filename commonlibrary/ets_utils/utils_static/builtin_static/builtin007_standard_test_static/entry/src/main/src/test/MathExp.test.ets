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
export default function mathExpTest() {

  describe("mathExpTest", (): void => {
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
     * @tc.number VALUE_ARRAYVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_ArrayValue_ToPrint_0100
     * @tc.desc   Test ArrayValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_ArrayValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'ArrayValue toPrint test start');
      let testArray: number[] = [1, 2, 3];
      let result: string = testArray.toString();
      expect(result).assertEqual("1,2,3");
      done()
      console.log(domain, tag, '%{public}s', 'ArrayValue toPrint test end');
    });

    /**
     * @tc.number VALUE_DOUBLEVALUE_TOLOCALESTRING_0100_03
     * @tc.name   SUB_Value_DoubleValue_ToLocaleString_0100_03
     * @tc.desc   Test DoubleValue toLocaleString method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_DoubleValue_ToLocaleString_0100_03", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'DoubleValue toLocaleString test start');
      let testDouble: number = 3.141592653589793;
      let result: string = testDouble.toString();
      expect(result).assertEqual("3.141592653589793");
      done()
      console.log(domain, tag, '%{public}s', 'DoubleValue toLocaleString test end');
    });

    /**
     * @tc.number VALUE_DOUBLEVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_DoubleValue_ToPrint_0100
     * @tc.desc   Test DoubleValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_DoubleValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'DoubleValue toPrint test start');
      let testDouble: number = 3.141592653589793;
      let result: string = testDouble.toString();
      expect(result).assertEqual("3.141592653589793");
      done()
      console.log(domain, tag, '%{public}s', 'DoubleValue toPrint test end');
    });


    /**
     * @tc.number VALUE_UNDEFINEDVALUE_TOPRINT_0100
     * @tc.name   SUB_Value_UndefinedValue_ToPrint_0100
     * @tc.desc   Test UndefinedValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_UndefinedValue_ToPrint_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'UndefinedValue toPrint test start');
      let result: string = "undefined";
      expect(result).assertEqual("undefined");
      done()
      console.log(domain, tag, '%{public}s', 'UndefinedValue toPrint test end');
    });

    /**
     * @tc.number VALUE_STRINGVALUE_TOPRINT_0200_02
     * @tc.name   SUB_Value_StringValue_ToPrint_0200
     * @tc.desc   Test StringValue toPrint method
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Value_StringValue_ToPrint_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test start');
      let testString: string = "Test Case 2";
      let result: string = `"${testString}"`;
      expect(result).assertEqual('"Test Case 2"');
      done()
      console.log(domain, tag, '%{public}s', 'StringValue toPrint test end');
    });

    /**
     * @tc.number MATH_EXP_STATIC_0200_01
     * @tc.name   SUB_Math_Exp_Static_0200_01
     * @tc.desc   Test exp function with zero
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0200_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200_01 start');
        const num: double = 0.0
        let result: number = exp(num);
        let expected: number = 1.0;
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0300_01
     * @tc.name   SUB_Math_Exp_Static_0300
     * @tc.desc   Test exp function with negative integer
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300 start');
        let result: number = exp(-1.0);
        let expected: number = 1.0 / Math.E;
        expect(Math.abs(result - expected)).assertLess(1e-12);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0400
     * @tc.name   Math_Exp_Static_0400
     * @tc.desc   Test exp function with small positive decimal
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("Math_Exp_Static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0400 start');
        let result: number = exp(0.6931471805599453);
        let expected: number = 2.0;
        expect(Math.abs(result - expected)).assertLess(1e-12);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0400 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0600
     * @tc.name   SUB_Math_Exp_Static_0600_01
     * @tc.desc   Test exp function with large negative value
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0600_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0600_01 start');
        let result: number = exp(-20.0);
        let expected: number = 2.061153622438558e-9;
        expect(Math.abs(result - expected)).assertLess(1e-15);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0600_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_700
     * @tc.name   SUB_Math_Exp_Static_700
     * @tc.desc   Test exp function with positive infinity
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_700 start');
        let result: number = exp(Number.POSITIVE_INFINITY);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_700 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0800_01
     * @tc.name   SUB_Math_Exp_Static_0800_02
     * @tc.desc   Test exp function with negative infinity
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0800_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0800_02 start');
        let result: number = exp(Number.NEGATIVE_INFINITY);
        expect(result).assertEqual(0.0);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0800_02 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0900
     * @tc.name   SUB_Math_Exp_Static_090
     * @tc.desc   Test exp function with NaN
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_090 start');
        let result: number = exp(Number.NaN);
        expect(isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_090 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1000_01
     * @tc.name   SUB_Math_Exp_Static_1000_01
     * @tc.desc   Test exp function with small positive value close to zero
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_1000_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_01 start');
        let result: number = exp(1e-10);
        let expected: number = 1.00000000010000000005;
        expect(Math.abs(result - expected)).assertLess(1e-18);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1100_01
     * @tc.name   SUB_Math_Exp_Static_1100_01
     * @tc.desc   Test exp function with negative decimal close to zero
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_1100_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100_01 start');
        let result: number = exp(-1e-12);
        let expected: number = 0.999999999999;
        expect(Math.abs(result - expected)).assertLess(1e-15);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1300_01
     * @tc.name   SUB_Math_Exp_Static_0200_02
     * @tc.desc   Verify exp(0.0) returns 1.0 (e^0 = 1)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0200_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200_02 start');
        let result: number = exp(0.0);
        let expected: number = 1.0;
        expect(result).assertEqual(expected);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200_02 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1400_01
     * @tc.name   SUB_Math_Exp_Static_0300_01
     * @tc.desc   Verify exp(-1.0) returns 1/e (~0.367879)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0300_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300_01 start');
        let result: number = exp(-1.0);
        let expected: number = 0.36787944117144233;
        expect(result).assertClose(expected, 1e-15);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1600_01
     * @tc.name   SUB_Math_Exp_Static_0500_02
     * @tc.desc   Verify exp(-Infinity) returns 0
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0500_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0500_02 start');
        let result: number = exp(-Infinity);
        expect(result).assertEqual(0);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0500_02 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_1800_01
     * @tc.name   SUB_Math_Exp_Static_0700
     * @tc.desc   Verify exp(-10.0) returns e^-10 (~4.539992976e-5)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0700 start');
        let result: number = exp(-10.0);
        let expected: number = 4.5399929762484854e-5;
        expect(result).assertClose(expected, 1e-15);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0700 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_2000_01
     * @tc.name   SUB_Math_Exp_Static_090_01
     * @tc.desc   Verify exp(-100.0) returns e^-100 (~3.720075976020836e-44)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_090_01", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_090_01 start');
        let result: number = exp(-100.0);
        let expected: number = 3.720075976020836e-44;
        expect(result).assertClose(expected, 1e-50);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_090_01 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_2100_01
     * @tc.name   SUB_Math_Exp_Static_1000_02
     * @tc.desc   Verify exp(NaN) returns NaN
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_1000_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_02 start');
        let result: number = exp(NaN);
        expect(isNaN(result)).assertTrue();
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_02 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_220_02
     * @tc.name   SUB_Math_Exp_Static_1100_02
     * @tc.desc   Verify exp(0.0001) returns e^0.0001 (~1.000100005)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_1100_02", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100_02 start');
        let result: number = exp(0.0001);
        let expected: number = 1.0001000050001667;
        expect(result).assertClose(expected, 1e-10);
        done();
        console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100_02 end');
      });

    /**
     * @tc.number MATH_EXP_STATIC_0100_03
     * @tc.name   SUB_Math_Exp_Static_0100_03
     * @tc.desc   Test exp function with zero
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("SUB_Math_Exp_Static_0100_03", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0100_03 start');
      let a:number = Math.exp(0);
      let b:number = 1;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0100_03 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0200
    * @tc.name   SUB_Math_Exp_Static_0200
    * @tc.desc   Test exp function with positive number
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200 start');
      const num: double = 1.0
      let a:number = Math.exp(num);
      let b:number = Math.E;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0200 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0300
    * @tc.name   SUB_Math_Exp_Static_0300_02
    * @tc.desc   Test exp function with negative number
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_0300_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300_02 start');
      const num: double = -1.0;
      let a:number = Math.exp(num);
      let b:number = 1/Math.E;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0300_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0500
    * @tc.name   SUB_Math_Exp_Static_0500_03
    * @tc.desc   Test exp function with small negative number
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_0500_03", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0500_03 start');
      let a:number = Math.exp(-0.5);
      let b:number = 0.6065306597126334;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0500_03 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_600
    * @tc.name   SUB_Math_Exp_Static_06002
    * @tc.desc   Test exp function with integer 2
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_06002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_06002 start');
      const num: double = 2.0;
      let a:number = Math.exp(num);
      let b:number = 7.38905609893065;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_06002 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0700
    * @tc.name   SUB_Math_Exp_Static_7001
    * @tc.desc   Test exp function with integer -2
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_7001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_7001 start');
      const num: double = -2.0;
      let a:number = Math.exp(num);
      let b:number = 0.1353352832366127;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_7001 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0800
    * @tc.name   SUB_Math_Exp_Static_0800_01
    * @tc.desc   Test exp function with decimal 1.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_0800_01", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0800_01 start');
      const num: double = 1.5;
      let a:number = Math.exp(num);
      let b:number = 4.4816890703380645;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0800_01 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_0900_02
    * @tc.name   SUB_Math_Exp_Static_0900_02
    * @tc.desc   Test exp function with decimal -1.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_0900_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0900_02 start');
      let a:number = Math.exp(-1.5);
      let b:number = 0.22313016014842982;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_0900_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1000
    * @tc.name   SUB_Math_Exp_Static_1000_03
    * @tc.desc   Test exp function with integer 3
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1000_03", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_03 start');
      const num: double = 3.0;
      let a:number = Math.exp(num);
      let b:number = 20.085536923187668;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1000_03 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1100
    * @tc.name   SUB_Math_Exp_Static_1100
    * @tc.desc   Test exp function with integer -3
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100 start');
      const num: double = -3.0;
      let a:number = Math.exp(num);
      let b:number = 0.049787068367863944;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1100 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1200
    * @tc.name   SUB_Math_Exp_Static_1200
    * @tc.desc   Test exp function with decimal 0.1
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1200 start');
      let a:number = Math.exp(0.1);
      let b:number = 1.1051709180756477;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1200 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1300_02
    * @tc.name   SUB_Math_Exp_Static_1300
    * @tc.desc   Test exp function with decimal -0.1
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1300 start');
      let a:number = Math.exp(-0.1);
      let b:number = 0.9048374180359595;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1300 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1400_02
    * @tc.name   SUB_Math_Exp_Static_1400
    * @tc.desc   Test exp function with decimal 2.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1400 start');
      const num: double = 2.5;
      let a:number = Math.exp(num);
      let b:number = 12.182493960703473;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1400 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1600_02
    * @tc.name   SUB_Math_Exp_Static_1600
    * @tc.desc   Test exp function with integer 4
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1600 start');
      const num: double = 4.0;
      let a:number = Math.exp(num);
      let b:number = 54.598150033144236;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1600 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1700
    * @tc.name   SUB_Math_Exp_Static_1700
    * @tc.desc   Test exp function with integer -4
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1700 start');
      const num: double = -4.0;
      let a:number = Math.exp(num);
      let b:number = 0.018315638888734179;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1700 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1800_02
    * @tc.name   SUB_Math_Exp_Static_1800_02
    * @tc.desc   Test exp function with decimal 0.25
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1800_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1800_02 start');
      const num: double = 0.25;
      let a:number = Math.exp(num);
      let b:number = 1.2840254166877414;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1800_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_1900_02
    * @tc.name   SUB_Math_Exp_Static_1900
    * @tc.desc   Test exp function with decimal -0.25
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_1900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1900 start');
      let a:number = Math.exp(-0.25);
      let b:number = 0.7788007830714049;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_1900 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2000_02
    * @tc.name   SUB_Math_Exp_Static_2000_02
    * @tc.desc   Test exp function with integer 5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2000_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2000_02 start');
      const num: double = 5.0
      let a:number = Math.exp(num);
      let b:number = 148.4131591025766;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2000_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2100_02
    * @tc.name   SUB_Math_Exp_Static_2100_02
    * @tc.desc   Test exp function with integer -5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2100_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2100_02 start');
      const num: double = -5.0
      let a:number = Math.exp(num);
      let b:number = 0.006737946999085467;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2100_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2200_02
    * @tc.name   SUB_Math_Exp_Static_2200_02
    * @tc.desc   Test exp function with decimal 0.75
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2200_02", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2200_02 start');
      const num: double = 0.75;
      let a:number = Math.exp(num);
      let b:number = 2.117000016612675;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2200_02 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2300
    * @tc.name   SUB_Math_Exp_Static_2300
    * @tc.desc   Test exp function with decimal -0.75
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2300 start');
      let a:number = Math.exp(-0.75);
      let b:number = 0.4723665527410147;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2300 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2600
    * @tc.name   SUB_Math_Exp_Static_2600
    * @tc.desc   Test exp function with integer 6
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2600 start');
      const num: double = 6.0;
      let a:number = Math.exp(num);
      let b:number = 403.4287934927351;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2600 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_2700
    * @tc.name   SUB_Math_Exp_Static_2700
    * @tc.desc   Test exp function with integer -6
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_2700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2700 start');
      const num: double = -6.0;
      let a:number = Math.exp(num);
      let b:number = 0.0024787521766663585;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_2700 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3000
    * @tc.name   SUB_Math_Exp_Static_3000
    * @tc.desc   Test exp function with decimal 1.25
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3000 start');
      const num: double = 1.25;
      let a:number = Math.exp(num);
      let b:number = 3.4903429574618414;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3000 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3100
    * @tc.name   SUB_Math_Exp_Static_3100
    * @tc.desc   Test exp function with decimal -1.25
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3100 start');
      let a:number = Math.exp(-1.25);
      let b:number = 0.2865047968601901;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3100 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3200
    * @tc.name   SUB_Math_Exp_Static_3200
    * @tc.desc   Test exp function with integer 7
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3200 start');
      const num: double = 7.0;
      let a:number = Math.exp(num);
      let b:number = 1096.6331584284585;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3200 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3300
    * @tc.name   SUB_Math_Exp_Static_3300
    * @tc.desc   Test exp function with integer -7
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3300 start');
      const num: double = -7.0;
      let a:number = Math.exp(num);
      let b:number = 0.0009118819655545162;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3300 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3400
    * @tc.name   SUB_Math_Exp_Static_3400
    * @tc.desc   Test exp function with decimal 0.2
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3400 start');
      let a:number = Math.exp(0.2);
      let b:number = 1.2214027581601699;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3400 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3600
    * @tc.name   SUB_Math_Exp_Static_3600
    * @tc.desc   Test exp function with decimal 4.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3600 start');
      const num: double = 4.5;
      let a:number = Math.exp(num);
      let b:number = 90.01713130052181;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3600 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3700
    * @tc.name   SUB_Math_Exp_Static_3700
    * @tc.desc   Test exp function with decimal -4.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3700 start');
      let a:number = Math.exp(-4.5);
      let b:number = 0.011108996538242306;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3700 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3800
    * @tc.name   SUB_Math_Exp_Static_3800
    * @tc.desc   Test exp function with integer 8
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3800 start');
      const num: double = 8.0;
      let a:number = Math.exp(num);
      let b:number = 2980.9579870417282;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3800 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_3900
    * @tc.name   SUB_Math_Exp_Static_3900
    * @tc.desc   Test exp function with integer -8
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_3900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3900 start');
      const num: double = -8.0
      let a:number = Math.exp(num);
      let b:number = 0.00033546262790251185;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_3900 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4400
    * @tc.name   SUB_Math_Exp_Static_4400
    * @tc.desc   Test exp function with integer 9
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4400 start');
      const num: double = 9.0;
      let a:number = Math.exp(num);
      let b:number = 8103.083927575384;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4400 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4500
    * @tc.name   SUB_Math_Exp_Static_4500
    * @tc.desc   Test exp function with integer -9
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4500 start');
      const num: double = -9.0;
      let a:number = Math.exp(num);
      let b:number = 0.00012340980408667956;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4500 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4600
    * @tc.name   SUB_Math_Exp_Static_4600
    * @tc.desc   Test exp function with decimal 0.125
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4600 start');
      const num: double = 0.125;
      let a:number = Math.exp(num);
      let b:number = 1.1331484530668263;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4600 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4700
    * @tc.name   SUB_Math_Exp_Static_4700
    * @tc.desc   Test exp function with decimal -0.125
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4700 start');
      let a:number = Math.exp(-0.125);
      let b:number = 0.8824969025845955;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4700 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4800
    * @tc.name   SUB_Math_Exp_Static_4800
    * @tc.desc   Test exp function with decimal 5.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4800 start');
      const num: double = 5.5;
      let a:number = Math.exp(num);
      let b:number = 244.69193226422038;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4800 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_4900
    * @tc.name   SUB_Math_Exp_Static_4900
    * @tc.desc   Test exp function with decimal -5.5
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_4900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4900 start');
      let a:number = Math.exp(-5.5);
      let b:number = 0.004086771438464067;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_4900 end');
    });

   /**
    * @tc.number MATH_EXP_STATIC_5000
    * @tc.name   SUB_Math_Exp_Static_5000
    * @tc.desc   Test exp function with integer 10
    * @tc.level  LEVEL1
    * @tc.size   MEDIUMTEST
    * @tc.type   FUNCTION
    */
    it("SUB_Math_Exp_Static_5000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000)
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_5000 start');
      const num: double = 10.0;
      let a:number = Math.exp(num);
      let b:number = 22026.465794806718;
      expect(a).assertEqual(b);
      done()
      console.log(domain, tag, '%{public}s', 'SUB_Math_Exp_Static_5000 end');
    });
    })
}