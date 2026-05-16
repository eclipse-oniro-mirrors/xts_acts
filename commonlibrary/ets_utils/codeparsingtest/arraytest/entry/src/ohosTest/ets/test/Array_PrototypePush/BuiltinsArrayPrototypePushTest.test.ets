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

export default function BuiltinsArrayPrototypePushTest(): void {
  describe("BuiltinsArrayPrototypePushTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0100
     * @tc.desc   Verify push() adds single element to empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.push(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0200
     * @tc.desc   Verify push() adds single element to non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.push(4);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0300
     * @tc.desc   Verify push() adds multiple elements to empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.push(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0400
     * @tc.desc   Verify push() adds multiple elements to non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const result: number = arr.push(3, 4, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0500
     * @tc.desc   Verify push() with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.push();
      expect(arr.length).assertEqual(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0600
     * @tc.desc   Verify push() with 0 parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const result: number = arr.push();
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0700
     * @tc.desc   Verify push() with 1 parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const result: number = arr.push(3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0800
     * @tc.desc   Verify push() with multiple parameters (2-10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      expect(arr.length).assertEqual(10);
      expect(result).assertEqual(10);
      for (let i = 0; i < 10; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_0900
     * @tc.desc   Verify push() with large number of parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const elements: number[] = [];
      for (let i = 0; i < 100; i++) {
        elements.push(i);
      }
      const result: number = arr.push(...elements);
      expect(arr.length).assertEqual(100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1000
     * @tc.desc   Verify push() with spread operator on array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];
      const result: number = arr1.push(...arr2);
      expect(arr1.length).assertEqual(6);
      expect(arr1[0]).assertEqual(1);
      expect(arr1[3]).assertEqual(4);
      expect(arr1[5]).assertEqual(6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1100
     * @tc.desc   Verify push() with spread operator on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.push(...[]);
      expect(arr.length).assertEqual(3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1200
     * @tc.desc   Verify push() with spread operator on array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const arrayLike: number[] = [3, 4];
      const result: number = arr.push(...arrayLike);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1300
     * @tc.desc   Verify push() returns number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.push(4);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1400
     * @tc.desc   Verify push() returns new array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const result: number = arr.push(3, 4, 5);
      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(result === arr.length).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1500
     * @tc.desc   Verify push() on empty array returns 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number = arr.push(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1600
     * @tc.desc   Verify push() on large array returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array(1000000);
      arr.fill(0);
      const result: number = arr.push(1);
      expect(result).assertEqual(1000001);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1700
     * @tc.desc   Verify push() return value in chain operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      const result: number = arr.push(3);
      expect(result + 1).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1800
     * @tc.desc   Verify push() return value in conditionals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number = arr.push(4);
      let conditionMet = false;
      if (result > 3) {
        conditionMet = true;
      }
      expect(conditionMet).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_1900
     * @tc.desc   Verify push() modifies original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const originalArr: number[] = arr;
      arr.push(4);
      expect(arr === originalArr).assertTrue();
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2000
     * @tc.desc   Verify multiple push() calls modify same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1];
      arr.push(2);
      arr.push(3);
      arr.push(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2100
     * @tc.desc   Verify length property updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      expect(arr.length).assertEqual(2);
      arr.push(3, 4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2200
     * @tc.desc   Verify push() on sparse array updates length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [];
      arr[100] = 'value';
      expect(arr.length).assertEqual(101);
      arr.push('new');
      expect(arr.length).assertEqual(102);
      expect(arr[101]).assertEqual('new');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2300
     * @tc.desc   Verify push() maintains array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = arr1;
      arr1.push(4);
      expect(arr1.length).assertEqual(4);
      expect(arr2.length).assertEqual(4);
      expect(arr1 === arr2).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2400
     * @tc.desc   Verify push() updates multiple references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = arr1;
      const arr3: number[] = arr1;
      arr1.push(3);
      expect(arr2.length).assertEqual(3);
      expect(arr3.length).assertEqual(3);
      expect(arr2[2]).assertEqual(3);
      expect(arr3[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2500
     * @tc.desc   Verify push() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [];
      const result: number = arr.push('first');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('first');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2600
     * @tc.desc   Verify multiple push() calls on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(1);
      arr.push(2);
      arr.push(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2700
     * @tc.desc   Verify push() when length is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [];
      arr.length = 0;
      arr.push('item');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2800
     * @tc.desc   Verify push() after manual length modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      arr.length = 10;
      arr.push(4);
      expect(arr.length).assertEqual(11);
      expect(arr[10]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_2900
     * @tc.desc   Verify push() adds to max index + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const maxIndex: number = arr.length - 1;
      arr.push(4);
      expect(arr[maxIndex + 1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3000
     * @tc.desc   Verify push() on sparse array with large index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [];
      arr[1000] = 'value';
      arr.push('new');
      expect(arr[1001]).assertEqual('new');
      expect(arr.length).assertEqual(1002);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3100
     * @tc.desc   Verify push() with number types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(42);
      arr.push(3.14);
      arr.push(-10);
      arr.push(0);
      arr.push(Infinity);
      arr.push(NaN);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(3.14);
      expect(arr[2]).assertEqual(-10);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(Infinity);
      expect(isNaN(arr[5])).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3200
     * @tc.desc   Verify push() with string types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = [];
      arr.push('hello');
      arr.push('');
      arr.push('123');
      arr.push('世界');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('123');
      expect(arr[3]).assertEqual('世界');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3300
     * @tc.desc   Verify push() with boolean types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [];
      arr.push(true);
      arr.push(false);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3400
     * @tc.desc   Verify push() with object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObject {
        name: string;
        age?: number;
      }
      const arr: TestObject[] = [];
      arr.push({name: 'John', age: 30});
      arr.push({name: 'Empty'});
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('John');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3500
     * @tc.desc   Verify push() with array types (nested arrays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[][] = [];
      arr.push([1, 2, 3]);
      arr.push([]);
      expect(arr.length).assertEqual(2);
      expect(arr[0].length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3600
     * @tc.desc   Verify push() with function types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<() => number> = [];
      arr.push(() => 1);
      arr.push(() => 2);
      expect(arr.length).assertEqual(2);
      expect(typeof arr[0]).assertEqual('function');
      expect(arr[0]()).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3700
     * @tc.desc   Verify push() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Date[] = [];
      arr.push(new Date());
      expect(arr[0] instanceof Date).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3800
     * @tc.desc   Verify push() with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: RegExp[] = [];
      arr.push(/pattern/g);
      expect(arr[0] instanceof RegExp).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_3900
     * @tc.desc   Verify push() with Map and Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Object[] = [];
      arr.push(new Map<number, string>());
      arr.push(new Set<number>());
      expect(arr[0] instanceof Map).assertTrue();
      expect(arr[1] instanceof Set).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4000
     * @tc.desc   Verify push() with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [];
      arr.push(null);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4100
     * @tc.desc   Verify push() with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [];
      arr.push(undefined);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4200
     * @tc.desc   Verify push() with alternating null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | null | undefined)[] = [];
      arr.push(null, undefined, null, undefined);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertNull();
      expect(arr[3]).assertUndefined();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4300
     * @tc.desc   Verify push() with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = [];
      arr.push('');
      expect(arr[0] === '').assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4400
     * @tc.desc   Verify push() with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(0);
      expect(arr[0] === 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4500
     * @tc.desc   Verify push() with false boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [];
      arr.push(false);
      expect(arr[0] === false).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4600
     * @tc.desc   Verify push() with NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4700
     * @tc.desc   Verify push() with Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(Infinity);
      arr.push(-Infinity);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4800
     * @tc.desc   Verify push() with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      class EmptyObj {
        name: string = '';
      }
      const arr: EmptyObj[] = [];
      const obj: EmptyObj = new EmptyObj();
      arr.push(obj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(obj);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_4900
     * @tc.desc   Verify push() with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[][] = [];
      arr.push([]);
      expect(arr[0].length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5000
     * @tc.desc   Verify push() with pop()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      const item: number | undefined = arr.pop();
      expect(item).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5100
     * @tc.desc   Verify push() and pop() in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      arr.pop();
      arr.push(4);
      arr.pop();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5200
     * @tc.desc   Verify push() with shift()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      const item: number | undefined = arr.shift();
      expect(item).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5300
     * @tc.desc   Verify unshift() with push()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [2, 3];
      arr.unshift(1);
      arr.push(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5400
     * @tc.desc   Verify push() with splice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3, 4);
      arr.splice(1, 2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5500
     * @tc.desc   Verify push() with splice() inserting elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 4];
      arr.push(5);
      arr.splice(1, 0, 2, 3);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5600
     * @tc.desc   Verify push() with concat()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2];
      arr1.push(3);
      const arr2: number[] = arr1.concat([4, 5]);
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(5);
      expect(arr2[0]).assertEqual(1);
      expect(arr2[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5700
     * @tc.desc   Verify concat() with push()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr3: number[] = arr1.concat(arr2);
      arr3.push(5);
      expect(arr3.length).assertEqual(5);
      expect(arr3[4]).assertEqual(5);
      expect(arr1.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5800
     * @tc.desc   Verify push() with forEach()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      let sum: number = 0;
      arr.forEach((item: number) => sum += item);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_5900
     * @tc.desc   Verify push() with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      const doubled: number[] = arr.map((x: number) => x * 2);
      expect(doubled.length).assertEqual(3);
      expect(doubled[0]).assertEqual(2);
      expect(doubled[1]).assertEqual(4);
      expect(doubled[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6000
     * @tc.desc   Verify push() with filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      arr.push(4);
      const evens: number[] = arr.filter((x: number) => x % 2 === 0);
      expect(evens.length).assertEqual(2);
      expect(evens[0]).assertEqual(2);
      expect(evens[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6100
     * @tc.desc   Verify push() with sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [3, 1];
      arr.push(2);
      arr.sort((a: number, b: number) => a - b);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6200
     * @tc.desc   Verify push() with reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6300
     * @tc.desc   Verify push() in input collection scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const inputs: string[] = [];
      inputs.push('John');
      inputs.push('Jane');
      inputs.push('Bob');
      expect(inputs.length).assertEqual(3);
      expect(inputs[0]).assertEqual('John');
      expect(inputs[1]).assertEqual('Jane');
      expect(inputs[2]).assertEqual('Bob');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6400
     * @tc.desc   Verify push() in event logging scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      class EventData {
        x?: number;
        y?: number;
        key?: string;
      }
      class EventsLog {
        type: string = '';
        timestamp: number = 0;
        data: EventData = new EventData();
      }
      const events: EventsLog[] = [];
      const event1: EventsLog = new EventsLog();
      event1.type = 'click';
      event1.timestamp = Date.now();
      event1.data = new EventData();
      event1.data.x = 100;
      event1.data.y = 200;
      events.push(event1);
      const event2: EventsLog = new EventsLog();
      event2.type = 'keypress';
      event2.timestamp = Date.now();
      event2.data = new EventData();
      event2.data.key = 'Enter';
      events.push(event2);
      expect(events.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6500
     * @tc.desc   Verify push() in queue implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const queue: string[] = [];
      queue.push('task1');
      queue.push('task2');
      queue.push('task3');
      expect(queue.shift()).assertEqual('task1');
      expect(queue.shift()).assertEqual('task2');
      expect(queue.length).assertEqual(1);
      expect(queue[0]).assertEqual('task3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6600
     * @tc.desc   Verify push() in priority queue implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface PriorityItem {
        item: string;
        priority: number;
      }
      const pq: PriorityItem[] = [];
      pq.push({item: 'low', priority: 1});
      pq.sort((a: PriorityItem, b: PriorityItem) => b.priority - a.priority);
      pq.push({item: 'high', priority: 10});
      pq.sort((a: PriorityItem, b: PriorityItem) => b.priority - a.priority);
      pq.push({item: 'medium', priority: 5});
      pq.sort((a: PriorityItem, b: PriorityItem) => b.priority - a.priority);
      expect(pq[0].item).assertEqual('high');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6700
     * @tc.desc   Verify push() in stack implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stack: string[] = [];
      stack.push('a');
      stack.push('b');
      stack.push('c');
      expect(stack.pop()).assertEqual('c');
      expect(stack.pop()).assertEqual('b');
      expect(stack.length).assertEqual(1);
      expect(stack[0]).assertEqual('a');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6800
     * @tc.desc   Verify push() in user data processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface User {
        name: string;
        age: number;
      }
      const users: User[] = [
        {name: 'John', age: 30},
        {name: 'Jane', age: 25},
        {name: 'Bob', age: 35}
      ];
      const names: string[] = [];
      users.forEach((user: User) => names.push(user.name));
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('John');
      expect(names[1]).assertEqual('Jane');
      expect(names[2]).assertEqual('Bob');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_6900
     * @tc.desc   Verify push() in filtering even numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const evens: number[] = [];
      numbers.forEach((num: number) => {
        if (num % 2 === 0) {
          evens.push(num);
        }
      });
      expect(evens.length).assertEqual(5);
      expect(evens[0]).assertEqual(2);
      expect(evens[1]).assertEqual(4);
      expect(evens[2]).assertEqual(6);
      expect(evens[3]).assertEqual(8);
      expect(evens[4]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7000
     * @tc.desc   Verify push() in tree structure construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TreeNode {
        name?: string;
        children: TreeNode[];
      }
      const tree: TreeNode = {name: 'root', children: []};
      tree.children.push({name: 'child1', children: []});
      tree.children.push({name: 'child2', children: []});
      tree.children[0].children.push({name: 'grandchild1', children: []});
      expect(tree.children.length).assertEqual(2);
      expect(tree.children[0].children.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7100
     * @tc.desc   Verify push() in matrix construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const matrix: number[][] = [];
      for (let i = 0; i < 3; i++) {
        const row: number[] = [];
        for (let j = 0; j < 3; j++) {
          row.push(i * 3 + j + 1);
        }
        matrix.push(row);
      }
      expect(matrix.length).assertEqual(3);
      expect(matrix[0][0]).assertEqual(1);
      expect(matrix[0][1]).assertEqual(2);
      expect(matrix[0][2]).assertEqual(3);
      expect(matrix[1][0]).assertEqual(4);
      expect(matrix[2][2]).assertEqual(9);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7200
     * @tc.desc   Verify push() in message queue with size limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface Message {
        data: string;
        timestamp: number;
      }
      const messages: Message[] = [];
      messages.push({
        data: 'Hello',
        timestamp: Date.now()
      });
      if (messages.length > 100) {
        messages.shift();
      }
      messages.push({
        data: 'World',
        timestamp: Date.now()
      });
      if (messages.length > 100) {
        messages.shift();
      }
      expect(messages.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7300
     * @tc.desc   Verify push() in sensor data collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface SensorReading {
        value: number;
        time: number;
      }
      const sensorData: SensorReading[] = [];
      sensorData.push({
        value: 23.5,
        time: Date.now()
      });
      sensorData.push({
        value: 24.1,
        time: Date.now()
      });
      expect(sensorData.length).assertEqual(2);
      expect(sensorData[0].value).assertEqual(23.5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7400
     * @tc.desc   Verify push() in data batching
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const allData: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const batches: number[][] = [];
      const currentBatch: number[] = [];
      allData.forEach((item: number, index: number) => {
        currentBatch.push(item);
        if (currentBatch.length === 3 || index === allData.length - 1) {
          batches.push(currentBatch.slice());
          currentBatch.length = 0;
        }
      });
      expect(batches.length).assertEqual(4);
      expect(batches[0].length).assertEqual(3);
      expect(batches[0][0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7500
     * @tc.desc   Verify push() in data transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const results: number[] = [];
      const data: number[] = [1, 2, 3, 4, 5];
      data.forEach((num: number) => {
        results.push(num * 2);
      });
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(2);
      expect(results[1]).assertEqual(4);
      expect(results[2]).assertEqual(6);
      expect(results[3]).assertEqual(8);
      expect(results[4]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7600
     * @tc.desc   Verify push() with large number of elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(10000);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7700
     * @tc.desc   Verify push() with spread operator on large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const elements: number[] = [];
      for (let i = 0; i < 10000; i++) {
        elements.push(i);
      }
      arr.push(...elements);
      expect(arr.length).assertEqual(10000);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7800
     * @tc.desc   Verify push() on sparse array with very large index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | string)[] = [];
      arr[100000] = 'value';
      arr.push('new');
      expect(arr.length).assertEqual(100002);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest7900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_7900
     * @tc.desc   Verify push() on large pre-allocated array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array(100000);
      arr.fill(0);
      arr.push(1);
      expect(arr.length).assertEqual(100001);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest8000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_8000
     * @tc.desc   Verify push() performance with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];
      const start1: number = Date.now();
      arr1.push(...arr2);
      const time1: number = Date.now() - start1;
      expect(arr1.length).assertEqual(6);
      expect(time1 >= 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest8100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_8100
     * @tc.desc   Verify push() vs direct assignment to length index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [1, 2, 3];
      arr1.push(4);
      arr2[arr2.length] = 4;
      expect(arr1.length).assertEqual(4);
      expect(arr2.length).assertEqual(4);
      expect(arr1[3]).assertEqual(4);
      expect(arr2[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest8200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_8200
     * @tc.desc   Verify push() on pre-allocated array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = new Array(1000);
      arr.fill(0);
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(1100);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePushTest8300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_PUSH_TEST_8300
     * @tc.desc   Verify push() with 1000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePushTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(1000);
    });
  });
}
