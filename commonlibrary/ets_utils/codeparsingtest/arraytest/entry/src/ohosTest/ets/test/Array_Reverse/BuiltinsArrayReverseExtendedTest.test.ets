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
import * as ArrayReverseMissing from './ArrayReverseMissingTest';

export default function BuiltinsArrayReverseExtendedTest(): void {
  describe("BuiltinsArrayReverseExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayReverseExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0100
     * @tc.desc   Verify reverse() with object and array mixed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseObjectMixedTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0200
     * @tc.desc   Verify reverse() with even length array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseEvenLengthTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0300
     * @tc.desc   Verify reverse() with odd length array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseOddLengthTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0400
     * @tc.desc   Verify reverse() modifies array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseInPlaceTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0500
     * @tc.desc   Verify reverse() does not create new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseNoNewArrayTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0600
     * @tc.desc   Verify double reverse() returns original order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseDoubleReverseTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0700
     * @tc.desc   Verify reverse() can chain with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseChainMapTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0800
     * @tc.desc   Verify modifying reversed object affects original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseModifyObjectTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_0900
     * @tc.desc   Verify reverse() preserves nested array references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseNestedArrayRefTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1000
     * @tc.desc   Verify reverse() with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseLargeArrayTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1100
     * @tc.desc   Verify reverse() with huge array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseHugeArrayTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1200
     * @tc.desc   Verify reverse() with single hole sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseSingleHoleTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1300
     * @tc.desc   Verify reverse() with multiple holes sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseMultipleHolesTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1400
     * @tc.desc   Verify reverse() with consecutive holes sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseConsecutiveHolesTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1500
     * @tc.desc   Verify reverse() with boundary holes sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseBoundaryHolesTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1600
     * @tc.desc   Verify reverse() with only holes array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseOnlyHolesTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1700
     * @tc.desc   Verify reverse() with sparse array mixed with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSparseMixedUndefinedTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1800
     * @tc.desc   Verify reverse() with multiple same object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseMultipleSameObjectTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_1900
     * @tc.desc   Verify reverse() with circular reference array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseCircularRefArrayTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2000
     * @tc.desc   Verify reverse() with circular reference objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseCircularObjectTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2100
     * @tc.desc   Verify reverse() after sort ascending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithSortAscTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2200
     * @tc.desc   Verify sort after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithSortDescTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2300
     * @tc.desc   Verify reverse() on sliced array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithSliceTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2400
     * @tc.desc   Verify reverse() after concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithConcatTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2500
     * @tc.desc   Verify forEach after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithForEachTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2600
     * @tc.desc   Verify map after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithMapTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2700
     * @tc.desc   Verify filter after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithFilterTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2800
     * @tc.desc   Verify reduce after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithReduceTest4700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_2900
     * @tc.desc   Verify push after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithPushTest4800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3000
     * @tc.desc   Verify pop after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithPopTest4900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3100
     * @tc.desc   Verify splice after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithSpliceTest5000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3200
     * @tc.desc   Verify indexOf after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithIndexOfTest5100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3300
     * @tc.desc   Verify includes after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithIncludesTest5200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3400
     * @tc.desc   Verify reverse() with Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseTypedArrayInt8Test5300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3500
     * @tc.desc   Verify reverse() with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseTypedArrayFloat32Test5400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3600
     * @tc.desc   Verify reverse() on Array.from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFromTest5500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3700
     * @tc.desc   Verify reverse() on Array.of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseOfTest5600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3800
     * @tc.desc   Verify reverse() on frozen array throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFrozenArrayTest5700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_3900
     * @tc.desc   Verify reverse() on sealed array throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSealedArrayTest5800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4000
     * @tc.desc   Verify reverse() on non-extensible array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReversePreventExtensionsTest5900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4100
     * @tc.desc   Verify reverse() with BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseBigIntTest6000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4200
     * @tc.desc   Verify reverse() in async context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await ArrayReverseMissing.ArrayReverseAsyncTest6100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4300
     * @tc.desc   Verify reverse() with Proxy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseProxyTest6200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4400
     * @tc.desc   Verify values() iterator after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseValuesIteratorTest6300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4500
     * @tc.desc   Verify keys() iterator after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseKeysIteratorTest6400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4600
     * @tc.desc   Verify entries() iterator after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseEntriesIteratorTest6500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4700
     * @tc.desc   Verify join() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseJoinTest6600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4800
     * @tc.desc   Verify toString() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseToStringTest6700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_4900
     * @tc.desc   Verify fill() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFillTest6800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5000
     * @tc.desc   Verify copyWithin() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseCopyWithinTest6900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5100
     * @tc.desc   Verify flat() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFlatTest7000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5200
     * @tc.desc   Verify flatMap() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFlatMapTest7100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5300
     * @tc.desc   Verify find() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFindTest7200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5400
     * @tc.desc   Verify findIndex() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseFindIndexTest7300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5500
     * @tc.desc   Verify every() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseEveryTest7400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5600
     * @tc.desc   Verify some() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseSomeTest7500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5700
     * @tc.desc   Verify reverse() with partially same elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 1, 2, 1];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5800
     * @tc.desc   Verify reverse() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date1: Date = new Date('2024-01-01');
      let date2: Date = new Date('2024-06-15');
      let date3: Date = new Date('2024-12-31');
      let arr: Array<Date> = [date1, date2, date3];
      let result: Array<Date> = arr.reverse();
      expect(result[0] === date3).assertTrue();
      expect(result[1] === date2).assertTrue();
      expect(result[2] === date1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_5900
     * @tc.desc   Verify reverse() with Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map1: Map<string, number> = new Map([['a', 1]]);
      let map2: Map<string, number> = new Map([['b', 2]]);
      let arr: Array<Map<string, number>> = [map1, map2];
      let result: Array<Map<string, number>> = arr.reverse();
      expect(result[0] === map2).assertTrue();
      expect(result[1] === map1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6000
     * @tc.desc   Verify reverse() with Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set1: Set<number> = new Set([1, 2]);
      let set2: Set<number> = new Set([3, 4]);
      let arr: Array<Set<number>> = [set1, set2];
      let result: Array<Set<number>> = arr.reverse();
      expect(result[0] === set2).assertTrue();
      expect(result[1] === set1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6100
     * @tc.desc   Verify reverse() with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let regex1: RegExp = /abc/g;
      let regex2: RegExp = /def/i;
      let arr: Array<RegExp> = [regex1, regex2];
      let result: Array<RegExp> = arr.reverse();
      expect(result[0] === regex2).assertTrue();
      expect(result[1] === regex1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6200
     * @tc.desc   Verify reverse() in queue/stack pattern
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Array<number> = [];
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.reverse();
      expect(stack[0]).assertEqual(3);
      expect(stack[1]).assertEqual(2);
      expect(stack[2]).assertEqual(1);
      let popped: number | undefined = stack.pop();
      expect(popped).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6300
     * @tc.desc   Verify reverse() with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [-5, -3, -1, 0, 1, 3, 5];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[6]).assertEqual(-5);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6400
     * @tc.desc   Verify reverse() with floating point numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1.1, 2.2, 3.3, 4.4, 5.5];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5.5);
      expect(result[4]).assertEqual(1.1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6500
     * @tc.desc   Verify reverse() with zero and negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [0, -0, 1, -1];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(-1);
      expect(result[3]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6600
     * @tc.desc   Verify reverse() with MAX_VALUE and MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [Number.MAX_VALUE, 0, Number.MIN_VALUE];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(Number.MIN_VALUE);
      expect(result[2]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6700
     * @tc.desc   Verify reduceRight() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: number = arr.reverse().reduceRight((acc, val) => acc + val, 0);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6800
     * @tc.desc   Verify lastIndexOf() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 2, 1];
      arr.reverse();
      let index: number = arr.lastIndexOf(2);
      expect(index).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest6900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_6900
     * @tc.desc   Verify Array.isArray() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7000
     * @tc.desc   Verify instanceof after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      expect(result instanceof Array).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7100
     * @tc.desc   Verify constructor after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      expect(result.constructor === Array).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7200
     * @tc.desc   Verify reverse() works with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let copy: Array<number> = [...arr];
      copy.reverse();
      expect(arr[0]).assertEqual(1);
      expect(copy[0]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7300
     * @tc.desc   Verify reverse() works with destructuring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let reversedArr = arr.reverse();
      let first = reversedArr[0];
      let second = reversedArr[1];
      let third = reversedArr[2];

      expect(first).assertEqual(3);
      expect(second).assertEqual(2);
      expect(third).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7400
     * @tc.desc   Verify at() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      arr.reverse();
      expect(arr[0]).assertEqual(5);
      expect(arr[arr.length - 1]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7500
     * @tc.desc   Verify with() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.reverse();
      let newArr: Array<number> = [...arr];
      newArr[0] = 99;
      expect(newArr[0]).assertEqual(99);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7600
     * @tc.desc   Verify toReversed() creates new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = [...arr];
      result.reverse();
      expect(result[0]).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7700
     * @tc.desc   Verify toSorted() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [3, 1, 4];
      arr.reverse();
      let sorted: Array<number> = [...arr];
      sorted.sort((a: number, b: number) => a - b);
      expect(sorted[0]).assertEqual(1);
      expect(sorted[1]).assertEqual(3);
      expect(sorted[2]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7800
     * @tc.desc   Verify toSpliced() after reverse()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      arr.reverse();
      let spliced: Array<number> = [...arr];
      spliced.splice(1, 2, 99, 88);
      expect(spliced[0]).assertEqual(5);
      expect(spliced[1]).assertEqual(99);
      expect(spliced[2]).assertEqual(88);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest7900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_7900
     * @tc.desc   Verify reverse() on basic array-like object using Function.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseArrayLikeBasicTest7600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8000
     * @tc.desc   Verify reverse() on array-like with non-numeric properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseArrayLikeWithExtraPropsTest7700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8100
     * @tc.desc   Verify reverse() on sparse array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseArrayLikeSparseTest7800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8200
     * @tc.desc   Verify reverse() on function arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseArgumentsTest7900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8300
     * @tc.desc   Verify reverse() with this value as null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseThisNullTest8000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8400
     * @tc.desc   Verify reverse() with this value as undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseThisUndefinedTest8100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8500
     * @tc.desc   Verify reverse() with this value as primitive number throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseThisPrimitiveTest8200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8600
     * @tc.desc   Verify reverse() with this value as primitive string throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseThisStringTest8300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8700
     * @tc.desc   Verify reverse() with this value as primitive boolean throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseThisBooleanTest8400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8800
     * @tc.desc   Verify reverse() with negative length (no operation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseLengthNegativeTest8500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest8900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_8900
     * @tc.desc   Verify reverse() with non-integer length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseLengthNonIntegerTest8600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9000
     * @tc.desc   Verify reverse() with string length (converted to number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseLengthStringTest8700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9100
     * @tc.desc   Verify reverse() on object with getter property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithGetterTest8800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9200
     * @tc.desc   Verify reverse() on object with setter property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithSetterTest8900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9300
     * @tc.desc   Verify reverse() throws error on read-only property in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseReadOnlyPropertyTest9000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9400
     * @tc.desc   Verify reverse() on string throws TypeError (strict mode)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseStringImmutableTest9100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9500
     * @tc.desc   Verify reverse() on object with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseIterableObjectTest9200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9600
     * @tc.desc   Verify reverse() with large array works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseHugeLengthTest9300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9700
     * @tc.desc   Verify reverse() using Function.apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseWithApplyTest9400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9800
     * @tc.desc   Verify reverse() on NodeList-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseNodeListLikeTest9500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseExtendedTest9900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_EXTENDED_TEST_9900
     * @tc.desc   Verify reverse() and verify prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseExtendedTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReversePrototypeChainTest9600();
      expect(result).assertEqual(true);
    });
  });
}
