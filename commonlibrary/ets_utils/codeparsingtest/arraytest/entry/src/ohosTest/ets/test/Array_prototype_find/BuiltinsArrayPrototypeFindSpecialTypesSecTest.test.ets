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
import * as ArrayPrototypeFindSpecialTypes from './BuiltinsArrayPrototypeFindSpecialTypes';
import * as ArrayPrototypeFindMissing from './ArrayPrototypeFindMissingTest';
import * as ArrayPrototypeFindThisArg from './BuiltinsArrayPrototypeFindThisArg';
import Utils from '../Util.test';

export default function BuiltinsArrayPrototypeFindSpecialTypesTest2() {
  describe('BuiltinsArrayPrototypeFindSpecialTypesTest2', () => {
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
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0100
     * @tc.desc     Find getter element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithGetter0373();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0200
     * @tc.desc     Find setter element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithSetter0374();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0300
     * @tc.desc     Find static method element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithStaticMethod0375();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0400
     * @tc.desc     Find prototype method element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithPrototypeMethod0376();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0500
     * @tc.desc     Find bound function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithBoundFunction0377();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0600
     * @tc.desc     Find curried function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithCurriedFunction0378();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0700
     * @tc.desc     Find memoized function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithMemoizedFunction0379();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0800
     * @tc.desc     Find throttled function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithThrottledFunction0380();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_0900
     * @tc.desc     Find debounced function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond0900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithDebouncedFunction0381();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1000
     * @tc.desc     Find composed function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithComposedFunction0382();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1100
     * @tc.desc     Find partial applied function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithPartialAppliedFunction0383();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1200
     * @tc.desc     Find recursive function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithRecursiveFunction0384();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1300
     * @tc.desc     Find anonymous function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithAnonymousFunction0385();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1400
     * @tc.desc     Find arrow function with params element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithParams0387();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1500
     * @tc.desc     Find arrow function with rest params element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithRestParams0388();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1600
     * @tc.desc     Find arrow function with default params element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithDefaultParams0389();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1700
     * @tc.desc     Find arrow function with destructuring element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithDestructuring0390();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1800
     * @tc.desc     Find arrow function with spread element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithSpread0391();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_1900
     * @tc.desc     Find arrow function with this element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond1900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunctionWithThis0392();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2000
     * @tc.desc     Find async arrow function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithAsyncArrowFunction0393();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2100
     * @tc.desc     Find generator arrow function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithGeneratorArrowFunction0394();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTestSecond2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2200
     * @tc.desc     Find async generator arrow function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithAsyncGeneratorArrowFunction0395();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2300
     * @tc.desc   Verify Array.prototype.find with thisArg context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArg0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2400
     * @tc.desc   Verify Array.prototype.find with thisArg context for range check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgWithContext0101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2500
     * @tc.desc   Verify Array.prototype.find with arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgArrowFunction0102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2600
     * @tc.desc   Verify Array.prototype.find with undefined thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgUndefined0103();
      expect(result).assertEqual(true);
    });

    // Tests from BuiltinsArrayPrototypeFindThisArg.js
    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2700
     * @tc.desc   Test Array.prototype.find with thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArg0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2800
     * @tc.desc   Test Array.prototype.find with thisArg context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithContext0101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_2900
     * @tc.desc   Test Array.prototype.find with arrow function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgArrowFunction0102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3000
     * @tc.desc   Test Array.prototype.find with undefined thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgUndefined0103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3100
     * @tc.desc   Test Array.prototype.find with null thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgNull0104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3200
     * @tc.desc   Test Array.prototype.find with object thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgObject0105();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3300
     * @tc.desc   Test Array.prototype.find with array thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgArray0106();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3400
     * @tc.desc   Test Array.prototype.find with function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgFunction0107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3500
     * @tc.desc   Test Array.prototype.find with number thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgNumber0108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3600
     * @tc.desc   Test Array.prototype.find with string thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgString0109();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3700
     * @tc.desc   Test Array.prototype.find with boolean thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgBoolean0110();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3800
     * @tc.desc   Test Array.prototype.find with bigint thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgBigInt0111();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_3900
     * @tc.desc   Test Array.prototype.find with symbol thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgSymbol0112();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4000
     * @tc.desc   Test Array.prototype.find with bind thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithBind0113();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4100
     * @tc.desc   Test Array.prototype.find with call thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithCall0114();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4200
     * @tc.desc   Test Array.prototype.find with apply thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithApply0115();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4300
     * @tc.desc   Test Array.prototype.find with nested function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgInNestedFunction0116();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4400
     * @tc.desc   Test Array.prototype.find with closure thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClosure0117();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4500
     * @tc.desc   Test Array.prototype.find with constructor thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithConstructor0118();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4600
     * @tc.desc   Test Array.prototype.find with class thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClass0119();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4700
     * @tc.desc   Test Array.prototype.find with static method thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithStaticMethod0120();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4800
     * @tc.desc   Test Array.prototype.find with prototype method thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithPrototypeMethod0121();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_4900
     * @tc.desc   Test Array.prototype.find with getter thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithGetter0122();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5000
     * @tc.desc   Test Array.prototype.find with setter thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithSetter0123();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5100
     * @tc.desc   Test Array.prototype.find with proxy thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithProxy0124();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5200
     * @tc.desc   Test Array.prototype.find with proxy handler thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithProxyHandler0125();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5300
     * @tc.desc   Test Array.prototype.find with error thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithError0126();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5400
     * @tc.desc   Test Array.prototype.find with date thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithDate0127();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5500
     * @tc.desc   Test Array.prototype.find with regexp thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithRegExp0128();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5600
     * @tc.desc   Test Array.prototype.find with map thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithMap0129();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5700
     * @tc.desc   Test Array.prototype.find with set thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithSet0130();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5800
     * @tc.desc   Test Array.prototype.find with weak map thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithWeakMap0131();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_5900
     * @tc.desc   Test Array.prototype.find with weak set thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithWeakSet0132();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6000
     * @tc.desc   Test Array.prototype.find with promise thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithPromise0133();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6100
     * @tc.desc   Test Array.prototype.find with generator thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithGenerator0134();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6200
     * @tc.desc   Test Array.prototype.find with async generator thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithAsyncGenerator0135();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6300
     * @tc.desc   Test Array.prototype.find with circular reference thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithCircularReference0136();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6400
     * @tc.desc   Test Array.prototype.find with global object thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithGlobalObject0137();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6500
     * @tc.desc   Test Array.prototype.find with math object thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithMathObject0138();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6600
     * @tc.desc   Test Array.prototype.find with JSON object thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithJSONObject0139();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6700
     * @tc.desc   Test Array.prototype.find with array like thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayLike0140();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6800
     * @tc.desc   Test Array.prototype.find with function length thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithFunctionLength0141();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_6900
     * @tc.desc   Test Array.prototype.find with arrow function this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrowFunctionThis0143();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7000
     * @tc.desc   Test Array.prototype.find with arrow function lexical this thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrowFunctionLexicalThis0144();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7100
     * @tc.desc   Test Array.prototype.find with bound arrow function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithBoundArrowFunction0145();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7200
     * @tc.desc   Test Array.prototype.find with async function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithAsyncFunction0146();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7300
     * @tc.desc   Test Array.prototype.find with generator function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithGeneratorFunction0147();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7400
     * @tc.desc   Test Array.prototype.find with async generator function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithAsyncGeneratorFunction0148();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7500
     * @tc.desc   Test Array.prototype.find with constructor function thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithConstructorFunction0149();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7600
     * @tc.desc   Test Array.prototype.find with new keyword thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithNewKeyword0150();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7700
     * @tc.desc   Test Array.prototype.find with class constructor thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClassConstructor0151();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7800
     * @tc.desc   Test Array.prototype.find with class static thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClassStatic0152();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond7900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_7900
     * @tc.desc   Test Array.prototype.find with class instance thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClassInstance0153();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8000
     * @tc.desc   Test Array.prototype.find with class inheritance thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithClassInheritance0154();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8100
     * @tc.desc   Test Array.prototype.find with mixin thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithMixin0155();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8200
     * @tc.desc   Test Array.prototype.find with object create thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectCreate0156();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8300
     * @tc.desc   Test Array.prototype.find with object define property thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectDefineProperty0157();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8400
     * @tc.desc   Test Array.prototype.find with object define properties thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectDefineProperties0158();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8500
     * @tc.desc   Test Array.prototype.find with object get own property descriptor thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectGetOwnPropertyDescriptor0159();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8600
     * @tc.desc   Test Array.prototype.find with object keys thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectKeys0160();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8700
     * @tc.desc   Test Array.prototype.find with object values thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectValues0161();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8800
     * @tc.desc   Test Array.prototype.find with object entries thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectEntries0162();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond8900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_8900
     * @tc.desc   Test Array.prototype.find with object from entries thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectFromEntries0163();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9000
     * @tc.desc   Test Array.prototype.find with object assign thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectAssign0164();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9100
     * @tc.desc   Test Array.prototype.find with object spread thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithObjectSpread0165();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9200
     * @tc.desc   Test Array.prototype.find with array map thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayMap0166();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9300
     * @tc.desc   Test Array.prototype.find with array filter thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayFilter0167();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9400
     * @tc.desc   Test Array.prototype.find with array reduce thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayReduce0168();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9500
     * @tc.desc   Test Array.prototype.find with array every thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayEvery0169();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9600
     * @tc.desc   Test Array.prototype.find with array some thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArraySome0170();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindSpecialTypesTestSecond9700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_SECOND_9700
     * @tc.desc   Test Array.prototype.find with array forEach thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTestSecond9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindThisArg.builtinsArrayFindThisArgWithArrayForEach0171();
      expect(result).assertEqual(true);
    });
  });
}