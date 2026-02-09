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
export default function builtinsBytePrototypebTest() {
  describe('builtinsBytePrototypebTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0100
     * @tc.name builtinsBytePrototypebTest0100
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(10);
        const byte2 = new Byte(20);
        const result = byte1.add(byte2);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0200
     * @tc.name builtinsBytePrototypebTest0200
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-10);
        const byte2 = new Byte(-20);
        const result = byte1.add(byte2);
        expect(result).assertEqual(-30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0300
     * @tc.name builtinsBytePrototypebTest0300
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(50);
        const byte2 = new Byte(-30);
        const result = byte1.add(byte2);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0400
     * @tc.name builtinsBytePrototypebTest0400
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(100);
        const byte2 = new Byte(0);
        const result = byte1.add(byte2);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0500
     * @tc.name builtinsBytePrototypebTest0500
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(1);
        const result = byte1.add(byte2);
        expect(result).assertEqual(Byte.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0600
     * @tc.name builtinsBytePrototypebTest0600
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(-1);
        const result = byte1.add(byte2);
        expect(result).assertEqual(Byte.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0700
     * @tc.name builtinsBytePrototypebTest0700
     * @tc.desc test add(other: Byte): Byte return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.add(byte2);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0800
     * @tc.name builtinsBytePrototypebTest0800
     * @tc.desc test add(other: Byte): Bytereturn value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(0);
        const byte2 = new Byte(0);
        const result = byte1.add(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_0900
     * @tc.name builtinsBytePrototypebTest0900
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest0900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        expect(byte1).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1000
     * @tc.name builtinsBytePrototypebTest1000
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1;
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1100
     * @tc.name builtinsBytePrototypebTest1100
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toByte();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1200
     * @tc.name builtinsBytePrototypebTest1200
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toInt();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1300
     * @tc.name builtinsBytePrototypebTest1300
     * @tc.desc test public constructor()return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1400
     * @tc.name builtinsBytePrototypebTest1400
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const byte2 = new Byte();
        const result = byte1.equals(byte2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1500
     * @tc.name builtinsBytePrototypebTest1500
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const byte2 = new Byte();
        const result = byte1.compareTo(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1600
     * @tc.name builtinsBytePrototypebTest1600
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const byte2 = new Byte();
        const result = byte1.add(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1700
     * @tc.name builtinsBytePrototypebTest1700
     * @tc.desc test public constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1800
     * @tc.name builtinsBytePrototypebTest1800
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(42);
        expect(byte1).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_1900
     * @tc.name builtinsBytePrototypebTest1900
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-42);
        expect(byte1).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_02000
     * @tc.name builtinsBytePrototypebTest02000
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        expect(byte1).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2000
     * @tc.name builtinsBytePrototypebTest2000
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        expect(byte1).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2100
     * @tc.name builtinsBytePrototypebTest2100
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1210'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(100);
        const byte2 = new Byte(100);
        expect(byte1.equals(byte2)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2200
     * @tc.name builtinsBytePrototypebTest2200
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest1220'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(50);
        const byte2 = new Byte(50);
        expect(byte1.compareTo(byte2)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2201
     * @tc.name builtinsBytePrototypebTest2201
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2201'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-99);
        expect(byte1.toString()).assertEqual('-99');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2300
     * @tc.name builtinsBytePrototypebTest2300
     * @tc.desc test public constructor(value: byte) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(10);
        const byte2 = new Byte(20);
        const result = byte1.add(byte2);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2400
     * @tc.name builtinsBytePrototypebTest2400
     * @tc.desc test createFromJSONValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2400'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: 0
        };
        const byteInstance = new Byte();
        const result = byteInstance.createFromJSONValue(json);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2500
     * @tc.name builtinsBytePrototypebTest2500
     * @tc.desc test createFromJSONValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2500'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: 42
        };
        const byteInstance = new Byte();
        const result = byteInstance.createFromJSONValue(json);
        expect(result).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2600
     * @tc.name builtinsBytePrototypebTest2600
     * @tc.desc test createFromJSONValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2600'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: -42
        };
        const byteInstance = new Byte();
        const result = byteInstance.createFromJSONValue(json);
        expect(result).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2700
     * @tc.name builtinsBytePrototypebTest2700
     * @tc.desc test createFromJSONValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2700'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: Byte.MIN_VALUE
        };
        const byteInstance = new Byte();
        const result = byteInstance.createFromJSONValue(json);
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_2800
     * @tc.name builtinsBytePrototypebTest2800
     * @tc.desc test createFromJSONValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest2800'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: Byte.MAX_VALUE
        };
        const byteInstance = new Byte();
        const result = byteInstance.createFromJSONValue(json);
        expect(result).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3000
     * @tc.name builtinsBytePrototypebTest3000
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const byte2 = new Byte(1);
        const result = byte1.div(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3100
     * @tc.name builtinsBytePrototypebTest3100
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const byte2 = new Byte(2);
        const result = byte1.div(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3200
     * @tc.name builtinsBytePrototypebTest3200
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-4);
        const byte2 = new Byte(2);
        const result = byte1.div(byte2);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3300
     * @tc.name builtinsBytePrototypebTest3300
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(4);
        const byte2 = new Byte(-2);
        const result = byte1.div(byte2);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3400
     * @tc.name builtinsBytePrototypebTest3400
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-4);
        const byte2 = new Byte(-2);
        const result = byte1.div(byte2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3500
     * @tc.name builtinsBytePrototypebTest3500
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(1);
        const result = byte1.div(byte2);
        expect(result).assertEqual(Byte.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3600
     * @tc.name builtinsBytePrototypebTest3600
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(1);
        const result = byte1.div(byte2);
        expect(result).assertEqual(Byte.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3700
     * @tc.name builtinsBytePrototypebTest3700
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(2);
        const result = byte1.div(byte2);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3800
     * @tc.name builtinsBytePrototypebTest3800
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(7);
        const byte2 = new Byte(7);
        const result = byte1.div(byte2);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3900
     * @tc.name builtinsBytePrototypebTest3900
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const result = byte1.equals(byte1);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_3901
     * @tc.name builtinsBytePrototypebTest3901
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest3901', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest3901'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(10);
        const byte2 = new Byte(10);
        const result = byte1.equals(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4000
     * @tc.name builtinsBytePrototypebTest4000
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(10);
        const byte2 = new Byte(20);
        const result = byte1.equals(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4100
     * @tc.name builtinsBytePrototypebTest4100
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.equals(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4200
     * @tc.name builtinsBytePrototypebTest4200
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.equals(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4300
     * @tc.name builtinsBytePrototypebTest4300
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const result = byte1.equals(null);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4400
     * @tc.name builtinsBytePrototypebTest4400
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const result = byte1.equals(undefined);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4600
     * @tc.name builtinsBytePrototypebTest4600
     * @tc.desc test div
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(0);
        const byte2 = new Byte(0);
        const result = byte1.equals(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4700
     * @tc.name builtinsBytePrototypebTest4700
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(3);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4800
     * @tc.name builtinsBytePrototypebTest4800
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(5);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_4900
     * @tc.name builtinsBytePrototypebTest4900
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest4900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(3);
        const byte2 = new Byte(5);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5000
     * @tc.name builtinsBytePrototypebTest5000
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-3);
        const byte2 = new Byte(-5);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5100
     * @tc.name builtinsBytePrototypebTest5100
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5200
     * @tc.name builtinsBytePrototypebTest5200
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5300
     * @tc.name builtinsBytePrototypebTest5300
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5400
     * @tc.name builtinsBytePrototypebTest5400
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE - 1 as byte);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5500
     * @tc.name builtinsBytePrototypebTest5500
     * @tc.desc test isGreaterEqualThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE + 1 as byte);
        const result = byte1.isGreaterEqualThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5600
     * @tc.name builtinsBytePrototypebTest5600
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5 as byte);
        const byte2 = new Byte(3 as byte);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5700
     * @tc.name builtinsBytePrototypebTest5700
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5 as byte);
        const byte2 = new Byte(5 as byte);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5800
     * @tc.name builtinsBytePrototypebTest5800
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(3 as byte);
        const byte2 = new Byte(5 as byte);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_5900
     * @tc.name builtinsBytePrototypebTest5900
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest5900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-3);
        const byte2 = new Byte(-5);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6000
     * @tc.name builtinsBytePrototypebTest6000
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6100
     * @tc.name builtinsBytePrototypebTest6100
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6200
     * @tc.name builtinsBytePrototypebTest6200
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(Byte.MAX_VALUE - 1 as byte);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6300
     * @tc.name builtinsBytePrototypebTest6300
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE + 1 as byte);
        const byte2 = new Byte(Byte.MIN_VALUE);
        const result = byte1.isGreaterThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6400
     * @tc.name builtinsBytePrototypebTest6400
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(3 as byte);
        const byte2 = new Byte(5 as byte);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6500
     * @tc.name builtinsBytePrototypebTest6500
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(5);
        const result = byte1.isLessThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6600
     * @tc.name builtinsBytePrototypebTest6600
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(3);
        const result = byte1.isLessThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6700
     * @tc.name builtinsBytePrototypebTest6700
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-5);
        const byte2 = new Byte(-3);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6801
     * @tc.name builtinsBytePrototypebTest6801
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6801'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MIN_VALUE + 1 as byte);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6800
     * @tc.name builtinsBytePrototypebTest6800
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE - 1 as byte);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_6900
     * @tc.name builtinsBytePrototypebTest6900
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest6900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-1 as byte);
        const byte2 = new Byte(0 as byte);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7000
     * @tc.name builtinsBytePrototypebTest7000
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(Byte.MAX_VALUE);
        const result = byte1.isLessThan(byte2);
        expect(result).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7100
     * @tc.name builtinsBytePrototypebTest7100
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-5);
        const byte2 = new Byte(-5);
        const result = byte1.isLessThan(byte2);
        expect(result).assertFalse();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7200
     * @tc.name builtinsBytePrototypebTest7200
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(2);
        const byte2 = new Byte(3);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7300
     * @tc.name builtinsBytePrototypebTest7300
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(0);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_9100
     * @tc.name builtinsBytePrototypebTest9100
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest9100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-2);
        const byte2 = new Byte(-3);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7400
     * @tc.name builtinsBytePrototypebTest7400
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7400'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(4);
        const byte2 = new Byte(-2);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(-8);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7500
     * @tc.name builtinsBytePrototypebTest7500
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7500'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(7);
        const byte2 = new Byte(1);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(7);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7600
     * @tc.name builtinsBytePrototypebTest7600
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7600'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const byte2 = new Byte(1);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(Byte.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7700
     * @tc.name builtinsBytePrototypebTest7700
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const byte2 = new Byte(1);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(Byte.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7800
     * @tc.name builtinsBytePrototypebTest7800
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(64);
        const byte2 = new Byte(2);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_7900
     * @tc.name builtinsBytePrototypebTest7900
     * @tc.desc test isGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest7900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-64);
        const byte2 = new Byte(2);
        const result = byte1.mul(byte2);
        expect(result).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8000
     * @tc.name builtinsBytePrototypebTest8000
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8001
     * @tc.name builtinsBytePrototypebTest8001
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8001'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(0);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8100
     * @tc.name builtinsBytePrototypebTest8100
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8100'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-1);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8200
     * @tc.name builtinsBytePrototypebTest8200
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8200'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(Byte.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8300
     * @tc.name builtinsBytePrototypebTest8300
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8300'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(Byte.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8400
     * @tc.name builtinsBytePrototypebTest8400
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8400'
        console.info(`${caseName}, test start`);
        const testValue = 42;
        const byte1 = new Byte(testValue.toByte());
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8500
     * @tc.name builtinsBytePrototypebTest8500
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8500'
        console.info(`${caseName}, test start`);
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8600
     * @tc.name builtinsBytePrototypebTest8600
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8600'
        console.info(`${caseName}, test start`);
        const testValue = -42;
        const byte1 = new Byte(testValue.toByte());
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(testValue);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8601
     * @tc.name builtinsBytePrototypebTest8601
     * @tc.desc test getHashCodeByValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8601'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(5);
        const byte2 = new Byte(5);
        expect(Runtime.getHashCodeByValue(byte1)).assertEqual(Runtime.getHashCodeByValue(byte2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8700
     * @tc.name builtinsBytePrototypebTest8700
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8700'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(1);
        const result = byte1.toByte();
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8800
     * @tc.name builtinsBytePrototypebTest8800
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8800'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toByte();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_8900
     * @tc.name builtinsBytePrototypebTest8900
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest8900'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte();
        const result = byte1.toByte();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_9000
     * @tc.name builtinsBytePrototypebTest9000
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest9000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(-1);
        const result = byte1.toByte();
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_9001
     * @tc.name builtinsBytePrototypebTest9001
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest9001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest9001'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MAX_VALUE);
        const result = byte1.toByte();
        expect(result).assertEqual(Byte.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_BYTE_PROTOTYPEB_TEST_9002
     * @tc.name builtinsBytePrototypebTest9002
     * @tc.desc test toByte
     * @tc.size MediumTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsBytePrototypebTest9002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'builtinsBytePrototypebTest9000'
        console.info(`${caseName}, test start`);
        const byte1 = new Byte(Byte.MIN_VALUE);
        const result = byte1.toByte();
        expect(result).assertEqual(Byte.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}
