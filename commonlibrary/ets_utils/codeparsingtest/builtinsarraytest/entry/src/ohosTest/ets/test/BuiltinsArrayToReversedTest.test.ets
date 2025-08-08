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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { TestA, TestB, TestC } from "../testability/pages/DataFlg";
import { toReversedRes } from "../testability/pages/JsMethodTest";
import { sleep } from "../testability/pages/Utils";

export default function builtinsArrayToReversedTest() {
  describe('BuiltinsArrayToReversedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0100
     * @tc.name builtinsArrayToReversedTest1001
     * @tc.desc Test number array reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([1, 2, 3, 4, 5])).assertDeepEquals([5, 4, 3, 2, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0200
     * @tc.name builtinsArrayToReversedTest1002
     * @tc.desc Test string array reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes(['apple', 'banana', 'cherry']))
        .assertDeepEquals(['cherry', 'banana', 'apple']);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0300
     * @tc.name builtinsArrayToReversedTest1003
     * @tc.desc Test empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([])).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0400
     * @tc.name builtinsArrayToReversedTest1004
     * @tc.desc Test single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([5])).assertDeepEquals([5]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0500
     * @tc.name builtinsArrayToReversedTest1005
     * @tc.desc Test sparse array handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparseArray = [1, , 3];
      expect(toReversedRes(sparseArray)).assertDeepEquals([3, undefined, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0600
     * @tc.name builtinsArrayToReversedTest1006
     * @tc.desc Test null/undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([1, null, undefined, 3]))
        .assertDeepEquals([3, undefined, null, 1]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0700
     * @tc.name builtinsArrayToReversedTest1007
     * @tc.desc Verify basic array reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let input = [1, 2, 3];
      let res: number[] = toReversedRes(input)
      expect(res).assertDeepEquals([3, 2, 1]);
      expect(input).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0800
     * @tc.name builtinsArrayToReversedTest1008
     * @tc.desc Test nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([[1, 2], [3, 4]]))
        .assertDeepEquals([[3, 4], [1, 2]]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_0900
     * @tc.name builtinsArrayToReversedTest1009
     * @tc.desc Test NaN handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toReversedRes([NaN, 2, NaN])).assertDeepEquals([NaN, 2, NaN]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_TOREVERSED_TEST_1000
     * @tc.name builtinsArrayToReversedTest1010
     * @tc.desc Test object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayToReversedTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: TestA = {
        a: 1
      };
      const obj2: TestB = {
        b: 2
      };
      const obj3: TestC = {
        c: 3
      };
      const original = [obj1, obj2, obj3];
      expect(toReversedRes(original)).assertDeepEquals([obj3, obj2, obj1]);
    });

  });
}