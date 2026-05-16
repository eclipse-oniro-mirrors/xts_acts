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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { FlatObj } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS';

export default function builtinsArrayForEachTest() {
  describe('BuiltinsArrayForEachTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   builtinsArrayForEachTest1001
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0100
     * @tc.desc   Verify basic element iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayForEachTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.from(collections.Array.from([1, 2, 3]));
      const logs = Array.from(collections.Array.from<number>([]));
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   builtinsArrayForEachTest1002
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0200
     * @tc.desc   Verify array modification during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayForEachTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(collections.Array.from([1, 2, 3]));
      arr.forEach((x, i) => {
        arr[i] = x * 2;
      });
      expect(arr).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   builtinsArrayForEachTest1003
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0300
     * @tc.desc   Verify element deletion handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayForEachTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.from(collections.Array.from([1, 2, 3]));
      arr.forEach((x, i) => {
        if (x === 2) {
          arr.splice(i, 1);
        }
      });
      expect(JSON.stringify(arr)).assertEqual('[1,3]');
    });

    /**
     * @tc.name   builtinsArrayForEachTest1004
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0400
     * @tc.desc   Verify sparse array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayForEachTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, , 3]);
      const logs = collections.Array.from<number | null>([]);
      arr.forEach(x => logs.push(x ?? null!));
      const expected = collections.Array.from([1, null, 3]);
      expect(logs).assertDeepEquals(expected);
    });

    /**
     * @tc.name   builtinsArrayForEachTest1005
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0500
     * @tc.desc   Verify empty array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayForEachTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let callCount = 0;
      [].forEach((x) => {
        console.log('builtinsArrayForEachTest1007:', x)
        callCount++
      });
      expect(callCount).assertEqual(0);
    });


    /**
     * @tc.name   builtinsArrayForEachTest1006
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0600
     * @tc.desc   Verify string array iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayForEachTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from(['abc', 'bcd', 'cde']);
      const logs = collections.Array.from<string>([]);
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals(arr);
    });

  });
}