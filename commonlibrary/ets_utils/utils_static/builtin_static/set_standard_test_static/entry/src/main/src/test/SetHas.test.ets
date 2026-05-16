
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


interface BaseI{}

interface Base1{
  num1: boolean,
  str2: boolean,
  boolTrue: boolean,
  nullVal: boolean,
  num2: boolean,
  undef: boolean
}

interface Base2{
  id: number
}

interface Base4{
  id: number
}

interface Base5{
  self?: Base5 | null;
}

interface Base6{
  b: number
}
interface Base7{
  a: Base6
}

interface Base8{
  value: number
}

class MyClass {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}
interface Base9{
  key: string
}
interface Base10{
  key: string
}
interface Base11{
  tagName: string,
  id: string
}

interface Base14{
  c: number
}
interface Base15{
  a: number,
  b: Base14
}

interface Base16{
  value: number
}
interface Base18{
  a: number,
  b: number
}

interface Base19{
  id: number,
  value: string
}

export default function SetHasTest() {
  describe('SetHasTest', () => {
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
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0100
     * @tc.name SetHasTest001
     * @tc.desc Check existing string value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      const result = set.has('banana');

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0200
     * @tc.name SetHasTest002
     * @tc.desc Check non-existing string value, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['apple', 'banana']);
      const result = set.has('orange');

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0300
     * @tc.name SetHasTest003
     * @tc.desc Check existing number value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([10, 20, 30]);
      const result = set.has(20);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0400
     * @tc.name SetHasTest004
     * @tc.desc Check non-existing number value, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([10, 20]);
      const result = set.has(30);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0500
     * @tc.name SetHasTest005
     * @tc.desc Check existing boolean value, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>([true, false, true]);
      const result = set.has(false);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0600
     * @tc.name SetHasTest006
     * @tc.desc Check empty Set for any value, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {

      const set = new Set<string | number | BaseI>();
      const result1 = set.has('any');
      const result2 = set.has(123);
      const result3 = set.has({} as BaseI);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0700
     * @tc.name SetHasTest007
     * @tc.desc Check the only element in Set, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['only-element']);
      const result = set.has('only-element');

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0800
     * @tc.name SetHasTest008
     * @tc.desc Check null value in Set, return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<null | int>([null, 1, 2]);
      const result = set.has(null);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_0900
     * @tc.name SetHasTest009
     * @tc.desc Check undefined value in Set, return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<undefined | string>([undefined, 'a', 'b']);
      const result = set.has(undefined);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1000
     * @tc.name SetHasTest010
     * @tc.desc Check multiple values in Set, verify results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number | string | boolean | null | undefined>([1, '2', true, null]);

      const results = {
        num1: set.has(1),
        str2: set.has('2'),
        boolTrue: set.has(true),
        nullVal: set.has(null),
        num2: set.has(2),
        undef: set.has(undefined)
      } as Base1;

      expect(results.num1).assertEqual(true);
      expect(results.str2).assertEqual(true);
      expect(results.boolTrue).assertEqual(true);
      expect(results.nullVal).assertEqual(true);
      expect(results.num2).assertEqual(false);
      expect(results.undef).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1100
     * @tc.name SetHasTest011
     * @tc.desc Check NaN (treated as equal to itself), return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([NaN, 1, 2]);
      const result1 = set.has(NaN);
      const result2 = set.has(Number('invalid'));

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1200
     * @tc.name SetHasTest012
     * @tc.desc Check 0 and -0 (treated as equal), return true for both
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([0, 100]);
      const result1 = set.has(-0);
      const result2 = set.has(0);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1400
     * @tc.name SetHasTest014
     * @tc.desc Check BigInt (same value is equal), return true for same value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const big1 = 123n;
      const big2 = 123n;
      const set = new Set<bigint | number>([big1]);
      const result1 = set.has(big1);
      const result2 = set.has(big2);
      const result3 = set.has(123);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1500
     * @tc.name SetHasTest015
     * @tc.desc Check object by same reference, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const obj = { id: 1 } as Base2;
      const set = new Set<Base2>([obj, { id: 2 } as Base2]);
      const result1 = set.has(obj);
      const result2 = set.has({ id: 1 });

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1700
     * @tc.name SetHasTest017
     * @tc.desc Check Date object by same reference, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date('2024-01-01');
      const set = new Set<Date>([date, new Date('2024-01-02')]);
      const result1 = set.has(date);
      const result2 = set.has(new Date('2024-01-01'));

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1800
     * @tc.name SetHasTest018
     * @tc.desc Check RegExp object by same reference, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex = new RegExp('test');
      const set = new Set<RegExp>([regex, new RegExp('test','g')]);
      const result1 = set.has(regex);
      const result2 = set.has(new RegExp('test'));

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_1900
     * @tc.name SetHasTest019
     * @tc.desc Check function by same reference, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func = () => {};
      const set = new Set<() => void>([func, () => {}]);
      const result1 = set.has(func);
      const result2 = set.has(() => {});

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2000
     * @tc.name SetHasTest020
     * @tc.desc Check string and number with same value (different types), return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string | boolean | number>(['123', true]);
      const result1 = set.has(123);
      const result2 = set.has(1);

      expect(result1).assertEqual(false);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2100
     * @tc.name SetHasTest021
     * @tc.desc Check value after modifying object properties (reference unchanged), return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj = { id: 1 } as Base4;
      const set = new Set<Base4>([obj]);

      obj.id = 999;
      const result = set.has(obj);

      expect(result).assertEqual(true);
      expect(obj.id).assertEqual(999);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2200
     * @tc.name SetHasTest022
     * @tc.desc Check value after adding to Set, return true immediately
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      set.add('new-value');
      const result = set.has('new-value');

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2300
     * @tc.name SetHasTest023
     * @tc.desc Check value after deleting from Set, return false immediately
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['value']);
      set.delete('value');
      const result = set.has('value');

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2400
     * @tc.name SetHasTest024
     * @tc.desc Check large Set (1000 elements), verify has() correctness
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const result1 = set.has(500);
      const result2 = set.has(999);
      const result3 = set.has(1000);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2600
     * @tc.name SetHasTest026
     * @tc.desc Pass multiple parameters to has() (only first is used)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);
      const result = set.has(2);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2800
     * @tc.name SetHasTest028
     * @tc.desc Check Set with circular reference object, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj = { self: null } as Base5;
      obj.self = obj;

      const set = new Set<Base5>([obj]);
      const result = set.has(obj);

      expect(result).assertEqual(true);
      expect(obj.self).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_2900
     * @tc.name SetHasTest029
     * @tc.desc Check Set with nested objects (reference comparison), return true for same reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const nestedObj = { a: { b: 1 } } as Base7;
      const set = new Set<Base7>([nestedObj]);
      const result1 = set.has(nestedObj);
      const result2 = set.has({ a: { b: 1 } });

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3300
     * @tc.name SetHasTest033
     * @tc.desc Check has() after clearing the Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();

      expect(set.has(2)).assertEqual(false);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3400
     * @tc.name SetHasTest034
     * @tc.desc Check very large numbers (beyond safe integer)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER + 1;
      const set = new Set<number>([largeNum]);

      expect(set.has(largeNum)).assertEqual(true);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3500
     * @tc.name SetHasTest035
     * @tc.desc Check has() with same string values but different encodings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const str1 = 'café';
      const str2 = 'cafe\u0301';
      const set = new Set<string>([str1]);

      expect(set.has(str1)).assertEqual(true);
      expect(set.has(str2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3600
     * @tc.name SetHasTest036
     * @tc.desc Check has() with empty string and whitespace
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['', ' ', '\t', '\n']);

      expect(set.has('')).assertEqual(true);
      expect(set.has(' ')).assertEqual(true);
      expect(set.has('\t')).assertEqual(true);
      expect(set.has('\n')).assertEqual(true);
      expect(set.has('  ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3800
     * @tc.name SetHasTest038
     * @tc.desc Check has() with typed array instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = new Uint8Array([1, 2, 3]);
      const set = new Set<Uint8Array>([arr]);

      expect(set.has(arr)).assertEqual(true);
      expect(set.has(new Uint8Array([1, 2, 3]))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_3900
     * @tc.name SetHasTest039
     * @tc.desc Check has() with Map instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map = new Map<string,int>([['a', 1]]);
      const set = new Set<Map<string,int>>([map]);

      expect(set.has(map)).assertEqual(true);
      expect(set.has(new Map<string,int>([['a', 1]]))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4000
     * @tc.name SetHasTest040
     * @tc.desc Check has() with Set instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const innerSet = new Set<int>([1, 2]);
      const outerSet = new Set<Set<int>>([innerSet]);

      expect(outerSet.has(innerSet)).assertEqual(true);
      expect(outerSet.has(new Set<int>([1, 2]))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4100
     * @tc.name SetHasTest041
     * @tc.desc Check has() with different Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>(['a', 'A', 'α', 'β', 'あ', 'ア']);

      expect(set.has('a')).assertEqual(true);
      expect(set.has('A')).assertEqual(true);
      expect(set.has('α')).assertEqual(true);
      expect(set.has('b')).assertEqual(false);
      expect(set.has('あ')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4300
     * @tc.name SetHasTest043
     * @tc.desc Check has() with regex flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex1 = new RegExp('test');
      const regex2 = new RegExp('test','i');
      const regex3 = new RegExp('test','g');
      const set = new Set<RegExp>([regex1, regex2, regex3]);

      expect(set.has(new RegExp('test'))).assertEqual(false);
      expect(set.has(regex1)).assertEqual(true);
      expect(set.has(regex2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4400
     * @tc.name SetHasTest044
     * @tc.desc Check has() with date objects of same time value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date1 = new Date(2024, 0, 1);
      const date2 = new Date(2024, 0, 1);
      const set = new Set<Date>([date1]);

      expect(set.has(date1)).assertEqual(true);
      expect(set.has(date2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4500
     * @tc.name SetHasTest045
     * @tc.desc Check has() with NaN in various forms
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([NaN]);

      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(Number('not-a-number'))).assertEqual(true);
      expect(set.has(Infinity - Infinity)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4600
     * @tc.name SetHasTest046
     * @tc.desc Check has() with different BigInt values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<bigint | number>([123n, 456n]);

      expect(set.has(123n)).assertEqual(true);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
      expect(set.has(789n)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4800
     * @tc.name SetHasTest048
     * @tc.desc Check has() with null vs undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_4900
     * @tc.name SetHasTest049
     * @tc.desc Check has() with positive and negative infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([Infinity, -Infinity]);

      expect(set.has(Infinity)).assertEqual(true);
      expect(set.has(-Infinity)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_5000
     * @tc.name SetHasTest050
     * @tc.desc Check has() with various numeric types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([123, 123.45, 0x7B, 0o173, 0b1111011]);

      expect(set.has(123)).assertEqual(true);
      expect(set.has(123.45)).assertEqual(true);
      expect(set.has(0x7B)).assertEqual(true);
      expect(set.has(0o173)).assertEqual(true);
      expect(set.has(0b1111011)).assertEqual(true);
      expect(set.has(124)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_5500
     * @tc.name SetHasTest055
     * @tc.desc Check has() with very large string values
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest055', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const largeStr = 'a'.repeat(1024 * 1024);
      const set = new Set<string>([largeStr]);

      expect(set.has(largeStr)).assertEqual(true);
      expect(set.has(largeStr + 'b')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_5700
     * @tc.name SetHasTest057
     * @tc.desc Check has() with WeakMap instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const wm = new WeakMap<BaseI, string>();
      const obj = {} as BaseI;
      wm.set(obj, 'value');
      const set = new Set<WeakMap<BaseI, string>>([wm]);

      expect(set.has(wm)).assertEqual(true);
      expect(set.has(new WeakMap<BaseI, string>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_5800
     * @tc.name SetHasTest058
     * @tc.desc Check has() with WeakSet instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ws = new WeakSet<BaseI>();
      const obj = {} as BaseI;
      ws.add(obj);
      const set = new Set<WeakSet<BaseI>>([ws]);

      expect(set.has(ws)).assertEqual(true);
      expect(set.has(new WeakSet<BaseI>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6000
     * @tc.name SetHasTest060
     * @tc.desc Check has() with promises
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const promise = Promise.resolve();
      const set = new Set<Promise<void>>([promise]);

      expect(set.has(promise)).assertEqual(true);
      expect(set.has(Promise.resolve())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6100
     * @tc.name SetHasTest061
     * @tc.desc Check has() with boolean true and false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6200
     * @tc.name SetHasTest062
     * @tc.desc Check has() with single character strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['a', 'b', 'c']);

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(true);
      expect(set.has('d')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6300
     * @tc.name SetHasTest063
     * @tc.desc Check has() with multi-line strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str = 'line1\nline2\nline3';
      const set = new Set<string>([str]);

      expect(set.has(str)).assertEqual(true);
      expect(set.has('line1\nline2')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6400
     * @tc.name SetHasTest064
     * @tc.desc Check has() with negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([-1, -2, -3]);

      expect(set.has(-1)).assertEqual(true);
      expect(set.has(-2)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6500
     * @tc.name SetHasTest065
     * @tc.desc Check has() with floating point numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<double>([1.5, 2.5, 3.5]);

      expect(set.has(1.5)).assertEqual(true);
      expect(set.has(2.5)).assertEqual(true);
      expect(set.has(3.0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6600
     * @tc.name SetHasTest066
     * @tc.desc Check has() after multiple add operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('a');
      set.add('b');
      set.add('c');

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(true);
      expect(set.has('c')).assertEqual(true);
      expect(set.has('d')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6700
     * @tc.name SetHasTest067
     * @tc.desc Check has() after add and delete operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      set.delete('b');
      set.add('d');

      expect(set.has('a')).assertEqual(true);
      expect(set.has('b')).assertEqual(false);
      expect(set.has('d')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6800
     * @tc.name SetHasTest068
     * @tc.desc Check has() with mixed case strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['Apple', 'Banana', 'Cherry']);

      expect(set.has('Apple')).assertEqual(true);
      expect(set.has('apple')).assertEqual(false);
      expect(set.has('BANANA')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_6900
     * @tc.name SetHasTest069
     * @tc.desc Check has() with zero and positive numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([0, 1, 2, 3]);

      expect(set.has(0)).assertEqual(true);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7000
     * @tc.name SetHasTest070
     * @tc.desc Check has() with various falsy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetHasTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean| number  | string | null | undefined>([false, 0, '', null, undefined, NaN]);

      expect(set.has(false)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has('')).assertEqual(true);
      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
      expect(set.has(NaN)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7100
     * @tc.name SetHasTest071
     * @tc.desc Check has() with string vs number comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string | number>(['123']);

      expect(set.has('123')).assertEqual(true);
      expect(set.has(123)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7200
     * @tc.name SetHasTest072
     * @tc.desc Check has() with boolean vs number comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<boolean | number>([true, false]);

      expect(set.has(true)).assertEqual(true);
      expect(set.has(1)).assertEqual(false);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7300
     * @tc.name SetHasTest073
     * @tc.desc Check has() with number vs BigInt comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number | BigInt>([123, 456n]);

      expect(set.has(123)).assertEqual(true);
      expect(set.has(123n)).assertEqual(false);
      expect(set.has(456n)).assertEqual(true);
      expect(set.has(456)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7400
     * @tc.name SetHasTest074
     * @tc.desc Check has() with object vs primitive comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const set = new Set<Base8 | string>([{ value: 123 } as Base8, '123']);

      expect(set.has({ value: 123 } as Base8)).assertEqual(false);
      expect(set.has('123')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7500
     * @tc.name SetHasTest075
     * @tc.desc Check has() with array vs string comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string | string[]>([['a', 'b'], 'ab']);

      expect(set.has(['a', 'b'])).assertEqual(false);
      expect(set.has('ab')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7600
     * @tc.name SetHasTest076
     * @tc.desc Check has() with regex vs string comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string | RegExp>([new RegExp('test'), 'test']);

      expect(set.has(new RegExp('test'))).assertEqual(false);
      expect(set.has('test')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7700
     * @tc.name SetHasTest077
     * @tc.desc Check has() with date vs number comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date(2024, 0, 1);
      const timestamp = date.getTime();
      const set = new Set<Date | number>([date]);

      expect(set.has(date)).assertEqual(true);
      expect(set.has(timestamp)).assertEqual(false);
      expect(set.has(new Date(timestamp))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_7900
     * @tc.name SetHasTest079
     * @tc.desc Check has() with null vs undefined comparison
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<null | undefined>([null, undefined]);

      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_8000
     * @tc.name SetHasTest080
     * @tc.desc Check has() with NaN vs other falsy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<boolean| number  | string | null | undefined>([NaN, 0, '', false, null, undefined]);

      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has('')).assertEqual(true);
      expect(set.has(false)).assertEqual(true);
      expect(set.has(null)).assertEqual(true);
      expect(set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_8300
     * @tc.name SetHasTest083
     * @tc.desc Check has() with class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {


      const instance1 = new MyClass(123);
      const instance2 = new MyClass(123);
      const set = new Set<MyClass>([instance1]);

      expect(set.has(instance1)).assertEqual(true);
      expect(set.has(instance2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_8700
     * @tc.name SetHasTest087
     * @tc.desc Check has() with objects in different scopes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = (() => { return { value: 123 } as Base8; })();
      const set = new Set<Base8>([obj]);
      expect(set.has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9100
     * @tc.name SetHasTest091
     * @tc.desc Check has() performance with 10,000 elements
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest091', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      const target = 5000;

      for (let i = 0; i < 10000; i++) {
        set.add(i);
      }

      const start = new Date().getTime();
      const result = set.has(target);
      const end = new Date().getTime();

      expect(result).assertEqual(true);
      expect(end - start).assertLess(5);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9200
     * @tc.name SetHasTest092
     * @tc.desc Check has() with 1000 unique strings
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest092', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      const uniqueStrings: string[] = [];

      for (let i = 0; i < 1000; i++) {
        const str = `string-${i}-${Math.random()}`;
        uniqueStrings.push(str);
        set.add(str);
      }

      const randomIndex = Math.floor(Math.random() * 1000);
      expect(set.has(uniqueStrings[randomIndex as int])).assertEqual(true);
      expect(set.has(`non-existent-${Math.random()}`)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9300
     * @tc.name SetHasTest093
     * @tc.desc Check has() with many similar objects
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest093', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {

      const set = new Set<Base19>();
      const objects: Base19[] = [];

      for (let i = 0; i < 1000; i++) {
        const obj = { id: i, value: 'same' } as Base19;
        objects.push(obj);
        set.add(obj);
      }

      const targetObj = objects[500];
      expect(set.has(targetObj)).assertEqual(true);

      expect(set.has({ id: 500, value: 'same' })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9500
     * @tc.name SetHasTest095
     * @tc.desc Check has() after many add/delete operations
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest095', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();

      for (let i = 0; i < 10000; i++) {
        set.add(i);
        if (i % 2 === 0) {
          set.delete(i);
        }
      }

      expect(set.has(1)).assertEqual(true);
      expect(set.has(999)).assertEqual(true);

      expect(set.has(0)).assertEqual(false);
      expect(set.has(1000)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9700
     * @tc.name SetHasTest097
     * @tc.desc Check has() with large numbers of BigInts
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest097', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<bigint>();
      const target = 12345678901234567890n;

      for (let i = 0; i < 1000; i++) {
        set.add(BigInt(i) * 1000000000000000000n);
      }
      set.add(target);

      expect(set.has(target)).assertEqual(true);
      expect(set.has(target + 1n)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_9900
     * @tc.name SetHasTest099
     * @tc.desc Check has() with many repeated add attempts
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest099', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      const target = 'repeated-value';

      for (let i = 0; i < 1000; i++) {
        set.add(target);
      }

      expect(set.size).assertEqual(1);
      expect(set.has(target)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10000
     * @tc.name SetHasTest100
     * @tc.desc Check has() with concurrent modifications
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number | string>();
      const testValue = 'concurrent-test';

      for (let i = 0; i < 500; i++) {
        set.add(i);
      }

      set.add(testValue);

      expect(set.has(testValue)).assertEqual(true);

      for (let i = 0; i < 250; i++) {
        set.delete(i);
      }

      expect(set.has(testValue)).assertEqual(true);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(300)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10100
     * @tc.name SetHasTest101
     * @tc.desc Check has() with various whitespace characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>([' ', '\t', '\n', '\r', '\f', '\v', '\u00A0']);

      expect(set.has(' ')).assertEqual(true);
      expect(set.has('\t')).assertEqual(true);
      expect(set.has('\n')).assertEqual(true);
      expect(set.has('  ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10200
     * @tc.name SetHasTest102
     * @tc.desc Check has() with control characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>([
        '\x00',
        '\x01',
        '\x1F',
        '\x7F'
      ]);

      expect(set.has('\x00')).assertEqual(true);
      expect(set.has('\x01')).assertEqual(true);
      expect(set.has('\x7F')).assertEqual(true);
      expect(set.has('\x02')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10300
     * @tc.name SetHasTest103
     * @tc.desc Check has() with Unicode emojis
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>(['😊', '❤️', '👍', '🔥', '🇺🇸']);

      expect(set.has('😊')).assertEqual(true);
      expect(set.has('❤️')).assertEqual(true);
      expect(set.has('🎉')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10400
     * @tc.name SetHasTest104
     * @tc.desc Check has() with Unicode combining characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>(['é', 'e\u0301', 'café', 'cafe\u0301']);

      expect(set.has('é')).assertEqual(true);
      expect(set.has('e\u0301')).assertEqual(true);
      expect(set.has('café')).assertEqual(true);
      expect(set.has('cafe\u0301')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10500
     * @tc.name SetHasTest105
     * @tc.desc Check has() with zero-width characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>(['\u200B', '\u200C', '\u200D', '\uFEFF']);

      expect(set.has('\u200B')).assertEqual(true);
      expect(set.has('\u200C')).assertEqual(true);
      expect(set.has('\u200E')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10600
     * @tc.name SetHasTest106
     * @tc.desc Check has() with various number formats
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([123, 123.0, 123e0, 0.123e3]);
      expect(set.has(123)).assertEqual(true);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_10700
     * @tc.name SetHasTest107
     * @tc.desc Check has() with special number values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetHasTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([Infinity, -Infinity, NaN, 0, -0]);

      expect(set.has(Infinity)).assertEqual(true);
      expect(set.has(-Infinity)).assertEqual(true);
      expect(set.has(NaN)).assertEqual(true);
      expect(set.has(0)).assertEqual(true);
      expect(set.has(-0)).assertEqual(true);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_11100
     * @tc.name SetHasTest111
     * @tc.desc Check has() with objects used as Map keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj = { key: 'value' } as Base9;
      const map = new Map<Base9, string>();
      map.set(obj, 'map-value');
      const set = new Set<Base9>([obj]);
      expect(set.has(obj as Base9)).assertEqual(true);
      expect(set.has((map.keys().next().value) as Base9)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_11200
     * @tc.name SetHasTest112
     * @tc.desc Check has() with objects in WeakMap
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj = { key: 'value' } as Base10;
      const wm = new WeakMap<Base10, string>();
      wm.set(obj, 'weakmap-value');
      const set = new Set<Base10>([obj]);

      expect(set.has(obj as Base10)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_11300
     * @tc.name SetHasTest113
     * @tc.desc Check has() with objects in WeakSet
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { key: 'value' } as Base10;
      const ws = new WeakSet<Base10>();
      ws.add(obj);
      const set = new Set<Base10>([obj]);

      expect(set.has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_11400
     * @tc.name SetHasTest114
     * @tc.desc Check has() with DOM elements (simulated)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const elem1 = { tagName: 'DIV', id: 'test1' } as Base11;
      const elem2 = { tagName: 'DIV', id: 'test1' } as Base11;
      const set = new Set<Base11>([elem1]);

      expect(set.has(elem1)).assertEqual(true);
      expect(set.has(elem2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_11900
     * @tc.name SetHasTest119
     * @tc.desc Check has() with objects in different realms (simulated)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj1 = { value: 123 } as Base16;

      const obj2 = { value: 123 } as Base16;

      const set = new Set<Base16>([obj1]);

      expect(set.has(obj1)).assertEqual(true);
      expect(set.has(obj2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_12100
     * @tc.name SetHasTest121
     * @tc.desc Check has() called with no arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<undefined | null | number >([undefined, null, 1]);
      expect(set.has(undefined)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_HAS_TEST_12200
     * @tc.name SetHasTest122
     * @tc.desc Check has() called with too many arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetHasTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);

      expect(set.has(2)).assertEqual(true);
      expect(set.has(4)).assertEqual(false);
    });

  });
}