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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium/index';
import Utils from '../Util.test';

interface TestObj {
  a: number;
}

interface GeneratedObjectLiteralInterface_1 {
  threshold: number;
}

interface Person {
  id: number;
  name: string;
}

interface ObjWithId {
  id: number;
}

interface ReturnObj {
  found: boolean;
}

export default function BuiltinsArrayFindIndexTest() {
  describe('BuiltinsArrayFindIndexTest', () => {
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
     * @tc.name    BuiltinsArrayFindIndexTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0100
     * @tc.desc    Verify that findIndex returns the index of the first element that satisfies the test function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5, 12, 8, 130, 44];
      const result = arr.findIndex((element) => element > 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0200
     * @tc.desc    Verify that findIndex returns the correct index position of the element that satisfies the condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => element === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0300
     * @tc.desc    Verify that findIndex returns -1 when no element satisfies the condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => element > 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0400
     * @tc.desc    Verify that findIndex returns -1 for empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [];
      const result = arr.findIndex((element) => element > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0500
     * @tc.desc    Verify that findIndex returns the first matching element when multiple elements satisfy the condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5, 6];
      const result = arr.findIndex((element) => element > 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0600
     * @tc.desc    Verify that the callback function stops executing after finding the first match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      let callCount = 0;
      const result = arr.findIndex((element) => {
        callCount++;
        return element === 2;
      });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0700
     * @tc.desc    Verify that the callback function receives the correct element value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20, 30];
      const elements: number[] = [];
      arr.findIndex((element: number): boolean => {
        elements.push(element);
        return false;
      });
      expect(elements.length).assertEqual(3);
      expect(elements[0]).assertEqual(10);
      expect(elements[1]).assertEqual(20);
      expect(elements[2]).assertEqual(30);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0800
     * @tc.desc    Verify that the element parameter preserves the original type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean | null | undefined | TestObj)[] = [1, "string", true, null, undefined, { a: 1 }];
      const types: string[] = [];
      arr.findIndex((element: number | string | boolean | null | undefined | TestObj): boolean => {
        types.push(typeof element);
        return false;
      });
      expect(types.length).assertEqual(6);
      expect(types[0]).assertEqual("number");
      expect(types[1]).assertEqual("string");
      expect(types[2]).assertEqual("boolean");
      expect(types[3]).assertEqual("object");
      expect(types[4]).assertEqual("undefined");
      expect(types[5]).assertEqual("object");
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_0900
     * @tc.desc    Verify that the callback function receives the correct index value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["a", "b", "c"];
      const indices: number[] = [];
      arr.findIndex((element: string, index: number): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1000
     * @tc.desc    Verify that the callback function receives the original array reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      let isSameArray = false;
      arr.findIndex((element, index, array) => {
        isSameArray = array === arr;
        return false;
      });
      expect(isSameArray).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1100
     * @tc.desc    Verify that other elements can be accessed through the array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element, index, array) => {
        if (index > 0) {
          return element === array[index - 1] * 2;
        }
        return false;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1200
     * @tc.desc    Verify that all three parameters can be used simultaneously
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element, index, array) => {
        return element > 2 && index < 4 && array.length === 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1300
     * @tc.desc    Verify that arrow function ignores thisArg
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const context: GeneratedObjectLiteralInterface_1 = { threshold: 10 };
      const result = arr.findIndex((element) => element > context.threshold);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1400
     * @tc.desc    Verify findIndex operation on number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => element === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1500
     * @tc.desc    Verify findIndex operation on string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ["apple", "banana", "cherry"];
      const result = arr.findIndex((element) => element.startsWith("b"));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1600
     * @tc.desc    Verify findIndex operation on object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = [{ id: 1, name: "Alice" }, { id: 2, name: "Bob" }];
      const result = arr.findIndex((element: Person): boolean => element.id === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1700
     * @tc.desc    Verify that empty slots in sparse array are treated as undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, , , 4];
      const result = arr.findIndex((element) => element === undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1800
     * @tc.desc    Verify finding actual values in sparse array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, , , 4, , 6];
      const result = arr.findIndex((element) => element === 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_1900
     * @tc.desc    Verify that empty array always returns -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [];
      const result = arr.findIndex((element) => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2000
     * @tc.desc    Verify single-element array match success returns 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5];
      const result = arr.findIndex((element) => element === 5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2100
     * @tc.desc    Verify single-element array match failure returns -1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5];
      const result = arr.findIndex((element) => element === 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2200
     * @tc.desc    Verify that callback returning true stops traversal and returns current index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => {
        return true;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2300
     * @tc.desc    Verify that callback returning false continues traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return false;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2400
     * @tc.desc    Verify that callback returning non-boolean truthy value is treated as true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [0, "", null, 1, undefined];
      const result = arr.findIndex((element) => {
        return element;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2500
     * @tc.desc    Verify that callback returning non-zero number is treated as true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2600
     * @tc.desc    Verify that callback returning non-empty string is treated as true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return "found";
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2700
     * @tc.desc    Verify that callback returning object is treated as true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element): ReturnObj => {
        return { found: true };
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2800
     * @tc.desc    Verify that callback returning 0 is treated as false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return 0;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_2900
     * @tc.desc    Verify that callback returning empty string is treated as false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return "";
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3000
     * @tc.desc    Verify that callback returning null is treated as false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return null;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3100
     * @tc.desc    Verify that callback returning undefined is treated as false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return undefined;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3200
     * @tc.desc    Verify that callback returning NaN is treated as false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.findIndex((element) => {
        return NaN;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3300
     * @tc.desc    Verify matching the first element returns index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40, 50];
      const result = arr.findIndex((element) => element === 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3400
     * @tc.desc    Verify that the first element satisfying condition returns immediately
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      let callCount = 0;
      const result = arr.findIndex((element) => {
        callCount++;
        return element === 1;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3500
     * @tc.desc    Verify matching the last element returns the last index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [10, 20, 30, 40, 50];
      const result = arr.findIndex((element) => element === 50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3600
     * @tc.desc    Verify that all elements are traversed when only the last element satisfies the condition
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      let callCount = 0;
      const result = arr.findIndex((element) => {
        callCount++;
        return element === 5;
      });
      expect(result).assertEqual(4);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3700
     * @tc.desc    Verify that empty array does not execute callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [];
      let callCount = 0;
      const result = arr.findIndex((element) => {
        callCount++;
        return true;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3800
     * @tc.desc    Verify single-element array match success
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [42];
      const result = arr.findIndex((element) => element === 42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest3900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_3900
     * @tc.desc    Verify single-element array match failure
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [42];
      const result = arr.findIndex((element) => element === 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4000
     * @tc.desc    Verify that callback throwing error stops findIndex and throws exception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      let errorCaught = false;
      let errorName = '';
      try {
        arr.findIndex((element) => {
          if (element === 3) {
            throw new Error("Test error");
          }
          return false;
        });
      } catch (e) {
        errorCaught = true;
        errorName = e.name;
      }
      expect(errorCaught).assertTrue();
      expect(errorName).assertEqual('Error');
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4100
     * @tc.desc    Verify that callback throwing TypeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      let errorCaught = false;
      let errorName = '';
      try {
        arr.findIndex((element) => {
          if (element === 2) {
            throw new TypeError("Custom type error");
          }
          return false;
        });
      } catch (e) {
        errorCaught = true;
        errorName = e.name;
      }
      expect(errorCaught).assertTrue();
      expect(errorName).assertEqual('TypeError');
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4200
     * @tc.desc    Verify that modifying already visited elements does not affect traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element, index) => {
        if (index === 0) {
          arr[1] = 100;
        }
        return element === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4300
     * @tc.desc    Verify that modifying unvisited elements affects subsequent traversal
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const visited: number[] = [];
      const result = arr.findIndex((element: number, index: number): boolean => {
        visited.push(element);
        if (index === 0) {
          arr[2] = 100;
        }
        return element === 100;
      });
      expect(result).assertEqual(2);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4400
     * @tc.desc    Verify that elements added during traversal are not visited
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const visited: number[] = [];
      const result = arr.findIndex((element: number): boolean => {
        visited.push(element);
        arr.push(element * 2);
        return false;
      });
      expect(result).assertEqual(-1);
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4500
     * @tc.desc    Verify that using splice to delete elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const visited: number[] = [];
      const result = arr.findIndex((element: number, index: number): boolean => {
        visited.push(element);
        if (index === 1) {
          arr.splice(2, 1);
        }
        return element === 5;
      });
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4600
     * @tc.desc    Verify that modifying length does not affect traversal range
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const visited: number[] = [];
      const result = arr.findIndex((element: number, index: number): boolean => {
        visited.push(element);
        if (index === 0) {
          arr.length = 2;
        }
        return false;
      });
      expect(result).assertEqual(-1);
      expect(visited.length).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4700
     * @tc.desc    Verify findIndex operation on integer array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => element === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4800
     * @tc.desc    Verify findIndex operation on float array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1.1, 2.2, 3.3, 4.4, 5.5];
      const result = arr.findIndex((element) => element === 3.3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest4900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_4900
     * @tc.desc    Verify findIndex operation on mixed positive and negative number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [-2, -1, 0, 1, 2];
      const result = arr.findIndex((element) => element < 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5000
     * @tc.desc    Verify findIndex operation on string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ["apple", "banana", "cherry"];
      const result = arr.findIndex((element) => element === "banana");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5100
     * @tc.desc    Verify findIndex operation on array with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = ["hello", "", "world"];
      const result = arr.findIndex((element) => element === "");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5200
     * @tc.desc    Verify findIndex operation on object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: ObjWithId[] = [{ id: 1 }, { id: 2 }, { id: 3 }];
      const result = arr.findIndex((element: ObjWithId): boolean => element.id === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5300
     * @tc.desc    Verify finding specific object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: ObjWithId = { id: 2 };
      const arr: ObjWithId[] = [{ id: 1 }, obj, { id: 3 }];
      const result = arr.findIndex((element: ObjWithId): boolean => element === obj);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5400
     * @tc.desc    Verify finding undefined value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      const result = arr.findIndex((element) => element === undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5500
     * @tc.desc    Verify finding null value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, null, 3];
      const result = arr.findIndex((element) => element === null);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5600
     * @tc.desc    Verify finding NaN value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, NaN, 3];
      const result = arr.findIndex((element) => Number.isNaN(element));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5700
     * @tc.desc    Verify findIndex operation on boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [false, true, false, true];
      const result = arr.findIndex((element) => element === true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5800
     * @tc.desc    Verify findIndex operation on mixed type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean | null | undefined | TestObj)[] = [1, "string", true, null, undefined, { a: 1 }];
      const result = arr.findIndex((element: number | string | boolean | null | undefined | TestObj): boolean =>
      typeof element === "object" && element !== null
      );
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest5900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_5900
     * @tc.desc    Verify the difference between findIndex and find
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [5, 12, 8, 130, 44];
      const indexResult = arr.findIndex((element) => element > 10);
      const valueResult = arr.find((element) => element > 10);
      expect(indexResult).assertEqual(1);
      expect(valueResult).assertEqual(12);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6000
     * @tc.desc    Verify return values when no element is found
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const indexResult = arr.findIndex((element) => element > 10);
      const valueResult = arr.find((element) => element > 10);
      expect(indexResult).assertEqual(-1);
      expect(valueResult).assertUndefined();
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6100
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6100
     * @tc.desc    Verify the difference between findIndex and indexOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const findIndexResult = arr.findIndex((element) => element > 3);
      const indexOfResult = arr.indexOf(4);
      expect(findIndexResult).assertEqual(3);
      expect(indexOfResult).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6200
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6200
     * @tc.desc    Verify findIndex can search based on object properties
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj2: ObjWithId = { id: 2 };
      const arr: ObjWithId[] = [{ id: 1 }, obj2, { id: 3 }];
      const findIndexResult = arr.findIndex((element: ObjWithId): boolean => element.id === 2);
      const indexOfResult = arr.indexOf(obj2);
      expect(findIndexResult).assertEqual(1);
      expect(indexOfResult).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6300
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6300
     * @tc.desc    Verify using findIndex on filter result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5, 6];
      const filtered = arr.filter((element) => element % 2 === 0);
      const result = filtered.findIndex((element) => element > 3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6400
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6400
     * @tc.desc    Verify using findIndex on map result
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const mapped = arr.map((element) => element * 2);
      const result = mapped.findIndex((element) => element > 5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6500
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6500
     * @tc.desc    Verify the difference between findIndex and some
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const findIndexResult = arr.findIndex((element) => element > 3);
      const someResult = arr.some((element) => element > 3);
      expect(findIndexResult).assertEqual(3);
      expect(someResult).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6600
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6600
     * @tc.desc    Verify the difference between findIndex and every
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [2, 4, 6, 8, 10];
      const findIndexResult = arr.findIndex((element) => element % 2 !== 0);
      const everyResult = arr.every((element) => element % 2 === 0);
      expect(findIndexResult).assertEqual(-1);
      expect(everyResult).assertTrue();
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6700
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6700
     * @tc.desc    Verify arrow function as callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.findIndex((element) => element > 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6800
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6800
     * @tc.desc    Verify arrow function accessing external variables
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const threshold = 3;
      const result = arr.findIndex((element) => element > threshold);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest6900
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_6900
     * @tc.desc    Verify multiple consecutive calls to findIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result1 = arr.findIndex((element) => element > 2);
      const result2 = arr.findIndex((element) => element > 3);
      const result3 = arr.findIndex((element) => element > 10);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(3);
      expect(result3).assertEqual(-1);
    });

    /**
     * @tc.name    BuiltinsArrayFindIndexTest7000
     * @tc.number  SUB_BUILTINS_ARRAY_FIND_INDEX_TEST_7000
     * @tc.desc    Verify findIndex does not modify the original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsArrayFindIndexTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const original = [...arr];
      arr.findIndex((element) => element > 3);
      arr.findIndex((element) => element < 3);
      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(original[i]);
      }
    });

  });
}