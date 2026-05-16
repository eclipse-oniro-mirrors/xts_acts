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
import * as ArrayShiftMissing from './ArrayShiftMissingTest';

export default function BuiltinsArrayShiftExtendedTest(): void {
  describe("BuiltinsArrayShiftExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayShiftExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0100
     * @tc.desc   Verify shift followed by every operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftEveryTest5700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0200
     * @tc.desc   Verify shift followed by some operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSomeTest5800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0300
     * @tc.desc   Verify shift followed by reduce operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftReduceTest5900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0400
     * @tc.desc   Verify shift followed by slice operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSliceTest6000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0500
     * @tc.desc   Verify shift followed by splice operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSpliceTest6100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0600
     * @tc.desc   Verify shift followed by reverse operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftReverseTest6200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0700
     * @tc.desc   Verify shift followed by sort operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSortTest6300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0800
     * @tc.desc   Verify shift followed by concat operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftConcatTest6400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_0900
     * @tc.desc   Verify shift followed by fill operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFillTest6500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1000
     * @tc.desc   Verify shift followed by flat operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFlatTest6600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1100
     * @tc.desc   Verify shift on Array.from created array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFromTest6700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1200
     * @tc.desc   Verify shift on Array.of created array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftOfTest6800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1300
     * @tc.desc   Verify shift with BigInt type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftBigIntTest6900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1400
     * @tc.desc   Verify shift with Symbol type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSymbolTest7000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1500
     * @tc.desc   Verify async shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await ArrayShiftMissing.ArrayShiftAsyncTest7100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1600
     * @tc.desc   Verify shift on nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftNestedArrayTest7200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1700
     * @tc.desc   Verify shift on mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftMixedArrayTest7300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1800
     * @tc.desc   Verify shift on object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftObjectArrayTest7400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_1900
     * @tc.desc   Verify shift on sparse mixed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftSparseMixedTest7500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2000
     * @tc.desc   Verify multiple shift with undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftWithUndefinedTest7600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2100
     * @tc.desc   Verify shift preserves element order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftPreserveOrderTest7700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2200
     * @tc.desc   Verify repeated shift on same value array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftRepeatedTest7800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2300
     * @tc.desc   Verify shift with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftNegativeNumbersTest7900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2400
     * @tc.desc   Verify shift with floating point numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFloatNumbersTest8000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2500
     * @tc.desc   Verify shift on boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftBooleanArrayTest8100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2600
     * @tc.desc   Verify shift on string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftStringArrayTest8200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2700
     * @tc.desc   Verify shift with null and undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftNullUndefinedTest8300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2800
     * @tc.desc   Verify shift followed by toString operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftToStringTest8400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_2900
     * @tc.desc   Verify shift followed by toLocaleString operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftToLocaleStringTest8500();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3000
     * @tc.desc   Verify shift followed by lastIndexOf operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftLastIndexOfTest8600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3100
     * @tc.desc   Verify shift followed by findIndex operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFindIndexTest8700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3200
     * @tc.desc   Verify shift followed by flatMap operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftFlatMapTest8800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3300
     * @tc.desc   Verify shift followed by reduceRight operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftReduceRightTest8900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3400
     * @tc.desc   Verify shift followed by entries operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftEntriesTest9000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3500
     * @tc.desc   Verify shift followed by keys operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftKeysTest9100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3600
     * @tc.desc   Verify shift followed by values operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftValuesTest9200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3700
     * @tc.desc   Verify shift followed by copyWithin operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftCopyWithinTest9300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3800
     * @tc.desc   Verify shift followed by Array.isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftIsArrayTest9400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_3900
     * @tc.desc   Verify shift followed by instanceof Array check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftInstanceOfTest9500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4000
     * @tc.desc   Verify shift followed by constructor check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftConstructorTest9600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4100
     * @tc.desc   Verify shift followed by prototype check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftPrototypeTest9700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4200
     * @tc.desc   Verify length property is writable after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftLengthWritableTest9800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4300
     * @tc.desc   Verify property enumeration after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftPropertyEnumerationTest9900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4400
     * @tc.desc   Verify shift on non-extensible array behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayShiftMissing.ArrayShiftPreventExtensionsTest10000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4500
     * @tc.desc   Direct test for shift on array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: (string | number)[] = ['first', 'second', 'third'];

      let result: string | number = arr.shift()!;

      expect(result).assertEqual('first');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('second');
      expect(arr[1]).assertEqual('third');
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4600
     * @tc.desc   Direct test for basic shift operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [10, 20, 30, 40, 50];
      let shifted: number | undefined = arr.shift();
      expect(shifted).assertEqual(10);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(30);
      expect(arr[2]).assertEqual(40);
      expect(arr[3]).assertEqual(50);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4700
     * @tc.desc   Direct test for shift with multiple data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | string | boolean | null | undefined> = [42, 'test', true, null, undefined];
      let first: number | string | boolean | null | undefined = arr.shift();
      expect(first).assertEqual(42);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4800
     * @tc.desc   Direct test for shift on empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [];
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_4900
     * @tc.desc   Direct test for shift with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date1: Date = new Date('2024-01-15');
      let date2: Date = new Date('2024-06-20');
      let arr: Array<Date> = [date1, date2];
      let shifted: Date | undefined = arr.shift();
      expect(shifted === date1).assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5000
     * @tc.desc   Direct test for shift with Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map1: Map<string, number> = new Map([['a', 1], ['b', 2]]);
      let map2: Map<string, number> = new Map([['c', 3]]);
      let arr: Array<Map<string, number>> = [map1, map2];
      let shifted: Map<string, number> | undefined = arr.shift();
      expect(shifted === map1).assertTrue();
      expect(shifted?.get('a')).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5100
     * @tc.desc   Direct test for shift with Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set1: Set<number> = new Set([1, 2, 3]);
      let set2: Set<number> = new Set([4, 5]);
      let arr: Array<Set<number>> = [set1, set2];
      let shifted: Set<number> | undefined = arr.shift();
      expect(shifted === set1).assertTrue();
      expect(shifted?.has(2)).assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5200
     * @tc.desc   Direct test for shift with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let regex1: RegExp = /abc/g;
      let regex2: RegExp = /def/i;
      let arr: Array<RegExp> = [regex1, regex2];
      let shifted: RegExp | undefined = arr.shift();
      expect(shifted === regex1).assertTrue();
      expect(shifted?.test('abc')).assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5300
     * @tc.desc   Direct test for shift with BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<bigint> = [9007199254740991n, 123n, 456n];
      let shifted: bigint | undefined = arr.shift();
      expect(shifted).assertEqual(9007199254740991n);
      expect(typeof shifted).assertEqual('bigint');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5400
     * @tc.desc   Direct test for queue implementation with shift and push
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Array<string> = [];
      queue.push('first');
      queue.push('second');
      queue.push('third');
      let first: string | undefined = queue.shift();
      expect(first).assertEqual('first');
      expect(queue.length).assertEqual(2);
      expect(queue[0]).assertEqual('second');
      queue.push('fourth');
      expect(queue.length).assertEqual(3);
      let second: string | undefined = queue.shift();
      expect(second).assertEqual('second');
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5500
     * @tc.desc   Direct test for shift with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nested1: Array<number> = [1, 2, 3];
      let nested2: Array<number> = [4, 5, 6];
      let arr: Array<Array<number>> = [nested1, nested2];
      let shifted: Array<number> | undefined = arr.shift();
      expect(shifted === nested1).assertTrue();
      expect(shifted?.[0]).assertEqual(1);
      expect(shifted?.[1]).assertEqual(2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5600
     * @tc.desc   Direct test for shift with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fn1 = (): number => 100;
      let fn2 = (): number => 200;
      let arr: Array<() => number> = [fn1, fn2];
      let shifted: (() => number) | undefined = arr.shift();
      expect(shifted === fn1).assertTrue();
      expect((shifted as () => number)()).assertEqual(100);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5700
     * @tc.desc   Direct test for shift on array with sparse elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | undefined> = [undefined, 2, undefined, 4];
      let first: number | undefined = arr.shift();
      expect(first).assertUndefined();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5800
     * @tc.desc   Direct test for shift with Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [Infinity, -Infinity, 0];
      let first: number | undefined = arr.shift();
      expect(first).assertEqual(Infinity);
      let second: number | undefined = arr.shift();
      expect(second).assertEqual(-Infinity);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_5900
     * @tc.desc   Direct test for shift preserving array prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.shift();
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr.shift !== undefined).assertTrue();
      expect(arr.push !== undefined).assertTrue();
      expect(arr.pop !== undefined).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_6000
     * @tc.desc   Direct test for multiple consecutive shifts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let results: Array<number | undefined> = [];
      results.push(arr.shift());
      results.push(arr.shift());
      results.push(arr.shift());
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      expect(results[2]).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_6100
     * @tc.desc   Direct test for shift and unshift operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [2, 3, 4, 5];
      let removed: number | undefined = arr.shift();
      expect(removed).assertEqual(2);
      arr.unshift(1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_6200
     * @tc.desc   Direct test for shift with NaN element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [NaN, 1, 2];
      let shifted: number | undefined = arr.shift();
      expect(Number.isNaN(shifted as number)).assertTrue();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_6300
     * @tc.desc   Direct test for shift with null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<null | undefined | number> = [null, undefined, 42];
      let first: null | undefined | number = arr.shift() as null | undefined | number;
      expect(first).assertNull();
      let second: null | undefined | number = arr.shift() as null | undefined | number;
      expect(second).assertUndefined();
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name   BuiltinsArrayShiftExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_EXTENDED_TEST_6400
     * @tc.desc   Direct test for shift on array created with Array.of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = Array.of(10, 20, 30);
      let shifted: number | undefined = arr.shift();
      expect(shifted).assertEqual(10);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(20);
    });
  });
}
