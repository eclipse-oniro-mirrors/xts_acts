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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

interface  TestObj {
  name?: string;
  quantity?: number;
}

interface UserInfo {
  name: string;
  age: number;
}

interface TestObj1 {
  name?: string;
  age?: number;
  user?: UserInfo;
}

export default function BuiltinsArrayPrototypeFindBasicTest() {
  describe('BuiltinsArrayPrototypeFindBasicTest', () => {
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
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0100
     * @tc.desc     Find first number element that meets condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 12, 8, 130, 44];
      const result: number | undefined = arr.find((element: number): boolean => element > 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0200
     * @tc.desc     Find object that meets condition in object array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const inventory: TestObj[] = [
        { name: "apples", quantity: 2 },
        { name: "bananas", quantity: 0 },
        { name: "cherries", quantity: 5 }
      ];
      const result: TestObj | undefined = inventory.find((fruit: TestObj): boolean => fruit.name === "cherries");
      expect(result?.name).assertEqual("cherries");
      expect(result?.quantity).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0300
     * @tc.desc     Find string that meets condition in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ["apple", "banana", "cherry"];
      const result: string | undefined = arr.find((fruit: string): boolean => fruit.startsWith("b"));
      expect(result).assertEqual("banana");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0400
     * @tc.desc     Find element in empty array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.find(() => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0500
     * @tc.desc     No elements in array meet condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1,2,3];
      const result = arr.find(item => item === 999);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0600
     * @tc.desc     Multiple elements meet condition, return first one
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 12, 8, 130, 44];
      const result: number | undefined = arr.find((element: number): boolean => element > 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0700
     * @tc.desc     First element meets condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [15, 12, 8, 130, 44];
      const result: number | undefined = arr.find((element: number): boolean => element > 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0800
     * @tc.desc     Only last element meets condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 15];
      const result: number | undefined = arr.find((element: number): boolean => element > 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_0900
     * @tc.desc     Verify element parameter passes current element value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const values: number[] = [];
      arr.find((element: number): boolean => {
        values.push(element);
        return false;
      });
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1000
     * @tc.desc     Verify index parameter passes current element index
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFindBasicTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const indices: number[] = [];
      arr.find((element: number, index: number): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

      /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1100
     * @tc.desc     Call find() on empty array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.find((item) => item > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1200
     * @tc.desc     Empty array does not call callbackFn
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      let called: boolean = false;
      arr.find(() => {
        called = true;
        return false;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1300
     * @tc.desc     Single element array with matching element
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [5];
      const result: number | undefined = arr.find((element: number): boolean => element > 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1400
     * @tc.desc     Single element array with non-matching element
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10];
      const result = arr.find((item) => item === 5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1500
     * @tc.desc     Single element is undefined
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [undefined];
      const result = arr.find((item) => item === undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1600
     * @tc.desc     Find element in large array
     * @tc.type     FUNCTION
     * @tc.size     LARGETEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1600', TestType.FUNCTION| Size.LARGETEST|Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i: number = 0; i < 1000; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.find((element: number): boolean => element === 999);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1700
     * @tc.desc     Element not found in large array
     * @tc.type     FUNCTION
     * @tc.size     LARGETEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1700', TestType.FUNCTION|Size.LARGETEST| Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      const result = arr.find((item) => item === 999);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1800
     * @tc.desc     First element matches condition in large array
     * @tc.type     FUNCTION
     * @tc.size     LARGETEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1800', TestType.FUNCTION| Size.LARGETEST| Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i: number = 0; i < 1000; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.find((element: number): boolean => element === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_1900
     * @tc.desc     Array length is zero
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = new Array<number>(0);
      const result = arr.find(() => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2000
     * @tc.desc     Array length is one
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [5];
      const result: number | undefined = arr.find((element: number): boolean => element > 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2100
     * @tc.desc     Callback function throws an error
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFindBasicTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = [1, 2, 3];
      let hasError = false;
      try {
        arr.find(() => {
          throw new Error("test");
        });
      } catch (e) {
        hasError = true;
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2200
     * @tc.desc     Normal find usage
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFindBasicTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = [10, 20, 30];
      const res = arr.find(item => item === 20);
      expect(res).assertEqual(20);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2300
     * @tc.desc     Find function elements in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fn1: () => number = (): number => 1;
      const fn2: () => number = (): number => 2;
      const arr: (() => number)[] = [fn1, fn2];
      const result = arr.find((element: () => number): boolean => element === fn2);
      expect(result).assertEqual(fn2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2400
     * @tc.desc     Find elements containing nested objects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj1[] = [
        { user: { name: "Alice", age: 25 } },
        { user: { name: "Bob", age: 30 } },
        { user: { name: "Charlie", age: 35 } }
      ];

      let target: TestObj1 | null = null;
      for (let i = 0; i < arr.length; i++) {
        const obj = arr[i];
        if (obj.user !== undefined && obj.user.age !== undefined && obj.user.age > 28) {
          target = obj;
          break;
        }
      }

      const result = target as TestObj1;
      const user = result.user as UserInfo;
      expect(user.name).assertEqual("Bob");
      expect(user.age).assertEqual(30);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2500
     * @tc.desc     Find elements that are arrays
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      let found: number[] = [];

      for (let sub of arr) {
        if (sub[0] === 3 && sub[1] === 4) {
          found = sub;
          break;
        }
      }

      expect(found.length).assertEqual(2);
      expect(found[0]).assertEqual(3);
      expect(found[1]).assertEqual(4);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2600
     * @tc.desc     Find null elements in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | null)[] = [1, null, 3];
      const result = arr.find((element: number | null): boolean => element === null);
      expect(result).assertNull();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2700
     * @tc.desc     Find undefined elements in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result = arr.find((element: number | undefined): boolean => element === undefined);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2800
     * @tc.desc     Handle sparse arrays
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = new Array<number | undefined>(5);
      arr[0] = 1;
      arr[3] = 4;
      arr[4] = 5;
      const visited: (number | undefined)[] = [];

      for (let i = 0; i < arr.length; i++) {
        visited.push(arr[i]);
      }

      expect(visited.length).assertEqual(5);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertUndefined();
      expect(visited[2]).assertUndefined();
      expect(visited[3]).assertEqual(4);
      expect(visited[4]).assertEqual(5);
    });
    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest2900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_2900
     * @tc.desc     Find NaN elements in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, NaN, 3];
      const result = arr.find((element: number): boolean => Number.isNaN(element));
      expect(Number.isNaN(result ?? 0)).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest3000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_3000
     * @tc.desc     Find boolean type elements
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [false, true, false, true];
      const result = arr.find((element: boolean): boolean => element === true);
      expect(result).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindBasicTest3100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_BASIC_TEST_3100
     * @tc.desc     Find string element in mixed type array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindBasicTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean)[] = [1, "hello", true, 4, "world"];
      const result = arr.find((item): boolean => {
        return typeof item === "string";
      });
      expect(result).assertEqual("hello");
    });

  });
}