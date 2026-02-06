
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
import buffer from '@ohos.buffer';

export default function SetConstructorTest() {
  describe('SetConstructorTest', () => {
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
     * @tc.number SUB_BUILTINS_SET_TEST_0100
     * @tc.name SetConstructorTest001
     * @tc.desc Calling new Set() with no parameters should create an empty Set object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<object>();
      expect(s.size).assertEqual(0);
      expect(s instanceof Set).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_0400
     * @tc.name SetConstructorTest004
     * @tc.desc Passing null as parameter should create an empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<object>(null);
      expect(s.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1000
     * @tc.name SetConstructorTest010
     * @tc.desc Passing empty iterable object should create an empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<string>([] as string[]);
      expect(s.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1500
     * @tc.name SetConstructorTest015
     * @tc.desc Set should distinguish between 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<int>([0, -0]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1600
     * @tc.name SetConstructorTest016
     * @tc.desc Passing Date objects with same time should be considered equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const s = new Set<Date>([date, new Date(date.getTime())]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1700
     * @tc.name SetConstructorTest017
     * @tc.desc Passing same Date object twice should be deduplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const s = new Set<Date>([date, date]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1800
     * @tc.name SetConstructorTest018
     * @tc.desc Set should handle empty string and whitespace string as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<string>(['', ' ']);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_1900
     * @tc.name SetConstructorTest019
     * @tc.desc Set should store different regex patterns as separate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<RegExp>([new RegExp('a'), new RegExp('a'), new RegExp('b')]);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2600
     * @tc.name SetConstructorTest026
     * @tc.desc Set should distinguish between number and string representations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<int | string>([1, '1']);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2800
     * @tc.name SetConstructorTest028
     * @tc.desc Set should handle same array reference correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1];
      const s = new Set<Array<int>>([arr, arr]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_2900
     * @tc.name SetConstructorTest029
     * @tc.desc Set should handle iterable with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<int | string | boolean>([1, '1', true, 1, false, true]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3000
     * @tc.name SetConstructorTest030
     * @tc.desc Set created from another Set should not reference the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s1 = new Set<int>([1, 2, 3]);
      const s2 = new Set<int>(s1);
      s1.delete(1);
      expect(s2.has(1)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3500
     * @tc.name SetConstructorTest035
     * @tc.desc Set should process iterable with null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<null | undefined>([null, null, undefined, null]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3700
     * @tc.name SetConstructorTest037
     * @tc.desc Set should handle sparse arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sparseArray = [1,undefined, 2,undefined, 1];
      const s = new Set<int | undefined>(sparseArray);
      expect(s.size).assertEqual(3);
      expect(s.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_3800
     * @tc.name SetConstructorTest038
     * @tc.desc Set should not modify the original iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const original = [1, 2, 3];
      const s = new Set<int>(original);
      s.delete(1);
      expect(JSON.stringify(original)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_4300
     * @tc.name SetConstructorTest043
     * @tc.desc Set should handle RegExp objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex1 = new RegExp('test');
      const regex2 = new RegExp('test');
      const regex3 = regex1;
      const s = new Set<RegExp>([regex1, regex2, regex3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5000
     * @tc.name SetConstructorTest050
     * @tc.desc Set should handle Set entries correctly when passed as iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s1 = new Set<string>(['a', 'b']);
      const s2 = new Set<[string, string] | undefined>(s1.entries());
      expect(s2.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5100
     * @tc.name SetConstructorTest051
     * @tc.desc Set should process iterable with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<number>([Infinity, Infinity, -Infinity, Infinity]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5200
     * @tc.name SetConstructorTest052
     * @tc.desc Set should distinguish between Infinity and other numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<number>([Infinity, 1000000, Infinity]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_5400
     * @tc.name SetConstructorTest054
     * @tc.desc Set should handle iterable with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 1);
      const date3 = date1;
      const s = new Set<Date>([date1, date2, date3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6200
     * @tc.name SetConstructorTest062
     * @tc.desc Set should handle BigInt and Number with same value as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<int | bigint>([1n, 1, 2n, 2]);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6300
     * @tc.name SetConstructorTest063
     * @tc.desc Set should handle multiple NaN values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<number>([NaN, Number('not a number'), NaN]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_6900
     * @tc.name SetConstructorTest069
     * @tc.desc Set should handle Number objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const numObj1 = new Number(10);
      const numObj2 = new Number(10);
      const s = new Set<number>([numObj1, numObj2, 10, 10]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7000
     * @tc.name SetConstructorTest070
     * @tc.desc Set should handle String objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const strObj1 = new String('test');
      const strObj2 = new String('test');
      const s = new Set<string>([strObj1, strObj2, 'test', 'test']);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7100
     * @tc.name SetConstructorTest071
     * @tc.desc Set should handle Boolean objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const boolObj1 = new Boolean(true);
      const boolObj2 = new Boolean(true);
      const s = new Set<boolean>([boolObj1, boolObj2, true, true]);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7200
     * @tc.name SetConstructorTest072
     * @tc.desc Set should handle empty Buffer objects correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buf1 = buffer.from('');
      const buf2 = buffer.from('');
      const s = new Set<buffer.Buffer>([buf1, buf2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7300
     * @tc.name SetConstructorTest073
     * @tc.desc Set should handle Buffer objects with same content as different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buf1 = buffer.from('test');
      const buf2 = buffer.from('test');
      const s = new Set<buffer.Buffer>([buf1, buf2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_7900
     * @tc.name SetConstructorTest079
     * @tc.desc Set should handle iterable with random unique values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const uniqueNumbers = new Set<number>();
      while (uniqueNumbers.size < 5) {
        uniqueNumbers.add(Math.floor(Math.random() * 100));
      }
      const s = new Set<number>(uniqueNumbers);
      expect(s.size).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_8900
     * @tc.name SetConstructorTest089
     * @tc.desc Set should handle very long strings as values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest089', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const longStr = 'a'.repeat(10000);
      const s = new Set<string>([longStr, longStr, 'b'.repeat(10000)]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9000
     * @tc.name SetConstructorTest090
     * @tc.desc Set should handle numbers with high precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const num1 = 0.1 + 0.2;
      const num2 = 0.3;
      const s = new Set<double>([num1, num2]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9300
     * @tc.name SetConstructorTest093
     * @tc.desc Set should handle iterable with various whitespace characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<string>([' ', '\t', '\n', '\r', ' ', '\t']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9400
     * @tc.name SetConstructorTest094
     * @tc.desc Set should handle Unicode characters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<string>(['a', 'á', 'à', 'a', 'á']);
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9500
     * @tc.name SetConstructorTest095
     * @tc.desc Set should handle surrogate pairs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const emoji1 = '😊';
      const emoji2 = '😊';
      const emoji3 = '😂';
      const s = new Set<string>([emoji1, emoji2, emoji3]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9600
     * @tc.name SetConstructorTest096
     * @tc.desc Set should handle iterable with mixed Unicode and ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<string>(['a', 'á', 'b', 'a', '😂']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9700
     * @tc.name SetConstructorTest097
     * @tc.desc Set should handle iterable with zero-width characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zeroWidthSpace = '\u200B';
      const zeroWidthJoiner = '\u200D';
      const s = new Set<string>([zeroWidthSpace, zeroWidthJoiner, zeroWidthSpace]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9800
     * @tc.name SetConstructorTest098
     * @tc.desc Set should handle iterable with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetConstructorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s = new Set<string>([String.fromCharCode(0), String.fromCharCode(1), String.fromCharCode(0)]);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_9900
     * @tc.name SetConstructorTest099
     * @tc.desc Set should handle iterable with mixed letter cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<string>(['A', 'a', 'B', 'b', 'A']);
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_TEST_10000
     * @tc.name SetConstructorTest100
     * @tc.desc Set should handle iterable with numeric strings and numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetConstructorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const s = new Set<string | int>(['1', 1, '2', 2, '1']);
      expect(s.size).assertEqual(4);
    });


  });
}