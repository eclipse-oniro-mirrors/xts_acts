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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayReverseTest() : void{
  describe("BuiltinsArrayReverseTest", ()=> {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayReverseTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0100
     * @tc.desc    Verify reverse() - reverse array in place with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.reverse();
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 5;
      expected[1] = 4;
      expected[2] = 3;
      expected[3] = 2;
      expected[4] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0200
     * @tc.desc    Verify reverse() - returns the same array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const result = arr.reverse();

      expect(result).assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0300
     * @tc.desc    Verify reverse() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.reverse();

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0400
     * @tc.desc    Verify reverse() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.reverse();

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayReverseTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0500
     * @tc.desc    Verify reverse() - two elements array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;

      const result = arr.reverse();
      const expected: number[] = Array.create<number>(2, 0);
      expected[0] = 2;
      expected[1] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0600
     * @tc.desc    Verify reverse() - array with duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(6, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 2;
      arr[3] = 3;
      arr[4] = 3;
      arr[5] = 3;

      const result = arr.reverse();
      const expected: number[] = Array.create<number>(6, 0);
      expected[0] = 3;
      expected[1] = 3;
      expected[2] = 3;
      expected[3] = 2;
      expected[4] = 2;
      expected[5] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0700
     * @tc.desc    Verify reverse() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(3, "");
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";

      const result = arr.reverse();
      const expected: string[] = Array.create<string>(3, "");
      expected[0] = "cherry";
      expected[1] = "banana";
      expected[2] = "apple";

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0800
     * @tc.desc    Verify reverse() - reverse twice returns original order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const original: number[] = Array.create<number>(5, 0);
      original[0] = 1;
      original[1] = 2;
      original[2] = 3;
      original[3] = 4;
      original[4] = 5;

      arr.reverse();
      arr.reverse();

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_0900
     * @tc.desc    Verify toReversed() - returns new reversed array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.toReversed();
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 5;
      expected[1] = 4;
      expected[2] = 3;
      expected[3] = 2;
      expected[4] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1000
     * @tc.desc    Verify toReversed() - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const original: number[] = Array.create<number>(5, 0);
      original[0] = 1;
      original[1] = 2;
      original[2] = 3;
      original[3] = 4;
      original[4] = 5;

      const result = arr.toReversed();

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1100
     * @tc.desc    Verify toReversed() - returns new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReverseTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const result = arr.toReversed();

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1200
     * @tc.desc    Verify toReversed() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toReversed();

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1300
     * @tc.desc    Verify toReversed() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.toReversed();

      expect(result.length).assertEqual(1);
      expect(result.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1400
     * @tc.desc    Verify toReversed() - two elements array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;

      const result = arr.toReversed();
      const expected: number[] = Array.create<number>(2, 0);
      expected[0] = 2;
      expected[1] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1500
     * @tc.desc    Verify toReversed() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(3, "");
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";

      const result = arr.toReversed();
      const expected: string[] = Array.create<string>(3, "");
      expected[0] = "cherry";
      expected[1] = "banana";
      expected[2] = "apple";

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1600
     * @tc.desc    Verify toReversed() - array with duplicate elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(4, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 2;
      arr[3] = 3;

      const result = arr.toReversed();
      const expected: number[] = Array.create<number>(4, 0);
      expected[0] = 3;
      expected[1] = 2;
      expected[2] = 2;
      expected[3] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1700
     * @tc.desc    Verify toReversed() called twice returns original order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const original = Array.create<number>(5, 0);
      original[0] = 1;
      original[1] = 2;
      original[2] = 3;
      original[3] = 4;
      original[4] = 5;

      const result = arr.toReversed().toReversed();

      expect(result.length).assertEqual(original.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1800
     * @tc.desc    Verify reverse() then toReversed() combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const original = Array.create<number>(3, 0);
      original[0] = 1;
      original[1] = 2;
      original[2] = 3;

      arr.reverse();
      const result = arr.toReversed();
      const expected = Array.create<number>(3, 0);
      expected[0] = 1;
      expected[1] = 2;
      expected[2] = 3;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayReverseTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_1900
     * @tc.desc    Verify toReversed() then reverse() combination
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const reversed = arr.toReversed();
      reversed.reverse();
      const expected = Array.create<number>(3, 0);
      expected[0] = 1;
      expected[1] = 2;
      expected[2] = 3;

      expect(reversed.length).assertEqual(expected.length);
      for (let i = 0; i < reversed.length; i++) {
        expect(reversed.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2000
     * @tc.desc    Verify reverse() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<boolean>(4, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;
      arr[3] = false;

      const result = arr.reverse();
      const expected = Array.create<boolean>(4, false);
      expected[0] = false;
      expected[1] = true;
      expected[2] = false;
      expected[3] = true;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2100
     * @tc.desc    Verify reverse() - object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2100' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const result = arr.reverse();

      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2200
     * @tc.desc    Verify reverse() - mixed type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean)[] = Array.create<(number | string | boolean)>(4, 0);
      arr[0] = 1;
      arr[1] = "two";
      arr[2] = true;
      arr[3] = 4;

      const result = arr.reverse();
      const expected: (number | string | boolean)[] = Array.create<(number | string | boolean)>(4, 0);
      expected[0] = 4;
      expected[1] = true;
      expected[2] = "two";
      expected[3] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2300
     * @tc.desc    Verify reverse() - array with special values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | undefined | null)[] = Array.create<(number | undefined | null)>(4, 0);
      arr[0] = 1;
      arr[1] = undefined;
      arr[2] = 3;
      arr[3] = null;

      const result = arr.reverse();
      const expected: (number | undefined | null)[] = Array.create<(number | undefined | null)>(4, 0);
      expected[0] = null;
      expected[1] = 3;
      expected[2] = undefined;
      expected[3] = 1;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2400
     * @tc.desc    Verify reverse() - sparse array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2400' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 0;
      arr[2] = 3;

      const result = arr.reverse();

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2500
     * @tc.desc    Verify reverse() - large array performance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayReverseTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const largeArray: number[] = [];
      for (let i = 0; i < 10000; i++) {
        largeArray.push(i);
      }

      const startTime = Date.now();
      const result = largeArray.reverse();
      const endTime = Date.now();
      const timeTaken = endTime - startTime;

      expect(result.length).assertEqual(10000);
      expect(result.$_get(0)).assertEqual(9999);
      expect(result.$_get(9999)).assertEqual(0);
      console.log(`Large array reverse time: ${timeTaken}ms`);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2600
     * @tc.desc    Verify reverse() - chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.reverse().map((num) => num * 2).reverse();
      const expected = Array.create<number>(5, 0);
      expected[0] = 2;
      expected[1] = 4;
      expected[2] = 6;
      expected[3] = 8;
      expected[4] = 10;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReverseTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2700
     * @tc.desc    Verify toReversed() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true, false];

      const result = arr.toReversed();
      const expected: boolean[] = [false, true, false, true];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2800
     * @tc.desc    Verify toReversed() - object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2800' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];

      const result = arr.toReversed();

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayReverseTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_REVERSE_TEST_2900
     * @tc.desc    Verify toReversed() - mixed type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReverseTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (number | string | boolean)[] = [1, "two", true, 4];

      const result = arr.toReversed();
      const expected: (number | string | boolean)[] = [4, true, "two", 1];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(1);
    });
  });
}
