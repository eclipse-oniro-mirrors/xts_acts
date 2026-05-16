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
import { TestA } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS';

export default function builtinsArrayIncludesTest() {
  describe('BuiltinsArrayIncludesTest', () => {
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
     * @tc.name   builtinsArrayIncludesTest1001
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0100
     * @tc.desc   Verify basic element existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayIncludesTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect([1, 2, 3].includes(2)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1002
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0200
     * @tc.desc   Verify non-existence case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayIncludesTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect([1, 2, 3].includes(4)).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1003
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0300
     * @tc.desc   Verify start index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3, 2, 4].includes(2, 2)).assertTrue(); // 从索引2开始查找
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1004
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0400
     * @tc.desc   Verify index out of bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3, 2, 4].includes(2, 3)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1005
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0500
     * @tc.desc   Verify index out of bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3, 2, 4].includes(2, 4)).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1006
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0600
     * @tc.desc   Verify element empty handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, , 3].includes(undefined)).assertTrue(); // 空位视为undefined
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1007
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0700
     * @tc.desc   Verify element empty handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, , 3].includes(2)).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1008
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0800
     * @tc.desc   Verify NaN comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([NaN].includes(NaN)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1009
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_0900
     * @tc.desc   Verify +0/-0 equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([0, -0].includes(0)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1010
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1000
     * @tc.desc   Verify undefined equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([undefined].includes(undefined)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1011
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1100
     * @tc.desc   Verify negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3].includes(2, -1)).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1012
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1200
     * @tc.desc   Verify negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3].includes(3, -1)).assertTrue(); // 等效于从索引2开始
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1013
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1300
     * @tc.desc   Verify negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3].includes(2, 5)).assertFalse();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1014
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1400
     * @tc.desc   Verify negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, 2, 3].includes(2, -5)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1015
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1500
     * @tc.desc   Verify empty array handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(([] as undefined[]).includes(undefined)).assertFalse();
    }); // TODO



    /**
     * @tc.name   builtinsArrayIncludesTest1016
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1600
     * @tc.desc   Verify null handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, null, 3, 4].includes(null)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1017
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1700
     * @tc.desc   Verify object reference comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: TestA = {
        a: 1
      };
      expect([1, obj, 3].includes(obj)).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1018
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1800
     * @tc.desc   Verify string elements handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(['apple', 'banana', 'cherry'].includes('banana')).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1019
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_1900
     * @tc.desc   Verify string elements handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(['apple', '', 'cherry'].includes('')).assertTrue();
    });

    /**
     * @tc.name   builtinsArrayIncludesTest1020
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_TEST_2000
     * @tc.desc   Verify special number handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayIncludesTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testArray = collections.Array.from([
        1,
        0,
        Number.EPSILON,
        Number.MIN_VALUE,
        Number.MAX_VALUE,
        Infinity,
        -Infinity,
        3405691582,
        258,
        16909060,
        3
      ]);

      expect(testArray.includes(Math.floor(1.5))).assertTrue();
      expect(testArray.includes(-0)).assertTrue();
      expect(testArray.includes(Number.EPSILON)).assertTrue();
      expect(testArray.includes(Number.MIN_VALUE)).assertTrue();
      expect(testArray.includes(Number.MAX_VALUE)).assertTrue();
      expect(testArray.includes(Infinity)).assertTrue();
      expect(testArray.includes(-Infinity)).assertTrue();
      expect(testArray.includes(0xcafebabe)).assertTrue();
      expect(testArray.includes(0x0102)).assertTrue();
      expect(testArray.includes(0x01020304)).assertTrue();
      expect(testArray.includes(0x3)).assertTrue();
    });

  });
}