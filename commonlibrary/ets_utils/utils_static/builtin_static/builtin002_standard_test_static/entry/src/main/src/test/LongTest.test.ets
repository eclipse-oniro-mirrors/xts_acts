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
export default function builtinsLongPrototypebTest() {
  describe('builtinsLongPrototypebTest', ():void => {
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
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0100
     * @tc.name builtinsLongPrototypebTest0100
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
       async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest01001'
        console.info(`${caseName}, test start`);
         const a = new Long(100);
         const b = new Long(200);
         const result = a.add(b);
         expect(result).assertEqual(300);
         console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0200
     * @tc.name builtinsLongPrototypebTest0200
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0200'
        console.info(`${caseName}, test start`);
        const a = new Long(-100);
        const b = new Long(-200);
        const result = a.add(b);
        expect(result).assertEqual(-300);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0300
     * @tc.name builtinsLongPrototypebTest0300
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0300'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(-200);
        const result = a.add(b);
        expect(result).assertEqual(-100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0400
     * @tc.name builtinsLongPrototypebTest0400
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0400'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(-200);
        const result = a.add(b);
        expect(result).assertEqual(-100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0500
     * @tc.name builtinsLongPrototypebTest0500
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0500'
        console.info(`${caseName}, test start`);
        const a = new Long(0);
        const b = new Long(200);
        const result = a.add(b);
        expect(result).assertEqual(200);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0600
     * @tc.name builtinsLongPrototypebTest0600
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0600'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(Long.MIN_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0700
     * @tc.name builtinsLongPrototypebTest0700
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0700'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(Long.MIN_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0800
     * @tc.name builtinsLongPrototypebTest0800
     * @tc.desc test Long.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0800'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(Long.MAX_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_0900
     * @tc.name builtinsLongPrototypebTest0900
     * @tc.desc test constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest0900'
        console.info(`${caseName}, test start`);
        const result = new Long();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1000
     * @tc.name builtinsLongPrototypebTest1000
     * @tc.desc test constructor(value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1000'
        console.info(`${caseName}, test start`);
        const result = new Long(12345);
        expect(result).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1100
     * @tc.name builtinsLongPrototypebTest1100
     * @tc.desc test constructor(value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1100'
        console.info(`${caseName}, test start`);
        const result = new Long(12345);
        expect(result).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1200
     * @tc.name builtinsLongPrototypebTest1200
     * @tc.desc test constructor(value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1200'
        console.info(`${caseName}, test start`);
        const result = new Long(Long.MAX_VALUE);
        expect(result).assertEqual(Long.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1300
     * @tc.name builtinsLongPrototypebTest1300
     * @tc.desc test constructor(value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1300'
        console.info(`${caseName}, test start`);
        const result = new Long(Long.MIN_VALUE);
        expect(result).assertEqual(Long.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1400
     * @tc.name builtinsLongPrototypebTest1400
     * @tc.desc test constructor(value: long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1400'
        console.info(`${caseName}, test start`);
        const result = new Long(-12345);
        expect(result).assertEqual(-12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1500
     * @tc.name builtinsLongPrototypebTest1500
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1500'
        console.info(`${caseName}, test start`);
        const longInstance = new Long(0);
        const jsonNumber: JSONNumber = {
          value: 12345
        };
        const result = longInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1700
     * @tc.name builtinsLongPrototypebTest1700
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1700'
        console.info(`${caseName}, test start`);
        try{
          const longInstance = new Long(0);
          const jsonValue: JSONNumber = {
            value: Long.MAX_VALUE + 1
          };
          const result = longInstance.createFromJSONValue(jsonValue);
        }catch(e){
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Long from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1800
     * @tc.name builtinsLongPrototypebTest1800
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1800'
        console.info(`${caseName}, test start`);
        try{
          const longInstance = new Long(0);
          const jsonValue: JSONNumber = {
            value: Long.MIN_VALUE - 1
          };
          const result = longInstance.createFromJSONValue(jsonValue);
        }catch(e){
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Long from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1900
     * @tc.name builtinsLongPrototypebTest1900
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1900'
        console.info(`${caseName}, test start`);
        const longInstance = new Long(0);
        const jsonValue: JSONNumber = {
          value: Long.MIN_VALUE
        };
          const result = longInstance.createFromJSONValue(jsonValue);
          expect(result).assertEqual(Long.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2000
     * @tc.name builtinsLongPrototypebTest2000
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2000'
        console.info(`${caseName}, test start`);
        const longInstance = new Long(0);
        const jsonValue: JSONNumber = {
          value: Long.MAX_VALUE - 1
        };
        const result = longInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(Long.MAX_VALUE );
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2100
     * @tc.name builtinsLongPrototypebTest2100
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2100'
        console.info(`${caseName}, test start`);
        const longInstance = new Long(0);
        const jsonValue: JSONNumber = {
          value: -12345
        };
        const result = longInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(-12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2200
     * @tc.name builtinsLongPrototypebTest2200
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2200'
        console.info(`${caseName}, test start`);
        const longInstance = new Long(0);
        const jsonValue: JSONNumber = {
          value: -12345
        };
        const result = longInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(-12345);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2300
     * @tc.name builtinsLongPrototypebTest2300
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2300'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(20);
        const result = a.div(b);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2400
     * @tc.name builtinsLongPrototypebTest2400
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2400'
        console.info(`${caseName}, test start`);
        const a = new Long(-100);
        const b = new Long(-20);
        const result = a.div(b);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2500
     * @tc.name builtinsLongPrototypebTest2500
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2500'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(-20);
        const result = a.div(b);
        expect(result).assertEqual(-5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2501
     * @tc.name builtinsLongPrototypebTest2501
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2501', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2501'
        console.info(`${caseName}, test start`);
        const a = new Long(-100);
        const b = new Long(20);
        const result = a.div(b);
        expect(result).assertEqual(-5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2502
     * @tc.name builtinsLongPrototypebTest2502
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2502', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2502'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(1);
        const result = a.div(b);
        expect(result).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2503
     * @tc.name builtinsLongPrototypebTest2503
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2503', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2503'
        console.info(`${caseName}, test start`);
        const a = new Long(0);
        const b = new Long(20);
        const result = a.div(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2600
     * @tc.name builtinsLongPrototypebTest2600
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2600'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(2);
        const result = a.div(b);
        expect(result).assertEqual(Long.MAX_VALUE / 2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2700
     * @tc.name builtinsLongPrototypebTest2700
     * @tc.desc test div(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2700'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(2);
        const result = a.div(b);
        expect(result).assertEqual(Long.MIN_VALUE / 2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2800
     * @tc.name builtinsLongPrototypebTest2800
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2800'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(100);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_2900
     * @tc.name builtinsLongPrototypebTest2900
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest2900'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(200);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3000
     * @tc.name builtinsLongPrototypebTest3000
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3000'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const result = a.equals(null);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3100
     * @tc.name builtinsLongPrototypebTest3100
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3100'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const result = a.equals(undefined);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3200
     * @tc.name builtinsLongPrototypebTest3200
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3200'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const result = a.equals(100 as number);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_1600
     * @tc.name builtinsLongPrototypebTest1600
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest1600'
        console.info(`${caseName}, test start`);
        const a = new Long(0);
        const b = new Long(0);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3300
     * @tc.name builtinsLongPrototypebTest3300
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3300'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(Long.MAX_VALUE);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3400
     * @tc.name builtinsLongPrototypebTest3400
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3400'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(Long.MIN_VALUE);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3500
     * @tc.name builtinsLongPrototypebTest3500
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3500'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(100);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3600
     * @tc.name builtinsLongPrototypebTest3600
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3600'
        console.info(`${caseName}, test start`);
        const a = new Long(200);
        const b = new Long(100);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3700
     * @tc.name builtinsLongPrototypebTest3700
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3700'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(200);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3800
     * @tc.name builtinsLongPrototypebTest3800
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3800'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(100);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_3900
     * @tc.name builtinsLongPrototypebTest3900
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest3900'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(100);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4000
     * @tc.name builtinsLongPrototypebTest4000
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4000'
        console.info(`${caseName}, test start`);
        const a = new Long(0);
        const b = new Long(0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4100
     * @tc.name builtinsLongPrototypebTest4100
     * @tc.desc test isGreaterEqualThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4100'
        console.info(`${caseName}, test start`);
        const a = new Long(-100);
        const b = new Long(100);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4200
     * @tc.name builtinsLongPrototypebTest4200
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4200'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4300
     * @tc.name builtinsLongPrototypebTest4300
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4300'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(200);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4400
     * @tc.name builtinsLongPrototypebTest4400
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4400'
        console.info(`${caseName}, test start`);
        const a = new Long(200);
        const b = new Long(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4500
     * @tc.name builtinsLongPrototypebTest4500
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4500'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4600
     * @tc.name builtinsLongPrototypebTest4600
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4600'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4700
     * @tc.name builtinsLongPrototypebTest4700
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4700'
        console.info(`${caseName}, test start`);
        const a = new Long(0);
        const b = new Long(0);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4800
     * @tc.name builtinsLongPrototypebTest4800
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4800'
        console.info(`${caseName}, test start`);
        const a = new Long(-100);
        const b = new Long(100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_4900
     * @tc.name builtinsLongPrototypebTest4900
     * @tc.desc test isLessThan(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest4900'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(-100);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5000
     * @tc.name builtinsLongPrototypebTest5000
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5000'
        console.info(`${caseName}, test start`);
        const a = new Long(5);
        const b = new Long(3);
        const result = a.mul(b);
        expect(result).assertEqual(15);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5100
     * @tc.name builtinsLongPrototypebTest5100
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5100'
        console.info(`${caseName}, test start`);
        const a = new Long(10);
        const b = new Long(-2);
        const result = a.mul(b);
        expect(result).assertEqual(-20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5101
     * @tc.name builtinsLongPrototypebTest5101
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5101'
        console.info(`${caseName}, test start`);
        const a = new Long(-7);
        const b = new Long(-4);
        const result = a.mul(b);
        expect(result).assertEqual(28);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5200
     * @tc.name builtinsLongPrototypebTest5200
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5200'
        console.info(`${caseName}, test start`);
        const a = new Long(123456789);
        const b = new Long(0);
        const result = a.mul(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5300
     * @tc.name builtinsLongPrototypebTest5300
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5300'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(1);
        const result = a.mul(b);
        expect(result).assertEqual(Long.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5400
     * @tc.name builtinsLongPrototypebTest5400
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5400'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MIN_VALUE);
        const b = new Long(1);
        const result = a.mul(b);
        expect(result).assertEqual(Long.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5500
     * @tc.name builtinsLongPrototypebTest5500
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5500'
        console.info(`${caseName}, test start`);
        const a = new Long(123456789);
        const b = new Long(987654321);
        const result = a.mul(b);
        expect(result).assertEqual(121932631112635269);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5600
     * @tc.name builtinsLongPrototypebTest5600
     * @tc.desc test mul(other: Long) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5600'
        console.info(`${caseName}, test start`);
        const a = new Long(Long.MAX_VALUE);
        const b = new Long(2);
        const result = a.mul(b);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5700
     * @tc.name builtinsLongPrototypebTest5700
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5700'
        console.info(`${caseName}, test start`);
        const zero = new Long(0);
        expect(Runtime.getHashCodeByValue(zero)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5800
     * @tc.name builtinsLongPrototypebTest5800
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5800'
        console.info(`${caseName}, test start`);
        const num = new Long(42);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_5900
     * @tc.name builtinsLongPrototypebTest5900
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest5900'
        console.info(`${caseName}, test start`);
        const num = new Long(-42);
        expect(Runtime.getHashCodeByValue(num)).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6000
     * @tc.name builtinsLongPrototypebTest6000
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6000'
        console.info(`${caseName}, test start`);
        const max = new Long(Long.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(max)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    
    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6200
     * @tc.name builtinsLongPrototypebTest6200
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6200'
        console.info(`${caseName}, test start`);
        const bigNum = new Long(0x123456789ABC);
        expect(Runtime.getHashCodeByValue(bigNum)).assertEqual(1450744508);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6300
     * @tc.name builtinsLongPrototypebTest6300
     * @tc.desc test getHashCodeByValue(): int return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6300'
        console.info(`${caseName}, test start`);
        const num1 = new Long(12345);
        const num2 = new Long(12345);
        expect(Runtime.getHashCodeByValue(num1)).assertEqual(Runtime.getHashCodeByValue(num2));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6400
     * @tc.name builtinsLongPrototypebTest6400
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6400'
        console.info(`${caseName}, test start`);
        const zero = new Long(0);
        expect(zero.toByte()).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6500
     * @tc.name builtinsLongPrototypebTest6500
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6500'
        console.info(`${caseName}, test start`);
        const num = new Long(42);
        expect(num.toByte()).assertEqual(42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6600
     * @tc.name builtinsLongPrototypebTest6600
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6600'
        console.info(`${caseName}, test start`);
        const num = new Long(-42);
        expect(num.toByte()).assertEqual(-42);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6700
     * @tc.name builtinsLongPrototypebTest6700
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6700'
        console.info(`${caseName}, test start`);
        const maxByte = new Long(127);
        expect(maxByte.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6800
     * @tc.name builtinsLongPrototypebTest6800
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6800'
        console.info(`${caseName}, test start`);
        const minByte = new Long(-128);
        expect(minByte.toByte()).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_6900
     * @tc.name builtinsLongPrototypebTest6900
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest6900'
        console.info(`${caseName}, test start`);
        const largeNum = new Long(0x123); 
        expect(largeNum.toByte()).assertEqual(0x23);
        const negativeLarge = new Long(-0x123); 
        expect(negativeLarge.toByte()).assertEqual(-0x23);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7000
     * @tc.name builtinsLongPrototypebTest7000
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7000'
        console.info(`${caseName}, test start`);
        const hugeNum = new Long(0x12345678); 
        expect(hugeNum.toByte()).assertEqual(0x78);
        const hugeNegative = new Long(-0x12345678); 
        expect(hugeNegative.toByte()).assertEqual(-0x78);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7100
     * @tc.name builtinsLongPrototypebTest7100
     * @tc.desc toByte(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7100'
        console.info(`${caseName}, test start`);
        const overflow = new Long(256); 
        expect(overflow.toByte()).assertEqual(0);
        const underflow = new Long(-129); 
        expect(underflow.toByte()).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7200
     * @tc.name builtinsLongPrototypebTest7200
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7200'
        console.info(`${caseName}, test start`);
        const a = new Long(100);
        const b = new Long(100);
        expect(a.compareTo(b)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7300
     * @tc.name builtinsLongPrototypebTest7300
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7300'
        console.info(`${caseName}, test start`);
        const larger = new Long(150);
        const smaller = new Long(100);
        let result = smaller.compareTo(larger);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7400
     * @tc.name builtinsLongPrototypebTest7400
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7400'
        console.info(`${caseName}, test start`);
        const smaller = new Long(50);
        const larger = new Long(100);
        let result = smaller.compareTo(larger);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7500
     * @tc.name builtinsLongPrototypebTest7500
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7500'
        console.info(`${caseName}, test start`);
        const negSmall = new Long(-100);
        const negLarge = new Long(-50);
        let result1 = negSmall.compareTo(negLarge);
        let result2 = negLarge.compareTo(negSmall);
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7600
     * @tc.name builtinsLongPrototypebTest7600
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7600'
        console.info(`${caseName}, test start`);
        const negative = new Long(-50);
        const positive = new Long(50);
        let result1 = negative.compareTo(positive);
        let result2 = positive.compareTo(negative);
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7700
     * @tc.name builtinsLongPrototypebTest7700
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7700'
        console.info(`${caseName}, test start`);
        const zero = new Long(0);
        const positive = new Long(1);
        let result1 = zero.compareTo(positive);
        let result2 = positive.compareTo(zero);
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7800
     * @tc.name builtinsLongPrototypebTest7800
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7800'
        console.info(`${caseName}, test start`);
        const big1 = new Long(123456789);
        const big2 = new Long(987654321);
        let result = big1.compareTo(big2);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_7900
     * @tc.name builtinsLongPrototypebTest7900
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest7900'
        console.info(`${caseName}, test start`);
        const max1 = new Long(Long.MAX_VALUE);
        const max2 = new Long(Long.MAX_VALUE);
        let result = max1.compareTo(max2);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8000
     * @tc.name builtinsLongPrototypebTest8000
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8000'
        console.info(`${caseName}, test start`);
        const zero = new Long(0);
        const result = zero.toDouble();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8100
     * @tc.name builtinsLongPrototypebTest8100
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8100'
        console.info(`${caseName}, test start`);
        const num = new Long(42);
        const result = num.toDouble();
        expect(result).assertEqual(42.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8200
     * @tc.name builtinsLongPrototypebTest8200
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8200'
        console.info(`${caseName}, test start`);
        const num = new Long(-123);
        const result = num.toDouble();
        expect(result).assertEqual(-123.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8300
     * @tc.name builtinsLongPrototypebTest8300
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8300'
        console.info(`${caseName}, test start`);
        const bigNum = new Long(123456789012);
        const result = bigNum.toDouble();
        expect(result).assertEqual(123456789012.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8400
     * @tc.name builtinsLongPrototypebTest8400
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8400'
        console.info(`${caseName}, test start`);
        const max = new Long(Long.MAX_VALUE);
        const result = max.toDouble();
        expect(result).assertEqual(9223372036854775807.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8500
     * @tc.name builtinsLongPrototypebTest8500
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8500'
        console.info(`${caseName}, test start`);
        const min = new Long(Long.MIN_VALUE);
        const result = min.toDouble();
        expect(result).assertEqual(-9223372036854775808.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8600
     * @tc.name builtinsLongPrototypebTest8600
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8600'
        console.info(`${caseName}, test start`);
        const nearLimit = new Long(9007199254740991); 
        const result = nearLimit.toDouble();
        expect(result).assertEqual(9007199254740991.0);
        console.info(`${caseName}, test end`);
        Done();
      })
    
    /**
     * @tc.number SUB_BUILTINS_LONG_PROTOTYPEB_TEST_8700
     * @tc.name builtinsLongPrototypebTest8700
     * @tc.desc compareTo(): byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsLongPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'BuiltinsLongPrototypebTest8700'
        const hugeNum = new Long(9007199254740993);
        const result = hugeNum.toDouble();
        expect(result).assertEqual(9007199254740992.0);
        console.info(`${caseName}, test end`);
        Done();
      })
    
  })
}
