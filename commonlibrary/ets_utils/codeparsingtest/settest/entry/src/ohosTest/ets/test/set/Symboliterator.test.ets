/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType, Level,Size} from '@ohos/hypium';
import { ArrayConstructor0014, ArrayConstructor0019, ArrayConstructor0029,
  ArrayConstructor0045,
  ArrayConstructor0048,
  ArrayConstructor0050,
  ArrayConstructor0052,
  ArrayConstructor0053,
  ArrayConstructor0072,
  ArrayConstructor0076,
  ArrayConstructor0085,
  ArrayConstructor0088,
  ArrayConstructor0089,
  ArrayConstructor0090,
  ArrayConstructor0096,
  ArrayConstructor0097,
  ArrayConstructor0106,
  ArrayConstructor0108,
  ArrayConstructor0109,
  ArrayConstructor0110} from './Symboliterator';
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
interface GeneratedObjectLiteralInterface_2 {}

interface GeneratedObjectLiteralInterface_1 {}

export default function SetSymbolIteratorTest() {
  describe('SetSymbolIteratorTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50)
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
     * @tc.name   testArrayConstructor0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0001
     * @tc.desc   Verify Array constructor creates empty array with single positive integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(6);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[5]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0002
     * @tc.desc   Verify Array constructor creates array with single zero length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>(0);
      expect(arr.length).assertEqual(0);
      expect(arr[0]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0003
     * @tc.desc   Verify Array constructor creates array with single negative integer length throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<boolean>(-3);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertEqual(false);
      expect(error?.name).assertEqual('RangeError');
    });

    /**
     * @tc.name   testArrayConstructor0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0004
     * @tc.desc   Verify Array constructor creates array with single float length throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<number>(2.5);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertEqual(false);
      expect(error?.name).assertEqual('RangeError');
    });


    /**
     * @tc.name   testArrayConstructor0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0011
     * @tc.desc   Verify Array constructor creates array with multiple number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0012
     * @tc.desc   Verify Array constructor creates array with multiple string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.name   testArrayConstructor0013
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0013
     * @tc.desc   Verify Array constructor creates array with multiple boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0014
     * @tc.desc   Verify Array constructor creates array with mixed type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let Constructor0014 = ArrayConstructor0014();

      expect(Constructor0014.arr.length).assertEqual(3);
      expect(Constructor0014.arr[0]).assertEqual(1);
      expect(Constructor0014.arr[1]).assertEqual('a');
      expect(Constructor0014.arr[2]).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0015
     * @tc.desc   Verify Array constructor creates array with null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<null | number>(null, 2, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[2]).assertEqual(null);
    });

    /**
     * @tc.name   testArrayConstructor0016
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0016
     * @tc.desc   Verify Array constructor creates array with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<undefined | string>(undefined, 'test', undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0017
     * @tc.desc   Verify Array constructor creates array with object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface TestObj {
        id: number;
      }
      const obj1: TestObj = { id: 1 };
      const obj2: TestObj = { id: 2 };
      const arr = new Array<TestObj>(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].id).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0018
     * @tc.desc   Verify Array constructor creates array with array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr = new Array<number[]>(arr1, arr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0019
     * @tc.desc   Verify Array constructor creates array with symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let Constructor0019 = ArrayConstructor0019();
      expect(Constructor0019.arr1).assertEqual(true);
      expect(Constructor0019.arr2).assertEqual(true);
      expect(Constructor0019.arr3).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0020
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0020
     * @tc.desc   Verify Array constructor creates array with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 1;
      const func2 = () => 'test';
      const arr = new Array<() => number | string>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual(1);
      expect(arr[1]()).assertEqual('test');
    });

    /**
     * @tc.name   testArrayConstructor0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0021
     * @tc.desc   Verify Array constructor creates array with bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1 = 10n;
      const big2 = 20n;
      const arr = new Array<bigint>(big1, big2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.name   testArrayConstructor0022
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0022
     * @tc.desc   Verify Array constructor without new keyword creates array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0023
     * @tc.desc   Verify Array constructor without arguments creates empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);
      expect(arr instanceof Array).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0024
     * @tc.desc   Verify Array constructor with max safe integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInt = 1000000;
      const arr = new Array<number>(maxSafeInt);
      expect(arr.length).assertEqual(maxSafeInt);
    });

    /**
     * @tc.name   testArrayConstructor0025
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0025
     * @tc.desc   Verify Array constructor with length exceeding max safe integer throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const exceedMax = 9007199254740992;
      let error: Error | null = null;
      try {
        new Array<number>(exceedMax);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertFalse();
      expect(error?.name).assertEqual('RangeError');
    });

    /**
     * @tc.name   testArrayConstructor0026
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0026
     * @tc.desc   Verify Array constructor creates array with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2024, 0, 1);
      const arr = new Array<Date>(date1, date2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(date1);
      expect(arr[1].getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   testArrayConstructor0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0027
     * @tc.desc   Verify Array constructor creates array with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /test/;
      const regex2 = /example/g;
      const arr = new Array<RegExp>(regex1, regex2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].test('test')).assertEqual(true);
      expect(arr[1].flags).assertEqual('g');
    });

    /**
     * @tc.name   testArrayConstructor0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0028
     * @tc.desc   Verify Array constructor creates array with Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map<number, string>([[1, 'a']]);
      const map2 = new Map<number, string>([[2, 'b']]);
      const arr = new Array<Map<number, string>>(map1, map2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].get(1)).assertEqual('a');
      expect(arr[1].size).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0029
     * @tc.desc   Verify Array constructor creates array with Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let Constructor0029 = ArrayConstructor0029();
      expect(Constructor0029.arr1).assertEqual(2);
      expect(Constructor0029.arr2).assertEqual(true);
      expect(Constructor0029.arr3).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0030
     * @tc.desc   Verify Array constructor with single element that is an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const element = [1, 2, 3];
      const arr = new Array<number[]>(element);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(element);
      expect(arr[0][1]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0031
     * @tc.desc   Verify Array constructor creates sparse array with length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[2] = 10;
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(10);
      expect(arr[4]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0032
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0032
     * @tc.desc   Verify Array constructor with numeric length and then modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr.length = 5;
      expect(arr.length).assertEqual(5);
      expect(arr[3]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0033
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0033
     * @tc.desc   Verify Array constructor with negative zero treated as zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayConstructor0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0034
     * @tc.desc   Verify Array constructor with Infinity as length throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<number>(Infinity);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertFalse();
      expect(error?.name).assertEqual('RangeError');
    });

    /**
     * @tc.name   testArrayConstructor0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0035
     * @tc.desc   Verify Array constructor with -Infinity as length throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<number>(-Infinity);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertFalse();
      expect(error?.name).assertEqual('RangeError');
    });

    /**
     * @tc.name   testArrayConstructor0036
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0036
     * @tc.desc   Verify Array constructor with NaN as length throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<number>(NaN);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertFalse();
      expect(error?.name).assertEqual('RangeError');
    });

    /**
     * @tc.name   testArrayConstructor0037
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0037
     * @tc.desc   Verify Array constructor creates array with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class TestClass {
        public name: string;
        constructor(name: string) {
          this.name = name;
        }
      }
      const instance1 = new TestClass('first');
      const instance2 = new TestClass('second');
      const arr = new Array<TestClass>(instance1, instance2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('first');
      expect(arr[1] instanceof TestClass).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0038
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0038
     * @tc.desc   Verify Array constructor with length and then filled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(3);
      arr.fill(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.name   testArrayConstructor0039
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0039
     * @tc.desc   Verify Array constructor creates array with typed array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed1 = new Uint8Array([1, 2, 3]);
      const typed2 = new Float32Array([4.5, 5.5]);
      const arr = new Array<Uint8Array | Float32Array>(typed1, typed2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1].byteLength).assertEqual(8);
    });

    /**
     * @tc.name   testArrayConstructor0040
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0040
     * @tc.desc   Verify Array constructor with length is instanceof Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      expect(arr instanceof Array).assertEqual(true);
      expect(Array.isArray(arr)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0041
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0041
     * @tc.desc   Verify Array constructor with elements is instanceof Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr instanceof Array).assertEqual(true);
      expect(Array.isArray(arr)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0042
     * @tc.desc   Verify Array constructor creates array with empty string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('', '', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[2].length).assertEqual(0);
    });

    /**
     * @tc.name   testArrayConstructor0043
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0043
     * @tc.desc   Verify Array constructor creates array with multi-line string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str1 = 'line1\nline2';
      const str2 = 'a\nb\nc';
      const arr = new Array<string>(str1, str2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].split('\n').length).assertEqual(2);
      expect(arr[1].split('\n')[1]).assertEqual('b');
    });

    /**
     * @tc.name   testArrayConstructor0044
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0044
     * @tc.desc   Verify Array constructor with length and then assigned elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 10;
      arr[2] = 30;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(undefined);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.name   testArrayConstructor0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0045
     * @tc.desc   Verify Array constructor creates array with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let Constructor0045 = ArrayConstructor0045();
      expect(Constructor0045.arr1).assertEqual(2);
      expect(Constructor0045.arr2).assertEqual(2);
      expect(Constructor0045.arr3).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0046
     * @tc.desc   Verify Array constructor with length and then push elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(2);
      arr.push(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayConstructor0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0047
     * @tc.desc   Verify Array constructor with elements and then unshift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayConstructor0048
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0048
     * @tc.desc   Verify Array constructor creates array with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Constructor0048 = ArrayConstructor0048();
      expect(Constructor0048.arr1).assertEqual(3);
      expect(Constructor0048.arr2).assertEqual(Constructor0048.arr);
      expect(Constructor0048.arr3).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0049
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0049
     * @tc.desc   Verify Array constructor with length in a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const createArray = (length: number): number[] => {
        return new Array<number>(length);
      }
      const arr = createArray(4);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0050
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0050
     * @tc.desc   Verify Array constructor with elements in a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0050= ArrayConstructor0050();
      expect(Constructor0050.arr.length).assertEqual(1);
      expect(Constructor0050.arr[0]).assertEqual('a');
    });

    /**
     * @tc.name   testArrayConstructor0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0051
     * @tc.desc   Verify Array constructor with length is not frozen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 1;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0052
     * @tc.desc   Verify Array constructor creates array with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0052= ArrayConstructor0052();
      expect(Constructor0052.arr.length).assertEqual(2);
      expect(Constructor0052.arr1.a).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0053
     * @tc.desc   Verify Array constructor creates array with sealed objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0053 = ArrayConstructor0053();
      expect(Constructor0053.arr1).assertEqual(2);
      expect(Constructor0053.arr2).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0054
     * @tc.desc   Verify Array constructor with length and then join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 1;
      arr[2] = 3;
      expect(arr.join(',')).assertEqual('1,,3');
    });

    /**
     * @tc.name   testArrayConstructor0055
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0055
     * @tc.desc   Verify Array constructor with elements and then join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.join('')).assertEqual('abc');
    });

    /**
     * @tc.name   testArrayConstructor0056
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0056
     * @tc.desc   Verify Array constructor with length and then indexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      arr[2] = 10;
      expect(arr.indexOf(10)).assertEqual(2);
      expect(arr.indexOf(20)).assertEqual(-1);
    });

    /**
     * @tc.name   testArrayConstructor0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0057
     * @tc.desc   Verify Array constructor with elements and then includes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.includes(true)).assertEqual(true);
      expect(arr.includes(false)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0058
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0058
     * @tc.desc   Verify Array constructor creates array with function elements that return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = () => 'result1';
      const func2 = () => 42;
      const arr = new Array<() => string | number>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual('result1');
      expect(arr[1]()).assertEqual(42);
    });

    /**
     * @tc.name   testArrayConstructor0059
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0059
     * @tc.desc   Verify Array constructor with length and then map function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr.fill(2);
      const mapped = arr.map(x => x * 3);
      expect(mapped.length).assertEqual(3);
      expect(mapped[0]).assertEqual(6);
      expect(mapped[2]).assertEqual(6);
    });

    /**
     * @tc.name   testArrayConstructor0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0060
     * @tc.desc   Verify Array constructor with elements and then filter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter(x => x % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0061
     * @tc.desc   Verify Array constructor with elements and then reduce function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const sum = arr.reduce((acc, curr) => acc + curr, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   testArrayConstructor0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0062
     * @tc.desc   Verify Array constructor with length 1 and element that is zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);

      const arr2 = new Array<number>(0, 1);
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(0);
    });

    /**
     * @tc.name   testArrayConstructor0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0063
     * @tc.desc   Verify Array constructor with length and then sorted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      const sorted = arr.sort((a, b) => a - b);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayConstructor0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0064
     * @tc.desc   Verify Array constructor with elements and then reversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const reversed = arr.reverse();
      expect(reversed[0]).assertEqual(3);
      expect(reversed[2]).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0065
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0065
     * @tc.desc   Verify Array constructor with length and then some function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4);
      arr[1] = 5;
      arr[3] = 15;
      const hasGreaterThan10 = arr.some(x => x !== undefined && x > 10);
      expect(hasGreaterThan10).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0066
     * @tc.desc   Verify Array constructor with elements and then every function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const allEven = arr.every(x => x % 2 === 0);
      expect(allEven).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0067
     * @tc.desc   Verify Array constructor with length and then find function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[0] = 10;
      arr[2] = 30;
      arr[4] = 50;
      const found = arr.find(x => x !== undefined && x > 25);
      expect(found).assertEqual(30);
    });

    /**
     * @tc.name   testArrayConstructor0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0068
     * @tc.desc   Verify Array constructor with elements and then findIndex function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const index = arr.findIndex(x => x === 'c');
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0069
     * @tc.desc   Verify Array constructor with length and then slice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[1] = 10;
      arr[3] = 30;
      const sliced = arr.slice(1, 4);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual(10);
      expect(sliced[2]).assertEqual(30);
    });

    /**
     * @tc.name   testArrayConstructor0070
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0070
     * @tc.desc   Verify Array constructor with elements and then splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const removed = arr.splice(2, 2);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(5);
      expect(removed.length).assertEqual(2);
      expect(removed[0]).assertEqual(3);
    });


    /**
     * @tc.name   testArrayConstructor0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0072
     * @tc.desc   Verify Array constructor with elements including NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0072 = ArrayConstructor0072();
      expect(Constructor0072.arr1).assertEqual(3);
      expect(Constructor0072.arr2).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0073
     * @tc.desc   Verify Array constructor with length and then concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(2);
      arr1[0] = 1;
      const arr2 = new Array<number>(3, 4);
      const combined = arr1.concat(arr2);
      expect(combined.length).assertEqual(4);
      expect(combined[0]).assertEqual(1);
      expect(combined[3]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0074
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0074
     * @tc.desc   Verify Array constructor with elements and then concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c', 'd');
      const combined = arr1.concat(arr2);
      expect(combined.length).assertEqual(4);
      expect(combined[2]).assertEqual('c');
    });

    /**
     * @tc.name   testArrayConstructor0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0075
     * @tc.desc   Verify Array constructor creates array with async function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (): Promise<void> => {
      const asyncFunc1 = async () => 'async1';
      const asyncFunc2 = async () => 'async2';
      const arr = new Array<() => Promise<string>>(asyncFunc1, asyncFunc2);
      expect(arr.length).assertEqual(2);
      expect(await arr[0]()).assertEqual('async1');
      expect(await arr[1]()).assertEqual('async2');
    });

    /**
     * @tc.name   testArrayConstructor0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0076
     * @tc.desc   Verify Array constructor creates array with generator function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Constructor0076 = ArrayConstructor0076();

      expect(Constructor0076.arr1).assertEqual(2);
      expect((Constructor0076.arr2) as number).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0077
     * @tc.desc   Verify Array constructor with length and then fill with object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      interface TestObj { id: number; }
      const obj: TestObj = { id: 1 };
      const arr = new Array<TestObj>(3);
      arr.fill(obj);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(obj);
      expect(arr[2].id).assertEqual(1);
    });

    /**
     * @tc.name   testArrayConstructor0078
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0078
     * @tc.desc   Verify Array constructor with elements and then forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let sum = 0;
      arr.forEach(x => sum += x);
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.name   testArrayConstructor0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0079
     * @tc.desc   Verify Array constructor with length and then entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[1] = 10;
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      expect(entries[0][0]).assertEqual(0);
      expect(entries[1][1]).assertEqual(10);
    });

    /**
     * @tc.name   testArrayConstructor0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0080
     * @tc.desc   Verify Array constructor with elements and then keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      const keys = Array.from(arr.keys());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[2]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0081
     * @tc.desc   Verify Array constructor with length and then values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2);
      arr[0] = 5;
      const values = Array.from(arr.values());
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(5);
      expect(values[1]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0082
     * @tc.desc   Verify Array constructor with elements and then flat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | number[]>(1, [2, 3], 4);
      const flattened = arr.flat();
      expect(flattened.length).assertEqual(4);
      expect(flattened[1]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0083
     * @tc.desc   Verify Array constructor with elements and then flatMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const mapped = arr.flatMap(x => [x, x.toUpperCase()]);
      expect(mapped.length).assertEqual(4);
      expect(mapped[1]).assertEqual('A');
      expect(mapped[2]).assertEqual('b');
    });

    /**
     * @tc.name   testArrayConstructor0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0084
     * @tc.desc   Verify Array constructor with length and then copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[0] = 1;
      arr[1] = 2;
      arr.copyWithin(3, 0, 2);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.name   testArrayConstructor0085
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0085
     * @tc.desc   Verify Array constructor with elements and then with
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0085 = ArrayConstructor0085();
      expect(Constructor0085.arr1).assertEqual(5);
      expect(Constructor0085.arr2).assertEqual(2); // Original remains unchanged
    });

    /**
     * @tc.name   testArrayConstructor0086
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0086
     * @tc.desc   Verify Array constructor creates array with ArrayBuffer elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(16);
      const arr = new Array<ArrayBuffer>(buffer1, buffer2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].byteLength).assertEqual(8);
      expect(arr[1].byteLength).assertEqual(16);
    });

    /**
     * @tc.name   testArrayConstructor0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0087
     * @tc.desc   Verify Array constructor creates array with DataView elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view1 = new DataView(buffer, 0, 8);
      const view2 = new DataView(buffer, 8, 8);
      const arr = new Array<DataView>(view1, view2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].byteLength).assertEqual(8);
      expect(arr[1].byteOffset).assertEqual(8);
    });

    /**
     * @tc.name   testArrayConstructor0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0088
     * @tc.desc   Verify Array constructor with length and then delete operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0088 = ArrayConstructor0088();
      expect(Constructor0088.arr1).assertEqual(3);
      expect(Constructor0088.arr2).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0089
     * @tc.desc   Verify Array constructor with elements and then delete operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0089 = ArrayConstructor0089();
      expect(Constructor0089.arr1).assertEqual(3);
      expect(Constructor0089.arr2).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0090
     * @tc.desc   Verify Array constructor creates array with proxy elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let Constructor0090 = ArrayConstructor0090();
      expect(Constructor0090.arr1).assertEqual(2);
      expect(Constructor0090.arr2.value).assertEqual(20);
      expect(Constructor0090.arr3.value).assertEqual(40);
    });

    /**
     * @tc.name   testArrayConstructor0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0091
     * @tc.desc   Verify Array constructor with large number of elements (1000)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0091', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const elements: number[] = [];
      for (let i = 0; i < 1000; i++) {
        elements.push(i);
      }
      const arr = new Array<number>(...elements);
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.name   testArrayConstructor0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0092
     * @tc.desc   Verify Array constructor with length and then large index assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      arr[10] = 100;
      expect(arr.length).assertEqual(11);
      expect(arr[10]).assertEqual(100);
      expect(arr[5]).assertEqual(undefined);
    });

    /**
     * @tc.name   testArrayConstructor0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0093
     * @tc.desc   Verify Array constructor with elements and then spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const newArr = [...arr, 4, 5];
      expect(newArr.length).assertEqual(5);
      expect(newArr[3]).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0094
     * @tc.desc   Verify Array constructor with length and then Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 1;
      arr[2] = 3;
      const fromArr = Array.from(arr, x => x ?? 0);
      expect(fromArr.length).assertEqual(3);
      expect(fromArr[1]).assertEqual(0);
    });

    /**
     * @tc.name   testArrayConstructor0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0095
     * @tc.desc   Verify Array constructor creates array with error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error1 = new Error('Error 1');
      const error2 = new TypeError('Type Error');
      const arr = new Array<Error>(error1, error2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].message).assertEqual('Error 1');
      expect(arr[1].name).assertEqual('TypeError');
    });

    /**
     * @tc.name   testArrayConstructor0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0096
     * @tc.desc   Verify Array constructor with length and then array is extensible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0096 = ArrayConstructor0096();
      expect(Constructor0096.arr1).assertEqual(true);
      expect(Constructor0096.arr.length).assertEqual(4);
    });

    /**
     * @tc.name   testArrayConstructor0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0097
     * @tc.desc   Verify Array constructor with elements and then prevent extensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0097 = ArrayConstructor0097();
      expect(Constructor0097.arr1).assertDeepEquals([1,2,3]);
      let error: Error | null = null;
      try {
        Constructor0097.arr[3] = 4;
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertFalse();
    });

    /**
     * @tc.name   testArrayConstructor0098
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0098
     * @tc.desc   Verify Array constructor creates array with WeakMap elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1 = new WeakMap<object, string>();
      const wm2 = new WeakMap<object, number>();
      const key1: GeneratedObjectLiteralInterface_1 = {};
      const key2: GeneratedObjectLiteralInterface_2 = {};
      wm1.set(key1, 'value1');
      wm2.set(key2, 100);

      const arr = new Array<WeakMap<object, number|string>>(wm1, wm2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].get(key1)).assertEqual('value1');
      expect(arr[1].get(key2)).assertEqual(100);
    });

    /**
     * @tc.name   testArrayConstructor0099
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0099
     * @tc.desc   Verify Array constructor creates array with WeakSet elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ws1 = new WeakSet<object>();
      const ws2 = new WeakSet<object>();
      const obj1: GeneratedObjectLiteralInterface_1 = {};
      const obj2: GeneratedObjectLiteralInterface_2 = {};
      ws1.add(obj1);
      ws2.add(obj2);
      const arr = new Array<WeakSet<object>>(ws1, ws2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].has(obj1)).assertEqual(true);
      expect(arr[1].has(obj2)).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0100
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0100
     * @tc.desc   Verify Array constructor with elements and then JSON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'two', 3);
      const json = JSON.stringify(arr);
      expect(json).assertEqual('[1,"two",3]');
    });

    /**
     * @tc.name   testArrayConstructor0101
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0101
     * @tc.desc   Verify Array constructor with length and then JSON stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[1] = 2;
      const json = JSON.stringify(arr);
      expect(json).assertEqual('[null,2,null]');
    });

    /**
     * @tc.name   testArrayConstructor0102
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0102
     * @tc.desc   Verify Array constructor creates array with promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const promise1 = Promise.resolve('resolved1');
      const promise2 = Promise.resolve('resolved2');
      const arr = new Array<Promise<string>>(promise1, promise2);
      expect(arr.length).assertEqual(2);
      expect(await arr[0]).assertEqual('resolved1');
      expect(await arr[1]).assertEqual('resolved2');
    });

    /**
     * @tc.name   testArrayConstructor0103
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0103
     * @tc.desc   Verify Array constructor with elements and then isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(Array.isArray(arr)).assertEqual(true);
      expect(Array.isArray({})).assertEqual(false);
    });

    /**
     * @tc.name   testArrayConstructor0104
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0104
     * @tc.desc   Verify Array constructor with length and then isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      expect(Array.isArray(arr)).assertEqual(true);
      expect(Array.isArray('not array')).assertEqual(false);
    });

    /**
     * @tc.name   testArrayConstructor0105
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0105
     * @tc.desc   Verify Array constructor creates array with typed array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intArr = new Int32Array([1, 2, 3]);
      const floatArr = new Float64Array([4.5, 5.5]);
      const arr = new Array<Int32Array | Float64Array>(intArr, floatArr);
      expect(arr.length).assertEqual(2);
      expect(arr[0][2]).assertEqual(3);
      expect(arr[1][0]).assertEqual(4.5);
    });

    /**
     * @tc.name   testArrayConstructor0106
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0106
     * @tc.desc   Verify Array constructor with elements and then array prototype methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0106 = ArrayConstructor0106();
      expect(Constructor0106.arr1).assertEqual(1);
      expect(Constructor0106.arr2).assertEqual(3);
    });

    /**
     * @tc.name   testArrayConstructor0107
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0107
     * @tc.desc   Verify Array constructor with subclassed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testArrayConstructor0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      class MyArray<T> extends Array<T> {
        get first(): T | undefined {
          return this[0];
        }
      }

      const arr = new MyArray<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.first).assertEqual(1);
      expect(arr instanceof MyArray).assertEqual(true);
      expect(arr instanceof Array).assertEqual(true);
    });

    /**
     * @tc.name   testArrayConstructor0108
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0108
     * @tc.desc   Verify Array constructor with elements and then array-like conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0108 = ArrayConstructor0108();
      expect(Constructor0108.newArr.length).assertEqual(3);
      expect(Constructor0108.newArr[2]).assertEqual(3);
    });

    /**
     * @tc.name   testArrayConstructor0109
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0109
     * @tc.desc   Verify Array constructor with length and then array-like conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0109 = ArrayConstructor0109();
      expect(Constructor0109.newArr.length).assertEqual(3);
      expect(Constructor0109.newArr[0]).assertEqual(10);
    });

    /**
     * @tc.name   testArrayConstructor0110
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0110
     * @tc.desc   Verify Array constructor with various element types in one array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testArrayConstructor0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let Constructor0110 = ArrayConstructor0110();
      expect(Constructor0110.arr.length).assertEqual(7);
      expect(Constructor0110.arr[0]).assertEqual(42);
      expect(Constructor0110.arr[1]).assertEqual('string');
      expect(Constructor0110.arr[2]).assertEqual(true);
      expect(Constructor0110.arr[3]).assertEqual(Constructor0110.obj);
      expect(Constructor0110.test).assertEqual(true);
      expect(Constructor0110.arr[5]).assertEqual(null);
      expect(Constructor0110.arr[6]).assertEqual(undefined);
    });

  })
}