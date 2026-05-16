
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
interface GeneratedObjectLiteralInterface_2 {}

interface GeneratedObjectLiteralInterface_1 {}

interface TestObj {
  id: number;
}

class TestClass {
  public name: string;
  constructor(name: string) {
    this.name = name;
  }
}

export default function SetSymbolIteratorTest() {
  describe('SetSymbolIteratorTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0003
     * @tc.name testArrayConstructor0003
     * @tc.desc Verify Array constructor creates array with single negative integer length throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let error: Error | null = null;
      try {
        new Array<boolean>(-3);
      } catch (e) {
        error = e as Error;
      }
      expect(error === null).assertEqual(false);
      expect(error?.name).assertEqual('NegativeArraySizeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0011
     * @tc.name testArrayConstructor0011
     * @tc.desc Verify Array constructor creates array with multiple number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0012
     * @tc.name testArrayConstructor0012
     * @tc.desc Verify Array constructor creates array with multiple string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0013
     * @tc.name testArrayConstructor0013
     * @tc.desc Verify Array constructor creates array with multiple boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0015
     * @tc.name testArrayConstructor0015
     * @tc.desc Verify Array constructor creates array with null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<null | number>(null, 2, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(null);
      expect(arr[2]).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0016
     * @tc.name testArrayConstructor0016
     * @tc.desc Verify Array constructor creates array with undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<undefined | string>(undefined, 'test', undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(undefined);
      expect(arr[2]).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0017
     * @tc.name testArrayConstructor0017
     * @tc.desc Verify Array constructor creates array with object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const obj1: TestObj = { id: 1 };
      const obj2: TestObj = { id: 2 };
      const arr = new Array<TestObj>(obj1, obj2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[1].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0018
     * @tc.name testArrayConstructor0018
     * @tc.desc Verify Array constructor creates array with array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr = new Array<int[]>(arr1, arr2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0020
     * @tc.name testArrayConstructor0020
     * @tc.desc Verify Array constructor creates array with function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => (1 as number);
      const func2 = () => 'test';
      const arr = new Array<() => number | string>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual(1);
      expect(arr[1]()).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0021
     * @tc.name testArrayConstructor0021
     * @tc.desc Verify Array constructor creates array with bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0022
     * @tc.name testArrayConstructor0022
     * @tc.desc Verify Array constructor without new keyword creates array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr instanceof Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0023
     * @tc.name testArrayConstructor0023
     * @tc.desc Verify Array constructor without arguments creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);
      expect(arr instanceof Array).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0024
     * @tc.name testArrayConstructor0024
     * @tc.desc Verify Array constructor with max safe integer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInt = 1000000;
      const arr = new Array<number>(maxSafeInt);
      expect(arr.length).assertEqual(maxSafeInt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0026
     * @tc.name testArrayConstructor0026
     * @tc.desc Verify Array constructor creates array with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0027
     * @tc.name testArrayConstructor0027
     * @tc.desc Verify Array constructor creates array with RegExp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = new RegExp('test');
      const regex2 = new RegExp('example','g');
      const arr = new Array<RegExp>(regex1, regex2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].test('test')).assertEqual(true);
      expect(arr[1].flags).assertEqual('g');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0028
     * @tc.name testArrayConstructor0028
     * @tc.desc Verify Array constructor creates array with Map objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0030
     * @tc.name testArrayConstructor0030
     * @tc.desc Verify Array constructor with single element that is an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const element = [1, 2, 3];
      const arr = new Array<int[]>(element);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(element);
      expect(arr[0][1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0033
     * @tc.name testArrayConstructor0033
     * @tc.desc Verify Array constructor with negative zero treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0037
     * @tc.name testArrayConstructor0037
     * @tc.desc Verify Array constructor creates array with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const instance1 = new TestClass('first');
      const instance2 = new TestClass('second');
      const arr = new Array<TestClass>(instance1, instance2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('first');
      expect(arr[1] instanceof TestClass).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0038
     * @tc.name testArrayConstructor0038
     * @tc.desc Verify Array constructor with length and then filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(3);
      arr.fill(5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0039
     * @tc.name testArrayConstructor0039
     * @tc.desc Verify Array constructor creates array with typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed1 = new Uint8Array([1, 2, 3]);
      const typed2 = new Float32Array([4.5, 5.5]);
      const arr = new Array<Uint8Array | Float32Array>(typed1, typed2);
      expect(arr.length).assertEqual(2);
      expect((arr[0] as Uint8Array)[1]).assertEqual(2);
      expect((arr[1] as Float32Array).byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0040
     * @tc.name testArrayConstructor0040
     * @tc.desc Verify Array constructor with length is instanceof Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      expect(arr instanceof Array).assertEqual(true);
      expect(Array.isArray(arr)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0041
     * @tc.name testArrayConstructor0041
     * @tc.desc Verify Array constructor with elements is instanceof Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(arr instanceof Array).assertEqual(true);
      expect(Array.isArray(arr)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0042
     * @tc.name testArrayConstructor0042
     * @tc.desc Verify Array constructor creates array with empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('', '', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
      expect(arr[2].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0043
     * @tc.name testArrayConstructor0043
     * @tc.desc Verify Array constructor creates array with multi-line string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0047
     * @tc.name testArrayConstructor0047
     * @tc.desc Verify Array constructor with elements and then unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0051
     * @tc.name testArrayConstructor0051
     * @tc.desc Verify Array constructor with length is not frozen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 1;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0054
     * @tc.name testArrayConstructor0054
     * @tc.desc Verify Array constructor with length and then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 1;
      arr[2] = 3;
      expect(arr.join(',')).assertEqual('1,,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0055
     * @tc.name testArrayConstructor0055
     * @tc.desc Verify Array constructor with elements and then join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.join('')).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0056
     * @tc.name testArrayConstructor0056
     * @tc.desc Verify Array constructor with length and then indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      arr[2] = 10;
      expect(arr.indexOf(10)).assertEqual(2);
      expect(arr.indexOf(20)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0057
     * @tc.name testArrayConstructor0057
     * @tc.desc Verify Array constructor with elements and then includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.includes(true)).assertEqual(true);
      expect(arr.includes(false)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0058
     * @tc.name testArrayConstructor0058
     * @tc.desc Verify Array constructor creates array with function elements that return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = () => 'result1';
      const func2 = () => (42 as number);
      const arr = new Array<() => string | number>(func1, func2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual('result1');
      expect(arr[1]()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0059
     * @tc.name testArrayConstructor0059
     * @tc.desc Verify Array constructor with length and then map function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0060
     * @tc.name testArrayConstructor0060
     * @tc.desc Verify Array constructor with elements and then filter function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter(x => x % 2 === 0);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(2);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0061
     * @tc.name testArrayConstructor0061
     * @tc.desc Verify Array constructor with elements and then reduce function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const sum = arr.reduce((acc : number, curr : number) => acc + curr, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0062
     * @tc.name testArrayConstructor0062
     * @tc.desc Verify Array constructor with length 1 and element that is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0);
      expect(arr.length).assertEqual(0);

      const arr2 = new Array<number>(0, 1);
      expect(arr2.length).assertEqual(2);
      expect(arr2[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0063
     * @tc.name testArrayConstructor0063
     * @tc.desc Verify Array constructor with length and then sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      const sorted = arr.sort((a, b) => (a - b).toInt());
      expect(sorted[0]).assertEqual(1);
      expect(sorted[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0064
     * @tc.name testArrayConstructor0064
     * @tc.desc Verify Array constructor with elements and then reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const reversed = arr.reverse();
      expect(reversed[0]).assertEqual(3);
      expect(reversed[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0091
     * @tc.name testArrayConstructor0091
     * @tc.desc Verify Array constructor with large number of elements (1000)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0091', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const elements: number[] = [];
      for (let i = 0; i < 1000; i++) {
        elements.push(i);
      }
      const arr : number[] = [...elements];
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0093
     * @tc.name testArrayConstructor0093
     * @tc.desc Verify Array constructor with elements and then spread operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const newArr = [...arr, 4, 5];
      expect(newArr.length).assertEqual(5);
      expect(newArr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0095
     * @tc.name testArrayConstructor0095
     * @tc.desc Verify Array constructor creates array with error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0098
     * @tc.name testArrayConstructor0098
     * @tc.desc Verify Array constructor creates array with WeakMap elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const wm1 = new WeakMap<object, number|string>();
      const wm2 = new WeakMap<object, number|string>();
      const key1: GeneratedObjectLiteralInterface_1 = {};
      const key2: GeneratedObjectLiteralInterface_2 = {};
      wm1.set(key1, 'value1');
      wm2.set(key2, 100);

      const arr : WeakMap<object, number|string>[] = [wm1 as WeakMap<object, number | string>, wm2 as WeakMap<object, number | string>];
      expect(arr.length).assertEqual(2);
      expect(arr[0].get(key1)).assertEqual('value1');
      expect(arr[1].get(key2)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0099
     * @tc.name testArrayConstructor0099
     * @tc.desc Verify Array constructor creates array with WeakSet elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0100
     * @tc.name testArrayConstructor0100
     * @tc.desc Verify Array constructor with elements and then JSON stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'two', 3);
      const json = JSON.stringify(arr);
      expect(json).assertEqual('[1,"two",3]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0102
     * @tc.name testArrayConstructor0102
     * @tc.desc Verify Array constructor creates array with promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0103
     * @tc.name testArrayConstructor0103
     * @tc.desc Verify Array constructor with elements and then isArray check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(1, 2, 3);
      expect(Array.isArray(arr)).assertEqual(true);
      expect(Array.isArray({} as GeneratedObjectLiteralInterface_1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0104
     * @tc.name testArrayConstructor0104
     * @tc.desc Verify Array constructor with length and then isArray check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testArrayConstructor0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = new Array<number>(5);
      expect(Array.isArray(arr)).assertEqual(true);
      expect(Array.isArray('not array')).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_Constructor_0105
     * @tc.name testArrayConstructor0105
     * @tc.desc Verify Array constructor creates array with typed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intArr = new Int32Array([1, 2, 3]);
      const floatArr = new Float64Array([4.5, 5.5]);
      const arr = new Array<Int32Array | Float64Array>(intArr, floatArr);
      expect(arr.length).assertEqual(2);
      expect((arr[0] as Int32Array)[2]).assertEqual(3);
      expect((arr[1] as Float64Array)[0]).assertEqual(4.5);
    });

  })
}