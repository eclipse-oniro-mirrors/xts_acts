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

interface ThresholdContext011 {
    threshold: number;
}

interface Obj013 { x: number };

interface User027 {
    id: number;
    name: string;
}

class Data036 {
    value: number;

    constructor(value: number) {
        this.value = value;
    }
}

class Item036 {
    data: Data036;

    constructor(value: number) {
        this.data = new Data036(value);
    }
}

interface Ctx043 { limit: number; }

class Item055 {
    value: number;

    constructor(v: number) {
        this.value = v;
    }
}

class Box076 {
    value: number;

    constructor(v: number) {
        this.value = v;
    }
}

class Person080 {
    name: string;
    age: number;

    constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
    }
}

class User088 {
    id: number;

    constructor(id: number) {
        this.id = id;
    }
}

class Item089 {
    data: number;

    constructor(data: number) {
        this.data = data;
    }
}

class Flag091 {
    active: boolean;

    constructor(active: boolean) {
        this.active = active;
    }
}

class Item098 {
    active: boolean;

    constructor(active: boolean) {
        this.active = active;
    }
}

class Obj101 {
    values: number[];

    constructor(values: number[]) {
        this.values = values;
    }
}

class Obj108 {
    value: number;

    constructor(value: number) {
        this.value = value;
    }
}

class Obj115 {
    val: number;

    constructor(val: number) {
        this.val = val;
    }
}

class Obj118 {
    a: number;
    b: number;

    constructor(a: number, b: number) {
        this.a = a;
        this.b = b;
    }
}

export default function ArrayFindTest() {
  describe('ArrayFindTest', () => {
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
     * @tc.name   testArrayFind0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0001
     * @tc.desc   Should find the first element greater than 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 12, 8, 130, 44];
      const result: number | undefined = arr.find((element: number) => element > 10);
      expect(result === 12).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0002
     * @tc.desc   Should return undefined when no element matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 3, 5, 7];
      const result: number | undefined = arr.find((element: number) => element > 10);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0003
     * @tc.desc   Should work with an empty array and return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const result: number | undefined = arr.find((element: number) => element > 0);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0004
     * @tc.desc   Should pass element, index and array to callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [4, 6, 8];
      let callbackCalled = false;
      arr.find((element: int, index: int, array: int[]) => {
        callbackCalled = (element === 4 && index === 0 && array === arr);
        return true;
      });
      expect(callbackCalled).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0005
     * @tc.desc   Should find first even number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 3, 4, 6];
      const result: number | undefined = arr.find((element: number) => element % 2 === 0);
      expect(result === 4).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0006
     * @tc.desc   Should return first string starting with 'b'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["apple", "banana", "cherry"];
      const result: string | undefined = arr.find((element: string) => element.startsWith("b"));
      expect(result === "banana").assertTrue();
    });

    /**
     * @tc.name   testArrayFind0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0007
     * @tc.desc   Should find first negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, -2, -3, 4];
      const result: number | undefined = arr.find((element: number) => element < 0);
      expect(result === -2).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0008
     * @tc.desc   Should skip empty slots in sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (int | undefined)[] = [1, undefined, 3]; // sparse
      const result: int | undefined = arr.find((element: int | undefined) => element === undefined);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0009
     * @tc.desc   Should stop searching after finding first match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [10, 20, 30];
      let count = 0;
      const result = arr.find((element: number) => {
        count++;
        return element === 20;
      });
      expect(result === 20 && count === 2).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0010
     * @tc.desc   Should return undefined if condition never true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 4, 6];
      const result = arr.find((element: number) => element > 10);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0011
     * @tc.desc   Should use external context object instead of thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const context: ThresholdContext011 = { threshold: 15 };
      const arr: number[] = [10, 20, 30];
      const result: number | undefined = arr.find((element: number) => element > context.threshold);
      expect(result === 20).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0012
     * @tc.desc   Should return first boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, true, false];
      const result = arr.find((element: boolean) => element === true);
      expect(result === true).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0013
     * @tc.desc   Should find first object with property x > 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj013[] = [{ x: 1 }, { x: 2 }, { x: 3 }];
      const result = arr.find((element) => element.x > 2);
      expect(result?.x === 3).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0014
     * @tc.desc   Should find NaN value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, NaN);
      const result = arr.find((element) => Number.isNaN(element));
      expect(Number.isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0015
     * @tc.desc   Should return first element equal to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [-1, 0, 1];
      const result = arr.find((element) => element === 0);
      expect(result === 0).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0016
     * @tc.desc   Should return undefined for all falsy values when condition expects truthy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [0, "", null, undefined, false];
      const result = arr.find((element) => Boolean(element));
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0017
     * @tc.desc   Should find first string with length > 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = ["a", "abc", "abcdef", "xyz"];
      const result = arr.find((element) => element.length > 5);
      expect(result === "abcdef").assertTrue();
    });

    /**
     * @tc.name   testArrayFind0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0018
     * @tc.desc   Should return undefined when predicate always false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const result = arr.find(() => false);
      expect(result === undefined).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0019
     * @tc.desc   Should return first element divisible by 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [2, 4, 5, 10];
      const result = arr.find((element) => element % 5 === 0);
      expect(result === 5).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0020
     * @tc.desc   Should return undefined if array has only undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [undefined, undefined];
      const result = arr.find((element) => element !== undefined);
      expect(result === undefined).assertTrue();
    });


    /**
     * @tc.name   testArrayFind0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0021
     * @tc.desc   Should return undefined when all elements are negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [-5, -10, -15];
      const result: number | undefined = arr.find((v: number) => v > 0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0022
     * @tc.desc   Should return first even number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 3, 4, 6];
      const result: number | undefined = arr.find((v: number) => v % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testArrayFind0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0023
     * @tc.desc   Should find element by index comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [5, 10, 15];
      const result: int | undefined = arr.find((v: int, i: int) => i === 2);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   testArrayFind0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0024
     * @tc.desc   Should return first element greater than or equal to 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [20, 50, 100, 200];
      const result: number | undefined = arr.find((v: number) => v >= 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   testArrayFind0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0025
     * @tc.desc   Should return first truthy string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["", "", "hello", "world"];
      const result: string | undefined = arr.find((v: string) => v.length > 0);
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.name   testArrayFind0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0026
     * @tc.desc   Should skip empty slots in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined, 3, 4];
      const result: number | undefined = arr.find((v: number | undefined) => v !== undefined);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0027
     * @tc.desc   Should return first object with property match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: User027[] = [{ id: 1, name: "a" }, { id: 2, name: "b" }];
      const result: User027 | undefined = arr.find((u: User027) => u.id === 2);
      expect(result?.name).assertEqual("b");
    });

    /**
     * @tc.name   testArrayFind0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0028
     * @tc.desc   Should return undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const result: number | undefined = arr.find((v: number) => v > 0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0029
     * @tc.desc   Should return element from array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, true];
      const result: boolean | undefined = arr.find((v: boolean) => v === true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   testArrayFind0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0030
     * @tc.desc   Should return first NaN from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, NaN, 3];
      const result: number | undefined = arr.find((v: number) => Number.isNaN(v));
      expect(Number.isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0031
     * @tc.desc   Should return first Infinity from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, Infinity];
      const result: number | undefined = arr.find((v: number) => v === Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayFind0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0033
     * @tc.desc   Should return first element greater than its index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [0, 1, 5];
      const result: int | undefined = arr.find((v: int, i: int) => v > i);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFind0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0034
     * @tc.desc   Should return undefined when predicate always false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number | undefined = arr.find((_v: number) => false);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0035
     * @tc.desc   Should return first matching string ignoring case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["Apple", "banana", "Cherry"];
      const result: string | undefined = arr.find((v: string) => v.toLowerCase() === "banana");
      expect(result).assertEqual("banana");
    });

    /**
     * @tc.name   testArrayFind0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0036
     * @tc.desc   Should return first object with nested property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item036[] = [new Item036(1), new Item036(5)];
      const result: Item036 | undefined = arr.find((x: Item036) => x.data.value > 2);
      expect(result !== undefined && result!.data!.value === 5).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0037
     * @tc.desc   Should return first element from reversed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [3, 2, 1].reverse();
      const result: int | undefined = arr.find((v: int) => v > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0038
     * @tc.desc   Should return undefined if array filled with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(3).fill(7);
      const result: int | undefined = arr.find((v: int) => v === 8);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0039
     * @tc.desc   Should find element after map transformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [1, 2, 3].map((v: int) => v * 2);
      const result: int | undefined = arr.find((v: int) => v === 6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   testArrayFind0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0040
     * @tc.desc   Should return first falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 2];
      const result: number | undefined = arr.find((v: number | undefined) => !v);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0041
     * @tc.desc   Should return first element larger than previous
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 4, 10];
      let prev: number = -Infinity;
      const result: number | undefined = arr.find((v: number) => {
        const isLarger = v > prev;
        prev = v;
        return isLarger && v > 5;
      });
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   testArrayFind0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0042
     * @tc.desc   Should find string element in tuple using typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, "a", true];
      const result: string | undefined =
        arr.find((v: number | string | boolean) => typeof v === "string") as string | undefined;
      expect(result).assertEqual("a");
    });

    /**
     * @tc.name   testArrayFind0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0043
     * @tc.desc   Should return element greater than threshold using context object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ctx: Ctx043 = { limit: 15 };
      const arr: number[] = [10, 20, 30];
      const result: number | undefined = arr.find((v: number) => v > ctx.limit);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   testArrayFind0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0044
     * @tc.desc   Should return first matching element after concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [1].concat([2, 3]);
      const result: int | undefined = arr.find((v: int) => v === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0045
     * @tc.desc   Should return first value not equal to specific number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [7, 7, 8];
      const result: number | undefined = arr.find((v: number) => v !== 7);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name   testArrayFind0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0046
     * @tc.desc   Should return undefined if no element matches condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const result: string | undefined = arr.find((v: string) => v === "z");
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0047
     * @tc.desc   Should return element after filter chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [5, 10, 15].filter((v: int) => v > 5);
      const result: int | undefined = arr.find((v: int) => v === 15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   testArrayFind0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0048
     * @tc.desc   Should return element from slice of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4];
      const sliced: number[] = arr.slice(1, 3);
      const result: number | undefined = sliced.find((v: number) => v === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0049
     * @tc.desc   Should return first element after sort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [5, 1, 3].sort();
      const result: int | undefined = arr.find((v: int) => v === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0050
     * @tc.desc   Should find first matching element in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = new Array<int>(10000).fill(0);
      arr[9999] = 42;
      const result: int | undefined = arr.find((x: int) => x === 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name   testArrayFind0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0051
     * @tc.desc   Should return first element even if multiple match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 2, 3];
      const result: number | undefined = arr.find((x: number) => x === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0052
     * @tc.desc   Should not mutate original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      arr.find((x: number) => x > 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0053
     * @tc.desc   Should skip empty slots in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      arr[3] = 7;
      const result: number | undefined = arr.find((x: number | undefined) => x === 7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   testArrayFind0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0054
     * @tc.desc   Should handle array with all undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [undefined, undefined];
      const result: number | undefined = arr.find((x: number | undefined) => x !== undefined) as number | undefined;
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0055
     * @tc.desc   Should find in array of objects using class-based match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item055[] = [new Item055(1), new Item055(99)];
      const result: Item055 | undefined = arr.find((i: Item055) => i.value === 99);
      expect(result !== undefined && result!.value === 99).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0056
     * @tc.desc   Should find NaN when using Number.isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, NaN, 2];
      const result: number | undefined = arr.find((x: number) => Number.isNaN(x));
      expect(Number.isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0057
     * @tc.desc   Should return undefined when predicate never matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number | undefined = arr.find((x: number) => x > 10);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0058
     * @tc.desc   Should find first even number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 3, 4, 6];
      const result: number | undefined = arr.find((x: number) => x % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testArrayFind0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0059
     * @tc.desc   Should work with readonly array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: ReadonlyArray<number> = [1, 2, 3];
      const result: number | undefined = arr.find((x: number) => x === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0060
     * @tc.desc   Should handle negative numbers correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [-5, -3, -1];
      const result: number | undefined = arr.find((x: number) => x < -2);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.name   testArrayFind0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0061
     * @tc.desc   Should find string in array of mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | string | boolean)[] = [1, true, "hello"];
      const result: string | undefined =
        arr.find((x: number | string | boolean) => typeof x === "string") as string | undefined;
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.name   testArrayFind0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0062
     * @tc.desc   Should stop iterating after match found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let count = 0;
      const arr: number[] = [1, 2, 3];
      arr.find((x: number) => {
        count++;
        return x === 2;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0063
     * @tc.desc   Should handle array with Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, Infinity, 5];
      const result: number | undefined = arr.find((x: number) => x === Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayFind0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0064
     * @tc.desc   Should work with array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, true];
      const result: boolean | undefined = arr.find((x: boolean) => x === true);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0065
     * @tc.desc   Should return first element when predicate always true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [7, 8, 9];
      const result: number | undefined = arr.find((x: number) => true);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   testArrayFind0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0066
     * @tc.desc   Should return undefined for all-false predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: number | undefined = arr.find((x: number) => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0067
     * @tc.desc   Should find element in array with holes and undefined explicitly assigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = new Array<number | undefined>(4);
      arr[0] = undefined;
      arr[3] = 10;
      const result: number | undefined = arr.find((x: number | undefined) => x === 10) as number | undefined;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   testArrayFind0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0068
     * @tc.desc   Should work with array created by Array.from and filled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      for (let i: number = 1; i <= 5; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.find((x: number): boolean => x === 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFind0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0069
     * @tc.desc   Should work with very large indices but small array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = [100];
      const result: int | undefined = arr.find((x: int, idx: int) => idx === 1000);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0071
     * @tc.desc   Should handle array containing empty strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["", "a", "b"];
      const result: string | undefined = arr.find((x: string) => x === "");
      expect(result).assertEqual("");
    });

    /**
     * @tc.name   testArrayFind0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0073
     * @tc.desc   Should find boolean false explicitly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, false, true];
      const result: boolean | undefined = arr.find((x: boolean) => x === false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   testArrayFind0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0074
     * @tc.desc   Should handle nested arrays and find by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const inner: number[] = [1, 2];
      const arr: (number[] | number)[] = [[3], inner, 5];
      const result: number[] | number | undefined = arr.find((x: number[] | number) => Array.isArray(x) && x === inner);
      expect(result === inner).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0075
     * @tc.desc   Should not crash when predicate always throws
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      let errorThrown = false;
      try {
        arr.find((_x: number) => {
          throw new Error("test");
          return false;
        });
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0076
     * @tc.desc   Should handle array with duplicated object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = new Box076(5);
      const arr: Box076[] = [obj, new Box076(6), obj];
      const result: Box076 | undefined = arr.find((x: Box076) => x.value === 5);
      expect(result === obj).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0077
     * @tc.desc   Should work with array containing null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [null, 2, 3];
      const result: number | null | undefined = arr.find((x: number | null) => x === null);
      expect(result).assertNull();
    });

    /**
     * @tc.name   testArrayFind0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0078
     * @tc.desc   Should find last element if only it matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 9];
      const result: number | undefined = arr.find((x: number) => x === 9);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   testArrayFind0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0079
     * @tc.desc   Should find first positive number in mixed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [-10, -5, 0, 5, 10];
      const result: number | undefined = arr.find((x: number): boolean => x > 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFind0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0080
     * @tc.desc   Should find object by property in object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Person080[] = [new Person080("Alice", 30), new Person080("Bob", 25)];
      const result: Person080 | undefined = arr.find((x: Person080): boolean => x.age < 30);
      expect(result?.name).assertEqual("Bob");
    });

    /**
     * @tc.name   testArrayFind0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0081
     * @tc.desc   Should return undefined for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      const result: number | undefined = arr.find((x: number): boolean => x > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0082
     * @tc.desc   Should find NaN in array using Number.isNaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, NaN, 3];
      const result: number | undefined = arr.find((x: number): boolean => Number.isNaN(x));
      expect(Number.isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0083
     * @tc.desc   Should find Infinity in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, Infinity, 5];
      const result: number | undefined = arr.find((x: number): boolean => x === Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayFind0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0084
     * @tc.desc   Should find last occurrence value in array with duplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 2, 1];
      const result: number | undefined = arr.find((x: number): boolean => x === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0085
     * @tc.desc   Should find element in array of booleans
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [false, false, true, false];
      const result: boolean | undefined = arr.find((x: boolean): boolean => x);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0086
     * @tc.desc   Should find string with length > 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "abcd", "xyz"];
      const result: string | undefined = arr.find((x: string): boolean => x.length > 3);
      expect(result).assertEqual("abcd");
    });

    /**
     * @tc.name   testArrayFind0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0087
     * @tc.desc   Should find nested array by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const inner: number[] = [1, 2];
      const arr: (number[] | number)[] = [inner, [3, 4]];
      const result: number[] | undefined =
        arr.find((x: number[] | number): boolean => Array.isArray(x) && x === inner) as number[] | undefined;
      expect(result === inner).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0088
     * @tc.desc   Should return undefined if no object matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: User088[] = [new User088(1), new User088(2)];
      const result: User088 | undefined = arr.find((x: User088): boolean => x.id === 3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0089
     * @tc.desc   Should find object with nested property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item089[] = [new Item089(10), new Item089(20)];
      const result: Item089 | undefined = arr.find((x: Item089): boolean => x.data === 20);
      expect(result?.data).assertEqual(20);
    });

    /**
     * @tc.name   testArrayFind0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0090
     * @tc.desc   Should handle large array efficiently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 10000; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.find((x: number): boolean => x === 9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.name   testArrayFind0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0091
     * @tc.desc   Should find first element in array of objects with boolean property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Flag091[] = [new Flag091(false), new Flag091(true)];
      const result: Flag091 | undefined = arr.find((x: Flag091): boolean => x.active);
      expect(result?.active).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0092
     * @tc.desc   Should find first falsy value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined | null)[] = [1, 0, undefined, null];
      const result: number | undefined | null = arr.find((x: number | undefined | null): boolean => !x);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFind0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0093
     * @tc.desc   Should find first truthy value in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [0, null, 5, 10];
      const result: number | undefined = arr.find((x: number | null): boolean => Boolean(x)) as number | undefined;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name   testArrayFind0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0094
     * @tc.desc   Should return undefined when predicate always false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const result: string | undefined = arr.find((x: string): boolean => x === "d");
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0095
     * @tc.desc   Should handle array of arrays and find by first element value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[] | undefined = arr.find((x: number[]): boolean => x[0] === 3);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 4]));
    });

    /**
     * @tc.name   testArrayFind0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0096
     * @tc.desc   Should find first even number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 3, 5, 6, 7];
      const result: number | undefined = arr.find((x: number): boolean => x % 2 === 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   testArrayFind0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0097
     * @tc.desc   Should find first string starting with "x"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "xenon", "b"];
      const result: string | undefined = arr.find((x: string): boolean => x.startsWith("x"));
      expect(result).assertEqual("xenon");
    });

    /**
     * @tc.name   testArrayFind0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0098
     * @tc.desc   Should find object with specific boolean property false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Item098[] = [new Item098(true), new Item098(false)];
      const result: Item098 | undefined = arr.find((x: Item098): boolean => x.active === false);
      expect(result?.active).assertFalse();
    });

    /**
     * @tc.name   testArrayFind0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0099
     * @tc.desc   Should find first number greater than 50 in large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      for (let i: number = 0; i < 1000; i++) {
        arr.push(i);
      }
      const result: number | undefined = arr.find((x: number): boolean => x > 50);
      expect(result).assertEqual(51);
    });

    /**
     * @tc.name   testArrayFind0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0100
     * @tc.desc   Should return undefined when array contains only null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: null[] = [null, null];
      const result: null | undefined = arr.find((x: null): boolean => x !== null);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   testArrayFind0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0101
     * @tc.desc   Should find object with nested array property containing specific number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj101[] = [new Obj101([1, 2]), new Obj101([3, 4])];
      const result: Obj101 | undefined = arr.find((x: Obj101): boolean => x.values.includes(4));
      expect(JSON.stringify(result?.values)).assertDeepEquals(JSON.stringify([3, 4]));
    });

    /**
     * @tc.name   testArrayFind0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0102
     * @tc.desc   Should find first element satisfying multiple conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 10, 15, 20];
      const result: number | undefined = arr.find((x: number): boolean => x > 10 && x % 5 === 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   testArrayFind0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0103
     * @tc.desc   Should find first element in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = new Array<number | undefined>(6);
      arr[2] = 5;
      arr[5] = 10;
      const result: number | undefined = arr.find((x: number | undefined): boolean => x === 10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   testArrayFind0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0105
     * @tc.desc   Should find undefined in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const result: number | undefined = arr.find((x: number | undefined): boolean => x === undefined);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayFind0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0106
     * @tc.desc   Should find null in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | null)[] = ["a", null, "b"];
      const result: string | null | undefined = arr.find((x: string | null): boolean => x === null);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name   testArrayFind0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0107
     * @tc.desc   Should find first non-zero number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [0, 0, 3, 4];
      const result: number | undefined = arr.find((x: number): boolean => x !== 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   testArrayFind0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0108
     * @tc.desc   Should find object by reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a = new Obj108(1);
      const b = new Obj108(2);
      const arr: Obj108[] = [a, b];
      const result: Obj108 | undefined = arr.find((x: Obj108): boolean => x === b);
      expect(result === b).assertTrue();
    });

    /**
     * @tc.name   testArrayFind0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0109
     * @tc.desc   Should find number in multidimensional array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1, 2], [3, 4], [5, 6]];
      const result: number[] | undefined = arr.find((x: number[]): boolean => x.includes(4));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 4]));
    });

    /**
     * @tc.name   testArrayFind0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0110
     * @tc.desc   Should find string containing substring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["abc", "def", "xyz"];
      const result: string | undefined = arr.find((x: string): boolean => x.includes("d"));
      expect(result).assertEqual("def");
    });

    /**
     * @tc.name   testArrayFind0111
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0111
     * @tc.desc   Should find boolean false in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = [true, true, false];
      const result: boolean | undefined = arr.find((x: boolean): boolean => x === false);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   testArrayFind0112
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0112
     * @tc.desc   Should find number divisible by 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [5, 14, 21];
      const result: number | undefined = arr.find((x: number): boolean => x % 7 === 0);
      expect(result).assertEqual(14);
    });

    /**
     * @tc.name   testArrayFind0113
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0113
     * @tc.desc   Should find first non-empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["", "", "found"];
      const result: string | undefined = arr.find((x: string): boolean => x !== "");
      expect(result).assertEqual("found");
    });

    /**
     * @tc.name   testArrayFind0114
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0114
     * @tc.desc   Should find number in array containing NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [NaN, 0, 1];
      const result: number | undefined = arr.find((x: number): boolean => x === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   testArrayFind0115
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0115
     * @tc.desc   Should find object in array by property equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj115[] = [new Obj115(1), new Obj115(2)];
      const result: Obj115 | undefined = arr.find((x: Obj115): boolean => x.val === 2);
      expect(result?.val).assertEqual(2);
    });

    /**
     * @tc.name   testArrayFind0116
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0116
     * @tc.desc   Should find string with exact match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["a", "b", "c"];
      const result: string | undefined = arr.find((x: string): boolean => x === "b");
      expect(result).assertEqual("b");
    });

    /**
     * @tc.name   testArrayFind0117
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0117
     * @tc.desc   Should find first element greater than average
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const avg: number = arr.reduce((sum: number, val: number): number => sum + val, 0) / arr.length;
      const result: number | undefined = arr.find((x: number): boolean => x > avg);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   testArrayFind0118
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0118
     * @tc.desc   Should find object in array where multiple properties match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Obj118[] = [new Obj118(1, 2), new Obj118(3, 4)];
      const result: Obj118 | undefined = arr.find((x: Obj118): boolean => x.a === 3 && x.b === 4);
      expect(result?.a).assertEqual(3);
      expect(result?.b).assertEqual(4);
    });

    /**
     * @tc.name   testArrayFind0119
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0119
     * @tc.desc   Should find first truthy string in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = ["", "", "ok"];
      const result: string | undefined = arr.find((x: string): boolean => Boolean(x));
      expect(result).assertEqual("ok");
    });

    /**
     * @tc.name   testArrayFind0120
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0120
     * @tc.desc   Should find first number not divisible by 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [2, 4, 6, 7, 8];
      const result: number | undefined = arr.find((x: number): boolean => x % 2 !== 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.name   testArrayFind0121
     * @tc.number SUB_COMMONLIBRARY_ARRAY_FIND_0121
     * @tc.desc   Should return first matching element from Set converted to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("testArrayFind0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = Array.from(new Set<int>([1, 2, 3]));
      const result: int | undefined = arr.find((v: int) => v === 2);
      expect(result).assertEqual(2);
    });

  });
}