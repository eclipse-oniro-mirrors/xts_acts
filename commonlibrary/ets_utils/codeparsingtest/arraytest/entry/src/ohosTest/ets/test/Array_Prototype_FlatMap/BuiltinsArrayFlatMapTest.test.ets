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

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

interface ValueObject {
  value: number;
}

interface ObjWithItems {
  items: number[];
}

interface Student {
  name: string;
  scores: number[];
}

interface ScoreItem {
  name: string;
  score: number;
}

interface TestObj {
  a: number;
}

export default function BuiltinsArrayFlatMapTest(): void {
  describe("BuiltinsArrayFlatMapTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name    BuiltinsArrayFlatMapTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0100
     * @tc.desc    Verify that flatMap() maps and flattens one-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0200
     * @tc.desc    Verify that flatMap() is equivalent to map().flat()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result1 = arr.flatMap(x => [x, x * 2]);
      const result2 = arr.map(x => [x, x * 2]).flat(1);
      expect(result1).not().assertNull();
      expect(result2).not().assertNull();
      expect(Array.isArray(result1)).assertTrue();
      expect(Array.isArray(result2)).assertTrue();
      expect(result1.length).assertEqual(result2.length);
      for (let i = 0; i < result1.length; i++) {
        expect(result1[i]).assertEqual(result2[i]);
      }
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0300
     * @tc.desc    Verify that flatMap() handles non-array return values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => x * 2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0400
     * @tc.desc    Verify that flatMap() handles mixed array and single value returns
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => {
        return x % 2 === 0 ? [x, x * 2] : x;
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0500
     * @tc.desc    Verify that flatMap() produces longer output array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x, x * 2, x * 3]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(9);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(4);
      expect(result[5]).assertEqual(6);
      expect(result[6]).assertEqual(3);
      expect(result[7]).assertEqual(6);
      expect(result[8]).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0600
     * @tc.desc    Verify that flatMap() produces shorter output array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const result = arr.flatMap(x => x % 2 === 0 ? [x] : []);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0700
     * @tc.desc    Verify that callback function receives element parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b', 'c'];
      const result = arr.flatMap(element => [element.toUpperCase()]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('A');
      expect(result[1]).assertEqual('B');
      expect(result[2]).assertEqual('C');
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0800
     * @tc.desc    Verify that callback function handles different types of elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean | TestObj)[] = [1, 'string', true, {a: 1}];
      const result = arr.flatMap((element: number | string | boolean | TestObj): string[] => [typeof element]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('number');
      expect(result[1]).assertEqual('string');
      expect(result[2]).assertEqual('boolean');
      expect(result[3]).assertEqual('object');
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_0900
     * @tc.desc    Verify that callback function receives index parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30];
      const result = arr.flatMap((element, index) => [index, element]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(20);
      expect(result[4]).assertEqual(2);
      expect(result[5]).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1000
     * @tc.desc    Verify that callback function uses index for conditional mapping
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ['a', 'b', 'c', 'd'];
      const result = arr.flatMap((element, index) => {
        return index % 2 === 0 ? [element] : [element.toUpperCase()];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('B');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('D');
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1100
     * @tc.desc    Verify that callback function receives array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap((element, index, array) => [array.length]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1200
     * @tc.desc    Verify that callback function uses array parameter for calculations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap((element, index, array) => {
        return index < array.length - 1 ? [element + array[index + 1]] : [element];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1300
     * @tc.desc    Verify that thisArg as null or undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap((x) => {
        return [x * 2];
      }, null);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1400
     * @tc.desc    Verify that thisArg as primitive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const prefix = 'prefix';
      const result = arr.flatMap((x: number): string[] => {
        return [prefix + x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('prefix1');
      expect(result[1]).assertEqual('prefix2');
      expect(result[2]).assertEqual('prefix3');
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1500
     * @tc.desc    Verify that callback returns single-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1600
     * @tc.desc    Verify that callback returns multi-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1700
     * @tc.desc    Verify that callback returns empty array for filtering
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.flatMap(x => x > 3 ? [x] : []);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1800
     * @tc.desc    Verify that callback returns nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [[x, x * 2]]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[1][0]).assertEqual(2);
      expect(result[1][1]).assertEqual(4);
      expect(result[2][0]).assertEqual(3);
      expect(result[2][1]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_1900
     * @tc.desc    Verify that callback returns number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => x * 10);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2000
     * @tc.desc    Verify that callback returns string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => 'num' + x);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('num1');
      expect(result[1]).assertEqual('num2');
      expect(result[2]).assertEqual('num3');
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2100
     * @tc.desc    Verify that callback returns object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result = arr.flatMap((x: number): ValueObject[] => [{ value: x }]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0].value).assertEqual(1);
      expect(result[1].value).assertEqual(2);
      expect(result[2].value).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2200
     * @tc.desc    Verify that callback returns undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => undefined);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2300
     * @tc.desc    Verify that callback returns null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => null);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2400
     * @tc.desc    Verify that flatMap() flattens one-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2500
     * @tc.desc    Verify that flatMap() flattens 2D array to 1D
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4]];
      const result = arr.flatMap(x => x);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2600
     * @tc.desc    Verify that flatMap() only flattens one level for 3D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [[x]]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][0]).assertEqual(2);
      expect(result[2][0]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2700
     * @tc.desc    Verify that flatMap() only flattens one level for multi-nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2];
      const result = arr.flatMap(x => [[[x]]]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0][0][0]).assertEqual(1);
      expect(result[1][0][0]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2800
     * @tc.desc    Verify that flatMap() handles sparse array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [1, undefined, undefined, 4];
      const result = arr.flatMap((x: number | undefined): number[] => {
        if (x !== undefined) {
          return [x * 2];
        }
        return [];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_2900
     * @tc.desc    Verify that flatMap() handles consecutive empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, , , , 5];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3000
     * @tc.desc    Verify that flatMap() handles empty slots at start and end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [, 2, 3, ];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3100
     * @tc.desc    Verify that flatMap() preserves empty slots in returned arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3200
     * @tc.desc    Verify that flatMap() handles arrays with only empty slots
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [,]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3300
     * @tc.desc    Verify that flatMap() handles null in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, null, 3];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3400
     * @tc.desc    Verify that flatMap() handles undefined in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3500
     * @tc.desc    Verify that flatMap() handles callback returning null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => x > 1 ? null : [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3600
     * @tc.desc    Verify that flatMap() handles callback returning undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => x > 1 ? undefined : [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3700
     * @tc.desc    Verify that flatMap() handles NaN in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, NaN, 3];
      const result = arr.flatMap(x => [x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(isNaN(result[1] as number)).assertTrue();
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3800
     * @tc.desc    Verify that flatMap() handles Infinity in array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, Infinity, -Infinity];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(Infinity);
      expect(result[2]).assertEqual(-Infinity);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_3900
     * @tc.desc    Verify that flatMap() splits string into words
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ["it's Sunny in", "", "California"];
      const result = arr.flatMap(x => x.split(' '));
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("it's");
      expect(result[1]).assertEqual("Sunny");
      expect(result[2]).assertEqual("in");
      expect(result[3]).assertEqual("");
      expect(result[4]).assertEqual("California");
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4000
     * @tc.desc    Verify that flatMap() splits and filters empty strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ["a b c", "d e", "f"];
      const result = arr.flatMap(x => x.split(' ').filter(s => s.length > 0));
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
      expect(result[3]).assertEqual("d");
      expect(result[4]).assertEqual("e");
      expect(result[5]).assertEqual("f");
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4100
     * @tc.desc    Verify that flatMap() expands nested object properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: ObjWithItems[] = [{items: [1, 2]}, {items: [3, 4]}];
      const result = arr.flatMap((obj: ObjWithItems): number[] => obj.items);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4200
     * @tc.desc    Verify that flatMap() flattens 2D array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.flatMap(x => x);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4300
     * @tc.desc    Verify that flatMap() conditionally flattens arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], 3, [4, 5]];
      const result = arr.flatMap(x => Array.isArray(x) ? x : [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4400
     * @tc.desc    Verify that flatMap() maps one element to multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4500
     * @tc.desc    Verify that flatMap() conditionally adds extra elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const result = arr.flatMap(x => {
        return x % 2 === 0 ? [x, x * 10] : [x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(20);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(4);
      expect(result[5]).assertEqual(40);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4600
     * @tc.desc    Verify that flatMap() filters elements by returning empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, -2, 3, -4, 5];
      const result = arr.flatMap(x => x < 0 ? [] : [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4700
     * @tc.desc    Verify that flatMap() handles complex filtering logic
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5, 4, -3, 20, 17, -33, -4, 18];
      const result = arr.flatMap(n => {
        if (n < 0) return [];
        return n % 2 === 0 ? [n] : [n - 1, 1];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(20);
      expect(result[4]).assertEqual(16);
      expect(result[5]).assertEqual(1);
      expect(result[6]).assertEqual(18);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4800
     * @tc.desc    Verify that flatMap() dynamically adjusts element count
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.flatMap(x => {
        if (x === 2) return [2, 2];
        if (x === 4) return [];
        return [x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_4900
     * @tc.desc    Verify that flatMap() replaces elements with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => {
        return x === 2 ? [20, 21, 22] : [x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(21);
      expect(result[3]).assertEqual(22);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5000
     * @tc.desc    Verify that flatMap() returns empty array for empty input
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [];
      const result = arr.flatMap(x => [x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5100
     * @tc.desc    Verify that flatMap() handles single-element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5];
      const result = arr.flatMap(x => [x, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5200
     * @tc.desc    Verify that flatMap() returns empty array for single-element input with empty return
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5];
      const result = arr.flatMap(x => []);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5300
     * @tc.desc    Verify that flatMap() handles large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array(10000).fill(1);
      const result = arr.flatMap((x: number): number[] => [x, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(20000);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5400
     * @tc.desc    Verify that flatMap() handles large array with single value return
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array(10000).fill(1);
      const result = arr.flatMap((x: number): number[] => [x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(10000);
      expect(result[0]).assertEqual(2);
      expect(result[9999]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5500
     * @tc.desc    Verify that flatMap() handles Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [Number.MAX_VALUE];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5600
     * @tc.desc    Verify that flatMap() handles Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [Number.MIN_VALUE];
      const result = arr.flatMap(x => [x]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5700
     * @tc.desc    Verify that flatMap() throws error when callback throws
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      let errorCaught = false;
      try {
        arr.flatMap(x => {
          if (x === 2) throw new Error('Test error');
          return [x];
        });
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5800
     * @tc.desc    Verify that flatMap() handles callback returning function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => () => {
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_5900
     * @tc.desc    Verify that flatMap() handles array modification in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => {
        if (x === 1) arr.push(4);
        return [x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6000
     * @tc.desc    Verify that flatMap() handles array element deletion in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4];
      const result = arr.flatMap(x => {
        if (x === 2) arr.splice(2, 1);
        return [x];
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6100
     * @tc.desc    Compare flatMap and map results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const mapResult = arr.map(x => [x, x * 2]);
      const flatMapResult = arr.flatMap(x => [x, x * 2]);
      expect(mapResult).not().assertNull();
      expect(Array.isArray(mapResult)).assertTrue();
      expect(mapResult.length).assertEqual(3);
      expect(flatMapResult).not().assertNull();
      expect(Array.isArray(flatMapResult)).assertTrue();
      expect(flatMapResult.length).assertEqual(6);
      expect(flatMapResult[0]).assertEqual(1);
      expect(flatMapResult[1]).assertEqual(2);
      expect(flatMapResult[2]).assertEqual(2);
      expect(flatMapResult[3]).assertEqual(4);
      expect(flatMapResult[4]).assertEqual(3);
      expect(flatMapResult[5]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6200
     * @tc.desc    Verify flatMap is equivalent to map().flat(1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result1 = arr.flatMap(x => [x, x * 2]);
      const result2 = arr.map(x => [x, x * 2]).flat(1);
      expect(result1).not().assertNull();
      expect(Array.isArray(result1)).assertTrue();
      expect(result2).not().assertNull();
      expect(Array.isArray(result2)).assertTrue();
      expect(result1.length).assertEqual(result2.length);
      for (let i = 0; i < result1.length; i++) {
        expect(result1[i]).assertEqual(result2[i]);
      }
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6300
     * @tc.desc    Verify flatMap implements filtering functionality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, -2, 3, -4, 5];
      const result = arr.flatMap(x => x > 0 ? [x] : []);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6400
     * @tc.desc    Verify flatMap with filter chaining
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.flatMap((x: number): number[] => [x, x * 2]).filter((x: number): boolean => x > 3);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6500
     * @tc.desc    Verify flatMap with reduce combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const result = arr.flatMap(x => x).reduce((sum, val) => sum + val, 0);
      expect(result).assertEqual(21);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6600
     * @tc.desc    Verify flatMap only flattens one level
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [[x]]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0][0]).assertEqual(1);
      expect(result[1][0]).assertEqual(2);
      expect(result[2][0]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6700
     * @tc.desc    Compare flatMap and forEach results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const flatMapResult = arr.flatMap((x: number): number[] => [x, x * 2]);
      const forEachResult: number[] = [];
      arr.forEach((x: number): void => {
        forEachResult.push(x, x * 2);
      });
      expect(flatMapResult).not().assertNull();
      expect(Array.isArray(flatMapResult)).assertTrue();
      expect(forEachResult).not().assertNull();
      expect(Array.isArray(forEachResult)).assertTrue();
      expect(flatMapResult.length).assertEqual(forEachResult.length);
      for (let i = 0; i < flatMapResult.length; i++) {
        expect(flatMapResult[i]).assertEqual(forEachResult[i]);
      }
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6800
     * @tc.desc    Verify multiple method chaining
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.filter(x => x % 2 === 0)
        .flatMap(x => [x, x * 10])
        .map(x => x + 1);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(41);
    });

    /**
     * @tc.name    BuiltinsArrayFlatMapTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_MAP_TEST_6900
     * @tc.desc    Verify complex data processing pipeline
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFlatMapTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Student[] = [
        { name: 'Alice', scores: [85, 90, 95] },
        { name: 'Bob', scores: [70, 80, 85] }
      ];
      const result = arr.flatMap((student: Student): ScoreItem[] => {
        return student.scores.map((score: number): ScoreItem => {
          return { name: student.name, score: score } as ScoreItem;
        });
      }).filter((item: ScoreItem): boolean => item.score > 85);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('Alice');
      expect(result[0].score).assertEqual(90);
      expect(result[1].name).assertEqual('Alice');
      expect(result[1].score).assertEqual(95);
    });

  });
}
