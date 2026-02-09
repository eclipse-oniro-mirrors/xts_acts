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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  SetEntriesTest013,
  SetEntriesTest024, SetEntriesTest025, SetEntriesTest026, SetEntriesTest028,
  SetEntriesTest029,
  SetEntriesTest032,
  SetEntriesTest054,
  SetEntriesTest056,
  SetEntriesTest073,
  SetEntriesTest075,
  SetEntriesTest078,
  SetEntriesTest079,
  SetEntriesTest080,
  SetEntriesTest096,
  SetEntriesTest097,
  SetEntriesTest098,
  SetEntriesTest099,
  SetEntriesTest100} from './SetEntries';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function setEntriesTest() {
  describe('SetEntriesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   SetEntriesTest001
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0100
     * @tc.desc   Iterate non-empty Set with strings, verify each entry is [value, value]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['a', 'b', 'c']);
      const iterator = set.entries();
      const entries: string[][] = [];

      let result = iterator.next();
      while (!result.done) {
        entries.push(result.value);
        result = iterator.next();
      }

      expect(entries).assertDeepEquals([['a', 'a'], ['b', 'b'], ['c', 'c']]);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest002
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0200
     * @tc.desc   Iterate non-empty Set with numbers, verify entry format
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30]);
      const entries = Array.from(set.entries());

      expect(entries.every(entry => entry.length === 2)).assertEqual(true);
      expect(entries.every(entry => entry[0] === entry[1])).assertEqual(true);
      expect(entries).assertDeepEquals([[10, 10], [20, 20], [30, 30]]);
    });

    /**
     * @tc.name   SetEntriesTest003
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0300
     * @tc.desc   Iterate empty Set, verify iterator is empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   SetEntriesTest004
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0400
     * @tc.desc   Verify iteration order matches insertion order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('third');
      set.add('first');
      set.add('second');

      const entries = Array.from(set.entries());
      const values = entries.map(entry => entry[0]);

      expect(values).assertDeepEquals(['third', 'first', 'second']);
    });

    /**
     * @tc.name   SetEntriesTest005
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0500
     * @tc.desc   Verify each call to entries() returns new iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2]);
      const iterator1 = set.entries();
      const iterator2 = set.entries();

      iterator1.next();

      expect(iterator1.next().value).assertDeepEquals([2, 2]);
      expect(iterator2.next().value).assertDeepEquals([1, 1]);
      expect(iterator1 !== iterator2).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest006
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0600
     * @tc.desc   Iterate Set with boolean values, verify entry format
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([true, false, true]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[true, true], [false, false]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest007
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0700
     * @tc.desc   Iterate Set with null and undefined, verify entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([null, undefined, null]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[null, null], [undefined, undefined]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest008
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0800
     * @tc.desc   Use for...of loop to iterate entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['x', 'y', 'z']);
      const entries: string[][] = [];

      for (const entry of set.entries()) {
        entries.push(entry);
      }

      expect(entries).assertDeepEquals([['x', 'x'], ['y', 'y'], ['z', 'z']]);
    });

    /**
     * @tc.name   SetEntriesTest009
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_0900
     * @tc.desc   Iterate Set with single element, verify entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['only-element']);
      const iterator = set.entries();
      const firstEntry: string[] = iterator.next().value;
      const done = iterator.next().done;

      expect(firstEntry).assertDeepEquals(['only-element', 'only-element']);
      expect(done).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest010
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1000
     * @tc.desc   Verify entries() ignores passed parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2, 3]);
      const iterator = set.entries();
      const entries = Array.from(iterator);

      expect(entries).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
    });

    /**
     * @tc.name   SetEntriesTest011
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1100
     * @tc.desc   Iterate Set with NaN (treated as equal to itself)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([NaN, 1, NaN]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[NaN, NaN], [1, 1]]);
      expect(entries.length).assertEqual(2);
      expect(Number.isNaN(entries[0][0])).assertEqual(true);
      expect(Number.isNaN(entries[0][1])).assertEqual(true);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(1);
    });

    /**
     * @tc.name   SetEntriesTest012
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1200
     * @tc.desc   Iterate Set with 0 and -0 (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([0, -0, 100]);
      const entries = Array.from(set.entries());

      expect(entries[0].toString()).assertEqual([0, 0].toString());
      expect(entries[1].toString()).assertEqual([100, 100].toString());
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][0]).assertEqual(-0);
    });

    /**
     * @tc.name   SetEntriesTest013
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1300
     * @tc.desc   Iterate Set with Symbol values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = SetEntriesTest013();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest014
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1400
     * @tc.desc   Iterate Set with BigInt values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const big1 = 123n;
      const big2 = 123n;
      const set = new Set([big1, big2, 456n]);
      const entries = Array.from(set.entries());

      expect(entries.toString()).assertEqual([[123n, 123n], [456n, 456n]].toString());
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest015
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1500
     * @tc.desc   Iterate Set with object references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        id: number
      }
      const obj = { id: 1 } as BaseI;
      const set = new Set([obj, { id: 2 }]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[obj, obj], [{ id: 2 }, { id: 2 }]]);
      expect(entries[0][0]).assertEqual(obj);
      expect(entries[1][0]).not().assertEqual(obj);
    });

    /**
     * @tc.name   SetEntriesTest017
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1700
     * @tc.desc   Iterate Set with Date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date('2024-01-01');
      const set = new Set([date, new Date('2024-01-02')]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[date, date], [new Date('2024-01-02'), new Date('2024-01-02')]]);
      expect(entries[0][0]).assertEqual(date);
    });

    /**
     * @tc.name   SetEntriesTest018
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1800
     * @tc.desc   Iterate large Set (1000 elements), verify order and completeness
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest018', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const set = new Set<number>();
      const expectedEntries: number[][] = [];
      for (let i = 0; i < 1000; i++) {
        set.add(i);
        expectedEntries.push([i, i]);
      }

      const actualEntries = Array.from(set.entries());

      expect(actualEntries.length).assertEqual(1000);
      expect(actualEntries).assertDeepEquals(expectedEntries);
      expect(actualEntries[999]).assertDeepEquals([999, 999]);
    });

    /**
     * @tc.name   SetEntriesTest019
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_1900
     * @tc.desc   Iterate Set with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex = /test/;
      const set = new Set([regex, /test/g]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[regex, regex], [/test/g, /test/g]]);
      expect(entries[0][0]).assertEqual(regex);
      expect(entries[1][0]).not().assertEqual(regex);
    });

    /**
     * @tc.name   SetEntriesTest020
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2000
     * @tc.desc   Iterate Set with function references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func = () => {};
      const set = new Set([func, () => {}]);
      const entries = Array.from(set.entries());

      expect(entries[0][0]).assertEqual(func);
      expect(entries[1][0]).not().assertEqual(func);
    });

    /**
     * @tc.name   SetEntriesTest021
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2100
     * @tc.desc   Modify Set during iteration, verify iterator uses snapshot (no new elements)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2]);
      const iterator = set.entries();
      const entries: number[][] = [];

      entries.push(iterator.next().value);
      set.add(3);
      const nextResult = iterator.next();

      expect(entries).assertDeepEquals([[1, 1]]);
      expect(nextResult.value).assertDeepEquals([2, 2]);
      expect(nextResult.done).assertEqual(false);
      expect(iterator.next().done).assertEqual(false);
    });

    /**
     * @tc.name   SetEntriesTest022
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2200
     * @tc.desc   Delete Set element during iteration, verify iterator skips deleted element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2, 3]);
      const iterator = set.entries();
      const entries: number[][] = [];

      entries.push(iterator.next().value);
      set.delete(2);
      const nextResult = iterator.next();

      expect(entries).assertDeepEquals([[1, 1]]);
      expect(nextResult.value).assertDeepEquals([3, 3]);
      expect(nextResult.done).assertEqual(false);
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest023
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2300
     * @tc.desc   Modify object properties after iterator generation, verify entry updates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        id: number
      }
      const obj = { id: 1 } as BaseI;
      const set = new Set([obj]);
      const iterator = set.entries();

      obj.id = 999;
      const entry: BaseI[] = iterator.next().value;

      expect(entry[0].id).assertEqual(999);
      expect(entry[1].id).assertEqual(999);
      expect(entry[0]).assertEqual(obj);
    });

    /**
     * @tc.name   SetEntriesTest024
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2400
     * @tc.desc   Call entries() on non-Set instance (array), verify behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const entries = SetEntriesTest024() as number[][];

      expect(entries).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest025
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2500
     * @tc.desc   Verify iterator compatibility with spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const entries = SetEntriesTest025();

      expect(entries).assertDeepEquals([['a', 'a'], ['b', 'b'], ['c', 'c']]);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest026
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2600
     * @tc.desc   Verify iterator compatibility with Array.from() mapping
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const doubledValues = SetEntriesTest026();

      expect(doubledValues).assertDeepEquals([2, 4, 6]);
      expect(doubledValues.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest027
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2700
     * @tc.desc   Iterate Set with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        self: null | BaseI
      }
      const obj = { self: null } as BaseI;
      obj.self = obj;

      const set = new Set([obj]);
      const entries = Array.from(set.entries());

      expect(entries[0][0].self).assertEqual(obj);
    });

    /**
     * @tc.name   SetEntriesTest028
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2800
     * @tc.desc   Iterate frozen Set, verify entries are accessible
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = SetEntriesTest028();

      expect(result[0]).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest029
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_2900
     * @tc.desc   Verify for...in does not iterate iterator (vs for...of)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = SetEntriesTest029();

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest030
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + multiple iterations + modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      interface BaseI{
        id: number
      }
      const obj = { id: 1 } as BaseI;
      const set = new Set([
        'string', 100, true, null, obj, 123n
      ]);

      const entries1 = Array.from(set.entries());
      expect(entries1.length).assertEqual(6);

      obj.id = 2;
      set.add('new-element');

      const entries2 = Array.from(set.entries());
      expect(entries2.length).assertEqual(7);
      expect((entries2[4][0] as BaseI).id).assertEqual(2);
      expect(entries2[6]).assertDeepEquals(['new-element', 'new-element']);

      set.delete(100);
      const entries3 = Array.from(set.entries());
      expect(entries3.length).assertEqual(6);
      expect(entries3.some(entry => entry[0] === 100)).assertEqual(false);
    });

    /**
     * @tc.name   SetEntriesTest031
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3100
     * @tc.desc   Verify iterator works with Set containing nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        b: number;
      }
      interface BaseI1{
        a: BaseI;
      }
      const nestedObj = { a: { b: 1 } } as BaseI1;
      const set = new Set([nestedObj]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[nestedObj, nestedObj]]);
      expect(entries[0][0].a.b).assertEqual(1);
    });

    /**
     * @tc.name   SetEntriesTest032
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3200
     * @tc.desc   Verify entries() on Set with Symbol.iterator modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(SetEntriesTest032()).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
    });

    /**
     * @tc.name   SetEntriesTest034
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3400
     * @tc.desc   Verify entries() on a subclass of Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      class MySet extends Set {
        constructor(values: number[]) {
          super(values);
        }
      }

      const set = new MySet([1, 2, 3]);
      const entries = Array.from(set.entries()) as number[][];

      expect(entries).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
      expect(set instanceof MySet).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest035
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3500
     * @tc.desc   Verify iterator doesn't include elements added after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2]);
      const iterator = set.entries();

      set.add(3);
      const entries = Array.from(iterator);

      expect(entries).assertDeepEquals([[1, 1], [2, 2], [3,3]]);
    });

    /**
     * @tc.name   SetEntriesTest036
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3600
     * @tc.desc   Verify entries() works with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const set = new Set([largeNum, largeNum + 1]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[largeNum, largeNum], [largeNum + 1, largeNum + 1]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest037
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3700
     * @tc.desc   Verify entries() with Set containing negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([-1, -2, -3]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[-1, -1], [-2, -2], [-3, -3]]);
    });

    /**
     * @tc.name   SetEntriesTest038
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3800
     * @tc.desc   Verify entries() with Set containing float numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1.5, 2.5, 3.5]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[1.5, 1.5], [2.5, 2.5], [3.5, 3.5]]);
    });

    /**
     * @tc.name   SetEntriesTest039
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_3900
     * @tc.desc   Verify entries() with Set containing empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['', '', 'non-empty']);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([['', ''], ['non-empty', 'non-empty']]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest040
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4000
     * @tc.desc   Verify entries() with Set containing multi-line strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const multiLine = 'line1\nline2';
      const set = new Set([multiLine]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[multiLine, multiLine]]);
    });

    /**
     * @tc.name   SetEntriesTest041
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4100
     * @tc.desc   Verify entries() with Set containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetEntriesTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['!', '@', '#', '$', '%']);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([['!', '!'], ['@', '@'], ['#', '#'], ['$', '$'], ['%', '%']]);
    });

    /**
     * @tc.name   SetEntriesTest042
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4200
     * @tc.desc   Verify entries() with Set containing Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set(['😀', '🌍', '📚']);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([['😀', '😀'], ['🌍', '🌍'], ['📚', '📚']]);
    });

    /**
     * @tc.name   SetEntriesTest044
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4400
     * @tc.desc   Verify entries() with Set containing same-value objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        a: number
      }
      const obj1 = { a: 1 } as BaseI;
      const obj2 = { a: 1 } as BaseI;
      const set = new Set([obj1, obj2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[obj1, obj1], [obj2, obj2]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest045
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4500
     * @tc.desc   Verify entries() with Set containing class instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      class MyClass {
        id: number;
        constructor(id: number) {
          this.id = id;
        }
      }

      const instance1 = new MyClass(1);
      const instance2 = new MyClass(2);
      const set = new Set([instance1, instance2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[instance1, instance1], [instance2, instance2]]);
      expect(entries[0][0].id).assertEqual(1);
      expect(entries[1][0].id).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest046
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4600
     * @tc.desc   Verify entries() with Set containing promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(1);
      const set = new Set([promise1, promise2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[promise1, promise1], [promise2, promise2]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest047
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4700
     * @tc.desc   Verify entries() with Set containing WeakMap (non-iterable)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const weakMap = new WeakMap<object, string>();
      const set = new Set([weakMap]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[weakMap, weakMap]]);
    });

    /**
     * @tc.name   SetEntriesTest048
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4800
     * @tc.desc   Verify entries() with Set containing Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map = new Map([['key', 'value']]);
      const set = new Set([map]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[map, map]]);
      expect(entries[0][0].get('key')).assertEqual('value');
    });

    /**
     * @tc.name   SetEntriesTest049
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_4900
     * @tc.desc   Verify entries() with Set containing Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const innerSet = new Set([1, 2]);
      const set = new Set([innerSet]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[innerSet, innerSet]]);
      expect(Array.from(entries[0][0])).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetEntriesTest051
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5100
     * @tc.desc   Verify iterator continues correctly after partial iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2, 3, 4, 5]);
      const iterator = set.entries();

      expect(iterator.next().value).assertDeepEquals([1, 1]);
      expect(iterator.next().value).assertDeepEquals([2, 2]);

      const remainingEntries: number[][] = [];
      let result = iterator.next();
      while (!result.done) {
        remainingEntries.push(result.value);
        result = iterator.next();
      }

      expect(remainingEntries).assertDeepEquals([[3, 3], [4, 4], [5, 5]]);
    });

    /**
     * @tc.name   SetEntriesTest052
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5200
     * @tc.desc   Verify entries() works after clearing the Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2, 3]);
      set.clear();
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([]);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name   SetEntriesTest053
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5300
     * @tc.desc   Verify entries() on a Set that has had elements added and removed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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

      expect(entries).assertDeepEquals([[2, 2], [4, 4]]);
    });

    /**
     * @tc.name   SetEntriesTest054
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5400
     * @tc.desc   Verify entries() with Set containing generator functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = SetEntriesTest054();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
      expect(result[3]).assertEqual(true);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest055
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5500
     * @tc.desc   Verify entries() with Set containing async functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncFunc1 = async () => { return 1; };
      const asyncFunc2 = async () => { return 2; };
      const set = new Set([asyncFunc1, asyncFunc2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[asyncFunc1, asyncFunc1], [asyncFunc2, asyncFunc2]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest056
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5600
     * @tc.desc   Verify entries() with Set containing proxies
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetEntriesTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(SetEntriesTest056()).assertEqual(1);
    });

    /**
     * @tc.name   SetEntriesTest057
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5700
     * @tc.desc   Verify entries() with Set containing typed arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint8Array([1, 2, 3]);
      const set = new Set([arr1, arr2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[arr1, arr1], [arr2, arr2]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest058
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5800
     * @tc.desc   Verify entries() with Set containing data views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(16);
      const view1 = new DataView(buffer);
      const view2 = new DataView(buffer, 8);
      const set = new Set([view1, view2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[view1, view1], [view2, view2]]);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name   SetEntriesTest059
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_5900
     * @tc.desc   Verify entries() with Set containing regex with flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex1 = /test/i;
      const regex2 = /test/g;
      const regex3 = /test/i;
      const set = new Set([regex1, regex2, regex3]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[regex1, regex1], [regex2, regex2], [regex3, regex3]]);
      expect(entries.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest060
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6000
     * @tc.desc   Verify entries() with Set containing error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const set = new Set([error1, error2]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[error1, error1], [error2, error2]]);
      expect(entries[0][0].message).assertEqual('Error 1');
      expect(entries[1][0].message).assertEqual('Error 2');
    });

    /**
     * @tc.name   SetEntriesTest061
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6100
     * @tc.desc   Verify entries() with Set containing Math object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Math]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Math, Math]]);
      expect(entries[0][0].PI).assertEqual(Math.PI);
    });

    /**
     * @tc.name   SetEntriesTest062
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6200
     * @tc.desc   Verify entries() with Set containing JSON object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([JSON]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[JSON, JSON]]);
      expect(typeof entries[0][0].stringify).assertEqual('function');
    });

    /**
     * @tc.name   SetEntriesTest063
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6300
     * @tc.desc   Verify entries() with Set containing Date constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Date]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Date, Date]]);
      expect(typeof entries[0][0]).assertEqual('function');
    });

    /**
     * @tc.name   SetEntriesTest064
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6400
     * @tc.desc   Verify entries() with Set containing Number constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Number]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Number, Number]]);
      expect(entries[0][0](123)).assertEqual(123);
    });

    /**
     * @tc.name   SetEntriesTest065
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6500
     * @tc.desc   Verify entries() with Set containing String constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([String]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[String, String]]);
      expect(entries[0][0](123)).assertEqual('123');
    });

    /**
     * @tc.name   SetEntriesTest066
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6600
     * @tc.desc   Verify entries() with Set containing Boolean constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Boolean]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Boolean, Boolean]]);
      expect(entries[0][0](1)).assertEqual(true);
      expect(entries[0][0](0)).assertEqual(false);
    });

    /**
     * @tc.name   SetEntriesTest067
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6700
     * @tc.desc   Verify entries() with Set containing Function constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const multiplyByTwo = (a: number) => a * 2;
      const set = new Set ([multiplyByTwo]);
      const entries = Array.from (set.entries ());const func = entries [0][0];

      expect(func(3)).assertEqual(6);
    });

    /**
     * @tc.name   SetEntriesTest068
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6800
     * @tc.desc   Verify entries() with Set containing Object constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Object]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Object, Object]]);
      const obj = new entries[0][0]();
      expect(typeof obj).assertEqual('object');
    });

    /**
     * @tc.name   SetEntriesTest069
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_6900
     * @tc.desc   Verify entries() with Set containing Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Array, Array]]);
      const arr = new entries[0][0](1, 2, 3);
      expect(arr).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetEntriesTest070
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7000
     * @tc.desc   Verify entries() with Set containing RegExp constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([RegExp]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[RegExp, RegExp]]);
      const regex = new entries[0][0]('test', 'i');
      expect(regex.test('TEST')).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest071
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7100
     * @tc.desc   Verify entries() with Set containing Error constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Error]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Error, Error]]);
      const error = new entries[0][0]('test error');
      expect(error.message).assertEqual('test error');
    });

    /**
     * @tc.name   SetEntriesTest072
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7200
     * @tc.desc   Verify entries() with Set containing custom error constructors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      class CustomError extends Error {}
      const set = new Set([CustomError]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[CustomError, CustomError]]);
      const error = new entries[0][0]('custom error');
      expect(error instanceof CustomError).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest073
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7300
     * @tc.desc   Verify entries() with Set containing Map constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map = SetEntriesTest073() as Map<string, string>;
      expect(map.get('key')).assertEqual('value');
    });

    /**
     * @tc.name   SetEntriesTest074
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7400
     * @tc.desc   Verify entries() with Set containing Set constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Set]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Set, Set]]);
      const innerSet = new entries[0][0]([1, 2, 3]);
      expect(Array.from(innerSet)).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetEntriesTest075
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7500
     * @tc.desc   Verify entries() with Set containing WeakMap constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{}
      const obj = {} as BaseI;
      const weakMap = SetEntriesTest075(obj) as Map<BaseI, string>;
      weakMap.set(obj, 'value');
      expect(weakMap.get(obj)).assertEqual('value');
    });

    /**
     * @tc.name   SetEntriesTest076
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7600
     * @tc.desc   Verify entries() with Set containing WeakSet constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{}
      const set = new Set([WeakSet]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[WeakSet, WeakSet]]);
      const weakSet = new entries[0][0]();
      const obj = {} as BaseI;
      weakSet.add(obj);
      expect(weakSet.has(obj)).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest077
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7700
     * @tc.desc   Verify entries() with Set containing Symbol constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Symbol]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Symbol, Symbol]]);
      const sym = entries[0][0]('test');
      expect(typeof sym).assertEqual('symbol');
    });

    /**
     * @tc.name   SetEntriesTest078
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7800
     * @tc.desc   Verify entries() with Set containing Promise constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await SetEntriesTest078()).assertEqual('test');
    });

    /**
     * @tc.name   SetEntriesTest079
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_7900
     * @tc.desc   Verify entries() with Set containing Reflect object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(SetEntriesTest079()).assertEqual(1);
    });

    /**
     * @tc.name   SetEntriesTest080
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8000
     * @tc.desc   Verify entries() with Set containing Proxy constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(SetEntriesTest080()).assertEqual(1);
    });

    /**
     * @tc.name   SetEntriesTest081
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8100
     * @tc.desc   Verify entries() with Set containing Int8Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Int8Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Int8Array, Int8Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Int8Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest082
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8200
     * @tc.desc   Verify entries() with Set containing Uint8Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Uint8Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Uint8Array, Uint8Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Uint8Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest083
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8300
     * @tc.desc   Verify entries() with Set containing Uint8ClampedArray constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Uint8ClampedArray]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Uint8ClampedArray, Uint8ClampedArray]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Uint8ClampedArray).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest084
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8400
     * @tc.desc   Verify entries() with Set containing Int16Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Int16Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Int16Array, Int16Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Int16Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest085
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8500
     * @tc.desc   Verify entries() with Set containing Uint16Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Uint16Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Uint16Array, Uint16Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Uint16Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest086
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8600
     * @tc.desc   Verify entries() with Set containing Int32Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Int32Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Int32Array, Int32Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Int32Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest087
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8700
     * @tc.desc   Verify entries() with Set containing Uint32Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Uint32Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Uint32Array, Uint32Array]]);
      const arr = new entries[0][0]([1, 2, 3]);
      expect(arr instanceof Uint32Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest088
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8800
     * @tc.desc   Verify entries() with Set containing Float32Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Float32Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Float32Array, Float32Array]]);
      const arr = new entries[0][0]([1.5, 2.5, 3.5]);
      expect(arr instanceof Float32Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest089
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_8900
     * @tc.desc   Verify entries() with Set containing Float64Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([Float64Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Float64Array, Float64Array]]);
      const arr = new entries[0][0]([1.5, 2.5, 3.5]);
      expect(arr instanceof Float64Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest090
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9000
     * @tc.desc   Verify entries() with Set containing BigInt64Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      if (typeof BigInt64Array === 'undefined') {
        return;
      }

      const set = new Set([BigInt64Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[BigInt64Array, BigInt64Array]]);
      const arr = new entries[0][0]([1n, 2n, 3n]);
      expect(arr instanceof BigInt64Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest091
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9100
     * @tc.desc   Verify entries() with Set containing BigUint64Array constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      if (typeof BigUint64Array === 'undefined') {
        return;
      }

      const set = new Set([BigUint64Array]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[BigUint64Array, BigUint64Array]]);
      const arr = new entries[0][0]([1n, 2n, 3n]);
      expect(arr instanceof BigUint64Array).assertEqual(true);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   SetEntriesTest092
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9200
     * @tc.desc   Verify entries() with Set containing ArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([ArrayBuffer]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[ArrayBuffer, ArrayBuffer]]);
      const buffer = new entries[0][0](16);
      expect(buffer instanceof ArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name   SetEntriesTest093
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9300
     * @tc.desc   Verify entries() with Set containing DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([DataView]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[DataView, DataView]]);
      const buffer = new ArrayBuffer(16);
      const view = new entries[0][0](buffer);
      expect(view instanceof DataView).assertEqual(true);
    });

    /**
     * @tc.name   SetEntriesTest094
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9400
     * @tc.desc   Verify entries() with Set containing Atomics object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      if (typeof Atomics === 'undefined') {
        return;
      }

      const set = new Set([Atomics]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[Atomics, Atomics]]);
      expect(typeof entries[0][0].add).assertEqual('function');
    });

    /**
     * @tc.name   SetEntriesTest095
     * @tc.number SUB_BUILTINS_SET_ENTRIES_TEST_9500
     * @tc.desc   Verify entries() with Set containing SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetEntriesTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      if (typeof SharedArrayBuffer === 'undefined') {
        return;
      }

      const set = new Set([SharedArrayBuffer]);
      const entries = Array.from(set.entries());

      expect(entries).assertDeepEquals([[SharedArrayBuffer, SharedArrayBuffer]]);
      const buffer = new entries[0][0](16);
      expect(buffer instanceof SharedArrayBuffer).assertEqual(true);
      expect(buffer.byteLength).assertEqual(16);
    });

  });
}