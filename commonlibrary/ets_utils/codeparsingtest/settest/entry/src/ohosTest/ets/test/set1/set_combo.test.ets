/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { setComboTest0007, setComboTest0008, setComboTest0009 } from './set_combo';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

interface GeneratedObjectLiteralInterface_1 {
  id?: number
}

export default function SetComboTest() {
  describe('SetComboTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
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
     * @tc.number SUB_SET_COMBO_TEST_0001
     * @tc.name setComboTest0001
     * @tc.desc add + has: After adding elements, verify that has() can correctly identify existing elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string | number | null>();
      set.add('test').add(123).add(null);
      expect(set.has('test')).assertEqual(true);
      expect(set.has(123)).assertEqual(true);
      expect(set.has(null)).assertEqual(true);
      expect(set.has('nonexistent')).assertEqual(false);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0002
     * @tc.name setComboTest0002
     * @tc.desc add + size: After adding duplicate elements, verify that the size property is correct (automatic deduplication)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number>();
      set.add(1).add(2).add(1).add(3);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0003
     * @tc.name setComboTest0003
     * @tc.desc delete + has: After deleting an element, verify that has() cannot identify the deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['a', 'b', 'c']);
      set.delete('b');
      expect(set.has('b')).assertEqual(false);
      expect(set.has('a')).assertEqual(true); // Undeleted elements are still identifiable
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0004
     * @tc.name setComboTest0004
     * @tc.desc delete + size: After deleting a non-existent element, verify that the size property remains unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30]);
      const originalSize = set.size;
      set.delete(40); // Delete non-existent element
      expect(set.size).assertEqual(originalSize);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0005
     * @tc.name setComboTest0005
     * @tc.desc clear + has: After clearing the Set, verify that has() returns false for all elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['x', 'y']);
      set.clear();
      expect(set.has('x')).assertEqual(false);
      expect(set.has('y')).assertEqual(false);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0006
     * @tc.name setComboTest0006
     * @tc.desc clear + size: After clearing the Set, verify that the size property is 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([true, false, undefined]);
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0007
     * @tc.name setComboTest0007
     * @tc.desc add + [Symbol.iterator]: After adding mixed-type elements, verify that the iteration order is consistent with the insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string | number | GeneratedObjectLiteralInterface_1>();
      const obj: GeneratedObjectLiteralInterface_1 = {};
      set.add(obj).add('str').add(NaN);
      const result = setComboTest0007(set) as (string | number | GeneratedObjectLiteralInterface_1)[];
      expect(result[0]).assertEqual(obj); // Match object reference
      expect(result[1]).assertEqual('str');
      expect(isNaN(result[2] as number)).assertEqual(true);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0008
     * @tc.name setComboTest0008
     * @tc.desc add + values(): After adding multiple elements, verify that the values() iterator is completely consistent with the Set elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['apple', 'banana', 'cherry']);
      const values = setComboTest0008(set) as (string)[];
      expect(values.length).assertEqual(3);
      expect(values.includes('apple')).assertEqual(true);
      expect(values.includes('banana')).assertEqual(true);
      expect(values.includes('cherry')).assertEqual(true);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0009
     * @tc.name setComboTest0009
     * @tc.desc add + entries(): After adding elements, verify that the entries() iteration result is in [value, value] format
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1n, 'test', true]);
      const entries = setComboTest0009(set) as (bigint | string | boolean)[][];
      expect(entries[0][0]).assertEqual(1n);
      expect(entries[0][1]).assertEqual(1n);
      expect(entries[1][0]).assertEqual('test');
      expect(entries[1][1]).assertEqual('test');
      expect(entries[2][0]).assertEqual(true);
      expect(entries[2][1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0010
     * @tc.name setComboTest0010
     * @tc.desc delete + [Symbol.iterator]: After deleting the first element, verify that the iteration result does not contain the element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2, 3, 4]);
      set.delete(1);
      const result = setComboTest0007(set) as number[];
      expect(JSON.stringify(result)).assertEqual('[2,3,4]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0011
     * @tc.name setComboTest0011
     * @tc.desc delete + values(): After deleting multiple elements, verify that the values() iteration result is consistent with the remaining elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['a', 'b', 'c', 'd']);
      set.delete('b');
      set.delete('d');
      const values = setComboTest0008(set) as string[];
      expect(JSON.stringify(values)).assertEqual('["a","c"]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0012
     * @tc.name setComboTest0012
     * @tc.desc delete + entries(): After deleting the middle element, verify that the entries() iteration order is correct
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['x', 'y', 'z', 'w']);
      set.delete('y');
      const entries = setComboTest0009(set) as string[][];
      expect(JSON.stringify(entries)).assertEqual('[["x","x"],["z","z"],["w","w"]]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0013
     * @tc.name setComboTest0013
     * @tc.desc clear + [Symbol.iterator]: After adding multiple elements and clearing, verify that the iteration result is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2, 3, 4, 5]);
      set.clear();
      const result = setComboTest0007(set) as number[];
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0014
     * @tc.name setComboTest0014
     * @tc.desc clear + values(): After clearing an empty Set, verify that the values() iterator has no errors and the result is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.clear();
      const values = setComboTest0008(set) as string[];
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0015
     * @tc.name setComboTest0015
     * @tc.desc clear + entries(): After adding complex elements and clearing, verify that the entries() iteration result is empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<Date| number[] | GeneratedObjectLiteralInterface_1>([{ id: 1 } as GeneratedObjectLiteralInterface_1, [1, 2, 3], new Date()]);
      set.clear();
      const entries = setComboTest0009(set) as (Date| number[] | GeneratedObjectLiteralInterface_1)[][];
      expect(JSON.stringify(entries)).assertEqual('[]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0025
     * @tc.name setComboTest0025
     * @tc.desc add + values: After adding elements (including duplicates), verify values() returns unique elements in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      set.add('a').add('b').add('a').add('c'); // Duplicate 'a' is ignored

      const values = setComboTest0008(set) as  string[];
      expect(JSON.stringify(values)).assertEqual('["a","b","c"]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0026
     * @tc.name setComboTest0026
     * @tc.desc delete + values: After deleting elements, verify values() does not include deleted elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['x', 'y', 'z', 'w']);
      set.delete('y');
      set.delete('w'); // Delete two elements

      const values = setComboTest0008(set) as string[];
      expect(JSON.stringify(values)).assertEqual('["x","z"]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0027
     * @tc.name setComboTest0027
     * @tc.desc clear + values: After clearing the set, verify values() returns empty iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2, 3]);
      set.clear();

      const values = setComboTest0008(set) as number[];
      expect(values.length).assertEqual(0);
      expect(JSON.stringify(values)).assertEqual('[]');
    });

    /**
     * 5. forEach() × Modifier Interfaces
     */

    /**
     * @tc.number SUB_SET_COMBO_TEST_0028
     * @tc.name setComboTest0028
     * @tc.desc add + forEach: After adding mixed-type elements, verify forEach() iterates all elements in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<number | boolean | GeneratedObjectLiteralInterface_1 | null>();
      const result: (number | boolean | GeneratedObjectLiteralInterface_1 | null)[] = [];
      set.add(1).add(true).add({ id: 1 }).add(null);

      set.forEach((val) => result.push(val));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
      expect((result[2] as GeneratedObjectLiteralInterface_1).id).assertEqual(1);
      expect(result[3]).assertEqual(null);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0029
     * @tc.name setComboTest0029
     * @tc.desc delete + forEach: After deleting elements, verify forEach() iterates only remaining elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30, 40]);
      const result: number[] = [];
      set.delete(20);
      set.delete(30); // Delete middle elements

      set.forEach((val) => result.push(val));
      expect(JSON.stringify(result)).assertEqual('[10,40]');
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0030
     * @tc.name setComboTest0030
     * @tc.desc clear + forEach: After clearing the set, verify forEach() does not execute the callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([1, 2]);
      let callbackExecuted = false;

      set.clear();
      set.forEach(() => { callbackExecuted = true; });

      expect(callbackExecuted).assertEqual(false);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0053
     * @tc.name setComboTest0053
     * @tc.desc values + has: After iterating via values(), use has() to confirm each iterated element exists in Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30, 40]);
      const values = setComboTest0008(set) as number[];

      // Verify each value from values() exists in Set via has()
      values.forEach(val => {
        expect(set.has(val)).assertEqual(true);
      });
      expect(set.has(50)).assertEqual(false); // Non-existent element
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0054
     * @tc.name setComboTest0054
     * @tc.desc values + size: After iterating via values(), confirm the number of values matches Set size
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['a', 'b', 'c', 'd']);
      const values = setComboTest0008(set) as string[];

      expect(values.length).assertEqual(set.size);
      expect(set.size).assertEqual(4);
      expect(values.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0055
     * @tc.name setComboTest0055
     * @tc.desc forEach + has: After iterating via forEach(), use has() to confirm each iterated element exists in Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean | null | undefined | number>([true, false, null, undefined]);
      const iteratedElements: (boolean | null | undefined | number)[] = [];

      set.forEach(val => iteratedElements.push(val));
      // Verify each iterated element exists in Set via has()
      iteratedElements.forEach(val => {
        expect(set.has(val)).assertEqual(true);
      });
      expect(set.has(NaN)).assertEqual(false); // Non-existent element
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0056
     * @tc.name setComboTest0056
     * @tc.desc forEach + size: After iterating via forEach(), confirm the number of iterated elements matches Set size
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<GeneratedObjectLiteralInterface_1>([{ id: 1 }, { id: 2 }, { id: 3 }]);
      let iterationCount = 0;

      set.forEach(() => iterationCount++);
      expect(iterationCount).assertEqual(set.size);
      expect(set.size).assertEqual(3);
      expect(iterationCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0059
     * @tc.name setComboTest0059
     * @tc.desc forEach (empty set) + size: Verify forEach() doesn't iterate empty set and size is 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const emptySet = new Set<number>();
      let iterationCount = 0;

      emptySet.forEach(() => iterationCount++);
      expect(iterationCount).assertEqual(0);
      expect(emptySet.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0060
     * @tc.name setComboTest0060
     * @tc.desc values (single element) + has: Verify values() returns single element and confirm via has()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const singleElementSet = new Set([NaN]);
      const values = setComboTest0008(singleElementSet) as number[];

      expect(values.length).assertEqual(1);
      expect(isNaN(values[0])).assertEqual(true);
      expect(singleElementSet.has(NaN)).assertEqual(true);
      expect(singleElementSet.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0081
     * @tc.name setComboTest0081
     * @tc.desc values + [Symbol.iterator]: Verify values() iterator is consistent with [Symbol.iterator]
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([true, false, null, undefined]);
      // Get values via values()
      const valuesResult = setComboTest0008(set) as (boolean | null | undefined)[];
      // Get values via [Symbol.iterator]
      const iteratorResult = setComboTest0007(set) as (boolean | null | undefined)[];

      // Verify both results are identical
      expect(JSON.stringify(valuesResult)).assertEqual(JSON.stringify(iteratorResult));
      expect(valuesResult.length).assertEqual(iteratorResult.length);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0082
     * @tc.name setComboTest0082
     * @tc.desc values + entries(): Verify values from values() match keys/values in entries()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<bigint | string | GeneratedObjectLiteralInterface_1>([1n, 'test', { id: 1 }]);
      const values = setComboTest0008(set) as (bigint | string | GeneratedObjectLiteralInterface_1)[];
      const entries = setComboTest0009(set) as (bigint | string | GeneratedObjectLiteralInterface_1)[][];

      // Verify entries() format and values match
      entries.forEach((entry, index) => {
        const key = entry[0];
        const val = entry[1];
        expect(key).assertEqual(val);
        if (typeof values[index] === 'object' && values[index] !== null) {
          expect(JSON.stringify(key)).assertEqual(JSON.stringify(values[index]));
        } else {
          expect(key).assertEqual(values[index]);
        }
      });
      expect(values.length).assertEqual(entries.length);
    });

    /**
     * 5. forEach() × Traversal Interfaces
     */

    /**
     * @tc.number SUB_SET_COMBO_TEST_0083
     * @tc.name setComboTest0083
     * @tc.desc forEach + [Symbol.iterator]: Verify elements iterated via forEach() match [Symbol.iterator] results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set(['apple', 'banana', 'cherry']);
      const forEachResult: string[] = [];

      // Iterate via forEach()
      set.forEach(val => forEachResult.push(val));
      // Iterate via [Symbol.iterator]
      const iteratorResult = setComboTest0007(set) as string[];

      // Verify both result sets are identical
      expect(JSON.stringify(forEachResult)).assertEqual(JSON.stringify(iteratorResult));
      expect(forEachResult.length).assertEqual(iteratorResult.length);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0084
     * @tc.name setComboTest0084
     * @tc.desc forEach + entries(): Verify elements iterated via forEach() match entries() values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set([10, 20, 30, 40]);
      const forEachResult: number[] = [];

      // Iterate via forEach()
      set.forEach(val => forEachResult.push(val));
      // Iterate via entries()
      const entriesResult = (setComboTest0008(set) as number[]).map((val) => val);

      // Verify both result sets are identical
      expect(JSON.stringify(forEachResult)).assertEqual(JSON.stringify(entriesResult));
      expect(forEachResult.length).assertEqual(entriesResult.length);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0086
     * @tc.name setComboTest0086
     * @tc.desc forEach (empty set) + entries(): Verify forEach() doesn't iterate and entries() returns empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const emptySet = new Set<number>();
      let forEachCount = 0;

      emptySet.forEach(() => forEachCount++);
      const entries = setComboTest0009(emptySet) as number[][];

      expect(forEachCount).assertEqual(0);
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_SET_COMBO_TEST_0087
     * @tc.name setComboTest0087
     * @tc.desc values (single element) + [Symbol.iterator]: Verify values() and [Symbol.iterator] return the same single element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setComboTest0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const singleSet = new Set([NaN]);
      const valuesResult = setComboTest0008(singleSet) as number[];
      const iteratorResult = setComboTest0007(singleSet) as number[];

      expect(valuesResult.length).assertEqual(1);
      expect(iteratorResult.length).assertEqual(1);
      expect(isNaN(valuesResult[0])).assertEqual(true);
      expect(isNaN(iteratorResult[0])).assertEqual(true);
    });
  })
}
