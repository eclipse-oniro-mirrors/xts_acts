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

export default function BuiltinsArrayWithTest(): void {
  describe("BuiltinsArrayWithTest", () => {
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
     * @tc.name    builtinsArrayWithTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0100
     * @tc.desc    Verify with() - replace element at middle index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayWithTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];

      const result = arr.with(2, 10);
      const expected: number[] = [1, 2, 10, 4, 5];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0200
     * @tc.desc    Verify with() - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayWithTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const original: number[] = [1, 2, 3, 4, 5];

      const result = arr.with(2, 10);

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0300
     * @tc.desc    Verify with() - returns new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayWithTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      const result = arr.with(1, 10);

      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.name    builtinsArrayWithTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0400
     * @tc.desc    Verify with() - replace first element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(0, 100);
      const expected: number[] = [100, 2, 3, 4, 5];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0500
     * @tc.desc    Verify with() - replace last element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(4, 999);
      const expected: number[] = [1, 2, 3, 4, 999];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0600
     * @tc.desc    Verify with() - negative index (valid)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(-2, 200);
      const expected: number[] = [1, 2, 3, 200, 5];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0700
     * @tc.desc    Verify with() - negative index equals array length (invalid)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.with(-4, 10);
      }).assertThrow("Invalid index");
    });

    /**
     * @tc.name    builtinsArrayWithTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0800
     * @tc.desc    Verify with() - index equals array length (invalid)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.with(3, 10);
      }).assertThrow("Invalid index");
    });

    /**
     * @tc.name    builtinsArrayWithTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_0900
     * @tc.desc    Verify with() - negative index equals -1 (last element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(-1, 500);
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 1;
      expected[1] = 2;
      expected[2] = 3;
      expected[3] = 4;
      expected[4] = 500;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1000
     * @tc.desc    Verify with() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.with(0, 99);
      const expected = Array.of<number>(99);

      expect(result.length).assertEqual(expected.length);
      expect(result.$_get(0)).assertEqual(expected.$_get(0));
    });

    /**
     * @tc.name    builtinsArrayWithTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1100
     * @tc.desc    Verify with() - string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["apple", "banana", "cherry"];

      const result = arr.with(1, "orange");
      const expected: string[] = ["apple", "orange", "cherry"];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1200
     * @tc.desc    Verify with() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true];

      const result = arr.with(1, true);
      const expected: boolean[] = [true, true, true];

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1300
     * @tc.desc    Verify with() - chained calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(0, 10).with(4, 50).with(2, 30);
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 10;
      expected[1] = 2;
      expected[2] = 30;
      expected[3] = 4;
      expected[4] = 50;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayWithTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1400
     * @tc.desc    Verify with() - negative index -1 on single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.with(-1, 99);
      const expected = Array.of<number>(99);

      expect(result.length).assertEqual(expected.length);
      expect(result.$_get(0)).assertEqual(expected.$_get(0));
    });

    /**
     * @tc.name    builtinsArrayWithTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1500
     * @tc.desc    Verify with() - negative index equals -array.length (first element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.with(-5, 999);
      const expected: number[] = Array.create<number>(5, 0);
      expected[0] = 999;
      expected[1] = 2;
      expected[2] = 3;
      expected[3] = 4;
      expected[4] = 5;

      expect(result.length).assertEqual(expected.length);
      for (let i = 0; i < result.length; i++) {
        expect(result.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayWithTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_WITH_TEST_1600
     * @tc.desc    Verify with() - negative index less than -array.length (invalid)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayWithTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      expect(() => {
        arr.with(-6, 10);
      }).assertThrow("Invalid index");
    });
  });
}
