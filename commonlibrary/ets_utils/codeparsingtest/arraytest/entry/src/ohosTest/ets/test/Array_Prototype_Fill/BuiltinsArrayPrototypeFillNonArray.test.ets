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
import * as ArrayPrototypeFillMissing from './ArrayPrototypeFillMissingTest';

export default function BuiltinsArrayPrototypeFillNonArrayTest(): void {
  describe("BuiltinsArrayPrototypeFillNonArrayTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0100
     * @tc.desc   Verify Array.prototype.fill can fill array-like objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillArrayLikeObject0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0200
     * @tc.desc   Verify Array.prototype.fill can fill array-like objects with start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillArrayLikeWithStart0601();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0300
     * @tc.desc   Verify Array.prototype.fill can fill array-like objects with start and end indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillArrayLikeWithRange0602();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0400
     * @tc.desc   Verify Array.prototype.fill does not modify string (immutable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillString0603();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0500
     * @tc.desc   Verify Array.prototype.fill with negative start index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNegativeStart0604();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0600
     * @tc.desc   Verify Array.prototype.fill with negative end index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNegativeEnd0605();
      expect(result).assertTrue();
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0700
     * @tc.desc   Verify Array.prototype.fill with Infinity indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithInfinity0606();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0800
     * @tc.desc   Verify Array.prototype.fill with NaN indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNaN0607();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_0900
     * @tc.desc   Verify Array.prototype.fill with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithUndefinedValue0608();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1000
     * @tc.desc   Verify Array.prototype.fill with null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNullValue0609();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1100
     * @tc.desc   Verify Array.prototype.fill with object value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithObjectValue0610();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1200
     * @tc.desc   Verify Array.prototype.fill with function value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithFunctionValue0611();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1300
     * @tc.desc   Verify Array.prototype.fill with BigInt value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBigIntValue0612();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1400
     * @tc.desc   Verify Array.prototype.fill with Symbol value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSymbolValue0613();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1500
     * @tc.desc   Verify Array.prototype.fill with Date value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithDateValue0614();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1600
     * @tc.desc   Verify Array.prototype.fill with Map value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithMapValue0615();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1700
     * @tc.desc   Verify Array.prototype.fill with Set value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSetValue0616();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1800
     * @tc.desc   Verify Array.prototype.fill with RegExp value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithRegExpValue0617();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_1900
     * @tc.desc   Verify Array.prototype.fill with Array value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithArrayValue0618();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2000
     * @tc.desc   Verify Array.prototype.fill with TypedArray value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithTypedArray0619();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2100
     * @tc.desc   Verify Array.prototype.fill with Generator value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithGenerator0620();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2200
     * @tc.desc   Verify Array.prototype.fill with Promise value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithPromise0621();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2300
     * @tc.desc   Verify Array.prototype.fill with Error value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithError0622();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2400
     * @tc.desc   Verify Array.prototype.fill with Boolean value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBooleanValue0623();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2500
     * @tc.desc   Verify Array.prototype.fill with Float value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithFloatValue0624();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2600
     * @tc.desc   Verify Array.prototype.fill with Negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNegativeValue0625();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2700
     * @tc.desc   Verify Array.prototype.fill with Zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithZeroValue0626();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2800
     * @tc.desc   Verify Array.prototype.fill with Empty String value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithEmptyString0627();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_2900
     * @tc.desc   Verify Array.prototype.fill with Long String value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithLongString0628();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3000
     * @tc.desc   Verify Array.prototype.fill with Mixed Array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithMixedArrayLike0629();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3100
     * @tc.desc   Verify Array.prototype.fill with Large Array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithLargeArrayLike0630();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3200
     * @tc.desc   Verify Array.prototype.fill with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithTypedArray0631();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3300
     * @tc.desc   Verify Array.prototype.fill with arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithArguments0632();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3400
     * @tc.desc   Verify Array.prototype.fill with Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSet0633();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3500
     * @tc.desc   Verify Array.prototype.fill with Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithMap0634();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3600
     * @tc.desc   Verify Array.prototype.fill with WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithWeakSet0635();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3700
     * @tc.desc   Verify Array.prototype.fill with WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithWeakMap0636();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3800
     * @tc.desc   Verify Array.prototype.fill with BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBigInt0637();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_3900
     * @tc.desc   Verify Array.prototype.fill with Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSymbol0638();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4000
     * @tc.desc   Verify Array.prototype.fill with Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithDate0639();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4100
     * @tc.desc   Verify Array.prototype.fill with RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithRegExp0640();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4200
     * @tc.desc   Verify Array.prototype.fill with Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithError0641();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4300
     * @tc.desc   Verify Array.prototype.fill with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithPromise0642();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4400
     * @tc.desc   Verify Array.prototype.fill with Generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithGenerator0643();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4500
     * @tc.desc   Verify Array.prototype.fill with AsyncGenerator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithAsyncGenerator0644();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4600
     * @tc.desc   Verify Array.prototype.fill with Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithProxy0645();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4700
     * @tc.desc   Verify Array.prototype.fill with Reflect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithReflect0646();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4800
     * @tc.desc   Verify Array.prototype.fill with Math
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithMath0647();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_4900
     * @tc.desc   Verify Array.prototype.fill with JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithJSON0648();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5000
     * @tc.desc   Verify Array.prototype.fill with console
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithconsole0649();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5100
     * @tc.desc   Verify Array.prototype.fill with global
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithglobal0650();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5200
     * @tc.desc   Verify Array.prototype.fill with thisArg as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgUndefined0651();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5300
     * @tc.desc   Verify Array.prototype.fill with thisArg as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgNull0652();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5400
     * @tc.desc   Verify Array.prototype.fill with thisArg as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgNumber0653();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5500
     * @tc.desc   Verify Array.prototype.fill with thisArg as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgString0654();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5600
     * @tc.desc   Verify Array.prototype.fill with thisArg as boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgBoolean0655();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5700
     * @tc.desc   Verify Array.prototype.fill with thisArg as BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgBigInt0656();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5800
     * @tc.desc   Verify Array.prototype.fill with thisArg as Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgSymbol0657();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_5900
     * @tc.desc   Verify Array.prototype.fill with thisArg as Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgDate0658();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6000
     * @tc.desc   Verify Array.prototype.fill with thisArg as RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgRegExp0659();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6100
     * @tc.desc   Verify Array.prototype.fill with thisArg as Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgArray0660();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6200
     * @tc.desc   Verify Array.prototype.fill with thisArg as Function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgFunction0661();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6300
     * @tc.desc   Verify Array.prototype.fill with thisArg as Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgSet0662();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6400
     * @tc.desc   Verify Array.prototype.fill with thisArg as Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgMap0663();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6500
     * @tc.desc   Verify Array.prototype.fill with thisArg as Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgError0664();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6600
     * @tc.desc   Verify Array.prototype.fill with thisArg as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgPromise0665();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6700
     * @tc.desc   Verify Array.prototype.fill with thisArg as Generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgGenerator0666();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6800
     * @tc.desc   Verify Array.prototype.fill with thisArg as Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWiththisArgProxy0667();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_6900
     * @tc.desc   Verify Array.prototype.fill with complex object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithComplexObject0668();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7000
     * @tc.desc   Verify Array.prototype.fill with nested array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNestedArray0669();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7100
     * @tc.desc   Verify Array.prototype.fill with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithCircularReference0670();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7200
     * @tc.desc   Verify Array.prototype.fill with various TypedArray views
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithTypedArrayViews0671();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7300
     * @tc.desc   Verify Array.prototype.fill with String objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithStringObjects0672();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7400
     * @tc.desc   Verify Array.prototype.fill with Number objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNumberObjects0673();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7500
     * @tc.desc   Verify Array.prototype.fill with Boolean objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBooleanObjects0674();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7600
     * @tc.desc   Verify Array.prototype.fill with object having null prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithNullPrototype0675();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7700
     * @tc.desc   Verify Array.prototype.fill with custom iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithCustomIterator0676();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7800
     * @tc.desc   Verify Array.prototype.fill with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSymbolIterator0677();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest7900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_7900
     * @tc.desc   Verify Array.prototype.fill with ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithArrayBuffer0678();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8000
     * @tc.desc   Verify Array.prototype.fill with SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithSharedArrayBuffer0679();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8100
     * @tc.desc   Verify Array.prototype.fill with DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithDataView0680();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8200
     * @tc.desc   Verify Array.prototype.fill with Int8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithInt8Array0681();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8300
     * @tc.desc   Verify Array.prototype.fill with Uint8Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithUint8Array0682();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8400
     * @tc.desc   Verify Array.prototype.fill with Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithUint8ClampedArray0683();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8500
     * @tc.desc   Verify Array.prototype.fill with Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithInt16Array0684();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8600
     * @tc.desc   Verify Array.prototype.fill with Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithUint16Array0685();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8700
     * @tc.desc   Verify Array.prototype.fill with Int32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithInt32Array0686();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8800
     * @tc.desc   Verify Array.prototype.fill with Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithUint32Array0687();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest8900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_8900
     * @tc.desc   Verify Array.prototype.fill with Float32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithFloat32Array0688();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9000
     * @tc.desc   Verify Array.prototype.fill with Float64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithFloat64Array0689();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9100
     * @tc.desc   Verify Array.prototype.fill with BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBigInt64Array0690();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9200
     * @tc.desc   Verify Array.prototype.fill with BigUint64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithBigUint64Array0691();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9300
     * @tc.desc   Verify Array.prototype.fill with arrow function this binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithArrowFunctionThisBinding0692();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9400
     * @tc.desc   Verify Array.prototype.fill with dynamic array modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithDynamicArrayModification0693();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9500
     * @tc.desc   Verify Array.prototype.fill with complex thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithComplexthisArg0694();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9600
     * @tc.desc   Verify Array.prototype.fill with generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithGeneratorFunction0695();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9700
     * @tc.desc   Verify Array.prototype.fill with async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithAsyncFunction0696();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9800
     * @tc.desc   Verify Array.prototype.fill with proxy trap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithProxyTrap0697();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   BuiltinsArrayPrototypeFillNonArrayTest9900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_NON_ARRAY_TEST_9900
     * @tc.desc   Verify Array.prototype.fill with Reflect.apply
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFillNonArrayTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFillMissing.builtinsArrayFillWithReflectApply0698();
      expect(result).assertEqual(true);
    });
  });
}
