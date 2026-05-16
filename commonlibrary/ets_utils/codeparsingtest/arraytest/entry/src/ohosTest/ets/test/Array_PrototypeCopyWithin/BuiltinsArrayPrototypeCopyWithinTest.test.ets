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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

export default function BuiltinsArrayPrototypeCopyWithinTest(): void {
  describe("BuiltinsArrayPrototypeCopyWithinTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0100
     * @tc.desc   Verify copyWithin() with only target parameter copies from index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(2, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0200
     * @tc.desc   Verify copyWithin() with target 0 returns same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0300
     * @tc.desc   Verify copyWithin() with target at last index copies only first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(4, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0400
     * @tc.desc   Verify copyWithin(target, start) with two parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0500
     * @tc.desc   Verify copyWithin(target, start) when start > target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(1, 3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0600
     * @tc.desc   Verify copyWithin(target, start, end) with all three parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3, 4);
      expect(result[0]).assertEqual(4);

      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0700
     * @tc.desc   Verify copyWithin() with end before start does not copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3, 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0800
     * @tc.desc   Verify copyWithin() with end equal to start does not copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_0900
     * @tc.desc   Verify copyWithin() copies a middle range of elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(1, 2, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1000
     * @tc.desc   Verify copyWithin() with target equal to array length does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(5, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1100
     * @tc.desc   Verify copyWithin() with target greater than array length does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(10, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1200
     * @tc.desc   Verify copyWithin() with start equal to array length does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1300
     * @tc.desc   Verify copyWithin() with start greater than array length does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 10);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1400
     * @tc.desc   Verify copyWithin() with end equal to array length copies to end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 5);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1500
     * @tc.desc   Verify copyWithin() with end greater than array length defaults to length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 10);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1600
     * @tc.desc   Verify copyWithin() with end 0 before start does not copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1700
     * @tc.desc   Verify copyWithin() with overlapping source and target regions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(2, 0, 4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1800
     * @tc.desc   Verify copyWithin() with fully overlapping regions returns unchanged array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0, 3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_1900
     * @tc.desc   Verify copyWithin() with target before source region
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2000
     * @tc.desc   Verify copyWithin(0, 0, 0) with all zeros does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2100
     * @tc.desc   Verify copyWithin() copies content truncated at array boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(3, 0, 3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2200
     * @tc.desc   Verify copyWithin() with target -1 points to last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-1, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2300
     * @tc.desc   Verify copyWithin() with target -2 points to second-to-last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-2, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2400
     * @tc.desc   Verify copyWithin() with target less than negative array length defaults to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-10, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2500
     * @tc.desc   Verify copyWithin() with start -1 starts from last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, -1);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2600
     * @tc.desc   Verify copyWithin() with start -3 starts from third-to-last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, -3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2700
     * @tc.desc   Verify copyWithin() with start less than negative array length defaults to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, -10);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2800
     * @tc.desc   Verify copyWithin() with end -1 excludes last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 1, -1);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_2900
     * @tc.desc   Verify copyWithin() with end -3 excludes last three elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0, -3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3000
     * @tc.desc   Verify copyWithin() with end less than negative array length defaults to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0, -10);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3100
     * @tc.desc   Verify copyWithin() with mixed positive target and negative start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, -2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3200
     * @tc.desc   Verify copyWithin() with all negative parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-2, -3, -1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3300
     * @tc.desc   Verify copyWithin() on empty array returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      const result: Array<number> = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3400
     * @tc.desc   Verify copyWithin() on empty array with parameters returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      const result: Array<number> = arr.copyWithin(0, 1, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3500
     * @tc.desc   Verify copyWithin() on single element array returns same array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1];
      const result: Array<number> = arr.copyWithin(0, 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3600
     * @tc.desc   Verify copyWithin() on single element array with full range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1];
      const result: Array<number> = arr.copyWithin(0, 0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3700
     * @tc.desc   Verify copyWithin() copies undefined values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3, 4, 5];
      const result: Array<number | undefined> = arr.copyWithin(0, 1, 3);
      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3800
     * @tc.desc   Verify copyWithin() copies NaN values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, NaN, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 1, 3);
      expect(Number.isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_3900
     * @tc.desc   Verify copyWithin() copies null values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | null> = [1, null, 3, 4, 5];
      const result: Array<number | null> = arr.copyWithin(0, 1, 3);
      expect(result[0]).assertEqual(null);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4000
     * @tc.desc   Verify copyWithin() with float target truncates to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const floatTarget: number = 2.7;
      const truncatedTarget: number = floatTarget | 0;
      const result: Array<number> = arr.copyWithin(truncatedTarget, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4100
     * @tc.desc   Verify copyWithin() with negative float target truncates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const floatTarget: number = -2.7;
      const truncatedTarget: number = floatTarget | 0;
      const result: Array<number> = arr.copyWithin(truncatedTarget, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4200
     * @tc.desc   Verify copyWithin() with float start truncates to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const floatStart: number = 2.9;
      const truncatedStart: number = floatStart | 0;
      const result: Array<number> = arr.copyWithin(0, truncatedStart);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4300
     * @tc.desc   Verify copyWithin() with large negative target defaults to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-100, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4400
     * @tc.desc   Verify copyWithin() with target 1 copies from index 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(1, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(3);
      expect(result[4]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4500
     * @tc.desc   Verify copyWithin() returns an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3);
      expect(result instanceof Array).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4600
     * @tc.desc   Verify copyWithin() returns same reference as original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4700
     * @tc.desc   Verify copyWithin() returns modified array content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3, 4);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4800
     * @tc.desc   Verify copyWithin() preserves array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3);
      expect(result.length).assertEqual(5);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_4900
     * @tc.desc   Verify chained copyWithin() calls work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3).copyWithin(2, 0, 2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(5);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5000
     * @tc.desc   Verify copyWithin() chained with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3).map((x: number): number => x * 2);
      expect(result[0]).assertEqual(8);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(8);
      expect(result[4]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5100
     * @tc.desc   Verify three consecutive copyWithin() calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5).copyWithin(2, 0, 2).copyWithin(4, 1, 3);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5200
     * @tc.desc   Verify copyWithin() modifies the original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 4);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5300
     * @tc.desc   Verify copyWithin() does not change array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const lengthBefore: number = arr.length;
      arr.copyWithin(0, 3);
      const lengthAfter: number = arr.length;
      expect(lengthBefore).assertEqual(lengthAfter);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5400
     * @tc.desc   Verify copyWithin() does not extend array beyond its length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.copyWithin(5, 0, 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5500
     * @tc.desc   Verify copyWithin() does not shrink array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 4);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5600
     * @tc.desc   Verify copyWithin() works on Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      typedArr.copyWithin(0, 3);
      expect(typedArr[0]).assertEqual(4);
      expect(typedArr[1]).assertEqual(5);
      expect(typedArr[2]).assertEqual(3);
      expect(typedArr[3]).assertEqual(4);
      expect(typedArr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5700
     * @tc.desc   Verify copyWithin() works on Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
      typedArr.copyWithin(0, 3, 4);
      expect(typedArr[0]).assertEqual(4);
      expect(typedArr[1]).assertEqual(2);
      expect(typedArr[2]).assertEqual(3);
      expect(typedArr[3]).assertEqual(4);
      expect(typedArr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5800
     * @tc.desc   Verify copyWithin() works on Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Float32Array = new Float32Array([1.1, 2.2, 3.3, 4.4, 5.5]);
      typedArr.copyWithin(0, 3);
      const tol: number = 0.0001;
      expect(Math.abs(typedArr[0] - 4.4) < tol).assertTrue();
      expect(Math.abs(typedArr[1] - 5.5) < tol).assertTrue();
      expect(Math.abs(typedArr[2] - 3.3) < tol).assertTrue();
      expect(Math.abs(typedArr[3] - 4.4) < tol).assertTrue();
      expect(Math.abs(typedArr[4] - 5.5) < tol).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_5900
     * @tc.desc   Verify copyWithin() works on Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      typedArr.copyWithin(1, 3, 5);
      expect(typedArr[0]).assertEqual(10);
      expect(typedArr[1]).assertEqual(40);
      expect(typedArr[2]).assertEqual(50);
      expect(typedArr[3]).assertEqual(40);
      expect(typedArr[4]).assertEqual(50);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6000
     * @tc.desc   Verify copyWithin() works on Float64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Float64Array = new Float64Array([1.1, 2.2, 3.3, 4.4, 5.5]);
      typedArr.copyWithin(0, 3);
      expect(typedArr[0]).assertEqual(4.4);
      expect(typedArr[1]).assertEqual(5.5);
      expect(typedArr[2]).assertEqual(3.3);
      expect(typedArr[3]).assertEqual(4.4);
      expect(typedArr[4]).assertEqual(5.5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6100
     * @tc.desc   Verify copyWithin() works on Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      typedArr.copyWithin(0, 3);
      expect(typedArr[0]).assertEqual(4);
      expect(typedArr[1]).assertEqual(5);
      expect(typedArr[2]).assertEqual(3);
      expect(typedArr[3]).assertEqual(4);
      expect(typedArr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6200
     * @tc.desc   Verify copyWithin() works on Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int16Array = new Int16Array([100, 200, 300, 400, 500]);
      typedArr.copyWithin(0, 2, 4);
      expect(typedArr[0]).assertEqual(300);
      expect(typedArr[1]).assertEqual(400);
      expect(typedArr[2]).assertEqual(300);
      expect(typedArr[3]).assertEqual(400);
      expect(typedArr[4]).assertEqual(500);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6300
     * @tc.desc   Verify copyWithin() works on Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint32Array = new Uint32Array([1000, 2000, 3000, 4000, 5000]);
      typedArr.copyWithin(1, 3, 5);
      expect(typedArr[0]).assertEqual(1000);
      expect(typedArr[1]).assertEqual(4000);
      expect(typedArr[2]).assertEqual(5000);
      expect(typedArr[3]).assertEqual(4000);
      expect(typedArr[4]).assertEqual(5000);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6400
     * @tc.desc   Verify fill() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.fill(0, 0, 2);
      arr.copyWithin(2, 0, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6500
     * @tc.desc   Verify copyWithin() then fill() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      arr.fill(0, 0, 2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6600
     * @tc.desc   Verify reverse() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.reverse();
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6700
     * @tc.desc   Verify copyWithin() then reverse() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6800
     * @tc.desc   Verify sort() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [3, 1, 4, 1, 5];
      arr.sort();
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_6900
     * @tc.desc   Verify copyWithin() then sort() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [3, 1, 4, 1, 5];
      arr.copyWithin(0, 3, 5);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_TEST_7000
     * @tc.desc   Verify splice() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.splice(2, 1, 9);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });
  });
}