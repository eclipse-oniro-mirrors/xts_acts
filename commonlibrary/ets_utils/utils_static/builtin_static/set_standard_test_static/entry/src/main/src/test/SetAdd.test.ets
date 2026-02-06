
/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

interface BaseI{
  a: number
}
interface Base2{
  name: string;
}

interface Base3{
  b: number
}
interface Base4{
  a: Base3;
}

interface Base5{
  prop: string;
}

interface Base6{}

interface Base7{
  key: string;
}

interface Base8{
  id: number
}

interface Base9{
  a: number,
  b: number
}

interface Base10{
  count: number
}

class MyClass {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

export default function SetAddTest() {
  describe('SetAddTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0100
     * @tc.name SetAddTest001
     * @tc.desc Add single lowercase string to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('javascript');
      expect(set.size).assertEqual(1);
      expect(set.has('javascript')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0200
     * @tc.name SetAddTest002
     * @tc.desc Add single uppercase string to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('TYPESCRIPT');
      expect(set.size).assertEqual(1);
      expect(set.has('TYPESCRIPT')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0300
     * @tc.name SetAddTest003
     * @tc.desc Add positive integer to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      set.add(42);
      expect(set.size).assertEqual(1);
      expect(set.has(42)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0400
     * @tc.name SetAddTest004
     * @tc.desc Add negative integer to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      set.add(-73);
      expect(set.size).assertEqual(1);
      expect(set.has(-73)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0500
     * @tc.name SetAddTest005
     * @tc.desc Add positive floating-point number to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      set.add(3.14159);
      expect(set.size).assertEqual(1);
      expect(set.has(3.14159)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0600
     * @tc.name SetAddTest006
     * @tc.desc Add negative floating-point number to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      set.add(-2.71828);
      expect(set.size).assertEqual(1);
      expect(set.has(-2.71828)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0700
     * @tc.name SetAddTest007
     * @tc.desc Add boolean true to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>();
      set.add(true);
      expect(set.size).assertEqual(1);
      expect(set.has(true)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0800
     * @tc.name SetAddTest008
     * @tc.desc Add boolean false to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>();
      set.add(false);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_0900
     * @tc.name SetAddTest009
     * @tc.desc Add null to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<null | object>();
      set.add(null);
      expect(set.size).assertEqual(1);
      expect(set.has(null)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1000
     * @tc.name SetAddTest010
     * @tc.desc Add undefined to empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetAddTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<undefined | object>();
      set.add(undefined);
      expect(set.size).assertEqual(1);
      expect(set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1100
     * @tc.name SetAddTest011
     * @tc.desc Add duplicate strings to Set (should ignore duplicates)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('duplicate').add('duplicate');
      expect(set.size).assertEqual(1);
      expect(set.has('duplicate')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1200
     * @tc.name SetAddTest012
     * @tc.desc Add duplicate numbers to Set (should ignore duplicates)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(100).add(100);
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1300
     * @tc.name SetAddTest013
     * @tc.desc Add string "7" and number 7 (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string | number>();
      set.add('7').add(7);
      expect(set.size).assertEqual(2);
      expect(set.has('7') && set.has(7)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1400
     * @tc.name SetAddTest014
     * @tc.desc Add boolean true and number 1 (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<boolean | number>();
      set.add(true).add(1);
      expect(set.size).assertEqual(2);
      expect(set.has(true) && set.has(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1500
     * @tc.name SetAddTest015
     * @tc.desc Add 0 and -0 (should treat as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(0).add(-0);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1600
     * @tc.name SetAddTest016
     * @tc.desc Add multiple NaN values (should treat as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(NaN).add(Number('invalid')).add(0/0.0);
      expect(set.size).assertEqual(1);
      expect(set.has(NaN)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1700
     * @tc.name SetAddTest017
     * @tc.desc Add empty string and space string (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('').add(' ');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has(' ')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1800
     * @tc.name SetAddTest018
     * @tc.desc Add tab and newline characters (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('\t').add('\n');
      expect(set.size).assertEqual(2);
      expect(set.has('\t') && set.has('\n')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_1900
     * @tc.name SetAddTest019
     * @tc.desc Add Infinity and -Infinity (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(Infinity).add(-Infinity);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(-Infinity)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2000
     * @tc.name SetAddTest020
     * @tc.desc Add max safe integer and its next value (should treat as distinct)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      const maxSafe = Number.MAX_SAFE_INTEGER;
      set.add(maxSafe).add(maxSafe + 1);
      expect(set.size).assertEqual(2);
      expect(set.has(maxSafe) && set.has(maxSafe + 1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2100
     * @tc.name SetAddTest021
     * @tc.desc Add two distinct plain objects (by reference)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const set = new Set<BaseI>();
      const obj1: BaseI = { a: 1 };
      const obj2: BaseI = { a: 1 };
      set.add(obj1).add(obj2);
      expect(set.size).assertEqual(2);
      expect(set.has(obj1) && set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2200
     * @tc.name SetAddTest022
     * @tc.desc Add same plain object twice (should ignore duplicate)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const set = new Set<Base2>();
      const obj: Base2 = { name: 'test' };
      set.add(obj).add(obj);
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2300
     * @tc.name SetAddTest023
     * @tc.desc Add two distinct arrays (by reference)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int[]>();
      const arr1 = [1, 2];
      const arr2 = [1, 2];
      set.add(arr1).add(arr2);
      expect(set.size).assertEqual(2);
      expect(set.has(arr1) && set.has(arr2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2400
     * @tc.name SetAddTest024
     * @tc.desc Add same array twice (should ignore duplicate)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int[]>();
      const arr = [3, 4, 5];
      set.add(arr).add(arr);
      expect(set.size).assertEqual(1);
      expect(set.has(arr)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2500
     * @tc.name SetAddTest025
     * @tc.desc Add two distinct Date objects with same time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<Date>();
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-01');
      set.add(date1).add(date2);
      expect(set.size).assertEqual(2);
      expect(set.has(date1) && set.has(date2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2600
     * @tc.name SetAddTest026
     * @tc.desc Add two distinct RegExp objects with same pattern
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<RegExp>();
      const regex1 = new RegExp('test');
      const regex2 = new RegExp('test');
      set.add(regex1).add(regex2);
      expect(set.size).assertEqual(2);
      expect(set.has(regex1) && set.has(regex2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2800
     * @tc.name SetAddTest028
     * @tc.desc Add two BigInt values with same numeric value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<bigint>();
      const big1 = 42n;
      const big2 = 42n;
      set.add(big1).add(big2);
      expect(set.size).assertEqual(1);
      expect(set.has(big1) && set.has(big2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_2900
     * @tc.name SetAddTest029
     * @tc.desc Use method chaining to add multiple distinct values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string | number | boolean | null>();
      set.add('a').add(1).add(true).add(null);
      expect(set.size).assertEqual(4);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3000
     * @tc.name SetAddTest030
     * @tc.desc Verify add() returns the original Set instance for chaining
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      const result = set.add('test');
      expect(result).assertDeepEquals(set);
      expect(set.has('test')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3100
     * @tc.name SetAddTest031
     * @tc.desc Add string with Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('café');
      expect(set.size).assertEqual(1);
      expect(set.has('café')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3200
     * @tc.name SetAddTest032
     * @tc.desc Add string with emojis
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('😊👍');
      expect(set.size).assertEqual(1);
      expect(set.has('😊👍')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3300
     * @tc.name SetAddTest033
     * @tc.desc Add very large positive integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(9007199254740991)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3400
     * @tc.name SetAddTest034
     * @tc.desc Add very small negative integer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(-9007199254740991);
      expect(set.size).assertEqual(1);
      expect(set.has(-9007199254740991)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3500
     * @tc.name SetAddTest035
     * @tc.desc Add number with high precision decimal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(0.1234567890123456789);
      expect(set.size).assertEqual(1);
      expect(set.has(0.1234567890123456789)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3600
     * @tc.name SetAddTest036
     * @tc.desc Add string representation of number and number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number | string>();
      set.add('123.45').add(123.45);
      expect(set.size).assertEqual(2);
      expect(set.has('123.45') && set.has(123.45)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3700
     * @tc.name SetAddTest037
     * @tc.desc Add boolean false and 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<boolean | number>();
      set.add(false).add(0);
      expect(set.size).assertEqual(2);
      expect(set.has(false) && set.has(0)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3800
     * @tc.name SetAddTest038
     * @tc.desc Add multiple mixed primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<string | number | boolean | null | undefined>();
      set.add('a').add(1).add(true).add(null).add(undefined);
      expect(set.size).assertEqual(5);
      expect(set.has('a') && set.has(1) && set.has(true) && set.has(null) && set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_3900
     * @tc.name SetAddTest039
     * @tc.desc Add hexadecimal and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(0x10).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4000
     * @tc.name SetAddTest040
     * @tc.desc Add octal and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(0o20).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4100
     * @tc.name SetAddTest041
     * @tc.desc Add binary and decimal equivalents
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(0b10000).add(16);
      expect(set.size).assertEqual(1);
      expect(set.has(16)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4200
     * @tc.name SetAddTest042
     * @tc.desc Add exponential notation numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(1e3).add(1000);
      expect(set.size).assertEqual(1);
      expect(set.has(1000)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4300
     * @tc.name SetAddTest043
     * @tc.desc Add string with leading zeros and number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number | string>();
      set.add('00123').add(123);
      expect(set.size).assertEqual(2);
      expect(set.has('00123') && set.has(123)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4400
     * @tc.name SetAddTest044
     * @tc.desc Add empty string and string with zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('').add('0');
      expect(set.size).assertEqual(2);
      expect(set.has('') && set.has('0')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4500
     * @tc.name SetAddTest045
     * @tc.desc Add Infinity and large number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(Infinity).add(1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(Infinity) && set.has(1e308)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4600
     * @tc.name SetAddTest046
     * @tc.desc Add -Infinity and very small number
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(-Infinity).add(-1e308);
      expect(set.size).assertEqual(2);
      expect(set.has(-Infinity) && set.has(-1e308)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4700
     * @tc.name SetAddTest047
     * @tc.desc Add Number.MIN_VALUE
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(Number.MIN_VALUE);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MIN_VALUE)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4800
     * @tc.name SetAddTest048
     * @tc.desc Add Number.EPSILON
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(Number.EPSILON);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.EPSILON)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_4900
     * @tc.name SetAddTest049
     * @tc.desc Add mixed case strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('JavaScript').add('javascript');
      expect(set.size).assertEqual(2);
      expect(set.has('JavaScript') && set.has('javascript')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5000
     * @tc.name SetAddTest050
     * @tc.desc Add strings with whitespace variations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('test').add(' test').add('test ').add(' test ');
      expect(set.size).assertEqual(4);
      expect(set.has('test') && set.has(' test') && set.has('test ') && set.has(' test ')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5100
     * @tc.name SetAddTest051
     * @tc.desc Add nested objects with same structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const set = new Set<Base4>();
      const obj1: Base4 = { a: { b: 1 } };
      const obj2: Base4 = { a: { b: 1 } };
      set.add(obj1).add(obj2);
      expect(set.size).assertEqual(2);
      expect(set.has(obj1) && set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5200
     * @tc.name SetAddTest052
     * @tc.desc Add objects after modifying their properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<Base5>();
      const obj: Base5 = { prop: 'value' };
      set.add(obj);
      obj.prop = 'modified';
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5300
     * @tc.name SetAddTest053
     * @tc.desc Add arrays with same elements in different order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int[]>();
      const arr1 = [1, 2, 3];
      const arr2 = [3, 2, 1];
      set.add(arr1).add(arr2);
      expect(set.size).assertEqual(2);
      expect(set.has(arr1) && set.has(arr2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5400
     * @tc.name SetAddTest054
     * @tc.desc Add arrays after modifying their contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<int[]>();
      const arr = [1, 2, 3];
      set.add(arr);
      arr.push(4);
      expect(set.size).assertEqual(1);
      expect(set.has(arr)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5500
     * @tc.name SetAddTest055
     * @tc.desc Add Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<Map<string, string>>();
      const map1 = new Map<string, string>();
      const map2 = new Map<string, string>();
      map1.set('key', 'value');
      map2.set('key', 'value');
      set.add(map1).add(map2);
      expect(set.size).assertEqual(2);
      expect(set.has(map1) && set.has(map2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5600
     * @tc.name SetAddTest056
     * @tc.desc Add Set objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<Set<number>>();
      const innerSet1 = new Set<number>([1, 2, 3]);
      const innerSet2 = new Set<number>([1, 2, 3]);
      set.add(innerSet1).add(innerSet2);
      expect(set.size).assertEqual(2);
      expect(set.has(innerSet1) && set.has(innerSet2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5700
     * @tc.name SetAddTest057
     * @tc.desc Add functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<Function>();
      const func1 = () => { return 1; };
      const func2 = () => { return 1; };
      set.add(func1).add(func2);
      expect(set.size).assertEqual(2);
      expect(set.has(func1) && set.has(func2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5800
     * @tc.name SetAddTest058
     * @tc.desc Add class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<MyClass>();
      const instance1 = new MyClass(10);
      const instance2 = new MyClass(10);
      set.add(instance1).add(instance2);
      expect(set.size).assertEqual(2);
      expect(set.has(instance1) && set.has(instance2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_5900
     * @tc.name SetAddTest059
     * @tc.desc Add typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<Uint8Array>();
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([1, 2, 3]);
      set.add(arr1).add(arr2);
      expect(set.size).assertEqual(2);
      expect(set.has(arr1) && set.has(arr2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_6000
     * @tc.name SetAddTest060
     * @tc.desc Add DataView objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<DataView>();
      const buffer1 = new ArrayBuffer(16);
      const buffer2 = new ArrayBuffer(16);
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);
      set.add(view1).add(view2);
      expect(set.size).assertEqual(2);
      expect(set.has(view1) && set.has(view2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_6100
     * @tc.name SetAddTest061
     * @tc.desc Add RegExp with different flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<RegExp>();
      const regex1 = new RegExp('test');
      const regex2 = new RegExp('test','g');
      set.add(regex1).add(regex2);
      expect(set.size).assertEqual(2);
      expect(set.has(regex1) && set.has(regex2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_6200
     * @tc.name SetAddTest062
     * @tc.desc Add Date objects with different times
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<Date>();
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-02');
      set.add(date1).add(date2);
      expect(set.size).assertEqual(2);
      expect(set.has(date1) && set.has(date2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_6400
     * @tc.name SetAddTest064
     * @tc.desc Add BigInt with different values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<bigint>();
      const big1 = 123n;
      const big2 = 456n;
      set.add(big1).add(big2);
      expect(set.size).assertEqual(2);
      expect(set.has(big1) && set.has(big2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7000
     * @tc.name SetAddTest070
     * @tc.desc Add WeakMap objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<WeakMap<Base6, string>>();
      const wm1 = new WeakMap<Base6, string>();
      const wm2 = new WeakMap<Base6, string>();
      const key = {} as Base6;
      wm1.set(key, 'value1');
      wm2.set(key, 'value2');
      set.add(wm1).add(wm2);
      expect(set.size).assertEqual(2);
      expect(set.has(wm1) && set.has(wm2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7100
     * @tc.name SetAddTest071
     * @tc.desc Add very large number of elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest071', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        set.add(i);
      }
      expect(set.size).assertEqual(count);
      expect(set.has(count - 1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7200
     * @tc.name SetAddTest072
     * @tc.desc Add elements to pre-initialized Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.add(4).add(5);
      expect(set.size).assertEqual(5);
      expect(set.has(3) && set.has(5)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7300
     * @tc.name SetAddTest073
     * @tc.desc Add elements to Set created from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const set = new Set<int>(arr);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7400
     * @tc.name SetAddTest074
     * @tc.desc Add elements to Set created from another Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const originalSet = new Set<number>([1, 2, 3]);
      const set = new Set<number>(originalSet);
      set.add(4);
      expect(set.size).assertEqual(4);
      expect(originalSet.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7500
     * @tc.name SetAddTest075
     * @tc.desc Add elements in chain after other operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      set.add(1).add(2);
      set.has(1);
      set.add(3).add(4);
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7600
     * @tc.name SetAddTest076
     * @tc.desc Add same value after deleting it
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('value');
      set.delete('value');
      set.add('value');
      expect(set.size).assertEqual(1);
      expect(set.has('value')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7700
     * @tc.name SetAddTest077
     * @tc.desc Add elements to cleared Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      set.add(4).add(5);
      expect(set.size).assertEqual(2);
      expect(set.has(4) && set.has(5)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_7900
     * @tc.name SetAddTest079
     * @tc.desc Add elements in various ways to same Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {

      const set = new Set<Base7 | string | number | null | undefined>();
      set.add('a');
      set.add(1).add(2);
      const obj = { key: 'value' } as Base7;
      set.add(obj);
      set.add(null).add(undefined);
      expect(set.size).assertEqual(6);
      expect(set.has('a') && set.has(2) && set.has(obj) && set.has(null) && set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8000
     * @tc.name SetAddTest080
     * @tc.desc Add elements to Set and check iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      const elements = ['a', 'b', 'c'];
      elements.forEach((el) => {set.add(el)});
      let count = 0;
      for (const el of set) {
        expect(elements.includes(el)).assertEqual(true);
        count++;
      }
      expect(count).assertEqual(elements.length);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8300
     * @tc.name SetAddTest083
     * @tc.desc Add non-primitive values in large quantity
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest083', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {

      const set = new Set<Base8>();
      const count = 1000;
      const objects: Base8[] = [];

      for (let i = 0; i < count; i++) {
        const obj: Base8 = { id: i };
        objects.push(obj);
        set.add(obj);
      }

      expect(set.size).assertEqual(count);
      expect(set.has(objects[count - 1])).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8400
     * @tc.name SetAddTest084
     * @tc.desc Add elements with same JSON representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {

      const set = new Set<Base9>();
      const obj1 = { a: 1, b: 2 } as Base9;
      const obj2 = { b: 2, a: 1 } as Base9;
      set.add(obj1).add(obj2);

      expect(obj1).assertDeepEquals(obj2);
      expect(set.size).assertEqual(2);
      expect(set.has(obj1) && set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8500
     * @tc.name SetAddTest085
     * @tc.desc Add elements and check with Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('x').add('y').add('z');
      const arr = Array.from(set);
      expect(arr.length).assertEqual(3);
      expect(arr.includes('x') && arr.includes('y') && arr.includes('z')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8600
     * @tc.name SetAddTest086
     * @tc.desc Add elements and check with Set.prototype.values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(10).add(20).add(30);
      const values = Array.from(set.values());
      expect(values.length).assertEqual(3);
      expect(values.includes(10) && values.includes(20) && values.includes(30)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8700
     * @tc.name SetAddTest087
     * @tc.desc Add elements to Set and check with forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<Int | string | boolean | null>();
      const elements = [1, 'two', true, null];
      elements.forEach((el) => {set.add(el)});
      const checked = { count: 0 } as Base10;
      set.forEach((el) => {
        expect(elements.includes(el)).assertEqual(true);
        checked.count++;
      });
      expect(checked.count).assertEqual(elements.length);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8800
     * @tc.name SetAddTest088
     * @tc.desc Add elements and check with Set.prototype.entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>();
      set.add('a').add('b');
      const entries = Array.from(set.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual('a');
      expect(entries[0][1]).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_8900
     * @tc.name SetAddTest089
     * @tc.desc Add elements to nested Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetAddTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const outerSet = new Set<Set<number>>();
      const innerSet1 = new Set<number>();
      const innerSet2 = new Set<number>();

      innerSet1.add(1).add(2);
      innerSet2.add(3).add(4);

      outerSet.add(innerSet1).add(innerSet2);

      expect(outerSet.size).assertEqual(2);
      expect(innerSet1.size).assertEqual(2);
      expect(innerSet2.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_9200
     * @tc.name SetAddTest092
     * @tc.desc Add elements and check size after various operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();

      set.add(1);
      expect(set.size).assertEqual(1);

      set.add(2).add(3);
      expect(set.size).assertEqual(3);

      set.delete(2);
      expect(set.size).assertEqual(2);

      set.add(3);
      expect(set.size).assertEqual(2);

      set.add(4);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_9300
     * @tc.name SetAddTest093
     * @tc.desc Add elements with same string representation but different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set = new Set<string | number | bigint>();
      set.add('123').add(123).add(123n);

      expect(set.size).assertEqual(3);
      expect(set.has('123') && set.has(123) && set.has(123n)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_9500
     * @tc.name SetAddTest095
     * @tc.desc Add element and then replace with similar element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<Base8>();
      const obj1 = { id: 1 } as Base8;
      set.add(obj1);

      const obj2 = { id: 1 } as Base8;
      set.delete(obj1);
      set.add(obj2);

      expect(set.size).assertEqual(1);
      expect(set.has(obj1)).assertEqual(false);
      expect(set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ADD_TEST_9800
     * @tc.name SetAddTest098
     * @tc.desc Add elements to multiple Sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetAddTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const set1 = new Set<string>();
      const set2 = new Set<string>();
      const commonElement = 'shared';

      set1.add('a').add(commonElement);
      set2.add('b').add(commonElement);

      expect(set1.size).assertEqual(2);
      expect(set2.size).assertEqual(2);
      expect(set1.has(commonElement) && set2.has(commonElement)).assertEqual(true);
    });

  });
}