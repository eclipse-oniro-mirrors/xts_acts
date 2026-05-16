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
import * as PopMissing from './ArrayPrototypePopMissingTest';

export default function BuiltinsArrayPrototypePopExtendedTest(): void {
  describe("BuiltinsArrayPrototypePopExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0100
     * @tc.desc   Verify pop() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopSymbolTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0200
     * @tc.desc   Verify pop() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopBigIntTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0300
     * @tc.desc   Verify pop() on array-like object with pop.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopArrayLikeTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0400
     * @tc.desc   Verify pop() on arguments object with pop.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopArgumentsTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0500
     * @tc.desc   Verify pop() on string with pop.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopStringTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0600
     * @tc.desc   Verify pop() with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopTypedArrayTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0700
     * @tc.desc   Verify pop() with sparse array created by delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopSparseDeleteTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0800
     * @tc.desc   Verify pop() with sparse array vs explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopSparseVsUndefinedTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_0900
     * @tc.desc   Verify pop() with extreme sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopExtremeSparseTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1000
     * @tc.desc   Verify pop() with thisArg as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopThisArgNumberTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1100
     * @tc.desc   Verify pop() with null prototype object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNullPrototypeTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1200
     * @tc.desc   Verify pop() on Proxy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopProxyTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1300
     * @tc.desc   Verify pop() with non-array object calling pop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNonArrayTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1400
     * @tc.desc   Verify pop() with length property is not number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopInvalidLengthTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1500
     * @tc.desc   Verify pop() with length property is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNegativeLengthTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1600
     * @tc.desc   Verify pop() with WeakMap reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopWeakMapTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1700
     * @tc.desc   Verify pop() with WeakSet reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopWeakSetTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1800
     * @tc.desc   Verify pop() with null as this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNullThisTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_1900
     * @tc.desc   Verify pop() with undefined as this
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopUndefinedThisTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2000
     * @tc.desc   Verify pop() with fractional length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopFractionalLengthTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2100
     * @tc.desc   Verify pop() with NaN length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNaNLengthTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2200
     * @tc.desc   Verify pop() with no length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNoLengthTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2300
     * @tc.desc   Verify pop() on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopFrozenArrayTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2400
     * @tc.desc   Verify pop() on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopSealedArrayTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2500
     * @tc.desc   Verify pop() on non-extensible array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNonExtensibleArrayTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2600
     * @tc.desc   Verify pop() with non-configurable elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopNonConfigurableElementTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypePopExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_POP_EXTENDED_TEST_2700
     * @tc.desc   Verify pop() with getter/setter elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypePopExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = PopMissing.PopGetterSetterElementTest3100();
      expect(result).assertEqual(true);
    });
  });
}