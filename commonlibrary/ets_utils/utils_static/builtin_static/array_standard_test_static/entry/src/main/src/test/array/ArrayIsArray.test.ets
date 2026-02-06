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

class CustomArray extends Array<number> {
  customProperty: string = "custom";
}

class CustomArray025 extends Array<number> {
  constructor(num: number, ...d: number[]) {
        super(num, ...d)
  }
  customProperty: string = "custom";
}

class ArrayLikeClass {
  length: number;

  constructor(length: number) {
    this.length = length;
  }
}

interface EmptyObjectInterface {}

// class ExtendedArray<number> extends Array<number> {
//   constructor(items: number[]) {
//     super(...items);
//   }
//
//   getFirst(): number | undefined {
//     return this[0];
//   }
// }

interface GeneratedTypeLiteralInterface_1 {
  type: string;
  size: number;
}

interface GeneratedTypeLiteralInterface_2 {
  width: number;
  height: number;
  data: Uint8ClampedArray;
}

class TestClass091 {
    id: number;

    constructor(id: number) {
        this.id = id;
    }
}

interface MockElement043 {
    tagName: string;
}

interface MockNodeList044 {
    length: number;
    item: (index: number) => null;
}

export default function ArrayIsArrayTest() {
  describe('ArrayIsArrayTest', () => {
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
     * @tc.name   testIsArray0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0001
     * @tc.desc   Verify Array.isArray() returns true for empty array literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: never[] = [];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0002
     * @tc.desc   Verify Array.isArray() returns true for non-empty array literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0003
     * @tc.desc   Verify Array.isArray() returns true for array created with new Array()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = new Array<string>();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0004
     * @tc.desc   Verify Array.isArray() returns true for array created with new Array(length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: boolean[] = new Array<boolean>(5);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0005
     * @tc.desc   Verify Array.isArray() returns true for array created with new Array(elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: string[] = new Array<string>('a', 'b', 'c');
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0006
     * @tc.desc   Verify Array.isArray() returns false for empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: Record<string, never> = {};
      expect(Array.isArray(obj)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0008
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0008
     * @tc.desc   Verify Array.isArray() returns false for null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: null = null;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0009
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0009
     * @tc.desc   Verify Array.isArray() returns false for undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: undefined = undefined;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0010
     * @tc.desc   Verify Array.isArray() returns false for string primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str: string = 'hello';
      expect(Array.isArray(str)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0011
     * @tc.desc   Verify Array.isArray() returns false for String object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj: String = new String('hello');
      expect(Array.isArray(strObj)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0012
     * @tc.desc   Verify Array.isArray() returns false for number primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const num: number = 123;
      expect(Array.isArray(num)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0013
     * @tc.desc   Verify Array.isArray() returns false for Number object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj: Number = new Number(123);
      expect(Array.isArray(numObj)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0014
     * @tc.desc   Verify Array.isArray() returns false for boolean primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const bool: boolean = true;
      expect(Array.isArray(bool)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0015
     * @tc.desc   Verify Array.isArray() returns false for Boolean object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const boolObj: Boolean = new Boolean(true);
      expect(Array.isArray(boolObj)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0016
     * @tc.desc   Verify Array.isArray() returns false for function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func: () => void = () => {
      };
      expect(Array.isArray(func)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0017
     * @tc.desc   Verify Array.isArray() returns false for Date object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date: Date = new Date();
      expect(Array.isArray(date)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0018
     * @tc.desc   Verify Array.isArray() returns false for RegExp object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex: RegExp = new RegExp('pattern');
      expect(Array.isArray(regex)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0019
     * @tc.desc   Verify Array.isArray() returns false for Set object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>();
      expect(Array.isArray(set)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0020
     * @tc.desc   Verify Array.isArray() returns false for Map object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map<string, number>();
      expect(Array.isArray(map)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0021
     * @tc.desc   Verify Array.isArray() returns false for Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const uint8: Uint8Array = new Uint8Array();
      expect(Array.isArray(uint8)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0022
     * @tc.desc   Verify Array.isArray() returns false for Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const int16: Int16Array = new Int16Array([1, 2, 3]);
      expect(Array.isArray(int16)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0023
     * @tc.desc   Verify Array.isArray() returns false for Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const float32: Float32Array = new Float32Array([1.5, 2.5]);
      expect(Array.isArray(float32)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0024
     * @tc.desc   Verify Array.isArray() returns true for Array subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const customArr: CustomArray = new CustomArray();
      expect(Array.isArray(customArr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0025
     * @tc.desc   Verify Array.isArray() returns true for Array subclass with elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const customArr: CustomArray025 = new CustomArray025(1, 2, 3);
      expect(Array.isArray(customArr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0026
     * @tc.desc   Verify Array.isArray() returns false for array-like class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arrayLike: ArrayLikeClass = new ArrayLikeClass(5);
      expect(Array.isArray(arrayLike)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0027
     * @tc.desc   Verify Array.isArray() returns true for nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr = [1, [2, [3]]];
      expect(Array.isArray(nestedArr)).assertTrue();
      expect(Array.isArray(nestedArr[1])).assertTrue();
      expect(Array.isArray((nestedArr[1] as Array<int|Array<int>>)[1])).assertTrue();
    });

    /**
     * @tc.name   testIsArray0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0028
     * @tc.desc   Verify Array.isArray() returns false for NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: number = NaN;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0029
     * @tc.desc   Verify Array.isArray() returns false for Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const value: number = Infinity;
      expect(Array.isArray(value)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0030
     * @tc.desc   Verify Array.isArray() returns true for array with mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let val: EmptyObjectInterface = {};
      const mixedArr: Array<number | string | boolean | null | EmptyObjectInterface> = [1, 'a', true, null, val];
      expect(Array.isArray(mixedArr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0034
     * @tc.desc   Verify Array.isArray() returns false for WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const weakMap: WeakMap<object, number> = new WeakMap<object, number>();
      expect(Array.isArray(weakMap)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0035
     * @tc.desc   Verify Array.isArray() returns false for WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const weakSet: WeakSet<object> = new WeakSet<object>();
      expect(Array.isArray(weakSet)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0036
     * @tc.desc   Verify Array.isArray() returns true for array with 0 length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [];
      arr.length = 0;
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0037
     * @tc.desc   Verify Array.isArray() returns true for array with large length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array<number>(10000);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0038
     * @tc.desc   Verify Array.isArray() returns false for Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: Error = new Error('test');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0040
     * @tc.desc   Verify Array.isArray() returns false for Math object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const math = new Math();
      expect(Array.isArray(math)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0041
     * @tc.desc   Verify Array.isArray() returns true for array created with Array.of()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = Array.of(1, 2, 3);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0042
     * @tc.desc   Verify Array.isArray() returns true for array created with Array.from()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: int[] = Array.from([1, 2, 3]);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0043
     * @tc.desc   Verify Array.isArray() returns false for DOM element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockElement: MockElement043 = { tagName: 'DIV' };
      expect(Array.isArray(mockElement)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0044
     * @tc.desc   Verify Array.isArray() returns false for NodeList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockNodeList: MockNodeList044 = { length: 0, item: (index: number) => null };
      expect(Array.isArray(mockNodeList)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0047
     * @tc.desc   Verify Array.isArray() returns false for array buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      expect(Array.isArray(buffer)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0048
     * @tc.desc   Verify Array.isArray() returns false for data view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0049
     * @tc.desc   Verify Array.isArray() returns true for empty array from Array.from()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: Array<int> = [];
      const arr = Array.from(arr1);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0050
     * @tc.desc   Verify Array.isArray() returns true for array with holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = new Array<number>(3);
      arr[0] = 1;
      arr[2] = 3;
      arr.length = 3;
      expect(Array.isArray(arr)).assertTrue();
    });
    /**
     * @tc.name   testIsArray0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0051
     * @tc.desc   Verify Array.isArray() returns true for array with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [-1, -2, -3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0052
     * @tc.desc   Verify Array.isArray() returns false for BigInt primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const bigInt: bigint = 123n;
      expect(Array.isArray(bigInt)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0053
     * @tc.desc   Verify Array.isArray() returns true for array containing BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: bigint[] = [1n, 2n, 3n];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0054
     * @tc.desc   Verify Array.isArray() returns false for Blob object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockBlob: GeneratedTypeLiteralInterface_1 = { type: 'text/plain', size: 1024 };
      expect(Array.isArray(mockBlob)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0055
     * @tc.desc   Verify Array.isArray() returns true for array with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Array<() => void> = [() => {
      }, () => {
      }];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0056
     * @tc.desc   Verify Array.isArray() returns false for array buffer view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const view: Uint32Array = new Uint32Array(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0057
     * @tc.desc   Verify Array.isArray() returns true for array with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Date[] = [new Date(), new Date(2023, 0, 1)];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0058
     * @tc.desc   Verify Array.isArray() returns false for ImageData object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mockImageData: GeneratedTypeLiteralInterface_2 = {
        width: 100,
        height: 100,
        data: new Uint8ClampedArray(40000)
      };
      expect(Array.isArray(mockImageData)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0059
     * @tc.desc   Verify Array.isArray() returns true for array with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | null)[] = [1, null, 3];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0060
     * @tc.desc   Verify Array.isArray() returns false for RangeError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: RangeError = new RangeError('Out of range');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0061
     * @tc.desc   Verify Array.isArray() returns true for array with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (string | undefined)[] = ['a', undefined, 'c'];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0062
     * @tc.desc   Verify Array.isArray() returns false for ReferenceError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: ReferenceError = new ReferenceError('Not defined');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0063
     * @tc.desc   Verify Array.isArray() returns true for array with mixed object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (Date | RegExp | Map<string, number>)[] = [new Date(), new RegExp('pattern'), new Map<string, number>()];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0064
     * @tc.desc   Verify Array.isArray() returns false for SyntaxError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: SyntaxError = new SyntaxError('Invalid syntax');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0065
     * @tc.desc   Verify Array.isArray() returns true for array with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1e20, 1e30, 1e40];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0066
     * @tc.desc   Verify Array.isArray() returns false for TypeError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: TypeError = new TypeError('Invalid type');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0067
     * @tc.desc   Verify Array.isArray() returns true for array with very small numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[] = [1e-20, 1e-30, 1e-40];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0068
     * @tc.desc   Verify Array.isArray() returns false for URIError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error: URIError = new URIError('Invalid URI');
      expect(Array.isArray(error)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0069
     * @tc.desc   Verify Array.isArray() returns true for array with regex elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: RegExp[] = [new RegExp('a'), new RegExp('b'), new RegExp('c')];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0070
     * @tc.desc   Verify Array.isArray() returns false for Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise: Promise<number> = new Promise<number>(resolve => resolve(1));
      expect(Array.isArray(promise)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0071
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0071
     * @tc.desc   Verify Array.isArray() returns true for array with Set elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Set<number>[] = [new Set<number>([1, 2]), new Set<number>([3, 4])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0073
     * @tc.desc   Verify Array.isArray() returns true for array with Map elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Map<string, number>[] = [new Map<string, number>([['a', 1]]), new Map<string, number>([['b', 2]])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0075
     * @tc.desc   Verify Array.isArray() returns true for empty typed array converted to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr: Uint8Array = new Uint8Array();
      const arr: number[] = Array.from(typedArr);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0077
     * @tc.desc   Verify Array.isArray() returns true for array created by spreading another array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: string[] = ['a', 'b', 'c'];
      const arr: string[] = [...original];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0078
     * @tc.desc   Verify Array.isArray() returns false for WeakRef object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target: EmptyObjectInterface = {};
      const weakRef: WeakRef<EmptyObjectInterface> = new WeakRef<EmptyObjectInterface>(target);
      expect(Array.isArray(weakRef)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0079
     * @tc.desc   Verify Array.isArray() returns true for array returned by filter method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: number[] = [1, 2, 3, 4, 5];
      const filtered: number[] = original.filter(x => x % 2 === 0);
      expect(Array.isArray(filtered)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0081
     * @tc.desc   Verify Array.isArray() returns true for array returned by map method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: int[] = [1, 2, 3];
      const mapped: int[] = original.map(x => x * 2);
      expect(Array.isArray(mapped)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0083
     * @tc.desc   Verify Array.isArray() returns true for array returned by slice method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: string[] = ['a', 'b', 'c', 'd'];
      const sliced: string[] = original.slice(1, 3);
      expect(Array.isArray(sliced)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0085
     * @tc.desc   Verify Array.isArray() returns true for array returned by concat method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const concatenated: number[] = arr1.concat(arr2);
      expect(Array.isArray(concatenated)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0087
     * @tc.desc   Verify Array.isArray() returns true for array with array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][] = [[1], [2, 3], [4, 5, 6]];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0089
     * @tc.desc   Verify Array.isArray() returns true for array with typed array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: Uint8Array[] = [new Uint8Array([1, 2]), new Uint8Array([3, 4])];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0091
     * @tc.desc   Verify Array.isArray() returns true for array with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: TestClass091[] = [new TestClass091(1), new TestClass091(2)];
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0092
     * @tc.desc   Verify Array.isArray() returns false for DataView object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const view: DataView = new DataView(buffer);
      expect(Array.isArray(view)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0093
     * @tc.desc   Verify Array.isArray() returns true for array with extended array instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('testIsArray0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const extArr1: ExtendedArray<number> = new ExtendedArray<number>([1, 2, 3]);
    //   const extArr2: ExtendedArray<number> = new ExtendedArray<number>([4, 5, 6]);
    //   const arr: ExtendedArray<number>[] = [extArr1, extArr2];
    //   expect(Array.isArray(arr)).assertTrue();
    // });

    /**
     * @tc.name   testIsArray0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0094
     * @tc.desc   Verify Array.isArray() returns false for Intl objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const intl: Intl.DateTimeFormat = new Intl.DateTimeFormat();
      expect(Array.isArray(intl)).assertFalse();
    });

    /**
     * @tc.name   testIsArray0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0095
     * @tc.desc   Verify Array.isArray() returns true for array with sparse elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: (number | undefined)[] = new Array<number | undefined>(10);
      arr[0] = 1;
      arr[5] = 6;
      arr.length = 10;
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   testIsArray0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0097
     * @tc.desc   Verify Array.isArray() returns true for array with deeply nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr: number[][][][] = [[[[1]]]];
      expect(Array.isArray(arr)).assertTrue();
      expect(Array.isArray(arr[0])).assertTrue();
      expect(Array.isArray(arr[0][0])).assertTrue();
      expect(Array.isArray(arr[0][0][0])).assertTrue();
    });

    /**
     * @tc.name   testIsArray0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_IsArray_0099
     * @tc.desc   Verify Array.isArray() returns true for array created with Array.from on Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set<string>(['a', 'b', 'c']);
      const arr: string[] = Array.from(set);
      expect(Array.isArray(arr)).assertTrue();
    });
  });
}