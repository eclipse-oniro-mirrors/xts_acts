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

export default function BuiltinsArrayConcatTest(): void {
  describe('BuiltinsArrayConcatTest', () => {
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
     * @tc.name    builtinsArrayConcatTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0100
     * @tc.desc    Verify concat with empty array and empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConcatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [];
      const arr2: number[] = [];

      const result = arr1.concat(arr2);

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0200
     * @tc.desc    Verify concat with empty array and non-empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConcatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [];
      const arr2: number[] = [1, 2, 3];

      const result = arr1.concat(arr2);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0300
     * @tc.desc    Verify concat with non-empty array and empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConcatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [];

      const result = arr1.concat(arr2);

      expect(result.length).assertEqual(3);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0400
     * @tc.desc    Verify concat with non-empty array and non-empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConcatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];

      const result = arr1.concat(arr2);

      expect(result.length).assertEqual(6);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
      expect(result.$_get(3)).assertEqual(4);
      expect(result.$_get(4)).assertEqual(5);
      expect(result.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0500
     * @tc.desc    Verify concat with multiple arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayConcatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr1: number[] = [1, 2];
      const arr2: number[] = [3, 4];
      const arr3: number[] = [5, 6];

      const result = arr1.concat(arr2, arr3);

      expect(result.length).assertEqual(6);
      expect(result.$_get(0)).assertEqual(1);
      expect(result.$_get(1)).assertEqual(2);
      expect(result.$_get(2)).assertEqual(3);
      expect(result.$_get(3)).assertEqual(4);
      expect(result.$_get(4)).assertEqual(5);
      expect(result.$_get(5)).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0600
     * @tc.desc    Verify concat does not modify original array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConcatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];
      const original: number[] = [1, 2, 3];

      const result = arr1.concat(arr2);

      expect(arr1.length).assertEqual(original.length);
      for (let i = 0; i < arr1.length; i++) {
        expect(arr1.$_get(i)).assertEqual(original.$_get(i));
      }
    });

    /**
     * @tc.name    builtinsArrayConcatTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0700
     * @tc.desc    Verify concat returns a new array instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConcatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [4, 5, 6];

      const result = arr1.concat(arr2);

      expect(result).not().assertEqual(arr1);
      expect(result).not().assertEqual(arr2);
    });

    /**
     * @tc.name    builtinsArrayConcatTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_CONCAT_TEST_0800
     * @tc.desc    Verify concat with string arrays
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayConcatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1: string[] = ['apple', 'banana'];
      const arr2: string[] = ['cherry', 'date'];

      const result = arr1.concat(arr2);

      expect(result.length).assertEqual(4);
      expect(result.$_get(0)).assertEqual('apple');
      expect(result.$_get(1)).assertEqual('banana');
      expect(result.$_get(2)).assertEqual('cherry');
      expect(result.$_get(3)).assertEqual('date');
    });
  });
}