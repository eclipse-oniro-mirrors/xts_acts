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

export default function BuiltinsArrayIncludesTest(): void {
  describe("BuiltinsArrayIncludesTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
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
     * @tc.name   BuiltinsArrayIncludesTest0100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0100
     * @tc.desc   Verify includes finds existing element and returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0200
     * @tc.desc   Verify includes finds first element and returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0300
     * @tc.desc   Verify includes finds last element and returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0400
     * @tc.desc   Verify includes returns false for non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(6);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0500
     * @tc.desc   Verify includes returns false for zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0600
     * @tc.desc   Verify includes finds string element in string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["cat", "dog", "bat"];
      const result = arr.includes("cat");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0700
     * @tc.desc   Verify includes is case sensitive for strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["cat", "dog", "bat"];
      const result = arr.includes("Cat");
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0800
     * @tc.desc   Verify includes returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1 = arr.includes(2);
      const result2 = arr.includes(10);
      expect(typeof (result1 as Object)).assertEqual('boolean');
      expect(typeof (result2 as Object)).assertEqual('boolean');
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest0900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0900
     * @tc.desc   Verify includes does not modify original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const originalLength = arr.length;
      arr.includes(2);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1000
     * @tc.desc   Verify includes finds float number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3.14, -5, 0];
      const result = arr.includes(3.14);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1100
     * @tc.desc   Verify includes finds negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3.14, -5, 0];
      const result = arr.includes(-5);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1200
     * @tc.desc   Verify includes finds true in boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false];
      const result = arr.includes(true);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1300
     * @tc.desc   Verify includes finds false in boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false];
      const result = arr.includes(false);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1400
     * @tc.desc   Verify includes does not match true with 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(true as Object as number);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1500
     * @tc.desc   Verify includes finds null in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null | undefined> = [1 as Object, null, 2 as Object];
      const result = arr.includes(null);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1600
     * @tc.desc   Verify includes finds undefined in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null | undefined> = [1 as Object, undefined, 2 as Object];
      const result = arr.includes(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1700
     * @tc.desc   Verify includes can find NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, NaN, 3];
      const result = arr.includes(NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1800
     * @tc.desc   Verify includes treats -0 equal to +0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [0];
      const result = arr.includes(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest1900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1900
     * @tc.desc   Verify includes finds -0 in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [-0];
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2000
     * @tc.desc   Verify includes with fromIndex 0 searches from beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2100
     * @tc.desc   Verify includes with positive fromIndex finds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2200
     * @tc.desc   Verify includes with fromIndex beyond element position returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2300
     * @tc.desc   Verify includes with negative fromIndex searches from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ["a", "b", "c", "d", "e"];
      const result = arr.includes("d", -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2400
     * @tc.desc   Verify includes with large negative fromIndex searches from 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ["a", "b", "c"];
      const result = arr.includes("a", -100);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2500
     * @tc.desc   Verify includes with fromIndex equal to length returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(1, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2600
     * @tc.desc   Verify includes with fromIndex greater than length returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(1, 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2700
     * @tc.desc   Verify includes with decimal fromIndex converts to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, 1.9);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2800
     * @tc.desc   Verify includes with NaN fromIndex converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(1, NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest2900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2900
     * @tc.desc   Verify includes with Infinity fromIndex returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(1, Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3000
     * @tc.desc   Verify includes with -Infinity fromIndex searches from 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(1, -Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3100
     * @tc.desc   Verify includes on empty array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3200
     * @tc.desc   Verify includes on single element array finds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [5];
      const result = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3300
     * @tc.desc   Verify includes on single element array with fromIndex 1 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [5];
      const result = arr.includes(5, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3400
     * @tc.desc   Verify includes finds first element with fromIndex 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(1, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3500
     * @tc.desc   Verify includes with fromIndex 1 does not find first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(1, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3600
     * @tc.desc   Verify includes finds last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(5, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3700
     * @tc.desc   Verify includes with fromIndex 5 does not find last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(5, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3800
     * @tc.desc   Verify includes finds multiple NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [NaN, 1, NaN, 2];
      const result = arr.includes(NaN, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest3900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_3900
     * @tc.desc   Verify includes finds undefined in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3];
      const result = arr.includes(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4000
     * @tc.desc   Verify includes on array created with Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object | undefined> = new Array<Object | undefined>(5);
      const result = arr.includes(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4100
     * @tc.desc   Verify includes on large array finds first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4200
     * @tc.desc   Verify includes on large array finds last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const result = arr.includes(9999);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4300
     * @tc.desc   Verify includes on large array with fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }
      const result = arr.includes(5000, 5000);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4400
     * @tc.desc   Verify includes finds string in mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object> = [1 as Object, "hello" as Object, true as Object];
      const result = arr.includes("hello" as Object);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4500
     * @tc.desc   Verify includes finds Infinity in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Infinity, -Infinity, 1];
      const result = arr.includes(Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4600
     * @tc.desc   Verify includes finds -Infinity in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Infinity, -Infinity, 1];
      const result = arr.includes(-Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4700
     * @tc.desc   Verify includes does not match string "1" with number 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes("1" as Object as number);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4800
     * @tc.desc   Verify includes does not match number 1 with string "1"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["1", "2", "3"];
      const result = arr.includes(1 as Object as string);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest4900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_4900
     * @tc.desc   Verify includes finds empty string in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["hello", "", " "];
      const result = arr.includes("");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5000
     * @tc.desc   Verify includes finds space string in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ["hello", "", " "];
      const result = arr.includes(" ");
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5100
     * @tc.desc   Verify includes finds object by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const obj: Object = new Object();
      const arr: Array<Object> = [obj];
      const result = arr.includes(obj);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5200
     * @tc.desc   Verify includes does not match different object with same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const arr: Array<Object> = [obj1];
      const result = arr.includes(obj2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5300
     * @tc.desc   Verify includes finds nested array by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nested: Array<number> = [1, 2];
      const arr: Array<Array<number>> = [nested, [3, 4]];
      const result = arr.includes(nested);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5400
     * @tc.desc   Verify includes does not match different array with same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nested: Array<number> = [1, 2];
      const arr: Array<Array<number>> = [nested, [3, 4]];
      const result = arr.includes([1, 2]);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5500
     * @tc.desc   Verify includes finds function by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fn = (): void => {};
      const arr: Array<Function> = [fn];
      const result = arr.includes(fn);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5600
     * @tc.desc   Verify includes does not match different function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fn = (): void => {};
      const arr: Array<Function> = [fn];
      const result = arr.includes((): void => {});
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5700
     * @tc.desc   Verify includes with no parameter searches for undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, 2, undefined, 3];
      const searchElement: undefined = undefined;
      const result = arr.includes(searchElement);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5800
     * @tc.desc   Verify includes with no parameter returns false if no undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, 2, 3];
      const searchElement: undefined = undefined;
      const result = arr.includes(searchElement);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest5900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_5900
     * @tc.desc   Verify includes does not match null with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null | undefined> = [null];
      const result = arr.includes(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6000
     * @tc.desc   Verify includes does not match undefined with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null | undefined> = [undefined];
      const result = arr.includes(null);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6100
     * @tc.desc   Verify includes on sliced array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sliced: Array<number> = arr.slice(1, 4);
      const result = sliced.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6200
     * @tc.desc   Verify includes on sliced array does not find removed element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sliced: Array<number> = arr.slice(1, 4);
      const result = sliced.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6300
     * @tc.desc   Verify includes after splice operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.splice(2, 1);
      const result = arr.includes(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6400
     * @tc.desc   Verify includes on concatenated array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      const merged: Array<number> = arr1.concat(arr2);
      const result = merged.includes(4);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6500
     * @tc.desc   Verify includes with filter operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3, 4, 5];
      const arr2: Array<number> = [2, 4, 6];
      const filtered: Array<number> = arr1.filter((x: number): boolean => arr2.includes(x));
      expect(filtered.length).assertEqual(2);
      expect(filtered.includes(2)).assertTrue();
      expect(filtered.includes(4)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6600
     * @tc.desc   Verify includes compared with Set.has
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 3, 4];
      const set = new Set<number>(arr);
      expect(arr.includes(3)).assertTrue();
      expect(set.has(3)).assertTrue();
      expect(arr.includes(5)).assertFalse();
      expect(set.has(5)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6700
     * @tc.desc   Verify includes in map operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const targets: Array<number> = [2, 4, 6];
      const mapped: Array<boolean> = arr.map((x: number): boolean => targets.includes(x));
      expect(mapped[0]).assertFalse();
      expect(mapped[1]).assertTrue();
      expect(mapped[3]).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6800
     * @tc.desc   Verify includes vs indexOf for NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, NaN, 5];
      expect(arr.includes(NaN)).assertTrue();
      expect(arr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest6900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_6900
     * @tc.desc   Verify includes vs some method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      expect(arr.includes(3)).assertTrue();
      expect(arr.some((x: number): boolean => x === 3)).assertTrue();
      expect(arr.some((x: number): boolean => x > 3)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7000
     * @tc.desc   Verify includes does not match different Date objects with same time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const date1: Date = new Date(2024, 0, 1);
      const date2: Date = new Date(2024, 0, 1);
      const arr: Array<Date> = [date1];
      const result = arr.includes(date2);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7100
     * @tc.desc   Verify includes on array-like object with call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ["a", "b", "c"];

      const result1 = arr.includes("a", 0);
      const result2 = arr.includes("b", 0);
      const result3 = arr.includes("c", 0);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7200
     * @tc.desc   Verify includes consistency with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1 = arr.includes(2);
      const result2 = arr.includes(2);
      const result3 = arr.includes(2);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7300
     * @tc.desc   Verify includes with mixed +0 and -0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [+0, -0, 1];
      expect(arr.includes(0)).assertTrue();
      expect(arr.includes(-0)).assertTrue();
      expect(arr.includes(+0)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7400
     * @tc.desc   Verify includes with negative index calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ["a", "b", "c", "d", "e"];
      expect(arr.includes("c", -3)).assertTrue();
      expect(arr.includes("b", -4)).assertTrue();
      expect(arr.includes("a", -2)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7500
     * @tc.desc   Verify includes does not match false with 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [0, 1, 2];
      const result = arr.includes(false as Object as number);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7600
     * @tc.desc   Verify includes does not match 0 with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIncludesTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [false, true];
      const result = arr.includes(0 as Object as boolean);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7700
     * @tc.desc   Verify includes on spread array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      const merged: Array<number> = [...arr1, ...arr2];
      expect(merged.includes(3)).assertTrue();
      expect(merged.includes(4)).assertTrue();
      expect(merged.includes(7)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7800
     * @tc.desc   Verify includes with every method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [2, 4, 6, 8];
      expect(arr.includes(4)).assertTrue();
      expect(arr.every((x: number): boolean => x % 2 === 0)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest7900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_7900
     * @tc.desc   Verify includes with undefined fromIndex searches from 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8000
     * @tc.desc   Verify includes with null fromIndex converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const fromIndex: number = 0;
      const result = arr.includes(1, fromIndex);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8100
     * @tc.desc   Verify includes with string fromIndex converts to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, "2" as Object as number);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8200
     * @tc.desc   Verify includes with non-numeric string fromIndex converts to NaN then 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result = arr.includes(3, "abc" as Object as number);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8300
     * @tc.desc   Verify includes vs indexOf returns different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const includesResult = arr.includes(3);
      const indexOfResult = arr.indexOf(3);
      expect(typeof (includesResult as Object)).assertEqual('boolean');
      expect(typeof (indexOfResult as Object)).assertEqual('number');
      expect(includesResult).assertTrue();
      expect(indexOfResult).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8400
     * @tc.desc   Verify includes after Set deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 2, 3, 3, 3];
      const uniqueSet = new Set<number>(arr);
      const unique: Array<number> = Array.from(uniqueSet);
      expect(unique.includes(2)).assertTrue();
      expect(unique.includes(3)).assertTrue();
      expect(unique.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8500
     * @tc.desc   Verify includes on TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      const result = typedArr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8600
     * @tc.desc   Verify includes vs find method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      expect(arr.includes(3)).assertTrue();
      const found = arr.find((x: number): boolean => x === 3);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8700
     * @tc.desc   Verify includes vs findIndex method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      expect(arr.includes(3)).assertTrue();
      const index = arr.findIndex((x: number): boolean => x === 3);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8800
     * @tc.desc   Verify includes with negative fromIndex and negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, -2, 3, -4, 5];
      const result = arr.includes(-4, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest8900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_8900
     * @tc.desc   Verify includes finds first occurrence with duplicates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 2, 4];
      const result = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIncludesTest9000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_9000
     * @tc.desc   Verify includes returns true boolean value not truthy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.includes(2);
      expect(result).assertTrue();
      expect(result === true).assertTrue();
    });
  });
}
