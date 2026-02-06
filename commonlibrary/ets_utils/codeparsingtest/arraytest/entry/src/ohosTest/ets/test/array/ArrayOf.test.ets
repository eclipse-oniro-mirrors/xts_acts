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


import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testArrayOfJs0018,
  testArrayOfJs0020,
  testArrayOfJs0021,
  testArrayOfJs0023,
  testArrayOfJs0031,
  testArrayOfJs0032,
  testArrayOfJs0033,
  testArrayOfJs0034,
  testArrayOfJs0035,
  testArrayOfJs0036,
  testArrayOfJs0037,
  testArrayOfJs0038,
  testArrayOfJs0039,
  testArrayOfJs0045,
  testArrayOfJs0056,
  testArrayOfJs0072,
  testArrayOfJs0098
} from './ArrayOf';


interface User {
  id: number;
  name: string;
}

interface Product {
  sku: string;
  price: number;
}

interface Student {
  sno: string;
  score: number;
}

interface Book {
  isbn: string;
  title: string;
  author: string;
}

interface Circle {
  radius: number;

  getArea(): number;
}

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_2 {
  id: number;
  info: GeneratedObjectLiteralInterface_1;
}

interface GeneratedObjectLiteralInterface_3 {
  score: number;
}

interface GeneratedObjectLiteralInterface_4 {
  id: number;
  info: GeneratedObjectLiteralInterface_3;
}


interface GeneratedObjectLiteralInterface_5 {
  id: number;
  name: string;
  price: number;
  inStock: boolean;
}

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ArrayOfTest() {
  describe('ArrayOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   testArrayOf0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0001
     * @tc.desc   Verify Array.of() creates array with single number element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(7);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(7);
    });

    /**
     * @tc.name   testArrayOf0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0002
     * @tc.desc   Verify Array.of() creates array with multiple number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(1, 2, 3, 4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayOf0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0003
     * @tc.desc   Verify Array.of() creates array with single string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = Array.of('test');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.name   testArrayOf0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0004
     * @tc.desc   Verify Array.of() creates array with multiple string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = Array.of('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.name   testArrayOf0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0005
     * @tc.desc   Verify Array.of() creates array with single boolean element (true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(true);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0006
     * @tc.desc   Verify Array.of() creates array with single boolean element (false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(false);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.name   testArrayOf0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0007
     * @tc.desc   Verify Array.of() creates array with multiple boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0008
     * @tc.desc   Verify Array.of() creates empty array when no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: never[] = Array.of();
      expect(arr.length).assertEqual(0);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0009
     * @tc.desc   Verify Array.of() differs from Array() for single number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrOf: number[] = Array.of(5);
      const arrConstructor: number[] = Array(5);
      expect(arrOf.length).assertEqual(1);
      expect(arrConstructor.length).assertEqual(5);
      expect(arrOf[0]).assertEqual(5);
      expect(arrConstructor[0]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayOf0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0010
     * @tc.desc   Verify Array.of() creates array with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (null)[] = Array.of(null);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayOf0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0011
     * @tc.desc   Verify Array.of() creates array with undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (undefined)[] = Array.of(undefined);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayOf0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0012
     * @tc.desc   Verify Array.of() creates array with NaN element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(NaN);
      expect(arr.length).assertEqual(1);
      expect(isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0013
     * @tc.desc   Verify Array.of() creates array with Infinity element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(Infinity);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name   testArrayOf0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0014
     * @tc.desc   Verify Array.of() creates array with negative Infinity element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(-Infinity);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   testArrayOf0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0015
     * @tc.desc   Verify Array.of() creates array with object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const user: User = { id: 1, name: 'Alice' };
      const arr: User[] = Array.of(user);
      expect(arr.length).assertEqual(1);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.name   testArrayOf0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0016
     * @tc.desc   Verify Array.of() creates array with multiple object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const product1: Product = { sku: 'P001', price: 99.9 };
      const product2: Product = { sku: 'P002', price: 199.9 };
      const arr: Product[] = Array.of(product1, product2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].sku).assertEqual('P001');
      expect(arr[1].price).assertEqual(199.9);
    });

    /**
     * @tc.name   testArrayOf0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0017
     * @tc.desc   Verify Array.of() creates array with nested array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested1: number[] = [1, 2];
      const nested2: number[] = [3, 4];
      const arr: number[][] = Array.of(nested1, nested2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayOf0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0018
     * @tc.desc   Verify Array.of() creates array with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0018()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   testArrayOf0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0019
     * @tc.desc   Verify Array.of() works with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1: bigint = 100n;
      const big2: bigint = 200n;
      const arr: bigint[] = Array.of(big1, big2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200n);
    });

    /**
     * @tc.name   testArrayOf0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0020
     * @tc.desc   Verify Array.of() works with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0020()).assertDeepEquals([true, true, true]);
    });

    /**
     * @tc.name   testArrayOf0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0021
     * @tc.desc   Verify Array.of() creates array with mixed type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0021()).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   testArrayOf0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0022
     * @tc.desc   Verify Array.of() returns Array instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(1, 2, 3);
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0023
     * @tc.desc   Verify Array.of() with large number of parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0023()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testArrayOf0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0024
     * @tc.desc   Verify Array.of() with zero as parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name   testArrayOf0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0025
     * @tc.desc   Verify Array.of() with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(-5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-5);
    });

    /**
     * @tc.name   testArrayOf0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0026
     * @tc.desc   Verify Array.of() with decimal number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(3.14);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3.14);
    });

    /**
     * @tc.name   testArrayOf0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0027
     * @tc.desc   Verify Array.of() with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = Array.of('');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.name   testArrayOf0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0028
     * @tc.desc   Verify Array.of() with long string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = 'a'.repeat(1000);
      const arr: string[] = Array.of(longStr);
      expect(arr.length).assertEqual(1);
      expect(arr[0].length).assertEqual(1000);
    });

    /**
     * @tc.name   testArrayOf0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0029
     * @tc.desc   Verify Array.of() with date object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date: Date = new Date('2024-01-01');
      const arr: Date[] = Array.of(date);
      expect(arr.length).assertEqual(1);
      expect(arr[0].getTime()).assertEqual(date.getTime());
    });

    /**
     * @tc.name   testArrayOf0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0030
     * @tc.desc   Verify Array.of() with regexp object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex: RegExp = /test/g;
      const arr: RegExp[] = Array.of(regex);
      expect(arr.length).assertEqual(1);
      expect(arr[0].source).assertEqual('test');
      expect(arr[0].flags).assertEqual('g');
    });

    /**
     * @tc.name   testArrayOf0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0031
     * @tc.desc   Verify Array.of() called on custom array subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0031()).assertDeepEquals([true, true, 3]);
    });

    /**
     * @tc.name   testArrayOf0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0032
     * @tc.desc   Verify Array.of() with non-array constructor (valid)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0032()).assertDeepEquals([3, 1]);
    });

    /**
     * @tc.name   testArrayOf0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0033
     * @tc.desc   Verify Array.of() with non-constructor this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0033()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0034
     * @tc.desc   Verify Array.of() with undefined this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0034()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0035
     * @tc.desc   Verify Array.of() with null this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0035()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0036
     * @tc.desc   Verify Array.of() with boolean this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0036()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0037
     * @tc.desc   Verify Array.of() with number this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0037()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0038
     * @tc.desc   Verify Array.of() with string this value returns Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      expect(testArrayOfJs0038()).assertDeepEquals([true, 3]);
    });

    /**
     * @tc.name   testArrayOf0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0039
     * @tc.desc   Verify Array.of() created array has correct prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0039()).assertEqual(true);
    });

    /**
     * @tc.name   testArrayOf0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0040
     * @tc.desc   Verify Array.of() created array supports array methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(1, 2, 3);
      const mapped = arr.map(x => x * 2);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[1]).assertEqual(4);
      expect(mapped[2]).assertEqual(6);
    });

    /**
     * @tc.name   testArrayOf0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0041
     * @tc.desc   Verify Array.of() with NaN and Infinity together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(NaN, Infinity, -Infinity);
      expect(arr.length).assertEqual(3);
      expect(isNaN(arr[0])).assertTrue();
      expect(arr[1]).assertEqual(Infinity);
      expect(arr[2]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   testArrayOf0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0042
     * @tc.desc   Verify Array.of() with undefined and null together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (undefined | null)[] = Array.of(undefined, null);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayOf0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0043
     * @tc.desc   Verify Array.of() with different object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const user: User = { id: 1, name: 'Bob' };
      const date: Date = new Date();
      const regex: RegExp = /abc/;
      const arr = Array.of<User | Date | RegExp>(user, date, regex);
      expect(arr.length).assertEqual(3);
      expect((arr[0] as User).id).assertEqual(1);
      expect(arr[1] instanceof Date).assertTrue();
      expect((arr[2] as RegExp).source).assertEqual('abc');
    });

    /**
     * @tc.name   testArrayOf0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0044
     * @tc.desc   Verify Array.of() with spread operator on existing array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: number[] = [1, 2, 3];
      const arr: number[] = Array.of(...original);
      expect(arr.length).assertEqual(3);
      expect(arr).assertDeepEquals(original);
    });

    /**
     * @tc.name   testArrayOf0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0045
     * @tc.desc   Verify Array.of() with spread operator on string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0045()).assertDeepEquals(['t', 'e', 's', 't']);
    });

    /**
     * @tc.name   testArrayOf0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0046
     * @tc.desc   Verify Array.of() with typed array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typedArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr: Uint8Array[] = Array.of(typedArr);
      expect(arr.length).assertEqual(1);
      expect(arr[0] instanceof Uint8Array).assertTrue();
      expect(arr[0][0]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayOf0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0048
     * @tc.desc   Verify Array.of() with error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const error1: Error = new Error('Error 1');
      const error2: Error = new TypeError('Type Error');
      const arr: Error[] = Array.of(error1, error2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].message).assertEqual('Error 1');
      expect(arr[1] instanceof TypeError).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0049
     * @tc.desc   Verify Array.of() maintains element references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: User = { id: 1, name: 'Charlie' };
      const arr: User[] = Array.of(obj);
      obj.name = 'David';
      expect(arr[0].name).assertEqual('David');
    });

    /**
     * @tc.name   testArrayOf0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0050
     * @tc.desc   Verify Array.of() with mixed primitives and objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('testArrayOf0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const user: User = { id: 1, name: 'Eve' };
    //   const arr: (number | string | boolean | User)[] = Array.of(100, 'hello', true, user);
    //   expect(arr.length).assertEqual(4);
    //   expect(arr[0]).assertEqual(100);
    //   expect(arr[1]).assertEqual('hello');
    //   expect(arr[2]).assertTrue();
    //   expect(arr[3].id).assertEqual(1);
    // });

    /**
     * @tc.name   testArrayOf0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0051
     * @tc.desc   Verify Array.of() creates array with single Student object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const student: Student = { sno: '2024001', score: 95 };
      const arr: Student[] = Array.of(student);
      expect(arr.length).assertEqual(1);
      expect(arr[0].sno).assertEqual('2024001');
      expect(arr[0].score).assertEqual(95);
    });

    /**
     * @tc.name   testArrayOf0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0052
     * @tc.desc   Verify Array.of() creates array with multiple Student objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const student1: Student = { sno: '2024001', score: 95 };
      const student2: Student = { sno: '2024002', score: 88 };
      const arr: Student[] = Array.of(student1, student2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].score).assertEqual(95);
      expect(arr[1].sno).assertEqual('2024002');
    });

    /**
     * @tc.name   testArrayOf0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0053
     * @tc.desc   Verify Array.of() creates array with single Book object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const book: Book = { isbn: '9787115548990', title: 'ArkTS Guide', author: 'Dev Team' };
      const arr: Book[] = Array.of(book);
      expect(arr.length).assertEqual(1);
      expect(arr[0].title).assertEqual('ArkTS Guide');
      expect(arr[0].author).assertEqual('Dev Team');
    });

    /**
     * @tc.name   testArrayOf0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0054
     * @tc.desc   Verify Array.of() creates array with multiple Book objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const book1: Book = { isbn: '9787115548990', title: 'ArkTS Guide', author: 'Dev Team' };
      const book2: Book = { isbn: '9787115549003', title: 'JS Advanced', author: 'John Doe' };
      const arr: Book[] = Array.of(book1, book2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].isbn).assertEqual('9787115548990');
      expect(arr[1].title).assertEqual('JS Advanced');
    });

    /**
     * @tc.name   testArrayOf0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0055
     * @tc.desc   Verify Array.of() with object having method (Circle)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class MyCircle implements Circle {
        radius: number;

        constructor(radius: number) {
          this.radius = radius;
        }

        getArea(): number {
          return Math.PI * this.radius * this.radius;
        }
      }

      const circle: Circle = new MyCircle(5);
      const arr: Circle[] = Array.of(circle);
      expect(arr.length).assertEqual(1);
      expect(arr[0].radius).assertEqual(5);
      expect(arr[0].getArea()).assertEqual(Math.PI * 25);
    });

    /**
     * @tc.name   testArrayOf0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0056
     * @tc.desc   Verify Array.of() with multiple Circle objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0056()).assertDeepEquals([2, Math.PI * 4, Math.PI * 9]);
    });

    /**
     * @tc.name   testArrayOf0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0057
     * @tc.desc   Verify Array.of() with single 0 (zero) element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(arr[0] === 0).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0058
     * @tc.desc   Verify Array.of() with multiple zero elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(0, 0, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name   testArrayOf0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0059
     * @tc.desc   Verify Array.of() with negative decimal numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = Array.of(-1.5, -2.3, -3.7);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(-1.5);
      expect(arr[1]).assertEqual(-2.3);
      expect(arr[2]).assertEqual(-3.7);
    });

    /**
     * @tc.name   testArrayOf0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0060
     * @tc.desc   Verify Array.of() with scientific notation numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(1e3, 2e-2, 3.5e4);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(0.02);
      expect(arr[2]).assertEqual(35000);
    });

    /**
     * @tc.name   testArrayOf0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0061
     * @tc.desc   Verify Array.of() with string containing special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = Array.of('!@#$%^', '&*()_+', '{}[]|');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('!@#$%^');
      expect(arr[1]).assertEqual('&*()_+');
      expect(arr[2]).assertEqual('{}[]|');
    });

    /**
     * @tc.name   testArrayOf0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0062
     * @tc.desc   Verify Array.of() with string containing emoji
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = Array.of('😊', '🎉', '🚀');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('😊');
      expect(arr[1]).assertEqual('🎉');
      expect(arr[2]).assertEqual('🚀');
    });

    /**
     * @tc.name   testArrayOf0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0063
     * @tc.desc   Verify Array.of() with string containing multi-byte chars
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = Array.of('你好', '世界', 'ArkTS');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('你好');
      expect(arr[1]).assertEqual('世界');
      expect(arr[2]).assertEqual('ArkTS');
    });

    /**
     * @tc.name   testArrayOf0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0064
     * @tc.desc   Verify Array.of() with empty object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: Record<string, never> = {};
      const arr: Record<string, never>[] = Array.of(emptyObj);
      expect(arr.length).assertEqual(1);
      expect(Object.keys(arr[0]).length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayOf0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0065
     * @tc.desc   Verify Array.of() with multiple empty objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: Record<string, never> = {};
      const obj2: Record<string, never> = {};
      const arr: Record<string, never>[] = Array.of(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(Object.keys(arr[0]).length).assertEqual(0);
      expect(Object.keys(arr[1]).length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayOf0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0066
     * @tc.desc   Verify Array.of() with nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nestedObj: GeneratedObjectLiteralInterface_2 = {
        id: 1,
        info: ({ name: 'Test', age: 20 } as GeneratedObjectLiteralInterface_1)
      };
      const arr = Array.of(nestedObj);
      expect(arr.length).assertEqual(1);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].info.name).assertEqual('Test');
      expect(arr[0].info.age).assertEqual(20);
    });

    /**
     * @tc.name   testArrayOf0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0067
     * @tc.desc   Verify Array.of() with array of nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: GeneratedObjectLiteralInterface_4 =
        { id: 1, info: ({ score: 90 } as GeneratedObjectLiteralInterface_3) };
      const obj2: GeneratedObjectLiteralInterface_4 =
        { id: 2, info: ({ score: 85 } as GeneratedObjectLiteralInterface_3) };
      const arr = Array.of(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].info.score).assertEqual(90);
      expect(arr[1].info.score).assertEqual(85);
    });

    /**
     * @tc.name   testArrayOf0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0068
     * @tc.desc   Verify Array.of() with function returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const add = (a: number, b: number): number => a + b;
      const arr: ((a: number, b: number) => number)[] = Array.of(add);
      expect(arr.length).assertEqual(1);
      expect(arr[0](3, 5)).assertEqual(8);
    });

    /**
     * @tc.name   testArrayOf0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0069
     * @tc.desc   Verify Array.of() with function returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const concat = (s1: string, s2: string): string => s1 + s2;
      const arr: ((s1: string, s2: string) => string)[] = Array.of(concat);
      expect(arr.length).assertEqual(1);
      expect(arr[0]('Hello', ' World')).assertEqual('Hello World');
    });
    /**
     * @tc.name   testArrayOf0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0070
     * @tc.desc   Verify Array.of() with arrow functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1: () => string = () => 'hello';
      const func2: (x: number) => number = (x) => x * x;
      const arr = Array.of<(() => string) | ((x: number) => number)>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect((arr[0] as (() => string))()).assertEqual('hello');
      expect(arr[1](5)).assertEqual(25);
    });

    /**
     * @tc.name   testArrayOf0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0071
     * @tc.desc   Verify Array.of() with BigInt values of different sizes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1: bigint = 1000n;
      const big2: bigint = 999999999999999999n;
      const big3: bigint = -123456789n;
      const arr: bigint[] = Array.of(big1, big2, big3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1000n);
      expect(arr[1]).assertEqual(999999999999999999n);
      expect(arr[2]).assertEqual(-123456789n);
    });

    /**
     * @tc.name   testArrayOf0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0072
     * @tc.desc   Verify Array.of() with Symbol values of same description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0072()).assertDeepEquals([true, true, true, false]);
    });

    /**
     * @tc.name   testArrayOf0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0073
     * @tc.desc   Verify Array.of() with Date objects of different times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1: Date = new Date('2024-01-01 00:00:00');
      const date2: Date = new Date('2024-01-02 12:34:56');
      const arr: Date[] = Array.of(date1, date2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].toISOString()).assertEqual('2023-12-31T16:00:00.000Z');
      expect(arr[1].toISOString()).assertEqual('2024-01-02T04:34:56.000Z');
    });

    /**
     * @tc.name   testArrayOf0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0074
     * @tc.desc   Verify Array.of() with RegExp objects of different patterns
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex1: RegExp = /abc/i;
      const regex2: RegExp = /\d+/g;
      const arr: RegExp[] = Array.of(regex1, regex2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].source).assertEqual('abc');
      expect(arr[0].flags).assertEqual('i');
      expect(arr[1].source).assertEqual('\\d+');
      expect(arr[1].flags).assertEqual('g');
    });

    /**
     * @tc.name   testArrayOf0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0075
     * @tc.desc   Verify Array.of() with mixed primitives (number, string, null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number | string | null>(123, 'test', null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(123);
      expect(arr[1]).assertEqual('test');
      expect(arr[2]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayOf0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0076
     * @tc.desc   Verify Array.of() with mixed primitives and objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const student: Student = { sno: '2024003', score: 92 };
      const arr = Array.of<number | string | Student>(456, 'mixed', student);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(456);
      expect(arr[1]).assertEqual('mixed');
      expect((arr[2] as Student).sno).assertEqual('2024003');
      expect((arr[2] as Student).score).assertEqual(92);
    });

    /**
     * @tc.name   testArrayOf0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0077
     * @tc.desc   Verify Array.of() created array equals literal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arrOf: number[] = Array.of(1, 2, 3);
      const literalArr: number[] = [1, 2, 3];
      expect(arrOf.length).assertEqual(literalArr.length);
      expect(arrOf).assertDeepEquals(literalArr);
    });

    /**
     * @tc.name   testArrayOf0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0078
     * @tc.desc   Verify Array.of() created array with objects equals literal array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const book: Book = { isbn: '9787115549003', title: 'JS Advanced', author: 'John Doe' };
      const arrOf: Book[] = Array.of(book);
      const literalArr: Book[] = [book];
      expect(arrOf.length).assertEqual(literalArr.length);
      expect(arrOf).assertDeepEquals(literalArr);
    });

    /**
     * @tc.name   testArrayOf0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0079
     * @tc.desc   Verify Array.of() with spread operator on Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const entriesArray = Array.from(set.entries());
      const arr = Array.of(...entriesArray);
      expect(arr.length).assertEqual(3);
      expect(arr).assertDeepEquals([[1, 1], [2, 2], [3, 3]]);
    });

    /**
     * @tc.name   testArrayOf0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0080
     * @tc.desc   Verify Array.of() with spread operator on Map entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map: Map<string, number> = new Map([['a', 1], ['b', 2]]);
      const entriesArray = Array.from(map.entries());
      const arr = Array.of(...entriesArray);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual('a');
      expect(arr[0][1]).assertEqual(1);
      expect(arr[1][0]).assertEqual('b');
      expect(arr[1][1]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayOf0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0081
     * @tc.desc   Verify Array.of() with typed array (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typedArr: Int32Array = new Int32Array([10, 20, 30]);
      const arr: Int32Array[] = Array.of(typedArr);
      expect(arr.length).assertEqual(1);
      expect(arr[0] instanceof Int32Array).assertTrue();
      expect(arr[0][0]).assertEqual(10);
      expect(arr[0][1]).assertEqual(20);
    });

    /**
     * @tc.name   testArrayOf0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0082
     * @tc.desc   Verify Array.of() with typed array elements spread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typedArr: Uint16Array = new Uint16Array([5, 6, 7]);
      const arr: number[] = Array.of(...typedArr);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.name   testArrayOf0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0083
     * @tc.desc   Verify Array.of() with Promise objects (rejected)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const promise1: Promise<number> = Promise.reject(new Error('Reject 1'));
      const promise2: Promise<string> = Promise.reject(new Error('Reject 2'));
      const arr = Array.of<Promise<number> | Promise<string>>(promise1, promise2);
      expect(arr.length).assertEqual(2);

      Promise.allSettled(arr).then(results => {
        expect(results[0].status).assertEqual('rejected');
        expect((results[0] as PromiseRejectedResult).reason.message).assertEqual('Reject 1');
        expect(results[1].status).assertEqual('rejected');
        expect((results[1] as PromiseRejectedResult).reason.message).assertEqual('Reject 2');
      });
    });

    /**
     * @tc.name   testArrayOf0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0084
     * @tc.desc   Verify Array.of() with Error and its subclasses (cast to union)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const error1: Error = new Error('Base Error');
      const error2: TypeError = new TypeError('Type Error');
      const error3: RangeError = new RangeError('Range Error');
      const arr = Array.of<Error | TypeError | RangeError>(error1, error2, error3);
      expect(arr.length).assertEqual(3);
      expect(arr[0] instanceof Error).assertTrue();
      expect(arr[1] instanceof TypeError).assertTrue();
      expect(arr[2] instanceof RangeError).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0085
     * @tc.desc   Verify Array.of() with NestedData interface objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data1: GeneratedObjectLiteralInterface_2 = {
        id: 1,
        info: { name: 'Data1', age: 200 } as GeneratedObjectLiteralInterface_1
      };
      const data2: GeneratedObjectLiteralInterface_2 = {
        id: 2,
        info: { name: 'Data2', age: 200 } as GeneratedObjectLiteralInterface_1
      };
      const arr = Array.of(data1, data2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].info.name).assertEqual('Data1');
      expect(arr[1].info.age).assertEqual(200);
    });

    /**
     * @tc.name   testArrayOf0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0086
     * @tc.desc   Verify Array.of() with array of functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1: (x: number) => number = (x) => x + 1;
      const func2: (s: string) => string = (s) => s.repeat(2);
      const func3: () => boolean = () => true;
      const arr = Array.of<((x: number) => number) | ((s: string) => string) | (() => boolean)>(func1, func2, func3);
      expect(arr.length).assertEqual(3);
      expect((arr[0] as ((x: number) => number))(5)).assertEqual(6);
      expect((arr[1] as ((s: string) => string))('ab')).assertEqual('abab');
      expect((arr[2] as (() => boolean))()).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0087
     * @tc.desc   Verify Array.of() with Product interface objects (mixed properties)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const product1: GeneratedObjectLiteralInterface_5 = {
        id: 1,
        name: 'Laptop',
        price: 5999.99,
        inStock: true
      };
      const product2: GeneratedObjectLiteralInterface_5 = {
        id: 2,
        name: 'Mouse',
        price: 99.9,
        inStock: false
      };
      const arr = Array.of(product1, product2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('Laptop');
      expect(arr[0].price).assertEqual(5999.99);
      expect(arr[1].inStock).assertFalse();
    });

    /**
     * @tc.name   testArrayOf0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0088
     * @tc.desc   Verify Array.of() with single boolean element (true) and type check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(true);
      expect(arr.length).assertEqual(1);
      expect(typeof arr[0]).assertEqual('boolean');
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.name   testArrayOf0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0089
     * @tc.desc   Verify Array.of() with single boolean element (false) and type check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(false);
      expect(arr.length).assertEqual(1);
      expect(typeof arr[0]).assertEqual('boolean');
      expect(arr[0]).assertFalse();
    });

    /**
     * @tc.name   testArrayOf0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0090
     * @tc.desc   Verify Array.of() with multiple boolean elements and deep equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayOf0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = Array.of(true, false, true, false);
      const expected: boolean[] = [true, false, true, false];
      expect(arr.length).assertEqual(4);
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.name   testArrayOf0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0091
     * @tc.desc   Verify Array.of() with string elements of different lengths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = Array.of('', 'a', 'ab', 'abc');
      expect(arr.length).assertEqual(4);
      expect(arr[0].length).assertEqual(0);
      expect(arr[1].length).assertEqual(1);
      expect(arr[2].length).assertEqual(2);
      expect(arr[3].length).assertEqual(3);
    });

    /**
     * @tc.name   testArrayOf0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0092
     * @tc.desc   Verify Array.of() with number elements (max safe integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInt: number = Number.MAX_SAFE_INTEGER;
      const arr: number[] = Array.of(maxSafeInt, maxSafeInt - 1);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(9007199254740991);
      expect(arr[1]).assertEqual(9007199254740990);
    });

    /**
     * @tc.name   testArrayOf0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0093
     * @tc.desc   Verify Array.of() with number elements (min safe integer)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInt: number = Number.MIN_SAFE_INTEGER;
      const arr: number[] = Array.of(minSafeInt, minSafeInt + 1);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(-9007199254740991);
      expect(arr[1]).assertEqual(-9007199254740990);
    });

    /**
     * @tc.name   testArrayOf0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0094
     * @tc.desc   Verify Array.of() with non-safe integer number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nonSafeInt: number = 9007199254740992;
      const arr: number[] = Array.of(nonSafeInt);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(nonSafeInt);
      expect(Number.isSafeInteger(arr[0])).assertFalse();
    });

    /**
     * @tc.name   testArrayOf0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0095
     * @tc.desc   Verify Array.of() with null and undefined in same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (null | undefined)[] = Array.of(null, undefined, null);
      const expected: (null | undefined)[] = [null, undefined, null];
      expect(arr.length).assertEqual(3);
      expect(arr).assertDeepEquals(expected);
    });

    /**
     * @tc.name   testArrayOf0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0096
     * @tc.desc   Verify Array.of() with NaN and non-NaN numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(NaN, 123, NaN, 456);
      expect(arr.length).assertEqual(4);
      expect(isNaN(arr[0])).assertTrue();
      expect(arr[1]).assertEqual(123);
      expect(isNaN(arr[2])).assertTrue();
      expect(arr[3]).assertEqual(456);
    });

    /**
     * @tc.name   testArrayOf0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0097
     * @tc.desc   Verify Array.of() with Infinity and finite numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = Array.of(Infinity, 100, -Infinity, 200);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(-Infinity);
      expect(arr[3]).assertEqual(200);
    });

    /**
     * @tc.name   testArrayOf0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0098
     * @tc.desc   Verify Array.of() with Symbol and string (different types)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(testArrayOfJs0098()).assertDeepEquals([2, 'symbol', 'string', true, true]);
    });

    /**
     * @tc.name   testArrayOf0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0099
     * @tc.desc   Verify Array.of() with BigInt and number (different types)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: bigint = 100n;
      const arr = Array.of<bigint | number>(big, 200);
      expect(arr.length).assertEqual(2);
      expect(typeof arr[0]).assertEqual('bigint');
      expect(typeof arr[1]).assertEqual('number');
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.name   testArrayOf0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0100
     * @tc.desc   Verify Array.of() with empty array and non-empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr: never[] = [];
      const nonEmptyArr: number[] = [1, 2, 3];
      const arr: (never[] | number[])[] = Array.of(emptyArr, nonEmptyArr);
      expect(arr.length).assertEqual(2);
      expect(arr[0].length).assertEqual(0);
      expect(arr[1]).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testArrayOf0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0101
     * @tc.desc   Verify Array.of() with nested arrays of different depths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const depth1: number[] = [1];
      const depth2: number[][] = [[2]];
      const depth3: number[][][] = [[[3]]];
      const arr = Array.of<(number[] | number[][] | number[][][])>(depth1, depth2, depth3);
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect((arr[1] as number[][])[0][0]).assertEqual(2);
      expect((arr[2] as number[][][])[0][0][0]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayOf0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0102
     * @tc.desc   Verify Array.of() with function and its return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const getValue: () => number = () => 123;
      const arr = Array.of<(() => number) | number>(getValue, getValue());
      expect(arr.length).assertEqual(2);
      expect(typeof arr[0]).assertEqual('function');
      expect(typeof arr[1]).assertEqual('number');
      expect((arr[0] as (() => number))()).assertEqual(123);
      expect(arr[1]).assertEqual(123);
    });

    /**
     * @tc.name   testArrayOf0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0103
     * @tc.desc   Verify Array.of() with Date object and its timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const date: Date = new Date('2024-05-01');
      const timestamp: number = date.getTime();
      const arr = Array.of<Date | number>(date, timestamp);
      expect(arr.length).assertEqual(2);
      expect(arr[0] instanceof Date).assertTrue();
      expect(arr[1]).assertEqual(timestamp);
      expect((arr[0] as Date).getTime()).assertEqual(arr[1]);
    });

    /**
     * @tc.name   testArrayOf0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0104
     * @tc.desc   Verify Array.of() with RegExp object and its test result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayOf0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const regex: RegExp = /\d/;
      const testResult: boolean = regex.test('123');
      const arr = Array.of<RegExp | boolean>(regex, testResult);
      expect(arr.length).assertEqual(2);
      expect(arr[0] instanceof RegExp).assertTrue();
      expect(arr[1]).assertTrue();
      expect((arr[0] as RegExp).test('123')).assertEqual(arr[1]);
    });

    /**
     * @tc.name   testArrayOf0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Of_0105
     * @tc.desc   Verify Array.of() with Student object and its property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayOf0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const student: Student = { sno: '2024004', score: 89 };
      const arr = Array.of<Student | string | number>(student, student.sno, student.score);
      expect(arr.length).assertEqual(3);
      expect((arr[0] as Student).sno).assertEqual('2024004');
    });
  });
}