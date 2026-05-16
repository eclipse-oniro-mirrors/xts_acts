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
import * as IncludesMissing from './ArrayIncludesMissingTest';

export default function BuiltinsArrayIncludesExtendedTest(): void {
  describe("BuiltinsArrayIncludesExtendedTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
     * @tc.name   BuiltinsArrayIncludesExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0100
     * @tc.desc   Verify includes with Symbol type values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesSymbolTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0200
     * @tc.desc   Verify includes on array-like object with Array.prototype.includes.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesArrayLikeTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0300
     * @tc.desc   Verify includes on array-like object with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesArrayLikeIndexTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0400
     * @tc.desc   Verify includes on string as array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesStringLikeTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0500
     * @tc.desc   Verify includes on string with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesStringIndexTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0600
     * @tc.desc   Verify includes on arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesArgumentsTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0700
     * @tc.desc   Verify includes on custom object with Symbol.isConcatSpreadable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesCustomObjTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0800
     * @tc.desc   Verify includes on array-like object with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesZeroLengthTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_0900
     * @tc.desc   Verify includes on array-like object with length greater than actual properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesExcessLengthTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1000
     * @tc.desc   Verify includes on array-like object with length less than actual properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesLessLengthTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1100
     * @tc.desc   Verify includes on sparse array with empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesSparseTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1200
     * @tc.desc   Verify includes on sparse array with multiple empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesMultiSparseTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1300
     * @tc.desc   Verify includes after delete operation creates empty slot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesDeleteTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1400
     * @tc.desc   Verify includes on mixed sparse array with empty slots and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesMixedSparseTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1500
     * @tc.desc   Verify includes on array created with Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesConstructorSparseTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1600
     * @tc.desc   Verify includes with fromIndex on sparse array with empty slots
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesSparseIndexTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1700
     * @tc.desc   Verify includes with negative fromIndex on sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesSparseNegativeTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1800
     * @tc.desc   Verify includes with null this context throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesNullThisTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_1900
     * @tc.desc   Verify includes with undefined this context throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesUndefinedThisTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2000
     * @tc.desc   Verify includes with Number.NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesNumberNaNTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2100
     * @tc.desc   Verify includes with Number.POSITIVE_INFINITY and Number.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesNumberInfinityTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2200
     * @tc.desc   Verify includes with void 0 equals undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesVoid0Test2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2300
     * @tc.desc   Verify includes with wrapper objects don't match primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesWrapperTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2400
     * @tc.desc   Verify includes with wrapper objects reference comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesWrapperRefTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2500
     * @tc.desc   Verify includes invokes getter during search
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesGetterTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2600
     * @tc.desc   Verify includes on array-like object with length getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesLengthGetterTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2700
     * @tc.desc   Verify includes on TypedArray with Array.prototype.includes.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesTypedArrayCallTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2800
     * @tc.desc   Verify includes with delete operation in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesStrictDeleteTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_2900
     * @tc.desc   Verify String.prototype.includes method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesStringDirectTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIncludesExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_INCLUDES_EXTENDED_TEST_3000
     * @tc.desc   Verify includes consistency with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIncludesExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = IncludesMissing.ArrayIncludesConsistencyTest3000();
      expect(result).assertEqual(true);
    });
  });
}
