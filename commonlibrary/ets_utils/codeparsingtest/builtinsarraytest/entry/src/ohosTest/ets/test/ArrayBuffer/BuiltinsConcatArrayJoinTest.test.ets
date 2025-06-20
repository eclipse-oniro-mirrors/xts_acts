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
import { ConcatArrayTest, sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsConcatArrayJoinTest() {
  describe('BuiltinsConcatArrayJoinTest', () => {
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

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0100
     * @tc.name builtinsConcatArrayJoinTest1001
     * @tc.desc Test basic join with empty separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsConcatArrayJoinTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3]);
      expect(arr.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0200
     * @tc.name builtinsConcatArrayJoinTest1002
     * @tc.desc Test hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3]);
      expect(arr.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0300
     * @tc.name builtinsConcatArrayJoinTest1003
     * @tc.desc Test sparse array with empty separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number | undefined>([1, , 3]);
      expect(sparseArr.join('')).assertEqual('13');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0400
     * @tc.name builtinsConcatArrayJoinTest1004
     * @tc.desc Test sparse array with hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number | undefined>([1, , 3]);
      expect(sparseArr.join('-')).assertEqual('1--3');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0500
     * @tc.name builtinsConcatArrayJoinTest1005
     * @tc.desc Test null/undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<string | undefined | null>([null, undefined, 'a']);
      expect(sparseArr.join('')).assertEqual('a');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0600
     * @tc.name builtinsConcatArrayJoinTest1006
     * @tc.desc Test NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number>([NaN]);
      expect(sparseArr.join('')).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0700
     * @tc.name builtinsConcatArrayJoinTest1007
     * @tc.desc Test undefined separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number>([1, 2, 3]);
      expect(sparseArr.join(undefined)).assertEqual('1,2,3');
      expect(sparseArr.join()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0800
     * @tc.name builtinsConcatArrayJoinTest1008
     * @tc.desc Test '' char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number>([1, 2, 3]);
      expect(sparseArr.join('')).assertEqual('123');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_0900
     * @tc.name builtinsConcatArrayJoinTest1009
     * @tc.desc Test empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest([]);
      expect(sparseArr.join('')).assertEqual('');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1000
     * @tc.name builtinsConcatArrayJoinTest1010
     * @tc.desc Test all undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest([undefined, undefined]);
      expect(sparseArr.join('')).assertEqual('');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1100
     * @tc.name builtinsConcatArrayJoinTest1011
     * @tc.desc Test ',' separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number>([1, 2, 3]);
      expect(sparseArr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1200
     * @tc.name builtinsConcatArrayJoinTest1012
     * @tc.desc Test mixed types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const prop: PropParam = {
        prop: "value"
      };
      let arr = new ConcatArrayTest<string | number | boolean | PropParam>(["apple", 123, true, prop]);
      expect(arr.join(',')).assertEqual('apple,123,true,[object Object]');
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_JOIN_TEST_1300
     * @tc.name builtinsConcatArrayJoinTest1013
     * @tc.desc Test special characters separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayJoinTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3]);
      const sep1 = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(arr.join(sep1)).assertEqual(`1${sep1}2${sep1}3`);
      let arr1 = new ConcatArrayTest<number>([1, 2, 3]);
      expect(arr1.join(undefined)).assertEqual('1,2,3');
      const arr2 = new ConcatArrayTest<string>(['a', 'b', 'c']);
      expect(arr2.join('null')).assertEqual('anullbnullc');
      const emojiSep = '👍😊';
      const arr3 = new ConcatArrayTest<string>(['Hello', 'World']);
      expect(arr3.join(emojiSep))
        .assertEqual(`Hello${emojiSep}World`);
      const arr4 = new ConcatArrayTest<string>(['a', 'b']);
      const sep2 = '\uD83D\uDC04';
      expect(arr4.join(sep2)).assertEqual(`a${sep2}b`);
    });
  });
}