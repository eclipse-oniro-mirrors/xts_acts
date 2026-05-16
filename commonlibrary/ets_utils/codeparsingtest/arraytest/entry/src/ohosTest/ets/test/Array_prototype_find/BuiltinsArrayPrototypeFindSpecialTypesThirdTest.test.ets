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
import * as ArrayPrototypeFindSpecialTypes from './BuiltinsArrayPrototypeFindSpecialTypes';
import * as ArrayPrototypeFindMissing from './ArrayPrototypeFindMissingTest';
import * as ArrayPrototypeFindThisArg from './BuiltinsArrayPrototypeFindThisArg';
import * as ArrayPrototypeFindModifyException from './BuiltinsArrayPrototypeFindModifyException';

export default function BuiltinsArrayPrototypeFindSpecialTypesTest3() {
  describe('BuiltinsArrayPrototypeFindSpecialTypesTest3', () => {
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
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0100
     * @tc.desc   Test Array.prototype.find with array map this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayMapThis0172();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0200
     * @tc.desc   Test Array.prototype.find with array filter this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayFilterThis0173();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0300
     * @tc.desc   Test Array.prototype.find with array reduce this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayReduceThis0174();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0400
     * @tc.desc   Test Array.prototype.find with function call thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionCall0175();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0500
     * @tc.desc   Test Array.prototype.find with function apply thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionApply0176();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0600
     * @tc.desc   Test Array.prototype.find with function bind thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionBind0177();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0700
     * @tc.desc   Test Array.prototype.find with nested bind thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithNestedBind0178();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0800
     * @tc.desc   Test Array.prototype.find with partial application thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithPartialApplication0179();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_0900
     * @tc.desc   Test Array.prototype.find with currying thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithCurrying0180();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1000
     * @tc.desc   Test Array.prototype.find with memoization thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithMemoization0181();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1100
     * @tc.desc   Test Array.prototype.find with throttling thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithThrottling0182();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1200
     * @tc.desc   Test Array.prototype.find with debouncing thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithDebouncing0183();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1300
     * @tc.desc   Test Array.prototype.find with composition thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithComposition0184();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1400
     * @tc.desc   Test Array.prototype.find with error throwing thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithErrorThrowing0185();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1500
     * @tc.desc   Test Array.prototype.find with try catch thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithTryCatch0186();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1600
     * @tc.desc   Test Array.prototype.find with async error thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithAsyncError0187();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1700
     * @tc.desc   Test Array.prototype.find with sync error thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithSyncError0188();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1800
     * @tc.desc   Test Array.prototype.find with dynamic context thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithDynamicContext0189();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_1900
     * @tc.desc   Test Array.prototype.find with changing context thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithChangingContext0190();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2000
     * @tc.desc   Test Array.prototype.find with array map this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayMapThis0172();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2100
     * @tc.desc   Test Array.prototype.find with array filter this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayFilterThis0173();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2200
     * @tc.desc   Test Array.prototype.find with array reduce this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayReduceThis0174();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2300
     * @tc.desc   Test Array.prototype.find with function call thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionCall0175();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2400
     * @tc.desc   Test Array.prototype.find with function apply thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionApply0176();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2500
     * @tc.desc   Test Array.prototype.find with function bind thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionBind0177();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2600
     * @tc.desc   Test Array.prototype.find with nested bind thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithNestedBind0178();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2700
     * @tc.desc   Test Array.prototype.find with partial application thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithPartialApplication0179();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2800
     * @tc.desc   Test Array.prototype.find with currying thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithCurrying0180();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_2900
     * @tc.desc   Test Array.prototype.find with memoization thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithMemoization0181();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3000
     * @tc.desc   Test Array.prototype.find with throttling thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithThrottling0182();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3100
     * @tc.desc   Test Array.prototype.find with debouncing thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithDebouncing0183();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3200
     * @tc.desc   Test Array.prototype.find with composition thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithComposition0184();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3300
     * @tc.desc   Test Array.prototype.find with error throwing thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithErrorThrowing0185();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3400
     * @tc.desc   Test Array.prototype.find with try catch thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithTryCatch0186();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3500
     * @tc.desc   Test Array.prototype.find with async error thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithAsyncError0187();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3600
     * @tc.desc   Test Array.prototype.find with sync error thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithSyncError0188();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3700
     * @tc.desc   Test Array.prototype.find with dynamic context thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithDynamicContext0189();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestThird3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_THIRD_3800
     * @tc.desc   Test Array.prototype.find with changing context thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestThird3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithChangingContext0190();
      expect(result).assertEqual(true);
    });
  });
}