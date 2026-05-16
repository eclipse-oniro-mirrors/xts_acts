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

export default function BuiltinsArrayReduceRightTest(): void {
  describe("BuiltinsArrayReduceRightTest", () => {
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
     * @tc.name    builtinsArrayReduceRightTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0100
     * @tc.desc    Verify reduceRight() - basic functionality with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReduceRightTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.reduceRight((acc, value) => acc + value);
      const expected = 15;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0200
     * @tc.desc    Verify reduceRight() - empty array throws error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReduceRightTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      expect(() => {
        arr.reduceRight((acc, value) => acc + value);
      }).assertThrow("Reduce of empty array with no initial value");
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0300
     * @tc.desc    Verify reduceRight() - single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayReduceRightTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.of<number>(42);
      const result = arr.reduceRight((acc, value) => acc + value);
      const expected = 42;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0400
     * @tc.desc    Verify reduceRight() - using all callback parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      let indices: number[] = [];
      const result = arr.reduceRight((acc, value, index, array) => {
        indices.push(index);
        return acc + value + array.length;
      });
      const expected = 12;
      const expectedIndices = [1, 0];

      expect(result).assertEqual(expected);
      expect(indices.length).assertEqual(expectedIndices.length);
      for (let i = 0; i < indices.length; i++) {
        expect(indices[i]).assertEqual(expectedIndices[i]);
      }
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0500
     * @tc.desc    Verify reduceRight() - string array concatenation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["a", "b", "c", "d"];
      const result = arr.reduceRight((acc, value) => acc + value);
      const expected = "dcba";

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0600
     * @tc.desc    Verify reduceRight() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true, true];
      const result = arr.reduceRight((acc, value) => acc && value);
      const expected = false;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0700
     * @tc.desc    Verify reduceRight() - original array remains unchanged
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
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

      arr.reduceRight((acc, value) => acc + value);

      expect(arr.length).assertEqual(original.length);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0800
     * @tc.desc    Verify reduceRight() - complex reduction logic
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 5;
      arr[1] = 3;
      arr[2] = 8;
      arr[3] = 1;
      arr[4] = 7;
      const result = arr.reduceRight((acc, value) => {
        return value > acc ? value : acc;
      });
      const expected = 8;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_0900
     * @tc.desc    Verify reduceRight() - multiplication
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 2;
      arr[1] = 3;
      arr[2] = 4;
      const result = arr.reduceRight((acc, value) => acc * value);
      const expected = 24;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayReduceRightTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1000
     * @tc.desc    Verify reduceRight() - subtraction (order matters)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayReduceRightTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 5;
      arr[2] = 3;
      const result = arr.reduceRight((acc, value) => acc - value);
      const expected = -12; // 3 - 5 - 10 = -12

      expect(result).assertEqual(expected);
    });
  });
}