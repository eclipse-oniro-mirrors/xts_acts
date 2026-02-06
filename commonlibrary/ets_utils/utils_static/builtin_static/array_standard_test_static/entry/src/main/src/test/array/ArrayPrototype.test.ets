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
import Utils from '../Util.test';
import { BusinessError } from '@ohos.base';

interface GeneratedObjectLiteralInterface_1 {}

interface GeneratedObjectLiteralInterface_2 {}


interface GeneratedTypeLiteralInterface_1 {
  valueOf: () => number;
}

type MixedType7 = number | string | boolean;

interface ele40 {
  tagName: string;
  id: string
}

type NullOrUndefined50 = null | undefined;

type NumericTypes56 = number | bigint;

class MyClass68 {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

type NumOrStr87 = number | string;

type Primitive88 = number | string | boolean | null | undefined;

interface test0090 {
  value: number
}

export default function ArrayPrototypeTest() {
  describe('ArrayPrototypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0001
     * @tc.name testArrayConstructor0001
     * @tc.desc Verify Array constructor creates empty array with single positive integer length (1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1).fill(0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0002
     * @tc.name testArrayConstructor0002
     * @tc.desc Verify Array constructor creates empty array with single positive integer length (100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>(100).fill("0");
      expect(arr.length).assertEqual(100);
      expect(arr[99]).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0003
     * @tc.name testArrayConstructor0003
     * @tc.desc Verify Array constructor creates array with elements when multiple number arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0004
     * @tc.name testArrayConstructor0004
     * @tc.desc Verify Array constructor creates array with string elements when multiple string arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0005
     * @tc.name testArrayConstructor0005
     * @tc.desc Verify Array constructor creates array with boolean elements when multiple boolean arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0006
     * @tc.name testArrayConstructor0006
     * @tc.desc Verify Array constructor creates array with object elements when multiple object arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    // it('testArrayConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   let Constructor0006 = Prototype0006();
    //   expect(Constructor0006.arr.length).assertEqual(2);
    //   expect(Constructor0006.arr[0]).assertEqual(Constructor0006.obj1);
    //   expect(Constructor0006.arr[1]).assertEqual(Constructor0006.obj2);
    //   expect(Constructor0006.arr[0].id).assertEqual(1);
    //   expect(Constructor0006.arr[1].id).assertEqual(2);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0007
     * @tc.name testArrayConstructor0007
     * @tc.desc Verify Array constructor creates array with mixed type elements when multiple mixed arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<MixedType7>(1, 'a', true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0008
     * @tc.name testArrayConstructor0008
     * @tc.desc Verify Array constructor creates empty array when called with 0 as length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0009
     * @tc.name testArrayConstructor0009
     * @tc.desc Verify Array constructor throws RangeError when called with negative integer length (-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Array<number>(-1);
      } catch (e) {
        expect(e.message).assertEqual("size = -1");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0010
     * @tc.name testArrayConstructor0010
     * @tc.desc Verify Array constructor throws RangeError when called with negative float length (-2.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Array<number>(-2.5);
      } catch (e) {
        expect((e as BusinessError).message).assertEqual("Invalid array length");
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0012
     * @tc.name testArrayConstructor0012
     * @tc.desc Verify Array constructor creates array with single float element when float argument is passed (0.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      try {
        new Array<number>(3.14);
      } catch (e) {
        expect((e as BusinessError).message).assertEqual("Invalid array length");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0013
     * @tc.name testArrayConstructor0013
     * @tc.desc Verify Array constructor creates array with multiple float elements when multiple float arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1.1, 2.2, 3.3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1.1);
      expect(arr[1]).assertEqual(2.2);
      expect(arr[2]).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0017
     * @tc.name testArrayConstructor0017
     * @tc.desc Verify Array constructor creates empty array when called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0018
     * @tc.name testArrayConstructor0018
     * @tc.desc Verify Array constructor creates array with single null element when null is passed as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<null>(null);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0019
     * @tc.name testArrayConstructor0019
     * @tc.desc Verify Array constructor creates array with single undefined element when undefined is passed as argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<undefined>(undefined);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0020
     * @tc.name testArrayConstructor0020
     * @tc.desc Verify Array constructor creates array with function elements when function arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0020 = Prototype0020();
    //   expect(Constructor0020.arr.length).assertEqual(2);
    //   expect(Constructor0020.arr[0]).assertEqual(Constructor0020.func1);
    //   expect(Constructor0020.arr[1]).assertEqual(Constructor0020.func2);
    //   expect(Constructor0020.arr[0]()).assertEqual(1);
    //   expect(Constructor0020.arr[1](2, 3)).assertEqual(5);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0021
     * @tc.name testArrayConstructor0021
     * @tc.desc Verify Array constructor creates array with array elements when array arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const subArr1 = new Array<number>(1, 2);
      const subArr2 = new Array<string>('a', 'b');
      const arr = new Array<Array<number> | Array<string>>(subArr1, subArr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(subArr1);
      expect(arr[1]).assertEqual(subArr2);
      expect(arr[0].length).assertEqual(2);
      expect(arr[1].length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0022
     * @tc.name testArrayConstructor0022
     * @tc.desc Verify Array constructor creates array with Date elements when Date arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-02');
      const arr = new Array<Date>(date1, date2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(date1);
      expect(arr[1]).assertEqual(date2);
      expect(arr[0].toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
      expect(arr[1].toISOString()).assertEqual('2024-01-02T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0023
     * @tc.name testArrayConstructor0023
     * @tc.desc Verify Array constructor creates array with RegExp elements when RegExp arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const reg1 = new RegExp('abc');
      const reg2 = new RegExp('\\d+', 'g');
      const arr = new Array<RegExp>(reg1, reg2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(reg1);
      expect(arr[1]).assertEqual(reg2);
      expect(arr[0].test('abc')).assertTrue();
      expect(arr[1].test('123')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0024
     * @tc.name testArrayConstructor0024
     * @tc.desc Verify Array constructor creates array with Symbol elements when Symbol arguments are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0024 = Prototype0024();
    //   expect(Constructor0024.arr1).assertEqual(2);
    //   expect(Constructor0024.arr2).assertEqual(true);
    //   expect(Constructor0024.arr3).assertEqual(true);
    //   expect(Constructor0024.arr4).assertEqual(true);
    //   expect(Constructor0024.arr5 === null).assertFalse();
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0025
     * @tc.name testArrayConstructor0025
     * @tc.desc Verify Array constructor creates array with multiple Symbol elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0025 = Prototype0025();
    //
    //   expect(Constructor0025.arr1).assertEqual(2);
    //   expect(Constructor0025.arr2).assertEqual(true);
    //   expect(Constructor0025.arr3).assertEqual(true);
    //   expect(Constructor0025.arr5).assertEqual('test1');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0026
     * @tc.name testArrayConstructor0026
     * @tc.desc Verify Array constructor creates array with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1 = BigInt('12345678901234567890');
      const big2 = BigInt('98765432109876543210');
      const arr = new Array<bigint>(big1, big2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(big1);
      expect(arr[1]).assertEqual(big2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0027
     * @tc.name testArrayConstructor0027
     * @tc.desc Verify Array constructor creates array with single BigInt element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = BigInt(42);
      const arr = new Array<bigint>(big);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(big);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0028
     * @tc.name testArrayConstructor0028
     * @tc.desc Verify Array constructor creates array with typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const typed1 = new Uint8Array([1, 2, 3]);
      const typed2 = new Float32Array([4.5, 5.6]);
      const arr = new Array<Uint8Array | Float32Array>(typed1, typed2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(typed1);
      expect(arr[1]).assertEqual(typed2);
      expect(arr[0].byteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0029
     * @tc.name testArrayConstructor0029
     * @tc.desc Verify Array constructor creates array with Map elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0029 = Prototype0029();
    //   expect(Constructor0029.arr1).assertEqual(2);
    //   expect(Constructor0029.arr2).assertEqual(1);
    //   expect(Constructor0029.arr3).assertEqual('b');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0030
     * @tc.name testArrayConstructor0030
     * @tc.desc Verify Array constructor creates array with Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0030 = Prototype0030();
    //   expect(Constructor0030.arr1).assertEqual(2);
    //   expect(Constructor0030.arr2).assertTrue();
    //   expect(Constructor0030.arr3).assertFalse();
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0031
     * @tc.name testArrayConstructor0031
     * @tc.desc Verify Array constructor creates array with WeakMap elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('testArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   const obj1: GeneratedObjectLiteralInterface_1 = {};
    //   const obj2: GeneratedObjectLiteralInterface_2 = {};
    //   const wm1 = new WeakMap<object, string>();
    //   wm1.set(obj1, 'value1');
    //   const wm2 = new WeakMap<object, number>();
    //   wm2.set(obj2, 123);
    //   const arr = new Array<WeakMap<object, string | number>>(wm1, wm2);
    //   expect(arr.length).assertEqual(2);
    //   expect(arr[0].get(obj1)).assertEqual('value1');
    //   expect(arr[1].get(obj2)).assertEqual(123);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0032
     * @tc.name testArrayConstructor0032
     * @tc.desc Verify Array constructor creates array with WeakSet elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = {};
      const obj2: GeneratedObjectLiteralInterface_2 = {};
      const ws1 = new WeakSet<object>([obj1]);
      const ws2 = new WeakSet<object>([obj2]);
      const arr = new Array<WeakSet<object>>(ws1, ws2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].has(obj1)).assertTrue();
      expect(arr[1].has(obj1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0033
     * @tc.name testArrayConstructor0033
     * @tc.desc Verify Array constructor creates array with Promise elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const promise1 = Promise.resolve(42.0);
      const promise2 = Promise.reject(new Error('test'));
      const arr = new Array<Promise<number | Error>>(promise1, promise2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(promise1);
      expect(arr[1]).assertEqual(promise2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0034
     * @tc.name testArrayConstructor0034
     * @tc.desc Verify Array constructor creates array with single large integer length (2^32 - 1)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0034', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, (): void => {
      const le = 4294967295;
      const arr = new Array<number>(le);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0036
     * @tc.name testArrayConstructor0036
     * @tc.desc Verify Array constructor creates array with Boolean object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const boolObj1 = new Boolean(true);
      const boolObj2 = new Boolean(false);
      const arr = new Array<Boolean>(boolObj1, boolObj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(boolObj1);
      expect(arr[1].valueOf()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0037
     * @tc.name testArrayConstructor0037
     * @tc.desc Verify Array constructor creates array with Number object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const numObj1 = new Number(123);
      const numObj2 = new Number(45.67);
      const arr = new Array<Number>(numObj1, numObj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].valueOf()).assertEqual(123);
      expect(arr[1].valueOf()).assertEqual(45.67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0038
     * @tc.name testArrayConstructor0038
     * @tc.desc Verify Array constructor creates array with String object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const strObj1 = new String('hello');
      const strObj2 = new String('world');
      const arr = new Array<String>(strObj1, strObj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].valueOf()).assertEqual('hello');
      expect(arr[1].length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0039
     * @tc.name testArrayConstructor0039
     * @tc.desc Verify Array constructor creates array with Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const err1 = new Error('Error 1');
      const err2 = new TypeError('Type Error');
      const arr = new Array<Error>(err1, err2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].message).assertEqual('Error 1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0040
     * @tc.name testArrayConstructor0040
     * @tc.desc Verify Array constructor creates array with DOM element-like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const elem1: ele40 = { tagName: 'DIV', id: 'div1' };
      const elem2: ele40 = { tagName: 'SPAN', id: 'span1' };
      const arr = new Array<ele40>(elem1, elem2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].tagName).assertEqual('DIV');
      expect(arr[1].id).assertEqual('span1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0041
     * @tc.name testArrayConstructor0041
     * @tc.desc Verify Array constructor creates empty array with length as string that converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0041 = Prototype0041();
    //   expect(Constructor0041.arr1).assertEqual(1);
    //   expect(Constructor0041.arr2).assertEqual('0');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0042
     * @tc.name testArrayConstructor0042
     * @tc.desc Verify Array constructor treats single string argument as element not length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('test');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0043
     * @tc.name testArrayConstructor0043
     * @tc.desc Verify Array constructor treats single string number as element not length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('123');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0044
     * @tc.name testArrayConstructor0044
     * @tc.desc Verify Array constructor creates array with single element when passed object with valueOf 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const obj: GeneratedTypeLiteralInterface_1 = {
        valueOf: (): number => 5
      };
      const arr = new Array<GeneratedTypeLiteralInterface_1>(obj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0045
     * @tc.name testArrayConstructor0045
     * @tc.desc Verify Array constructor uses length when passed object with [Symbol.toPrimitive] returning number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0045 = Prototype0045();
    //   expect(Constructor0045.arr1).assertEqual(1);
    //   expect(Constructor0045.arr2).assertEqual(true);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0046
     * @tc.name testArrayConstructor0046
     * @tc.desc Verify Array constructor creates array with single element when passed array-like object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0046 = Prototype0046();
    //   expect(Constructor0046.arr1).assertEqual(1);
    //   expect(Constructor0046.arr[0]).assertEqual(Constructor0046.arrayLike);
    //   expect(Constructor0046.arr2).assertEqual('b');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0047
     * @tc.name testArrayConstructor0047
     * @tc.desc Verify Array constructor creates array with single element when passed null (non-primitive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<null>(null);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0048
     * @tc.name testArrayConstructor0048
     * @tc.desc Verify Array constructor creates array with multiple null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<null>(null, null, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[2]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0049
     * @tc.name testArrayConstructor0049
     * @tc.desc Verify Array constructor creates array with multiple undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<undefined>(undefined, undefined);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0050
     * @tc.name testArrayConstructor0050
     * @tc.desc Verify Array constructor creates array with mixed null and undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<NullOrUndefined50>(null, undefined, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[1]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0051
     * @tc.name testArrayConstructor0051
     * @tc.desc Verify Array constructor creates array with empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', '', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0052
     * @tc.name testArrayConstructor0052
     * @tc.desc Verify Array constructor creates array with whitespace string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(' ', '\t', '\n');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(' ');
      expect(arr[1]).assertEqual('\t');
      expect(arr[2]).assertEqual('\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0053
     * @tc.name testArrayConstructor0053
     * @tc.desc Verify Array constructor creates array with very large number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const largeNum1 = Number.MAX_SAFE_INTEGER;
      const largeNum2 = Number.MAX_SAFE_INTEGER + 1;
      const arr = new Array<number>(largeNum1, largeNum2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(largeNum1);
      expect(arr[1]).assertEqual(largeNum2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0054
     * @tc.name testArrayConstructor0054
     * @tc.desc Verify Array constructor creates array with very small number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smallNum1 = Number.MIN_SAFE_INTEGER;
      const smallNum2 = Number.MIN_VALUE;
      const arr = new Array<number>(smallNum1, smallNum2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(smallNum1);
      expect(arr[1]).assertEqual(smallNum2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0055
     * @tc.name testArrayConstructor0055
     * @tc.desc Verify Array constructor creates array with multiple NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, NaN);
      expect(arr.length).assertEqual(2);
      expect(isNaN(arr[0])).assertTrue();
      expect(isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0056
     * @tc.name testArrayConstructor0056
     * @tc.desc Verify Array constructor creates array with elements of different numeric types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<NumericTypes56>(123, 45.67, BigInt(890));
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(123);
      expect(arr[1]).assertEqual(45.67);
      expect(arr[2]).assertEqual(BigInt(890));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0057
     * @tc.name testArrayConstructor0057
     * @tc.desc Verify Array constructor creates array with empty objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = {};
      const obj2: GeneratedObjectLiteralInterface_2 = {};
      const arr = new Array<object>(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(obj1);
      expect(arr[1]).assertEqual(obj2);
      expect(arr[0] === arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0058
     * @tc.name testArrayConstructor0058
     * @tc.desc Verify Array constructor creates array with nested objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0058 = Prototype0058();
    //   expect(Constructor0058.arr1).assertEqual(1);
    //   expect(Constructor0058.arr2).assertEqual(1);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0059
     * @tc.name testArrayConstructor0059
     * @tc.desc Verify Array constructor creates array with circular reference objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0059 = Prototype0059();
    //   expect(Constructor0059.arr1).assertEqual(1);
    //   expect(Constructor0059.arr2).assertEqual(Constructor0059.obj);
    //   expect(Constructor0059.arr3).assertEqual(Constructor0059.obj);
    //   expect(Constructor0059.arr4).assertEqual('circular');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0060
     * @tc.name testArrayConstructor0060
     * @tc.desc Verify Array constructor creates array with frozen objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0060 = Prototype0060();
    //   expect(Constructor0060.arr3).assertEqual(1);
    //   expect(Constructor0060.arr1).assertEqual(Constructor0060.frozenObj);
    //   expect(Constructor0060.arr2).assertEqual('frozen');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0061
     * @tc.name testArrayConstructor0061
     * @tc.desc Verify Array constructor creates array with sealed objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0061 = Prototype0061();
    //   expect(Constructor0061.arr3).assertEqual(1);
    //   expect(Constructor0061.arr1).assertEqual(Constructor0061.sealedObj);
    //   expect(Constructor0061.arr2).assertEqual('sealed');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0062
     * @tc.name testArrayConstructor0062
     * @tc.desc Verify Array constructor creates array with multiple regular expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const reg1 = new RegExp('^[a-z]+$', 'i');
      const reg2 = new RegExp('\\d{3}-\\d{2}-\\d{4}');
      const arr = new Array<RegExp>(reg1, reg2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].test('Hello')).assertTrue();
      expect(arr[1].test('123-45-6789')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0063
     * @tc.name testArrayConstructor0063
     * @tc.desc Verify Array constructor creates array with date objects of different time zones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const date1 = new Date('2024-01-01T00:00:00Z');
      const date2 = new Date('2024-01-01T00:00:00+08:00');
      const arr = new Array<Date>(date1, date2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].getTime() === arr[1].getTime()).assertFalse();
      expect(arr[0].toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0064
     * @tc.name testArrayConstructor0064
     * @tc.desc Verify Array constructor creates array with empty functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = (): void => {
      };
      const func2 = (): void => {
      };
      const arr = new Array<() => void>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(func1);
      expect(arr[1]).assertEqual(func2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0065
     * @tc.name testArrayConstructor0065
     * @tc.desc Verify Array constructor creates array with arrow functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0065 = Prototype0065();
    //   expect(Constructor0065.arr3).assertEqual(2);
    //   expect(Constructor0065.arr1).assertEqual(undefined);
    //   expect(Constructor0065.arr2).assertEqual('TEST');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0066
     * @tc.name testArrayConstructor0066
     * @tc.desc Verify Array constructor creates array with generator functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0066 = Prototype0066();
    //   expect(Constructor0066.arr3).assertEqual(2);
    //   expect(Constructor0066.arr1).assertDeepEquals([1, 2]);
    //   expect(Constructor0066.arr2).assertDeepEquals(['a', 'b']);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0067
     * @tc.name testArrayConstructor0067
     * @tc.desc Verify Array constructor creates array with async functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0067 = Prototype0067();
    //   expect(Constructor0067.arr3).assertEqual(2);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0068
     * @tc.name testArrayConstructor0068
     * @tc.desc Verify Array constructor creates array with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance1 = new MyClass68(1);
      const instance2 = new MyClass68(2);
      const arr = new Array<MyClass68>(instance1, instance2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0069
     * @tc.name testArrayConstructor0069
     * @tc.desc Verify Array constructor creates array with class constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //
    //   let Constructor0069 = Prototype0069();
    //   expect(Constructor0069.arr3).assertEqual(2);
    //   expect(Constructor0069.arr1).assertEqual(false);
    //   expect(Constructor0069.arr2).assertEqual(false);
    //
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0070
     * @tc.name testArrayConstructor0070
     * @tc.desc Verify Array constructor creates array with module-like objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0070 = Prototype0070();
    //   expect(Constructor0070.arr3).assertEqual(2);
    //   expect(Constructor0070.arr1).assertEqual('bar');
    //   expect(Constructor0070.arr2).assertEqual('test');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0071
     * @tc.name testArrayConstructor0071
     * @tc.desc Verify Array constructor creates array with multiple NaN values from different sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan1 = NaN;
      const nan2 = 0 / 0.0;
      const nan3 = Number('not-a-number');
      const arr = new Array<number>(nan1, nan2, nan3);
      expect(arr.length).assertEqual(3);
      expect(isNaN(arr[0])).assertTrue();
      expect(isNaN(arr[1])).assertTrue();
      expect(isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0072
     * @tc.name testArrayConstructor0072
     * @tc.desc Verify Array constructor creates array with Infinity and -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, -Infinity);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(-Infinity);
      expect(arr[0] > 1e308).assertTrue();
      expect(arr[1] < -1e308).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0073
     * @tc.name testArrayConstructor0073
     * @tc.desc Verify Array constructor creates array with special string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\0', '\u0000', '\uFFFF', '\u{1F600}'); // null char, max BMP, emoji
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('\0');
      expect(arr[1]).assertEqual('\u0000');
      expect(arr[2]).assertEqual('\uFFFF');
      expect(arr[3]).assertEqual('\u{1F600}');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0074
     * @tc.name testArrayConstructor0074
     * @tc.desc Verify Array constructor creates array with multi-line string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str1 = 'line1\nline2';
      const str2 = `lineA
lineB`;
      const arr = new Array<string>(str1, str2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('line1\nline2');
      expect(arr[1]).assertEqual('lineA\nlineB');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0076
     * @tc.name testArrayConstructor0076
     * @tc.desc Verify Array constructor creates array with multiple empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [];
      const arr2: string[] = [];
      const arr = new Array<number[] | string[]>(arr1, arr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(arr1);
      expect(arr[1]).assertEqual(arr2);
      expect(arr[0].length).assertEqual(0);
      expect(arr[1].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0077
     * @tc.name testArrayConstructor0077
     * @tc.desc Verify Array constructor creates array with multi-dimensional arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // todo
    // it('testArrayConstructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   const matrix1 = [[1, 2], [3, 4]];
    //   const matrix2 = [['a', 'b'], ['c', 'd']];
    //   const arr = new Array<number[][] | string[][]>(matrix1, matrix2);
    //   expect(arr.length).assertEqual(2);
    //   expect(arr[0][1][0]).assertEqual(3);
    //   expect(arr[1][0][1]).assertEqual('b');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0078
     * @tc.name testArrayConstructor0078
     * @tc.desc Verify Array constructor creates array with sparse arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('testArrayConstructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   const sparse1: number[] = [];
    //   sparse1[5] = 10;
    //   const sparse2: string[] = [];
    //   sparse2[100] = 'test';
    //   const arr = new Array<number[] | string[]>(sparse1, sparse2);
    //   expect(arr.length).assertEqual(2);
    //   expect(arr[0].length).assertEqual(6);
    //   expect(arr[0][5]).assertEqual(10);
    //   expect(arr[1].length).assertEqual(101);
    //   expect(arr[1][100]).assertEqual('test');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0079
     * @tc.name testArrayConstructor0079
     * @tc.desc Verify Array constructor creates array with arguments objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0079 = Prototype0079();
    //   expect(Constructor0079.arr3).assertEqual(2);
    //   expect(Constructor0079.arr1).assertEqual(3);
    //   expect(Constructor0079.arr2).assertEqual('a');
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0080
     * @tc.name testArrayConstructor0080
     * @tc.desc Verify Array constructor creates array with various collection types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('testArrayConstructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   let Constructor0080 = Prototype0080();
    //   expect(Constructor0080.arr3).assertEqual(2);
    //   expect(Constructor0080.arr1).assertEqual('value');
    //   expect(Constructor0080.arr2).assertTrue();
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0081
     * @tc.name testArrayConstructor0081
     * @tc.desc Verify Array constructor creates array with length 1 when passed single boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0082
     * @tc.name testArrayConstructor0082
     * @tc.desc Verify Array constructor creates array with length 1 when passed single boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(false);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0083
     * @tc.name testArrayConstructor0083
     * @tc.desc Verify Array constructor creates array with length 10 when passed 10 as single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(10).fill(0);
      expect(arr.length).assertEqual(10);
      expect(arr[9]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0084
     * @tc.name testArrayConstructor0084
     * @tc.desc Verify Array constructor creates array with elements when passed multiple boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
      expect(arr[3]).assertEqual(false);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0086
     * @tc.name testArrayConstructor0086
     * @tc.desc Verify Array constructor creates array with mixed positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, -2, 3, -4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(-2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0087
     * @tc.name testArrayConstructor0087
     * @tc.desc Verify Array constructor creates array with elements when passed numbers and strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<NumOrStr87>(123, 'abc', 45.67, 'def');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(123);
      expect(arr[1]).assertEqual('abc');
      expect(arr[2]).assertEqual(45.67);
      expect(arr[3]).assertEqual('def');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0088
     * @tc.name testArrayConstructor0088
     * @tc.desc Verify Array constructor creates array with elements when passed various primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<Primitive88>(42, 'test', true, null, undefined);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual('test');
      expect(arr[2]).assertEqual(true);
      expect(arr[3]).assertEqual(null);
      expect(arr[4]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0089
     * @tc.name testArrayConstructor0089
     * @tc.desc Verify Array constructor creates array with length 1 when passed single empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: GeneratedObjectLiteralInterface_1 = {};
      const arr = new Array<object>(obj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0090
     * @tc.name testArrayConstructor0090
     * @tc.desc Verify Array constructor creates array with elements when passed objects with same properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: test0090 = { value: 10 };
      const obj2: test0090 = { value: 10 };
      const arr = new Array<test0090>(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].value).assertEqual(10);
      expect(arr[1].value).assertEqual(10);
      expect(arr[0] === arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0091
     * @tc.name testArrayConstructor0091
     * @tc.desc Verify Array constructor creates array with length 1 when passed single regexp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const reg = new RegExp('test', 'gi');
      const arr = new Array<RegExp>(reg);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(reg);
      expect(arr[0].flags).assertEqual('gi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0092
     * @tc.name testArrayConstructor0092
     * @tc.desc Verify Array constructor creates array with length 1 when passed single date object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date = new Date(2024, 0, 1);
      const arr = new Array<Date>(date);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(date);
      expect(arr[0].getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0093
     * @tc.name testArrayConstructor0093
     * @tc.desc Verify Array constructor creates array with length 1 when passed single function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func = (a: number, b: number): number => a + b;
      const arr = new Array<(a: number, b: number) => number>(func);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(func);
      expect(arr[0](2, 3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0094
     * @tc.name testArrayConstructor0094
     * @tc.desc Verify Array constructor creates array with length 1 when passed single symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0094 = Prototype0094();
    //   expect(Constructor0094.arr3).assertEqual(1);
    //   expect(Constructor0094.arr1).assertEqual(true);
    //   expect(Constructor0094.arr2).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0095
     * @tc.name testArrayConstructor0095
     * @tc.desc Verify Array constructor creates array with length 1 when passed single bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = 123456789012345678901234567890n;
      const arr = new Array<bigint>(big);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(big);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0096
     * @tc.name testArrayConstructor0096
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const arr = new Array<Map<number, string>>(map);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(map);
      expect(arr[0].get(2)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0097
     * @tc.name testArrayConstructor0097
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      const arr = new Array<Set<string>>(set);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(set);
      expect(arr[0].has('b')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0098
     * @tc.name testArrayConstructor0098
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const promise = Promise.resolve('resolved');
      const arr = new Array<Promise<string>>(promise);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(promise);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0099
     * @tc.name testArrayConstructor0099
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const error = new Error('Test error');
      const arr = new Array<Error>(error);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(error);
      expect(arr[0].message).assertEqual('Test error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0100
     * @tc.name testArrayConstructor0100
     * @tc.desc Verify Array constructor creates array with mixed element types including objects and primitives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let Constructor0100 = Prototype0100();
    //   expect(Constructor0100.arr1).assertEqual(5);
    //   expect(Constructor0100.arr[0]).assertEqual(42);
    //   expect(Constructor0100.arr[1]).assertEqual('hello');
    //   expect(Constructor0100.arr[2]).assertEqual(true);
    //   expect(Constructor0100.arr[3]).assertEqual(Constructor0100.obj);
    //   expect(Constructor0100.arr2).assertEqual(true);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0101
     * @tc.name testArrayConstructor0101
     * @tc.desc Verify Array constructor creates array with length 1000 when passed 1000 as single argument
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0101', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000).fill(0);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0102
     * @tc.name testArrayConstructor0102
     * @tc.desc Verify Array constructor creates array with 1000 elements when passed 1000 arguments
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testArrayConstructor0102', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
    //   let Constructor0102 = Prototype0102();
    //   expect(Constructor0102.arr1).assertEqual(1000);
    //   expect(Constructor0102.arr[0]).assertEqual(0);
    //   expect(Constructor0102.arr[999]).assertEqual(999);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0103
     * @tc.name testArrayConstructor0103
     * @tc.desc Verify Array constructor creates array with length 1 when passed single boxed number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const numObj = new Number(42);
      const arr = new Array<Number>(numObj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(numObj);
      expect(arr[0].valueOf()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0104
     * @tc.name testArrayConstructor0104
     * @tc.desc Verify Array constructor creates array with length 1 when passed single boxed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const strObj = new String('boxed');
      const arr = new Array<String>(strObj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(strObj);
      expect(arr[0].valueOf()).assertEqual('boxed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0105
     * @tc.name testArrayConstructor0105
     * @tc.desc Verify Array constructor creates array with length 1 when passed single boxed boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const boolObj = new Boolean(false);
      const arr = new Array<Boolean>(boolObj);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(boolObj);
      expect(arr[0].valueOf()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0106
     * @tc.name testArrayConstructor0106
     * @tc.desc Verify Array constructor creates array with length 1 when passed single ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const buffer = new ArrayBuffer(16);
      const arr = new Array<ArrayBuffer>(buffer);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(buffer);
      expect(arr[0].byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0107
     * @tc.name testArrayConstructor0107
     * @tc.desc Verify Array constructor creates array with length 1 when passed single DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);
      const arr = new Array<DataView>(view);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(view);
      expect(arr[0].buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0108
     * @tc.name testArrayConstructor0108
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const int32 = new Int32Array([1, 2, 3]);
      const arr = new Array<Int32Array>(int32);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(int32);
      expect(arr[0][1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0109
     * @tc.name testArrayConstructor0109
     * @tc.desc Verify Array constructor creates array with length 1 when passed single Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testArrayConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const float64 = new Float64Array([1.1, 2.2, 3.3]);
      const arr = new Array<Float64Array>(float64);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(float64);
      expect(arr[0][2]).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_PROTOTYPE_0110
     * @tc.name testArrayConstructor0110
     * @tc.desc Verify Array constructor creates array with various typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('testArrayConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
    //   const uint8 = new Uint8Array([255, 0]);
    //   const int16 = new Int16Array([-32768, 32767]);
    //   const float32 = new Float32Array([1.5, -2.5]);
    //   const arr = new Array<Uint8Array | Int16Array | Float32Array>(uint8, int16, float32);
    //   expect(arr.length).assertEqual(3);
    //   expect(arr[0][0]).assertEqual(255);
    //   expect(arr[1][1]).assertEqual(32767);
    //   expect(arr[2][0]).assertEqual(1.5);
    // });

  })
}