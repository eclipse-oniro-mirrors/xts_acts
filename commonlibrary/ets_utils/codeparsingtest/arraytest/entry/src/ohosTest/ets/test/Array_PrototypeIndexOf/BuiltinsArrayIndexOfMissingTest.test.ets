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
import * as ArrayIndexOfMissing from './ArrayIndexOfMissingTest';

export default function BuiltinsArrayIndexOfMissingTest(): void {
  describe("BuiltinsArrayIndexOfMissingTest", () => {
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
     * @tc.name   BuiltinsArrayIndexOfMissingTest0100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0100
     * @tc.desc   Verify indexOf with basic array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfArrayLikeTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0200
     * @tc.desc   Verify indexOf with array-like object non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfArrayLikeTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0300
     * @tc.desc   Verify indexOf with array-like object and fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfArrayLikeTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0400
     * @tc.desc   Verify indexOf with arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfArgumentsTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0500
     * @tc.desc   Verify indexOf with arguments object non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfArgumentsTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0600
     * @tc.desc   Verify indexOf with string as array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfStringTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0700
     * @tc.desc   Verify indexOf with string non-existing character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfStringTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0800
     * @tc.desc   Verify indexOf with object without length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfNoLengthTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest0900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_0900
     * @tc.desc   Verify indexOf with object negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfNegativeLengthTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1000
     * @tc.desc   Verify indexOf with object non-numeric length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfNonNumericLengthTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1100
     * @tc.desc   Verify indexOf with custom array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfCustomObjTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1200
     * @tc.desc   Verify indexOf with null as this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfNullThisTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1300
     * @tc.desc   Verify indexOf with undefined as this value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfUndefinedThisTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1400
     * @tc.desc   Verify indexOf with Symbol type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfSymbolTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1500
     * @tc.desc   Verify indexOf with BigInt type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfBigIntTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1600
     * @tc.desc   Verify indexOf with function reference comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFunctionTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1700
     * @tc.desc   Verify indexOf with Date object reference comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfDateTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1800
     * @tc.desc   Verify indexOf with RegExp object reference comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfRegExpTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest1900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_1900
     * @tc.desc   Verify indexOf wrapper objects not equal to primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfWrapperTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2000
     * @tc.desc   Verify indexOf wrapper object instances comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfWrapperInstTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2100
     * @tc.desc   Verify indexOf with multiple delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfDeleteMultipleTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2200
     * @tc.desc   Verify indexOf with new Array(length) sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfSparseConstructorTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2300
     * @tc.desc   Verify indexOf with Array(length) multiple assignments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfSparseAssignTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2400
     * @tc.desc   Verify indexOf with mixed holes and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfMixedHolesTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2500
     * @tc.desc   Verify indexOf with fromIndex across holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFromIndexHolesTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2600
     * @tc.desc   Verify indexOf with negative fromIndex sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfNegFromIndexSparseTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2700
     * @tc.desc   Verify indexOf modifying length creates holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfLengthIncreaseTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2800
     * @tc.desc   Verify indexOf with fromIndex as string number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFromStringNumTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest2900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_2900
     * @tc.desc   Verify indexOf with fromIndex as non-numeric string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFromStringNonNumTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3000
     * @tc.desc   Verify indexOf with empty array from Array.of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfEmptyOfTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3100
     * @tc.desc   Verify indexOf with findIndex comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFindIndexTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3200
     * @tc.desc   Verify findIndex with complex condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfFindIndexComplexTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3300
     * @tc.desc   Verify removeAll using indexOf and splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfRemoveAllTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3400
     * @tc.desc   Verify union operation using indexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfUnionTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3500
     * @tc.desc   Verify using indexOf with forEach to collect indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfForEachTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfMissingTest3600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_MISSING_TEST_3600
     * @tc.desc   Verify using reduce with indexOf to count occurrences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfMissingTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIndexOfMissing.ArrayIndexOfReduceTest3600();
      expect(result).assertEqual(true);
    });
  });
}
