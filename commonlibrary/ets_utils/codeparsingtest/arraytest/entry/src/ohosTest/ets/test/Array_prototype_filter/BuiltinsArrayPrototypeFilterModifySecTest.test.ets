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
import * as ArrayPrototypeFilterMissing from './ArrayPrototypeFilterMissingTest';
import * as ArrayPrototypeFilterModify from './BuiltinsArrayPrototypeFilterModify';
import * as ArrayPrototypeFilterThisArg from './BuiltinsArrayPrototypeFilterThisArg';
import * as ArrayPrototypeFilterSparseException from './BuiltinsArrayPrototypeFilterSparseException';

export default function BuiltinsArrayPrototypeFilterModifySecTest(): void {
  describe("BuiltinsArrayPrototypeFilterModifySecTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0100
     * @tc.desc   Test array modification with weak map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithWeakMap0223();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0200
     * @tc.desc   Test array modification with weak set values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithWeakSet0224();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0300
     * @tc.desc   Test array modification with promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithPromise0225();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0400
     * @tc.desc   Test array modification with generator values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithGenerator0226();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0500
     * @tc.desc   Test array modification with proxy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithProxy0227();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0600
     * @tc.desc   Test array modification with error values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithError0228();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0700
     * @tc.desc   Test array modification with math values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithMath0229();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0800
     * @tc.desc   Test array modification with JSON values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithJSON0230();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_0900
     * @tc.desc   Test array modification with global values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithGlobal0231();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1000
     * @tc.desc   Test array modification with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithEmptyArray0232();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1100
     * @tc.desc   Test array modification with single element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithSingleElement0233();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1200
     * @tc.desc   Test array modification with huge array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithHugeArray0234();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1300
     * @tc.desc   Test array modification with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithCircularReference0235();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1400
     * @tc.desc   Test array modification with typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithTypedArray0236();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1500
     * @tc.desc   Test array modification with array like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithArrayLike0237();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1600
     * @tc.desc   Test array modification with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithSpread0238();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1700
     * @tc.desc   Test array modification with Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithFrom0239();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFilterModifySecTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_MODIFY_SEC_TEST_1800
     * @tc.desc   Test array modification with Array.of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterModifySecTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterModify.builtinsArrayFilterModifyWithOf0240();
      expect(result).assertEqual(true);
    });
  });
}
