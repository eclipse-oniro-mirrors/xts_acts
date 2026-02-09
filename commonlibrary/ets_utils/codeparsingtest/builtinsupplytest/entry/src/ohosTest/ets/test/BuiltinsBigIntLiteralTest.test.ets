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




export default function BuiltinsBigIntLiteralTest() {
  describe('BuiltinsBigIntLiteralTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   BuiltinsBigIntLiteralTest0100
     * @tc.number SUB_BIGINT_LITERAL_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0100';
      console.log(`${caseName} test start`);
      const bigInt1 = 123n;
      const bigInt2 = 985n;
      const bigInt3 = 211n;
      const bigInt4 = 996n;
      const bigIntArray = [bigInt1, bigInt2, bigInt3, bigInt4];
      let maxBigInt = bigIntArray[0];
      for (let i = 0; i < bigIntArray.length; i++) {
        if (bigIntArray[i] > maxBigInt) {
          maxBigInt = bigIntArray[i];
        }
      }
      const expectedMax = 996n;
      expect(expectedMax).assertEqual(maxBigInt);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest0200
     * @tc.number SUB_BIGINT_LITERAL_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0200';
      console.log(`${caseName} test start`);
      const  bigint1 = 147n;
      const  bigint2 = 258n;
      const  bigint3 = 369n;
      const  bigintArray = [bigint1, bigint2, bigint3];
      let minBigint = bigintArray[0];
      for (let i = 0; i < bigintArray.length; i++) {
        if (bigintArray[i]<minBigint) {
          minBigint = bigintArray[i];
        }
      }
      const expectedMin = 147n;
      expect(expectedMin).assertEqual(minBigint);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest0300
     * @tc.number SUB_BIGINT_LITERAL_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0300';
      console.log(`${caseName} test start`);
      const bigInt_2 = 985n;
      const bigInt_3 = 211n;
      const bigInt_4 = 996n;
      const bigInt_Array = [bigInt_2, bigInt_3, bigInt_4];
      let maxBigInt = bigInt_Array[0];
      for (let i = 0; i < bigInt_Array.length; i++) {
        if (bigInt_Array[i] > maxBigInt) {
          maxBigInt = bigInt_Array[i]+1n;
        }
      }
      const expectedMax = 997n;
      expect(expectedMax).assertEqual(maxBigInt);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest0400
     * @tc.number SUB_BIGINT_LITERAL_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0400';
      console.log(`${caseName} test start`);
      const  bigint1 = 789n;
      const  bigint2 = 147n;
      const  bigint3 = 369n;
      const  bigintArray = [bigint1, bigint2, bigint3];
      let minBigint = bigintArray[0];
      for (let i = 0; i < bigintArray.length; i++) {
        if (bigintArray[i]<= minBigint) {
          minBigint = bigintArray[i] - 1n;
        }
      }
      const expectedMin = 146n;
      expect(expectedMin).assertEqual(minBigint);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest0500
     * @tc.number SUB_BIGINT_LITERAL_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0500';
      console.log(`${caseName} test start`);
      const bigIntValue = 12_345n;
      expect(12_345n).assertEqual(bigIntValue);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest0600
     * @tc.number SUB_BIGINT_LITERAL_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0600';
      console.log(`${caseName} test start`);
      const bigIntValue = 1_2_3_4_5n;
      expect(1_2_3_4_5n).assertEqual(bigIntValue)
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest0700
     * @tc.number SUB_BIGINT_LITERAL_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0700';
      console.log(`${caseName} test start`);
      const bigIntValue = -12345n;
      expect(-12345n).assertEqual(bigIntValue);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest0800
     * @tc.number SUB_BIGINT_LITERAL_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0800';
      console.log(`${caseName} test start`);
      const withUnderscore = 12_345n;
      const withoutUnderscore = 12345n;
      if (withUnderscore === withoutUnderscore) {
        console.log(`${caseName}`);
      } else {
        throw new Error(`${caseName}`);
      }
      expect(withUnderscore).assertEqual(withoutUnderscore);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest0900
     * @tc.number SUB_BIGINT_LITERAL_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest0900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest0900';
      console.log(`${caseName} test start`);
      const strValue1 = '123';
      const strValue2 = '456';
      const strValue3 = '789';
      const bigIntValue1 = BigInt(strValue1);
      const bigIntValue2 = BigInt(strValue2);
      const bigIntValue3 = BigInt(strValue3);
      const bigIntArray = [bigIntValue1, bigIntValue2, bigIntValue3];
      let maxBigInt = bigIntArray[0];
      for (let i = 0; i < bigIntArray.length; i++) {
        if (bigIntArray[i] > maxBigInt) {
          maxBigInt = bigIntArray[i];
        }
      }
      const expectedMax = 789n;
      expect(expectedMax).assertEqual(maxBigInt);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1000
     * @tc.number SUB_BIGINT_LITERAL_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1000';
      console.log(`${caseName} test start`);
      const strValue1 = '159';
      const strValue2 = '357';
      const strValue3 = '852';
      const strValue4 = '456';
      const bigIntValue1 = BigInt(strValue1);
      const bigIntValue2 = BigInt(strValue2);
      const bigIntValue3 = BigInt(strValue3);
      const bigIntValue4 = BigInt(strValue4);
      const bigIntArray = [bigIntValue1, bigIntValue2, bigIntValue3,bigIntValue4];
      let minBigInt = bigIntArray[0];
      for (let i = 0; i < bigIntArray.length; i++) {
        if (bigIntArray[i] <= minBigInt) {
          minBigInt = bigIntArray[i];
        }
      }
      const expectedMin = 159n;
      expect(expectedMin).assertEqual(minBigInt)
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1100
     * @tc.number SUB_BIGINT_LITERAL_TEST_1100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1100';
      console.log(`${caseName} test start`);
      const strValue1 = '369';
      const strValue2 = '456';
      const strValue3 = '789';
      const bigIntValue1 = BigInt(strValue1);
      const bigIntValue2 = BigInt(strValue2);
      const bigIntValue3 = BigInt(strValue3);
      const bigIntArray = [bigIntValue1, bigIntValue2, bigIntValue3];
      let maxBigInt = bigIntArray[0];
      for (let i = 0; i < bigIntArray.length; i++) {
        if (bigIntArray[i] > maxBigInt) {
          maxBigInt = bigIntArray[i]+1n;
        }
      }
      const expectedMax = 790n;
      expect(expectedMax).assertEqual(maxBigInt);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1200
     * @tc.number SUB_BIGINT_LITERAL_TEST_1200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1200';
      console.log(`${caseName} test start`);
      const strValue1 = '123';
      const strValue2 = '357';
      const strValue3 = '753';
      const strValue4 = '951';
      const bigIntValue1 = BigInt(strValue1);
      const bigIntValue2 = BigInt(strValue2);
      const bigIntValue3 = BigInt(strValue3);
      const bigIntValue4 = BigInt(strValue4);
      const bigIntArray = [bigIntValue1, bigIntValue2, bigIntValue3,bigIntValue4];
      let minBigInt = bigIntArray[0];
      for (let i = 0; i < bigIntArray.length; i++) {
        if (bigIntArray[i] <= minBigInt) {
          minBigInt = bigIntArray[i] - 1n;
        }
      }
      const expectedMin = 122n;
      expect(expectedMin).assertEqual(minBigInt);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1300
     * @tc.number SUB_BIGINT_LITERAL_TEST_1300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1300';
      console.log(`${caseName} test start`);
      const str1 = '1_23';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const bigint1 = BigInt(cleanStr);
      console.log(`${bigint1}`);
      expect(123n).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest1400
     * @tc.number SUB_BIGINT_LITERAL_TEST_1400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1400';
      console.log(`${caseName} test start`);
      const str1 = '_123';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const bigint1 = BigInt(cleanStr);
      console.log(`${bigint1}`);
      expect(123n).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1500
     * @tc.number SUB_BIGINT_LITERAL_TEST_1500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1500';
      console.log(`${caseName} test start`);
      const str1 = '1_2_3_4_5';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const bigint1 = BigInt(cleanStr);
      console.log(`${bigint1}`);
      expect(12345n).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest1600
     * @tc.number SUB_BIGINT_LITERAL_TEST_1600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1600';
      console.log(`${caseName} test start`);
      const str1 = '1234567_';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const bigint1 = BigInt(cleanStr);
      console.log(`${bigint1}`);
      expect(1234567n).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1700
     * @tc.number SUB_BIGINT_LITERAL_TEST_1700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1700';
      console.log(`${caseName} test start`);
      const str1 = '7_8_9';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const str2 = '789';
      const bigint1 = BigInt(cleanStr);
      const bigint2 = BigInt(str2);
      console.log(`${bigint1}`);
      expect(bigint2).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest1800
     * @tc.number SUB_BIGINT_LITERAL_TEST_1800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1800';
      console.log(`${caseName} test start`);
      const str1 = '1as23ds5';
      const cleanStr = str1.replace(/[^0-9-]/g, '');
      const bigint1 = BigInt(cleanStr);
      console.log(`${bigint1}`);
      expect(1235n).assertEqual(bigint1);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest1900
     * @tc.number SUB_BIGINT_LITERAL_TEST_1900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest1900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest1900';
      console.log(`${caseName} test start`);
      const num1 = 123n;
      const num2 = 456n;
      const result = num1 + num2;
      console.log(`${result}`);
      expect(579n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest2000
     * @tc.number SUB_BIGINT_LITERAL_TEST_2000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2000';
      console.log(`${caseName} test start`);
      const num1 = 456n;
      const num2 = 123n;
      const result = num1 - num2;
      console.log(`${result}`);
      expect(333n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest2100
     * @tc.number SUB_BIGINT_LITERAL_TEST_2100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2100';
      console.log(`${caseName} test start`);
      const num1 = 123n;
      const num2 = 456n;
      const result = num1 * num2;
      console.log(`${result}`);
      expect(56088n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest2200
     * @tc.number SUB_BIGINT_LITERAL_TEST_2200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2200';
      console.log(`${caseName} test start`);
      const num1 = 456n;
      const num2 = 123n;
      const result = num1 / num2;
      console.log(`${result}`);
      expect(3n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done()
    });

    /**
     * @tc.name   BuiltinsBigIntLiteralTest2300
     * @tc.number SUB_BIGINT_LITERAL_TEST_2300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2300';
      console.log(`${caseName} test start`);
      const num1 = 456n;
      const num2 = 123n;
      const result = num1 % num2;
      console.log(`${result}`);
      expect(87n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest2400
     * @tc.number SUB_BIGINT_LITERAL_TEST_2400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2400';
      console.log(`${caseName} test start`);
      const base = 2n;
      const exponent = 10n;
      const result = base ** exponent;
      console.log(`${result}`);
      expect(1024n).assertEqual(result);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest2500
     * @tc.number SUB_BIGINT_LITERAL_TEST_2500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2500';
      console.log(`${caseName} test start`);
      const num1 = 123n;
      const num2 = 456n;
      const isLess = num1 < num2;
      console.log(`${isLess}`);
      expect(true).assertEqual(isLess);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsBigIntLiteralTest2600
     * @tc.number SUB_BIGINT_LITERAL_TEST_2600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2600';
      console.log(`${caseName} test start`);
      const num = 12n;
      let isEven = false;
      if (num % 2n === 0n) {
        isEven = true;
      }
      console.log(`${isEven}`);
      expect(true).assertEqual(isEven);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest2700
     * @tc.number SUB_BIGINT_LITERAL_TEST_2700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2700';
      console.log(`${caseName} test start`);
      const arr = [10n, 20n, 30n];
      let sum = 0n;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
        console.log(`${sum}`);
      }
      expect(60n).assertEqual(sum);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest2800
     * @tc.number SUB_BIGINT_LITERAL_TEST_2800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2800';
      console.log(`${caseName} test start`);
      let seconds = 0n;
      const incrementSeconds = () => {
        seconds++;
        return seconds;
      };
      for (let i = 0; i < 10; i++) {
        console.log(`${incrementSeconds()}`);
      }
      expect(10n).assertEqual(seconds);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest2900
     * @tc.number SUB_BIGINT_LITERAL_TEST_2900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest2900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest2900';
      console.log(`${caseName} test start`);
      const bool = true;
      const bigIntNum = BigInt(bool);
      console.log(`${bigIntNum}`);
      expect(1n).assertEqual(bigIntNum);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest3000
     * @tc.number SUB_BIGINT_LITERAL_TEST_3000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3000';
      console.log(`${caseName} test start`);
      interface myObject {
        num: number;
      }
      const obj: myObject = { num: 456 };
      const bigIntNum = BigInt(obj.num);
      console.log(`${bigIntNum}`);
      expect(456n).assertEqual(bigIntNum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3100
     * @tc.number SUB_BIGINT_LITERAL_TEST_3100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3100';
      console.log(`${caseName} test start`);
      const mixedArray = [1, 'abc', 2, 'def', 3];
      const numbers = mixedArray.filter(item => typeof item === 'number');
      const sum = numbers.reduce((acc, num) => acc + BigInt(num), 0n);
      console.log(`${sum}`);
      expect(6n).assertEqual(sum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3200
     * @tc.number SUB_BIGINT_LITERAL_TEST_3200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3200';
      console.log(`${caseName} test start`);
      const bigIntArray2 = [123n, 456n, 789n, 1011n, 1213n];
      let divisibleByThreeSum = 0n;
      for (let i = 0; i < bigIntArray2.length; i++) {
        if (bigIntArray2[i] % 3n === 0n) {
          divisibleByThreeSum += bigIntArray2[i];
        }
      }
      console.log(`${divisibleByThreeSum}`);
      expect(2379n).assertEqual(divisibleByThreeSum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3300
     * @tc.number SUB_BIGINT_LITERAL_TEST_3300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3300';
      console.log(`${caseName} test start`);
      const bigIntArray3 = [1n, 2n, 3n, 4n, 5n];
      let alternatingResult = 0n;
      for (let i = 0; i < bigIntArray3.length; i++) {
        if (i % 2 === 0) {
          alternatingResult += bigIntArray3[i];
        } else {
          alternatingResult -= bigIntArray3[i];
        }
      }
      console.log(`${alternatingResult}`);
      expect(3n).assertEqual(alternatingResult);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest3400
     * @tc.number SUB_BIGINT_LITERAL_TEST_3400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3400';
      console.log(`${caseName} test start`);
      const bigIntArray5 = [2n, 3n, 4n];
      let product = 1n;
      for (let i = 0; i < bigIntArray5.length; i++) {
        product *= bigIntArray5[i];
      }
      let root = 0n;
      while (root * root <= product) {
        root++;
      }
      root--;
      console.log(`${root}`);
      expect(4n).assertEqual(root);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsBigIntLiteralTest3500
     * @tc.number SUB_BIGINT_LITERAL_TEST_3500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3500',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3500';
      console.log(`${caseName} test start`);
      const bigIntArray7 = [1n, 2n, 3n, 4n, 5n];
      let oddSum = 0n;
      let evenSum = 0n;
      for (let i = 0; i < bigIntArray7.length; i++) {
        if (bigIntArray7[i] % 2n === 0n) {
          evenSum += bigIntArray7[i];
        } else {
          oddSum += bigIntArray7[i];
        }
      }
      console.log(`${oddSum}`);
      console.log(`${evenSum}`);
      expect(9n).assertEqual(oddSum);
      expect(6n).assertEqual(evenSum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3600
     * @tc.number SUB_BIGINT_LITERAL_TEST_3600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3600',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3600';
      console.log(`${caseName} test start`);
      let powerSum = 0n;
      for (let i = 1n; i <= 10n; i++) {
        let powerResult = 1n;
        for (let j = 0n; j < i; j++) {
          powerResult *= 2n;
        }
        powerSum += powerResult;
      }
      console.log(`${powerSum}`);
      expect(2046n).assertEqual(powerSum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3700
     * @tc.number SUB_BIGINT_LITERAL_TEST_3700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3700',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3700';
      console.log(`${caseName} test start`);
      const bigIntArray2 = [1n, 2n, 3n, 4n, 5n, 6n];
      let oddProduct = 1n;
      let evenProduct = 1n;
      for (let i = 0; i < bigIntArray2.length; i++) {
        if (i % 2 === 0) {
          oddProduct *= bigIntArray2[i];
        } else {
          evenProduct *= bigIntArray2[i];
        }
      }
      let sumOfProducts = oddProduct + evenProduct;
      console.log(`${sumOfProducts}`);
      expect(63n).assertEqual(sumOfProducts);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3800
     * @tc.number SUB_BIGINT_LITERAL_TEST_3800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3800',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3800';
      console.log(`${caseName} test start`);
      let intervalSum = 0n;
      for (let i = 100n; i <= 200n; i++) {
        intervalSum += i;
      }
      console.log(`${intervalSum}`);
      expect(15150n).assertEqual(intervalSum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest3900
     * @tc.number SUB_BIGINT_LITERAL_TEST_3900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest3900',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest3900';
      console.log(`${caseName} test start`);
      const bigIntArray5 = [2n, 3n, 4n, 5n, 6n, 7n];
      let groupedProductSum = 0n;
      for (let i = 0; i < bigIntArray5.length; i += 3) {
        let groupProduct = 1n;
        for (let j = i; j < i + 3 && j < bigIntArray5.length; j++) {
          groupProduct *= bigIntArray5[j];
        }
        groupedProductSum += groupProduct;
      }
      console.log(`${groupedProductSum}`);
      expect(234n).assertEqual(groupedProductSum);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsBigIntLiteralTest4000
     * @tc.number SUB_BIGINT_LITERAL_TEST_4000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsBigIntLiteralTest4000',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsBigIntLiteralTest4000';
      console.log(`${caseName} test start`);
      const bigIntArray6 = [1n, 2n, 3n, 4n];
      let cubeSum = 0n;
      for (let i = 0; i < bigIntArray6.length; i++) {
        cubeSum += bigIntArray6[i] * bigIntArray6[i] * bigIntArray6[i];
      }
      console.log(`${cubeSum}`);
      expect(100n).assertEqual(cubeSum);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}