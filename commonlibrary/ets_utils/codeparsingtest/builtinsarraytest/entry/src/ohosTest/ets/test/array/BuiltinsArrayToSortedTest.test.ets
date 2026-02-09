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
import { toSortedRes } from "../../testability/pages/JsMethodTest";
import { sleep } from "../../testability/pages/Utils";

export default function builtinsArrayToSortedTest() {
  describe('builtinsArrayToSortedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);;
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
     * @tc.name   builtinsArrayToSortedTest1001
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0100
     * @tc.desc   Verify default numeric ascending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayToSortedTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(toSortedRes([3, 1, 2])).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1002
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0200
     * @tc.desc   Test custom descending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const input = [3, 1, 2];
      const result: number[] = toSortedRes(input, (a: number, b: number) => b - a);
      expect(result).assertDeepEquals([3, 2, 1]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1003
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0300
     * @tc.desc   Test empty array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const emptyArr: number[] = [];
      expect(toSortedRes(emptyArr)).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1004
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0400
     * @tc.desc   Verify single-element array remains unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(toSortedRes([5])).assertDeepEquals([5]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1005
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0500
     * @tc.desc   Handle sparse arrays with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparseArr = [1, , 3];
      expect(toSortedRes(sparseArr)).assertDeepEquals([1, 3, undefined]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1006
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0600
     * @tc.desc   Sort null/undefined per default coercion rules
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, null, undefined, 3];
      expect(toSortedRes(arr)).assertDeepEquals([1, 3, null, undefined]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1007
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0700
     * @tc.desc   Validate lexicographical string sorting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const months = ["Mar", "Jan", "Feb", "Dec"];
      expect(toSortedRes(months)).assertDeepEquals(['Dec', 'Feb', 'Jan', 'Mar']);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1008
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0800
     * @tc.desc   Sort nested arrays with custom element comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[3], [1], [2]];
      expect(toSortedRes(arr, (a: number[], b: number[]) => a[0] - b[0]))
        .assertDeepEquals([[1], [2], [3]]);
    });

    /**
     * @tc.name   builtinsArrayToSortedTest1009
     * @tc.number SUB_BUILTINS_ARRAY_TOSORTED_TEST_0900
     * @tc.desc   Ensure new array instance is returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayToSortedTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = [3, 1, 2];
      const sorted: number[] = toSortedRes(original);
      expect(sorted === original).assertFalse();
    });

  });
}