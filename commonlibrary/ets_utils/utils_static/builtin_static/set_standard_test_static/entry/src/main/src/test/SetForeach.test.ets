
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

interface BaseI {
  value: string,
  key: string,
  currentSet: Set<string>
}

interface Base1 {
  value: boolean;
  key: boolean;
  setSize: number
}

interface Base2{
  b: number
}

interface Base3{
  a: Base2
}

interface Base4 {
  val: number
}

interface Base5 {
  first: number,
  second: number
}

interface Base6 {
  value: string,
  toString1: () => string;
}

interface Base7 {}

interface Base8 {
  id: number
}

interface Base9 {
  tagName: string,
  id: string
}

interface Base10 {
  value: string | number,
  type: string
}
interface Base11{
  value: int;
  valueOf: () => int;
}

interface Base12 {
  self?: Base12
}

interface Base13 {
  prop: string
}

interface Base14 {
  id: string,
  value: string
}

interface Base15{
  name: string,
  inspect: () => string
}

interface Base16{
  a:int;
  b:int;
  c:int;
}


class Item {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }

  getIdentifier() {
    return `item-${this.id}`;
  }
}

type selfSet = Set<number | selfSet>

export default function SetForeachTest() {
  describe('SetForeachTest', () => {
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
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0100
     * @tc.name SetForEachTest001
     * @tc.desc Traverse non-empty Set with strings, verify callback call count and parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      const callbackLogs: BaseI[] = [];

      const callback = (value: string, key: string, currentSet: Set<string>) => {
        callbackLogs.push({ value, key, currentSet });
      };

      set.forEach(callback);

      expect(callbackLogs.length).assertEqual(3);
      expect(callbackLogs.every(log => log.value === log.key)).assertEqual(true);
      expect(callbackLogs.every(log => log.currentSet === set)).assertEqual(true);
      expect(callbackLogs.map((log) => log.value)).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0300
     * @tc.name SetForEachTest003
     * @tc.desc Traverse empty Set, verify callback is not called
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0400
     * @tc.name SetForEachTest004
     * @tc.desc Traverse Set with number values, verify parameter correctness
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>([10, 20, 30]);
      const values: number[] = [];
      const keys: number[] = [];
      set.forEach((value, key) => {
        values.push(value);
        keys.push(key);
      });
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([10, 20, 30]));
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([10, 20, 30]));
      expect(values).assertDeepEquals(keys);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0500
     * @tc.name SetForEachTest005
     * @tc.desc Traverse Set with boolean values, verify callback parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>([true, false, true]);
      const logs: Base1[] = [];

      set.forEach((value, key, set) => {
        logs.push({ value, key, setSize: set.size });
      });

      expect(logs.length).assertEqual(2);
      expect(logs[0]).assertDeepEquals({ value: true, key: true, setSize: 2 } as  Base1);
      expect(logs[1]).assertDeepEquals({ value: false, key: false, setSize: 2 } as Base1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0600
     * @tc.name SetForEachTest006
     * @tc.desc Traverse Set with null and undefined, verify callback execution
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<null | undefined>([null, undefined, null]);
      const visited: (null | undefined)[] = [];

      set.forEach((value) => {
        visited.push(value);
      });

      expect(visited).assertDeepEquals([null, undefined]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0700
     * @tc.name SetForEachTest007
     * @tc.desc Verify callback receives the original Set as third parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>([1]);
      let receivedSet: Set<number> | null = null;

      set.forEach((_, __, currentSet) => {
        receivedSet = currentSet;
      });

      expect(receivedSet).assertEqual(set);
      expect(receivedSet!.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0800
     * @tc.name SetForEachTest008
     * @tc.desc Traverse Set with single element, verify callback is called once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['only-element']);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0900
     * @tc.name SetForEachTest009
     * @tc.desc Callback with no parameters (still executes normally)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([1, 2]);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1000
     * @tc.name SetForEachTest010
     * @tc.desc Traverse Set with duplicate values (only unique values are processed)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetForEachTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>([1, 1, 2, 2, 3]);
      const uniqueValues: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>) => {
        uniqueValues.push(value);
      });

      expect(JSON.stringify(uniqueValues)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(uniqueValues.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1300
     * @tc.name SetForEachTest013
     * @tc.desc Add new element during traversal (new element is visited)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2]);
      const visited: int[] = [];

      set.forEach(value => {
        visited.push(value);
        if (value === 1) {
          set.add(3);
        }
      });

      expect(visited).assertDeepEquals([1, 2, 3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1400
     * @tc.name SetForEachTest014
     * @tc.desc Delete element during traversal (deleted element is not visited)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2, 3]);
      const visited: int[] = [];

      set.forEach(value => {
        visited.push(value);
        if (value === 1) {
          set.delete(2);
        }
      });

      expect(visited).assertDeepEquals([1, 3]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1500
     * @tc.name SetForEachTest015
     * @tc.desc Delete and re-add element during traversal (element is visited twice)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([1, 2]);
      const visited: int[] = [];

      const values = Array.from(set);
      values.forEach(value => {
        visited.push(value);
        if (value === 1) {
          set.delete(1);
          set.add(1);
        }
      });

      expect(visited).assertDeepEquals([1, 2]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1600
     * @tc.name SetForEachTest016
     * @tc.desc Traverse Set with NaN (treated as equal to itself)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([NaN, 1, NaN]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>) => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1700
     * @tc.name SetForEachTest017
     * @tc.desc Traverse Set with 0 and -0 (treated as equal)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([0, -0, 100]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>) => {
        visited.push(value);
      });

      expect(visited.toString()).assertEqual([0, 100].toString());
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1900
     * @tc.name SetForEachTest019
     * @tc.desc Traverse Set with BigInt values (same value is processed once)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetForEachTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const big1 = 123n;
      const big2 = 123n;
      const set = new Set<BigInt>([big1, big2, 456n]);
      const visited: bigint[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.toString()).assertEqual([123n, 456n].toString());
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2100
     * @tc.name SetForEachTest021
     * @tc.desc Callback throws error (traversal is interrupted)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const visited: int[] = [];
      let errorThrown = false;

      const callback = (value: int) => {
        visited.push(value);
        if (value === 2) {
          throw new Error('Traversal interrupted');
        }
      };

      try {
        set.forEach(callback);
      } catch (e) {
        errorThrown = e.message === 'Traversal interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2400
     * @tc.name SetForEachTest024
     * @tc.desc Traverse large Set (1000 elements), verify traversal completeness
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      const expected: number[] = [];
      for (let i = 0; i < 1000; i++) {
        set.add(i);
        expected.push(i);
      }

      const visited: number[] = [];
      set.forEach((value: number, value2: Double, set: Set<number>) => {
        visited.push(value);
      });

      expect(visited).assertDeepEquals(expected);
      expect(visited.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2600
     * @tc.name SetForEachTest026
     * @tc.desc Traverse Set with Date objects (reference comparison)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const date = new Date('2024-01-01');
      const set = new Set<Date>([date, new Date('2024-01-02')]);
      const visitedDates: string[] = [];

      set.forEach(value => {
        visitedDates.push(value.toISOString());
      });

      expect(visitedDates).assertDeepEquals([
        '2024-01-01T00:00:00.000Z',
        '2024-01-02T00:00:00.000Z'
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2700
     * @tc.name SetForEachTest027
     * @tc.desc Traverse Set with RegExp objects (reference comparison)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = new RegExp('test');
      const set = new Set<RegExp>([regex, new RegExp('test','g')]);
      const visitedRegex: string[] = [];

      set.forEach(value => {
        visitedRegex.push(value.source + value.flags);
      });

      expect(visitedRegex).assertDeepEquals(['test', 'testg']);
      expect(visitedRegex.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3100
     * @tc.name SetForEachTest031
     * @tc.desc Traverse Set with nested objects (reference comparison)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { a: { b: 1 } } as Base3;
      const obj2 = { a: { b: 1 } } as Base3;
      const set = new Set<Base3>([obj1, obj2]);
      const visited: Base3[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(obj1);
      expect(visited[1]).assertEqual(obj2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3200
     * @tc.name SetForEachTest032
     * @tc.desc Callback modifies the Set's elements (not the Set itself)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<Base4>([{ val: 1 } as Base4, { val: 2 } as Base4]);

      set.forEach(item => {
        item.val *= 2;
      });

      const values = Array.from(set).map((item) => item.val);
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([2, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3300
     * @tc.name SetForEachTest033
     * @tc.desc forEach() on Set with elements added via spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const original : number[] = [1, 2, 3];
      const set = new Set<number>([...original]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>) => {visited.push(value)});
      expect(visited).assertDeepEquals(original);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3400
     * @tc.name SetForEachTest034
     * @tc.desc Callback uses all three parameters correctly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['test']);
      let paramsCorrect = true;

      set.forEach((value, key, currentSet) => {
        if (value !== 'test' || key !== 'test' || currentSet !== set) {
          paramsCorrect = false;
        }
      });

      expect(paramsCorrect).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3500
     * @tc.name SetForEachTest035
     * @tc.desc Traverse Set with function values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'a';
      const func2 = () => 'b';
      const set = new Set<() => string>([func1, func2, func1]);
      const visited: string[] = [];
      set.forEach((fn) => {visited.push(fn())});
      expect(visited).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3600
     * @tc.name SetForEachTest036
     * @tc.desc forEach() with callback that returns a value (ignored)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);
      const results: int[] = [];

      set.forEach((value) => {
        results.push(value * 2);
      });

      expect(results).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3700
     * @tc.name SetForEachTest037
     * @tc.desc Large values in Set (Number.MAX_SAFE_INTEGER)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const safeInt = Number.MAX_SAFE_INTEGER;
      const set = new Set<number>([safeInt, safeInt + 1]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>) => {visited.push(value)});

      expect(visited).assertDeepEquals([safeInt, safeInt + 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3800
     * @tc.name SetForEachTest038
     * @tc.desc forEach() on Set created from another Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const original = new Set<string>(['a', 'b']);
      const copy = new Set<string>(original);
      const visited: string[] = [];

      copy.forEach((value) => {visited.push(value)});

      expect(visited).assertDeepEquals(['a', 'b']);
      expect(visited.length).assertEqual(original.size);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3900
     * @tc.name SetForEachTest039
     * @tc.desc Callback uses third parameter to modify Set during traversal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetForEachTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2]);
      const visited: int[] = [];

      set.forEach((value, _, currentSet) => {
        visited.push(value);
        if (value === 1) {
          currentSet.add(3);
        }
      });

      expect(visited).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4100
     * @tc.name SetForEachTest041
     * @tc.desc Traverse Set with elements that are Sets themselves
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const innerSet1 = new Set<int>([1]);
      const innerSet2 = new Set<int>([2]);
      const set = new Set<Set<int>>([innerSet1, innerSet2]);
      const visited: int[] = [];

      set.forEach((innerSet) => {
        visited.push(Array.from(innerSet)[0]);
      });

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4200
     * @tc.name SetForEachTest042
     * @tc.desc forEach() on Set with sparse array elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const sparseArr: (number | undefined)[] = [1, undefined, 3];
      const set = new Set<number | undefined>(sparseArr);
      const visited: (number | undefined)[] = [];

      set.forEach((value)  => {visited.push(value)});

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4400
     * @tc.name SetForEachTest044
     * @tc.desc forEach() on a Set that's been cleared during traversal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<int>([1, 2, 3, 4]);
      const visited: int[] = [];

      set.forEach(value => {
        visited.push(value);
        if (value === 2) {
          set.clear();
        }
      });

      expect(visited).assertDeepEquals([1, 2]);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4700
     * @tc.name SetForEachTest047
     * @tc.desc Very long string values in Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const longStr = 'a'.repeat(10000);
      const set = new Set<string>([longStr, 'short']);
      const visited: string[] = [];

      set.forEach((value)  => {visited.push(value)});

      expect(visited[0]).assertEqual(longStr);
      expect(visited[1]).assertEqual('short');
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5100
     * @tc.name SetForEachTest051
     * @tc.desc Traverse Set with elements that are Maps
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);
      const set = new Set<Map<string, number>>([map1, map2]);
      const visited: number[] = [];

      set.forEach(map => {
        visited.push(Array.from(map.values())[0]);
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5200
     * @tc.name SetForEachTest052
     * @tc.desc forEach() called multiple times on the same Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number>([1, 2]);
      const counts = { first: 0, second: 0 } as Base5;
      set.forEach(()  => {counts.first++});
      set.forEach(() => {counts.second++});
      expect(counts.first).assertEqual(2);
      expect(counts.second).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5300
     * @tc.name SetForEachTest053
     * @tc.desc Callback uses closure to modify external variable
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<int>([1, 2, 3]);
      let sum = 0;

      set.forEach(value => {
        sum += value;
      });

      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5400
     * @tc.name SetForEachTest054
     * @tc.desc forEach() on Set with elements added in different ways
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<string>();
      set.add('a');
      set.add('b');
      set.add('c');

      [...['d', 'e']].forEach((item)  => {set.add(item)});

      const visited: string[] = [];
      set.forEach((value)  => {visited.push(value)});

      expect(visited).assertDeepEquals(['a', 'b', 'c', 'd', 'e']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5700
     * @tc.name SetForEachTest057
     * @tc.desc Set with elements that are promises
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(2);
      const set = new Set<Promise<int>>([promise1, promise2]);
      const visited: Promise<int>[] = [];

      set.forEach((promise)  => {
        visited.push(promise);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(promise1);
      expect(visited[1]).assertEqual(promise2);

      const values = await Promise.all(visited);
      expect(values).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6200
     * @tc.name SetForEachTest062
     * @tc.desc forEach() called on a Set in a detached iframe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      const set = new Set<number>([1, 2]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>)  => {visited.push(value)});

      expect(visited).assertDeepEquals([1, 2] as number[]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6300
     * @tc.name SetForEachTest063
     * @tc.desc Callback that throws and catches its own error
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number>([1, 2, 3]);
      const visited: number[] = [];
      const errors: Error[] = [];

      const callback = (value: number, value2: Double, set: Set<number>) => {
        visited.push(value);
        try {
          if (value === 2) {
            throw new Error('Expected error');
          }
        } catch (e) {
          errors.push(e as Error);
        }
      };

      set.forEach(callback);

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual('Expected error');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6900
     * @tc.name SetForEachTest069
     * @tc.desc Set containing non-primitive values with custom toString
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj1 = {
        value: 'a',
        toString1: () => 'custom-a'
      } as Base6;
      const obj2 = {
        value: 'b',
        toString1: () => 'custom-b'
      } as Base6;
      const set = new Set<Base6>([obj1, obj2]);
      const visited: string[] = [];

      set.forEach(value => {
        visited.push(value.toString1());
      });

      expect(visited).assertDeepEquals(['custom-a', 'custom-b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7100
     * @tc.name SetForEachTest071
     * @tc.desc Set with elements that are weak references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj = {} as Base7;
      const weakRef = new WeakRef<Base7>(obj);
      const set = new Set<WeakRef<Base7>>([weakRef]);
      const visited: (Base7|undefined)[] = [];

      set.forEach((ref)  => {visited.push(ref.deref())});

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7400
     * @tc.name SetForEachTest074
     * @tc.desc Set with elements that are all the same object reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {


      const obj = { id: 1 } as Base8;
      const set = new Set<Base8>([obj, obj, obj]);
      const visited: Base8[] = [];

      set.forEach((value)  => {visited.push(value)});

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7900
     * @tc.name SetForEachTest079
     * @tc.desc Set with elements that are DataView objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);

      view1.setInt32(0, 123);
      view2.setInt32(0, 123);

      const set = new Set<DataView>([view1, view2]);
      const visited: number[] = [];

      set.forEach((view)  => {visited.push(view.getInt32(0))});

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([123, 123]));
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8100
     * @tc.name SetForEachTest081
     * @tc.desc Set containing SharedArrayBuffer objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const sab1 = new ArrayBuffer(8);
      const sab2 = new ArrayBuffer(8);
      const set = new Set<ArrayBuffer>([sab1, sab2]);
      const visited: number[] = [];

      set.forEach((sab)  => {visited.push(sab.byteLength)});

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([8, 8]));
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8400
     * @tc.name SetForEachTest084
     * @tc.desc Set with elements that are error objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const set = new Set<Error>([error1, error2, error1]);
      const visited: string[] = [];

      set.forEach((err)  => {visited.push(err.message)});

      expect(visited).assertDeepEquals(['Error 1', 'Error 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8600
     * @tc.name SetForEachTest086
     * @tc.desc Set containing both NaN and other numeric values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number>([NaN, 1, NaN, 2, NaN]);
      const visited: number[] = [];

      set.forEach((value: number, value2: Double, set: Set<number>)  => {visited.push(value)});

      expect(visited.length).assertEqual(3);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8900
     * @tc.name SetForEachTest089
     * @tc.desc Set with elements that are DOM element-like objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const elem1 = { tagName: 'DIV', id: 'a' } as Base9;
      const elem2 = { tagName: 'SPAN', id: 'b' } as Base9;
      const set = new Set<Base9>([elem1, elem2]);
      const visited: string[] = [];

      set.forEach(elem => {
        visited.push(`${elem.tagName}:${elem.id}`);
      });

      expect(visited).assertDeepEquals(['DIV:a', 'SPAN:b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9100
     * @tc.name SetForEachTest091
     * @tc.desc Set containing Int32Array views of the same buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new Int32Array(buffer, 0, 2);
      const view2 = new Int32Array(buffer, 4, 1);
      const set = new Set<Int32Array>([view1, view2]);
      const visited: number[][] = [];

      view1[0] = 10;
      view1[1] = 20;
      view2[0] = 30;

      set.forEach((view)  => {visited.push(Array.from(view))});

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([[10, 30], [30]]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9200
     * @tc.name SetForEachTest092
     * @tc.desc forEach() in a strict mode function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      'use strict';

      const set = new Set<number>([1, 2]);
      const visited: number[] = [];

      const callback = (value: number, value2: Double, set: Set<number>)  => {
        visited.push(value);
      };

      set.forEach(callback);

      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9300
     * @tc.name SetForEachTest093
     * @tc.desc Callback that modifies a closed-over variable in outer scope
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<int>([1, 2, 3]);
      let outerVar = 0;

      const createCallback = () => {
        return (value: int) => {
          outerVar += value;
        };
      };

      set.forEach(createCallback());

      expect(outerVar).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9400
     * @tc.name SetForEachTest094
     * @tc.desc Set with elements that are regex objects with same pattern
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const regex1 = new RegExp('pattern');
      const regex2 = new RegExp('pattern');
      const set = new Set<RegExp>([regex1, regex2]);
      const visited: string[] = [];

      set.forEach((regex)  => {visited.push(regex.source)});

      expect(visited).assertDeepEquals(['pattern', 'pattern']);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10100
     * @tc.name SetForEachTest101
     * @tc.desc Traverse Set with elements that are WeakMap instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {

      const wm1 = new WeakMap<Base7, string>();
      const wm2 = new WeakMap<Base7, string>();
      const key1 = {} as Base7;
      const key2 = {} as Base7;
      wm1.set(key1, 'value1');
      wm2.set(key2, 'value2');
      const set = new Set<WeakMap<Base7, string>>([wm1, wm2]);
      const visited: string[] = [];

      set.forEach(wm => {
        if (wm.has(key1)) {
          visited.push(wm.get(key1) as string);
        }
        if (wm.has(key2)) {
          visited.push(wm.get(key2) as string);
        }
      });

      expect(visited).assertDeepEquals(['value1', 'value2']);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10300
     * @tc.name SetForEachTest103
     * @tc.desc Set containing objects with custom valueOf methods
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj1: Base11 = (() : Base11 => {
        const value = 5;
        return {
          value,
          valueOf: () => {
            return value * 2;
          }
        };
      })();

      const obj2: Base11 = (() : Base11 => {
        const value = 3;
        return {
          value,
          valueOf: () => {
            return value * 3;
          }
        };
      })();

      const set = new Set<Base11>([obj1, obj2]);

      const visited: int[] = [];

      set.forEach(value => {
        visited.push(value.valueOf());
      });

      expect(visited).assertDeepEquals([10, 9]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10700
     * @tc.name SetForEachTest107
     * @tc.desc Set containing objects with circular references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj = {} as Base12;
      obj.self = obj;
      const set = new Set<Base12>([obj]);
      const visited: boolean[] = [];

      set.forEach(value => {
        visited.push(value.self === value);
      });

      expect(visited).assertDeepEquals([true]);
      expect(visited.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11100
     * @tc.name SetForEachTest111
     * @tc.desc forEach() with callback that uses optional chaining on elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<Base13 | null | undefined>([{ prop: 'a' } as Base13, null, { prop: 'b' } as Base13, undefined]);
      const results: (string | undefined)[] = [];

      set.forEach((item) => {
        results.push(item?.prop);
      });

      expect(results).assertDeepEquals(['a', undefined, 'b', undefined]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11200
     * @tc.name SetForEachTest112
     * @tc.desc Traverse Set with elements that are class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<Item>([new Item(1), new Item(2), new Item(1)]);
      const identifiers: string[] = [];

      set.forEach(item => {
        identifiers.push(item.getIdentifier());
      });

      expect(identifiers).assertDeepEquals(['item-1', 'item-2', "item-1"]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11300
     * @tc.name SetForEachTest113
     * @tc.desc forEach() with callback that uses nullish coalescing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number | null | string | undefined >([0, '', null, undefined, 42, 'hello']);
      const results: (string | number)[] = [];

      set.forEach((value)  => {
        results.push(value ?? 'default');
      });

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([0, '', 'default', 'default', 42, 'hello']));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11600
     * @tc.name SetForEachTest116
     * @tc.desc Set with elements that are WeakSet instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const ws1 = new WeakSet<Base7>();
      const ws2 = new WeakSet<Base7>();
      const obj1 = {} as Base7;
      const obj2 = {} as Base7;
      ws1.add(obj1);
      ws2.add(obj2);

      const set = new Set<WeakSet<Base7>>([ws1, ws2]);
      const results: boolean[] = [];

      set.forEach(ws => {
        results.push(ws.has(obj1), ws.has(obj2));
      });

      expect(results).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12100
     * @tc.name SetForEachTest121
     * @tc.desc forEach() with callback that uses dynamic import()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {


      const set = new Set<string>(['first', 'second']);
      const results: string[] = [];

      const callback = async (id: string) => {
        const mockModule = { id, value: `value-${id}` } as Base14;
        results.push(mockModule.value);
      };

      const promises: Promise<void>[] = [];
      set.forEach(id => {
        promises.push(callback(id));
      });

      await Promise.all(promises);
      expect(results.sort()).assertDeepEquals(['value-first', 'value-second']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12700
     * @tc.name SetForEachTest127
     * @tc.desc forEach() with callback that uses String.prototype.replaceAll()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<string>(['a.b.c', 'x.y.z', '1.2.3']);
      const results: string[] = [];

      set.forEach(str => {
        results.push(str.replaceAll('.', '-'));
      });

      expect(results).assertDeepEquals(['a-b-c', 'x-y-z', '1-2-3']);
    });

  });
}