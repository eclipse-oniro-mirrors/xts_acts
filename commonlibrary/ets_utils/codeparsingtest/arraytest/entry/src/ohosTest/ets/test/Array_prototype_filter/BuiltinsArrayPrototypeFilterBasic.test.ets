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

interface TestProduct {
  name: string;
  price: number;
}

interface TestPerson {
  id: number;
  name: string;
}

interface TestObj {
  id?: number;
  name?: string;
}

interface TestObj1 {
  value?: number;
  name?: string;
}
interface TestObj3 {
  id: number;
  name: string;
}

interface FilterConfig {
  min: number;
  max: number;
}

interface ThresholdConfig {
  threshold: number;
}

interface Person {
  name: string;
  age: number;
}

interface Config {
  minAge: number;
  maxAge: number;
}

interface NestedFilter {
  min: number;
  max: number;
}

interface NestedConfig {
  filter: NestedFilter;
}

interface NestedLevel2 {
  value: number;
}
interface NestedLevel1 {
  level2: NestedLevel2;
}
interface NestedObj {
  level1: NestedLevel1;
}

interface DeepLevel3 {
  level3: string;
}
interface DeepLevel2 {
  level2: DeepLevel3;
}
interface DeepLevel1 {
  level1: DeepLevel2;
}
interface DeepObj {
  level1: DeepLevel1;
}

interface CircularObj {
  name: string;
  ref?: CircularObj;
}

export default function BuiltinsArrayPrototypeFilterBasicTest(){
  describe('BuiltinsArrayPrototypeFilterBasicTest', () => {
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
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0100
     * @tc.desc     Filter result can chain with other array methods
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
        const arr: number[] = [1, 2, 3, 4, 5];
        const result = arr.filter((n) => n > 2);
        const doubled = result.map((n) => n * 2);
      const sum = result.reduce((acc: number, cur: number) => {
        return acc + cur;
      }, 0 as number);

        expect(doubled[0]).assertEqual(6);
        expect(doubled[1]).assertEqual(8);
        expect(doubled[2]).assertEqual(10);
        expect(sum).assertEqual(12);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0200
     * @tc.desc     Filter number array, get elements greater than 3
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 2, 3, 4, 5, 6];
      const result: number[] = numbers.filter((n) => n > 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0300
     * @tc.desc     Filter number array, get even numbers
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = numbers.filter((n) => n % 2 === 0);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0400
     * @tc.desc     Filter string array, get words longer than 6 characters
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const words: string[] = ['spray', 'elite', 'exuberant', 'destruction', 'present'];
      const result: string[] = words.filter((word) => word.length > 6);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('exuberant');
      expect(result[1]).assertEqual('destruction');
      expect(result[2]).assertEqual('present');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0500
     * @tc.desc     Filter string array using string matching
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const words: string[] = ['apple', 'banana', 'grape', 'apricot', 'cherry'];
      const result: string[] = words.filter((word) => word.startsWith('ap'));
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('apple');
      expect(result[1]).assertEqual('apricot');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0600
     * @tc.desc     Filter object array, get products with price > 4
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const products: TestProduct[] = [
        { name: 'apple', price: 5 },
        { name: 'banana', price: 3 },
        { name: 'orange', price: 7 }
      ];
      const result: TestProduct[] = products.filter((item) => item.price > 4);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('apple');
      expect(result[1].name).assertEqual('orange');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0700
     * @tc.desc     Filter object array, get persons with id > 1
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const people: TestPerson[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
        { id: 3, name: 'Charlie' }
      ];
      const result: TestPerson[] = people.filter((person) => person.id > 1);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('Bob');
      expect(result[1].name).assertEqual('Charlie');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0800
     * @tc.desc     Filter truthy values from array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const values: number[] = [0, 1, 0, 1, 0];
      const result: number[] = values.filter((item) => !!item);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_0900
     * @tc.desc     Filter with multiple conditions
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result: number[] = numbers.filter((n) => n > 3 && n < 8 && n % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(6);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1000
     * @tc.desc     Verify filter does not modify original array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const original: number[] = [...arr];
      const result: number[] = arr.filter((n) => n > 2);
      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1100
     * @tc.desc     Verify filter returns new array reference
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.filter((n) => n > 0);
      expect(result !== arr).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1200
     * @tc.desc     Callback receives current element correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30];
      const elements: number[] = [];
      arr.filter((elem) => {
        elements.push(elem);
        return true;
      });
      expect(elements.length).assertEqual(3);
      expect(elements[0]).assertEqual(10);
      expect(elements[1]).assertEqual(20);
      expect(elements[2]).assertEqual(30);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1300
     * @tc.desc     Callback receives index correctly
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = ['a', 'b', 'c', 'd'];
      const indices: number[] = [];
      arr.filter((elem, index) => {
        indices.push(index);
        return true;
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1400
     * @tc.desc     Filter elements by even index
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [10, 20, 30, 40, 50];
      const result: number[] = arr.filter((elem, index) => index % 2 === 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1500
     * @tc.desc     Callback receives original array reference
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      let sameRef: boolean = false;
      arr.filter((elem, index, array) => {
        if (array === arr) sameRef = true;
        return true;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1600
     * @tc.desc     Access array elements in filter callback
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.filter((elem, index, array) => elem > array[0]);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1700
     * @tc.desc     Use element, index, array together in filter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.filter((elem, index, array) => {
        return index > 0;
      });

      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1800
     * @tc.desc     Omit unused parameters in filter callback
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result1: number[] = arr.filter((elem) => elem > 2);
      const result2: number[] = arr.filter((elem, index) => index < 3);
      expect(result1.length).assertEqual(3);
      expect(result1[0]).assertEqual(3);
      expect(result1[1]).assertEqual(4);
      expect(result1[2]).assertEqual(5);

      expect(result2.length).assertEqual(3);
      expect(result2[0]).assertEqual(1);
      expect(result2[1]).assertEqual(2);
      expect(result2[2]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_1900
     * @tc.desc     Filter returns filtered array instance
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result: number[] = arr.filter((n) => n >= 3);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2000
     * @tc.desc     Return empty array if no elements match
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.filter((n) => n > 10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2100
     * @tc.desc     Filter returns shallow copy when all match
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.filter(() => true);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2200
     * @tc.desc     Filter preserves original element order
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [5, 2, 8, 1, 9, 3];
      const result: number[] = arr.filter((n) => n > 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2300
     * @tc.desc     Filter does not sort result array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [9, 1, 8, 2, 7, 3];
      const result: number[] = arr.filter((n) => n > 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(7);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2400
     * @tc.desc     Filter result is valid Array instance
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3];
      const result: number[] = arr.filter((n) => n > 0);
      expect(result instanceof Array).assertTrue();
      expect(Array.isArray(result)).assertTrue();
    });

       /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2500
     * @tc.desc     Call filter on empty array and return empty array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      const result = arr.filter(n => n > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2600
     * @tc.desc     Callback is not invoked when filtering empty array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [];
      let callCount = 0;
      arr.filter(() => {
        callCount++;
        return true;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2700
     * @tc.desc     Single element array with element matching condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [5];
      const result = arr.filter(n => n > 0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2800
     * @tc.desc     Single element array with element not matching condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [5];
      const result = arr.filter(n => n > 10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest2900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_2900
     * @tc.desc     Process array with large number of elements
     * @tc.type     FUNCTION
     * @tc.size     LARGETEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest2900', TestType.FUNCTION| Size.LARGETEST|Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 101; i++) {
        arr.push(i);
      }
      const result = arr.filter(n => n % 100 === 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3000
     * @tc.desc     All elements in large array match filter condition
     * @tc.type     FUNCTION
     * @tc.size     LARGETEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3000', TestType.FUNCTION| Size.LARGETEST|Level.LEVEL1, () => {
      const arr: number[] = [];
      for (let i = 0; i < 100; i++) {
        arr.push(i);
      }
      const result = arr.filter(() => true);
      expect(result.length).assertEqual(100);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3100
     * @tc.desc     Array contains Number.MAX_VALUE and Number.MIN_VALUE
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [Number.MAX_VALUE, Number.MIN_VALUE, 0, -Number.MAX_VALUE];
      const result = arr.filter(n => n > 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3200
     * @tc.desc     Array contains Infinity and -Infinity
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [Infinity, -Infinity, 0, 1];
      const result = arr.filter(n => n === Infinity || n === -Infinity);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3300
     * @tc.desc     Array contains NaN, filtered using Number.isNaN
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, NaN, 2, NaN, 3];
      const result = arr.filter(n => !Number.isNaN(n));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3400
     * @tc.desc     Array contains negative zero -0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [0, -0, 1, 2];

      const result = arr.filter(n => n === 0);

      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3500
     * @tc.desc     Handle integer, float, negative, zero and negative zero
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2.5, -3, 0, -0, 100, -100];
      const result = arr.filter(n => Number.isFinite(n));
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3600
     * @tc.desc     Filter string array including empty string and whitespace
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['hello', '', 'world', ' ', 'test'];
      const result = arr.filter(str => str.length > 0 && str !== ' ');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3700
     * @tc.desc     Process boolean array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true, false];
      const result = arr.filter(bool => bool === true);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3800
     * @tc.desc     Process array of objects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj3[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
        { id: 3, name: 'Charlie' }
      ];
      const result = arr.filter(obj => obj.id > 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest3900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_3900
     * @tc.desc     Process nested array structure
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[1, 2], [3, 4, 5], [6], []];
      const result = arr.filter(subArr => subArr.length > 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4000
     * @tc.desc     Count elements with number or string type using typeof
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const item1: number = 1;
      const item2: string = "string";
      const item3: boolean = true;
      const item4: number = 0;
      const item5: Object = new Object()
      const item6: number = 0;

      let count = 0;

      if (typeof item1 === "number" || typeof item1 === "string") count++;
      if (typeof item2 === "number" || typeof item2 === "string") count++;
      if (typeof item3 === "number" || typeof item3 === "string") count++;
      if (typeof item4 === "number" || typeof item4 === "string") count++;

      if (typeof item5 === "number" || typeof item5 === "string") count++;
      if (typeof item6 === "number" || typeof item6 === "string") count++;
      expect(count).assertEqual(4);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4100
     * @tc.desc     Filter elements based on runtime type checking
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = [1, '2', 3, '4', 5, '6'];

      const numbers = arr.filter((item) => typeof item === 'number');
      const strings = arr.filter((item) => typeof item === 'string');

      expect(numbers.length).assertEqual(3);
      expect(strings.length).assertEqual(3);
    });
      /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4200
     * @tc.desc     filter skips holes in sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4300
     * @tc.desc     distinguish holes and undefined values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n === undefined);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4400
     * @tc.desc     handle sparse array with holes and valid values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 2, undefined, undefined, 3, 4, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined && n % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4500
     * @tc.desc     length property of sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      expect(arr.length).assertEqual(5);
      const result: Array<number | undefined> = arr.filter((): boolean => true);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4600
     * @tc.desc     sparse array created by new Array(n)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4700
     * @tc.desc     handle empty slots created by assignment
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 3, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4800
     * @tc.desc     callback does not execute on holes
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      let callCount: number = 0;
      arr.filter((): boolean => {
        callCount++;
        return true;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest4900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_4900
     * @tc.desc     returned array has continuous indexes
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      const result: Array<number | undefined> = arr.filter((): boolean => true);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5000
     * @tc.desc     sparse array contains 0 value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [0, undefined, 1, undefined, 2];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5100
     * @tc.desc     sparse array contains null values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | null | undefined> = [null, undefined, null, undefined, 1];
      const result: Array<number | null | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5200
     * @tc.desc     all elements are holes in sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [undefined, undefined, undefined, undefined, undefined];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5300
     * @tc.desc     sparse array with only first element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [100, undefined, undefined, undefined, undefined];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined && n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5400
     * @tc.desc     sparse array with only last element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [undefined, undefined, undefined, undefined, 500];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined && n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(500);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5500
     * @tc.desc     sparse array with only middle element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [undefined, undefined, 300, undefined, undefined];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined && n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(300);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5600
     * @tc.desc     sparse array with alternate elements
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 3, undefined, 5, undefined];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined && n > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5700
     * @tc.desc     filter skips holes in sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      arr[4] = 5;
      const result: Array<number> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5800
     * @tc.desc     distinguish holes and undefined values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1];
      arr[1] = undefined;
      arr[4] = 5;
      const result: Array<number | undefined> = arr.filter((n): boolean => n === undefined);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest5900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_5900
     * @tc.desc     handle sparse array with holes and valid values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      arr[2] = 2;
      arr[5] = 3;
      arr[6] = 4;
      arr[8] = 5;
      const result: Array<number> = arr.filter((n): boolean => n % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6000
     * @tc.desc     length property of sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      arr[4] = 5;
      expect(arr.length).assertEqual(5);
      const result: Array<number> = arr.filter((): boolean => true);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6100
     * @tc.desc     sparse array created by new Array(n)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5);
      arr[0] = 1;
      arr[4] = 5;
      const result: Array<number> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6200
     * @tc.desc     handle empty slots created by assignment (replaced delete)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 3, undefined, 5];
      const result: Array<number | undefined> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6300
     * @tc.desc     callback does not execute on holes
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      arr[4] = 5;
      let callCount: number = 0;
      arr.filter((): boolean => {
        callCount++;
        return true;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6400
     * @tc.desc     returned array has continuous indexes
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1];
      arr[4] = 5;
      const result: Array<number> = arr.filter((): boolean => true);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6500
     * @tc.desc     sparse array contains 0 value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [0];
      arr[2] = 1;
      arr[4] = 2;
      const result: Array<number> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6600
     * @tc.desc     sparse array contains null values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | null> = [null];
      arr[2] = null;
      arr[4] = 1;
      const result: Array<number | null> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6700
     * @tc.desc     all elements are holes in sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5);
      const result: Array<number> = arr.filter((n): boolean => n !== undefined);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6800
     * @tc.desc     sparse array with only first element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5);
      arr[0] = 100;
      const result: Array<number> = arr.filter((n): boolean => n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest6900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_6900
     * @tc.desc     sparse array with only last element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5);
      arr[4] = 500;
      const result: Array<number> = arr.filter((n): boolean => n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(500);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7000
     * @tc.desc     sparse array with only middle element has value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5);
      arr[2] = 300;
      const result: Array<number> = arr.filter((n): boolean => n > 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(300);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7100
     * @tc.desc     sparse array with alternate elements
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(6);
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      const result: Array<number> = arr.filter((n): boolean => n > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });
    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7200
     * @tc.desc     Filter null values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | null> = [1, null, 2, null, 3];
      const result = arr.filter(item => item === null);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7300
     * @tc.desc     Filter undefined values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 2, undefined, 3];
      const result = arr.filter((item) => item === undefined);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7400
     * @tc.desc     Filter NaN values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, NaN, 2, NaN, 3];
      const result: number[] = arr.filter(n => Number.isNaN(n));
      expect(result.length).assertEqual(2);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(Number.isNaN(result[1])).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7500
     * @tc.desc     Filter positive infinity
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, Infinity, 2, -Infinity, 3];
      const result: number[] = arr.filter(n => n === Infinity);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7600
     * @tc.desc     Filter negative infinity
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, Infinity, 2, -Infinity, 3];
      const result: number[] = arr.filter(n => n === -Infinity);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7700
     * @tc.desc     Filter with empty objects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = [{}, {}, {}];
      const result: TestObj[] = arr.filter(obj => typeof obj === 'object');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7800
     * @tc.desc     Filter objects with properties
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj1[] = [
        {value: 10, name: 'A'},
        {value: 20, name: 'B'},
        {value: 5, name: 'C'}
      ];
      const result: TestObj[] = arr.filter(obj => obj.value! > 8);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('A');
      expect(result[1].name).assertEqual('B');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest7900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_7900
     * @tc.desc     Filter nested objects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: NestedObj[] = [
        { level1: { level2: { value: 1 } } },
        { level1: { level2: { value: 5 } } },
        { level1: { level2: { value: 10 } } }
      ];
      const result: NestedObj[] = arr.filter(obj => obj.level1.level2.value > 3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8000
     * @tc.desc     Filter function array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fn1 = (): number => 1;
      const fn2 = (): number => 2;
      const fn3 = (): number => 3;
      const arr: (() => number)[] = [fn1, fn2, fn3];
      const result: (() => number)[] = arr.filter(fn => fn() > 1);
      expect(result.length).assertEqual(2);
      expect(result[0]()).assertEqual(2);
      expect(result[1]()).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8100
     * @tc.desc     Filter arrow function array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: ((n: number) => number)[] = [
        (n: number) => n + 1,
        (n: number) => n + 2,
        (n: number) => n + 3
      ];
      const result: ((n: number) => number)[] = arr.filter(fn => fn(0) > 1);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8200
     * @tc.desc     Use filter on TypedArray
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const typedArray: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      const result: Uint8Array = typedArray.filter(n => n > 2);
      expect(result.length).assertEqual(3);
      expect(result instanceof Uint8Array).assertTrue();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8300
     * @tc.desc     Use filter on Int16Array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const int16Array: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      const result: Int16Array = int16Array.filter(n => n > 25);
      expect(result.length).assertEqual(3);
      expect(result instanceof Int16Array).assertTrue();
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(40);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8400
     * @tc.desc     Use filter on Float32Array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const float32Array: Float32Array = new Float32Array([1.5, 2.5, 3.5, 4.5, 5.5]);
      const result: Float32Array = float32Array.filter(n => n > 3.0);
      expect(result.length).assertEqual(3);
      expect(result instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8500
     * @tc.desc     Keep object reference after filter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: TestObj1 = {value: 1};
      const obj2: TestObj1 = {value: 2};
      const arr: TestObj1[] = [obj1, obj2];
      const result: TestObj1[] = arr.filter(obj => obj.value! > 0);
      expect(result[0] === obj1).assertTrue();
      expect(result[1] === obj2).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8600
     * @tc.desc     Modify original object affects filter result
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: TestObj1 = {value: 10};
      const arr: TestObj1[] = [obj];
      const result: TestObj1[] = arr.filter(() => true);
      obj.value = 20;
      expect(result[0].value).assertEqual(20);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8700
     * @tc.desc     Keep reference for nested array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const subArray: number[] = [1, 2, 3];
      const arr: number[][] = [subArray, [4, 5, 6]];
      const result: number[][] = arr.filter(() => true);
      expect(result[0] === subArray).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8800
     * @tc.desc     Modify nested array affects filter result
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const subArray: number[] = [1, 2, 3];
      const arr: number[][] = [subArray];
      const result: number[][] = arr.filter(() => true);
      subArray.push(4);
      expect(result[0].length).assertEqual(4);
      expect(result[0][3]).assertEqual(4);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest8900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_8900
     * @tc.desc     Keep function reference after filter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const fn1 = (): number => 1;
      const fn2 = (): number => 2;
      const arr: (() => number)[] = [fn1, fn2];
      const result: (() => number)[] = arr.filter(() => true);
      expect(result[0] === fn1).assertTrue();
      expect(result[1] === fn2).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9000
     * @tc.desc     Reference for deep nested object
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const deep: DeepObj = {
        level1: {
          level1: {
            level2: {
              level3: "value"
            }
          }
        }
      };
      const arr: DeepObj[] = [deep];
      const result: DeepObj[] = arr.filter(() => true);
      result[0].level1.level1.level2.level3 = 'modified';
      expect(deep.level1.level1.level2.level3).assertEqual('modified');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9100
     * @tc.desc     Object with circular reference
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: CircularObj = {name: 'obj1'};
      const obj2: CircularObj = {name: 'obj2'};
      obj1.ref = obj2;
      obj2.ref = obj1;
      const arr: CircularObj[] = [obj1, obj2];
      const result: CircularObj[] = arr.filter(() => true);
      expect(result[0].ref === obj2).assertTrue();
      expect(result[1].ref === obj1).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9200
     * @tc.desc     Value copy for primitive types
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let value: number = 10;
      const arr: number[] = [value];
      const result: number[] = arr.filter(() => true);
      value = 20;
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9300
     * @tc.desc     Shallow copy for Date object
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date: Date = new Date('2023-01-01');
      const arr: Date[] = [date];
      const result: Date[] = arr.filter(() => true);
      date.setFullYear(2024);
      expect(result[0].getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9400
     * @tc.desc     Shallow copy for RegExp object
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const regex: RegExp = new RegExp('test', 'gi');
      const arr: RegExp[] = [regex];
      const result: RegExp[] = arr.filter(() => true);
      expect(result[0] === regex).assertTrue();
    });
    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9500
     * @tc.desc     Use object as thisArg to specify this value in callback
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: FilterConfig = { min: 5, max: 10 };
      const arr: number[] = [1, 5, 8, 12, 15];
      const result = arr.filter((n) => n >= obj.min && n <= obj.max);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9600
     * @tc.desc     Arrow functions do not bind thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: ThresholdConfig = { threshold: 5 };
      const arr: number[] = [1, 5, 8, 12];
      const result = arr.filter((n) => n > obj.threshold);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(8);
      expect(result[1]).assertEqual(12);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9700
     * @tc.desc     Use number as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const threshold = 3;
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > threshold);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9800
     * @tc.desc     Use string as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const prefix = 'ap';
      const arr: string[] = ['apple', 'banana', 'apricot', 'cherry'];
      const result = arr.filter((fruit) => fruit.startsWith(prefix));

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('apple');
      expect(result[1]).assertEqual('apricot');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicTest9900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_TEST_9900
     * @tc.desc     thisArg is null
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicTest9900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > 2);

      expect(result.length).assertEqual(3);
    });
  });
}