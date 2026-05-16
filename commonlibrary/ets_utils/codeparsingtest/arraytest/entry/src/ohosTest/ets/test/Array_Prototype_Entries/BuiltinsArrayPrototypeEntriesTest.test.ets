/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium/index';
import Utils from '../Util.test';

class TestObj {
  id: number = 0;
  constructor(id: number) {
    this.id = id;
  }
}

interface GeneratedTypeLiteralInterface_1 {
  id: number;
  name: string;
}

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function BuiltinsArrayPrototypeEntriesTest(): void {
  describe("BuiltinsArrayPrototypeEntriesTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0100
     * @tc.desc    Verify entries() returns iterator object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = ['a', 'b', 'c'];
      const iterator = arr.entries();
      expect(iterator).not().assertNull();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0200
     * @tc.desc    Verify each iteration element is [index, value] format array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.value!).not().assertNull();
      expect(Array.isArray(result.value!)).assertTrue();
      expect(result.value!.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0300
     * @tc.desc    Verify iteration follows array index order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = ['x', 'y', 'z'];
      let index = 0;
      const iterator = arr.entries();
      let result = iterator.next();
      while (!result.done) {
        expect(result.value![0]).assertEqual(index);
        index++;
        result = iterator.next();
      }
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0400
     * @tc.desc    Verify empty array entries() behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr:string[] = [];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0500
     * @tc.desc    Verify empty array iterator produces no elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr:string[] = [];
      let count = 0;
      const iterator = arr.entries();
      let result = iterator.next();
      while (!result.done) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0600
     * @tc.desc    Verify single element array iteration behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayPrototypeEntriesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = ['only'];
      const iterator = arr.entries();
      const first = iterator.next();
      expect(first.value).not().assertNull();
      expect(first.value![0]).assertEqual(0);
      expect(first.value![1]).assertEqual('only');
      expect(first.done).assertFalse();
      const second = iterator.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0700
     * @tc.desc    Verify next() method returns correct format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const iterator = arr.entries();
      const result = iterator.next();

      expect(result.value).not().assertUndefined();
      expect(result.done).not().assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0800
     * @tc.desc    Verify done property is true after iteration completes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1];
      const iterator = arr.entries();
      iterator.next();
      const afterDone = iterator.next();
      expect(afterDone.done).assertTrue();
      expect(afterDone.value).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_0900
     * @tc.desc    Verify iterator cannot be reset
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const iterator1 = arr.entries();
      iterator1.next();
      const iterator2 = arr.entries();
      const result1 = iterator1.next();
      const result2 = iterator2.next();
      expect(result1.value).not().assertNull();
      expect(result1.value![0]).assertEqual(1);
      expect(result1.value![1]).assertEqual('b');
      expect(result2.value).not().assertNull();
      expect(result2.value![0]).assertEqual(0);
      expect(result2.value![1]).assertEqual('a');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1000
     * @tc.desc    Verify iterator implements iterable protocol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const iterator = arr.entries();
      expect(iterator.next).not().assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1100
     * @tc.desc    Verify large array iteration performance and correctness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      const iterator = arr.entries();
      const entries: [number, number][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(1000);
      expect(entries[999][0]).assertEqual(999);
      expect(entries[999][1]).assertEqual(999);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1200
     * @tc.desc    Verify large array boundary index correctness
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (string | undefined)[] = new Array<string | undefined>(10000);
      arr[0] = 'first';
      arr[9999] = 'last';
      const iterator = arr.entries();
      const firstResult = iterator.next();

      expect(firstResult.value).not().assertNull();
      expect(firstResult.value![0]).assertEqual(0);
      expect(firstResult.value![1]).assertEqual('first');

      let last: [number, string | undefined] | undefined = undefined;
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          last = [result.value![0], result.value![1]];
        }
        result = iterator.next();
      }

      expect(last).not().assertNull();
      if (last) {
        expect(last[0]).assertEqual(9999);
        expect(last[1]).assertEqual('last');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1300
     * @tc.desc    Verify two-dimensional array iteration behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [['a', 'b'], ['c', 'd']];
      const iterator = arr.entries();
      const entries: [number, string[]][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(Array.isArray(entries[0][1])).assertTrue();
      expect(entries[1][0]).assertEqual(1);
      expect(Array.isArray(entries[1][1])).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1400
     * @tc.desc    Verify three-dimensional array iteration behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
      const entries = Array.from(arr.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[1][0]).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1500
     * @tc.desc    Verify object array iteration behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [new TestObj(1), new TestObj(2), new TestObj(3)];
      const iterator = arr.entries();
      const entries: [number, TestObj][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1].id).assertEqual(1);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1].id).assertEqual(2);
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1].id).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1600
     * @tc.desc    Verify array containing undefined and null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (undefined | null)[] = [undefined, null, undefined];
      const iterator = arr.entries();
      const entries: [number, undefined | null][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertUndefined();
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertNull();
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1700
     * @tc.desc    Verify boolean array iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true];
      const iterator = arr.entries();
      const entries: [number, boolean][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertTrue();
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertFalse();
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1800
     * @tc.desc    Verify number array iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [0, 1, -1, 3.14, Infinity, -Infinity, NaN];
      const iterator = arr.entries();
      const entries: [number, number][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(7);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual(0);
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual(1);
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertEqual(-1);
      expect(entries[3][0]).assertEqual(3);
      expect(entries[3][1]).assertEqual(3.14);
      expect(entries[4][0]).assertEqual(4);
      expect(entries[4][1]).assertEqual(Infinity);
      expect(entries[5][0]).assertEqual(5);
      expect(entries[5][1]).assertEqual(-Infinity);
      expect(entries[6][0]).assertEqual(6);
      expect(isNaN(entries[6][1])).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_1900
     * @tc.desc    Verify string array iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['', 'hello', 'world'];
      const iterator = arr.entries();
      const entries: [number, string][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual('');
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual('hello');
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertEqual('world');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2000
     * @tc.desc    Verify function array iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fn1 = (): string => 'a';
      const fn2 = (): string => 'b';
      const arr: (() => string)[] = [fn1, fn2];
      const iterator = arr.entries();
      const entries: [number, () => string][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(typeof entries[0][1]).assertEqual('function');
      expect(entries[0][1]()).assertEqual('a');
      expect(entries[1][0]).assertEqual(1);
      expect(typeof entries[1][1]).assertEqual('function');
      expect(entries[1][1]()).assertEqual('b');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2100
     * @tc.desc    Verify array with length 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = [];
      arr.length = 0;
      const iterator = arr.entries();
      const entries: [number, string][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2200
     * @tc.desc    Verify array with length 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['only'];
      arr.length = 1;
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('only');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2300
     * @tc.desc    Verify adding elements during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr.push('c');
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('b');
      }
      const thirdResult = iterator.next();
      expect(thirdResult.value).not().assertNull();
      if (thirdResult.value) {
        expect(thirdResult.value![0]).assertEqual(2);
        expect(thirdResult.value![1]).assertEqual('c');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2400
     * @tc.desc    Verify deleting elements during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr.pop();
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('b');
      }
      const thirdResult = iterator.next();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2500
     * @tc.desc    Verify modifying length during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr.length = 2;
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('b');
      }
      const thirdResult = iterator.next();
      expect(thirdResult.done).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2600
     * @tc.desc    Verify modifying current element during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr[1] = 'modified';
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('modified');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2700
     * @tc.desc    Verify modifying unvisited element during iteration
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const result: string[] = [];
      const iterator = arr.entries();
      let iterResult = iterator.next();
      while (!iterResult.done) {
        if (iterResult.value) {
          const index = iterResult.value![0];
          const value = iterResult.value![1];
          if (index === 0) {
            arr[2] = 'changed';
          }
          result.push(value);
        }
        iterResult = iterator.next();
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('changed');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2800
     * @tc.desc    Compare entries() and keys() output
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];

      const entries = Array.from(arr.entries());
      const keys = Array.from(arr.keys());

      expect(entries.length).assertEqual(3);
      expect(keys.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual('a');
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual('b');
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertEqual('c');
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_2900
     * @tc.desc    Compare entries() and values() output
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];

      const entries = Array.from(arr.entries());
      const values = Array.from(arr.values());

      expect(entries.length).assertEqual(3);
      expect(values.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual('a');
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual('b');
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertEqual('c');
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3000
     * @tc.desc    Use entries(), keys() and values() together
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entriesIterator = arr.entries();
      const keysIterator = arr.keys();
      const valuesIterator = arr.values();

      const entriesResult = entriesIterator.next();
      const keysResult = keysIterator.next();
      const valuesResult = valuesIterator.next();

      expect(entriesResult.value).not().assertNull();
      if (entriesResult.value) {
        expect(entriesResult.value![0]).assertEqual(0);
        expect(entriesResult.value![1]).assertEqual('a');
      }
      expect(keysResult.value).assertEqual(0);
      expect(valuesResult.value).assertEqual('a');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3100
     * @tc.desc    Compare entries() and forEach behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entriesResult: string[] = [];
      const forEachResult: string[] = [];

      const entriesIterator = arr.entries();
      let result = entriesIterator.next();
      while (!result.done) {
        if (result.value) {
          entriesResult.push(`${result.value![0]}:${result.value![1]}`);
        }
        result = entriesIterator.next();
      }

      arr.forEach((v, i) => {
        forEachResult.push(`${i}:${v}`);
      });

      expect(entriesResult.length).assertEqual(3);
      expect(forEachResult.length).assertEqual(3);
      expect(entriesResult[0]).assertEqual('0:a');
      expect(entriesResult[1]).assertEqual('1:b');
      expect(entriesResult[2]).assertEqual('2:c');
      expect(forEachResult[0]).assertEqual('0:a');
      expect(forEachResult[1]).assertEqual('1:b');
      expect(forEachResult[2]).assertEqual('2:c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3200
     * @tc.desc    Use entries() with map to transform array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entriesIterator = arr.entries();
      const entries: [number, string][] = [];
      let result = entriesIterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = entriesIterator.next();
      }

      const mapped: string[] = entries.map((entry) => `${entry[0]}:${entry[1]}`);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual('0:a');
      expect(mapped[1]).assertEqual('1:b');
      expect(mapped[2]).assertEqual('2:c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3300
     * @tc.desc    Use entries() with filter to filter array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const entriesIterator = arr.entries();
      const entries: [number, string][] = [];
      let result = entriesIterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = entriesIterator.next();
      }

      const filtered: [number, string][] = entries.filter((entry) => entry[0] % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0][0]).assertEqual(0);
      expect(filtered[0][1]).assertEqual('a');
      expect(filtered[1][0]).assertEqual(2);
      expect(filtered[1][1]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3400
     * @tc.desc    Use entries() with reduce to transform array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entriesIterator = arr.entries();
      const entries: [number, string][] = [];
      let result = entriesIterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = entriesIterator.next();
      }

      const obj: Record<number, string> = entries.reduce((acc: Record<number, string>, entry) => {
        acc[entry[0]] = entry[1];
        return acc;
      }, {} as Record<number, string>);
      expect(obj[0]).assertEqual('a');
      expect(obj[1]).assertEqual('b');
      expect(obj[2]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3500
     * @tc.desc    Verify string array entries() return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.value).not().assertNull();
      if (result.value) {
        expect(result.value![0]).assertEqual(0);
        expect(result.value![1]).assertEqual('a');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3600
     * @tc.desc    Verify number array entries() return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.value).not().assertNull();
      if (result.value) {
        expect(result.value![0]).assertEqual(0);
        expect(result.value![1]).assertEqual(1);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3700
     * @tc.desc    Verify object array entries() return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<TestObj> = [new TestObj(1), new TestObj(2)];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.value).not().assertNull();
      if (result.value) {
        expect(result.value![0]).assertEqual(0);
        expect(result.value![1]).not().assertNull();
        expect(result.value![1].id).assertEqual(1);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3800
     * @tc.desc    Verify mixed type array entries() return type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string | number | boolean> = ['a', 1, true];
      const iterator = arr.entries();
      const result = iterator.next();
      expect(result.value).not().assertNull();
      if (result.value) {
        expect(result.value![0]).assertEqual(0);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_3900
     * @tc.desc    Verify entries() returns IterableIterator<[number, T]>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const iterator = arr.entries();
      expect(typeof iterator.next).assertEqual('function');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4000
     * @tc.desc    Verify behavior after iteration completes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b'];
      const iterator = arr.entries();
      iterator.next();
      iterator.next();
      const result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4100
     * @tc.desc    Verify multiple iterators can work independently
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b', 'c'];
      const iterator1 = arr.entries();
      const iterator2 = arr.entries();

      const result1 = iterator1.next();
      const result2 = iterator2.next();
      expect(result1.value).not().assertNull();
      expect(result2.value).not().assertNull();
      if (result1.value && result2.value) {
        expect(result1.value![0]).assertEqual(0);
        expect(result1.value![1]).assertEqual('a');
        expect(result2.value![0]).assertEqual(0);
        expect(result2.value![1]).assertEqual('a');
      }

      const result3 = iterator1.next();
      const result4 = iterator2.next();
      expect(result3.value).not().assertNull();
      expect(result4.value).not().assertNull();
      if (result3.value && result4.value) {
        expect(result3.value![0]).assertEqual(1);
        expect(result3.value![1]).assertEqual('b');
        expect(result4.value![0]).assertEqual(1);
        expect(result4.value![1]).assertEqual('b');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4200
     * @tc.desc    Verify large array iteration performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const iterator = arr.entries();
      let count = 0;
      let result = iterator.next();
      while (!result.done) {
        count++;
        result = iterator.next();
      }
      expect(count).assertEqual(10000);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4300
     * @tc.desc    Use entries() to convert array to object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const entries: [number, string][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }

      const obj: Record<number, string> = {};
      entries.forEach((entry) => {
        obj[entry[0]] = entry[1];
      });
      expect(obj[0]).assertEqual('a');
      expect(obj[1]).assertEqual('b');
      expect(obj[2]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4400
     * @tc.desc    Use entries() to find element index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'b'];
      const iterator = arr.entries();
      let foundIndex: number | undefined = undefined;
      let result = iterator.next();
      while (!result.done) {
        if (result.value && result.value![1] === 'b') {
          foundIndex = result.value![0];
          break;
        }
        result = iterator.next();
      }
      expect(foundIndex).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4500
     * @tc.desc    Use entries() for conditional filtering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const iterator = arr.entries();
      const entries: [number, number][] = [];
      let result = iterator.next();
      while (!result.done) {
        if (result.value) {
          entries.push([result.value![0], result.value![1]]);
        }
        result = iterator.next();
      }

      const filtered: [number, number][] = entries.filter((entry) => entry[1] % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0][0]).assertEqual(1);
      expect(filtered[0][1]).assertEqual(2);
      expect(filtered[1][0]).assertEqual(3);
      expect(filtered[1][1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4600
     * @tc.desc    Verify iterator holds reference to original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr[1] = 'modified';
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('modified');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4700
     * @tc.desc    Verify effect of array clearing on iterator
     * @tc.type    FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr.length = 0;
      const secondResult = iterator.next();
      expect(secondResult.done).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4800
     * @tc.desc    Verify effect of array replacement on iterator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      const firstResult = iterator.next();
      expect(firstResult.value).not().assertNull();
      if (firstResult.value) {
        expect(firstResult.value![0]).assertEqual(0);
        expect(firstResult.value![1]).assertEqual('a');
      }
      arr[0] = 'x';
      arr[1] = 'y';
      arr[2] = 'z';
      const secondResult = iterator.next();
      expect(secondResult.value).not().assertNull();
      if (secondResult.value) {
        expect(secondResult.value![0]).assertEqual(1);
        expect(secondResult.value![1]).assertEqual('y');
      }
      const thirdResult = iterator.next();
      expect(thirdResult.value).not().assertNull();
      if (thirdResult.value) {
        expect(thirdResult.value![0]).assertEqual(2);
        expect(thirdResult.value![1]).assertEqual('z');
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_4900
     * @tc.desc    Verify custom iterable behavior with Array.from
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b'];
      const entries = Array.from(arr.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual('a');
      expect(entries[1][0]).assertEqual(1);
      expect(entries[1][1]).assertEqual('b');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5000
     * @tc.desc    Verify iterator behavior after multiple next() calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const iterator = arr.entries();
      let result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value![0]).assertEqual(0);
      expect(result.value![1]).assertEqual('a');

      result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value![0]).assertEqual(1);
      expect(result.value![1]).assertEqual('b');

      result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value![0]).assertEqual(2);
      expect(result.value![1]).assertEqual('c');

      result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();

      result = iterator.next();
      expect(result.done).assertTrue();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5100
     * @tc.desc    Verify iterator basic protocol
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b'];
      const iterator = arr.entries();
      expect(typeof iterator.next).assertEqual('function');

      const result = iterator.next();
      expect(result.done).assertFalse();
      expect(result.value![0]).assertEqual(0);
      expect(result.value![1]).assertEqual('a');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5200
     * @tc.desc    Verify indexed mapping using entries()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const names = ['Alice', 'Bob', 'Charlie'];
      const iterator = names.entries();
      const indexedNames: GeneratedTypeLiteralInterface_1[] = [];
      let iterResult = iterator.next();
      while (!iterResult.done) {
        if (iterResult.value) {
          const index = iterResult.value![0];
          const name = iterResult.value![1];
          indexedNames.push({ id: index + 1, name });
        }
        iterResult = iterator.next();
      }
      expect(indexedNames.length).assertEqual(3);
      expect(indexedNames[0].id).assertEqual(1);
      expect(indexedNames[0].name).assertEqual('Alice');
      expect(indexedNames[1].id).assertEqual(2);
      expect(indexedNames[1].name).assertEqual('Bob');
      expect(indexedNames[2].id).assertEqual(3);
      expect(indexedNames[2].name).assertEqual('Charlie');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5300
     * @tc.desc    Verify entries() with array reverse
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Array.from(arr.entries());
      const reversed = entries.reverse();
      expect(reversed[0][0]).assertEqual(2);
      expect(reversed[0][1]).assertEqual('c');
      expect(reversed[1][0]).assertEqual(1);
      expect(reversed[1][1]).assertEqual('b');
      expect(reversed[2][0]).assertEqual(0);
      expect(reversed[2][1]).assertEqual('a');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5400
     * @tc.desc    Verify entries() with array sort
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [3, 1, 2];
      const entries = Array.from(arr.entries());
      const sorted = entries.sort((a, b) => a[1] - b[1]);
      expect(sorted[0][0]).assertEqual(1);
      expect(sorted[0][1]).assertEqual(1);
      expect(sorted[1][0]).assertEqual(2);
      expect(sorted[1][1]).assertEqual(2);
      expect(sorted[2][0]).assertEqual(0);
      expect(sorted[2][1]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5500
     * @tc.desc    Verify entries() with array slice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'd', 'e'];
      const entries = Array.from(arr.entries());
      const sliced = entries.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0][0]).assertEqual(1);
      expect(sliced[0][1]).assertEqual('b');
      expect(sliced[1][0]).assertEqual(2);
      expect(sliced[1][1]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5600
     * @tc.desc    Verify entries() with array concat
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: string[] = ['a', 'b'];
      const arr2: string[] = ['c', 'd'];
      const entries1 = Array.from(arr1.entries());
      const entries2 = Array.from(arr2.entries());
      const combined = entries1.concat(entries2);
      expect(combined.length).assertEqual(4);
      expect(combined[0][0]).assertEqual(0);
      expect(combined[0][1]).assertEqual('a');
      expect(combined[2][0]).assertEqual(0);
      expect(combined[2][1]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5700
     * @tc.desc    Verify entries() with array splice
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const entries = Array.from(arr.entries());
      const spliced = entries.splice(1, 2);
      expect(spliced.length).assertEqual(2);
      expect(spliced[0][0]).assertEqual(1);
      expect(spliced[0][1]).assertEqual('b');
      expect(spliced[1][0]).assertEqual(2);
      expect(spliced[1][1]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5800
     * @tc.desc    Verify entries() with array indexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Array.from(arr.entries());
      const index = entries.indexOf(entries[1]);
      expect(index).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_5900
     * @tc.desc    Verify entries() with array includes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Array.from(arr.entries());
      const includes = entries.includes(entries[1]);
      expect(includes).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6000
     * @tc.desc    Verify entries() with array join
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const entries = Array.from(arr.entries());
      const joined = entries.map((entry) => entry.join(':')).join(',');
      expect(joined).assertEqual('0:1,1:2,2:3');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6100
     * @tc.desc    Verify entries() with array toString
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const entries = Array.from(arr.entries());
      const str = entries.toString();
      expect(str).assertEqual('0,1,1,2,2,3');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6200
     * @tc.desc    Verify entries() with array some
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const entries = Array.from(arr.entries());
      const some = entries.some((entry) => entry[1] > 3);
      expect(some).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6300
     * @tc.desc    Verify entries() with array every
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [2, 4, 6];
      const entries = Array.from(arr.entries());
      const every = entries.every((entry) => entry[1] % 2 === 0);
      expect(every).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6400
     * @tc.desc    Verify entries() with array find
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const entries = Array.from(arr.entries());
      const found = entries.find((entry) => entry[1] > 2);
      expect(found).not().assertNull();
      if (found) {
        expect(found[0]).assertEqual(2);
        expect(found[1]).assertEqual(3);
      }
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6500
     * @tc.desc    Verify entries() with array findIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const entries = Array.from(arr.entries());
      const index = entries.findIndex((entry) => entry[1] > 2);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6600
     * @tc.desc    Verify entries() with array flatMap
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const entries = Array.from(arr.entries());
      const flatMapped = entries.flatMap((entry) => [entry[0], entry[1]]);
      expect(flatMapped.length).assertEqual(6);
      expect(flatMapped[0]).assertEqual(0);
      expect(flatMapped[1]).assertEqual(1);
      expect(flatMapped[2]).assertEqual(1);
      expect(flatMapped[3]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6700
     * @tc.desc    Verify entries() with array copyWithin
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const entries = Array.from(arr.entries());
      const copied = entries.copyWithin(0, 3);
      expect(copied[0][0]).assertEqual(3);
      expect(copied[0][1]).assertEqual(4);
      expect(copied[1][0]).assertEqual(4);
      expect(copied[1][1]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6800
     * @tc.desc    Verify entries() with array fill
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const entries = Array.from(arr.entries());
      const filled = entries.fill([99, 100], 1, 3);
      expect(filled[0][0]).assertEqual(0);
      expect(filled[0][1]).assertEqual(1);
      expect(filled[1][0]).assertEqual(99);
      expect(filled[1][1]).assertEqual(100);
      expect(filled[2][0]).assertEqual(99);
      expect(filled[2][1]).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_6900
     * @tc.desc    Verify entries() with array pop
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Array.from(arr.entries());
      const popped = entries.pop();
      expect(popped).not().assertNull();
      if (popped) {
        expect(popped[0]).assertEqual(2);
        expect(popped[1]).assertEqual('c');
      }
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_7000
     * @tc.desc    Verify entries() with array push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b'];
      const entries = Array.from(arr.entries());
      const length = entries.push([2, 'c']);
      expect(length).assertEqual(3);
      expect(entries[2][0]).assertEqual(2);
      expect(entries[2][1]).assertEqual('c');
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest7100
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_7100
     * @tc.desc    Verify entries() with array shift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const entries = Array.from(arr.entries());
      const shifted = entries.shift();
      expect(shifted).not().assertNull();
      if (shifted) {
        expect(shifted[0]).assertEqual(0);
        expect(shifted[1]).assertEqual('a');
      }
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayPrototypeEntriesTest7200
     * @tc.number  SUB_BUILTINS_ARRAY_PROTOTYPE_ENTRIES_TEST_7200
     * @tc.desc    Verify entries() with array unshift
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayPrototypeEntriesTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['b', 'c'];
      const entries = Array.from(arr.entries());
      const length = entries.unshift([0, 'a']);
      expect(length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[0][1]).assertEqual('a');
    });

  })
}
