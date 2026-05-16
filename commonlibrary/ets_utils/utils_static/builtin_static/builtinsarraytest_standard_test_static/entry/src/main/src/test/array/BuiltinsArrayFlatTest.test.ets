/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

interface FlatObj {
  name: string;
  age: number;
  like: Array<number>
}

interface FlatParams {
  depth: number | undefined;
  expected: (number | (number | (number | number[])[])[])[] | (number | (number | number[])[])[];
}

export default function builtinsArrayFlatTest() {
  describe('BuiltinsArrayFlatTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   builtinsArrayFlatTest1001
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0100
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFlatTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = [1, [2, 3], 4];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1002
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0200
     * @tc.desc   Verify flat method returns original array when no nesting exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1003
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0300
     * @tc.desc   Verify flat method with depth=1 on multi-level nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 4], 5], 6];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, 2, [3, 4], 5, 6]));
      expect(JSON.stringify(arr.flat(-1))).assertEqual(JSON.stringify([1, [2, [3, 4], 5], 6]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1004
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0400
     * @tc.desc   Verify full flattening with depth=2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 4], 5], 6];
      expect(JSON.stringify(arr.flat(2))).assertEqual(JSON.stringify([1, 2, 3, 4, 5, 6]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1005
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0500
     * @tc.desc   Verify no flattening with depth=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 4];
      expect(JSON.stringify(arr.flat(0))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1006
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0600
     * @tc.desc   Verify handling of sparse arrays (empty slots)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, undefined, 3];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, undefined, 3]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1007
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0700
     * @tc.desc   Verify flattening nested sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [undefined, 3], 4];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, null, 3, 4]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1008
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0800
     * @tc.desc   Verify handling of mixed element types (number + string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 'hello'];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, 2, 3, 'hello']));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1009
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0900
     * @tc.desc   Verify deep flattening with mixed data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 'a']], 4];
      expect(JSON.stringify(arr.flat(2))).assertEqual(JSON.stringify([1, 2, 3, 'a', 4]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1010
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1000
     * @tc.desc   Verify empty array returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(([] as number[]).flat().length).assertEqual(0);
    });

    /**
     * @tc.name   builtinsArrayFlatTest1011
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1100
     * @tc.desc   Verify flattening of nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[][] = [[], [1], [2]];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1012
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1200
     * @tc.desc   Verify no flattening with depth=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 4];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1013
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1300
     * @tc.desc   Verify handling of null and undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, [undefined, 3]];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([null, undefined, 3]));
    });

    /**
     * @tc.name   builtinsArrayFlatTest1014
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1400
     * @tc.desc   Verify objects are not flattened
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FlatObj = {
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      };
      const arr = [obj];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([obj]));
    });
  });
}