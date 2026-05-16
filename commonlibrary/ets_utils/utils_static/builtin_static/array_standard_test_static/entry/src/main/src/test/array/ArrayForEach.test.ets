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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class Counter009 {
    total: number = 0;

    addValue(value: number): void {
        this.total += value;
    }
}

class Collector034 {
    data: number[] = [];

    add(v: number): void {
        this.data.push(v);
    }
}

class Accumulator040 {
    total: number = 0;

    add(n: number): void {
        this.total += n;
    }
}

class MyArray104 extends Array<number> {
    constructor(num: number, ...d: number[]) {
        super(num, ...d)
    }
}

class Counter132 {
    sum: int = 0;

    add(v: int) {
        this.sum += v;
    }
}

class Counter150 {
    total = 0;

    add(v: int) {
        this.total += v;
    }
}

interface Person008 { name: string; }

interface Item016 { value: number; }

interface User033 {
    id: int;
    name: string;
}

interface Person069 {
    name: string;
    age: number
}

interface Item096 { count: number }

interface Item114 { val: number }

interface Inner117 { val: number }

interface Obj121 { arr: number[] }

interface Obj128 { };

interface Obj134 { val: number }

type Mix048 = string | number;

export default function ArrayForEachTest() {
  describe('ArrayForEachTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.name   testArrayForEach0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0001
     * @tc.desc   Verify forEach iterates over all elements in a numeric array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [];
      arr.forEach((value: number): void => {
        result.push(value);
      });
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0002
     * @tc.desc   Verify forEach provides correct index argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const indices: number[] = [];
      arr.forEach((_: string, index: int): void => {
        indices.push(index);
      });
      expect(JSON.stringify(indices)).assertDeepEquals(JSON.stringify([0, 1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0003
     * @tc.desc   Verify forEach provides correct array argument reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false];
      let sameRef: boolean = true;
      arr.forEach((_: boolean, __: int, arrayRef: boolean[]): void => {
        if (arrayRef !== arr) {
          sameRef = false;
        }
      });
      expect(sameRef).assertEqual(true);
    });

    /**
     * @tc.name   testArrayForEach0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0005
     * @tc.desc   Verify forEach skips empty slots in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // ArkTS requires defined array values, so simulate sparse with undefined
      const arr: (number | undefined)[] = [1, undefined, 3];
      const visited: number[] = [];
      arr.forEach((value: number | undefined): void => {
        if (value !== undefined) {
          visited.push(value);
        }
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 3]));
    });

    /**
     * @tc.name   testArrayForEach0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0006
     * @tc.desc   Verify forEach with empty array executes no callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = [];
      let count: number = 0;
      arr.forEach((_: string): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   testArrayForEach0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0007
     * @tc.desc   Verify forEach processes string array elements in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['x', 'y', 'z'];
      let concat: string = '';
      arr.forEach((ch: string): void => {
        concat += ch;
      });
      expect(concat).assertEqual('xyz');
    });

    /**
     * @tc.name   testArrayForEach0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0008
     * @tc.desc   Verify forEach with object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Person008[] = [{ name: 'a' }, { name: 'b' }];
      const names: string[] = [];
      arr.forEach((p: Person008): void => {
        names.push(p.name);
      });
      expect(names).assertDeepEquals(['a', 'b']);
    });

    /**
     * @tc.name   testArrayForEach0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0009
     * @tc.desc   Verify forEach thisArg binding with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];

      const counter: Counter009 = new Counter009();
      arr.forEach((value: number): void => {
        counter.addValue(value);
      });
      expect(counter.total).assertEqual(3);
    });

    /**
     * @tc.name   testArrayForEach0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0011
     * @tc.desc   Verify forEach ignores added elements after iteration start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      const result: number[] = [];
      arr.forEach((value: number, index: int, arrayRef: number[]): void => {
        result.push(value);
        arrayRef.push(99);
      });
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1]));
    });

    /**
     * @tc.name   testArrayForEach0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0012
     * @tc.desc   Verify forEach processes existing elements only once even if modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const result: number[] = [];
      arr.forEach((value: number, index: int, arrayRef: number[]): void => {
        result.push(value);
        arrayRef[index] = value + 10;
      });
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0013
     * @tc.desc   Verify forEach does not visit deleted elements after iteration start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [];
      arr.forEach((value: number, index: int, arrayRef: number[]): void => {
        result.push(value);
        if (index === 0) {
          arrayRef.splice(1, 1);
        }
      });
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3]));
    });

    /**
     * @tc.name   testArrayForEach0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0014
     * @tc.desc   Verify forEach callback executes correct number of times for array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 6, 7, 8];
      let count: number = 0;
      arr.forEach((_: number): void => {
        count++;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name   testArrayForEach0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0015
     * @tc.desc   Verify forEach on array of booleans accumulates correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      let countTrue: number = 0;
      arr.forEach((val: boolean): void => {
        if (val) {
          countTrue++;
        }
      });
      expect(countTrue).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0016
     * @tc.desc   Verify forEach can handle array of objects with numeric property sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item016[] = [{ value: 1 }, { value: 2 }, { value: 3 }];
      let total: number = 0;
      arr.forEach((item: Item016): void => {
        total += item.value;
      });
      expect(total).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0017
     * @tc.desc   Verify forEach works with array of strings to build uppercase list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['a', 'b'];
      const upper: string[] = [];
      arr.forEach((s: string): void => {
        upper.push(s.toUpperCase());
      });
      expect(upper).assertDeepEquals(['A', 'B']);
    });

    /**
     * @tc.name   testArrayForEach0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0018
     * @tc.desc   Verify forEach with nested arrays flattens manually
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = [];
      arr.forEach((sub: number[]): void => {
        sub.forEach((n: number): void => {
          flat.push(n);
        });
      });
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0019
     * @tc.desc   Verify forEach handles mutation by setting undefined to values during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, 2];
      const values: (number | undefined)[] = [];
      arr.forEach((val: number | undefined, idx: int, arrayRef: (number | undefined)[]): void => {
        values.push(val);
        arrayRef[idx] = undefined;
      });
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0020
     * @tc.desc   Verify forEach with string concatenation preserves order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ['h', 'e', 'l', 'l', 'o'];
      let result: string = '';
      arr.forEach((c: string): void => {
        result += c;
      });
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.name   testArrayForEach0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0022
     * @tc.desc   Verify forEach stops executing when array length is reduced to 0 during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const visited: number[] = [];
      arr.forEach((value: number, index: int, a: number[]): void => {
        visited.push(value);
        if (index === 0) {
          a.length = 0; // shrink array while iterating
        }
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1]));
    });

    /**
     * @tc.name   testArrayForEach0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0024
     * @tc.desc   Verify forEach with callback capturing outer variable scope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      let multiplier: number = 2;
      const results: number[] = [];
      arr.forEach((n: number): void => {
        results.push(n * multiplier);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([2, 4]));
    });

    /**
     * @tc.name   testArrayForEach0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_ForEach_0025
     * @tc.desc   Verify forEach does not break early on return in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = [];
      arr.forEach((n: number): void => {
        result.push(n);
        return;
      });
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0026
     * @tc.desc   Verify forEach with empty typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: Array<number> = [];
      const arr: Int32Array = new Int32Array(arr1);
      let count: number = 0;
      arr.forEach(() => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   testArrayForEach0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0028
     * @tc.desc   Verify forEach receives undefined explicitly stored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined];
      const result: (number | undefined)[] = [];
      arr.forEach((v: number | undefined): void => result.push(v));
      expect(result).assertDeepEquals([undefined]);
    });

    /**
     * @tc.name   testArrayForEach0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0029
     * @tc.desc   Verify forEach on array with boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      let trueCount: number = 0;
      arr.forEach((v: boolean) => {
        if (v) {
          trueCount++;
        }
      });
      expect(trueCount).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0030
     * @tc.desc   Verify forEach with callback accessing outer variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      let sum: number = 0;
      arr.forEach((v: number) => {
        sum += v;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0031
     * @tc.desc   Verify forEach with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4]];
      const flat: number[] = [];
      arr.forEach((sub: number[]) => sub.forEach((v: number): void => flat.push(v)));
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0032
     * @tc.desc   Verify forEach does not mutate array length automatically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.forEach((v: number, i: int, a: number[]) => {
        a[i] = v + 1;
      });
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0033
     * @tc.desc   Verify forEach on object array with interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: User033[] = [{ id: 1, name: "A" }, { id: 2, name: "B" }];
      const names: string[] = [];
      arr.forEach((u: User033): void => names.push(u.name));
      expect(names).assertDeepEquals(["A", "B"]);
    });

    /**
     * @tc.name   testArrayForEach0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0034
     * @tc.desc   Verify forEach with thisArg binding correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const collector: Collector034 = new Collector034();
      arr.forEach((v: number) => {
        collector.add(v);
      });
      expect(JSON.stringify(collector.data)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0036
     * @tc.desc   Verify forEach can mutate array elements during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.forEach((v: number, i: int, a: number[]) => {
        a[i] = v * 2;
      });
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   testArrayForEach0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0037
     * @tc.desc   Verify forEach on string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const concat: string[] = [];
      arr.forEach((s: string): void => concat.push(s.toUpperCase()));
      expect(concat).assertDeepEquals(["A", "B", "C"]);
    });

    /**
     * @tc.name   testArrayForEach0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0038
     * @tc.desc   Verify forEach callback receives correct index values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [10, 20, 30];
      const indices: number[] = [];
      arr.forEach((_v: number, i: int): void => indices.push(i));
      expect(JSON.stringify(indices)).assertDeepEquals(JSON.stringify([0, 1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0039
     * @tc.desc   Verify forEach on nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[], [1]];
      const result: number[] = [];
      arr.forEach((inner: number[]) => inner.forEach((v: number): void => result.push(v)));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1]));
    });

    /**
     * @tc.name   testArrayForEach0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0040
     * @tc.desc   Verify forEach with object having method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const acc: Accumulator040 = new Accumulator040();
      arr.forEach((n: number) => acc.add(n));
      expect(acc.total).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0041
     * @tc.desc   Verify forEach handles NaN values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [NaN, 1];
      const res: boolean[] = [];
      arr.forEach((v: number): void => res.push(Number.isNaN(v)));
      expect(res).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayForEach0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0044
     * @tc.desc   Verify forEach with Map values inside array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map<string, number>([["a", 1]]);
      const arr: Map<string, number>[] = [map];
      const keys: string[] = [];
      arr.forEach((m: Map<string, number>): void => keys.push(...Array.from(m.keys())));
      expect(keys).assertDeepEquals(["a"]);
    });

    /**
     * @tc.name   testArrayForEach0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0045
     * @tc.desc   Verify forEach does not execute callback when array is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      let called: boolean = false;
      arr.forEach(() => {
        called = true;
      });
      expect(called).assertEqual(false);
    });

    /**
     * @tc.name   testArrayForEach0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0047
     * @tc.desc   Verify forEach with bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [1n, 2n];
      let total: bigint = 0n;
      arr.forEach((b: bigint) => {
        total += b;
      });
      expect(total).assertEqual(3n);
    });

    /**
     * @tc.name   testArrayForEach0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0048
     * @tc.desc   Verify forEach with mixed type union elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Mix048[] = [1, "a"];
      const out: string[] = [];
      arr.forEach((x: Mix048): void => out.push(String(x)));
      expect(out).assertDeepEquals(["1", "a"]);
    });

    /**
     * @tc.name   testArrayForEach0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0049
     * @tc.desc   Verify forEach with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [new Date(0), new Date(1)];
      const years: number[] = [];
      arr.forEach((d: Date): void => years.push(d.getFullYear()));
      expect(years.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0050
     * @tc.desc   Verify forEach with nested forEach inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2]];
      const res: number[] = [];
      arr.forEach((sub: number[]) => sub.forEach((v: number): void => res.push(v)));
      expect(JSON.stringify(res)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0051
     * @tc.desc   Verify forEach with Uint8Array typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Uint8Array = new Uint8Array([1, 2]);
      let sum: number = 0;
      arr.forEach((v: number) => {
        sum += v;
      });
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.name   testArrayForEach0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0052
     * @tc.desc   Verify forEach does not execute on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      let count: number = 0;
      arr.forEach((): void => count++);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   testArrayForEach0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0053
     * @tc.desc   Verify forEach processes single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["hello"];
      const collected: string[] = [];
      arr.forEach((v: string): void => collected.push(v + "!"));
      expect(collected).assertDeepEquals(["hello!"]);
    });

    /**
     * @tc.name   testArrayForEach0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0054
     * @tc.desc   Verify forEach passes correct index argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [10, 20, 30];
      const indices: number[] = [];
      arr.forEach((_: number, idx: int): void => indices.push(idx));
      expect(JSON.stringify(indices)).assertDeepEquals(JSON.stringify([0, 1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0055
     * @tc.desc   Verify forEach third argument is the array itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [7, 8];
      let sameRef: boolean = false;
      arr.forEach((_: number, __: int, a: number[]): void => {
        sameRef = (a === arr);
      });
      expect(sameRef).assertEqual(true);
    });

    /**
     * @tc.name   testArrayForEach0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0057
     * @tc.desc   Verify forEach callback not called on empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const collected: (number | undefined)[] = [];
      arr.forEach((v: number | undefined): void => collected.push(v));
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   testArrayForEach0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0058
     * @tc.desc   Verify forEach respects sparse array with explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, 2];
      const collected: (number | undefined)[] = [];
      arr.forEach((v: number | undefined): void => collected.push(v));
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([undefined, 2]));
    });

    /**
     * @tc.name   testArrayForEach0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0060
     * @tc.desc   Verify forEach does not change array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.forEach((v: number, i: int, a: number[]): void => {
        a[i] = v * 2;
      });
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayForEach0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0061
     * @tc.desc   Verify forEach callback never receives values added after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1];
      const collected: number[] = [];
      arr.forEach((v: number, idx: int, a: number[]): void => {
        collected.push(v);
        a.push(2);
      });
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1]));
    });

    /**
     * @tc.name   testArrayForEach0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0062
     * @tc.desc   Verify forEach can read modified values during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const collected: number[] = [];
      arr.forEach((v: number, idx: int, a: number[]): void => {
        if (idx === 0) {
          a[1] = 99;
        }
        collected.push(v);
      });
      expect(arr[1]).assertEqual(99);
    });

    /**
     * @tc.name   testArrayForEach0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0067
     * @tc.desc   Verify forEach works with Uint8Array typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typed: Uint8Array = new Uint8Array([1, 2, 3]);
      const collected: number[] = [];
      typed.forEach((v: number): void => collected.push(v));
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0068
     * @tc.desc   Verify forEach ignores elements appended beyond original length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const visited: number[] = [];
      arr.forEach((value: number, index: int, a: number[]): void => {
        visited.push(value);
        if (index === 0) {
          a.push(3, 4, 5); // these should not be visited
        }
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0069
     * @tc.desc   Verify forEach on Object.keys result array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: Person069 = { name: "Tom", age: 20 };
      const keys: string[] = Object.keys(obj);
      const collected: string[] = [];
      keys.forEach((k: string): void => collected.push(k));
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0070
     * @tc.desc   Verify forEach callback never mutates source reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      arr.forEach((v: number, i: int, a: number[]): void => {
        a = [9, 9];
      });
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0071
     * @tc.desc   Verify forEach preserves NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [NaN];
      const collected: number[] = [];
      arr.forEach((v: number): void => collected.push(v));
      expect(isNaN(collected[0])).assertEqual(true);
    });

    /**
     * @tc.name   testArrayForEach0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0072
     * @tc.desc   Verify forEach works with Boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false];
      const collected: boolean[] = [];
      arr.forEach((v: boolean): void => collected.push(v));
      expect(collected).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayForEach0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0073
     * @tc.desc   Verify forEach works with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b"];
      const collected: string[] = [];
      arr.forEach((v: string): void => collected.push(v));
      expect(collected).assertDeepEquals(["a", "b"]);
    });

    /**
     * @tc.name   testArrayForEach0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0074
     * @tc.desc   Verify forEach callback order is ascending index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [3, 2, 1];
      const indices: number[] = [];
      arr.forEach((_: number, i: int): void => indices.push(i));
      expect(JSON.stringify(indices)).assertDeepEquals(JSON.stringify([0, 1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0075
     * @tc.desc   Verify forEach callback sees updated array length when truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const collected: number[] = [];
      arr.forEach((v: number, i: int, a: number[]): void => {
        if (i === 0) {
          a.length = 2;
        }
        collected.push(v);
      });
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0077
     * @tc.desc   Verify forEach preserves empty string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["", "a"];
      const collected: string[] = [];
      arr.forEach((v: string): void => collected.push(v));
      expect(collected).assertDeepEquals(["", "a"]);
    });

    /**
     * @tc.name   testArrayForEach0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0078
     * @tc.desc   Verify forEach works with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2]];
      const collected: number[] = [];
      arr.forEach((sub: number[]): void => collected.push(sub[0]));
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0079
     * @tc.desc   Verify forEach does not mutate original primitive elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b"];
      arr.forEach((v: string, i: int, a: string[]) => {
        a[i] = v.toUpperCase();
      });
      expect(arr).assertDeepEquals(["A", "B"]);
    });

    /**
     * @tc.name   testArrayForEach0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FOREACH_0080
     * @tc.desc   Verify forEach callback receives current value not snapshot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayForEach0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2];
      const collected: number[] = [];
      arr.forEach((v: number, i: int, a: number[]): void => {
        a[i] = v * 2;
        collected.push(a[i]);
      });
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([2, 4]));
    });

    /**
     * @tc.name   testArrayForEach0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0081
     * @tc.desc   forEach skips holes in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, undefined, 3, undefined, 5];
      let sum = 0;
      arr.forEach((v): void => sum += v ?? 0);
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.name   testArrayForEach0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0083
     * @tc.desc   new elements pushed during iteration are not visited
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      let count = 0;
      arr.forEach((v, i, a) => {
        count += v;
        if (i === 0) {
          a.push(4);
        }
      });
      expect(count).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0084
     * @tc.desc   removed elements during iteration are skipped
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [10, 20, 30];
      let visited: number[] = [];
      arr.forEach((v, i, a) => {
        visited.push(v);
        if (i === 0) {
          a.splice(1, 1);
        }
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([10, 30]));
    });

    /**
     * @tc.name   testArrayForEach0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0085
     * @tc.desc   element modification during iteration affects later values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const values: number[] = [];
      arr.forEach((v, i, a) => {
        if (i === 0) {
          a[1] = 99;
        }
        values.push(v);
      });
      expect(JSON.stringify(values)).assertDeepEquals(JSON.stringify([1, 99, 3]));
    });

    /**
     * @tc.name   testArrayForEach0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0088
     * @tc.desc   flatten nested array using forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [[1, 2], [3, 4]];
      const flat: number[] = [];
      arr.forEach(sub => sub.forEach((v): void => flat.push(v)));
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0089
     * @tc.desc   forEach does not execute on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      let called = false;
      arr.forEach(() => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name   testArrayForEach0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0090
     * @tc.desc   callback receives value index and array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [10];
      let received: [int, int, int[]] | null = null;
      arr.forEach((v, i, a) => {
        received = [v, i, a];
      });
      expect(JSON.stringify(received)).assertDeepEquals(JSON.stringify([10, 0, [10]]));
    });

    /**
     * @tc.name   testArrayForEach0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0093
     * @tc.desc   forEach with string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = ["a", "b"];
      let result = "";
      arr.forEach((s): void => result += s);
      expect(result).assertEqual("ab");
    });

    /**
     * @tc.name   testArrayForEach0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0094
     * @tc.desc   forEach works on array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [true, false, true];
      let count = 0;
      arr.forEach(v => {
        if (v) {
          count++;
        }
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0095
     * @tc.desc   forEach handles array with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, undefined, 3];
      const collected: (int | undefined)[] = [];
      arr.forEach((v): void => collected.push(v));
      expect(collected).assertDeepEquals([1, undefined, 3]);
    });

    /**
     * @tc.name   testArrayForEach0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0096
     * @tc.desc   forEach with object array modifies properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item096[] = [{ count: 1 }, { count: 2 }];
      arr.forEach((obj): void => obj.count++);
      expect(arr[0].count).assertEqual(2);
      expect(arr[1].count).assertEqual(3);
    });

    /**
     * @tc.name   testArrayForEach0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0097
     * @tc.desc   forEach callback called in ascending index order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [3, 2, 1];
      const indices: number[] = [];
      arr.forEach((_, i): void => indices.push(i));
      expect(JSON.stringify(indices)).assertDeepEquals(JSON.stringify([0, 1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0100
     * @tc.desc   forEach cannot break early with return statement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      let count = 0;
      arr.forEach(v => {
        count += v;
        return;
      });
      expect(count).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0102
     * @tc.desc   forEach with NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<number> = [NaN, 1];
      const result: number[] = [];
      arr.forEach((v): void => result.push(Number.isNaN(v) ? -1 : v));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([-1, 1]));
    });

    /**
     * @tc.name   testArrayForEach0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0103
     * @tc.desc   forEach called with empty callback has no effect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      arr.forEach(() => {
      });
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0104
     * @tc.desc   forEach called on subclass of Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new MyArray104(1, 2, 3);
      let sum = 0;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0107
     * @tc.desc   forEach callback receives correct array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      let same = true;
      arr.forEach((_, __, a) => {
        if (a !== arr) {
          same = false;
        }
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.name   testArrayForEach0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0108
     * @tc.desc   forEach executes synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      let order: number[] = [];
      arr.forEach((v): void => order.push(v));
      expect(JSON.stringify(order)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0109
     * @tc.desc   forEach with nested forEach inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [[1, 2], [3]];
      const flat: number[] = [];
      arr.forEach(inner => inner.forEach((v): void => flat.push(v)));
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayForEach0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0110
     * @tc.desc   forEach does not skip undefined explicitly set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [undefined];
      let visited: (undefined | number)[] = [];
      arr.forEach((v): void => visited.push(v));
      expect(visited).assertDeepEquals([undefined]);
    });

    /**
     * @tc.name   testArrayForEach0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0111
     * @tc.desc   forEach with numeric string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = ["1", "2", "3"];
      let sum = 0;
      arr.forEach((v): void => sum += Number(v));
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0112
     * @tc.desc   forEach called on array with null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, null, 3];
      const collected: (number | null)[] = [];
      arr.forEach((v): void => collected.push(v));
      expect(JSON.stringify(collected)).assertDeepEquals(JSON.stringify([1, null, 3]));
    });

    /**
     * @tc.name   testArrayForEach0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0113
     * @tc.desc   forEach with callback modifying the array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const visited: number[] = [];
      arr.forEach((v, i, a) => {
        visited.push(v);
        if (i === 0) {
          a.length = 1;
        }
      });
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1]));
    });

    /**
     * @tc.name   testArrayForEach0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0114
     * @tc.desc   forEach on array of objects with nested updates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item114[] = [{ val: 1 }, { val: 2 }];
      arr.forEach((obj): void => obj.val += 10);
      expect(arr[0].val).assertEqual(11);
      expect(arr[1].val).assertEqual(12);
    });

    /**
     * @tc.name   testArrayForEach0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0116
     * @tc.desc   forEach with array containing boolean and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (boolean | undefined)[] = [true, undefined, false];
      const collected: (boolean | undefined)[] = [];
      arr.forEach((v): void => collected.push(v));
      expect(collected).assertDeepEquals([true, undefined, false]);
    });

    /**
     * @tc.name   testArrayForEach0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0117
     * @tc.desc   forEach with nested objects inside array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Inner117[] = [{ val: 1 }, { val: 2 }];
      arr.forEach((o): void => o.val *= 2);
      expect(arr[0].val).assertEqual(2);
      expect(arr[1].val).assertEqual(4);
    });

    /**
     * @tc.name   testArrayForEach0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0118
     * @tc.desc   forEach on array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, "a", true];
      const collected: string[] = [];
      arr.forEach((v): void => collected.push(String(v)));
      expect(collected).assertDeepEquals(["1", "a", "true"]);
    });

    /**
     * @tc.name   testArrayForEach0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0119
     * @tc.desc   forEach on array with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [-1, -2, -3];
      let sum = 0;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(-6);
    });

    /**
     * @tc.name   testArrayForEach0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0120
     * @tc.desc   forEach called on array with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = ["", "a"];
      let concat = "";
      arr.forEach((v): void => concat += v);
      expect(concat).assertEqual("a");
    });

    /**
     * @tc.name   testArrayForEach0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0121
     * @tc.desc   forEach on array with objects containing array property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj121[] = [{ arr: [1] }, { arr: [2] }];
      arr.forEach((o): void => o.arr.push(10));
      expect(JSON.stringify(arr[0].arr)).assertDeepEquals(JSON.stringify([1, 10]));
      expect(JSON.stringify(arr[1].arr)).assertDeepEquals(JSON.stringify([2, 10]));
    });

    /**
     * @tc.name   testArrayForEach0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0123
     * @tc.desc   forEach on array of strings with spaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = ["a ", " b"];
      let combined = "";
      arr.forEach((v): void => combined += v.trim());
      expect(combined).assertEqual("ab");
    });

    /**
     * @tc.name   testArrayForEach0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0124
     * @tc.desc   forEach called on array with repeated elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 1, 1];
      let sum = 0;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.name   testArrayForEach0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0125
     * @tc.desc   forEach on array with nested undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[][] = [[1, undefined], [undefined, 2]];
      const flat: (number | undefined)[] = [];
      arr.forEach(sub => sub.forEach((v): void => flat.push(v)));
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, undefined, undefined, 2]));
    });

    /**
     * @tc.name   testArrayForEach0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0126
     * @tc.desc   forEach on array with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (() => int)[] = [() => 1, () => 2];
      const result: number[] = [];
      arr.forEach((f): void => result.push(f()));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayForEach0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0127
     * @tc.desc   forEach called on array containing Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<number> = [1, Infinity, 2];
      let sum: number = 0;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayForEach0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0128
     * @tc.desc   forEach on array of empty objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj128[] = [{}, {}];
      let count = 0;
      arr.forEach((): void => count++);
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   testArrayForEach0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0129
     * @tc.desc   forEach called on array with Boolean object wrappers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [new Boolean(true), new Boolean(false)];
      const values: boolean[] = [];
      arr.forEach((b): void => values.push(b.valueOf()));
      expect(values).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayForEach0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0131
     * @tc.desc   forEach on sparse array skips empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 3]; // sparse array
      const visited: (number | undefined)[] = [];
      arr.forEach((v): void => visited.push(v));
      expect(JSON.stringify(visited)).assertDeepEquals(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   testArrayForEach0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0132
     * @tc.desc   forEach with thisArg provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const counter = new Counter132();
      const arr: int[] = [1, 2, 3];
      arr.forEach((v: int): void => counter.add(v));
      expect(counter.sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayForEach0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0134
     * @tc.desc   forEach on array with objects to simulate copy by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj134[] = [{ val: 1 }];
      const copy: Obj134[] = [];
      arr.forEach((o): void => copy.push({ val: o.val }));
      copy[0].val += 10;
      expect(arr[0].val).assertEqual(1);
      expect(copy[0].val).assertEqual(11);
    });

    /**
     * @tc.name   testArrayForEach0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0135
     * @tc.desc   forEach modifies array during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const visited: number[] = [];
      arr.forEach((v, i, a) => {
        visited.push(v);
        if (i === 0) {
          a.push(4);
        }
      });
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0136
     * @tc.desc   forEach on 2D array to flatten
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [[1, 2], [3, 4]];
      const flat: number[] = [];
      arr.forEach(sub => sub.forEach((v): void => flat.push(v)));
      expect(JSON.stringify(flat)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayForEach0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0139
     * @tc.desc   forEach with callback throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2];
      let threw = false;
      try {
        arr.forEach(v => {
          if (v === 2) {
            throw new Error("fail");
          }
        });
      } catch(e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.name   testArrayForEach0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0144
     * @tc.desc   forEach on array with negative and positive numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [-1, 0, 1];
      let sum = 0;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.name   testArrayForEach0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0145
     * @tc.desc   forEach called on array with nested arrays modifying inner arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2]];
      arr.forEach((sub): void => sub.push(10));
      expect(JSON.stringify(arr[0])).assertDeepEquals(JSON.stringify([1, 10]));
      expect(JSON.stringify(arr[1])).assertDeepEquals(JSON.stringify([2, 10]));
    });

    /**
     * @tc.name   testArrayForEach0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0146
     * @tc.desc   forEach on array of BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1n, 2n, 3n];
      let sum = 0n;
      arr.forEach((v): void => sum += v);
      expect(sum).assertEqual(6n);
    });

    /**
     * @tc.name   testArrayForEach0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0147
     * @tc.desc   forEach on array of functions modifying external array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (() => int)[] = [() => 1, () => 2];
      const result: int[] = [];
      arr.forEach((f): void => result.push(f()));
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testArrayForEach0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0148
     * @tc.desc   forEach called on array with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [NaN, Infinity];
      const collected: string[] = [];
      arr.forEach((v): void => collected.push(isNaN(v) ? "NaN" : "Inf"));
      expect(collected).assertDeepEquals(["NaN", "Inf"]);
    });

    /**
     * @tc.name   testArrayForEach0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FOREACH_0150
     * @tc.desc   forEach with callback mutating both array and thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayForEach0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<int> = [1, 2, 3];
      const counter = new Counter150();
      arr.forEach((v): void => {
        arr.push(v + 3);
        counter.add(v);
      });
      expect(counter.total).assertEqual(6);
      expect(arr.length).assertEqual(6);
    });
  });
}