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

export default function BuiltinsArrayPrototypePopTest(): void {
  describe("BuiltinsArrayPrototypePopTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypePopTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0100
     * @tc.desc   Verify pop() on single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['only'];
      const result: string | undefined = arr.pop();
      expect(result).assertEqual('only');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0200
     * @tc.desc   Verify pop() on multi-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0300
     * @tc.desc   Verify pop() on large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      for (let i = 0; i < 10000; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(9999);
      expect(arr.length).assertEqual(9999);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0400
     * @tc.desc   Verify pop() modifies original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c'];
      const original: string[] = arr;
      arr.pop();
      expect(arr === original).assertTrue();
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0500
     * @tc.desc   Verify length property updates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      arr.pop();
      expect(arr.length).assertEqual(2);
      arr.pop();
      expect(arr.length).assertEqual(1);
      arr.pop();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0600
     * @tc.desc   Verify pop() returns basic type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(30);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0700
     * @tc.desc   Verify pop() returns string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['hello', 'world'];
      const result: string | undefined = arr.pop();
      expect(result).assertEqual('world');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0800
     * @tc.desc   Verify pop() returns boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true];
      const result: boolean | undefined = arr.pop();
      expect(result).assertTrue();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_0900
     * @tc.desc   Verify pop() returns object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObject {
        id: number;
        name: string;
      }
      const obj: TestObject = {id: 1, name: 'test'};
      const arr: TestObject[] = [obj];
      const result: TestObject | undefined = arr.pop();
      expect(result === obj).assertTrue();
      expect(result?.id).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1000
     * @tc.desc   Verify pop() returns nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const nested: number[] = [4, 5, 6];
      const arr: number[][] = [[1, 2, 3], nested];
      const result: number[] | undefined = arr.pop();
      expect(result === nested).assertTrue();
      expect(result?.length).assertEqual(3);
      expect(result?.[0]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1100
     * @tc.desc   Verify pop() returns function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const func: () => string = () => 'test';
      const arr: Array<() => string> = [func];
      const result: (() => string) | undefined = arr.pop();
      expect(result === func).assertTrue();
      expect(typeof result).assertEqual('function');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1200
     * @tc.desc   Verify pop() on empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1300
     * @tc.desc   Verify pop() on array emptied by pop returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1];
      arr.pop();
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1400
     * @tc.desc   Verify length property decreases with each pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      expect(arr.length).assertEqual(4);
      arr.pop();
      expect(arr.length).assertEqual(3);
      arr.pop();
      expect(arr.length).assertEqual(2);
      arr.pop();
      expect(arr.length).assertEqual(1);
      arr.pop();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1500
     * @tc.desc   Verify length does not become negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.pop();
      expect(arr.length).assertEqual(0);
      arr.pop();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1600
     * @tc.desc   Verify length equals actual element count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      arr.pop();
      let count: number = 0;
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] !== undefined) count++;
      }
      expect(arr.length).assertEqual(3);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1700
     * @tc.desc   Verify pop() on sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[3] = 4;
      expect(arr.length).assertEqual(4);
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1800
     * @tc.desc   Verify pop() on empty array doesn't affect array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_1900
     * @tc.desc   Verify multiple pop() on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      for (let i = 0; i < 5; i++) {
        const result: number | undefined = arr.pop();
        expect(result).assertUndefined();
        expect(arr.length).assertEqual(0);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2000
     * @tc.desc   Verify pop() after setting length to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      arr.length = 0;
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2100
     * @tc.desc   Verify pop() on array with custom properties but length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface ArrayWithCustomProp {
        customProp?: string;
      }
      const arr: number[] = [];
      (arr as ArrayWithCustomProp).customProp = 'test';
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect((arr as ArrayWithCustomProp).customProp).assertEqual('test');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2200
     * @tc.desc   Verify pop() returns null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | null)[] = [1, null, 3];
      arr.pop();
      const result: number | null | undefined = arr.pop();
      expect(result).assertNull();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2300
     * @tc.desc   Verify pop() returns undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      arr.pop();
      const result: number | undefined = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2400
     * @tc.desc   Verify pop() returns NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, NaN, 3];
      arr.pop();
      const result: number | undefined = arr.pop();
      expect(isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2500
     * @tc.desc   Verify pop() returns Infinity values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, Infinity, -Infinity];
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(-Infinity);
      expect(isFinite(result as number)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2600
     * @tc.desc   Verify pop() on number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2.5, -3, 0, 100];
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(100);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2700
     * @tc.desc   Verify pop() on string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: string[] = ['apple', 'banana', 'cherry'];
      const result: string | undefined = arr.pop();
      expect(result).assertEqual('cherry');
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual('banana');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2800
     * @tc.desc   Verify pop() on boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: boolean[] = [true, false, true, false];
      const result: boolean | undefined = arr.pop();
      expect(result).assertFalse();
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_2900
     * @tc.desc   Verify pop() on object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface User {
        id: number;
        name: string;
      }
      const arr: User[] = [
        {id: 1, name: 'Alice'},
        {id: 2, name: 'Bob'},
        {id: 3, name: 'Charlie'}
      ];
      const result: User | undefined = arr.pop();
      expect(result?.name).assertEqual('Charlie');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3000
     * @tc.desc   Verify pop() on nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[] | undefined = arr.pop();
      expect(result?.length).assertEqual(2);
      expect(result?.[0]).assertEqual(5);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3100
     * @tc.desc   Verify pop() on function array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const fn1: () => number = () => 1;
      const fn2: () => number = () => 2;
      const fn3: () => number = () => 3;
      const arr: Array<() => number> = [fn1, fn2, fn3];
      const result: (() => number) | undefined = arr.pop();
      expect(typeof result).assertEqual('function');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3200
     * @tc.desc   Verify pop() on mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface FourObject {
        four: number;
      }
      const arr: (number | string | boolean | null | FourObject | number[])[] = [1, 'two', true, null, {four: 4}, [5]];
      const result: (number | string | boolean | null | FourObject | number[]) | undefined = arr.pop();
      expect(Array.isArray(result)).assertTrue();
      expect((result as number[])[0]).assertEqual(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3300
     * @tc.desc   Verify continuous pop() operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const results: number[] = [];
      while (arr.length > 0) {
        const result: number | undefined = arr.pop();
        if (result !== undefined) {
          results.push(result);
        }
      }
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(5);
      expect(results[4]).assertEqual(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3400
     * @tc.desc   Verify alternating push and pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2];
      arr.push(3);
      const result1: number | undefined = arr.pop();
      expect(result1).assertEqual(3);
      arr.push(4, 5);
      const result2: number | undefined = arr.pop();
      expect(result2).assertEqual(5);
      const result3: number | undefined = arr.pop();
      expect(result3).assertEqual(4);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3500
     * @tc.desc   Verify pop() combined with push() to implement stack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stack: number[] = [];
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3600
     * @tc.desc   Verify pop() and shift() used together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const last: number | undefined = arr.pop();
      const first: number | undefined = arr.shift();
      expect(last).assertEqual(5);
      expect(first).assertEqual(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3700
     * @tc.desc   Verify pop() returns object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObject {
        id: number;
        name: string;
      }
      const obj: TestObject = {id: 1, name: 'test'};
      const arr: TestObject[] = [obj];
      const popped: TestObject | undefined = arr.pop();
      if (popped !== undefined) {
        popped.name = 'modified';
        expect(obj.name).assertEqual('modified');
        expect(popped === obj).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3800
     * @tc.desc   Verify pop() with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface CircularArray extends Array<number | CircularArray> {
      }
      const arr: CircularArray = [1, 2];
      arr.push(arr);
      const popped: number | CircularArray | undefined = arr.pop();
      expect(popped === arr).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_3900
     * @tc.desc   Verify pop() in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      'use strict';
      const arr: number[] = [1, 2, 3];
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4000
     * @tc.desc   Verify large number of continuous pop operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
      }
      let count: number = 0;
      while (arr.length > 0) {
        arr.pop();
        count++;
      }
      expect(count).assertEqual(1000);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4100
     * @tc.desc   Verify push after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      arr.pop();
      arr.push(4);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4200
     * @tc.desc   Verify modify remaining elements after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr[0] = 10;
      arr[1] = 20;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4300
     * @tc.desc   Verify use other array methods after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.pop();
      const doubled: number[] = arr.map((x: number): number => x * 2);
      expect(doubled.length).assertEqual(4);
      expect(doubled[3]).assertEqual(8);
      const filtered: number[] = arr.filter((x: number): boolean => x > 2);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4400
     * @tc.desc   Verify pop after push multiple elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [];
      arr.push(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
      const results: number[] = [];
      while (arr.length > 0) {
        const result: number | undefined = arr.pop();
        if (result !== undefined) {
          results.push(result);
        }
      }
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(5);
      expect(results[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4500
     * @tc.desc   Verify pop and shift to empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      arr.pop();
      arr.shift();
      arr.pop();
      arr.shift();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4600
     * @tc.desc   Verify unshift after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [];
      const popped: number | undefined = arr1.pop();
      if (popped !== undefined) {
        arr2.unshift(popped);
        expect(arr1.length).assertEqual(2);
        expect(arr2.length).assertEqual(1);
        expect(arr2[0]).assertEqual(3);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4700
     * @tc.desc   Verify pop after splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      arr.splice(1, 2);
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4800
     * @tc.desc   Verify pop vs splice for removing last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3, 4, 5];
      const arr2: number[] = [1, 2, 3, 4, 5];
      const r1: number | undefined = arr1.pop();
      const r2: number | undefined = arr2.splice(-1, 1)[0];
      expect(r1).assertEqual(r2);
      expect(arr1.length).assertEqual(arr2.length);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_4900
     * @tc.desc   Verify slice doesn't affect pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const sliced: number[] = arr.slice(1, 3);
      const popped: number | undefined = arr.pop();
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(2);
      expect(popped).assertEqual(5);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5000
     * @tc.desc   Verify slice as alternative to pop (non-modifying)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const withoutLast: number[] = arr.slice(0, -1);
      expect(withoutLast.length).assertEqual(4);
      expect(withoutLast[3]).assertEqual(4);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5100
     * @tc.desc   Verify concat after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5];
      arr1.pop();
      const result: number[] = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(5);
      expect(arr1.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5200
     * @tc.desc   Verify forEach after pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4];
      arr.pop();
      let sum: number = 0;
      arr.forEach((x: number): void => {
        sum += x;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5300
     * @tc.desc   Verify pop in iteration (not recommended)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4];
      const results: number[] = [];
      arr.forEach((item: number, index: number): void => {
        if (index === 0) {
          const popped: number | undefined = arr.pop();
          if (popped !== undefined) {
            results.push(popped);
          }
        }
      });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5400
     * @tc.desc   Verify pop on sparse array in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      'use strict';
      const arr: (number | undefined)[] = [];
      arr[0] = 1;
      arr[3] = 4;
      const result: number | undefined = arr.pop();
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5500
     * @tc.desc   Verify multiple references to same object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface SharedObject {
        value: number;
      }
      const shared: SharedObject = {value: 100};
      const arr: SharedObject[] = [shared, shared, shared];
      const popped: SharedObject | undefined = arr.pop();
      if (popped !== undefined) {
        popped.value = 200;
        expect(shared.value).assertEqual(200);
        expect(arr[0].value).assertEqual(200);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5600
     * @tc.desc   Verify nested object reference preservation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface Inner {
        x: number;
      }
      interface Outer {
        inner: Inner;
      }
      const inner: Inner = {x: 1};
      const outer: Outer = {inner: inner};
      const arr: Outer[] = [outer];
      const popped: Outer | undefined = arr.pop();
      if (popped !== undefined) {
        popped.inner.x = 10;
        expect(inner.x).assertEqual(10);
        expect(outer.inner.x).assertEqual(10);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5700
     * @tc.desc   Verify popped element still referenced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObject {
        data: string;
      }
      let reference: TestObject | null = null;
      const arr: TestObject[] = [{data: 'important'}];
      reference = arr.pop() || null;
      expect(arr.length).assertEqual(0);
      expect(reference?.data).assertEqual('important');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5800
     * @tc.desc   Verify popped element with no reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypePopTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObject {
        data: string;
      }
      const arr: TestObject[] = [{data: 'temporary'}];
      arr.pop();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_TEST_5900
     * @tc.desc   Verify pop with circular references between objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObject {
        name: string;
        ref?: TestObject;
      }
      const obj1: TestObject = {name: 'obj1'};
      const obj2: TestObject = {name: 'obj2'};
      obj1.ref = obj2;
      obj2.ref = obj1;
      const arr: TestObject[] = [obj1, obj2];
      const popped: TestObject | undefined = arr.pop();
      expect(popped?.name).assertEqual('obj2');
      expect(popped?.ref?.name).assertEqual('obj1');
    });
  });
}