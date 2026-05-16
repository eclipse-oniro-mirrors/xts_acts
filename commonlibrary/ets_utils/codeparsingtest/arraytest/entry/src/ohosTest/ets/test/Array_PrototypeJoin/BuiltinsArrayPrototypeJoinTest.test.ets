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

export default function BuiltinsArrayPrototypeJoinTest(): void {
  describe("BuiltinsArrayPrototypeJoinTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(async() => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0100
     * @tc.desc   Verify join() with default comma separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result: string = arr.join();
      expect(result).assertEqual('a,b,c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0200
     * @tc.desc   Verify join() with specified separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['Wind', 'Water', 'Fire'];
      const result1: string = arr.join('-');
      const result2: string = arr.join('');
      const result3: string = arr.join(' ');
      expect(result1).assertEqual('Wind-Water-Fire');
      expect(result2).assertEqual('WindWaterFire');
      expect(result3).assertEqual('Wind Water Fire');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0300
     * @tc.desc   Verify join() returns string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [];
      const arr3: Array<string> = ['a'];
      const result1: string = arr1.join();
      const result2: string = arr2.join();
      const result3: string = arr3.join();
      expect(typeof result1 === 'string').assertTrue();
      expect(typeof result2 === 'string').assertTrue();
      expect(typeof result3 === 'string').assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0400
     * @tc.desc   Verify join() does not modify original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: string = arr.join('-');
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0500
     * @tc.desc   Verify join() with empty string separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['H', 'e', 'l', 'l', 'o'];
      const result: string = arr.join('');
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0600
     * @tc.desc   Verify join() with various string separators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result1: string = arr.join('|');
      const result2: string = arr.join('||');
      expect(result1).assertEqual('a|b|c');
      expect(result2).assertEqual('a||b||c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0700
     * @tc.desc   Verify join() with numeric separator converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result1: string = arr.join('0');
      const result2: string = arr.join('123');
      expect(result1).assertEqual('a0b0c');
      expect(result2).assertEqual('a123b123c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0800
     * @tc.desc   Verify join() with boolean separator converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result1: string = arr.join('true');
      const result2: string = arr.join('false');
      expect(result1).assertEqual('atruebtruec');
      expect(result2).assertEqual('afalsebfalsec');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_0900
     * @tc.desc   Verify join() with null separator converts to 'null' string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const separator: string | null = 'null';
      const result: string = arr.join(separator);
      expect(result).assertEqual('anullbnullc');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1000
     * @tc.desc   Verify join() with numeric elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: string = arr.join('-');
      expect(result).assertEqual('1-2-3-4-5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1100
     * @tc.desc   Verify join() with string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['hello', 'world'];
      const result: string = arr.join(' ');
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1200
     * @tc.desc   Verify join() with boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false, true];
      const result: string = arr.join(',');
      expect(result).assertEqual('true,false,true');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1300
     * @tc.desc   Verify join() with mixed type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | string | boolean | null | undefined> = [1, 'two', true, null, undefined];
      const result: string = arr.join(',');
      expect(result).assertEqual('1,two,true,,');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1400
     * @tc.desc   Verify join() on empty array returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result1: string = arr.join();
      const result2: string = arr.join('-');
      expect(result1).assertEqual('');
      expect(result2).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1500
     * @tc.desc   Verify join() on single element array does not use separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['only'];
      const result1: string = arr.join();
      const result2: string = arr.join('-');
      const result3: string = arr.join('anything');
      expect(result1).assertEqual('only');
      expect(result2).assertEqual('only');
      expect(result3).assertEqual('only');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1600
     * @tc.desc   Verify join() on two element array uses separator once
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['first', 'second'];
      const result: string = arr.join('-');
      expect(result).assertEqual('first-second');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1700
     * @tc.desc   Verify join() converts undefined elements to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number | undefined> = [1, undefined, 3];
      const result: string = arr.join('-');
      expect(result).assertEqual('1--3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1800
     * @tc.desc   Verify join() converts null elements to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number | null> = [1, null, 3];
      const result: string = arr.join('-');
      expect(result).assertEqual('1--3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_1900
     * @tc.desc   Verify join() with multiple undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<undefined> = [undefined, undefined, undefined];
      const result: string = arr.join(',');
      expect(result).assertEqual(',,');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2000
     * @tc.desc   Verify join() with multiple null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<null> = [null, null, null];
      const result: string = arr.join(',');
      expect(result).assertEqual(',,');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2100
     * @tc.desc   Verify join() with mixed undefined and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<undefined | null> = [undefined, null, undefined, null];
      const result: string = arr.join('|');
      expect(result).assertEqual('|||');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2200
     * @tc.desc   Verify join() with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      const result: string = arr.join('-');
      expect(result).assertEqual('1,2-3,4-5,6');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2300
     * @tc.desc   Verify join() with multi-dimensional nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<Array<number>>> = [[[1, 2]], [[3, 4]]];
      const result: string = arr.join('-');
      expect(result).assertEqual('1,2-3,4');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2400
     * @tc.desc   Verify join() with mixed nesting levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | number[] | number[][]> = [1, [2, 3], [[4, 5]]];
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2,3|4,5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2500
     * @tc.desc   Verify join() with empty nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[], [], []];
      const result: string = arr.join('-');
      expect(result).assertEqual('--');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2600
     * @tc.desc   Verify join() with object elements using custom toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class CustomObj {
        name: string;
        constructor(name: string) {
          this.name = name;
        }
        toString(): string {
          return this.name;
        }
      }
      const obj1: CustomObj = new CustomObj('obj1');
      const obj2: CustomObj = new CustomObj('obj2');
      const arr: Array<CustomObj> = [obj1, obj2];
      const result: string = arr.join('|');
      expect(result).assertEqual('obj1|obj2');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2700
     * @tc.desc   Verify join() with object elements using default toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class EmptyObj {}
      const obj1: EmptyObj = new EmptyObj();
      const obj2: EmptyObj = new EmptyObj();
      const arr: Array<EmptyObj> = [obj1, obj2];
      const result: string = arr.join('-');
      expect(result).assertEqual('[object Object]-[object Object]');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2800
     * @tc.desc   Verify join() with special character separators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result1: string = arr.join('\n');
      const result2: string = arr.join('\t');
      expect(result1).assertEqual('a\nb\nc');
      expect(result2).assertEqual('a\tb\tc');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_2900
     * @tc.desc   Verify join() with single undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<undefined> = [undefined];
      const result: string = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3000
     * @tc.desc   Verify join() with single null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<null> = [null];
      const result: string = arr.join();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3100
     * @tc.desc   Verify join() with single empty string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = [''];
      const result1: string = arr.join();
      const result2: string = arr.join('-');
      expect(result1).assertEqual('');
      expect(result2).assertEqual('');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3200
     * @tc.desc   Verify join() with undefined and null at different positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<string | undefined> = [undefined, 'a', 'b'];
      const arr2: Array<string | null> = ['a', 'b', null];
      const result1: string = arr1.join('-');
      const result2: string = arr2.join('-');
      expect(result1).assertEqual('-a-b');
      expect(result2).assertEqual('a-b-');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3300
     * @tc.desc   Verify join() with consecutive undefined and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string | undefined | null> = ['a', undefined, null, undefined, 'b'];
      const result: string = arr.join(',');
      expect(result).assertEqual('a,,,,b');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3400
     * @tc.desc   Verify join() works on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = typedArr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3500
     * @tc.desc   Verify join() combined with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4];
      const result: string = arr.map((x: number): number => x * 2).join('+');
      expect(result).assertEqual('2+4+6+8');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3600
     * @tc.desc   Verify join() combined with filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | null | undefined> = [1, null, 2, undefined, 3];
      const result: string = arr.filter((x: number | null | undefined): boolean => x != null).join(',');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3700
     * @tc.desc   Verify join() equals toString() without separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const joinResult: string = arr.join();
      const toStringResult: string = arr.toString();
      expect(joinResult).assertEqual('1,2,3');
      expect(toStringResult).assertEqual('1,2,3');
      expect(joinResult === toStringResult).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3800
     * @tc.desc   Verify join() combined with concat()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2];
      const arr2: Array<number> = [3, 4];
      const result: string = arr1.concat(arr2).join('|');
      expect(result).assertEqual('1|2|3|4');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_3900
     * @tc.desc   Verify join() combined with slice()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const result: string = arr.slice(1, 4).join('-');
      expect(result).assertEqual('b-c-d');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4000
     * @tc.desc   Verify join() combined with sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [3, 1, 4, 1, 5, 9];
      const sorted: Array<number> = [...arr].sort();
      const result: string = sorted.join('-');
      expect(result).assertEqual('1-1-3-4-5-9');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4100
     * @tc.desc   Verify join() combined with reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const reversed: Array<string> = [...arr].reverse();
      const result: string = reversed.join('-');
      expect(result).assertEqual('c-b-a');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4200
     * @tc.desc   Verify join() with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeArr: Array<string> = new Array(1000).fill('x');
      const result: string = largeArr.join(',');
      expect(result.length).assertEqual(1999);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4300
     * @tc.desc   Verify join() respects modified length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.length = 3;
      const result: string = arr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4400
     * @tc.desc   Verify join() with sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      arr[0] = 1;
      arr[4] = 5;
      const result: string = arr.join('-');
      expect(result).assertEqual('1----5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4500
     * @tc.desc   Verify join() with delete created sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, 2, undefined, 4, 5];
      const result: string = arr.join(',');
      expect(result).assertEqual('1,2,,4,5');
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4600
     * @tc.desc   Verify join() works on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: string = arr.join('-');
      expect(result).assertEqual('1-2-3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4700
     * @tc.desc   Verify join() result in template literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['John', 'Jane', 'Bob'];
      const message: string = `Users: ${arr.join(', ')}`;
      expect(message).assertEqual('Users: John, Jane, Bob');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4800
     * @tc.desc   Verify join() result with includes() search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['apple', 'banana', 'cherry'];
      const joined: string = arr.join(',');
      expect(joined.includes('banana')).assertTrue();
      expect(joined.includes('orange')).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_4900
     * @tc.desc   Verify join() result with regex replace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['123', '456', '789'];
      const joined: string = arr.join('-');
      const replaced: string = joined.replace(/-/g, ':');
      expect(replaced).assertEqual('123:456:789');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5000
     * @tc.desc   Verify join() result converted to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['1', '2', '3'];
      const result: number = Number(arr.join(''));
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5100
     * @tc.desc   Verify join() empty array to boolean is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      const result: boolean = Boolean(arr.join());
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5200
     * @tc.desc   Verify join() non-empty array to boolean is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a'];
      const result: boolean = Boolean(arr.join());
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5300
     * @tc.desc   Verify join() with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      const formattedArr = Array.from(typedArr).map(num => num.toFixed(1));
      const result: string = formattedArr.join('-');
      expect(result).assertEqual('1.1-2.2-3.3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5400
     * @tc.desc   Verify join() with Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int32Array = new Int32Array([10, 20, 30]);
      const result: string = typedArr.join('|');
      expect(result).assertEqual('10|20|30');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5500
     * @tc.desc   Verify join() and split() are inverse operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const str: string = arr.join('-');
      const arr2: Array<string> = str.split('-');
      expect(arr2[0]).assertEqual('a');
      expect(arr2[1]).assertEqual('b');
      expect(arr2[2]).assertEqual('c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5600
     * @tc.desc   Verify join() with object separator using custom toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class CustomSeparator {
        toString(): string {
          return '-';
        }
      }
      const arr: Array<string> = ['a', 'b', 'c'];
      const separator: CustomSeparator = new CustomSeparator();
      const result: string = arr.join(separator.toString());
      expect(result).assertEqual('a-b-c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5700
     * @tc.desc   Verify join() with array separator converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const sepArr: Array<string> = ['x', 'y'];
      const separator: string = sepArr.join(',');
      const result: string = arr.join(separator);
      expect(result).assertEqual('ax,ybx,yc');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5800
     * @tc.desc   Verify join() with nested arrays containing undefined and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number | undefined | null>> = [[undefined], [null], [1, undefined, 2]];
      const result: string = arr.join('|');
      expect(result).assertEqual('||1,,2');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_5900
     * @tc.desc   Verify join() simulated with reduce()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const reduceResult: string = arr.reduce((acc: string, val: string, idx: number): string => {
        return idx === 0 ? val : acc + '-' + val;
      }, '');
      const joinResult: string = arr.join('-');
      expect(reduceResult).assertEqual('a-b-c');
      expect(reduceResult === joinResult).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6000
     * @tc.desc   Verify join() combined with flat()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4], [5]];
      const flatArr: Array<number> = arr.reduce((acc: Array<number>, val: Array<number>): Array<number> => {
        return acc.concat(val);
      }, []);
      const result: string = flatArr.join(',');
      expect(result).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6100
     * @tc.desc   Verify join() compared with JSON.stringify()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const joinResult: string = arr.join();
      expect(joinResult).assertEqual('1,2,3');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6200
     * @tc.desc   Verify join() with sparse array having middle holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string | undefined> = [];
      arr[0] = 'first';
      arr[5] = 'last';
      const result: string = arr.join('|');
      expect(result).assertEqual('first|||||last');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6300
     * @tc.desc   Verify join() with sparse array large index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string | undefined> = [];
      arr[0] = 'start';
      arr[10] = 'end';
      const result: string = arr.join('-');
      expect(result.split('-').length).assertEqual(11);
      expect(arr.length).assertEqual(11);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6400
     * @tc.desc   Verify join() with object toString returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class NumberToStringObj {
        toString(): number {
          return 123;
        }
      }
      const obj: NumberToStringObj = new NumberToStringObj();
      const arr: Array<NumberToStringObj> = [obj];
      const result: string = arr.join();
      expect(result).assertEqual('123');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6500
     * @tc.desc   Verify join() with Chinese character separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result: string = arr.join('分隔');
      expect(result).assertEqual('a分隔b分隔c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6600
     * @tc.desc   Verify join() with array length extended creates empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.length = 5;
      const result: string = arr.join('-');
      expect(result).assertEqual('1-2-3--');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6700
     * @tc.desc   Verify join() with deeply nested mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | number[] | number[][] | number[][][]> = [1, [2, 3], [[4, 5]], [[[6]]]];
      const result: string = arr.join('|');
      expect(result).assertEqual('1|2,3|4,5|6');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6800
     * @tc.desc   Verify join() works on Float64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Float64Array = new Float64Array([1.5, 2.5, 3.5]);
      const result: string = typedArr.join('-');
      expect(result).assertEqual('1.5-2.5-3.5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_6900
     * @tc.desc   Verify join() works on Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int16Array = new Int16Array([100, 200, 300]);
      const result: string = typedArr.join('|');
      expect(result).assertEqual('100|200|300');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_7000
     * @tc.desc   Verify join() with backslash separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result: string = arr.join('\\');
      expect(result).assertEqual('a\\b\\c');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_7100
     * @tc.desc   Verify join() with null at start and undefined at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string | null | undefined> = [null, 'a', undefined];
      const result: string = arr.join('-');
      expect(result).assertEqual('-a-');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_7200
     * @tc.desc   Verify join() with single object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      class SingleObj {
        key: string;
        constructor(key: string) {
          this.key = key;
        }
      }
      const obj: SingleObj = new SingleObj('value');
      const arr: Array<SingleObj> = [obj];
      const result: string = arr.join();
      expect(result).assertEqual('[object Object]');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_TEST_7300
     * @tc.desc   Verify join() with very large array performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeArr: Array<string> = new Array(1000).fill('longstring');
      const result: string = largeArr.join('');
      expect(result.length).assertEqual(10000);
    });
  });
}
