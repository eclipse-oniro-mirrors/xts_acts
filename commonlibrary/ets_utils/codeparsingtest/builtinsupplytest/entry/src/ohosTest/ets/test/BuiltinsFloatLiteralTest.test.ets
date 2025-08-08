/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';




export default function BuiltinsFloatLiteralTest() {
  describe('BuiltinsFloatLiteralTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_FLOAT_LITERAL_TEST_0100
     * @tc.name BuiltinsFloatLiteralTest0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0100';
      console.log(`${caseName} test start`);
      const floatNum = 5.8;
      const intPart = Math.trunc(floatNum);
      if (intPart!== 5) {
        throw new Error(`${intPart}`);
      }
      expect(5).assertEqual(intPart);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0200
     * @tc.name BuiltinsFloatLiteralTest0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0200';
      console.log(`${caseName} test start`);
      const floatStr = '2.3';
      const floatValue = parseFloat(floatStr);
      if (typeof floatValue!== 'number') {
        throw new Error(`${floatValue}`);
      }
      expect(2.3).assertEqual(floatValue);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0300
     * @tc.name BuiltinsFloatLiteralTest0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0300';
      console.log(`${caseName} test start`);
      const floatNum = 7.25;
      const intPart = Math.trunc(floatNum);
      const decimalPart = floatNum - intPart;
      if (decimalPart!== 0.25) {
        throw new Error(`${decimalPart}`);
      }
      expect(0.25).assertEqual(decimalPart);
      console.log(`${caseName} test end`);
      Done();
    })




    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0400
     * @tc.name BuiltinsFloatLiteralTest0400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0400';
      console.log(`${caseName} test start`);
      const expFloat = 3.5e2;
      if (expFloat!== 350) {
        throw new Error(` ${expFloat}`);
      }
      expect(350).assertEqual(expFloat);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0500
     * @tc.name BuiltinsFloatLiteralTest0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0500';
      console.log(`${caseName} test start`);
      const floatNum = 1_000.5;
      if (floatNum!== 1000.5) {
        throw new Error(`${floatNum}`);
      }
      expect(floatNum).assertEqual(1000.5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0600
     * @tc.name BuiltinsFloatLiteralTest0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0600';
      console.log(`${caseName} test start`);
      const floatNum = 1_000_000.75;
      if (floatNum!== 1000000.75) {
        throw new Error(`${floatNum}`);
      }
      expect(1000000.75).assertEqual(floatNum);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0700
     * @tc.name BuiltinsFloatLiteralTest0700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0700';
      console.log(`${caseName} test start`);
      const withUnderline = 2_000.3;
      const withoutUnderline = 2000.3;
      if (withUnderline!== withoutUnderline) {
        throw new Error('false');
      }
      expect(withUnderline).assertEqual(withoutUnderline);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0800
     * @tc.name BuiltinsFloatLiteralTest0800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0800';
      console.log(`${caseName} test start`);
      const floatArray = [1.5, 2.7, 3.2, 0.8, 4.1];
      const threshold = 2;
      let sum = 0;
      for (let i = 0; i < floatArray.length; i++) {
        if (floatArray[i] > threshold) {
          sum += floatArray[i];
        }
      }
      console.log(`${sum}`);
      expect(10).assertEqual(sum);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_0900
     * @tc.name BuiltinsFloatLiteralTest0900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest0900';
      console.log(`${caseName} test start`);
      const float1 = 1.2;
      const float2 = 5.6;
      const float3 = 3.8;
      const float4 = 9.1;
      const float5 = 2.4;
      const floatArray = [float1,float2,float3,float4,float5];
      let max = floatArray[0];
      for (const num of floatArray) {
        if (num > max) {
          max = num;
        }
      }
      if (max!== 9.1) {
        throw new Error(`${max}`);
      }
      expect(9.1).assertEqual(floatArray[3]);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1000
     * @tc.name BuiltinsFloatLiteralTest1000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1000';
      console.log(`${caseName} test start`);
      const float1 = 1.2;
      const float2 = 5.6;
      const float3 = 3.8;
      const float4 = 9.1;
      const float5 = 2.4;
      const floatArray = [float1,float2,float3,float4,float5];
      let min = floatArray[0];
      for (const num of floatArray) {
        if (num < min) {
          min = num;
        }
      }
      if (min!== 1.2) {
        throw new Error(`${min}`);
      }
      expect(1.2).assertEqual(floatArray[0]);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1100
     * @tc.name BuiltinsFloatLiteralTest1100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1100';
      console.log(`${caseName} test start`);
      const float1 = 1.2;
      const float2 = 5.6;
      const float3 = 3.8;
      const float4 = 9.1;
      const float5 = 2.4;
      const floatArray = [float1,float2,float3,float4,float5];
      let max = floatArray[0];
      for (const num of floatArray) {
        if (num > max) {
          max = num;
        }
      }
      let max1 = max+ 1;
      if (max!== 9.1) {
        throw new Error(`${max}`);
      }
      expect(10.1).assertEqual(max1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1200
     * @tc.name BuiltinsFloatLiteralTest1200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1200';
      console.log(`${caseName} test start`);
      const float1 = 1.2;
      const float2 = 5.6;
      const float3 = 3.8;
      const float4 = 9.1;
      const float5 = 2.4;
      const floatArray = [float1,float2,float3,float4,float5];
      let min = floatArray[0];
      for (const num of floatArray) {
        if (num < min) {
          min = num;
        }
      }
      let min1 = min + 1;
      if (min!== 1.2) {
        throw new Error(`${min}`);
      }
      expect(2.2).assertEqual(min1);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1300
     * @tc.name BuiltinsFloatLiteralTest1300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1300';
      console.log(`${caseName} test start`);
      const num1 = 1.2;
      const num2 = 2.3;
      const result = num1 + num2;
      console.log(`${result}`);
      expect(3.5).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1400
     * @tc.name BuiltinsFloatLiteralTest1400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1400';
      console.log(`${caseName} test start`);
      const num1 = 5.6;
      const num2 = 3.2;
      const result = num1 - num2;
      console.log(`${result}`);
      expect(2.3999999999999995).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1500
     * @tc.name BuiltinsFloatLiteralTest1500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1500';
      console.log(`${caseName} test start`);
      const num1 = 2.5;
      const num2 = 1.8;
      const result = num1 * num2;
      console.log(`${result}`);
      expect(4.5).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1600
     * @tc.name BuiltinsFloatLiteralTest1600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1600';
      console.log(`${caseName} test start`);
      const num1 = 4.8;
      const num2 = 1.2;
      const result = num1 / num2;
      console.log(`${result}`);
      expect(4).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1700
     * @tc.name BuiltinsFloatLiteralTest1700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1700';
      console.log(`${caseName} test start`);
      const num1 = 7.5;
      const num2 = 2.3;
      const result = num1 % num2;
      console.log(`${result}`);
      expect(0.6000000000000005).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1800
     * @tc.name BuiltinsFloatLiteralTest1800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1800';
      console.log(`${caseName} test start`);
      const num1 = 2.7;
      const num2 = 3.1;
      const isGreater = num1 > num2;
      console.log(`${isGreater}`);
      expect(false).assertEqual(isGreater);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_1900
     * @tc.name BuiltinsFloatLiteralTest1900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest1900';
      console.log(`${caseName} test start`);
      const num = 3.9;
      const result = Math.floor(num);
      console.log(`${result}`);
      expect(3).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2000
     * @tc.name BuiltinsFloatLiteralTest2000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2000';
      console.log(`${caseName} test start`);
      const num = 3.6;
      const result = Math.round(num);
      console.log(`${result}`);
      expect(4).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2100
     * @tc.name BuiltinsFloatLiteralTest2100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2100';
      console.log(`${caseName} test start`);
      const num = 3.2;
      const result = Math.ceil(num);
      console.log(`${result}`);
      expect(4).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2200
     * @tc.name BuiltinsFloatLiteralTest2200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2200';
      console.log(`${caseName} test start`);
      const numbers = [1.2, 2.3, 3.4, 4.5, 5.6];
      const sum = numbers.reduce((acc, num) => acc + num, 0);
      const average = sum / numbers.length;
      console.log(`${average}`);
      expect(3.4).assertEqual(average);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2300
     * @tc.name BuiltinsFloatLiteralTest2300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2300';
      console.log(`${caseName} test start`);
      const numbers = [3.2, 1.5, 2.7, 4.1, 5.3];
      const sortedNumbers = numbers.sort((a, b) => a - b);
      const middleIndex = Math.floor(sortedNumbers.length / 2);
      let median = 0;
      if (sortedNumbers.length % 2 === 0) {
        median = (sortedNumbers[middleIndex - 1] + sortedNumbers[middleIndex]) / 2;
      } else {
        median = sortedNumbers[middleIndex];
      }
      console.log(`${median}`);
      expect(3.2).assertEqual(median);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2400
     * @tc.name BuiltinsFloatLiteralTest2400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2400';
      console.log(`${caseName} test start`);
      const numbers = [1.1, 2.2, 3.3, 4.4, 5.5];
      const filteredNumbers = numbers.filter(num => num > 3);
      console.log(`${filteredNumbers}`);
      expect(JSON.stringify([3.3,4.4,5.5])).assertEqual(JSON.stringify(filteredNumbers));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2500
     * @tc.name BuiltinsFloatLiteralTest2500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2500';
      console.log(`${caseName} test start`);
      const base = 2.5;
      const exponent = 3;
      const result = Math.pow(base, exponent);
      console.log(`${result}`);
      expect(15.625).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2600
     * @tc.name BuiltinsFloatLiteralTest2600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2600';
      console.log(`${caseName} test start`);
      const numbers = [1.2, 2.5, 3.7, 4.9];
      const differences = numbers.slice(1).map((num, index) => num - numbers[index]);
      console.log(`${differences}`);
      expect(JSON.stringify([1.3, 1.2000000000000002, 1.2000000000000002])).assertEqual(JSON.stringify(differences));
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2700
     * @tc.name BuiltinsFloatLiteralTest2700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2700';
      console.log(`${caseName} test start`);
      const angle = 45;
      const radians = angle * (Math.PI / 180);
      const sine = Math.sin(radians);
      console.log(`${sine}`);
      expect(0.7071067811865475).assertEqual(sine);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2800
     * @tc.name BuiltinsFloatLiteralTest2800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2800';
      console.log(`${caseName} test start`);
      const num = 3.14159;
      const decimalPlaces = 2;
      const rounded = parseFloat(num.toFixed(decimalPlaces));
      console.log(`${rounded}`);
      expect(3.14).assertEqual(rounded);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_2900
     * @tc.name BuiltinsFloatLiteralTest2900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest2900';
      console.log(`${caseName} test start`);
      const numbers = [1.5, 2.5, 3.5];
      const weights = [0.2, 0.3, 0.5];
      let weightedSum = 0;
      let totalWeight = 0;
      for (let i = 0; i < numbers.length; i++) {
        weightedSum += numbers[i] * weights[i];
        totalWeight += weights[i];
      }
      const weightedAverage = weightedSum / totalWeight;
      console.log(`${weightedAverage}`);
      expect(2.8).assertEqual(weightedAverage);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_FLOAT_LITERAL_TEST_3000
     * @tc.name BuiltinsFloatLiteralTest3000
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsFloatLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsFloatLiteralTest3000';
      console.log(`${caseName} test start`);
      const principal = 1000.0;
      const annualInterestRate = 0.05;
      const compoundingPeriodsPerYear = 12;
      const years = 2;
      const amount = principal * Math.pow(1 + (annualInterestRate / compoundingPeriodsPerYear), compoundingPeriodsPerYear * years);
      console.log(`${amount}`); 
      expect(1104.941335558327).assertEqual(amount);
      console.log(`${caseName} test end`);
      Done();
    })

  })
}