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

export default function BuiltinsArrayPrototypeForEachTest(): void {
  describe("BuiltinsArrayPrototypeForEachTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
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
     * @tc.name   BuiltinsArrayPrototypeForEachTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0100
     * @tc.desc   Verify forEach executes callback for each element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: Array<number> = [];
      arr.forEach((item: number): void => {
        result.push(item);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0200
     * @tc.desc   Verify forEach traverses in ascending index order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['first', 'second', 'third'];
      const order: Array<number> = [];
      arr.forEach((item: string, index: number): void => {
        order.push(index);
      });
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0300
     * @tc.desc   Verify forEach visits all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      let count: number = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0400
     * @tc.desc   Verify forEach callback receives element parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['apple', 'banana', 'cherry'];
      const elements: Array<string> = [];
      arr.forEach((element: string): void => {
        elements.push(element);
      });
      expect(elements.length).assertEqual(3);
      expect(elements[0]).assertEqual('apple');
      expect(elements[1]).assertEqual('banana');
      expect(elements[2]).assertEqual('cherry');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0500
     * @tc.desc   Verify forEach callback receives index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const indices: Array<number> = [];
      arr.forEach((element: string, index: number): void => {
        indices.push(index);
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0600
     * @tc.desc   Verify forEach callback receives array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const checks: Array<boolean> = [];
      arr.forEach((element: number, index: number, array: Array<number>): void => {
        checks.push(array === arr);
      });
      expect(checks.length).assertEqual(3);
      expect(checks[0]).assertTrue();
      expect(checks[1]).assertTrue();
      expect(checks[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0700
     * @tc.desc   Verify forEach can modify array through array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.forEach((element: number, index: number, array: Array<number>): void => {
        array[index] = element * 2;
      });
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0800
     * @tc.desc   Verify forEach returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: void = arr.forEach((item: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_0900
     * @tc.desc   Verify forEach with empty array does not execute callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      let count: number = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1000
     * @tc.desc   Verify forEach with single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [42];
      let result: number = 0;
      arr.forEach((item: number): void => {
        result = item;
      });
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1100
     * @tc.desc   Verify forEach skips empty slots in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(5);
      arr[0] = 1;
      arr[4] = 5;
      let count: number = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1200
     * @tc.desc   Verify forEach with number type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2.5, -3, 0];
      const results: Array<number> = [];
      arr.forEach((item: number): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(4);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2.5);
      expect(results[2]).assertEqual(-3);
      expect(results[3]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1300
     * @tc.desc   Verify forEach with string type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['hello', '', 'world'];
      const results: Array<string> = [];
      arr.forEach((item: string): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual('hello');
      expect(results[1]).assertEqual('');
      expect(results[2]).assertEqual('world');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1400
     * @tc.desc   Verify forEach with boolean type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false, true];
      const results: Array<boolean> = [];
      arr.forEach((item: boolean): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertFalse();
      expect(results[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1500
     * @tc.desc   Verify forEach with null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object | null | undefined> = [null, undefined, 1];
      const results: Array<Object | null | undefined> = [];
      arr.forEach((item: Object | null | undefined): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(null);
      expect(results[1]).assertEqual(undefined);
      expect(results[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1600
     * @tc.desc   Verify forEach with object type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const arr: Array<Object> = [obj1, obj2];
      const results: Array<Object> = [];
      arr.forEach((item: Object): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual(obj1);
      expect(results[1]).assertEqual(obj2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1700
     * @tc.desc   Verify forEach with nested array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      const results: Array<boolean> = [];
      arr.forEach((item: Array<number>): void => {
        results.push(Array.isArray(item));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1800
     * @tc.desc   Verify forEach with mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object> = [1 as Object, 'two' as Object, true as Object];
      const results: Array<Object> = [];
      arr.forEach((item: Object): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_1900
     * @tc.desc   Verify forEach does not visit elements added during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number): void => {
        visited.push(item);
        if (item === 2) {
          arr.push(4);
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2000
     * @tc.desc   Verify forEach uses updated values for unvisited elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (index === 0) {
          array[2] = 99;
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(99);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2100
     * @tc.desc   Verify forEach stops when array length is reduced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (item === 3) {
          array.length = 3;
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2200
     * @tc.desc   Verify forEach with push operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2];
      const visited: Array<number> = [];
      arr.forEach((item: number): void => {
        visited.push(item);
        arr.push(item + 10);
      });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2300
     * @tc.desc   Verify forEach with pop operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4];
      const visited: Array<number> = [];
      arr.forEach((item: number): void => {
        visited.push(item);
        arr.pop();
      });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2400
     * @tc.desc   Verify forEach with splice operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (item === 3) {
          array.splice(index, 1);
        }
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
      expect(visited[3]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2500
     * @tc.desc   Verify forEach with unshift operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (index === 0) {
          array.unshift(0);
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2600
     * @tc.desc   Verify forEach with shift operation during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4];
      const visited: Array<number> = [];
      arr.forEach((item: number): void => {
        visited.push(item);
        arr.shift();
      });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2700
     * @tc.desc   Verify forEach stops when array is cleared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        array.length = 0;
      });
      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2800
     * @tc.desc   Verify forEach handles large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i] = i;
      }
      let sum: number = 0;
      arr.forEach((item: number): void => {
        sum += item;
      });
      expect(sum).assertEqual(499500);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_2900
     * @tc.desc   Verify forEach with NaN element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [NaN, 1, NaN];
      const results: Array<boolean> = [];
      arr.forEach((item: number): void => {
        results.push(Number.isNaN(item));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertFalse();
      expect(results[2]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3000
     * @tc.desc   Verify forEach with Infinity element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Infinity, -Infinity, 0];
      const results: Array<boolean> = [];
      arr.forEach((item: number): void => {
        results.push(!Number.isFinite(item));
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
      expect(results[2]).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3100
     * @tc.desc   Verify forEach can modify external variables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      let sum: number = 0;
      arr.forEach((item: number): void => {
        sum += item;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3200
     * @tc.desc   Verify forEach can collect data to external array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const evens: Array<number> = [];
      arr.forEach((item: number): void => {
        if (item % 2 === 0) {
          evens.push(item);
        }
      });
      expect(evens.length).assertEqual(2);
      expect(evens[0]).assertEqual(2);
      expect(evens[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3300
     * @tc.desc   Verify forEach with for-of combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      let forEachSum: number = 0;
      arr.forEach((item: number): void => {
        forEachSum += item;
      });
      let forOfSum: number = 0;
      for (const item of arr) {
        forOfSum += item;
      }
      expect(forEachSum).assertEqual(forOfSum);
      expect(forEachSum).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3400
     * @tc.desc   Verify forEach after filter operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const results: Array<number> = [];
      arr.filter((x: number): boolean => x > 2).forEach((x: number): void => {
        results.push(x);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(3);
      expect(results[1]).assertEqual(4);
      expect(results[2]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3500
     * @tc.desc   Verify forEach after map operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const results: Array<number> = [];
      arr.map((x: number): number => x * 2).forEach((x: number): void => {
        results.push(x);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(2);
      expect(results[1]).assertEqual(4);
      expect(results[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3600
     * @tc.desc   Verify forEach combined with reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const doubled: Array<number> = [];
      arr.forEach((x: number): void => {
        doubled.push(x * 2);
      });
      const sum = doubled.reduce((acc: number, curr: number): number => acc + curr, 0);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3700
     * @tc.desc   Verify forEach can modify object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObj {
        value: number;
      }
      const arr: Array<TestObj> = [{value: 1}, {value: 2}, {value: 3}];
      arr.forEach((item: TestObj): void => {
        item.value = item.value * 2;
      });
      expect(arr[0].value).assertEqual(2);
      expect(arr[1].value).assertEqual(4);
      expect(arr[2].value).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3800
     * @tc.desc   Verify forEach with array.length property access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const lengths: Array<number> = [];
      arr.forEach((element: number, index: number, array: Array<number>): void => {
        lengths.push(array.length);
      });
      expect(lengths.length).assertEqual(5);
      for (let i = 0; i < 5; i++) {
        expect(lengths[i]).assertEqual(5);
      }
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_3900
     * @tc.desc   Verify forEach with named function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [10, 20, 30];
      const results: Array<number> = [];
      const processItem = (item: number): void => {
        results.push(item);
      };
      arr.forEach(processItem);
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(20);
      expect(results[2]).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4000
     * @tc.desc   Verify forEach with anonymous function callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const results: Array<number> = [];
      arr.forEach((item: number): void => {
        results.push(item * 2);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(2);
      expect(results[1]).assertEqual(4);
      expect(results[2]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4100
     * @tc.desc   Verify forEach does not revisit modified elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (index === 1) {
          array[0] = 999;
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4200
     * @tc.desc   Verify forEach with multiple consecutive empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(5);
      arr[0] = 1;
      arr[4] = 5;
      const elements: Array<number> = [];
      arr.forEach((item: number): void => {
        elements.push(item);
      });
      expect(elements.length).assertEqual(2);
      expect(elements[0]).assertEqual(1);
      expect(elements[1]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4300
     * @tc.desc   Verify forEach with empty slots at start and end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(5);
      arr[2] = 3;
      const elements: Array<number> = [];
      arr.forEach((item: number): void => {
        elements.push(item);
      });
      expect(elements.length).assertEqual(1);
      expect(elements[0]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4400
     * @tc.desc   Verify forEach does not modify original array when callback doesn't modify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const originalLength: number = arr.length;
      arr.forEach((item: number): void => {});
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4500
     * @tc.desc   Verify forEach return value is undefined even with callback return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: void = arr.forEach((item: number): number => {
        return item * 2;
      });
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4600
     * @tc.desc   Verify forEach with empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result: void = arr.forEach((item: number): void => {});
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4700
     * @tc.desc   Verify forEach consistency with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1: Array<number> = [];
      const result2: Array<number> = [];
      arr.forEach((item: number): void => {
        result1.push(item);
      });
      arr.forEach((item: number): void => {
        result2.push(item);
      });
      expect(result1.length).assertEqual(result2.length);
      expect(result1[0]).assertEqual(result2[0]);
      expect(result1[1]).assertEqual(result2[1]);
      expect(result1[2]).assertEqual(result2[2]);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4800
     * @tc.desc   Verify forEach with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date1: Date = new Date('2020-01-01');
      const date2: Date = new Date('2021-01-01');
      const arr: Array<Date> = [date1, date2];
      const results: Array<boolean> = [];
      arr.forEach((item: Date): void => {
        results.push(item instanceof Date);
      });
      expect(results.length).assertEqual(2);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_4900
     * @tc.desc   Verify forEach with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<bigint> = [1n, 2n, 3n];
      const results: Array<bigint> = [];
      arr.forEach((item: bigint): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(1n);
      expect(results[1]).assertEqual(2n);
      expect(results[2]).assertEqual(3n);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5000
     * @tc.desc   Verify forEach with large index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = [];
      arr[100] = 'end';
      let count: number = 0;
      arr.forEach((item: string): void => {
        count++;
        expect(item).assertEqual('end');
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5100
     * @tc.desc   Verify forEach with increased array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (item === 1) {
          array.length = 5;
        }
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5200
     * @tc.desc   Verify forEach with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fn1 = (): number => 1;
      const fn2 = (): number => 2;
      const arr: Array<Function> = [fn1, fn2];
      const results: Array<number> = [];
      arr.forEach((item: Function): void => {
        results.push(item());
      });
      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5300
     * @tc.desc   Verify forEach does not wait for async operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: Array<number> = [1, 2, 3];
      let completed: number = 0;
      arr.forEach(async (item: number): Promise<void> => {
        await Utils.msSleep(10);
        completed++;
      });
      expect(completed).assertEqual(0);
      await Utils.msSleep(50);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5400
     * @tc.desc   Verify forEach with nested forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4]];
      const results: Array<number> = [];
      arr.forEach((subArray: Array<number>): void => {
        subArray.forEach((item: number): void => {
          results.push(item);
        });
      });
      expect(results.length).assertEqual(4);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      expect(results[2]).assertEqual(3);
      expect(results[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5500
     * @tc.desc   Verify forEach with string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const results: Array<string> = [];
      arr.forEach((item: string): void => {
        results.push(item.toUpperCase());
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual('A');
      expect(results[1]).assertEqual('B');
      expect(results[2]).assertEqual('C');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5600
     * @tc.desc   Verify forEach with empty string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['', 'a', ''];
      const lengths: Array<number> = [];
      arr.forEach((item: string): void => {
        lengths.push(item.length);
      });
      expect(lengths.length).assertEqual(3);
      expect(lengths[0]).assertEqual(0);
      expect(lengths[1]).assertEqual(1);
      expect(lengths[2]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5700
     * @tc.desc   Verify forEach callback exception interrupts iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      let caught = false;
      try {
        arr.forEach((item: number): void => {
          visited.push(item);
          if (item === 2) {
            throw new Error('Stop iteration');
          }
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5800
     * @tc.desc   Verify forEach return in callback does not interrupt iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const visited: Array<number> = [];
      arr.forEach((item: number): void => {
        if (item === 3) {
          return;
        }
        visited.push(item);
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(4);
      expect(visited[3]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_5900
     * @tc.desc   Verify forEach returns undefined while map returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const forEachResult: void = arr.forEach((x: number): void => {});
      const mapResult: Array<number> = arr.map((x: number): number => x * 2);
      expect(forEachResult).assertEqual(undefined);
      expect(Array.isArray(mapResult)).assertTrue();
      expect(mapResult.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6000
     * @tc.desc   Verify forEach returns undefined while filter returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const forEachResult: void = arr.forEach((x: number): void => {});
      const filterResult: Array<number> = arr.filter((x: number): boolean => x > 2);
      expect(forEachResult).assertEqual(undefined);
      expect(Array.isArray(filterResult)).assertTrue();
      expect(filterResult.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6100
     * @tc.desc   Verify element parameter is value copy for primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.forEach((element: number): void => {
        element = element * 2;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6200
     * @tc.desc   Verify forEach with super large length value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.length = 1000000;
      let count: number = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6300
     * @tc.desc   Verify forEach with length set to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.length = 0;
      let count: number = 0;
      arr.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6400
     * @tc.desc   Verify forEach with length set to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [5];
      arr.length = 1;
      const results: Array<number> = [];
      arr.forEach((item: number): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6500
     * @tc.desc   Verify forEach skips empty slots and records visited indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(3);
      arr[0] = 1;
      arr[2] = 3;
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number): void => {
        visited.push(index);
      });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(0);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6600
     * @tc.desc   Verify forEach produces same result as for loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const forEachResult: Array<number> = [];
      arr.forEach((item: number): void => {
        forEachResult.push(item * 2);
      });
      const forLoopResult: Array<number> = [];
      for (let i = 0; i < arr.length; i++) {
        forLoopResult.push(arr[i] * 2);
      }
      expect(forEachResult.length).assertEqual(forLoopResult.length);
      expect(forEachResult[0]).assertEqual(forLoopResult[0]);
      expect(forEachResult[1]).assertEqual(forLoopResult[1]);
      expect(forEachResult[2]).assertEqual(forLoopResult[2]);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6700
     * @tc.desc   Verify forEach on Uint8Array works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const results: Array<number> = [];
      typedArr.forEach((item: number): void => {
        results.push(item);
      });
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      expect(results[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6800
     * @tc.desc   Verify forEach does not wait for Promise resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const arr: Array<number> = [1, 2, 3];
      const order: Array<string> = [];
      arr.forEach((item: number): void => {
        Promise.resolve(item).then((value: number): void => {
          order.push('promise-' + value);
        });
      });
      order.push('sync');
      await Utils.msSleep(20);
      expect(order[0]).assertEqual('sync');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_6900
     * @tc.desc   Verify forEach with splice clear operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        array.splice(0);
      });
      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7000
     * @tc.desc   Verify forEach can access previous element using index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4];
      const previousElements: Array<number> = [];
      arr.forEach((element: number, index: number, array: Array<number>): void => {
        if (index > 0) {
          previousElements.push(array[index - 1]);
        }
      });
      expect(previousElements.length).assertEqual(3);
      expect(previousElements[0]).assertEqual(1);
      expect(previousElements[1]).assertEqual(2);
      expect(previousElements[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7100
     * @tc.desc   Verify forEach with RegExp object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<RegExp> = [/abc/, /def/gi];
      const results: Array<boolean> = [];
      arr.forEach((item: RegExp): void => {
        results.push(item instanceof RegExp);
      });
      expect(results.length).assertEqual(2);
      expect(results[0]).assertTrue();
      expect(results[1]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7200
     * @tc.desc   Verify forEach with empty array does not throw error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeForEachTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      let errorOccurred = false;
      try {
        const result: void = arr.forEach((item: number): void => {});
        expect(result).assertEqual(undefined);
      } catch (e) {
        errorOccurred = true;
      }
      expect(errorOccurred).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7300
     * @tc.desc   Verify forEach with super large index 100000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = [];
      arr[100000] = 'end';
      let count: number = 0;
      arr.forEach((item: string): void => {
        count++;
        expect(item).assertEqual('end');
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7400
     * @tc.desc   Verify forEach with three-level nested iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<Array<number>>> = [[[1, 2], [3]], [[4, 5, 6]]];
      const results: Array<number> = [];
      arr.forEach((level1: Array<Array<number>>): void => {
        level1.forEach((level2: Array<number>): void => {
          level2.forEach((item: number): void => {
            results.push(item);
          });
        });
      });
      expect(results.length).assertEqual(6);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      expect(results[2]).assertEqual(3);
      expect(results[3]).assertEqual(4);
      expect(results[4]).assertEqual(5);
      expect(results[5]).assertEqual(6);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeForEachTest7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FOR_EACH_TEST_7500
     * @tc.desc   Verify forEach with splice removing specific index during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeForEachTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const visited: Array<number> = [];
      arr.forEach((item: number, index: number, array: Array<number>): void => {
        visited.push(item);
        if (index === 1) {
          array.splice(3, 1);
        }
      });
      expect(visited.length).assertEqual(4);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
      expect(visited[3]).assertEqual(5);
    });
  });
}
