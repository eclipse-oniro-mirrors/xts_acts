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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { sleep } from "../../testability/pages/TsMethodTest";
import { collections } from "@kit.ArkTS";

export default function builtinsConcatArrayIndexTest() {
  describe('BuiltinsConcatArrayIndexTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(100);
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

    let arr: collections.ConcatArray<number> = new collections.Array<number>(1, 2, 3, 4, 5);
    let str : collections.ConcatArray<string | undefined | null> = new collections.Array<string | undefined | null>();
    let emptyArr: collections.ConcatArray<number> = new collections.Array<number>();

    /**
     * @tc.name   builtinsConcatArrayIndexTest1001
     * @tc.number SUB_ConcatArray_INDEX_TEST_0100
     * @tc.desc   Test index 0 access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsConcatArrayIndexTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1002
     * @tc.number SUB_ConcatArray_INDEX_TEST_0200
     * @tc.desc   Test index 1 access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsConcatArrayIndexTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1003
     * @tc.number SUB_ConcatArray_INDEX_TEST_0300
     * @tc.desc   Test negative index -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[-1]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1004
     * @tc.number SUB_ConcatArray_INDEX_TEST_0400
     * @tc.desc   Test out-of-bound index 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[5]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1005
     * @tc.number SUB_ConcatArray_INDEX_TEST_0500
     * @tc.desc   Test fractional index 0.5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0.5]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1006
     * @tc.number SUB_ConcatArray_INDEX_TEST_0600
     * @tc.desc   Test empty array index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(emptyArr[0]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1007
     * @tc.number SUB_ConcatArray_INDEX_TEST_0700
     * @tc.desc   Test number 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1008
     * @tc.number SUB_ConcatArray_INDEX_TEST_0800
     * @tc.desc   Test number -0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[-0]).assertEqual(1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1009
     * @tc.number SUB_ConcatArray_INDEX_TEST_0900
     * @tc.desc   Test number NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[NaN]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1010
     * @tc.number SUB_ConcatArray_INDEX_TEST_1000
     * @tc.desc   Test number Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[Infinity]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1011
     * @tc.number SUB_ConcatArray_INDEX_TEST_1100
     * @tc.desc   Test number -Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[-Infinity]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1012
     * @tc.number SUB_ConcatArray_INDEX_TEST_1200
     * @tc.desc   Test number Math
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[Math.floor(1.5)]).assertEqual(2);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1013
     * @tc.number SUB_ConcatArray_INDEX_TEST_1300
     * @tc.desc   Test number max
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[Number.MAX_VALUE]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1014
     * @tc.number SUB_ConcatArray_INDEX_TEST_1400
     * @tc.desc   Test number min
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[Number.MIN_VALUE]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1015
     * @tc.number SUB_ConcatArray_INDEX_TEST_1500
     * @tc.desc   Test number EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[Number.EPSILON]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1016
     * @tc.number SUB_ConcatArray_INDEX_TEST_1600
     * @tc.desc   Test number 123.456
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[123.456]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1017
     * @tc.number SUB_ConcatArray_INDEX_TEST_1700
     * @tc.desc   Test number 0xcafebabe
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0xcafebabe]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1018
     * @tc.number SUB_ConcatArray_INDEX_TEST_1800
     * @tc.desc   Test number 0x0102
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0x0102]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1019
     * @tc.number SUB_ConcatArray_INDEX_TEST_1900
     * @tc.desc   Test number 0x01020304
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0x01020304]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1020
     * @tc.number SUB_ConcatArray_INDEX_TEST_2000
     * @tc.desc   Test number 0x3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr[0x3]).assertEqual(4);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1021
     * @tc.number SUB_ConcatArray_INDEX_TEST_2100
     * @tc.desc   Test special characters index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const index = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect((str as Array<string>).indexOf(index)).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1022
     * @tc.number SUB_ConcatArray_INDEX_TEST_2200
     * @tc.desc   Test undefined index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str[1]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1023
     * @tc.number SUB_ConcatArray_INDEX_TEST_2300
     * @tc.desc   Test null index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(str[2]).assertUndefined();
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1024
     * @tc.number SUB_ConcatArray_INDEX_TEST_2400
     * @tc.desc   Test string "0" & "NaN" index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect((str as Array<string>).indexOf("0")).assertEqual(-1);
      expect((str as Array<string>).indexOf("NaN")).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1025
     * @tc.number SUB_ConcatArray_INDEX_TEST_2500
     * @tc.desc   Test empty string index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect((str as Array<string>).indexOf("")).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1026
     * @tc.number SUB_ConcatArray_INDEX_TEST_2600
     * @tc.desc   Test Unicode index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        expect((str as Array<string>).indexOf("\uD83D\uDC46")).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1027
     * @tc.number SUB_ConcatArray_INDEX_TEST_2700
     * @tc.desc   Test invalid Unicode index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        expect((str as Array<string>).indexOf("\uDC04")).assertEqual(-1);
    });

    /**
     * @tc.name   builtinsConcatArrayIndexTest1028
     * @tc.number SUB_ConcatArray_INDEX_TEST_2800
     * @tc.desc   Test "\a" index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsConcatArrayIndexTest1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
        expect((str as Array<string>).indexOf("\a")).assertEqual(-1);
    });
  });
}