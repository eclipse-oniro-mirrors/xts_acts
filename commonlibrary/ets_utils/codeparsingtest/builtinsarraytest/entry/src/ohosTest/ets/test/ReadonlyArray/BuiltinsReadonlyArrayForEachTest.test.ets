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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { FlatObj } from '../../testability/pages/DataFlg';
import { ReadonlyArrayTest, sleep } from '../../testability/pages/TsMethodTest';

export default function builtinsReadonlyArrayForEachTest() {
  describe('BuiltinsReadonlyArrayForEachTest', () => {
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0100
     * @tc.name builtinsReadonlyArrayForEachTest1001
     * @tc.desc Verify basic element iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsReadonlyArrayForEachTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: readonly number[] = [1, 2, 3];
      const logs: number[] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0200
     * @tc.name builtinsReadonlyArrayForEachTest1002
     * @tc.desc Verify parameters index and ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly number[] = [1, 2, 3];
      const logs: [number, number, readonly number[]][] = [];
      arr.forEach((x, i, a) => logs.push([i, x, a]));
      expect(logs).assertDeepEquals([
        [0, 1, [1, 2, 3]],
        [1, 2, [1, 2, 3]],
        [2, 3, [1, 2, 3]]
      ]);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0300
     * @tc.name builtinsReadonlyArrayForEachTest1003
     * @tc.desc Verify ReadonlyArray modification during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new ReadonlyArrayTest<number>([1, 2, 3])
      arr.forEach((x: number, i: number) => {
        arr[i] = x * 2
      });
      expect(arr).assertDeepEquals({
        "0": 2,
        "1": 4,
        "2": 6,
        "arr": [1, 2, 3]
      });
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0500
     * @tc.name builtinsReadonlyArrayForEachTest1005
     * @tc.desc Verify sparse ReadonlyArray handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly (number | undefined)[] = [1, , 3];
      const logs: number[] = [];
      arr.forEach(x => logs.push(x!));
      expect(logs).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0600
     * @tc.name builtinsReadonlyArrayForEachTest1006
     * @tc.desc Verify nested ReadonlyArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly (number | readonly (number | undefined)[])[] = [1, [, 3], 4];
      const logs: string[] = [];
      arr.forEach(x => {
        console.log('builtinsReadonlyArrayForEachTest1006:', x.toString());
        logs.push(x.toString());
      });
      expect(String(logs)).assertEqual('1,,3,4');
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0700
     * @tc.name builtinsReadonlyArrayForEachTest1007
     * @tc.desc Verify empty ReadonlyArray handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly number[] = [];
      let callCount = 0;
      arr.forEach((x) => {
        console.log('builtinsReadonlyArrayForEachTest1007:', x);
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0800
     * @tc.name builtinsReadonlyArrayForEachTest1008
     * @tc.desc Verify iteration over nested empty ReadonlyArrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly (number | readonly number[])[] = [[], [1], [2]];
      const logs: (number | readonly number[])[] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals([[], [1], [2]]);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_0900
     * @tc.name builtinsReadonlyArrayForEachTest1009
     * @tc.desc Verify null/undefined handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly (number | null | readonly (number | undefined)[])[] = [null, [undefined, 3]];
      const logs: string[] = [];
      arr.forEach(x => {
        console.log(x?.toString());
        logs.push(String(x));
      });
      expect(logs).assertDeepEquals(['null', ',3']);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_1000
     * @tc.name builtinsReadonlyArrayForEachTest1010
     * @tc.desc Verify object element handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: FlatObj = {
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      };
      const arr: readonly FlatObj[] = [obj];
      let receivedObj: FlatObj | undefined = obj;
      arr.forEach(x => receivedObj = x);
      expect(receivedObj).assertDeepEquals(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_FOREACH_TEST_1100
     * @tc.name builtinsReadonlyArrayForEachTest1011
     * @tc.desc Verify string ReadonlyArray iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayForEachTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: readonly string[] = ['abc', 'bcd', 'cde'];
      const logs: string[] = [];
      arr.forEach(x => logs.push(x));
      expect(logs).assertDeepEquals(arr);
    });

  });
}
