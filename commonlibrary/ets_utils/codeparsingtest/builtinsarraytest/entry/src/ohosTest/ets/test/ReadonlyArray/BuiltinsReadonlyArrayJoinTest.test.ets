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
import { PropParam } from "../../testability/pages/DataFlg";
import { sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsReadonlyArrayJoinTest() {
  describe('BuiltinsReadonlyArrayJoinTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(50);;
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
     * @tc.name   builtinsReadonlyArrayJoinTest1001
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0100
     * @tc.desc   Test basic join with empty separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('builtinsReadonlyArrayJoinTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.join('')).assertEqual('123');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1002
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0200
     * @tc.desc   Test hyphen separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1003
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0300
     * @tc.desc   Test sparse array with empty separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly (number | undefined)[] = [1, , 3];
      expect(sparseArr.join('')).assertEqual('13');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1004
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0400
     * @tc.desc   Test sparse array with hyphen separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly (number | undefined)[] = [1, , 3];
      expect(sparseArr.join('-')).assertEqual('1--3');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1005
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0500
     * @tc.desc   Test null/undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly (string | undefined | null)[] = [null, undefined, 'a'];
      expect(sparseArr.join('')).assertEqual('a');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1006
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0600
     * @tc.desc   Test NaN element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly number[] = [NaN];
      expect(sparseArr.join('')).assertEqual('NaN');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1007
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0700
     * @tc.desc   Test undefined separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly number[] = [1, 2, 3];
      expect(sparseArr.join(undefined)).assertEqual('1,2,3');
      expect(sparseArr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1008
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0800
     * @tc.desc   Test '' char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly number[] = [1, 2, 3];
      expect(sparseArr.join('')).assertEqual('123');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1009
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0900
     * @tc.desc   Test empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly [] = [];
      expect(sparseArr.join('')).assertEqual('');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1010
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1000
     * @tc.desc   Test all undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly undefined[] = [undefined, undefined];
      expect(sparseArr.join('')).assertEqual('');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1011
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1100
     * @tc.desc   Test ',' separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr: readonly number[] = [1, 2, 3];
      expect(sparseArr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1012
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1200
     * @tc.desc   Test mixed types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const prop: PropParam = {
        prop: "value"
      };
      let arr: readonly (string | number | boolean | PropParam)[] = ["apple", 123, true, prop];
      expect(arr.join(',')).assertEqual('apple,123,true,[object Object]');
    });

    /**
     * @tc.name   builtinsReadonlyArrayJoinTest1013
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1300
     * @tc.desc   Test special characters separator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('builtinsReadonlyArrayJoinTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      const sep1 = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(arr.join(sep1)).assertEqual(`1${sep1}2${sep1}3`);
      let arr1: readonly number[] = [1, 2, 3];
      expect(arr1.join(undefined)).assertEqual('1,2,3');
      const arr2: readonly string[] = ['a', 'b', 'c'];
      expect(arr2.join('null')).assertEqual('anullbnullc');
      const emojiSep = '👍😊';
      const arr3: readonly string[] = ['Hello', 'World'];
      expect(arr3.join(emojiSep))
        .assertEqual(`Hello${emojiSep}World`);
      const arr4: readonly string[] = ['a', 'b'];
      const sep2 = '\uD83D\uDC04';
      expect(arr4.join(sep2)).assertEqual(`a${sep2}b`);
    });
  });
}