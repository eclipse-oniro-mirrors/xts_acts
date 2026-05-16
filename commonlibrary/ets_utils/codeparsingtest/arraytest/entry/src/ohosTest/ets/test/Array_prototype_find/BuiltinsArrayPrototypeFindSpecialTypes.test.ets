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
import * as ArrayPrototypeFindModifyException from './BuiltinsArrayPrototypeFindModifyException';
import Utils from '../Util.test';

export default function BuiltinsArrayPrototypeFindSpecialTypesTest() {
  describe('BuiltinsArrayPrototypeFindSpecialTypesTest', () => {
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
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0100
     * @tc.desc     Modify array with map during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithMap0224();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0200
     * @tc.desc     Modify array with set during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithSet0225();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0300
     * @tc.desc     Modify array with weak map during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithWeakMap0226();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0400
     * @tc.desc     Modify array with weak set during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithWeakSet0227();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0500
     * @tc.desc     Modify array with promise during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithPromise0228();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0600
     * @tc.desc     Modify array with generator during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithGenerator0229();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0700
     * @tc.desc     Modify array with proxy during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithProxy0230();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0800
     * @tc.desc     Modify array with error during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithError0231();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_0900
     * @tc.desc     Modify array with math object during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest0900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithMath0232();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1000
     * @tc.desc     Modify array with JSON object during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithJSON0233();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1100
     * @tc.desc     Modify array with global object during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithGlobal0234();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1200
     * @tc.desc     Modify empty array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithEmptyArray0235();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1300
     * @tc.desc     Modify single element array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithSingleElement0236();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1400
     * @tc.desc     Modify huge array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithHugeArray0237();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1500
     * @tc.desc     Modify array with circular reference during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithCircularReference0238();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1600
     * @tc.desc     Modify array with typed array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithTypedArray0239();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1700
     * @tc.desc     Modify array with array like object during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithArrayLike0240();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1800
     * @tc.desc     Modify array with spread during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithSpread0241();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_1900
     * @tc.desc     Modify array with Array.from during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest1900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithFrom0242();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2000
     * @tc.desc     Modify array with Array.of during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithOf0243();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2100
     * @tc.desc     Callback function with thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindCallbackWithThisArg0244();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2200
     * @tc.desc     Callback function with arrow function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindCallbackWithArrowFunction0245();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2300
     * @tc.desc     Callback function with bind
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindCallbackWithBind0246();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2400
     * @tc.desc     Find in empty array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindEmptyArray0247();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2500
     * @tc.desc     Find in array with all false results
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindAllFalse0248();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2600
     * @tc.desc     Find first matching element
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindFirstMatch0249();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2700
     * @tc.desc     Find with index parameter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithIndex0250();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2800
     * @tc.desc     Find with array parameter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithArray0251();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest2900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_2900
     * @tc.desc     Find NaN in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest2900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithNaN0252();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3000
     * @tc.desc     Find null in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithNull0253();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3100
     * @tc.desc     Find undefined in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithUndefined0254();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3200
     * @tc.desc     Find boolean in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithBoolean0255();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3300
     * @tc.desc     Find string in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithString0256();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3400
     * @tc.desc     Find object in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithObject0257();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3500
     * @tc.desc     Find function in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithFunction0258();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3600
     * @tc.desc     Find symbol in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithSymbol0259();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3700
     * @tc.desc     Find bigint in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindWithBigInt0260();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3800
     * @tc.desc     Find symbol element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSymbol0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest3900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_3900
     * @tc.desc     Find date element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest3900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindDate0301();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4000
     * @tc.desc     Find boolean element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4000', TestType.FUNCTION| Size.SMALLTEST|Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBoolean0302();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4100
     * @tc.desc     Find null element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNull0303();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4200
     * @tc.desc     Find undefined element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindUndefined0304();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4300
     * @tc.desc     Find NaN element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNaN0305();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4400
     * @tc.desc     Find element in array with mixed types
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMixedTypes0306();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4500
     * @tc.desc     Find function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindFunction0307();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4600
     * @tc.desc     Find bigint element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBigInt0308();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4700
     * @tc.desc     Find bigint element with comparison
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBigIntComparison0309();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4800
     * @tc.desc     Find regexp element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindRegExp0310();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest4900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_4900
     * @tc.desc     Find regexp element with flags in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest4900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindRegExpWithFlags0311();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5000
     * @tc.desc     Find map element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMap0312();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5100
     * @tc.desc     Find map element by size in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMapSize0313();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5200
     * @tc.desc     Find set element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSet0314();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5300
     * @tc.desc     Find set element by size in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSetSize0315();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5400
     * @tc.desc     Find weakmap element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWeakMap0316();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5500
     * @tc.desc     Find weakset element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWeakSet0317();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5600
     * @tc.desc     Find promise element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindPromise0318();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5700
     * @tc.desc     Find generator element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindGenerator0319();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5800
     * @tc.desc     Find proxy element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindProxy0320();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest5900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_5900
     * @tc.desc     Find error element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest5900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindError0321();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6000
     * @tc.desc     Find error element by message in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindErrorMessage0322();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6100
     * @tc.desc     Find nested array element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNestedArray0323();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6200
     * @tc.desc     Find deep nested array element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindDeepNestedArray0324();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6300
     * @tc.desc     Find array like element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindArrayLike0325();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6400
     * @tc.desc     Find circular reference element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindCircularReference0326();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6500
     * @tc.desc     Find math object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMathObject0327();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6600
     * @tc.desc     Find JSON object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindJSONObject0328();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6700
     * @tc.desc     Find global object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindGlobalObject0329();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6800
     * @tc.desc     Find symbol element by description in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSymbolDescription0330();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest6900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_6900
     * @tc.desc     Find symbol.for element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest6900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSymbolFor0331();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7000
     * @tc.desc     Find date element by comparison in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindDateComparison0332();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7100
     * @tc.desc     Find date element by year in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindDateYear0333();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7200
     * @tc.desc     Find truthy boolean element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBooleanTruthy0334();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7300
     * @tc.desc     Find falsy boolean element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBooleanFalsy0335();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7400
     * @tc.desc     Find null element in mixed array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNullInMixed0336();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7500
     * @tc.desc     Find undefined element in mixed array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindUndefinedInMixed0337();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7600
     * @tc.desc     Find NaN element in mixed array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNaNInMixed0338();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7700
     * @tc.desc     Find function element with arguments in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindFunctionWithArgs0339();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7800
     * @tc.desc     Find function element by length in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindFunctionLength0340();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest7900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_7900
     * @tc.desc     Find bigint element with overflow in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest7900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindBigIntOverflow0341();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8000
     * @tc.desc     Find regexp element by match in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindRegExpMatch0342();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8100
     * @tc.desc     Find map element by has key in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMapHasKey0343();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8200
     * @tc.desc     Find set element by has value in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindSetHasValue0344();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8300
     * @tc.desc     Find nested object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindNestedObject0345();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8400
     * @tc.desc     Find deep nested object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindDeepNestedObject0346();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8500
     * @tc.desc     Find array with objects element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindArrayWithObjects0347();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8600
     * @tc.desc     Find array with arrays element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindArrayWithArrays0348();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8700
     * @tc.desc     Find element in array with mixed complex types
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindMixedComplexTypes0349();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8800
     * @tc.desc     Find empty values element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindEmptyValues0350();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest8900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_8900
     * @tc.desc     Find truthy values element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest8900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindTruthyValues0351();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9000
     * @tc.desc     Find falsy values element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindFalsyValues0352();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9100
     * @tc.desc     Find custom object element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithCustomObject0353();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9200
     * @tc.desc     Find class instance element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithClassInstance0354();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9300
     * @tc.desc     Find async function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithAsyncFunction0366();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9400
     * @tc.desc     Find arrow function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithArrowFunction0367();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9500
     * @tc.desc     Find function expression element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithFunctionExpression0368();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9600
     * @tc.desc     Find generator function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithGeneratorFunction0369();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9700
     * @tc.desc     Find async generator function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithAsyncGeneratorFunction0370();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9800
     * @tc.desc     Find constructor function element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithConstructorFunction0371();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindSpecialTypesTest9900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_SPECIAL_TYPES_TEST_9900
     * @tc.desc     Find method element in array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindSpecialTypesTest9900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindSpecialTypes.builtinsArrayFindWithMethod0372();
      expect(result).assertEqual(true);
    });

  });
}