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

export default function builtinsFloatPrototypebTest() {
  describe('builtinsFloatPrototypebTest', ():void => {
    beforeAll(():void => {
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
    })
    afterEach(():void => {
    })
    afterAll(():void => {
    })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0100
     * @tc.name builtinsFloatPrototypebTest0100
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const a = new Float(1.5);
        const b = new Float(2.5);
        const result = a.add(b);
        expect(result).assertEqual(4.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0200
     * @tc.name builtinsFloatPrototypebTest0200
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const a = new Float(-1.5);
        const b = new Float(-2.5);
        const result = a.add(b);
        expect(result).assertEqual(-4.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0300
     * @tc.name builtinsFloatPrototypebTest0300
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const a = new Float(1.5);
        const b = new Float(-2.5);
        const result = a.add(b);
        expect(result).assertEqual(-1.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0400
     * @tc.name builtinsFloatPrototypebTest0400
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(2.5);
        const result = a.add(b);
        expect(result).assertEqual(2.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0500
     * @tc.name builtinsFloatPrototypebTest0500
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(0.0);
        const result = a.add(b);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0600
     * @tc.name builtinsFloatPrototypebTest0600
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.add(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0700
     * @tc.name builtinsFloatPrototypebTest0700
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(-1.0);
        const result = a.add(b);
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0800
     * @tc.name builtinsFloatPrototypebTest0800
     * @tc.desc test add(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        const result = a.add(b);
        expect(Number.isNaN(result)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_0900
     * @tc.name builtinsFloatPrototypebTest0900
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1000
     * @tc.name builtinsFloatPrototypebTest1000
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1100
     * @tc.name builtinsFloatPrototypebTest1100
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a == 0.0).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1200
     * @tc.name builtinsFloatPrototypebTest1200
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(typeof a).assertEqual('float');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1300
     * @tc.name builtinsFloatPrototypebTest1300
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a + 1).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1400
     * @tc.name builtinsFloatPrototypebTest1400
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a - 1).assertEqual(-1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1500
     * @tc.name builtinsFloatPrototypebTest1500
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a * 2).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1600
     * @tc.name builtinsFloatPrototypebTest1600
     * @tc.desc test constructor(): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const a = new Float();
        expect(a / 1).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1700
     * @tc.name builtinsFloatPrototypebTest1700
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const diff = Math.abs(a.toDouble() - 1.23);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })




    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1800
     * @tc.name builtinsFloatPrototypebTest1800
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const a = new Float(-1.23);
        const diff = Math.abs(a.toDouble() + 1.23);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_1900
     * @tc.name builtinsFloatPrototypebTest1900
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2000
     * @tc.name builtinsFloatPrototypebTest2000
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2100
     * @tc.name builtinsFloatPrototypebTest2100
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        expect(a).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2200
     * @tc.name builtinsFloatPrototypebTest2200
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2300
     * @tc.name builtinsFloatPrototypebTest2300
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2400
     * @tc.name builtinsFloatPrototypebTest2400
     * @tc.desc test constructor(value: double): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2500
     * @tc.name builtinsFloatPrototypebTest2500
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const a = new Float(1.00);
        const diff = Math.abs(a.toDouble() - 1.00);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2600
     * @tc.name builtinsFloatPrototypebTest2600
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const a = new Float(-1.99);
        const diff = Math.abs(a.toDouble() + 1.99);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2700
     * @tc.name builtinsFloatPrototypebTest2700
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        expect(a).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2800
     * @tc.name builtinsFloatPrototypebTest2800
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        expect(a).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_2900
     * @tc.name builtinsFloatPrototypebTest2900
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        expect(a).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3000
     * @tc.name builtinsFloatPrototypebTest3000
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        expect(a).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3100
     * @tc.name builtinsFloatPrototypebTest3100
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        expect(a).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3200
     * @tc.name builtinsFloatPrototypebTest3200
     * @tc.desc test constructor(value: float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        expect(Number.isNaN(a)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3300
     * @tc.name builtinsFloatPrototypebTest3300
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: 1.23 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        const diff = Math.abs(result.toDouble() - 1.23);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3400
     * @tc.name builtinsFloatPrototypebTest3400
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: -1.23 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        const diff = Math.abs(result.toDouble() + 1.23);
        expect(diff < 1e-6).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3500
     * @tc.name builtinsFloatPrototypebTest3500
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: 0.0 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3600
     * @tc.name builtinsFloatPrototypebTest3600
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: Float.MAX_VALUE };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(Float.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3700
     * @tc.name builtinsFloatPrototypebTest3700
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: Float.MIN_VALUE };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(Float.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3800
     * @tc.name builtinsFloatPrototypebTest3800
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(11.0);
        const jsonNumber: JSONNumber = { value: 11 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(11);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_3900
     * @tc.name builtinsFloatPrototypebTest3900
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(0);
        const jsonNumber: JSONNumber = { value: -11 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result).assertEqual(-11);
        console.info(`${caseName}, test end`);
        Done();
      })




    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4000
     * @tc.name builtinsFloatPrototypebTest4000
     * @tc.desc test createFromJSONValue(json: JSONValue): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const floatInstance = new Float(9.0);
        const jsonNumber: JSONNumber = { value: 9 };
        const result = floatInstance.createFromJSONValue(jsonNumber);
        expect(result.toDouble()).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4100
     * @tc.name builtinsFloatPrototypebTest4100
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const a = new Float(6.0);
        const b = new Float(2.0);
        const result = a.div(b);
        expect(result).assertEqual(3.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4200
     * @tc.name builtinsFloatPrototypebTest4200
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const a = new Float(-6.0);
        const b = new Float(2.0);
        const result = a.div(b);
        expect(result).assertEqual(-3.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4300
     * @tc.name builtinsFloatPrototypebTest4300
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const a = new Float(6.0);
        const b = new Float(-2.0);
        const result = a.div(b);
        expect(result).assertEqual(-3.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4400
     * @tc.name builtinsFloatPrototypebTest4400
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(2.0);
        const result = a.div(b);
        expect(result).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4500
     * @tc.name builtinsFloatPrototypebTest4500
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const a = new Float(6.0);
        const b = new Float(0.0);
        const result = a.div(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4600
     * @tc.name builtinsFloatPrototypebTest4600
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(0.0);
        const result = a.div(b);
        expect(Number.isNaN(result)).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4700
     * @tc.name builtinsFloatPrototypebTest4700
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(2.0);
        const result = a.div(b);
        expect(result).assertEqual(Number.POSITIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4800
     * @tc.name builtinsFloatPrototypebTest4800
     * @tc.desc test div(other: Float): Float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(2.0);
        const result = a.div(b);
        expect(result).assertEqual(Number.NEGATIVE_INFINITY);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_4900
     * @tc.name builtinsFloatPrototypebTest4900
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const b = new Float(1.23);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5000
     * @tc.name builtinsFloatPrototypebTest5000
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const b = new Float(2.34);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5100
     * @tc.name builtinsFloatPrototypebTest5100
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(0.0);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5200
     * @tc.name builtinsFloatPrototypebTest5200
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NaN);
        const b = new Float(Number.NaN);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5300
     * @tc.name builtinsFloatPrototypebTest5300
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.equals(null);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5400
     * @tc.name builtinsFloatPrototypebTest5400
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.equals(undefined);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5500
     * @tc.name builtinsFloatPrototypebTest5500
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.equals(1.23);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5600
     * @tc.name builtinsFloatPrototypebTest5600
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(Number.POSITIVE_INFINITY);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5700
     * @tc.name builtinsFloatPrototypebTest5700
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const b = new Float(1.23);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5800
     * @tc.name builtinsFloatPrototypebTest5800
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const b = new Float(2.34);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_5900
     * @tc.name builtinsFloatPrototypebTest5900
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const b = new Float(0.0);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6000
     * @tc.name builtinsFloatPrototypebTest6000
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NaN);
        const b = new Float(Number.NaN);
        const result = a.equals(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6100
     * @tc.name builtinsFloatPrototypebTest6100
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.equals(null);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6200
     * @tc.name builtinsFloatPrototypebTest6200
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.equals(undefined);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6300
     * @tc.name builtinsFloatPrototypebTest6300
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const b = new Float(1.23);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6400
     * @tc.name builtinsFloatPrototypebTest6400
     * @tc.desc test equals(other: Any): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(Number.POSITIVE_INFINITY);
        const result = a.equals(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6500
     * @tc.name builtinsFloatPrototypebTest6500
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const a = new Float(1.23);
        const result = a.isFinite();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6600
     * @tc.name builtinsFloatPrototypebTest6600
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const result = a.isFinite();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6700
     * @tc.name builtinsFloatPrototypebTest6700
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const a = new Float(-123.456);
        const result = a.isFinite();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6800
     * @tc.name builtinsFloatPrototypebTest6800
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const result = a.isFinite();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_6900
     * @tc.name builtinsFloatPrototypebTest6900
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const result = a.isFinite();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7000
     * @tc.name builtinsFloatPrototypebTest7000
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const result = a.isFinite();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7100
     * @tc.name builtinsFloatPrototypebTest7100
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const result = a.isFinite();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7200
     * @tc.name builtinsFloatPrototypebTest7200
     * @tc.desc test isFinite(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const result = a.isFinite();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7300
     * @tc.name builtinsFloatPrototypebTest7300
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(5.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7400
     * @tc.name builtinsFloatPrototypebTest7400
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const a = new Float(10.0);
        const b = new Float(5.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7401
     * @tc.name builtinsFloatPrototypebTest7401
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7401';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(10.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7500
     * @tc.name builtinsFloatPrototypebTest7500
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7600
     * @tc.name builtinsFloatPrototypebTest7600
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(0.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7700
     * @tc.name builtinsFloatPrototypebTest7700
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7700';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7800
     * @tc.name builtinsFloatPrototypebTest7800
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7800';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_7900
     * @tc.name builtinsFloatPrototypebTest7900
     * @tc.desc test isGreaterEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        const result = a.isGreaterEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8000
     * @tc.name builtinsFloatPrototypebTest8000
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8000';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(3.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8100
     * @tc.name builtinsFloatPrototypebTest8100
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const a = new Float(3.0);
        const b = new Float(5.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8200
     * @tc.name builtinsFloatPrototypebTest8200
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(5.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8300
     * @tc.name builtinsFloatPrototypebTest8300
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8400
     * @tc.name builtinsFloatPrototypebTest8400
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MIN_VALUE);
        const b = new Float(0.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8500
     * @tc.name builtinsFloatPrototypebTest8500
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8500';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8600
     * @tc.name builtinsFloatPrototypebTest8600
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8600';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const b = new Float(1.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8700
     * @tc.name builtinsFloatPrototypebTest8700
     * @tc.desc test isGreaterThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const b = new Float(1.0);
        const result = a.isGreaterThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8800
     * @tc.name builtinsFloatPrototypebTest8800
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8800';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const result = a.isInteger();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_8900
     * @tc.name builtinsFloatPrototypebTest8900
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const a = new Float(0.0);
        const result = a.isInteger();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9000
     * @tc.name builtinsFloatPrototypebTest9000
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const a = new Float(-10.0);
        const result = a.isInteger();
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9100
     * @tc.name builtinsFloatPrototypebTest9100
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const a = new Float(3.14);
        const result = a.isInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9200
     * @tc.name builtinsFloatPrototypebTest9200
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const a = new Float(-3.14);
        const result = a.isInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9300
     * @tc.name builtinsFloatPrototypebTest9300
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9300';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.POSITIVE_INFINITY);
        const result = a.isInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9400
     * @tc.name builtinsFloatPrototypebTest9400
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9400';
        console.info(`${caseName}, test start`);
        const a = new Float(Number.NEGATIVE_INFINITY);
        const result = a.isInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9500
     * @tc.name builtinsFloatPrototypebTest9500
     * @tc.desc test isInteger(): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const a = new Float(NaN);
        const result = a.isInteger();
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9600
     * @tc.name builtinsFloatPrototypebTest9600
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9600';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(5.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9700
     * @tc.name builtinsFloatPrototypebTest9700
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9700';
        console.info(`${caseName}, test start`);
        const a = new Float(3.0);
        const b = new Float(5.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9800
     * @tc.name builtinsFloatPrototypebTest9800
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9800';
        console.info(`${caseName}, test start`);
        const a = new Float(5.0);
        const b = new Float(3.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_FLOAT_PROTOTYPEB_TEST_9900
     * @tc.name builtinsFloatPrototypebTest9900
     * @tc.desc test isLessEqualThan(other: Float): boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsFloatPrototypebTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsFloatPrototypebTest9900';
        console.info(`${caseName}, test start`);
        const a = new Float(Float.MAX_VALUE);
        const b = new Float(1.0);
        const result = a.isLessEqualThan(b);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}