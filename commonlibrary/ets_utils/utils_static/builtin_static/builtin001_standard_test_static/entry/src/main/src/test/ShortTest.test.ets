/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsShortPrototypebTest() {
  describe('builtinsShortPrototypebTest', (): void => {
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
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0100
     * @tc.name builtinsShortPrototypebTest0100
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0100'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(200);
        const result = a.add(b);
        expect(result).assertEqual(300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0200
     * @tc.name builtinsShortPrototypebTest0200
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0200'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(-50);
        const result = a.add(b);
        expect(result).assertEqual(-150);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0300
     * @tc.name builtinsShortPrototypebTest0300
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0300'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(200);
        const result = a.add(b);
        expect(result).assertEqual(300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0400
     * @tc.name builtinsShortPrototypebTest0400
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0400'
        console.info(`${caseName}, test start`);
        const a = new Short(200);
        const b = new Short(-50);
        const result = a.add(b);
        expect(result).assertEqual(150);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0500
     * @tc.name builtinsShortPrototypebTest0500
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0500'
        console.info(`${caseName}, test start`);
        const a: short = new Short(Short.MAX_VALUE - 100 as short);
        const b = new Short(100);
        const result = a.add(b);
        expect(result).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0600
     * @tc.name builtinsShortPrototypebTest0600
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0600'
        console.info(`${caseName}, test start`);
        const a: short = new Short(Short.MIN_VALUE - 100 as short);
        const b = new Short(100);
        const result = a.add(b);
        expect(result).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0700
     * @tc.name builtinsShortPrototypebTest0700
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0700'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(1);
        const result = a.add(b);
        expect(result).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0800
     * @tc.name builtinsShortPrototypebTest0800
     * @tc.desc test public add(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0800'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(-1);
        const result = a.add(b);
        expect(result).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_0900
     * @tc.name builtinsShortPrototypebTest0900
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest0900'
        console.info(`${caseName}, test start`);
        const defaultShort = new Short();
        const otherShort = new Short(100);
        const result = defaultShort.add(otherShort);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1000
     * @tc.name builtinsShortPrototypebTest1000
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1000'
        console.info(`${caseName}, test start`);
        const a = new Short();
        expect(a).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1100
     * @tc.name builtinsShortPrototypebTest1100
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1100'
        console.info(`${caseName}, test start`);
        const a = new Short();
        expect(a.toString()).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1200
     * @tc.name builtinsShortPrototypebTest1200
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1200'
        console.info(`${caseName}, test start`);
        const a = new Short();
        const b = new Short();
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1300
     * @tc.name builtinsShortPrototypebTest1300
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1300'
        console.info(`${caseName}, test start`);
        const a = new Short();
        const b = new Short(0);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1400
     * @tc.name builtinsShortPrototypebTest1400
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1400'
        console.info(`${caseName}, test start`);
        const a = new Short();
        const b = new Short();
        const result = a.compareTo(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1500
     * @tc.name builtinsShortPrototypebTest1500
     * @tc.desc test public constructor()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1500'
        console.info(`${caseName}, test start`);
        const a = new Short();
        expect(Runtime.getHashCodeByValue(a)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1600
     * @tc.name builtinsShortPrototypebTest1600
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1600'
        console.info(`${caseName}, test start`);
        const value = 12345;
        const shortObj = new Short(value.toShort());
        const result = shortObj;
        expect(result).assertEqual(value);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1700
     * @tc.name builtinsShortPrototypebTest1700
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1700'
        console.info(`${caseName}, test start`);
        const value = -12345;
        const shortObj = new Short(value.toShort());
        const result = shortObj;
        expect(result).assertEqual(value);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1800
     * @tc.name builtinsShortPrototypebTest1800
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1800'
        console.info(`${caseName}, test start`);
        const value = Short.MIN_VALUE;
        const shortObj = new Short(value);
        const result = shortObj;
        expect(result).assertEqual(value);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_1900
     * @tc.name builtinsShortPrototypebTest1900
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest1900'
        console.info(`${caseName}, test start`);
        const value = Short.MAX_VALUE;
        const shortObj = new Short(value);
        const result = shortObj;
        expect(result).assertEqual(value);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2000
     * @tc.name builtinsShortPrototypebTest2000
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2000'
        console.info(`${caseName}, test start`);
        const value = 100;
        const shortObj = new Short(value.toShort());
        const result = shortObj.add(new Short(50));
        expect(result).assertEqual(150);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2100
     * @tc.name builtinsShortPrototypebTest2100
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2100'
        console.info(`${caseName}, test start`);
        const value = 200;
        const short1 = new Short(value.toShort());
        const short2 = new Short(value.toShort());
        const result = short1.equals(short2);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2200
     * @tc.name builtinsShortPrototypebTest2200
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2200'
        console.info(`${caseName}, test start`);
        const short1 = new Short(100);
        const short2 = new Short(200);
        const res = (short1.compareTo(short2)) < 0;
        expect(res).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2300
     * @tc.name builtinsShortPrototypebTest2300
     * @tc.desc test public constructor(value: short)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2300'
        console.info(`${caseName}, test start`);
        const value = 12345;
        const shortObj = new Short(value.toShort());
        expect(shortObj.toByte()).assertEqual(value & 0xFF);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2400
     * @tc.name builtinsShortPrototypebTest2400
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2400'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: 12345
        };
        const shortObj = new Short().createFromJSONValue(json);
        expect(shortObj).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2500
     * @tc.name builtinsShortPrototypebTest2500
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2500'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: Short.MIN_VALUE
        };
        const shortObj = new Short().createFromJSONValue(json);
        expect(shortObj).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2600
     * @tc.name builtinsShortPrototypebTest2600
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2600'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: Short.MAX_VALUE
        };
        const shortObj = new Short().createFromJSONValue(json);
        expect(shortObj).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2700
     * @tc.name builtinsShortPrototypebTest2700
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2700'
        console.info(`${caseName}, test start`);
        const json: JSONNumber = {
          value: 0
        };
        const shortObj = new Short().createFromJSONValue(json);
        expect(shortObj).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2800
     * @tc.name builtinsShortPrototypebTest2800
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2800'
        console.info(`${caseName}, test start`);
        try {
          const shortInstance = new Short();
          const jsonValue: JSONNumber = {
            value: Short.MAX_VALUE + 1
          };
          const result = shortInstance.createFromJSONValue(jsonValue);
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Short from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_2900
     * @tc.name builtinsShortPrototypebTest2900
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest2900'
        console.info(`${caseName}, test start`);
        try {
          const shortInstance = new Short();
          const jsonValue: JSONNumber = {
            value: Short.MIN_VALUE - 1
          };
          const result = shortInstance.createFromJSONValue(jsonValue);
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Short from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3000
     * @tc.name builtinsShortPrototypebTest3000
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3000'
        console.info(`${caseName}, test start`);
        try {
          const shortInstance = new Short();
          const jsonValue: JSONNumber = {
            value: 12.34
          };
          const result = shortInstance.createFromJSONValue(jsonValue);
        } catch (e) {
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Short from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3100
     * @tc.name builtinsShortPrototypebTest3100
     * @tc.desc test public createFromJSONValue(json: JSONValue): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3100'
        console.info(`${caseName}, test start`);


        const shortInstance = new Short();
        const jsonValue: JSONNumber = {
          value: -12345
        };
        const result = shortInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(-12345);

        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3200
     * @tc.name builtinsShortPrototypebTest3200
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3200'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(20);
        const result = a.div(b);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3300
     * @tc.name builtinsShortPrototypebTest3300
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3300'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(20);
        const result = a.div(b);
        expect(result).assertEqual(-5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3400
     * @tc.name builtinsShortPrototypebTest3400
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3400'
        console.info(`${caseName}, test start`);
        const a = new Short(10);
        const b = new Short(20);
        const result = a.div(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3500
     * @tc.name builtinsShortPrototypebTest3500
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3500'
        console.info(`${caseName}, test start`);
        const a = new Short(12345);
        const b = new Short(1);
        const result = a.div(b);
        expect(result).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3600
     * @tc.name builtinsShortPrototypebTest3600
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3600'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(2);
        const result = a.div(b);
        expect(result).assertEqual(16383);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3700
     * @tc.name builtinsShortPrototypebTest3700
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3700'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(2);
        const result = a.div(b);
        expect(result).assertEqual(-16384);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3800
     * @tc.name builtinsShortPrototypebTest3800
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3800'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(20);
        const result = a.div(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_3900
     * @tc.name builtinsShortPrototypebTest3900
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest3900'
        console.info(`${caseName}, test start`);
        const a = new Short(10);
        const b = new Short(3);
        const result = a.div(b);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4000
     * @tc.name builtinsShortPrototypebTest4000
     * @tc.desc test public div(other: Short): Short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4000'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(-20);
        const result = a.div(b);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4100
     * @tc.name builtinsShortPrototypebTest4100
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4100'
        console.info(`${caseName}, test start`);
        const shortObj = new Short(100);
        expect(shortObj.equals(shortObj)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4200
     * @tc.name builtinsShortPrototypebTest4200
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4200'
        console.info(`${caseName}, test start`);
        const short1 = new Short(100);
        const short2 = new Short(100);
        expect(short1.equals(short2)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4300
     * @tc.name builtinsShortPrototypebTest4300
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4300'
        console.info(`${caseName}, test start`);
        const short1 = new Short(100);
        const short2 = new Short(200);
        expect(short1.equals(short2)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4400
     * @tc.name builtinsShortPrototypebTest4400
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4400'
        console.info(`${caseName}, test start`);
        const shortObj = new Short(100);
        expect(shortObj.equals(null)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4500
     * @tc.name builtinsShortPrototypebTest4500
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4500'
        console.info(`${caseName}, test start`);
        const shortObj = new Short(100);
        expect(shortObj.equals(undefined)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4600
     * @tc.name builtinsShortPrototypebTest4600
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4600'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4700
     * @tc.name builtinsShortPrototypebTest4700
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4700'
        console.info(`${caseName}, test start`);
        const max1 = new Short(Short.MAX_VALUE);
        const max2 = new Short(Short.MAX_VALUE);
        const min1 = new Short(Short.MIN_VALUE);
        const min2 = new Short(Short.MIN_VALUE);

        expect(max1.equals(max2)).assertEqual(true);
        expect(min1.equals(min2)).assertEqual(true);
        expect(max1.equals(min1)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4800
     * @tc.name builtinsShortPrototypebTest4800
     * @tc.desc test public equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4800'
        console.info(`${caseName}, test start`);
        const zero1 = new Short(0);
        const zero2 = new Short();
        const nonZero = new Short(1);

        expect(zero1.equals(zero2)).assertEqual(true);
        expect(zero1.equals(nonZero)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_4900
     * @tc.name builtinsShortPrototypebTest4900
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest4900'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(50);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5000
     * @tc.name builtinsShortPrototypebTest5000
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5000'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5100
     * @tc.name builtinsShortPrototypebTest5100
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5100'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(100);
        expect(a.isGreaterEqualThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5200
     * @tc.name builtinsShortPrototypebTest5200
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5200'
        console.info(`${caseName}, test start`);
        const a = new Short(-50);
        const b = new Short(-100);
        expect(a.isGreaterEqualThan(b)).assertEqual(true);
        expect(b.isGreaterEqualThan(a)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5300
     * @tc.name builtinsShortPrototypebTest5300
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5300'
        console.info(`${caseName}, test start`);
        const max = new Short(Short.MAX_VALUE);
        const normal = new Short(100);
        expect(max.isGreaterEqualThan(normal)).assertEqual(true);
        expect(normal.isGreaterEqualThan(max)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5400
     * @tc.name builtinsShortPrototypebTest5400
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5400'
        console.info(`${caseName}, test start`);
        const min = new Short(Short.MIN_VALUE);
        const normal = new Short(-100);
        expect(normal.isGreaterEqualThan(min)).assertEqual(true);
        expect(min.isGreaterEqualThan(normal)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5500
     * @tc.name builtinsShortPrototypebTest5500
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5500'
        console.info(`${caseName}, test start`);
        const positive = new Short(100);
        const negative = new Short(-100);
        const zero = new Short(0);

        expect(positive.isGreaterEqualThan(zero)).assertEqual(true);
        expect(zero.isGreaterEqualThan(negative)).assertEqual(true);
        expect(zero.isGreaterEqualThan(zero)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5600
     * @tc.name builtinsShortPrototypebTest5600
     * @tc.desc test public isGreaterEqualThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5600'
        console.info(`${caseName}, test start`);
        const max = new Short(Short.MAX_VALUE);
        const min = new Short(Short.MIN_VALUE);
        const almostMax: short = new Short(Short.MAX_VALUE - 1 as short);
        const almostMin: short = new Short(Short.MIN_VALUE + 1 as short);

        expect(max.isGreaterEqualThan(almostMax)).assertEqual(true);
        expect(almostMin.isGreaterEqualThan(min)).assertEqual(true);
        expect(max.isGreaterEqualThan(min)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5700
     * @tc.name builtinsShortPrototypebTest5700
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5700'
        console.info(`${caseName}, test start`);
        const larger = new Short(150);
        const smaller = new Short(100);
        expect(larger.isGreaterThan(smaller)).assertEqual(true);
        expect(smaller.isGreaterThan(larger)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5800
     * @tc.name builtinsShortPrototypebTest5800
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5800'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        expect(a.isGreaterThan(b)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_5900
     * @tc.name builtinsShortPrototypebTest5900
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest5900'
        console.info(`${caseName}, test start`);
        const higherNeg = new Short(-50);
        const lowerNeg = new Short(-100);
        expect(higherNeg.isGreaterThan(lowerNeg)).assertEqual(true);
        expect(lowerNeg.isGreaterThan(higherNeg)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6000
     * @tc.name builtinsShortPrototypebTest6000
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest6000'
        console.info(`${caseName}, test start`);
        const max = new Short(Short.MAX_VALUE);
        const belowMax: short = new Short(Short.MAX_VALUE - 1 as short);
        expect(max.isGreaterThan(belowMax)).assertEqual(true);
        expect(belowMax.isGreaterThan(max)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6100
     * @tc.name builtinsShortPrototypebTest6100
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest6100'
        console.info(`${caseName}, test start`);
        const min = new Short(Short.MIN_VALUE);
        const aboveMin: short = new Short(Short.MIN_VALUE + 1 as short);
        expect(aboveMin.isGreaterThan(min)).assertEqual(true);
        expect(min.isGreaterThan(aboveMin)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6200
     * @tc.name builtinsShortPrototypebTest6200
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest6200'
        console.info(`${caseName}, test start`);
        const positive = new Short(1);
        const negative = new Short(-1);
        const zero = new Short(0);

        expect(positive.isGreaterThan(zero)).assertEqual(true);
        expect(zero.isGreaterThan(negative)).assertEqual(true);
        expect(zero.isGreaterThan(zero)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6300
     * @tc.name builtinsShortPrototypebTest6300
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest6300'
        console.info(`${caseName}, test start`);
        const positive = new Short(1);
        const negative = new Short(-1);
        expect(positive.isGreaterThan(negative)).assertEqual(true);
        expect(negative.isGreaterThan(positive)).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6400
     * @tc.name builtinsShortPrototypebTest6400
     * @tc.desc test public isGreaterThan(other: Short): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsShortPrototypebTest6400'
        console.info(`${caseName}, test start`);
        const max = new Short(Short.MAX_VALUE);
        const min = new Short(Short.MIN_VALUE);
        const one = new Short(1);
        const negOne = new Short(-1);

        expect(max.isGreaterThan(one)).assertEqual(true);
        expect(one.isGreaterThan(negOne)).assertEqual(true);
        expect(negOne.isGreaterThan(min)).assertEqual(true);
        expect(max.isGreaterThan(min)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6500
     * @tc.name builtinsShortPrototypebTest6500
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest6500'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6600
     * @tc.name builtinsShortPrototypebTest6600
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest6600'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6700
     * @tc.name builtinsShortPrototypebTest6700
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest6700'
        console.info(`${caseName}, test start`);
        const a = new Short(200);
        const b = new Short(100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6800
     * @tc.name builtinsShortPrototypebTest6800
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest6800'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_6900
     * @tc.name builtinsShortPrototypebTest6900
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest6900'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(-100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7000
     * @tc.name builtinsShortPrototypebTest7000
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7000'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7100
     * @tc.name builtinsShortPrototypebTest7100
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7100'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(50);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7200
     * @tc.name builtinsShortPrototypebTest7200
     * @tc.desc test isLessEqualThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7200'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(-100);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7300
     * @tc.name builtinsShortPrototypebTest7300
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7300'
        console.info(`${caseName}, test start`);
        const a = new Short(100);
        const b = new Short(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7400
     * @tc.name builtinsShortPrototypebTest7400
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7400'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7500
     * @tc.name builtinsShortPrototypebTest7500
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7500'
        console.info(`${caseName}, test start`);
        const a = new Short(200);
        const b = new Short(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7600
     * @tc.name builtinsShortPrototypebTest7600
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7600'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7700
     * @tc.name builtinsShortPrototypebTest7700
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7700'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(-100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7800
     * @tc.name builtinsShortPrototypebTest7800
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7800'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_7900
     * @tc.name builtinsShortPrototypebTest7900
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest7900'
        console.info(`${caseName}, test start`);
        const a = new Short(-100);
        const b = new Short(50);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8000
     * @tc.name builtinsShortPrototypebTest8000
     * @tc.desc test isLessThan(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8000'
        console.info(`${caseName}, test start`);
        const a = new Short(50);
        const b = new Short(-100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8100
     * @tc.name builtinsShortPrototypebTest8100
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8100'
        console.info(`${caseName}, test start`);
        const a = new Short(2);
        const b = new Short(3);
        const result = a.mul(b);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8200
     * @tc.name builtinsShortPrototypebTest8200
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8200'
        console.info(`${caseName}, test start`);
        const a = new Short(-2);
        const b = new Short(3);
        const result = a.mul(b);
        expect(result).assertEqual(-6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8300
     * @tc.name builtinsShortPrototypebTest8300
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8300'
        console.info(`${caseName}, test start`);
        const a = new Short(-2);
        const b = new Short(-3);
        const result = a.mul(b);
        expect(result).assertEqual(6);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8400
     * @tc.name builtinsShortPrototypebTest8400
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8400'
        console.info(`${caseName}, test start`);
        const a = new Short(0);
        const b = new Short(123);
        const result = a.mul(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8500
     * @tc.name builtinsShortPrototypebTest8500
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8500'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MAX_VALUE);
        const b = new Short(1);
        const result = a.mul(b);
        expect(result).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8600
     * @tc.name builtinsShortPrototypebTest8600
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8600'
        console.info(`${caseName}, test start`);
        const a = new Short(Short.MIN_VALUE);
        const b = new Short(1);
        const result = a.mul(b);
        expect(result).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8700
     * @tc.name builtinsShortPrototypebTest8700
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8700'
        console.info(`${caseName}, test start`);
        const a = new Short(123);
        const b = new Short(-1);
        const result = a.mul(b);
        expect(result).assertEqual(-123);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8800
     * @tc.name builtinsShortPrototypebTest8800
     * @tc.desc test mul(other: Short) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8800'
        console.info(`${caseName}, test start`);
        const a = new Short(-123);
        const b = new Short(0);
        const result = a.mul(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_8900
     * @tc.name builtinsShortPrototypebTest8900
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest8900'
        console.info(`${caseName}, test start`);
        const num = new Short(0);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9000
     * @tc.name builtinsShortPrototypebTest9000
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9000'
        console.info(`${caseName}, test start`);
        const num = new Short(42);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9100
     * @tc.name builtinsShortPrototypebTest9100
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9100'
        console.info(`${caseName}, test start`);
        const num = new Short(-42);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9200
     * @tc.name builtinsShortPrototypebTest9200
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9200'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MAX_VALUE);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(Short.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9300
     * @tc.name builtinsShortPrototypebTest9300
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9300'
        console.info(`${caseName}, test start`);
        const num = new Short(Short.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(Short.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9400
     * @tc.name builtinsShortPrototypebTest9400
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9400'
        console.info(`${caseName}, test start`);
        const num1 = new Short(12345);
        const num2 = new Short(12345);
        expect(Runtime.getHashCodeByValue(num1)).assertEqual(Runtime.getHashCodeByValue(num2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9500
     * @tc.name builtinsShortPrototypebTest9500
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9500'
        console.info(`${caseName}, test start`);
        const num1 = new Short(0);
        const num2 = new Short(0);
        expect(Runtime.getHashCodeByValue(num1)).assertEqual(Runtime.getHashCodeByValue(num2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_SHORT_PROTOTYPEB_TEST_9600
     * @tc.name builtinsShortPrototypebTest9600
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsShortPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'BuiltinsShortPrototypebTest9600'
        console.info(`${caseName}, test start`);
        const num1 = new Short(-12345);
        const num2 = new Short(-12345);
        expect(Runtime.getHashCodeByValue(num1)).assertEqual(Runtime.getHashCodeByValue(num2));
        console.info(`${caseName}, test end`);
        Done();
      })



  })
}
