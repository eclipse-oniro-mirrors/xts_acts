
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
  id: number
}

interface Base1 {
  prop: string
}

interface Base2 {
  value: string;
}

class SetManager {
  set: Set<string>;

  constructor() {
    this.set = new Set<string>(['x', 'y', 'z']);
  }

  removeItem(item: string) {
    return this.set.delete(item);
  }
}

class MyClass {
  id: number;

  constructor(id: number) {
    this.id = id;
  }
}


function deleteElement(s: Set<number>, val: number) {
  return s.delete(val);
}

export default function SetDeleteTest() {
  describe('SetDeleteTest', () => {
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
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0100
     * @tc.name SetDeleteTest001
     * @tc.desc Delete existing string value, verify return true and size decreases
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['apple', 'banana', 'cherry']);
      const result = set.delete('banana');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has('banana')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0200
     * @tc.name SetDeleteTest002
     * @tc.desc Delete non-existing string value, verify return false and size unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['apple', 'banana']);
      const result = set.delete('orange');

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(2);
      expect(set.has('orange')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0300
     * @tc.name SetDeleteTest003
     * @tc.desc Delete existing number value, verify return true and size decreases
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([10, 20, 30]);
      const result = set.delete(20);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(20)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0400
     * @tc.name SetDeleteTest004
     * @tc.desc Delete non-existing number value, verify return false and size unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([10, 20]);
      const result = set.delete(30);

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(2);
      expect(set.has(30)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0500
     * @tc.name SetDeleteTest005
     * @tc.desc Delete existing boolean value, verify return true and size decreases
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<boolean>([true, false, true]);
      const result = set.delete(false);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0600
     * @tc.name SetDeleteTest006
     * @tc.desc Delete the only element in Set, verify return true and size becomes 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>(['only-element']);
      const result = set.delete('only-element');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has('only-element')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0700
     * @tc.name SetDeleteTest007
     * @tc.desc Call delete() on empty Set, verify return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string>();
      const result = set.delete('any-value');

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0800
     * @tc.name SetDeleteTest008
     * @tc.desc Delete same value twice, verify only first returns true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int>([1, 2, 3]);
      const result1 = set.delete(2);
      const result2 = set.delete(2);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(false);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_0900
     * @tc.name SetDeleteTest009
     * @tc.desc Delete null value, verify return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<int | null>([null, 1, 2]);
      const result = set.delete(null);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(null)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1000
     * @tc.name SetDeleteTest010
     * @tc.desc Delete undefined value, verify return true if exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('SetDeleteTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const set = new Set<string | undefined>([undefined, 'a', 'b']);
      const result = set.delete(undefined);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(undefined)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1100
     * @tc.name SetDeleteTest011
     * @tc.desc Delete NaN (treated as equal to itself), verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([NaN, 1, 2]);
      const result = set.delete(NaN);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(NaN)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1200
     * @tc.name SetDeleteTest012
     * @tc.desc Delete 0 and -0 (treated as equal), verify delete both with one call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([0, -0, 100]);
      const result = set.delete(0);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(0)).assertEqual(false);
      expect(set.has(-0)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1400
     * @tc.name SetDeleteTest014
     * @tc.desc Delete existing BigInt value, verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const bigInt1 = 123n;
      const set = new Set<BigInt | int | string>([bigInt1, 456, 'test']);
      const result = set.delete(bigInt1);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(bigInt1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1500
     * @tc.name SetDeleteTest015
     * @tc.desc Delete object by same reference, verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI>([obj, { id: 2 } as BaseI]);
      const result = set.delete(obj);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(obj)).assertEqual(false);
      expect(set.has({ id: 2 })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1600
     * @tc.name SetDeleteTest016
     * @tc.desc Delete object by different reference, verify return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {

      const set = new Set<BaseI>([{ id: 1 } as BaseI]);
      const result = set.delete({ id: 1 });

      expect(result).assertEqual(false);
      expect(set.size).assertEqual(1);
      expect(set.has({ id: 1 })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1800
     * @tc.name SetDeleteTest018
     * @tc.desc Delete Date object by same reference, verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date = new Date('2024-01-01');
      const set = new Set<Date>([date, new Date('2024-01-02')]);
      const result = set.delete(date);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(date)).assertEqual(false);
      expect(set.has(new Date('2024-01-02'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_1900
     * @tc.name SetDeleteTest019
     * @tc.desc Delete RegExp object by same reference, verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const regex = new RegExp('test');
      const set = new Set<RegExp>([regex, new RegExp('test','g')]);
      const result = set.delete(regex);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(regex)).assertEqual(false);
      expect(set.has(new RegExp('test','g'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2000
     * @tc.name SetDeleteTest020
     * @tc.desc Delete function by same reference, verify return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func = () => {
      };
      const set = new Set<Function>([func, () => {
      }]);
      const result = set.delete(func);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(1);
      expect(set.has(func)).assertEqual(false);
      expect(set.has(() => {
      })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2100
     * @tc.name SetDeleteTest021
     * @tc.desc Delete element and re-add same value, verify normal addition
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);
      expect(set.size).assertEqual(2);

      set.add(2);
      expect(set.size).assertEqual(3);
      expect(set.has(2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2200
     * @tc.name SetDeleteTest022
     * @tc.desc Delete element and verify iterator has no deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      set.delete('b');

      const values = Array.from(set.values());
      expect(values.length).assertEqual(2);
      expect(values.includes('b')).assertEqual(false);
      expect(values).assertDeepEquals(['a', 'c']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2300
     * @tc.name SetDeleteTest023
     * @tc.desc Multiple references to same Set, delete affects all references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const ref1 = set;
      const ref2 = set;

      ref1.delete(2);

      expect(set.size).assertEqual(2);
      expect(ref1.size).assertEqual(2);
      expect(ref2.size).assertEqual(2);
      expect(set.has(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2600
     * @tc.name SetDeleteTest026
     * @tc.desc Modify object after deletion, verify no impact on delete result
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { id: 1 } as BaseI;
      const set = new Set<BaseI>([obj]);

      const result = set.delete(obj);
      obj.id = 999;

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2700
     * @tc.name SetDeleteTest027
     * @tc.desc Delete element and verify forEach has no deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);

      let iterationCount = 0;
      const elements: number[] = [];
      set.forEach(item => {
        iterationCount++;
        elements.push(item);
      });

      expect(iterationCount).assertEqual(2);
      expect(JSON.stringify(elements)).assertDeepEquals(JSON.stringify([1, 3]));
      expect(elements.includes(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_2800
     * @tc.name SetDeleteTest028
     * @tc.desc Delete element and verify for...of loop has no deleted element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['x', 'y', 'z']);
      set.delete('y');

      let iterationCount = 0;
      const elements: string[] = [];
      for (const item of set) {
        iterationCount++;
        elements.push(item);
      }

      expect(iterationCount).assertEqual(2);
      expect(elements).assertDeepEquals(['x', 'z']);
      expect(elements.includes('y')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3100
     * @tc.name SetDeleteTest031
     * @tc.desc Delete element during forEach iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4]);
      const deletedValues: number[] = [];

      set.forEach(item => {
        if (item % 2 === 0) {
          set.delete(item);
          deletedValues.push(item);
        }
      });

      expect(JSON.stringify(deletedValues)).assertDeepEquals(JSON.stringify([2, 4]));
      expect(set.size).assertEqual(2);
      expect(set.has(1)).assertEqual(true);
      expect(set.has(3)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3200
     * @tc.name SetDeleteTest032
     * @tc.desc Delete element during for...of iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c', 'd']);
      const deletedValues: string[] = [];

      for (const item of set) {
        if (item === 'b' || item === 'd') {
          set.delete(item);
          deletedValues.push(item);
        }
      }

      expect(deletedValues).assertDeepEquals(['b', 'd']);
      expect(set.size).assertEqual(2);
      expect(set.has('a')).assertEqual(true);
      expect(set.has('c')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3300
     * @tc.name SetDeleteTest033
     * @tc.desc Delete elements in reverse order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int>([10, 20, 30, 40]);
      const values = Array.from(set);

      for (let i = values.length - 1; i >= 0; i--) {
        set.delete(values[i]);
      }

      expect(set.size).assertEqual(0);
      expect(set.has(10)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3400
     * @tc.name SetDeleteTest034
     * @tc.desc Delete element and check entries() iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['x', 'y', 'z']);
      set.delete('y');

      const entries = Array.from(set.entries());
      expect(entries.length).assertEqual(2);
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['x', 'x'], ['z', 'z']]));
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3500
     * @tc.name SetDeleteTest035
     * @tc.desc Delete element from Set created with Set constructor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const originalSet = new Set<int>([1, 2, 3]);
      const newSet = new Set<int>(originalSet);

      const result = newSet.delete(2);

      expect(result).assertEqual(true);
      expect(newSet.size).assertEqual(2);
      expect(originalSet.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3600
     * @tc.name SetDeleteTest036
     * @tc.desc Delete element from Set created with array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = ['a', 'b', 'c'];
      const set = new Set<string>(arr);

      const result = set.delete('b');

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3700
     * @tc.name SetDeleteTest037
     * @tc.desc Delete element with same value but different type
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int | string>([1, '1', 2, '2']);

      const result1 = set.delete(1);
      const result2 = set.delete('2');

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has('1')).assertEqual(true);
      expect(set.has(2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3800
     * @tc.name SetDeleteTest038
     * @tc.desc Delete element from large Set (1000 elements)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest038', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<number>();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const result = set.delete(500);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(999);
      expect(set.has(500)).assertEqual(false);
      expect(set.has(999)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_3900
     * @tc.name SetDeleteTest039
     * @tc.desc Delete all elements from large Set using delete()
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const set = new Set<string>();
      const elements: string[] = [];
      for (let i = 0; i < 1000; i++) {
        const elem = `item-${i}`;
        set.add(elem);
        elements.push(elem);
      }

      elements.forEach((elem) => {set.delete(elem)});

      expect(set.size).assertEqual(0);
      expect(set.has(elements[0])).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4200
     * @tc.name SetDeleteTest042
     * @tc.desc Delete BigInt with same value but different instance
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const bigInt1 = 123n;
      const bigInt2 = 123n;
      const set = new Set<BigInt>([bigInt1]);

      const result = set.delete(bigInt2);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has(bigInt1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4300
     * @tc.name SetDeleteTest043
     * @tc.desc Delete element from nested Set structure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const innerSet = new Set<int>([1, 2, 3]);
      const outerSet = new Set<Set<int> | string>([innerSet, 'a', 'b']);

      const result1 = innerSet.delete(2);
      const result2 = outerSet.delete(innerSet);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(innerSet.size).assertEqual(2);
      expect(outerSet.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4400
     * @tc.name SetDeleteTest044
     * @tc.desc Delete element and check with Array.from()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['p', 'q', 'r']);
      set.delete('q');

      const arr = Array.from(set);

      expect(arr.length).assertEqual(2);
      expect(arr).assertDeepEquals(['p', 'r']);
      expect(arr.includes('q')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4500
     * @tc.name SetDeleteTest045
     * @tc.desc Delete element from Set after mutation of the element
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {


      const obj = { prop: 'value' } as Base1;
      const set = new Set<Base1>([obj]);

      obj.prop = 'new value';
      const result = set.delete(obj);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(0);
      expect(set.has(obj)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4600
     * @tc.name SetDeleteTest046
     * @tc.desc Delete element using a variable reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const value = 'target';
      const set = new Set<string>(['a', value, 'b']);

      const result = set.delete(value);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(value)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4700
     * @tc.name SetDeleteTest047
     * @tc.desc Delete element and check with Set.prototype.keys()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30]);
      set.delete(20);

      const keys = Array.from(set.keys());

      expect(keys.length).assertEqual(2);
      expect(keys).assertDeepEquals([10, 30]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4800
     * @tc.name SetDeleteTest048
     * @tc.desc Delete element and then clear the Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['x', 'y', 'z']);

      set.delete('y');
      expect(set.size).assertEqual(2);

      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has('x')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_4900
     * @tc.name SetDeleteTest049
     * @tc.desc Delete element from Set and check with Array.includes()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([5, 10, 15]);
      set.delete(10);

      const arr = Array.from(set);

      expect(arr.includes(5)).assertEqual(true);
      expect(arr.includes(10)).assertEqual(false);
      expect(arr.includes(15)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5000
     * @tc.name SetDeleteTest050
     * @tc.desc Delete element and check with Set.prototype.values() after delay
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      set.delete('b');

      await new Promise<int>((resolve) => {setTimeout(() => resolve(0), 10)});

      const values = Array.from(set.values());

      expect(values).assertDeepEquals(['a', 'c']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5100
     * @tc.name SetDeleteTest051
     * @tc.desc Delete element using delete() in a function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<number>([1, 2, 3]);
      const result = deleteElement(set, 2);

      expect(result).assertEqual(true);
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5200
     * @tc.name SetDeleteTest052
     * @tc.desc Delete element from Set in a class method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {


      const manager = new SetManager();
      const result = manager.removeItem('y');

      expect(result).assertEqual(true);
      expect(manager.set.size).assertEqual(2);
      expect(manager.set.has('y')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5300
     * @tc.name SetDeleteTest053
     * @tc.desc Delete element from Set and check with JSON serialization
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);

      const jsonStr = JSON.stringify(Array.from(set));

      expect(jsonStr).assertEqual('[1,3]');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5400
     * @tc.name SetDeleteTest054
     * @tc.desc Delete element and check with Set.prototype.has() after async operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['p', 'q', 'r']);
      set.delete('q');

      await new Promise<int>((resolve) :void  => setTimeout(() => resolve(0), 10));

      expect(set.has('q')).assertEqual(false);
      expect(set.has('p')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5500
     * @tc.name SetDeleteTest055
     * @tc.desc Delete element and then add a different element with same string representation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SetDeleteTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set = new Set<int | string>([123, '123']);

      set.delete(123);
      set.add('new 123');

      expect(set.size).assertEqual(2);
      expect(set.has(123)).assertEqual(false);
      expect(set.has('123')).assertEqual(true);
      expect(set.has('new 123')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5600
     * @tc.name SetDeleteTest056
     * @tc.desc Delete element using optional chaining operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      const nullSet: null | Set<number> = null;

      const result1 = set?.delete(2);
      const result2: undefined | boolean = nullSet == null ? undefined : (nullSet as Set<number>).delete(2);

      expect(result1).assertEqual(true);
      expect(result2).assertEqual(undefined);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5800
     * @tc.name SetDeleteTest058
     * @tc.desc Delete element and check with Array.find()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<BaseI>([{ id: 1 } as BaseI, { id: 2 } as BaseI, { id: 3 } as BaseI]);
      const toDelete = Array.from(set).find(item => item.id === 2) as BaseI;

      set.delete(toDelete);
      const remaining = Array.from(set);

      expect(remaining.length).assertEqual(2);
      expect(remaining.find(item => item.id === 2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_5900
     * @tc.name SetDeleteTest059
     * @tc.desc Delete element from Set and use with Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const key1 = { id: 1 } as BaseI;
      const key2 = { id: 2 } as BaseI;
      const set = new Set<BaseI>([key1, key2]);
      const map = new Map<BaseI,string>([[key1, 'value1'], [key2, 'value2']]);

      set.delete(key1);

      expect(set.size).assertEqual(1);
      expect(map.has(key1)).assertEqual(true);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6200
     * @tc.name SetDeleteTest062
     * @tc.desc Delete element from Set with custom objects and check identity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const obj1 = new MyClass(1);
      const obj2 = new MyClass(2);
      const set = new Set<MyClass>([obj1, obj2]);

      set.delete(obj1);

      expect(set.size).assertEqual(1);
      expect(set.has(obj1)).assertEqual(false);
      expect(set.has(obj2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6300
     * @tc.name SetDeleteTest063
     * @tc.desc Delete element and check with Array.filter()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40]);
      set.delete(20);

      const filtered = Array.from(set).filter(num => num > 25);

      expect(filtered).assertDeepEquals([30, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6400
     * @tc.name SetDeleteTest064
     * @tc.desc Delete element and check with Array.map()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      set.delete('b');
      const mapped = Array.from(set).map((item) => item.toUpperCase());
      expect(mapped).assertDeepEquals(['A', 'C']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6600
     * @tc.name SetDeleteTest066
     * @tc.desc Delete element from Set and check with Array.reduce()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4]);
      set.delete(3);
      const sum = Array.from(set).reduce((acc : int, curr : int) => (acc + curr),0);
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6700
     * @tc.name SetDeleteTest067
     * @tc.desc Delete element from Set and check with Array.every()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([2, 4, 6, 8, 9]);
      set.delete(9);

      const allEven = Array.from(set).every(num => num % 2 === 0);

      expect(allEven).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6800
     * @tc.name SetDeleteTest068
     * @tc.desc Delete element from Set and check with Array.some()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['apple', 'banana', 'cherry', 'date']);
      set.delete('banana');

      const hasLongWord = Array.from(set).some(word => word.length > 5);

      expect(hasLongWord).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_6900
     * @tc.name SetDeleteTest069
     * @tc.desc Delete element from Set and check with Array.findIndex()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const arr = Array.from(set);
      const index = arr.findIndex(item => item === 'c');

      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_7000
     * @tc.name SetDeleteTest070
     * @tc.desc Delete element from Set and check with Array.indexOf()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40]);
      set.delete(20);

      const arr = Array.from(set);
      const index = arr.indexOf(30);

      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_7400
     * @tc.name SetDeleteTest074
     * @tc.desc Delete element and use with Array.flatMap()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['hello', 'world', 'test']);
      set.delete('test');
      const flattened = Array.from(set).flatMap((word) => word.split(''));
      expect(flattened).assertDeepEquals(['h', 'e', 'l', 'l', 'o', 'w', 'o', 'r', 'l', 'd']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_7500
     * @tc.name SetDeleteTest075
     * @tc.desc Delete element and check with Array.includes() after transformation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4]);
      set.delete(3);

      const transformed = Array.from(set).map(num => num * 2);

      expect(transformed.includes(6)).assertEqual(false);
      expect(transformed.includes(4)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_7800
     * @tc.name SetDeleteTest078
     * @tc.desc Delete element from Set and use with Promise.all
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3]);
      set.delete(2);

      const promises = Array.from(set).map(num =>
      new Promise<int>((resolve)  => {setTimeout(() => resolve(num * 2), 10)})
      );

      const results = await Promise.all(promises);

      expect(results).assertDeepEquals([2, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_7900
     * @tc.name SetDeleteTest079
     * @tc.desc Delete element from Set and check with Array.sort()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([5, 2, 8, 1, 9]);
      set.delete(8);

      const sorted = Array.from(set).sort((a, b) => a - b);

      expect(sorted).assertDeepEquals([1, 2, 5, 9]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8000
     * @tc.name SetDeleteTest080
     * @tc.desc Delete element from Set and check with Array.reverse()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const reversed = Array.from(set).reverse();

      expect(reversed).assertDeepEquals(['d', 'c', 'a']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8100
     * @tc.name SetDeleteTest081
     * @tc.desc Delete element from Set and check with Array.slice()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      set.delete(30);

      const arr = Array.from(set);
      const sliced = arr.slice(1, 3);

      expect(sliced).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8200
     * @tc.name SetDeleteTest082
     * @tc.desc Delete element from Set and check with Array.splice()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['x', 'y', 'z', 'w']);
      set.delete('y');

      const arr = Array.from(set);
      arr.splice(1, 1);

      expect(arr).assertDeepEquals(['x', 'w']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8300
     * @tc.name SetDeleteTest083
     * @tc.desc Delete element from Set and check with Array.join()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['Hello', 'world', 'test']);
      set.delete('test');

      const joined = Array.from(set).join(' ');

      expect(joined).assertEqual('Hello world');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8400
     * @tc.name SetDeleteTest084
     * @tc.desc Delete element from Set and check with Array.concat()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set1 = new Set<int>([1, 2, 3]);
      const set2 = new Set<int>([4, 5, 6]);

      set1.delete(2);

      const combined = Array.from(set1).concat(Array.from(set2));

      expect(combined).assertDeepEquals([1, 3, 4, 5, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8600
     * @tc.name SetDeleteTest086
     * @tc.desc Delete element from Set and check with Array.fill()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4]);
      set.delete(2);

      const arr = Array.from(set);
      arr.fill(0, 1, 2);

      expect(arr).assertDeepEquals([1, 0, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8700
     * @tc.name SetDeleteTest087
     * @tc.desc Delete element from Set and check with Array.copyWithin()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const arr = Array.from(set);
      arr.copyWithin(0, 2);

      expect(arr).assertDeepEquals(['d', 'c', 'd']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8800
     * @tc.name SetDeleteTest088
     * @tc.desc Delete element from Set and check with Array.includes() after filter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      set.delete(30);

      const filtered = Array.from(set).filter(num => num > 25);

      expect(filtered.includes(30)).assertEqual(false);
      expect(filtered.includes(40)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_8900
     * @tc.name SetDeleteTest089
     * @tc.desc Delete element from Set and check with Array.indexOf() after map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c', 'd']);
      set.delete('b');

      const mapped = Array.from(set).map((item) : string => item.toUpperCase());
      const index = mapped.indexOf('c');

      expect(index).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9000
     * @tc.name SetDeleteTest090
     * @tc.desc Delete element from Set and check with Array.lastIndexOf()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([5, 10, 15, 10, 20]);
      set.delete(10);

      const arr = Array.from(set);
      const lastIndex = arr.lastIndexOf(10);

      expect(lastIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9100
     * @tc.name SetDeleteTest091
     * @tc.desc Delete element from Set and check with Array.reduceRight()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'b', 'c']);
      set.delete('b');

      const reversedString = Array.from(set).reduceRight((acc, curr) => acc + curr, '');

      expect(reversedString).assertEqual('ca');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9200
     * @tc.name SetDeleteTest092
     * @tc.desc Delete element from Set and check with Array.every() after transformation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([2, 4, 6, 7, 8]);
      set.delete(7);

      const allMultiplesOfTwo = Array.from(set)
        .map(num => num / 2)
        .every(num => Number.isInteger(num));

      expect(allMultiplesOfTwo).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9500
     * @tc.name SetDeleteTest095
     * @tc.desc Delete element from Set and check with Array.findIndex() after transformation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      set.delete(30);

      const index = Array.from(set)
        .map(num => num / 10)
        .findIndex(value => value === 4);

      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9600
     * @tc.name SetDeleteTest096
     * @tc.desc Delete element from Set and check with Array.filter() after transformation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['a', 'B', 'c', 'D', 'e']);
      set.delete('B');

      const lowercaseLetters = Array.from(set)
        .map((letter) : string => letter.toLowerCase())
        .filter(letter=> letter === letter.toLowerCase());

      expect(lowercaseLetters).assertDeepEquals(['a', 'c', 'd', 'e']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9700
     * @tc.name SetDeleteTest097
     * @tc.desc Delete element from Set and check with Array.map() after filter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([1, 2, 3, 4, 5, 6]);
      set.delete(4);

      const transformed = Array.from(set)
        .filter(num => num % 2 === 0)
        .map(num => num * 2);

      expect(transformed).assertDeepEquals([4, 12]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9800
     * @tc.name SetDeleteTest098
     * @tc.desc Delete element from Set and check with Array.reduce() after filter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<int>([10, 20, 30, 40, 50]);
      set.delete(30);

      const sum = Array.from(set)
        .filter(num => num > 25)
        .reduce((acc : int , curr : int) => acc + curr, 0);

      expect(sum).assertEqual(90);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_DELETE_TEST_9900
     * @tc.name SetDeleteTest099
     * @tc.desc Delete element from Set and check with Array.sort() after filter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SetDeleteTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<string>(['orange', 'apple', 'banana', 'grape', 'cherry']);
      set.delete('banana');

      const sorted = Array.from(set)
        .filter(fruit => fruit.length > 5)
        .sort();

      expect(sorted).assertDeepEquals(['cherry', 'orange']);
    });

  });
}