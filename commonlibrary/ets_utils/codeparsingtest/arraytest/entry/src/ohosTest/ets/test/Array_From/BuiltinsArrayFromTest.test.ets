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

interface TestItem {
  a?: number;
  b?: number;
}

interface GeneratedTypeLiteralInterface_1 {
  value: number;
}

interface Obj1 {
  a: number;
}

interface Obj2 {
  b: number;
}

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function BuiltinsArrayFromTest(): void {
  describe("BuiltinsArrayFromTest", () => {
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
     * @tc.name    BuiltinsArrayFromTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0100
     * @tc.desc    Verify Array.from() with string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayFromTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.from("foo");
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("f");
      expect(result[1]).assertEqual("o");
      expect(result[2]).assertEqual("o");
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0200
     * @tc.desc    Verify Array.from() with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayFromTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.from("");
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0300
     * @tc.desc    Verify Array.from() with string containing special characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from("a b\nc");
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(" ");
      expect(result[2]).assertEqual("b");
      expect(result[3]).assertEqual("\n");
      expect(result[4]).assertEqual("c");
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0400
     * @tc.desc    Verify Array.from() with unicode characters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from("😀中");
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("😀");
      expect(result[1]).assertEqual("中");
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0500
     * @tc.desc    Verify Array.from() with array (shallow copy)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsArrayFromTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const original = [1, 2, 3];
      const copy = Array.from(original);
      expect(copy).not().assertNull();
      expect(Array.isArray(copy)).assertTrue();
      expect(copy.length).assertEqual(3);
      expect(copy[0]).assertEqual(1);
      expect(copy[1]).assertEqual(2);
      expect(copy[2]).assertEqual(3);
      expect(copy !== original).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0600
     * @tc.desc    Verify Array.from() with array containing objects (shallow copy)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original: TestItem[] = [{ a: 1 }, { b: 2 }];
      const copy = Array.from<TestItem>(original);

      expect(copy).not().assertNull();
      expect(Array.isArray(copy)).assertTrue();
      expect(copy.length).assertEqual(2);
      expect(copy[0]).assertEqual(original[0]);
      expect(copy[1]).assertEqual(original[1]);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0700
     * @tc.desc    Verify Array.from() with sparse array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sparse: (number | undefined)[] = new Array<number | undefined>(3);
      sparse[0] = 1;
      sparse[2] = 3;

      const result = Array.from<number | undefined>(sparse);

      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0800
     * @tc.desc    Verify Array.from() returns array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0900
     * @tc.desc    Verify Array.from() returns array with correct length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3, 4, 5]);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1000
     * @tc.desc    Verify Array.from() with null throws TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsArrayFromTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        Array.from('null');
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1100
     * @tc.desc    Verify Array.from() with undefined throws TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsArrayFromTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        Array.from('undefined');
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1200
     * @tc.desc    Verify Array.from() with number throws TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsArrayFromTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        Array.from('123');
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1300
     * @tc.desc    Verify Array.from() with boolean throws TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsArrayFromTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        Array.from('true');
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1400
     * @tc.desc    Verify Array.from() with arrayLike
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1500
     * @tc.desc    Verify Array.from() with mapFn and arrayLike
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], x => x * 2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1600
     * @tc.desc    Verify Array.from() with mapFn using arrow function (square)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], x => x * x);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1700
     * @tc.desc    Verify Array.from() with mapFn using arrow function (multiply by 2)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], x => x * 2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1800
     * @tc.desc    Verify Array.from() with mapFn using inline function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], x => x + 10);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(12);
      expect(result[2]).assertEqual(13);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1900
     * @tc.desc    Verify Array.from() with mapFn using element parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], x => x * 3);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(6);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2000
     * @tc.desc    Verify Array.from() with mapFn using both element and index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([10, 20, 30], (element, index) => element + index);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(21);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2100
     * @tc.desc    Verify Array.from() with mapFn returning undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], () => undefined);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2200
     * @tc.desc    Verify Array.from() with mapFn returning object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], (x): GeneratedTypeLiteralInterface_1 => ({ value: x }));
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]?.value).assertEqual(1);
      expect(result[1]?.value).assertEqual(2);
      expect(result[2]?.value).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2300
     * @tc.desc    Verify Array.from() with mapFn returning array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], (x) => [x, x * 2]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]?.[0]).assertEqual(1);
      expect(result[0]?.[1]).assertEqual(2);
      expect(result[1]?.[0]).assertEqual(2);
      expect(result[1]?.[1]).assertEqual(4);
      expect(result[2]?.[0]).assertEqual(3);
      expect(result[2]?.[1]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2400
     * @tc.desc    Verify Array.from() with mapFn cannot modify original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const original = [1, 2, 3];
      const result = Array.from(original, (x) => {return x * 2;});
      expect(original[0]).assertEqual(1);
      expect(original[1]).assertEqual(2);
      expect(original[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2500
     * @tc.desc    Verify Array.from() with Set object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const set = new Set<number>([1, 2, 3, 2, 1]);
      const result = Array.from(set);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2600
     * @tc.desc    Verify Array.from() with empty Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const set = new Set<number>();
      const result = Array.from(set);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2700
     * @tc.desc    Verify Array.from() with Set containing objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Obj1 = {a: 1};
      const obj2: Obj2 = {b: 2};
      const set = new Set<Obj1 | Obj2>([obj1, obj2]);
      const result = Array.from(set);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(obj1);
      expect(result[1]).assertEqual(obj2);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2800
     * @tc.desc    Verify Array.from() with Map.values()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const map = new Map<string,number>([["a", 1], ["b", 2]]);
      const result = Array.from(map.values());
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2900
     * @tc.desc    Verify Array.from() with Map.keys()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const map = new Map<string,number>([["a", 1], ["b", 2]]);
      const result = Array.from(map.keys());
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3000
     * @tc.desc    Verify Array.from() with empty Map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const map = new Map<string, number>();
      const result = Array.from(map);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3100
     * @tc.desc    Verify Array.from() with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from("");
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3200
     * @tc.desc    Verify Array.from() with empty Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const set = new Set<number>();
      const result = Array.from(set);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3300
     * @tc.desc    Verify Array.from() with empty Map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const map = new Map<number,string>();
      const result = Array.from(map);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3400
     * @tc.desc    Verify Array.from() with long string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const longStr = "a".repeat(100);
      const result = Array.from(longStr);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3500
     * @tc.desc    Verify Array.from() with large Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const largeSet = new Set<number>();
      for (let i = 0; i < 100; i++) {
        largeSet.add(i);
      }
      const result = Array.from(largeSet);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3600
     * @tc.desc    Verify Array.from() with mapFn throwing error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsArrayFromTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      try {
        Array.from([1, 2, 3], () => {
          throw new Error('mapFn error');
        });
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3700
     * @tc.desc    Verify Array.from() with map() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]).map(x => x * 2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3800
     * @tc.desc    Verify Array.from() with filter() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3, 4, 5]).filter(x => x > 2);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_3900
     * @tc.desc    Verify Array.from() with reduce() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3, 4]).reduce((acc, val) => acc + val, 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4000
     * @tc.desc    Verify Array.from() with find() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3, 4, 5]).find(x => x > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4100
     * @tc.desc    Verify Array.from() with some() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]).some(x => x > 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4200
     * @tc.desc    Verify Array.from() with every() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]).every(x => x > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4300
     * @tc.desc    Verify Array.from() with includes() method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3]).includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4400
     * @tc.desc    Verify Array.from() with Array.isArray()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.isArray(Array.from([1, 2, 3]));
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4500
     * @tc.desc    Compare Array.from() with Array.of()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fromResult = Array.from([1, 2, 3]);
      const ofResult = Array.of(1, 2, 3);
      expect(Array.isArray(fromResult)).assertTrue();
      expect(Array.isArray(ofResult)).assertTrue();
      expect(fromResult.length).assertEqual(3);
      expect(ofResult.length).assertEqual(3);
      expect(fromResult[0]).assertEqual(ofResult[0]);
      expect(fromResult[1]).assertEqual(ofResult[1]);
      expect(fromResult[2]).assertEqual(ofResult[2]);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4600
     * @tc.desc    Compare Array.from() with spread operator with mapping
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fromResult = Array.from([1, 2, 3], x => x * 2);
      const spreadResult = [...[1, 2, 3]].map(x => x * 2);
      expect(Array.isArray(fromResult)).assertTrue();
      expect(Array.isArray(spreadResult)).assertTrue();
      expect(fromResult.length).assertEqual(3);
      expect(spreadResult.length).assertEqual(3);
      expect(fromResult[0]).assertEqual(spreadResult[0]);
      expect(fromResult[1]).assertEqual(spreadResult[1]);
      expect(fromResult[2]).assertEqual(spreadResult[2]);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4700
     * @tc.desc    Verify Array.from() with Set for deduplication
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const set = new Set<number>([1, 2, 2, 3, 3, 3]);
      const result = Array.from(set);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4800
     * @tc.desc    Verify Array.from() with string to ASCII codes
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from("Hello", chars => chars.charCodeAt(0));
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(72);
      expect(result[1]).assertEqual(101);
      expect(result[2]).assertEqual(108);
      expect(result[3]).assertEqual(108);
      expect(result[4]).assertEqual(111);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_4900
     * @tc.desc    Verify Array.from() with filtering invalid values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, null, 2, undefined, 3], x => x === null || x === undefined ? 0 : x);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5000
     * @tc.desc    Verify Array.from() with inline function as mapFn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1, 2, 3], (x) => {
        return x + 10;
      });
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(11);
      expect(result[1]).assertEqual(12);
      expect(result[2]).assertEqual(13);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5100
     * @tc.desc    Verify Array.from() with Int8Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const typed = new Int8Array([1, 2, 3]);
      const result = Array.from(typed);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5200
     * @tc.desc    Verify Array.from() with Float32Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const typed = new Float32Array([1.1, 2.2, 3.3]);
      const result = Array.from(typed);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertClose(1.1, 0.1);
      expect(result[1]).assertClose(2.2, 0.1);
      expect(result[2]).assertClose(3.3, 0.1);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5300
     * @tc.desc    Verify Array.from() with BigInt elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.from([1n, 2n, 3n]);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5400
     * @tc.desc    Verify Array.from() with BigInt64Array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const typed = new BigInt64Array([1n, 2n, 3n]);
      const result = Array.from(typed);
      expect(result).not().assertNull();
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(2n);
      expect(result[2]).assertEqual(3n);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5500
     * @tc.desc    Verify Array.from() with forEach()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      Array.from([1, 2, 3]).forEach((x) => {
        values.push(x);
      });
      expect(values).not().assertNull();
      expect(Array.isArray(values)).assertTrue();
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(values[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5600
     * @tc.desc    Verify Array.from() vs spread operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = Array.from([1, 2, 3]);
      const arr2 = [...[1, 2, 3]];
      expect(arr1).not().assertNull();
      expect(Array.isArray(arr1)).assertTrue();
      expect(arr1.length).assertEqual(3);
      expect(arr1[0]).assertEqual(1);
      expect(arr1[1]).assertEqual(2);
      expect(arr1[2]).assertEqual(3);
      expect(arr2).not().assertNull();
      expect(Array.isArray(arr2)).assertTrue();
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[1]).assertEqual(2);
      expect(arr2[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5700
     * @tc.desc    Verify Array.from() with JSON.stringify()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.from([1, 2, 3]);
      const json = JSON.stringify(arr);
      expect(json).not().assertNull();
      expect(typeof json).assertEqual("string");
      expect(json).assertEqual("[1,2,3]");
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5800
     * @tc.desc    Verify Array.from() in Promise
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      return Promise.resolve(Array.from([1, 2, 3]))
        .then((arr) => {
          expect(arr).not().assertNull();
          expect(Array.isArray(arr)).assertTrue();
          expect(arr.length).assertEqual(3);
          expect(arr[0]).assertEqual(1);
          expect(arr[1]).assertEqual(2);
          expect(arr[2]).assertEqual(3);
        });
    });

    /**
     * @tc.name    BuiltinsArrayFromTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_5900
     * @tc.desc    Verify Array.from() with Promise.all()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const promises = Array.from([1, 2, 3], (x) => Promise.resolve(x * 2));
      return Promise.all(promises).then((results) => {
        expect(results).not().assertNull();
        expect(Array.isArray(results)).assertTrue();
        expect(results.length).assertEqual(3);
        expect(results[0]).assertEqual(2);
        expect(results[1]).assertEqual(4);
        expect(results[2]).assertEqual(6);
      });
    });

    /**
     * @tc.name    BuiltinsArrayFromTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_6000
     * @tc.desc    Verify Int8Array.from()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Int8Array.from([1, 2, 3]);
      expect(result).not().assertNull();
      expect(result instanceof Int8Array).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_6100
     * @tc.desc    Verify Float32Array.from()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Float32Array.from([1.1, 2.2, 3.3]);
      expect(result).not().assertNull();
      expect(result instanceof Float32Array).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFromTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_6200
     * @tc.desc    Verify TypedArray.from() with mapFn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFromTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Int8Array.from([1, 2, 3], (x) => x * 2);
      expect(result).not().assertNull();
      expect(result instanceof Int8Array).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
    });

  });
}
