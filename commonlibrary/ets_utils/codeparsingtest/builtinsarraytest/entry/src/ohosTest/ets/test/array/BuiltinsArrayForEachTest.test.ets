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
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0100
     * @tc.name builtinsArrayForEachTest1001
     * @tc.desc Verify basic element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const logs: number[] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0200
     * @tc.name builtinsArrayForEachTest1002
     * @tc.desc Verify parameters index and array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const logs: Array<[number, number, number[]]> = [];
      arr.forEach((x, i, a) => logs.push([i, x, a]));
      expect(logs).assertDeepEquals([
        [0, 1, [1, 2, 3]],
        [1, 2, [1, 2, 3]],
        [2, 3, [1, 2, 3]]
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0300
     * @tc.name builtinsArrayForEachTest1003
     * @tc.desc Verify array modification during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      arr.forEach((x, i) => {
        arr[i] = x * 2;
      });
      expect(arr).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0400
     * @tc.name builtinsArrayForEachTest1004
     * @tc.desc Verify element deletion handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      arr.forEach((x, i) => {
        if (x === 2) {
          arr.splice(i, 1);
        }
      });
      expect(JSON.stringify(arr)).assertEqual('[1,3]');
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0500
     * @tc.name builtinsArrayForEachTest1005
     * @tc.desc Verify sparse array handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, , 3];
      const logs: number[] = [];
      arr.forEach(x => logs.push(x!));
      expect(logs).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0600
     * @tc.name builtinsArrayForEachTest1006
     * @tc.desc Verify nested array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [, 3], 4];
      const logs: string[] = [];
      arr.forEach(x => {
        console.log('builtinsArrayForEachTest1006:', x.toString())
        logs.push(x.toString())
      });
      expect(String(logs)).assertEqual('1,,3,4'); // TODO
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0700
     * @tc.name builtinsArrayForEachTest1007
     * @tc.desc Verify empty array handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let callCount = 0;
      [].forEach((x) => {
        console.log('builtinsArrayForEachTest1007:', x)
        callCount++
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0800
     * @tc.name builtinsArrayForEachTest1008
     * @tc.desc Verify iteration over nested empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[], [1], [2]];
      const logs: number[][] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals([[], [1], [2]]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_0900
     * @tc.name builtinsArrayForEachTest1009
     * @tc.desc Verify null/undefined handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, [undefined, 3]];
      const logs: string[] = [];
      arr.forEach(x => {
        console.log(x?.toString())
        logs.push(String(x))
      });
      expect(logs).assertDeepEquals(['null', ',3']); // TODO
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_1000
     * @tc.name builtinsArrayForEachTest1010
     * @tc.desc Verify object element handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FlatObj = {
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      };
      const arr = [obj];
      let receivedObj: FlatObj | undefined = obj;
      arr.forEach(x => receivedObj = x);
      expect(receivedObj).assertDeepEquals(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FOREACH_TEST_1100
     * @tc.name builtinsArrayForEachTest1011
     * @tc.desc Verify string array iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = ['abc', 'bcd', 'cde'];
      const logs: string[] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals(arr);
    });

  });
}