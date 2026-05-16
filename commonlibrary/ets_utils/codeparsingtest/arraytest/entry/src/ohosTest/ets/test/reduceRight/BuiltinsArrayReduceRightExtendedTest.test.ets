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
import * as ArrayReduceRightMissing from './ArrayReduceRightMissingTest';

export default function BuiltinsArrayReduceRightExtendedTest(): void {
  describe("BuiltinsArrayReduceRightExtendedTest", () => {
    beforeAll(async () => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(async () => {
    })
    afterAll(() => {
    })

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0100
     * @tc.desc   Verify reduceRight() with holes at start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightSparseStartTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0200
     * @tc.desc   Verify reduceRight() with holes at end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightSparseEndTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0300
     * @tc.desc   Verify reduceRight() on all-holes array with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightSparseAllHolesWithInitialTest1900();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0400
     * @tc.desc   Verify reduceRight() on empty array with object initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightEmptyObjectInitialTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0500
     * @tc.desc   Verify reduceRight() on single object element without initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightSingleObjectNoInitialTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0600
     * @tc.desc   Verify reduceRight() on large array (10000 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightLargeArrayTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0700
     * @tc.desc   Verify reduceRight() with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightUndefinedElementsTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0800
     * @tc.desc   Verify reduceRight() with all null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightAllNullTest2700();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_0900
     * @tc.desc   Verify reduceRight() with function initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightInitialFunctionTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1000
     * @tc.desc   Verify reduceRight() with NaN initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightInitialNaNTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1100
     * @tc.desc   Verify reduceRight() with Infinity initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightInitialInfinityTest3200();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1200
     * @tc.desc   Verify reduceRight() arrow function this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightArrowThisTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1300
     * @tc.desc   Verify reduceRight() modifying object accumulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightModifyAccTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1400
     * @tc.desc   Verify reduceRight() modifying original array in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightModifyArrayTest4000();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1500
     * @tc.desc   Verify reduceRight() vs reduce() direction difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightVsReduceDirectionTest4100();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1600
     * @tc.desc   Verify reduceRight() flattening nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightFlattenArrayTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1700
     * @tc.desc   Verify reduceRight() grouping objects by property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightGroupByTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1800
     * @tc.desc   Verify reduceRight() composing functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightComposeFunctionsTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_1900
     * @tc.desc   Verify reduceRight() removing duplicates while preserving order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightRemoveDuplicatesTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2000
     * @tc.desc   Verify reduceRight() counting occurrences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightCountOccurrencesTest4700();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2100
     * @tc.desc   Verify reduceRight() chained with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightChainWithMapTest5100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2200
     * @tc.desc   Verify reduceRight() chained with filter()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightChainWithFilterTest5200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2300
     * @tc.desc   Verify reduceRight() chained with reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightChainWithReverseTest5300();
      expect(result).assertEqual(true);
    });

    /**

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2400
     * @tc.desc   Verify reduceRight() on huge array (100000 elements)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsArrayReduceRightExtendedTest2400', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightHugeArrayTest5400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_EXTENDED_TEST_2500
     * @tc.desc   Verify reduceRight() with many callback invocations
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('BuiltinsArrayReduceRightExtendedTest2500', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, () => {
      let result: boolean = ArrayReduceRightMissing.ArrayReduceRightManyCallbacksTest5500();
      expect(result).assertEqual(true);
    });

  });
}
