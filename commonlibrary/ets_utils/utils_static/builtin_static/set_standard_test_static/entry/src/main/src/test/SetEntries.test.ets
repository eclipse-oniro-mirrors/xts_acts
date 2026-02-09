
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
  id: number
}

interface Base1{
  self: null | Base1
}

interface Base2{
  b: number;
}
interface Base3{
  a: Base2;
}

interface Base4{
  a: number
}

class MySet<number> extends Set<number> {
  constructor(values: number[]) {
    super(values);
  }
}

class MyClass {
  id: number;
  constructor(id: number) {
    this.id = id;
  }
}


class CustomError extends Error {}


export default function setEntriesTest() {
  describe('SetEntriesTest', () => {
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
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0100
     * @tc.name SetEntriesTest001
     * @tc.desc Iterate non-empty Set with strings, verify each entry is [value, value]
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      const iterator = set.entries();
      const entries: [String, String][]|undefined = [];

      let result = iterator.next();
      while (!result.done) {
        entries.push((result.value) as [String, String]);
        result = iterator.next();
      }

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', 'a'], ['b', 'b'], ['c', 'c']]));
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0200
     * @tc.name SetEntriesTest002
     * @tc.desc Iterate non-empty Set with numbers, verify entry format
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>([10, 20, 30]);
      const entries = Array.from(set.entries());
      expect(entries.every(entry => entry[0] === entry[1])).assertEqual(true);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[10, 10], [20, 20], [30, 30]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0300
     * @tc.name SetEntriesTest003
     * @tc.desc Iterate empty Set, verify iterator is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      const iterator = set.entries();
      const result = iterator.next();

      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
      expect(Array.from(set.entries()).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0400
     * @tc.name SetEntriesTest004
     * @tc.desc Verify iteration order matches insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('third');
      set.add('first');
      set.add('second');

      const entries = Array.from(set.entries());
      const values = entries.map((entry) : [String, String] => entry);

      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify( [ [ 'third', 'third' ], [ 'first', 'first' ], [ 'second', 'second' ] ]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0500
     * @tc.name SetEntriesTest005
     * @tc.desc Verify each call to entries() returns new iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([1, 2]);
      const iterator1 = set.entries();
      const iterator2 = set.entries();

      iterator1.next();

      expect(JSON.stringify(iterator1.next().value)).assertDeepEquals(JSON.stringify([2, 2]));
      expect(JSON.stringify(iterator2.next().value)).assertDeepEquals(JSON.stringify([1, 1]));
      expect(iterator1 !== iterator2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0600
     * @tc.name SetEntriesTest006
     * @tc.desc Iterate Set with boolean values, verify entry format
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>([true, false, true]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[true, true], [false, false]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0700
     * @tc.name SetEntriesTest007
     * @tc.desc Iterate Set with null and undefined, verify entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<null | undefined >([null, undefined, null]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[null, null], [undefined, undefined]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0800
     * @tc.name SetEntriesTest008
     * @tc.desc Use for...of loop to iterate entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['x', ' y', 'z']);
      const entries: [string, string][] = [];

      for (const entry of set.entries()) {
        entries.push(entry);
      }

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([["x","x"],[" y"," y"],["z","z"]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0900
     * @tc.name SetEntriesTest009
     * @tc.desc Iterate Set with single element, verify entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['only-element']);
      const iterator = set.entries();
      const firstEntry: [String, String] | undefined = iterator.next().value;
      const done = iterator.next().done;
      expect(JSON.stringify(firstEntry)).assertDeepEquals(JSON.stringify(['only-element', 'only-element']));
      expect(done).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1000
     * @tc.name SetEntriesTest010
     * @tc.desc Verify entries() ignores passed parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([1, 2, 3]);
      const iterator = set.entries();
      const entries = Array.from(iterator);

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1], [2, 2], [3, 3]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1100
     * @tc.name SetEntriesTest011
     * @tc.desc Iterate Set with NaN (treated as equal to itself)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([NaN, 1, NaN]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[NaN, NaN], [1, 1]]));
      expect(entries.length).assertEqual(2);
      expect(Number.isNaN(entries[0][0])).assertEqual(true);
      expect(Number.isNaN(entries[0][1])).assertEqual(true);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1200
     * @tc.name SetEntriesTest012
     * @tc.desc Iterate Set with 0 and -0 (treated as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([0, -0, 100]);
      const entries = Array.from(set.entries());

      expect(entries[0].toString()).assertEqual([0, 0].toString());
      expect(entries[1].toString()).assertEqual([100, 100].toString());
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][0]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1400
     * @tc.name SetEntriesTest014
     * @tc.desc Iterate Set with BigInt values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const big1 = 123n;
      const big2 = 123n;
      const set = new Set<BigInt>([big1, big2, 456n]);
      const entries = Array.from(set.entries());

      expect(entries.toString()).assertEqual([[123n, 123n], [456n, 456n]].toString());
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1500
     * @tc.name SetEntriesTest015
     * @tc.desc Iterate Set with object references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI>([obj, { id: 2 } as BaseI] ) ;
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[obj, obj], [{ id: 2 } as BaseI, { id: 2 } as BaseI]]));
      expect(entries[0][0]).assertEqual(obj);
      expect(entries[1][0]).not().assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1700
     * @tc.name SetEntriesTest017
     * @tc.desc Iterate Set with Date objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date('2024-01-01');
      const set = new Set<Date>([date, new Date('2024-01-02')]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[date, date], [new Date('2024-01-02'), new Date('2024-01-02')]]));
      expect(entries[0][0]).assertEqual(date);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1900
     * @tc.name SetEntriesTest019
     * @tc.desc Iterate Set with RegExp objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex = new RegExp('test');
      const set = new Set<RegExp>([regex, new RegExp('test','g')]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[regex, regex], [new RegExp('test','g'),new RegExp('test','g')]]));
      expect(entries[0][0]).assertEqual(regex);
      expect(entries[1][0]).not().assertEqual(regex);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2000
     * @tc.name SetEntriesTest020
     * @tc.desc Iterate Set with function references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func = () => {};
      const set = new Set<Function>([func, () => {}]);
      const entries = Array.from(set.entries());

      expect(entries[0][0]).assertEqual(func);
      expect(entries[1][0]).not().assertEqual(func);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2100
     * @tc.name SetEntriesTest021
     * @tc.desc Modify Set during iteration, verify iterator uses snapshot (no new elements)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<number>([1, 2]);
      const iterator = set.entries();
      const entries: [number, number][]|undefined = [];

      entries.push((iterator.next().value) as [number, number]);
      set.add(3);
      const nextResult = iterator.next();

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1]]));
      expect(JSON.stringify(nextResult.value)).assertDeepEquals(JSON.stringify([2, 2]));
      expect(nextResult.done).assertEqual(false);
      expect(iterator.next().done).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2200
     * @tc.name SetEntriesTest022
     * @tc.desc Delete Set element during iteration, verify iterator skips deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const iterator = set.entries();
      const entries: [int, int][] |undefined = [];

      entries.push(iterator.next().value as [int, int]);
      set.delete(2);
      const nextResult = iterator.next();

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1]]));
      expect(JSON.stringify(nextResult.value)).assertDeepEquals(JSON.stringify([3, 3]));
      expect(nextResult.done).assertEqual(false);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2300
     * @tc.name SetEntriesTest023
     * @tc.desc Modify object properties after iterator generation, verify entry updates
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI>([obj]);
      const iterator = set.entries();

      obj.id = 999;
      const entry: BaseI[] = [...(iterator.next().value as [BaseI, BaseI])];

      expect(entry[0].id).assertEqual(999);
      expect(entry[1].id).assertEqual(999);
      expect(entry[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2700
     * @tc.name SetEntriesTest027
     * @tc.desc Iterate Set with circular reference object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj = { self: null } as Base1;
      obj.self = obj;

      const set = new Set<Base1>([obj]);
      const entries = Array.from(set.entries());

      expect(entries[0][0].self).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3000
     * @tc.name SetEntriesTest030
     * @tc.desc Comprehensive test: mixed types + multiple iterations + modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI | string | int | boolean | null | BigInt>([
        'string', 100, true, null, obj, 123n
      ]);

      const entries1 = Array.from(set.entries());
      expect(entries1.length).assertEqual(6);

      obj.id = 2;
      set.add('new-element');

      const entries2 = Array.from(set.entries());
      expect(entries2.length).assertEqual(7);
      expect((entries2[4][0] as BaseI).id).assertEqual(2);
      expect(JSON.stringify(entries2[6])).assertDeepEquals(JSON.stringify(['new-element', 'new-element']));

      set.delete(100);
      const entries3 = Array.from(set.entries());
      expect(entries3.length).assertEqual(6);
      expect(entries3.some(entry => entry[0] === 100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3100
     * @tc.name SetEntriesTest031
     * @tc.desc Verify iterator works with Set containing nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const nestedObj = { a: { b: 1 } } as Base3;
      const set = new Set<Base3>([nestedObj]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[nestedObj, nestedObj]]));
      expect(entries[0][0].a.b).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3400
     * @tc.name SetEntriesTest034
     * @tc.desc Verify entries() on a subclass of Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetEntriesTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const set = new MySet<int>([1, 2, 3]);
      const entries = Array.from(set.entries()) as [int, int][];

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1], [2, 2], [3, 3]]));
      expect(set instanceof MySet).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3500
     * @tc.name SetEntriesTest035
     * @tc.desc Verify iterator doesn't include elements added after iterator creation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2]);
      const iterator = set.entries();

      set.add(3);
      const entries = Array.from(iterator);

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 1], [2, 2], [3,3]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3600
     * @tc.name SetEntriesTest036
     * @tc.desc Verify entries() works with very large numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const set = new Set<number>([largeNum, largeNum + 1]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[largeNum, largeNum], [largeNum + 1, largeNum + 1]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3700
     * @tc.name SetEntriesTest037
     * @tc.desc Verify entries() with Set containing negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([-1, -2, -3]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[-1, -1], [-2, -2], [-3, -3]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3800
     * @tc.name SetEntriesTest038
     * @tc.desc Verify entries() with Set containing float numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<double>([1.5, 2.5, 3.5]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1.5, 1.5], [2.5, 2.5], [3.5, 3.5]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3900
     * @tc.name SetEntriesTest039
     * @tc.desc Verify entries() with Set containing empty strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['', '', 'non-empty']);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['', ''], ['non-empty', 'non-empty']]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4000
     * @tc.name SetEntriesTest040
     * @tc.desc Verify entries() with Set containing multi-line strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const multiLine = 'line1\nline2';
      const set = new Set<string>([multiLine]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[multiLine, multiLine]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4100
     * @tc.name SetEntriesTest041
     * @tc.desc Verify entries() with Set containing special characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetEntriesTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['!', '@', '#', '$', '%']);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['!', '!'], ['@', '@'], ['#', '#'], ['$', '$'], ['%', '%']]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4200
     * @tc.name SetEntriesTest042
     * @tc.desc Verify entries() with Set containing Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<string>(['😀', '🌍', '📚']);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['😀', '😀'], ['🌍', '🌍'], ['📚', '📚']]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4400
     * @tc.name SetEntriesTest044
     * @tc.desc Verify entries() with Set containing same-value objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const obj1 = { a: 1 } as Base4;
      const obj2 = { a: 1 } as Base4;
      const set = new Set<Base4>([obj1, obj2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[obj1, obj1], [obj2, obj2]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4500
     * @tc.name SetEntriesTest045
     * @tc.desc Verify entries() with Set containing class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {


      const instance1 = new MyClass(1);
      const instance2 = new MyClass(2);
      const set = new Set<MyClass>([instance1, instance2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[instance1, instance1], [instance2, instance2]]));
      expect(entries[0][0].id).assertEqual(1);
      expect(entries[1][0].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4600
     * @tc.name SetEntriesTest046
     * @tc.desc Verify entries() with Set containing promises
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(1);
      const set = new Set<Promise<int>>([promise1, promise2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[promise1, promise1], [promise2, promise2]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4700
     * @tc.name SetEntriesTest047
     * @tc.desc Verify entries() with Set containing WeakMap (non-iterable)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const weakMap = new WeakMap<object, string>();
      const set = new Set<WeakMap<object, string>>([weakMap]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[weakMap, weakMap]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4800
     * @tc.name SetEntriesTest048
     * @tc.desc Verify entries() with Set containing Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map = new Map<string,string>([['key', 'value']]);
      const set = new Set<Map<String,String>>([map]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[map, map]]));
      expect(entries[0][0].get('key')).assertEqual('value');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4900
     * @tc.name SetEntriesTest049
     * @tc.desc Verify entries() with Set containing Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const innerSet = new Set<int>([1, 2]);
      const set = new Set<Set<int>>([innerSet]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[innerSet, innerSet]]));
      expect(Array.from(entries[0][0])).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5100
     * @tc.name SetEntriesTest051
     * @tc.desc Verify iterator continues correctly after partial iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3, 4, 5]);
      const iterator = set.entries();

      expect(JSON.stringify(iterator.next().value)).assertDeepEquals(JSON.stringify([1, 1]));
      expect(JSON.stringify(iterator.next().value)).assertDeepEquals(JSON.stringify([2, 2]));

      const remainingEntries: [Int, Int][]|undefined = [];
      let result = iterator.next();
      while (!result.done) {
        remainingEntries.push(result.value as [Int, Int]);
        result = iterator.next();
      }

      expect(JSON.stringify(remainingEntries)).assertDeepEquals(JSON.stringify([[3, 3], [4, 4], [5, 5]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5200
     * @tc.name SetEntriesTest052
     * @tc.desc Verify entries() works after clearing the Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.clear();
      const entries = Array.from(set.entries()  as IterableIterator<[int, int]>);

      expect(entries).assertDeepEquals([] as int[]);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5300
     * @tc.name SetEntriesTest053
     * @tc.desc Verify entries() on a Set that has had elements added and removed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      set.add(1);
      set.add(2);
      set.delete(1);
      set.add(3);
      set.add(2);
      set.delete(3);
      set.add(4);

      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[2, 2], [4, 4]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5500
     * @tc.name SetEntriesTest055
     * @tc.desc Verify entries() with Set containing async functions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncFunc1 = async () => { return 1; };
      const asyncFunc2 = async () => { return 2; };
      const set = new Set<Function>([asyncFunc1, asyncFunc2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[asyncFunc1, asyncFunc1], [asyncFunc2, asyncFunc2]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5700
     * @tc.name SetEntriesTest057
     * @tc.desc Verify entries() with Set containing typed arrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([1, 2, 3]);
      const set = new Set<Uint8Array>([arr1, arr2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[arr1, arr1], [arr2, arr2]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5800
     * @tc.name SetEntriesTest058
     * @tc.desc Verify entries() with Set containing data views
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(16);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer, 8);
      const set = new Set<DataView>([view1, view2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[view1, view1], [view2, view2]]));
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5900
     * @tc.name SetEntriesTest059
     * @tc.desc Verify entries() with Set containing regex with flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex1 = new RegExp('test','i');
      const regex2 = new RegExp('test','g');
      const regex3 = new RegExp('test','i');
      const set = new Set<RegExp>([regex1, regex2, regex3]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[regex1, regex1], [regex2, regex2], [regex3, regex3]]));
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6000
     * @tc.name SetEntriesTest060
     * @tc.desc Verify entries() with Set containing error objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const set = new Set<Error>([error1, error2]);
      const entries = Array.from(set.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[error1, error1], [error2, error2]]));
      expect(entries[0][0].message).assertEqual('Error 1');
      expect(entries[1][0].message).assertEqual('Error 2');
    });



    /**
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6700
     * @tc.name SetEntriesTest067
     * @tc.desc Verify entries() with Set containing Function constructor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetEntriesTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const multiplyByTwo = (a: number)=> a * 2;
      const set = new Set<Function>([multiplyByTwo]);
      const entries = Array.from (set.entries ());
      const func = entries [0][0];

      expect((func.unsafeCall(3.0)) as number).assertEqual(6.0);
    });


  });
}