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
import * as JoinMissing from './ArrayPrototypeJoinMissingTest';

export default function BuiltinsArrayPrototypeJoinExtendedTest(): void {
  describe("BuiltinsArrayPrototypeJoinExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0100
     * @tc.desc   Verify join() with Symbol element throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSymbolTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0200
     * @tc.desc   Verify join() with multiple Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSymbolTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0300
     * @tc.desc   Verify join() with Symbol and other types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSymbolTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0400
     * @tc.desc   Verify join() with Symbol.toPrimitive method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToPrimitiveTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0500
     * @tc.desc   Verify join() with toString method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToStringTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0600
     * @tc.desc   Verify join() with valueOf method only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinValueOfTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0700
     * @tc.desc   Verify join() with toString and valueOf both exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToStringValueOfTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0800
     * @tc.desc   Verify join() with Symbol.toStringTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToStringTagTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_0900
     * @tc.desc   Verify join() with toString returns non-string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToStringNonStringTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1000
     * @tc.desc   Verify join() with null prototype object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNullPrototypeTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1100
     * @tc.desc   Verify join() with prototype chain modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinPrototypeChainTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1200
     * @tc.desc   Verify join() on array-like object with join.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinArrayLikeTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1300
     * @tc.desc   Verify join() on arguments object with join.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinArgumentsTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1400
     * @tc.desc   Verify join() on custom Array subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinCustomArrayTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1500
     * @tc.desc   Verify join() with modified Array.prototype.join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinModifiedPrototypeTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1600
     * @tc.desc   Verify join() with object borrowing join method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinBorrowMethodTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1700
     * @tc.desc   Verify join() with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinTypedArrayTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1800
     * @tc.desc   Verify join() with string borrowing join method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinStringTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_1900
     * @tc.desc   Verify join() with delete operator creates sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSparseDeleteTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2000
     * @tc.desc   Verify join() with sparse array vs explicit undefined difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSparseVsUndefinedTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2100
     * @tc.desc   Verify join() with sparse array forEach vs join comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSparseForEachTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2200
     * @tc.desc   Verify join() with extreme sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinExtremeSparseTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2300
     * @tc.desc   Verify join() with toString throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToStringErrorTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2400
     * @tc.desc   Verify join() with valueOf throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinValueOfErrorTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2500
     * @tc.desc   Verify join() with separator object throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSeparatorErrorTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2600
     * @tc.desc   Verify join() with null this context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNullContextTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2700
     * @tc.desc   Verify join() with undefined this context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinUndefinedContextTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2800
     * @tc.desc   Verify join() on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinFrozenTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_2900
     * @tc.desc   Verify join() on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSealedTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3000
     * @tc.desc   Verify join() on Proxy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinProxyTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3100
     * @tc.desc   Verify join() with non-array object calling join
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNonArrayTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3200
     * @tc.desc   Verify join() with split reverse operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSplitTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3300
     * @tc.desc   Verify join() equals toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: boolean = JoinMissing.JoinToStringEqualTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3400
     * @tc.desc   Verify join() with map combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinMapTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3500
     * @tc.desc   Verify join() with filter combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinFilterTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3600
     * @tc.desc   Verify join() with concat combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinConcatTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3700
     * @tc.desc   Verify join() with slice combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSliceTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3800
     * @tc.desc   Verify join() with sort combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSortTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_3900
     * @tc.desc   Verify join() with reverse combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinReverseTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4000
     * @tc.desc   Verify join() with includes combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinIncludesTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4100
     * @tc.desc   Verify join() with template string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinTemplateTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4200
     * @tc.desc   Verify join() with regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinRegexTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4300
     * @tc.desc   Verify join() vs JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinJsonTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4400
     * @tc.desc   Verify join() result to number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToNumberTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4500
     * @tc.desc   Verify join() result to boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToBooleanTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4600
     * @tc.desc   Verify join() result to boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinToBooleanTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4700
     * @tc.desc   Verify join() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinBigIntTest4700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4800
     * @tc.desc   Verify join() with mixed types including null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinMixedTypesTest4800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_4900
     * @tc.desc   Verify join() with empty array and various separators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinEmptyArrayTest4900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5000
     * @tc.desc   Verify join() with single undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSingleUndefinedTest5000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5100
     * @tc.desc   Verify join() with single null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSingleNullTest5100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5200
     * @tc.desc   Verify join() with single empty string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSingleEmptyStringTest5200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5300
     * @tc.desc   Verify join() with single object element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinSingleObjectTest5300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5400
     * @tc.desc   Verify join() with negative length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNegativeLengthTest5400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5500
     * @tc.desc   Verify join() with decimal length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinDecimalLengthTest5500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5600
     * @tc.desc   Verify join() with length modification to expand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinExpandLengthTest5600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5700
     * @tc.desc   Verify join() method length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinPropertyTest5700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5800
     * @tc.desc   Verify join() method name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinPropertyTest5800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_5900
     * @tc.desc   Verify join() with newline separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNewlineTest5900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6000
     * @tc.desc   Verify join() with tab separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinTabTest6000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6100
     * @tc.desc   Verify join() with backslash separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinBackslashTest6100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6200
     * @tc.desc   Verify join() with array separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinArraySeparatorTest6200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6300
     * @tc.desc   Verify join() with custom toString as separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinCustomSeparatorTest6300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6400
     * @tc.desc   Verify join() with mixed nested arrays with different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNestedMixedTest6400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6500
     * @tc.desc   Verify join() with deeply nested empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNestedEmptyTest6500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6600
     * @tc.desc   Verify join() with all empty nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinAllEmptyNestedTest6600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6700
     * @tc.desc   Verify join() with Boolean separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinBooleanSeparatorTest6700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6800
     * @tc.desc   Verify join() with numeric separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNumericSeparatorTest6800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_6900
     * @tc.desc   Verify join() with null separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinNullSeparatorTest6900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_7000
     * @tc.desc   Verify join() with undefined separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinUndefinedSeparatorTest7000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_7100
     * @tc.desc   Verify join() with two-element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinTwoElementsTest7100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_7200
     * @tc.desc   Verify join() with consecutive undefined and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinConsecutiveUndefinedNullTest7200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeJoinExtendedTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_JOIN_EXTENDED_TEST_7300
     * @tc.desc   Verify join() with undefined and null at different positions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeJoinExtendedTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = JoinMissing.JoinPositionUndefinedNullTest7300();
      expect(result).assertEqual(true);
    });
  });
}
