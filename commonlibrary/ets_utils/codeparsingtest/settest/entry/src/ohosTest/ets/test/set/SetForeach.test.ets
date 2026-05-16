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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  SetForEachTest002,
  SetForEachTest011,
  SetForEachTest012,
  SetForEachTest018,
  SetForEachTest020,
  SetForEachTest022,
  SetForEachTest023,
  SetForEachTest025,
  SetForEachTest028,
  SetForEachTest0281,
  SetForEachTest029,
  SetForEachTest030,
  SetForEachTest040,
  SetForEachTest045,
  SetForEachTest046,
  SetForEachTest048,
  SetForEachTest049,
  SetForEachTest050,
  SetForEachTest056,
  SetForEachTest058,
  SetForEachTest060,
  SetForEachTest061,
  SetForEachTest064,
  SetForEachTest065,
  SetForEachTest067,
  SetForEachTest068,
  SetForEachTest070,
  SetForEachTest072,
  SetForEachTest075,
  SetForEachTest077,
  SetForEachTest0771,
  SetForEachTest078,
  SetForEachTest080,
  SetForEachTest082,
  SetForEachTest083,
  SetForEachTest085,
  SetForEachTest087,
  SetForEachTest088,
  SetForEachTest090,
  SetForEachTest095,
  SetForEachTest097,
  SetForEachTest098,
  SetForEachTest099,
  SetForEachTest100,
  SetForEachTest102,
  SetForEachTest104,
  SetForEachTest110,
  SetForEachTest114,
  SetForEachTest118,
  SetForEachTest119,
  SetForEachTest120,
  SetForEachTest129
} from './SetForeach';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function SetForeachTest() {
  describe('SetForeachTest', () => {
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
     * @tc.name   SetForEachTest001
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0100
     * @tc.desc   Traverse non-empty Set with strings, verify callback call count and parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['a', 'b', 'c']);

      interface BaseI {
        value: string,
        key: string,
        currentSet: Set<string>
      }

      const callbackLogs: BaseI[] = [];

      const callback = (value: string, key: string, currentSet: Set<string>) => {
        callbackLogs.push({ value, key, currentSet });
      };

      set.forEach(callback);

      expect(callbackLogs.length).assertEqual(3);
      expect(callbackLogs.every(log => log.value === log.key)).assertEqual(true);
      expect(callbackLogs.every(log => log.currentSet === set)).assertEqual(true);
      expect(callbackLogs.map(log => log.value)).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   SetForEachTest002
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0200
     * @tc.desc   Verify forEach() returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(SetForEachTest002()).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest003
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0300
     * @tc.desc   Traverse empty Set, verify callback is not called
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   SetForEachTest004
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0400
     * @tc.desc   Traverse Set with number values, verify parameter correctness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30]);
      const values: number[] = [];
      const keys: number[] = [];

      set.forEach((value, key) => {
        values.push(value);
        keys.push(key);
      });

      expect(values).assertDeepEquals([10, 20, 30]);
      expect(keys).assertDeepEquals([10, 20, 30]);
      expect(values).assertDeepEquals(keys);
    });

    /**
     * @tc.name   SetForEachTest005
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0500
     * @tc.desc   Traverse Set with boolean values, verify callback parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([true, false, true]);

      interface BaseI {
        value: boolean;
        key: boolean;
        setSize: number
      }

      const logs: BaseI[] = [];

      set.forEach((value, key, set) => {
        logs.push({ value, key, setSize: set.size });
      });

      expect(logs.length).assertEqual(2);
      expect(logs[0]).assertDeepEquals({ value: true, key: true, setSize: 2 });
      expect(logs[1]).assertDeepEquals({ value: false, key: false, setSize: 2 });
    });

    /**
     * @tc.name   SetForEachTest006
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0600
     * @tc.desc   Traverse Set with null and undefined, verify callback execution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([null, undefined, null]);
      const visited: (null | undefined)[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited).assertDeepEquals([null, undefined]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest007
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0700
     * @tc.desc   Verify callback receives the original Set as third parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1]);
      let receivedSet: Set<number> | null = null;

      set.forEach((_, __, currentSet) => {
        receivedSet = currentSet;
      });

      expect(receivedSet).assertEqual(set);
      expect(receivedSet!.size).assertEqual(1);
    });

    /**
     * @tc.name   SetForEachTest008
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0800
     * @tc.desc   Traverse Set with single element, verify callback is called once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['only-element']);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.name   SetForEachTest009
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_0900
     * @tc.desc   Callback with no parameters (still executes normally)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2]);
      let callCount = 0;

      set.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest010
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1000
     * @tc.desc   Traverse Set with duplicate values (only unique values are processed)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SetForEachTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 1, 2, 2, 3]);
      const uniqueValues: number[] = [];

      set.forEach(value => {
        uniqueValues.push(value);
      });

      expect(uniqueValues).assertDeepEquals([1, 2, 3]);
      expect(uniqueValues.length).assertEqual(3);
    });

    /**
     * @tc.name   SetForEachTest011
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1100
     * @tc.desc   Use thisArg to bind this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([10, 20]);
      const results = SetForEachTest011(set) as number[];

      expect(results).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.name   SetForEachTest012
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1200
     * @tc.desc   No thisArg: this is undefined in callback (strict mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(SetForEachTest012()).assertEqual(undefined);
    });

    /**
     * @tc.name   SetForEachTest013
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1300
     * @tc.desc   Add new element during traversal (new element is visited)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

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
     * @tc.name   SetForEachTest014
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1400
     * @tc.desc   Delete element during traversal (deleted element is not visited)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2, 3]);
      const visited: number[] = [];

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
     * @tc.name   SetForEachTest015
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1500
     * @tc.desc   Delete and re-add element during traversal (element is visited twice)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

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
     * @tc.name   SetForEachTest016
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1600
     * @tc.desc   Traverse Set with NaN (treated as equal to itself)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([NaN, 1, NaN]);
      const visited: number[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
    });

    /**
     * @tc.name   SetForEachTest017
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1700
     * @tc.desc   Traverse Set with 0 and -0 (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set([0, -0, 100]);
      const visited: number[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.toString()).assertEqual([0, 100].toString());
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest018
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1800
     * @tc.desc   Traverse Set with Symbol values (unique symbols are processed)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = SetForEachTest018();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest019
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_1900
     * @tc.desc   Traverse Set with BigInt values (same value is processed once)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const big1 = 123n;
      const big2 = 123n;
      const set = new Set([big1, big2, 456n]);
      const visited: bigint[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.toString()).assertEqual([123n, 456n].toString());
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest020
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2000
     * @tc.desc   thisArg is primitive value (converted to object in non-strict mode)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SetForEachTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = SetForEachTest020() as (boolean | number)[];

      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name   SetForEachTest021
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2100
     * @tc.desc   Callback throws error (traversal is interrupted)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2, 3]);
      const visited: number[] = [];
      let errorThrown = false;

      const callback = (value: number) => {
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
     * @tc.name   SetForEachTest022
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2200
     * @tc.desc   Traverse Set with object references (modify object in callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        id: number;
      }

      const obj = { id: 1 } as BaseI;
      const set = new Set([obj, { id: 2 }]);

      set.forEach(value => {
        if (value.id === 1) {
          value.id = 999;
        }
      });

      expect(obj.id).assertEqual(999);
      expect(SetForEachTest022(set)[1].id).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest023
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2300
     * @tc.desc   Call forEach() on non-Set instance (array via call)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const visited = SetForEachTest023() as number[];

      expect(visited).assertDeepEquals([1, 2, 3]);
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.name   SetForEachTest024
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2400
     * @tc.desc   Traverse large Set (1000 elements), verify traversal completeness
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      const expected: number[] = [];
      for (let i = 0; i < 1000; i++) {
        set.add(i);
        expected.push(i);
      }

      const visited: number[] = [];
      set.forEach(value => {
        visited.push(value);
      });

      expect(visited).assertDeepEquals(expected);
      expect(visited.length).assertEqual(1000);
    });

    /**
     * @tc.name   SetForEachTest025
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2500
     * @tc.desc   Callback is arrow function (this is not bound by thisArg)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = SetForEachTest025();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest026
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2600
     * @tc.desc   Traverse Set with Date objects (reference comparison)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const date = new Date('2024-01-01');
      const set = new Set([date, new Date('2024-01-02')]);
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
     * @tc.name   SetForEachTest027
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2700
     * @tc.desc   Traverse Set with RegExp objects (reference comparison)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = /test/;
      const set = new Set([regex, /test/g]);
      const visitedRegex: string[] = [];

      set.forEach(value => {
        visitedRegex.push(value.source + value.flags);
      });

      expect(visitedRegex).assertDeepEquals(['test', 'testg']);
      expect(visitedRegex.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest028
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2800
     * @tc.desc   Traverse frozen Set (still iterable, no error)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2, 3]);
      SetForEachTest028(set);
      const visited: number[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited).assertDeepEquals([1, 2, 3]);
      expect(SetForEachTest0281(set)).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest029
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_2900
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2]);
      expect(SetForEachTest029(set)).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest030
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + dynamic modification + thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = SetForEachTest030();

      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(100);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest031
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3100
     * @tc.desc   Traverse Set with nested objects (reference comparison)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        b: number
      }

      interface BaseI1 {
        a: BaseI
      }

      const obj1 = { a: { b: 1 } } as BaseI1;
      const obj2 = { a: { b: 1 } } as BaseI1;
      const set = new Set([obj1, obj2]);
      const visited: BaseI1[] = [];

      set.forEach(value => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(obj1);
      expect(visited[1]).assertEqual(obj2);
    });

    /**
     * @tc.name   SetForEachTest032
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3200
     * @tc.desc   Callback modifies the Set's elements (not the Set itself)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        val: number
      }

      const set = new Set([{ val: 1 } as BaseI, { val: 2 } as BaseI]);

      set.forEach(item => {
        item.val *= 2;
      });

      const values = Array.from(set).map(item => item.val);
      expect(values).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetForEachTest033
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3300
     * @tc.desc   forEach() on Set with elements added via spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const original = [1, 2, 3];
      const set = new Set([...original]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals(original);
    });

    /**
     * @tc.name   SetForEachTest034
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3400
     * @tc.desc   Callback uses all three parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set(['test']);
      let paramsCorrect = true;

      set.forEach((value, key, currentSet) => {
        if (value !== 'test' || key !== 'test' || currentSet !== set) {
          paramsCorrect = false;
        }
      });

      expect(paramsCorrect).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest035
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3500
     * @tc.desc   Traverse Set with function values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'a';
      const func2 = () => 'b';
      const set = new Set([func1, func2, func1]);
      const visited: string[] = [];

      set.forEach(fn => visited.push(fn()));

      expect(visited).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   SetForEachTest036
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3600
     * @tc.desc   forEach() with callback that returns a value (ignored)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2]);
      const results: number[] = [];

      set.forEach(value => {
        results.push(value * 2);
        return value * 3;
      });

      expect(results).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetForEachTest037
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3700
     * @tc.desc   Large values in Set (Number.MAX_SAFE_INTEGER)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const safeInt = Number.MAX_SAFE_INTEGER;
      const set = new Set([safeInt, safeInt + 1]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([safeInt, safeInt + 1]);
    });

    /**
     * @tc.name   SetForEachTest038
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3800
     * @tc.desc   forEach() on Set created from another Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const original = new Set(['a', 'b']);
      const copy = new Set(original);
      const visited: string[] = [];

      copy.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals(['a', 'b']);
      expect(visited.length).assertEqual(original.size);
    });

    /**
     * @tc.name   SetForEachTest039
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_3900
     * @tc.desc   Callback uses third parameter to modify Set during traversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

      set.forEach((value, _, currentSet) => {
        visited.push(value);
        if (value === 1) {
          currentSet.add(3);
        }
      });

      expect(visited).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetForEachTest040
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4000
     * @tc.desc   forEach() with thisArg as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SetForEachTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1]);
      let thisValue = SetForEachTest040(set);
      expect(thisValue).assertEqual(null);
    });

    /**
     * @tc.name   SetForEachTest041
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4100
     * @tc.desc   Traverse Set with elements that are Sets themselves
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const innerSet1 = new Set([1]);
      const innerSet2 = new Set([2]);
      const set = new Set([innerSet1, innerSet2]);
      const visited: number[] = [];

      set.forEach(innerSet => {
        visited.push(Array.from(innerSet)[0]);
      });

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest042
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4200
     * @tc.desc   forEach() on Set with sparse array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const sparseArr = [1, , 3];
      const set = new Set(sparseArr);
      const visited: (number | undefined)[] = [];

      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([1, undefined, 3]);
    });

    /**
     * @tc.name   SetForEachTest043
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4300
     * @tc.desc   Callback is an async function (does not await)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

      const callback = async (value: number) => {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        visited.push(value);
      };

      await set.forEach(callback);

      expect(visited.length).assertLess(2);
    });

    /**
     * @tc.name   SetForEachTest044
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4400
     * @tc.desc   forEach() on a Set that's been cleared during traversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3, 4]);
      const visited: number[] = [];

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
     * @tc.name   SetForEachTest045
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4500
     * @tc.desc   Traverse Set with Symbol.iterator modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      let iteratorCalled = SetForEachTest045(set);

      const visited: number[] = [];
      set.forEach(value => visited.push(value));

      expect(iteratorCalled).assertEqual(false);
      expect(visited).assertDeepEquals([1, 2]);

    });

    /**
     * @tc.name   SetForEachTest046
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4600
     * @tc.desc   forEach() with thisArg as a proxy object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([10]);
      expect(SetForEachTest046(set)).assertDeepEquals([60]);
    });

    /**
     * @tc.name   SetForEachTest047
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4700
     * @tc.desc   Very long string values in Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const longStr = 'a'.repeat(10000);
      const set = new Set([longStr, 'short']);
      const visited: string[] = [];

      set.forEach(value => visited.push(value));

      expect(visited[0]).assertEqual(longStr);
      expect(visited[1]).assertEqual('short');
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest048
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4800
     * @tc.desc   forEach() on a subclass of Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest048() as (number[] | boolean | string)[];

      expect(result[0]).assertDeepEquals([1, 2]);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual('test');
    });

    /**
     * @tc.name   SetForEachTest049
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_4900
     * @tc.desc   Callback modifies its own source during execution
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest049() as (number | boolean)[];

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest050
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5000
     * @tc.desc   forEach() with thisArg as a primitive string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest050() as (boolean | string)[];

      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual('test string');
    });

    /**
     * @tc.name   SetForEachTest051
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5100
     * @tc.desc   Traverse Set with elements that are Maps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map([['a', 1]]);
      const map2 = new Map([['b', 2]]);
      const set = new Set([map1, map2]);
      const visited: number[] = [];

      set.forEach(map => {
        visited.push(Array.from(map.values())[0]);
      });

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest052
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5200
     * @tc.desc   forEach() called multiple times on the same Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);

      interface BaseI {
        first: number,
        second: number
      }

      const counts = { first: 0, second: 0 } as BaseI;

      set.forEach(() => counts.first++);
      set.forEach(() => counts.second++);

      expect(counts.first).assertEqual(2);
      expect(counts.second).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest053
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5300
     * @tc.desc   Callback uses closure to modify external variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      let sum = 0;

      set.forEach(value => {
        sum += value;
      });

      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   SetForEachTest054
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5400
     * @tc.desc   forEach() on Set with elements added in different ways
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<string>();
      set.add('a');
      set.add('b');
      set.add('c');

      [...['d', 'e']].forEach(item => set.add(item));

      const visited: string[] = [];
      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals(['a', 'b', 'c', 'd', 'e']);
    });

    /**
     * @tc.name   SetForEachTest055
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5500
     * @tc.desc   Traverse Set containing the Set itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      type selfSet = Set<number | selfSet>
      const set: selfSet = new Set();
      set.add(1);
      set.add(set);

      const visited: (number | selfSet)[] = [];
      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(set);
    });

    /**
     * @tc.name   SetForEachTest056
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5600
     * @tc.desc   forEach() with callback that's a bound function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest056()).assertDeepEquals([30, 60]);
    });

    /**
     * @tc.name   SetForEachTest057
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5700
     * @tc.desc   Set with elements that are promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(2);
      const set = new Set([promise1, promise2]);
      const visited: Promise<number>[] = [];

      set.forEach(promise => {
        visited.push(promise);
      });

      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(promise1);
      expect(visited[1]).assertEqual(promise2);

      const values = await Promise.all(visited);
      expect(values).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest058
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5800
     * @tc.desc   forEach() on a Set with a modified 'size' property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      SetForEachTest058(set);

      const visited: number[] = [];
      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(2);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest059
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_5900
     * @tc.desc   Callback that removes itself from an external array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const callbacks: Function[] = [];
      let callCount = 0;

      const callback = () => {
        callCount++;
        const index = callbacks.indexOf(callback);
        if (index !== -1) {
          callbacks.splice(index, 1);
        }
      };

      callbacks.push(callback);
      set.forEach(callback);

      expect(callCount).assertEqual(2);
      expect(callbacks.length).assertEqual(0);
    });

    /**
     * @tc.name   SetForEachTest060
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6000
     * @tc.desc   forEach() with thisArg as a boolean primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest060();

      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest061
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6100
     * @tc.desc   Set containing Symbol.asyncIterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest061();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest062
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6200
     * @tc.desc   forEach() called on a Set in a detached iframe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest063
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6300
     * @tc.desc   Callback that throws and catches its own error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      const visited: number[] = [];
      const errors: Error[] = [];

      const callback = (value: number) => {
        visited.push(value);
        try {
          if (value === 2) {
            throw new Error('Expected error');
          }
        } catch (e) {
          errors.push(e);
        }
      };

      set.forEach(callback);

      expect(visited).assertDeepEquals([1, 2, 3]);
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual('Expected error');
    });

    /**
     * @tc.name   SetForEachTest064
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6400
     * @tc.desc   Set with elements that are revoked proxies
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest064()).assertEqual(false);
    });

    /**
     * @tc.name   SetForEachTest065
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6500
     * @tc.desc   forEach() with a very large thisArg object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest065()).assertEqual(25);
    });

    /**
     * @tc.name   SetForEachTest066
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6600
     * @tc.desc   Traverse Set during concurrent modification in another function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3, 4, 5]);
      const visited: number[] = [];
      let modificationComplete = false;

      const modifySet = () => {
        setTimeout(() => {
          set.add(6);
          set.delete(3);
          modificationComplete = true;
        }, 0);
      };

      modifySet();
      set.forEach(value => visited.push(value));

      while (!modificationComplete) {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
      }

      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(6)).assertEqual(false);
    });

    /**
     * @tc.name   SetForEachTest067
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6700
     * @tc.desc   Callback that is a generator function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest067()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetForEachTest068
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6800
     * @tc.desc   forEach() on a Set with prototype modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest068()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetForEachTest069
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6900
     * @tc.desc   Set containing non-primitive values with custom toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        value: string,
        toString: () => string;
      }

      const obj1 = {
        value: 'a',
        toString: () => 'custom-a'
      } as BaseI;
      const obj2 = {
        value: 'b',
        toString: () => 'custom-b'
      } as BaseI;
      const set = new Set([obj1, obj2]);
      const visited: string[] = [];

      set.forEach(value => {
        visited.push(value.toString());
      });

      expect(visited).assertDeepEquals(['custom-a', 'custom-b']);
    });

    /**
     * @tc.name   SetForEachTest070
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7000
     * @tc.desc   forEach() with thisArg as a null prototype object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest070()).assertEqual(15);
    });

    /**
     * @tc.name   SetForEachTest071
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7100
     * @tc.desc   Set with elements that are weak references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      if (typeof WeakRef === 'undefined') {
        return;
      }

      interface BaseI {}

      const obj = {} as BaseI;
      const weakRef = new WeakRef(obj);
      const set = new Set([weakRef]);
      const visited: (BaseI | undefined)[] = [];

      set.forEach(ref => visited.push(ref.deref()));

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.name   SetForEachTest072
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7200
     * @tc.desc   forEach() called with Reflect.apply
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];
      const callback = (value: number) => visited.push(value);

      SetForEachTest072(set, callback);

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest073
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7300
     * @tc.desc   Callback that recursively calls forEach on the same Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1]);
      let callCount = 0;
      let recursionDepth = 0;

      const callback = () => {
        callCount++;
        recursionDepth++;
        if (recursionDepth < 3) {
          set.forEach(callback);
        }
        recursionDepth--;
      };

      set.forEach(callback);

      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   SetForEachTest074
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7400
     * @tc.desc   Set with elements that are all the same object reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        id: number
      }

      const obj = { id: 1 } as BaseI;
      const set = new Set([obj, obj, obj]);
      const visited: BaseI[] = [];

      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.name   SetForEachTest075
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7500
     * @tc.desc   forEach() with a callback that's a class constructor
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest075() as number[];

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest077
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7700
     * @tc.desc   forEach() on a Set that's been made non-extensible
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      SetForEachTest077(set);

      const visited: number[] = [];
      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([1, 2]);
      expect(SetForEachTest0771(set)).assertEqual(false);
    });

    /**
     * @tc.name   SetForEachTest078
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7800
     * @tc.desc   Callback that modifies the Set's prototype during traversal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest078()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   SetForEachTest079
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7900
     * @tc.desc   Set with elements that are DataView objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);

      view1.setInt32(0, 123);
      view2.setInt32(0, 123);

      const set = new Set([view1, view2]);
      const visited: number[] = [];

      set.forEach(view => visited.push(view.getInt32(0)));

      expect(visited).assertDeepEquals([123, 123]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest080
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8000
     * @tc.desc   forEach() with thisArg as a Symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest080()).assertEqual(true);
    });

    /**
     * @tc.name   SetForEachTest081
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8100
     * @tc.desc   Set containing SharedArrayBuffer objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      if (typeof SharedArrayBuffer === 'undefined') {
        return;
      }

      const sab1 = new SharedArrayBuffer(8);
      const sab2 = new SharedArrayBuffer(8);
      const set = new Set([sab1, sab2]);
      const visited: number[] = [];

      set.forEach(sab => visited.push(sab.byteLength));

      expect(visited).assertDeepEquals([8, 8]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest082
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8200
     * @tc.desc   forEach() called in a Web Worker-like context
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest082()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest083
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8300
     * @tc.desc   Callback that uses eval() to modify behavior
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest083()).assertDeepEquals([1, 4]);
    });

    /**
     * @tc.name   SetForEachTest084
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8400
     * @tc.desc   Set with elements that are error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const set = new Set([error1, error2, error1]);
      const visited: string[] = [];

      set.forEach(err => visited.push(err.message));

      expect(visited).assertDeepEquals(['Error 1', 'Error 2']);
    });

    /**
     * @tc.name   SetForEachTest085
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8500
     * @tc.desc   forEach() with callback that's a Proxy to a function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest085()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   SetForEachTest086
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8600
     * @tc.desc   Set containing both NaN and other numeric values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([NaN, 1, NaN, 2, NaN]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(3);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest087
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8700
     * @tc.desc   forEach() called on a Set with overridden forEach method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest087()).assertDeepEquals([99]);
    });

    /**
     * @tc.name   SetForEachTest088
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8800
     * @tc.desc   Callback that uses the 'arguments' object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a']);
      let argsLog = SetForEachTest088(set) as (string | Set<string>)[] | null;

      expect(argsLog!.length).assertEqual(3);
      expect(argsLog![0]).assertEqual('a');
      expect(argsLog![1]).assertEqual('a');
      expect(argsLog![2]).assertEqual(set);
    });

    /**
     * @tc.name   SetForEachTest089
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8900
     * @tc.desc   Set with elements that are DOM element-like objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        tagName: string,
        id: string
      }

      const elem1 = { tagName: 'DIV', id: 'a' } as BaseI;
      const elem2 = { tagName: 'SPAN', id: 'b' } as BaseI;
      const set = new Set([elem1, elem2]);
      const visited: string[] = [];

      set.forEach(elem => {
        visited.push(`${elem.tagName}:${elem.id}`);
      });

      expect(visited).assertDeepEquals(['DIV:a', 'SPAN:b']);
    });

    /**
     * @tc.name   SetForEachTest090
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9000
     * @tc.desc   forEach() with thisArg as a BigInt primitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([2n]);
      expect(SetForEachTest090(set)).assertEqual(6n);
    });

    /**
     * @tc.name   SetForEachTest091
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9100
     * @tc.desc   Set containing Int32Array views of the same buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new Int32Array(buffer, 0, 2);
      const view2 = new Int32Array(buffer, 4, 1);
      const set = new Set([view1, view2]);
      const visited: number[][] = [];

      view1[0] = 10;
      view1[1] = 20;
      view2[0] = 30;

      set.forEach(view => visited.push(Array.from(view)));

      expect(visited).assertDeepEquals([[10, 30], [30]]);
    });

    /**
     * @tc.name   SetForEachTest092
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9200
     * @tc.desc   forEach() in a strict mode function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      'use strict';

      const set = new Set([1, 2]);
      const visited: number[] = [];

      const callback = (value: number) => {
        visited.push(value);
      };

      set.forEach(callback);

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest093
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9300
     * @tc.desc   Callback that modifies a closed-over variable in outer scope
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      let outerVar = 0;

      const createCallback = () => {
        return (value: number) => {
          outerVar += value;
        };
      };

      set.forEach(createCallback());

      expect(outerVar).assertEqual(6);
    });

    /**
     * @tc.name   SetForEachTest094
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9400
     * @tc.desc   Set with elements that are regex objects with same pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const regex1 = /pattern/;
      const regex2 = /pattern/;
      const set = new Set([regex1, regex2]);
      const visited: string[] = [];

      set.forEach(regex => visited.push(regex.source));

      expect(visited).assertDeepEquals(['pattern', 'pattern']);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest095
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9500
     * @tc.desc   forEach() with callback that's a bound function with arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([10, 20]);
      const results = SetForEachTest095(set) as number[];

      expect(results).assertDeepEquals([100 + (5 * 10), 100 + (5 * 20)]);
      expect(results).assertDeepEquals([150, 200]);
    });

    /**
     * @tc.name   SetForEachTest096
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9600
     * @tc.desc   Set containing both primitives and their object wrappers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const numPrimitive = 123;
      const numObject = new Number(123);
      const strPrimitive = 'test';
      const strObject = new String('test');

      const set = new Set([numPrimitive, numObject, strPrimitive, strObject]);

      interface BaseI {
        value: string | number,
        type: string
      }

      const visited: BaseI[] = [];

      set.forEach(value => {
        visited.push({ value: value.valueOf(), type: typeof value });
      });

      expect(visited.length).assertEqual(4);
      expect(visited[0].value).assertEqual(123);
      expect(visited[0].type).assertEqual('number');
      expect(visited[1].value).assertEqual(123);
      expect(visited[1].type).assertEqual('object');
    });

    /**
     * @tc.name   SetForEachTest097
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9700
     * @tc.desc   forEach() called on a Set with a modified 'add' method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number>();
      expect(SetForEachTest097(set)).assertDeepEquals([4, 9]);
    });

    /**
     * @tc.name   SetForEachTest098
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9800
     * @tc.desc   Callback that uses 'this' from multiple nested functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest098()).assertEqual(10);
    });

    /**
     * @tc.name   SetForEachTest099
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9900
     * @tc.desc   Set with elements that are generator objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest099()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest100
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10000
     * @tc.desc   Comprehensive final test with mixed scenarios
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL4, async () => {
      const result = SetForEachTest100();
      expect(result[0]).assertEqual(14);
      expect(result[1]).assertEqual(14);
      expect(result[2]).assertEqual(42);
      expect(result[3]).assertEqual(true);
      expect(result[4]).assertEqual('modified');
      expect(result[5]).assertEqual(true);
      expect(result[6]).assertEqual(false);
    });

    /**
     * @tc.name   SetForEachTest101
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10100
     * @tc.desc   Traverse Set with elements that are WeakMap instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {}

      const wm1 = new WeakMap<BaseI, string>();
      const wm2 = new WeakMap<BaseI, string>();
      const key1 = {} as BaseI;
      const key2 = {} as BaseI;
      wm1.set(key1, 'value1');
      wm2.set(key2, 'value2');
      const set = new Set([wm1, wm2]);
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
     * @tc.name   SetForEachTest102
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10200
     * @tc.desc   forEach() with callback that uses Function.prototype.call to change 'this'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest102()).assertDeepEquals([30, 60]);
    });

    /**
     * @tc.name   SetForEachTest103
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10300
     * @tc.desc   Set containing objects with custom valueOf methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        value: number;
        valueOf: () => number;
      }

      const obj1 = {
        value: 5,
        valueOf: () => {
          return obj1.value * 2;
        }
      } as BaseI;
      const obj2 = {
        value: 3,
        valueOf: () => {
          return obj2.value * 3;
        }
      } as BaseI;
      const set = new Set([obj1, obj2]);
      const visited: number[] = [];

      set.forEach(value => {
        visited.push(value.valueOf() as number);
      });

      expect(visited).assertDeepEquals([10, 9]);
    });

    /**
     * @tc.name   SetForEachTest104
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10400
     * @tc.desc   forEach() called on a Set with a modified 'delete' method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest104();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.name   SetForEachTest106
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10600
     * @tc.desc   Callback that uses Promise within forEach (no await)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const immediateResults: number[] = [];
      const asyncResults: number[] = [];

      set.forEach(value => {
        immediateResults.push(value);
        Promise.resolve().then(() => {
          asyncResults.push(value);
        });
      });

      expect(immediateResults).assertDeepEquals([1, 2]);
      expect(asyncResults).assertDeepEquals([]);

      await new Promise<number>(resolve => setTimeout(resolve, 0));
      expect(asyncResults).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   SetForEachTest107
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10700
     * @tc.desc   Set containing objects with circular references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        self?: BaseI
      }

      const obj = {} as BaseI;
      obj.self = obj;
      const set = new Set([obj]);
      const visited: boolean[] = [];

      set.forEach(value => {
        visited.push(value.self === value);
      });

      expect(visited).assertDeepEquals([true]);
      expect(visited.length).assertEqual(1);
    });

    /**
     * @tc.name   SetForEachTest108
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10800
     * @tc.desc   forEach() with callback that is a class method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class Processor {
        private multiplier: number;
        results: number[];

        constructor(multiplier: number) {
          this.multiplier = multiplier;
          this.results = [];
        }

        process(value: number) {
          this.results.push(value * this.multiplier);
        }
      }

      const processor = new Processor(5);
      const set = new Set([2, 3]);

      set.forEach(processor.process.bind(processor));

      expect(processor.results).assertDeepEquals([10, 15]);
    });

    /**
     * @tc.name   SetForEachTest109
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10900
     * @tc.desc   Traverse Set with elements that are ArrayBuffer views of different types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(4);
      const intView = new Int32Array(buffer);
      const uintView = new Uint32Array(buffer);
      const floatView = new Float32Array(buffer);

      intView[0] = -1;
      const set = new Set([intView, uintView, floatView]);
      const visited: number[] = [];

      set.forEach(view => {
        visited.push(view[0]);
      });

      expect(visited[0]).assertEqual(-1);
      expect(visited[1]).assertEqual(4294967295);
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.name   SetForEachTest110
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11000
     * @tc.desc   forEach() with thisArg as a frozen object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest110()).assertDeepEquals([12, 20]);
    });

    /**
     * @tc.name   SetForEachTest111
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11100
     * @tc.desc   forEach() with callback that uses optional chaining on elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        prop: string
      }

      const set = new Set([{ prop: 'a' } as BaseI, null, { prop: 'b' }, undefined]);
      const results: (string | undefined)[] = [];

      set.forEach(item => {
        results.push(item?.prop);
      });

      expect(results).assertDeepEquals(['a', undefined, 'b', undefined]);
    });

    /**
     * @tc.name   SetForEachTest112
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11200
     * @tc.desc   Traverse Set with elements that are class instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class Item {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }

        getIdentifier() {
          return `item-${this.id}`;
        }
      }

      const set = new Set([new Item(1), new Item(2), new Item(1)]);
      const identifiers: string[] = [];

      set.forEach(item => {
        identifiers.push(item.getIdentifier());
      });

      expect(identifiers).assertDeepEquals(['item-1', 'item-2', "item-1"]);
    });

    /**
     * @tc.name   SetForEachTest113
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11300
     * @tc.desc   forEach() with callback that uses nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([0, '', null, undefined, 42, 'hello']);
      const results: (string | number)[] = [];

      set.forEach(value => {
        results.push(value ?? 'default');
      });

      expect(results).assertDeepEquals([0, '', 'default', 'default', 42, 'hello']);
    });

    /**
     * @tc.name   SetForEachTest114
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11400
     * @tc.desc   Set containing elements with Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest114()).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.name   SetForEachTest115
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11500
     * @tc.desc   forEach() with async callback using await
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      const results: number[] = [];

      const processValue = async (value: number) => {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        return value * 2;
      };

      const promises: Promise<void>[] = [];
      set.forEach(value => {
        promises.push((async () => {
          results.push(await processValue(value));
        })());
      });

      await Promise.all(promises);
      expect(results.sort((a, b) => a - b)).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   SetForEachTest116
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11600
     * @tc.desc   Set with elements that are WeakSet instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {}

      const ws1 = new WeakSet();
      const ws2 = new WeakSet();
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
      ws1.add(obj1);
      ws2.add(obj2);

      const set = new Set([ws1, ws2]);
      const results: boolean[] = [];

      set.forEach(ws => {
        results.push(ws.has(obj1), ws.has(obj2));
      });

      expect(results).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.name   SetForEachTest117
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11700
     * @tc.desc   forEach() with callback that uses logical assignment operators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a', 'b', 'a', 'c']);
      const result: Record<string, number> = {};

      set.forEach(key => {
        result[key] ??= 0;
        result[key]++;
      });

      expect(result).assertDeepEquals({ a: 1, b: 1, c: 1 });
    });

    /**
     * @tc.name   SetForEachTest118
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11800
     * @tc.desc   Traverse Set with elements that are generator functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest118()).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.name   SetForEachTest119
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11900
     * @tc.desc   forEach() on Set with elements that are proxies
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest119()).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.name   SetForEachTest120
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12000
     * @tc.desc   Set containing elements with custom [Symbol.iterator]
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest120()).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.name   SetForEachTest121
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12100
     * @tc.desc   forEach() with callback that uses dynamic import()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      interface BaseI {
        id: string,
        value: string
      }

      const set = new Set(['first', 'second']);
      const results: string[] = [];

      const callback = async (id: string) => {
        const mockModule = { id, value: `value-${id}` } as BaseI;
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
     * @tc.name   SetForEachTest124
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12400
     * @tc.desc   Set containing elements with custom inspect methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        name: string,
        inspect: () => string
      }

      const obj1 = {
        name: 'obj1',
        inspect: () => `CustomInspect(${obj1.name})`
      } as BaseI;
      const obj2 = {
        name: 'obj2',
        inspect: () => `CustomInspect(${obj2.name})`
      } as BaseI;

      const set = new Set([obj1, obj2]);
      const inspections: string[] = [];

      set.forEach(obj => {
        inspections.push(obj.inspect());
      });

      expect(inspections).assertDeepEquals(['CustomInspect(obj1)', 'CustomInspect(obj2)']);
    });

    /**
     * @tc.name   SetForEachTest127
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12700
     * @tc.desc   forEach() with callback that uses String.prototype.replaceAll()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a.b.c', 'x.y.z', '1.2.3']);
      const results: string[] = [];

      set.forEach(str => {
        results.push(str.replaceAll('.', '-'));
      });

      expect(results).assertDeepEquals(['a-b-c', 'x-y-z', '1-2-3']);
    });

    /**
     * @tc.name   SetForEachTest129
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12900
     * @tc.desc   forEach() on Set with elements that are Map instances with same entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map([['key', 'value1']]);
      const map2 = new Map([['key', 'value1']]);
      const set = new Set([map1, map2]);
      const entries: [string, string][] = [];

      SetForEachTest129(set, entries);

      expect(entries).assertDeepEquals([['key', 'value1'], ['key', 'value1']]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   SetForEachTest130
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_13000
     * @tc.desc   Set with elements that are different TypedArray views of same buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('SetForEachTest130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(8);
      const int8View = new Int8Array(buffer);
      const uint8View = new Uint8Array(buffer);
      const int16View = new Int16Array(buffer);

      int8View.set([1, 2, 3, 4, 5, 6, 7, 8]);
      const set = new Set([int8View, uint8View, int16View]);
      const results: number[][] = [];

      set.forEach(view => {
        results.push(Array.from(view));
      });

      expect(results[0]).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(results[1]).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(results[2]).assertDeepEquals([513, 1027, 1541, 2055]);
    });

  });
}