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
import Utils from '../Util.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import * as ArrayPrototypeFilterMissing from './ArrayPrototypeFilterMissingTest';
import * as ArrayPrototypeFilterModify from './BuiltinsArrayPrototypeFilterModify';
import * as ArrayPrototypeFilterThisArg from './BuiltinsArrayPrototypeFilterThisArg';
import * as ArrayPrototypeFilterSparseException from './BuiltinsArrayPrototypeFilterSparseException';

export default function BuiltinsArrayPrototypeFilterSparseExceptionTest(){
  describe('BuiltinsArrayPrototypeFilterSparseExceptionTest', () => {
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
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0100
     * @tc.desc     Filter sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0100', TestType.FUNCTION| Size.SMALLTEST|Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArray0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0200
     * @tc.desc     Filter sparse array with index parameter
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0200', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithIndex0301();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0300
     * @tc.desc     Callback function throws exception
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0300', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterCallbackException0302();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0400
     * @tc.desc     No callback function provided
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0400', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterNoCallback0303();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0500
     * @tc.desc     Non-function callback provided
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterNonFunctionCallback0304();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0600
     * @tc.desc     Filter sparse array with holes
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithHoles0305();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0700
     * @tc.desc     Filter sparse array with large indices
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithLargeIndices0306();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0800
     * @tc.desc     Filter sparse array with zero
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithZero0307();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_0900
     * @tc.desc     Filter sparse array with negative values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest0900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithNegative0308();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1000
     * @tc.desc     Filter sparse array with NaN
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithNaN0309();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1100
     * @tc.desc     Filter sparse array with undefined
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithUndefined0310();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1200
     * @tc.desc     Filter sparse array with null
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithNull0311();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1300
     * @tc.desc     Filter sparse array with strings
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithString0312();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1400
     * @tc.desc     Filter sparse array with booleans
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithBoolean0313();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1500
     * @tc.desc     Filter sparse array with objects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithObject0314();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1600
     * @tc.desc     Filter sparse array with nested arrays
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithArray0315();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1700
     * @tc.desc     Filter sparse array with functions
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithFunction0316();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1800
     * @tc.desc     Filter sparse array with dates
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithDate0317();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_1900
     * @tc.desc     Filter sparse array with BigInt
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest1900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithBigInt0318();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2000
     * @tc.desc     Filter sparse array with Symbol
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithSymbol0319();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2100
     * @tc.desc     Filter sparse array with RegExp
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithRegExp0320();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2200
     * @tc.desc     Filter sparse array with Error
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithError0321();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2300
     * @tc.desc     Filter sparse array with Promise
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithPromise0322();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2400
     * @tc.desc     Filter sparse array with Generator
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithGenerator0323();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2500
     * @tc.desc     Filter sparse array with Proxy
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithProxy0324();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2600
     * @tc.desc     Filter sparse array with Reflect
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithReflect0325();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2700
     * @tc.desc     Filter sparse array with Math
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithMath0326();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2800
     * @tc.desc     Filter sparse array with JSON
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithJSON0327();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest2900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_2900
     * @tc.desc     Filter sparse array with thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest2900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithThisArg0328();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3000
     * @tc.desc     Filter sparse array with arrow function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithArrowFunction0329();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3100
     * @tc.desc     Filter sparse array with async function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithAsyncFunction0330();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3200
     * @tc.desc     Filter sparse array with generator function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithGeneratorFunction0331();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3300
     * @tc.desc     Filter sparse array with complex condition
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithComplexCondition0332();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3400
     * @tc.desc     Filter sparse array with side effects
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithSideEffects0333();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3500
     * @tc.desc     Filter large sparse array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithLargeArray0334();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3600
     * @tc.desc     Filter sparse typed array
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithTypedArray0335();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3700
     * @tc.desc     Filter sparse arguments
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithArguments0336();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3800
     * @tc.desc     Filter sparse array from Set
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithSet0337();
      expect(result).assertEqual(true);
    });
     /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest3900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_3900
     * @tc.desc     Filter sparse array from Map
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest3900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithMap0338();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4000
     * @tc.desc     Filter sparse array with WeakSet
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithWeakSet0339();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4100
     * @tc.desc     Filter sparse array with WeakMap
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithWeakMap0340();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4200
     * @tc.desc     Filter sparse array with BigInt values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithBigInt0341();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4300
     * @tc.desc     Filter sparse array with Symbol values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithSymbol0342();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4400
     * @tc.desc     Filter sparse array with Date values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithDate0343();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4500
     * @tc.desc     Filter sparse array with RegExp values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithRegExp0344();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4600
     * @tc.desc     Filter sparse array with Error values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithError0345();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4700
     * @tc.desc     Filter sparse array with Promise values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithPromise0346();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4800
     * @tc.desc     Filter sparse array with Generator values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithGenerator0347();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest4900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_4900
     * @tc.desc     Filter sparse array with AsyncGenerator values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest4900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithAsyncGenerator0348();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5000
     * @tc.desc     Filter sparse array with Proxy values
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithProxy0349();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5100
     * @tc.desc     Filter sparse array with Reflect
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterSparseException.builtinsArrayFilterSparseArrayWithReflect0350();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5200
     * @tc.desc     Filter with thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5200', TestType.FUNCTION|Size.SMALLTEST|Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArg0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5300
     * @tc.desc     Filter with thisArg context
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithContext0101();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5400
     * @tc.desc     Filter with arrow function ignores thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgArrowFunction0102();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5500
     * @tc.desc     Filter with undefined thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5500', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgUndefined0103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5600
     * @tc.desc     Filter with null thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5600', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgNull0104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5700
     * @tc.desc     Filter with number thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5700', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgNumber0105();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5800
     * @tc.desc     Filter with string thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgString0106();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest5900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_5900
     * @tc.desc     Filter with boolean thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest5900', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgBoolean0107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6000
     * @tc.desc     Filter with array thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6000', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgArray0108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6100
     * @tc.desc     Filter with function thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6100', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgFunction0109();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6200
     * @tc.desc     Filter with date thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6200', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgDate0110();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6300
     * @tc.desc     Filter with regexp thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6300', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgRegExp0111();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6400
     * @tc.desc     Filter with map thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6400', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgMap0112();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6500
     * @tc.desc     Filter with set thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6500', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgSet0113();
      expect(result).assertEqual(true);
    });

            /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6600
     * @tc.desc     Filter with complex object thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6600', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgComplexObject0114();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6700
     * @tc.desc     Filter with empty object thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6700', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgNestedContext0115();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6800
     * @tc.desc     Filter with nested object thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithBind0116();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest6900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_6900
     * @tc.desc     Filter with prototype thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest6900', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithCall0117();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7000
     * @tc.desc     Filter with class instance thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7000', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithApply0118();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7100
     * @tc.desc     Filter with thisArg in strict mode
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7100', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgInConstructor0119();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7200
     * @tc.desc     Filter with thisArg in non-strict mode
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7200', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgInClass0120();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7300
     * @tc.desc     Arrow function inherits outer this
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7300', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithGetter0121();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7400
     * @tc.desc     Filter with bound function thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7400', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithMethod0122();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7500
     * @tc.desc     Filter with call function thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7500', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithPrototype0123();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7600
     * @tc.desc     Filter with apply function thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7600', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithSymbol0124();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7700
     * @tc.desc     Filter with global this as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7700', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithBigInt0125();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7800
     * @tc.desc     Filter with window as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithNaN0126();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest7900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_7900
     * @tc.desc     Filter with global as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest7900', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithInfinity0127();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8000
     * @tc.desc     Filter with self as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8000', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithNegativeInfinity0128();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8100
     * @tc.desc     Filter with global scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8100', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithUndefinedProperty0129();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8200
     * @tc.desc     Filter with module scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8200', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithNullProperty0130();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8300
     * @tc.desc     Filter with function scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8300', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithBooleanProperty0131();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8400
     * @tc.desc     Filter with block scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8400', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithStringProperty0132();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8500
     * @tc.desc     Filter with catch scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8500', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithEmptyObject0133();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8600
     * @tc.desc     Filter with with scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8600', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithGlobalObject0134();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8700
     * @tc.desc     Filter with eval scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8700', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithProxy0135();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8800
     * @tc.desc     Filter with timeout scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithError0136();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest8900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_8900
     * @tc.desc     Filter with interval scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest8900', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithMath0137();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9000
     * @tc.desc     Filter with immediate scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9000', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithJSON0138();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9100
     * @tc.desc     Filter with animation scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9100', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithGenerator0139();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9200
     * @tc.desc     Filter with event scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9200', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithPromise0140();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9300
     * @tc.desc     Filter with promise scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9300', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithWeakMap0141();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9400
     * @tc.desc     Filter with async await scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9400', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithWeakSet0142();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9500
     * @tc.desc     Filter with generator scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9500', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithCircularReference0143();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9600
     * @tc.desc     Filter with proxy scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9600', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithArrayLike0144();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9700
     * @tc.desc     Filter with reflect scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9700', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithTypedArray0145();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9800
     * @tc.desc     Filter with json scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithSpread0146();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterSparseExceptionTest9900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_SPARSE_EXCEPTION_TEST_9900
     * @tc.desc     Filter with math scope as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterSparseExceptionTest9900', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFilterThisArg.builtinsArrayFilterThisArgWithObjectCreate0147();
      expect(result).assertEqual(true);
    });

  });
}