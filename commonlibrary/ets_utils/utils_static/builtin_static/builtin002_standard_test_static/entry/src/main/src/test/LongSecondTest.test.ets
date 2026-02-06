/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsLongSecondPrototypebTest() {
  describe('builtinsLongSecondPrototypebTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0100
     * @tc.name builtinsLongSecondPrototypebTest0100
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0100'
        console.info(`${caseName}, test start`);
        const zero = new Long(0);
        const result = zero.toFloat();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0200
     * @tc.name builtinsLongSecondPrototypebTest0200
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0200'
        console.info(`${caseName}, test start`);
        const num = new Long(123);
        const result = num.toFloat();
        expect(result).assertEqual(123.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0300
     * @tc.name builtinsLongSecondPrototypebTest0300
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0300'
        console.info(`${caseName}, test start`);
        const num = new Long(-456);
        const result = num.toFloat();
        expect(result).assertEqual(-456.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0400
     * @tc.name builtinsLongSecondPrototypebTest0400
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0400'
        console.info(`${caseName}, test start`);
        const bigNum = new Long(16777215);
        const result = bigNum.toFloat();
        expect(result).assertEqual(16777215.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0500
     * @tc.name builtinsLongSecondPrototypebTest0500
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0500'
        console.info(`${caseName}, test start`);
        const hugeNum = new Long(16777217);
        const result = hugeNum.toFloat();
        expect(result).assertEqual(16777216.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0600
     * @tc.name builtinsLongSecondPrototypebTest0600
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0600'
        console.info(`${caseName}, test start`);
        const max = new Long(Long.MAX_VALUE);
        const result = max.toFloat();
        expect(result).assertEqual(9223372036854775807.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0700
     * @tc.name builtinsLongSecondPrototypebTest0700
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0700'
        console.info(`${caseName}, test start`);
        const min = new Long(Long.MIN_VALUE);
        const result = min.toFloat();
        expect(result).assertEqual(-9223372036854775808.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0701
     * @tc.name builtinsLongSecondPrototypebTest0701
     * @tc.desc test toFloat(): float return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0701'
        console.info(`${caseName}, test start`);
        const precisionTest = new Long(123456789);
        const result = precisionTest.toFloat();
        expect(result).assertEqual(123456792.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0800
     * @tc.name builtinsLongSecondPrototypebTest0800
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0800'
        console.info(`${caseName}, test start`);
        const longValue = new Long(2147483647);
        const result = longValue.toInt();
        expect(result).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_0900
     * @tc.name builtinsLongSecondPrototypebTest0900
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest0900'
        console.info(`${caseName}, test start`);
        const longValue = new Long(2147483647);
        const result = longValue.toInt();
        expect(result).assertEqual(2147483647);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1000
     * @tc.name builtinsLongSecondPrototypebTest1000
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1000'
        console.info(`${caseName}, test start`);
        const longValue = new Long(-2147483648);
        const result = longValue.toInt();
        expect(result).assertEqual(-2147483648);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1100
     * @tc.name builtinsLongSecondPrototypebTest1100
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1100'
        console.info(`${caseName}, test start`);
        const longValue = new Long(-2147483648);
        const result = longValue.toInt();
        expect(result).assertEqual(-2147483648);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1200
     * @tc.name builtinsLongSecondPrototypebTest1200
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1200'
        console.info(`${caseName}, test start`);
        const longValue = new Long(2147483648);
        const result = longValue.toInt();
        expect(result).assertEqual(-2147483648);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1500
     * @tc.name builtinsLongSecondPrototypebTest1500
     * @tc.desc test toInt(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1500'
        console.info(`${caseName}, test start`);
        const longValue = new Long(-9223372036854775808);
        const result = longValue.toInt();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1600
     * @tc.name builtinsLongSecondPrototypebTest1600
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1600'
        console.info(`${caseName}, test start`);
        const longObj = new Long();
        const result = longObj.toLong();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1700
     * @tc.name builtinsLongSecondPrototypebTest1700
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1700'
        console.info(`${caseName}, test start`);
        const testValue = 123456789012345 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1800
     * @tc.name builtinsLongSecondPrototypebTest1800
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1800'
        console.info(`${caseName}, test start`);
        const testValue = -98765432109876 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1900
     * @tc.name builtinsLongSecondPrototypebTest1900
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1900'
        console.info(`${caseName}, test start`);
        const testValue = Long.MAX_VALUE;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_1901
     * @tc.name builtinsLongSecondPrototypebTest1901
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest1901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest1901'
        console.info(`${caseName}, test start`);
        const testValue = Long.MIN_VALUE;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2000
     * @tc.name builtinsLongSecondPrototypebTest2000
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2000'
        console.info(`${caseName}, test start`);
        const testValue = 555555555555 as long;
        const longObj = Long.valueOf(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2100
     * @tc.name builtinsLongSecondPrototypebTest2100
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2100'
        console.info(`${caseName}, test start`);
        const testValue = 0 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2200
     * @tc.name builtinsLongSecondPrototypebTest2200
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2200'
        console.info(`${caseName}, test start`);
        const testValue = 0 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2300
     * @tc.name builtinsLongSecondPrototypebTest2300
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2300'
        console.info(`${caseName}, test start`);
        const testValue = 9007199254740991 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2400
     * @tc.name builtinsLongSecondPrototypebTest2400
     * @tc.desc test toLong(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2400'
        console.info(`${caseName}, test start`);
        const testValue = 9007199254740991 as long;
        const longObj = new Long(testValue);
        const result = longObj.toLong();
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2500
     * @tc.name builtinsLongSecondPrototypebTest2500
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2500'
        console.info(`${caseName}, test start`);
        const longObj = new Long();
        const result = longObj.toShort();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2600
     * @tc.name builtinsLongSecondPrototypebTest2600
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2600'
        console.info(`${caseName}, test start`);
        const testValue = 12345 as long;
        const expected = 12345 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2700
     * @tc.name builtinsLongSecondPrototypebTest2700
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2700'
        console.info(`${caseName}, test start`);
        const testValue = -12345 as long;
        const expected = -12345 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2800
     * @tc.name builtinsLongSecondPrototypebTest2800
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2800'
        console.info(`${caseName}, test start`);
        const testValue = 32767 as long;
        const expected = 32767 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_2900
     * @tc.name builtinsLongSecondPrototypebTest2900
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest2900'
        console.info(`${caseName}, test start`);
        const testValue = -32768 as long;
        const expected = -32768 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3000
     * @tc.name builtinsLongSecondPrototypebTest3000
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3000'
        console.info(`${caseName}, test start`);
        const testValue = 32768 as long;
        const expected = -32768 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3100
     * @tc.name builtinsLongSecondPrototypebTest3100
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3100'
        console.info(`${caseName}, test start`);
        const testValue = 123456789 as long;
        const expected = -13035 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3200
     * @tc.name builtinsLongSecondPrototypebTest3200
     * @tc.desc test toShort(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3200'
        console.info(`${caseName}, test start`);
        const testValue = -9876543210 as long;
        const expected = -5866 as short;
        const longObj = new Long(testValue);
        const result = longObj.toShort();
        expect(result).assertEqual(expected);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3300
     * @tc.name builtinsLongSecondPrototypebTest3300
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3300'
        console.info(`${caseName}, test start`);
        const longObj = new Long();
        const result = longObj.toString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3400
     * @tc.name builtinsLongSecondPrototypebTest3400
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3400'
        console.info(`${caseName}, test start`);
        const testValue = 123456789 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('123456789');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3500
     * @tc.name builtinsLongSecondPrototypebTest3500
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3500'
        console.info(`${caseName}, test start`);
        const testValue = -987654321 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('-987654321');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3600
     * @tc.name builtinsLongSecondPrototypebTest3600
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3600'
        console.info(`${caseName}, test start`);
        const testValue = Long.MAX_VALUE;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('9223372036854775807');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3700
     * @tc.name builtinsLongSecondPrototypebTest3700
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3700'
        console.info(`${caseName}, test start`);
        const testValue = Long.MIN_VALUE;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('-9223372036854775808');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_3800
     * @tc.name builtinsLongSecondPrototypebTest3800
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest3800'
        console.info(`${caseName}, test start`);
        const testValue = 0 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4000
     * @tc.name builtinsLongSecondPrototypebTest4000
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4000'
        console.info(`${caseName}, test start`);
        const testValue = -555555555555555555 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('-555555555555555555');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4100
     * @tc.name builtinsLongSecondPrototypebTest4100
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4100'
        console.info(`${caseName}, test start`);
        const testValue = 7 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('7');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4200
     * @tc.name builtinsLongSecondPrototypebTest4200
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4200'
        console.info(`${caseName}, test start`);
        const testValue = -3 as long;
        const longObj = new Long(testValue);
        const result = longObj.toString();
        expect(result).assertEqual('-3');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4300
     * @tc.name builtinsLongSecondPrototypebTest4300
     * @tc.desc test valueOf(value: long): Long return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4300'
        console.info(`${caseName}, test start`);
        const result = Long.valueOf(0 as long);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4301
     * @tc.name builtinsLongSecondPrototypebTest4301
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4301'
        console.info(`${caseName}, test start`);
        const result = Long.valueOf(0 as long);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4400
     * @tc.name builtinsLongSecondPrototypebTest4400
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4400'
        console.info(`${caseName}, test start`);
        const testValue = 123456789 as long;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4500
     * @tc.name builtinsLongSecondPrototypebTest4500
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4500'
        console.info(`${caseName}, test start`);
        const testValue = -987654321 as long;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4600
     * @tc.name builtinsLongSecondPrototypebTest4600
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4600'
        console.info(`${caseName}, test start`);
        const testValue = Long.MAX_VALUE;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4700
     * @tc.name builtinsLongSecondPrototypebTest4700
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4700'
        console.info(`${caseName}, test start`);
        const testValue = Long.MAX_VALUE;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_4800
     * @tc.name builtinsLongSecondPrototypebTest4800
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4800'
        console.info(`${caseName}, test start`);
        const testValue = Long.MIN_VALUE;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_04901
     * @tc.name builtinsLongSecondPrototypebTest04901
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest04901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest04901'
        console.info(`${caseName}, test start`);
        const testValue = 999999999999999999 as long;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_04900
     * @tc.name builtinsLongSecondPrototypebTest04900
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest04900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest4900'
        console.info(`${caseName}, test start`);
        const testValue = -555555555555555555 as long;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5000
     * @tc.name builtinsLongSecondPrototypebTest5000
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5000'
        console.info(`${caseName}, test start`);
        const testValue = 7 as long;
        const result = Long.valueOf(testValue);
        expect(result).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5100
     * @tc.name builtinsLongSecondPrototypebTest5100
     * @tc.desc test toString(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5100'
        console.info(`${caseName}, test start`);
        const value1 = Long.valueOf(42 as long);
        const value2 = Long.valueOf(42 as long);
        expect(value1).assertEqual(value2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5200
     * @tc.name builtinsLongSecondPrototypebTest5200
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5200'
        console.info(`${caseName}, test start`);
        const long1 = new Long(0 as long);
        const long2 = new Long(0 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5300
     * @tc.name builtinsLongSecondPrototypebTest5300
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5300'
        console.info(`${caseName}, test start`);
        const long1 = new Long(10 as long);
        const long2 = new Long(3 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(7);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5400
     * @tc.name builtinsLongSecondPrototypebTest5400
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5400'
        console.info(`${caseName}, test start`);
        const long1 = new Long(5 as long);
        const long2 = new Long(-3 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(8);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5500
     * @tc.name builtinsLongSecondPrototypebTest5500
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5500'
        console.info(`${caseName}, test start`);
        const long1 = new Long(-5 as long);
        const long2 = new Long(3 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(-8);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5600
     * @tc.name builtinsLongSecondPrototypebTest5600
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5600'
        console.info(`${caseName}, test start`);
        const long1 = new Long(-5 as long);
        const long2 = new Long(-3 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5700
     * @tc.name builtinsLongSecondPrototypebTest5700
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5700'
        console.info(`${caseName}, test start`);
        const long1 = new Long(Long.MAX_VALUE);
        const long2 = new Long(Long.MAX_VALUE);
        const result = long1.sub(long2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5800
     * @tc.name builtinsLongSecondPrototypebTest5800
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5800'
        console.info(`${caseName}, test start`);
        const long1 = new Long(Long.MAX_VALUE);
        const long2 = new Long(Long.MAX_VALUE);
        const result = long1.sub(long2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_5900
     * @tc.name builtinsLongSecondPrototypebTest5900
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest5900'
        console.info(`${caseName}, test start`);
        const long1 = new Long(Long.MIN_VALUE);
        const long2 = new Long(Long.MIN_VALUE);
        const result = long1.sub(long2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6000
     * @tc.name builtinsLongSecondPrototypebTest6000
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6000'
        console.info(`${caseName}, test start`);
        const long1 = new Long(123456789012345 as long);
        const long2 = new Long(98765432109876 as long);
        const result = long1.sub(long2);
        expect(result).assertEqual(24691356902469);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6100
     * @tc.name builtinsLongSecondPrototypebTest6100
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6100'
        console.info(`${caseName}, test start`);
        const long1 = new Long(0 as long);
        const result = long1.toString(10);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6200
     * @tc.name builtinsLongSecondPrototypebTest6200
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6200'
        console.info(`${caseName}, test start`);
        const long1 = new Long(0 as long);
        const result = long1.toString(10);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6300
     * @tc.name builtinsLongSecondPrototypebTest6300
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6300'
        console.info(`${caseName}, test start`);
        const long1 = new Long(12345 as long);
        const result = long1.toString(10);
        expect(result).assertEqual('12345');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6400
     * @tc.name builtinsLongSecondPrototypebTest6400
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6400'
        console.info(`${caseName}, test start`);
        const long1 = new Long(-6789 as long);
        const result = long1.toString(10);
        expect(result).assertEqual('-6789');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6500
     * @tc.name builtinsLongSecondPrototypebTest6500
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6500'
        console.info(`${caseName}, test start`);
        const long1 = new Long(10 as long);
        const result = long1.toString(2);
        expect(result).assertEqual('1010');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6600
     * @tc.name builtinsLongSecondPrototypebTest6600
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6600'
        console.info(`${caseName}, test start`);
        const long1 = new Long(255 as long);
        const result = long1.toString(16);
        expect(result).assertEqual('ff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6700
     * @tc.name builtinsLongSecondPrototypebTest6700
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6700'
        console.info(`${caseName}, test start`);
        const long1 = new Long(35 as long);
        const result = long1.toString(36);
        expect(result).assertEqual('z');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6800
     * @tc.name builtinsLongSecondPrototypebTest6800
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6800'
        console.info(`${caseName}, test start`);
        const long1 = new Long(Long.MAX_VALUE);
        const result = long1.toString(16);
        expect(result).assertEqual('7fffffffffffffff');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_SECOND_TEST_6900
     * @tc.name builtinsLongSecondPrototypebTest6900
     * @tc.desc test toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsLongSecondPrototypebTest6900'
        console.info(`${caseName}, test start`);
        const long1 = new Long(Long.MIN_VALUE);
        const result = long1.toString(16);
        expect(result).assertEqual('-8000000000000000');
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}
