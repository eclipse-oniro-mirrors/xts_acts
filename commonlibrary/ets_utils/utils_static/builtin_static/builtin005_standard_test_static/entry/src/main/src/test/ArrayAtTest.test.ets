/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
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
export default function builtinsArrayAtPrototypebTest() {
  describe('builtinsArrayAtPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayAtPrototypebTest0100
     * @tc.name builtinsArrayAtPrototypebTest0100
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, 0);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest0200
     * @tc.name builtinsArrayAtPrototypebTest0200
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest0300
     * @tc.name builtinsArrayAtPrototypebTest0300
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, -1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest0400
     * @tc.name builtinsArrayAtPrototypebTest0400
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, -3);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest0800
     * @tc.name builtinsArrayAtPrototypebTest0800
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(false);
        expect(result2).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest0900
     * @tc.name builtinsArrayAtPrototypebTest0900
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1000
     * @tc.name builtinsArrayAtPrototypebTest1000
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, -1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1100
     * @tc.name builtinsArrayAtPrototypebTest1100
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, 1);
        expect(result).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1200
     * @tc.name builtinsArrayAtPrototypebTest1200
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [true, false, true];
        const result = at(arr, -1);
        expect(result).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest1500
     * @tc.name builtinsArrayAtPrototypebTest1500
     * @tc.desc at(self: FixedArray<boolean>, index: int): Boolean | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<boolean> = [false];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(false);
        expect(result2).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1700
     * @tc.name builtinsArrayAtPrototypebTest1700
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, 0);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1800
     * @tc.name builtinsArrayAtPrototypebTest1800
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest1900
     * @tc.name builtinsArrayAtPrototypebTest1900
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, -1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest2000
     * @tc.name builtinsArrayAtPrototypebTest2000
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, -3);
        expect(result).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number builtinsArrayAtPrototypebTest2300
     * @tc.name builtinsArrayAtPrototypebTest2300
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [9];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9);
        expect(result2).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest2500
     * @tc.name builtinsArrayAtPrototypebTest2500
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest2600
     * @tc.name builtinsArrayAtPrototypebTest2600
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, -1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest2700
     * @tc.name builtinsArrayAtPrototypebTest2700
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, 1);
        expect(result).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest2800
     * @tc.name builtinsArrayAtPrototypebTest2800
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = at(arr, -1);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest3100
     * @tc.name builtinsArrayAtPrototypebTest3100
     * @tc.desc at(self: FixedArray<byte>, index: int): Byte | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [9];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9);
        expect(result2).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest3300
     * @tc.name builtinsArrayAtPrototypebTest3300
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, 0);
        expect(result).assertEqual(new Char(c'a'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest3400
     * @tc.name builtinsArrayAtPrototypebTest3400
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, 1);
        expect(result).assertEqual(new Char(c'b'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest3500
     * @tc.name builtinsArrayAtPrototypebTest3500
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, -1);
        expect(result).assertEqual(new Char(c'c'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest3600
     * @tc.name builtinsArrayAtPrototypebTest3600
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, -3);
        expect(result).assertEqual(new Char(c'a'));
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number builtinsArrayAtPrototypebTest3900
     * @tc.name builtinsArrayAtPrototypebTest3900
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'z')];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(new Char(c'z'));
        expect(result2).assertEqual(new Char(c'z'));
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest4100
     * @tc.name builtinsArrayAtPrototypebTest4100
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, 1);
        expect(result).assertEqual(new Char(c'b'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest4200
     * @tc.name builtinsArrayAtPrototypebTest4200
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, -1);
        expect(result).assertEqual(new Char(c'c'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest4300
     * @tc.name builtinsArrayAtPrototypebTest4300
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, 1);
        expect(result).assertEqual(new Char(c'b'));
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest4400
     * @tc.name builtinsArrayAtPrototypebTest4400
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'a'), new Char(c'b'), new Char(c'c')];
        const result = at(arr, -1);
        expect(result).assertEqual(new Char(c'c'));
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest4700
     * @tc.name builtinsArrayAtPrototypebTest4700
     * @tc.desc at(self: FixedArray<char>, index: int): Char | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [new Char(c'z')];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(new Char(c'z'));
        expect(result2).assertEqual(new Char(c'z'));
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest4900
     * @tc.name builtinsArrayAtPrototypebTest4900
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, 0);
        expect(result).assertEqual(1.1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest5000
     * @tc.name builtinsArrayAtPrototypebTest5000
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, 1);
        expect(result).assertEqual(2.2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest5100
     * @tc.name builtinsArrayAtPrototypebTest5100
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, -1);
        expect(result).assertEqual(3.3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest5200
     * @tc.name builtinsArrayAtPrototypebTest5200
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, -3);
        expect(result).assertEqual(1.1);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number builtinsArrayAtPrototypebTest5500
     * @tc.name builtinsArrayAtPrototypebTest5500
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9.9);
        expect(result2).assertEqual(9.9);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number builtinsArrayAtPrototypebTest5700
     * @tc.name builtinsArrayAtPrototypebTest5700
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, 1);
        expect(result).assertEqual(2.2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest5800
     * @tc.name builtinsArrayAtPrototypebTest5800
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, -1);
        expect(result).assertEqual(3.3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest5900
     * @tc.name builtinsArrayAtPrototypebTest5900
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, 1);
        expect(result).assertEqual(2.2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest6000
     * @tc.name builtinsArrayAtPrototypebTest6000
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = at(arr, -1);
        expect(result).assertEqual(3.3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest6300
     * @tc.name builtinsArrayAtPrototypebTest6300
     * @tc.desc at(self: FixedArray<double>, index: int): Double | undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9.9);
        expect(result2).assertEqual(9.9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest6500
     * @tc.name builtinsArrayAtPrototypebTest6500
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, 0);
        expect(result).assertEqual(1.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest6600
     * @tc.name builtinsArrayAtPrototypebTest6600
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, 1);
        expect(result).assertEqual(2.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest6700
     * @tc.name builtinsArrayAtPrototypebTest6700
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, -1);
        expect(result).assertEqual(3.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest6800
     * @tc.name builtinsArrayAtPrototypebTest6800
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, -3);
        expect(result).assertEqual(1.5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest7100
     * @tc.name builtinsArrayAtPrototypebTest7100
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9.toFloat()];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9.9.toFloat());
        expect(result2).assertEqual(9.9.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest7300
     * @tc.name builtinsArrayAtPrototypebTest7300
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, 0);
        expect(result).assertEqual(1.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest7400
     * @tc.name builtinsArrayAtPrototypebTest7400
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, 1);
        expect(result).assertEqual(2.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest7500
     * @tc.name builtinsArrayAtPrototypebTest7500
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, -1);
        expect(result).assertEqual(3.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest7600
     * @tc.name builtinsArrayAtPrototypebTest7600
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.5.toFloat(), 2.5.toFloat(), 3.5.toFloat()];
        const result = at(arr, -3);
        expect(result).assertEqual(1.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest7900
     * @tc.name builtinsArrayAtPrototypebTest7900
     * @tc.desc at(self: FixedArray<float>, index: int): Float | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest7900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9.toFloat()];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(9.9.toFloat());
        expect(result2).assertEqual(9.9.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest8100
     * @tc.name builtinsArrayAtPrototypebTest8100
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, 0);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest8200
     * @tc.name builtinsArrayAtPrototypebTest8200
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, 1);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest8300
     * @tc.name builtinsArrayAtPrototypebTest8300
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, -1);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest8400
     * @tc.name builtinsArrayAtPrototypebTest8400
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, -3);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest8700
     * @tc.name builtinsArrayAtPrototypebTest8700
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(99);
        expect(result2).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayAtPrototypebTest8900
     * @tc.name builtinsArrayAtPrototypebTest8900
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 正向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest8900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, 0);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest9000
     * @tc.name builtinsArrayAtPrototypebTest9000
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 正向索引取中间元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest9000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, 1);
        expect(result).assertEqual(20);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest9100
     * @tc.name builtinsArrayAtPrototypebTest9100
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 负向索引取最后一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest9100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, -1);
        expect(result).assertEqual(30);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest9200
     * @tc.name builtinsArrayAtPrototypebTest9200
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 负向索引取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest9200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [10, 20, 30];
        const result = at(arr, -3);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayAtPrototypebTest9500
     * @tc.name builtinsArrayAtPrototypebTest9500
     * @tc.desc at(self: FixedArray<int>, index: int): Int | undefined 单元素数组正负索引
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayAtPrototypebTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayAtPrototypebTest9500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99];
        const result1 = at(arr, 0);
        const result2 = at(arr, -1);
        expect(result1).assertEqual(99);
        expect(result2).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })

  })
}
