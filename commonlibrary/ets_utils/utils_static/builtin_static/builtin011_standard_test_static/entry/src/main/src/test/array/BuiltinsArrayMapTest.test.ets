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

export default function BuiltinsArrayMapTest(): void {
  describe("BuiltinsArrayMapTest", () => {
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
     * @tc.name    builtinsArrayMapTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0100
     * @tc.desc    Verify map() - basic functionality with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayMapTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.map((value) => value * 2);
      const expected: number[] = Array.create<number>(5, 0);
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
     * @tc.name    builtinsArrayMapTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0200
     * @tc.desc    Verify map() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayMapTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.map((value) => value * 2);

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayMapTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0300
     * @tc.desc    Verify map() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayMapTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.of<number>(42);
      const result = arr.map((value) => value + 10);
      const expected = Array.of<number>(52);

      expect(result.length).assertEqual(expected.length);
      expect(result.$_get(0)).assertEqual(expected.$_get(0));
    });

    /**
     * @tc.name    builtinsArrayMapTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0400
     * @tc.desc    Verify map() - using all callback parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.map((value, index, array) => {
        return value + index + array.length;
      });
      const expected: number[] = Array.create<number>(3, 0);
      expected[0] = 4;
      expected[1] = 6;
      expected[2] = 8;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayMapTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0500
     * @tc.desc    Verify map() - string array transformation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["apple", "banana", "cherry"];
      const result = arr.map((value) => value.toUpperCase());
      const expected: string[] = ["APPLE", "BANANA", "CHERRY"];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayMapTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0600
     * @tc.desc    Verify map() - boolean array transformation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true];
      const result = arr.map((value) => !value);
      const expected: boolean[] = [false, true, false];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayMapTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0700
     * @tc.desc    Verify map() - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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

      const result = arr.map((value) => value * 2);

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayMapTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0800
     * @tc.desc    Verify map() - returns new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.map((value) => value);

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayMapTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_0900
     * @tc.desc    Verify map() - chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.map((value) => value * 2).map((value) => value + 1);
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 3;
      expected[1] = 5;
      expected[2] = 7;
      expected[3] = 9;
      expected[4] = 11;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayMapTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_MAP_TEST_1000
     * @tc.desc    Verify map() - mapping to different type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayMapTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.map((value) => `Number: ${value}`);
      const expected: string[] = Array.create<string>(3, "");
      expected[0] = "Number: 1";
      expected[1] = "Number: 2";
      expected[2] = "Number: 3";

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });
  });
}