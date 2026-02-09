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

export default function IntTest() {
  describe('IntTest', ():void => {
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
     * @tc.number INT_TEST_0100
     * @tc.name IntTest0100
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0100'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(2);
        const result = a.add(b);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number INT_TEST_0200
     * @tc.name IntTest0200
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0200'
        console.info(`${caseName}, test start`);
        const a = new Int(-1);
        const b = new Int(-2);
        const result = a.add(b);
        expect(result).assertEqual(-3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number INT_TEST_0300
     * @tc.name IntTest0300
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0300'
        console.info(`${caseName}, test start`);
        const a = new Int(-1);
        const b = new Int(2);
        const result = a.add(b);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0400
     * @tc.name IntTest0400
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0400'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(-2);
        const result = a.add(b);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0500
     * @tc.name IntTest0500
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0500'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0600
     * @tc.name IntTest0600
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0600'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const b = new Int(2);
        const result = a.add(b);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0700
     * @tc.name IntTest0700
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0700'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0800
     * @tc.name IntTest0800
     * @tc.desc test Int.add() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0800'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.add(b);
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_0900
     * @tc.name IntTest0900
     * @tc.desc test constructor() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest0900'
        console.info(`${caseName}, test start`);
        const result = new Int();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1000
     * @tc.name IntTest1000
     * @tc.desc test constructor(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1000'
        console.info(`${caseName}, test start`);
        const result = new Int(10);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number INT_TEST_1100
     * @tc.name IntTest1100
     * @tc.desc test constructor(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1100'
        console.info(`${caseName}, test start`);
        const result = new Int(Int.MAX_VALUE);
        expect(result).assertEqual(Int.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1200
     * @tc.name IntTest1200
     * @tc.desc test constructor(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1200'
        console.info(`${caseName}, test start`);
        const result = new Int(Int.MIN_VALUE);
        expect(result).assertEqual(Int.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1300
     * @tc.name IntTest1300
     * @tc.desc test constructor(value: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1300'
        console.info(`${caseName}, test start`);
        const result = new Int(-10);
        expect(result).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1400
     * @tc.name IntTest1400
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1400'
        console.info(`${caseName}, test start`);
        const intInstance = new Int(0);
        const jsonNumber: JSONNumber = {
          value: 10
        };
        const result = intInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1500
     * @tc.name IntTest1500
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1500'
        console.info(`${caseName}, test start`);
        try{
          const intInstance = new Int(0);
          const jsonValue: JSONNumber = {
            value: Int.MAX_VALUE + 1
          };
          const result = intInstance.createFromJSONValue(jsonValue);
        }catch(e){
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Int from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1600
     * @tc.name IntTest1600
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1600'
        console.info(`${caseName}, test start`);
        try{
          const intInstance = new Int(0);
          const jsonValue: JSONNumber = {
            value: Int.MIN_VALUE - 1
          };
          const result = intInstance.createFromJSONValue(jsonValue);
        }catch(e){
          e = e as Error;
          expect(e.message).assertEqual('Cannot create Int from JSON');
        }
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1700
     * @tc.name IntTest1700
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1700'
        console.info(`${caseName}, test start`);
        const intInstance = new Int(0);
        const jsonValue: JSONNumber = {
          value: Int.MIN_VALUE
        };
        const result = intInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(Int.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1800
     * @tc.name IntTest1800
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1800'
        console.info(`${caseName}, test start`);
        const intInstance = new Int(0);
        const jsonValue: JSONNumber = {
          value: Int.MAX_VALUE
        };
        const result = intInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(Int.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_1900
     * @tc.name IntTest1900
     * @tc.desc test createFromJSONValue(json: JSONValue) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest1900'
        console.info(`${caseName}, test start`);
        const intInstance = new Int(0);
        const jsonValue: JSONNumber = {
          value: -10
        };
        const result = intInstance.createFromJSONValue(jsonValue);
        expect(result).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2000
     * @tc.name IntTest2000
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2000'
        console.info(`${caseName}, test start`);
        const a = new Int(8);
        const b = new Int(2);
        const result = a.div(b);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2100
     * @tc.name IntTest2100
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2100'
        console.info(`${caseName}, test start`);
        const a = new Int(8);
        const b = new Int(-2);
        const result = a.div(b);
        expect(result).assertEqual(-4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2200
     * @tc.name IntTest2200
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2200'
        console.info(`${caseName}, test start`);
        const a = new Int(-8);
        const b = new Int(-2);
        const result = a.div(b);
        expect(result).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2300
     * @tc.name IntTest2300
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2300'
        console.info(`${caseName}, test start`);
        const a = new Int(-8);
        const b = new Int(2);
        const result = a.div(b);
        expect(result).assertEqual(-4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2400
     * @tc.name IntTest2400
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2400'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const b = new Int(2);
        const result = a.div(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2500
     * @tc.name IntTest2500
     * @tc.desc test div(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2500'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(4);
        const result = a.div(b);
        expect(result).assertEqual(Int.MAX_VALUE / 4);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2600
     * @tc.name IntTest2600
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2600'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(2);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2700
     * @tc.name IntTest2700
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2700'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(6);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2800
     * @tc.name IntTest2800
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2800'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_2900
     * @tc.name IntTest2900
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest2900'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3000
     * @tc.name IntTest3000
     * @tc.desc test equals(other: Any) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3000'
        console.info(`${caseName}, test start`);
        const a = new Int(6);
        const result = a.equals(null);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3100
     * @tc.name IntTest3100
     * @tc.desc test isGreaterEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3100'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(1);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3200
     * @tc.name IntTest3200
     * @tc.desc test isGreaterEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3200'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(1);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3300
     * @tc.name IntTest3300
     * @tc.desc test isGreaterEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3300'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(2);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3400
     * @tc.name IntTest3400
     * @tc.desc test isGreaterEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3400'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE-1);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3500
     * @tc.name IntTest3500
     * @tc.desc test isGreaterEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3500'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE+1);
        const b = new Int(Int.MIN_VALUE);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3600
     * @tc.name IntTest3600
     * @tc.desc test isGreaterThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3600'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(1);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3700
     * @tc.name IntTest3700
     * @tc.desc test isGreaterThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3700'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(1);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3800
     * @tc.name IntTest3800
     * @tc.desc test isGreaterThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3800'
        console.info(`${caseName}, test start`);
        const a = new Int(-1);
        const b = new Int(-2);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_3900
     * @tc.name IntTest3900
     * @tc.desc test isGreaterThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest3900'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE-1);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4000
     * @tc.name IntTest4000
     * @tc.desc test isGreaterThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4000'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE+1);
        const b = new Int(Int.MIN_VALUE);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4100
     * @tc.name IntTest4100
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4100'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE+1);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4200
     * @tc.name IntTest4200
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4200'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4300
     * @tc.name IntTest4300
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4300'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(2);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4400
     * @tc.name IntTest4400
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4400'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(2);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4500
     * @tc.name IntTest4500
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4500'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const b = new Int(2);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4600
     * @tc.name IntTest4600
     * @tc.desc test isLessEqualThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4600'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4700
     * @tc.name IntTest4700
     * @tc.desc test isLessThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4700'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4800
     * @tc.name IntTest4800
     * @tc.desc test isLessThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4800'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_4900
     * @tc.name IntTest4900
     * @tc.desc test isLessThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest4900'
        console.info(`${caseName}, test start`);
        const a = new Int(1);
        const b = new Int(2);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5000
     * @tc.name IntTest5000
     * @tc.desc test isLessThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5000'
        console.info(`${caseName}, test start`);
        const a = new Int(-1);
        const b = new Int(2);
        const result = a.isLessThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5100
     * @tc.name IntTest5100
     * @tc.desc test isLessThan(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5100'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(2);
        const result = a.isLessThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5200
     * @tc.name IntTest5200
     * @tc.desc test mul(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5200'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(5);
        const result = a.mul(b);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5300
     * @tc.name IntTest5300
     * @tc.desc test mul(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5300'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const b = new Int(-5);
        const result = a.mul(b);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5400
     * @tc.name IntTest5400
     * @tc.desc test mul(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5400'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(-5);
        const result = a.mul(b);
        expect(result).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5500
     * @tc.name IntTest5500
     * @tc.desc test mul(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5500'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = new Int(0);
        const result = a.mul(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5600
     * @tc.name IntTest5600
     * @tc.desc test getHashCodeByValue() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5600'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5700
     * @tc.name IntTest5700
     * @tc.desc test getHashCodeByValue() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5700'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5800
     * @tc.name IntTest5800
     * @tc.desc test getHashCodeByValue() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5800'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(Int.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_5900
     * @tc.name IntTest5900
     * @tc.desc test getHashCodeByValue() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest5900'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(Int.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6000
     * @tc.name IntTest6000
     * @tc.desc test getHashCodeByValue() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6000'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6100
     * @tc.name IntTest6100
     * @tc.desc test toByte() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6100'
        console.info(`${caseName}, test start`);
        const a = new Int(100);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(100);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6200
     * @tc.name IntTest6200
     * @tc.desc test toByte() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6200'
        console.info(`${caseName}, test start`);
        const a = new Int(-128);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(-128);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6300
     * @tc.name IntTest6300
     * @tc.desc test toByte() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6300'
        console.info(`${caseName}, test start`);
        const a = new Int(127);
        expect(Runtime.getHashCodeByValue(a)).assertEqual(127);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6400
     * @tc.name IntTest6400
     * @tc.desc test toByte() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6400'
        console.info(`${caseName}, test start`);
        const a = new Int(200);
        const result = a.toByte();
        expect(result).assertEqual(-56);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6500
     * @tc.name IntTest6500
     * @tc.desc test toByte() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6500'
        console.info(`${caseName}, test start`);
        const a = new Int(-200);
        const result = a.toByte();
        expect(result).assertEqual(56);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6600
     * @tc.name IntTest6600
     * @tc.desc test compareTo(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6600'
        console.info(`${caseName}, test start`);
        const a = new Int(10);
        const b = new Int(5);
        const result = a.compareTo(b);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6700
     * @tc.name IntTest6700
     * @tc.desc test compareTo(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6700'
        console.info(`${caseName}, test start`);
        const a = new Int(3);
        const b = new Int(7);
        const result = a.compareTo(b);
        expect(result).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6800
     * @tc.name IntTest6800
     * @tc.desc test compareTo(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6800'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.compareTo(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_6900
     * @tc.name IntTest6900
     * @tc.desc test compareTo(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest6900'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.compareTo(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7000
     * @tc.name IntTest7000
     * @tc.desc test compareTo(other: Int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7000'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const b = new Int(-3);
        const result = a.compareTo(b);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7100
     * @tc.name IntTest7100
     * @tc.desc test toDouble() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7100'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const result = a.toDouble();
        expect(result).assertEqual(2.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7200
     * @tc.name IntTest7200
     * @tc.desc test toDouble() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7200'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const result = a.toDouble();
        expect(result).assertEqual(-2.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7300
     * @tc.name IntTest7300
     * @tc.desc test toDouble() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7300'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const result = a.toDouble();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7400
     * @tc.name IntTest7400
     * @tc.desc test toDouble() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7400'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const result = a.toDouble();
        expect(result).assertEqual(2147483647.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7500
     * @tc.name IntTest7500
     * @tc.desc test toDouble() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7500'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const result = a.toDouble();
        expect(result).assertEqual(-2147483648.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7600
     * @tc.name IntTest7600
     * @tc.desc test toFloat() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7600'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const result = a.toFloat();
        expect(result).assertEqual(2.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7700
     * @tc.name IntTest7700
     * @tc.desc test toFloat() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7700'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const result = a.toFloat();
        expect(result).assertEqual(-2.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7800
     * @tc.name IntTest7800
     * @tc.desc test toFloat() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7800'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const result = a.toFloat();
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_7900
     * @tc.name IntTest7900
     * @tc.desc test toInt() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest7900'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const result = a.toInt();
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8000
     * @tc.name IntTest8000
     * @tc.desc test toInt() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8000'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const result = a.toInt();
        expect(result).assertEqual(-2);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8100
     * @tc.name IntTest8100
     * @tc.desc test toInt() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8100'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const result = a.toInt();
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8200
     * @tc.name IntTest8200
     * @tc.desc test toInt() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8200'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const result = a.toInt();
        expect(result).assertEqual(Int.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8300
     * @tc.name IntTest8300
     * @tc.desc test toInt() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8300'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const result = a.toInt();
        expect(result).assertEqual(Int.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8400
     * @tc.name IntTest8400
     * @tc.desc test toLong() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8400'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = 2 as long;
        const result = a.toLong();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8500
     * @tc.name IntTest8500
     * @tc.desc test toLong() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8500'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const b = -2 as long;
        const result = a.toLong();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8600
     * @tc.name IntTest8600
     * @tc.desc test toLong() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8600'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const b = 0 as long;
        const result = a.toLong();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8700
     * @tc.name IntTest8700
     * @tc.desc test toLong() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8700'
        console.info(`${caseName}, test start`);
        const a = new Int(2147483647);
        const b = 2147483647 as long;
        const result = a.toLong();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8800
     * @tc.name IntTest8800
     * @tc.desc test toLong() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8800'
        console.info(`${caseName}, test start`);
        const a = new Int(-2147483648);
        const b = -2147483648 as long;
        const result = a.toLong();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_8900
     * @tc.name IntTest8900
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest8900'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const b = 2 as short;
        const result = a.toShort();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9000
     * @tc.name IntTest9000
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9000'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const b = -2 as short;
        const result = a.toShort();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9100
     * @tc.name IntTest9100
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9100'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const b = 0 as short;
        const result = a.toShort();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9200
     * @tc.name IntTest9200
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9200'
        console.info(`${caseName}, test start`);
        const a = new Int(2147483647);
        const b = (2147483647).toShort();
        const result = a.toShort();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9300
     * @tc.name IntTest9300
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9300'
        console.info(`${caseName}, test start`);
        const a = new Int(-2147483648);
        const b = (-2147483648).toShort();
        const result = a.toShort();
        expect(result).assertEqual(b);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number INT_TEST_9400
     * @tc.name IntTest9400
     * @tc.desc test toString() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9400'
        console.info(`${caseName}, test start`);
        const a = new Int(2);
        const result = a.toString();
        expect(result).assertEqual('2');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9500
     * @tc.name IntTest9500
     * @tc.desc test toString() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9500'
        console.info(`${caseName}, test start`);
        const a = new Int(-2);
        const result = a.toString();
        expect(result).assertEqual('-2');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9600
     * @tc.name IntTest9600
     * @tc.desc test toShort() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9600'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const result = a.toString();
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9700
     * @tc.name IntTest9700
     * @tc.desc test toString() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9700'
        console.info(`${caseName}, test start`);
        const a = new Int(2147483647);
        const result = a.toString();
        expect(result).assertEqual('2147483647');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_TEST_9800
     * @tc.name IntTest9800
     * @tc.desc test toString() return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'IntTest9800'
        console.info(`${caseName}, test start`);
        const a = new Int(-2147483648);
        const result = a.toString();
        expect(result).assertEqual('-2147483648');
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}