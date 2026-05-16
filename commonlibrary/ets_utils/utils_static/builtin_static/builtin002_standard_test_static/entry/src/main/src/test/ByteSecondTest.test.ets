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
export default function builtinsByteSecondPrototypebTest() {
  describe('builtinsByteSecondPrototypebTest', (): void => {
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
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0100
     * @tc.name builtinsByteSecondPrototypebTest0100
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(2);
        const byte2 = new Byte(1);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0200
     * @tc.name builtinsByteSecondPrototypebTest0200
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const byte2 = new Byte(1);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0310
     * @tc.name builtinsByteSecondPrototypebTest0310
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0310'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const byte2 = new Byte(2);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0400
     * @tc.name builtinsByteSecondPrototypebTest0400
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const byte2 = new Byte(-1);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0500
     * @tc.name builtinsByteSecondPrototypebTest0500
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(0);
        const byte2 = new Byte(-1);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0600
     * @tc.name builtinsByteSecondPrototypebTest0600
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(0);
        const byte2 = new Byte(1);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0700
     * @tc.name builtinsByteSecondPrototypebTest0700
     * @tc.desc test acompareTo  return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-1);
        const byte2 = new Byte(-2);
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0800
     * @tc.name builtinsByteSecondPrototypebTest0800
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const result = byte1.toDouble();
        expect(result).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_0900
     * @tc.name builtinsByteSecondPrototypebTest0900
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest0900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toDouble();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1000
     * @tc.name builtinsByteSecondPrototypebTest1000
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-1);
        const result = byte1.toDouble();
        expect(result).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1100
     * @tc.name builtinsByteSecondPrototypebTest1100
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toDouble();
        expect(result).assertEqual(127.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1200
     * @tc.name builtinsByteSecondPrototypebTest1200
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toDouble();
        expect(result).assertEqual(-128.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1310
     * @tc.name builtinsByteSecondPrototypebTest1310
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1310'
        console.info(`${caseName}, test start`);
        const testValue = 42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toDouble();
        expect(result).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1400
     * @tc.name builtinsByteSecondPrototypebTest1400
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1400'
        console.info(`${caseName}, test start`);
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toDouble();
        expect(result).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1500
     * @tc.name builtinsByteSecondPrototypebTest1500
     * @tc.desc test toDouble return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1500'
        const byte1 = new Byte(0);
        const byte2 = new Byte(1);
        const result = byte1.add(byte2).toDouble();
        expect(result).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1600
     * @tc.name builtinsByteSecondPrototypebTest1600
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1600'
        const byte1 = new Byte(1);
        const result = byte1.toFloat();
        expect(result).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1700
     * @tc.name builtinsByteSecondPrototypebTest1700
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1700'
        const byte1 = new Byte();
        const result = byte1.toFloat();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1800
     * @tc.name builtinsByteSecondPrototypebTest1800
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1800'
        const byte1 = new Byte(-1);
        const result = byte1.toFloat();
        expect(result).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_1900
     * @tc.name builtinsByteSecondPrototypebTest1900
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest1900'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toFloat();
        expect(result).assertEqual(127.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2000
     * @tc.name builtinsByteSecondPrototypebTest2000
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2000'
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toFloat();
        expect(result).assertEqual(-128.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2100
     * @tc.name builtinsByteSecondPrototypebTest2100
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2100'
        const testValue = 42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toFloat();
        expect(result).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2200
     * @tc.name builtinsByteSecondPrototypebTest2200
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2200'
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toFloat();
        expect(result).assertEqual(-42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2310
     * @tc.name builtinsByteSecondPrototypebTest2310
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2310'
        const byte1 = new Byte(0);
        const byte2 = new Byte(1);
        const result = byte1.add(byte2).toFloat();
        expect(result).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2400
     * @tc.name builtinsByteSecondPrototypebTest2400
     * @tc.desc test toFloat return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2400'
        const byte1 = new Byte(1);
        const byte2 = new Byte(1);
        const result = byte1.mul(byte2).toFloat();
        expect(result).assertEqual(1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2500
     * @tc.name builtinsByteSecondPrototypebTest2500
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2500'
        const byte1 = new Byte(1);
        const result = byte1.toInt();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2600
     * @tc.name builtinsByteSecondPrototypebTest2600
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2600'
        const byte1 = new Byte();
        const result = byte1.toInt();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2700
     * @tc.name builtinsByteSecondPrototypebTest2700
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2700'
        const byte1 = new Byte(-1);
        const result = byte1.toInt();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2800
     * @tc.name builtinsByteSecondPrototypebTest2800
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2800'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toInt();
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_2900
     * @tc.name builtinsByteSecondPrototypebTest2900
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest2900'
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toInt();
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3000
     * @tc.name builtinsByteSecondPrototypebTest3000
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3000'
        const testValue = 42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toInt();
        expect(result).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3100
     * @tc.name builtinsByteSecondPrototypebTest3100
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3100'
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toInt();
        expect(result).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3200
     * @tc.name builtinsByteSecondPrototypebTest3200
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3200'
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        const result = byte1.toInt();
        expect(result).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3300
     * @tc.name builtinsByteSecondPrototypebTest3300
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3300'
        const byte1 = new Byte(0);
        const byte2 = new Byte(1);
        const result = byte1.add(byte2).toInt();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3400
     * @tc.name builtinsByteSecondPrototypebTest3400
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3400'
        const byte1 = new Byte(0);
        const result = byte1.toLong();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3500
     * @tc.name builtinsByteSecondPrototypebTest3500
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3500'
        const byte1 = new Byte(42);
        const result = byte1.toLong();
        expect(result).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3600
     * @tc.name builtinsByteSecondPrototypebTest3600
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3600'
        const byte1 = new Byte(42);
        const result = byte1.toLong();
        expect(result).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3700
     * @tc.name builtinsByteSecondPrototypebTest3700
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3700'
        const byte1 = new Byte(-100);
        const result = byte1.toLong();
        expect(result).assertEqual(-100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3800
     * @tc.name builtinsByteSecondPrototypebTest3800
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3800'
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toLong();
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_3900
     * @tc.name builtinsByteSecondPrototypebTest3900
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest3900'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toLong();
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4000
     * @tc.name builtinsByteSecondPrototypebTest4000
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4000'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toLong();
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4100
     * @tc.name builtinsByteSecondPrototypebTest4100
     * @tc.desc test toInt return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4100'
        const byte1 = new Byte(1);
        const byte2 = new Byte(-1);
        expect(byte1.toLong()).assertEqual(1);
        expect(byte2.toLong()).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4200
     * @tc.name builtinsByteSecondPrototypebTest4200
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4200'
        const byte1 = new Byte(0);
        const result = byte1.toShort();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4300
     * @tc.name builtinsByteSecondPrototypebTest4300
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4300'
        const byte1 = new Byte(100);
        const result = byte1.toShort();
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4400
     * @tc.name builtinsByteSecondPrototypebTest4400
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4400'
        const byte1 = new Byte(-50);
        const result = byte1.toShort();
        expect(result).assertEqual(-50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4500
     * @tc.name builtinsByteSecondPrototypebTest4500
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4500'
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toShort();
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4600
     * @tc.name builtinsByteSecondPrototypebTest4600
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4600'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toShort();
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4700
     * @tc.name builtinsByteSecondPrototypebTest4700
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4700'
        const byte1 = new Byte(127);
        const result = byte1.toShort();
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4800
     * @tc.name builtinsByteSecondPrototypebTest4800
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4800'
        const byte1 = new Byte(-128);
        const result = byte1.toShort();
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_4900
     * @tc.name builtinsByteSecondPrototypebTest4900
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest4900'
        const value: int = 65;
        const byte1 = new Byte(value.toByte());
        expect(byte1.toShort()).assertEqual(Byte.toShort(value.toByte()));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5000
     * @tc.name builtinsByteSecondPrototypebTest5000
     * @tc.desc test toShort return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5000'
        const byte1 = new Byte(0);
        const result = byte1.toString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5100
     * @tc.name builtinsByteSecondPrototypebTest5100
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5100'
        const byte1 = new Byte(5);
        const result = byte1.toString();
        expect(result).assertEqual('5');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5200
     * @tc.name builtinsByteSecondPrototypebTest5200
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5200'
        const byte1 = new Byte(127);
        const result = byte1.toString();
        expect(result).assertEqual('127');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5300
     * @tc.name builtinsByteSecondPrototypebTest5300
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5300'
        const byte1 = new Byte(-3);
        const result = byte1.toString();
        expect(result).assertEqual('-3');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5400
     * @tc.name builtinsByteSecondPrototypebTest5400
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5400'
        const byte1 = new Byte(-128);
        const result = byte1.toString();
        expect(result).assertEqual('-128');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5500
     * @tc.name builtinsByteSecondPrototypebTest5500
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5500'
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toString();
        expect(result).assertEqual('127');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5600
     * @tc.name builtinsByteSecondPrototypebTest5600
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5600'
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toString();
        expect(result).assertEqual('-128');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_05700
     * @tc.name builtinsByteSecondPrototypebTest05700
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest05700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5700'
        const value: int = 42;
        const byte1 = new Byte(value.toByte());
        const result = byte1.toString();
        expect(result).assertEqual(value.toString());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5701
     * @tc.name builtinsByteSecondPrototypebTest5701
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5701'
        const byte1 = new Byte(1);
        const byte2 = new Byte(-1);
        expect(byte1.toString()).assertEqual('1');
        expect(byte2.toString()).assertEqual('-1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5800
     * @tc.name builtinsByteSecondPrototypebTest5800
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5800'
        const result = Byte.valueOf(0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_5900
     * @tc.name builtinsByteSecondPrototypebTest5900
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest5900'
        const result = Byte.valueOf(0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6000
     * @tc.name builtinsByteSecondPrototypebTest6000
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6000';
        const result = Byte.valueOf(42);
        expect(result).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6100
     * @tc.name builtinsByteSecondPrototypebTest6100
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6100';
        const result = Byte.valueOf(-100);
        expect(result).assertEqual(-100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6200
     * @tc.name builtinsByteSecondPrototypebTest6200
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6200';
        const result = Byte.valueOf(Byte.MAX_VALUE);
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6300
     * @tc.name builtinsByteSecondPrototypebTest6300
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6300';
        const result = Byte.valueOf(Byte.MIN_VALUE);
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6400
     * @tc.name builtinsByteSecondPrototypebTest6400
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6400';
        const result1 = Byte.valueOf(10);
        const result2 = Byte.valueOf(10);
        expect(result1).assertEqual(result2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6500
     * @tc.name builtinsByteSecondPrototypebTest6500
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6500';
        const maxResult = Byte.valueOf(Byte.MAX_VALUE);
        const minResult = Byte.valueOf(Byte.MIN_VALUE);
        expect(maxResult).assertEqual(127);
        expect(minResult).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6501
     * @tc.name builtinsByteSecondPrototypebTest6501
     * @tc.desc test valueOf() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6501';
        const value = 65;
        const fromConstructor = new Byte(value.toByte());
        const fromValueOf = Byte.valueOf(value.toByte());
        expect(fromValueOf).assertEqual(fromConstructor);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6600
     * @tc.name builtinsByteSecondPrototypebTest6600
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6600';
        const firstNumber = new Byte(50);
        const secondNumber = new Byte(30);
        const difference = firstNumber.sub(secondNumber);
        expect(difference).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6700
     * @tc.name builtinsByteSecondPrototypebTest6700
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6700';
        const minuend = new Byte(-40);
        const subtrahend = new Byte(-10);
        const result = minuend.sub(subtrahend);
        expect(result).assertEqual(-30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6800
     * @tc.name builtinsByteSecondPrototypebTest6800
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6800';
        const zeroValue = new Byte(0);
        const operand = new Byte(15);
        const negativeResult = zeroValue.sub(operand);
        expect(negativeResult).assertEqual(-15);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_6900
     * @tc.name builtinsByteSecondPrototypebTest6900
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest6900';
        const positiveValue = new Byte(100);
        const sameValue = new Byte(100);
        const zeroResult = positiveValue.sub(sameValue);
        expect(zeroResult).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7000
     * @tc.name builtinsByteSecondPrototypebTest7000
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7000';
        const maxByte = new Byte(Byte.MAX_VALUE);
        const unitValue = new Byte(1);
        const belowMax = maxByte.sub(unitValue);
        expect(belowMax).assertEqual(126);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7100
     * @tc.name builtinsByteSecondPrototypebTest7100
     * @tc.desc test sub() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7100';
        const minByte = new Byte(Byte.MIN_VALUE);
        const unitValue = new Byte(1);
        const result = minByte.sub(unitValue);
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7200
     * @tc.name builtinsByteSecondPrototypebTest7200
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7200';
        const decimalValue = new Byte(5);
        const binaryString = decimalValue.toString(2);
        expect(binaryString).assertEqual('101');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7201
     * @tc.name builtinsByteSecondPrototypebTest7201
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7201';
        const negativeValue = new Byte(-3);
        const binaryResult = negativeValue.toString(2);
        expect(binaryResult).assertEqual('-11');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7300
     * @tc.name builtinsByteSecondPrototypebTest7300
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7300';
        const testValue = new Byte(64 as byte);
        const octalString = testValue.toString(8);
        expect(octalString).assertEqual('100');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7400
     * @tc.name builtinsByteSecondPrototypebTest7400
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7400';
        const hexValue = new Byte((255).toByte());
        const hexString = hexValue.toString(16);
        expect(hexString.toString()).assertEqual('-1');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7500
     * @tc.name builtinsByteSecondPrototypebTest7500
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7500';
        const maxByte = new Byte(Byte.MAX_VALUE);
        const base36String = maxByte.toString(36);
        expect(base36String).assertEqual('3j');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_SECOND_TEST_7600
     * @tc.name builtinsByteSecondPrototypebTest7600
     * @tc.desc test toString return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsByteSecondPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsByteSecondPrototypebTest7600';
        const zeroInstance = new Byte(0 as byte);
        expect(zeroInstance.toString(2)).assertEqual('0');
        expect(zeroInstance.toString(8)).assertEqual('0');
        expect(zeroInstance.toString(16)).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}
