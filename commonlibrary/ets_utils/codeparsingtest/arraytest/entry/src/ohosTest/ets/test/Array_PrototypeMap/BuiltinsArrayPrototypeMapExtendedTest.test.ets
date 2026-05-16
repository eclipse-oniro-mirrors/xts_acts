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
import * as MapMissing from './ArrayPrototypeMapMissingTest';

export default function BuiltinsArrayPrototypeMapExtendedTest(): void {
  describe("BuiltinsArrayPrototypeMapExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0100
     * @tc.desc   Verify map() with arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapArrowFunctionThisTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0200
     * @tc.desc   Verify map() with arrow function this context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapArrowFunctionThisContextTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0300
     * @tc.desc   Verify map() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSymbolTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0400
     * @tc.desc   Verify map() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapBigIntTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0500
     * @tc.desc   Verify map() on array-like object with map.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapArrayLikeTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0600
     * @tc.desc   Verify map() on arguments object with map.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapArgumentsTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0700
     * @tc.desc   Verify map() on string with map.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapStringTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0800
     * @tc.desc   Verify map() with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapTypedArrayTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_0900
     * @tc.desc   Verify map() with sparse array created by delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSparseDeleteTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1000
     * @tc.desc   Verify map() with sparse array vs explicit undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSparseVsUndefinedTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1100
     * @tc.desc   Verify map() with sparse array forEach vs map comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSparseForEachTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1200
     * @tc.desc   Verify map() with extreme sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapExtremeSparseTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1300
     * @tc.desc   Verify map() with callback throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapCallbackErrorTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1400
     * @tc.desc   Verify map() with thisArg as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapThisArgNumberTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1500
     * @tc.desc   Verify map() with thisArg as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapThisArgStringTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1600
     * @tc.desc   Verify map() with thisArg as boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapThisArgBooleanTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1700
     * @tc.desc   Verify map() with thisArg as Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapThisArgSymbolTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1800
     * @tc.desc   Verify map() with null prototype object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNullPrototypeTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_1900
     * @tc.desc   Verify map() with prototype chain modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapPrototypeChainTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2000
     * @tc.desc   Verify map() on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapFrozenTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2100
     * @tc.desc   Verify map() on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSealedTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2200
     * @tc.desc   Verify map() on Proxy array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapProxyTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2300
     * @tc.desc   Verify map() with length property is not number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapInvalidLengthTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2400
     * @tc.desc   Verify map() with length property is negative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNegativeLengthTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2500
     * @tc.desc   Verify map() with length property is Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapInfinityLengthTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2600
     * @tc.desc   Verify map() with parseInt trap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapParseIntTrapTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2700
     * @tc.desc   Verify map() with correct parseInt usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapParseIntCorrectTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2800
     * @tc.desc   Verify map() with filter and reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapFilterReduceTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_2900
     * @tc.desc   Verify map() with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapSpreadTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3000
     * @tc.desc   Verify map() with destructuring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapDestructuringTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3100
     * @tc.desc   Verify map() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapDateTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3200
     * @tc.desc   Verify map() with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapRegExpTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3300
     * @tc.desc   Verify map() with functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapFunctionTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3400
     * @tc.desc   Verify map() with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNestedArrayTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3500
     * @tc.desc   Verify map() with circular reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapCircularReferenceTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3600
     * @tc.desc   Verify map() with NaN and Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNaNInfinityTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3700
     * @tc.desc   Verify map() with 0 and -0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapZeroTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3800
     * @tc.desc   Verify map() with undefined and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapUndefinedNullTest3900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_3900
     * @tc.desc   Verify map() with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapBooleanTest4000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4000
     * @tc.desc   Verify map() with string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapStringValueTest4100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4100
     * @tc.desc   Verify map() with object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapObjectValueTest4200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4200
     * @tc.desc   Verify map() with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapEmptyStringTest4300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4300
     * @tc.desc   Verify map() with whitespace string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapWhitespaceStringTest4400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4400
     * @tc.desc   Verify map() throws error when callback is not a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNonFunctionCallbackTest4500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4500
     * @tc.desc   Verify map() throws error when callback is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNullCallbackTest4600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4600
     * @tc.desc   Verify map() throws error when callback is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapUndefinedCallbackTest4700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4700
     * @tc.desc   Verify map() throws error when no callback provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapNoCallbackTest4800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeMapExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_MAP_EXTENDED_TEST_4800
     * @tc.desc   Verify map() throws error when callback is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeMapExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = MapMissing.MapObjectCallbackTest4900();
      expect(result).assertEqual(true);
    });
  });
}
