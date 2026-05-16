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
function sleep(time: number) {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time)
  })
}

export default function BuiltinsArrayPrototypeFindComprehensive() {
    describe('BuiltinsArrayPrototypeFindComprehensive', () => {
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
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0100
     * @tc.desc   Verify Array.prototype.find with large array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithLargeArray0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0200
     * @tc.desc   Verify Array.prototype.find with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeFindComprehensive0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithEmptyArray0201();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0300
     * @tc.desc   Verify Array.prototype.find with sparse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithSparseArray0202();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0400
     * @tc.desc   Verify Array.prototype.find with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeFindComprehensive0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNegativeNumbers0203();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0500
     * @tc.desc   Verify Array.prototype.find with NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNaN0204();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0600
     * @tc.desc   Verify Array.prototype.find with Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithInfinity0205();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0700
     * @tc.desc   Verify Array.prototype.find with Symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithSymbol0206();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0800
     * @tc.desc   Verify Array.prototype.find with BigInt
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithBigInt0207();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_0900
     * @tc.desc   Verify Array.prototype.find with Function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithFunction0208();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1000
     * @tc.desc   Verify Array.prototype.find with Object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithObject0209();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1100
     * @tc.desc   Verify Array.prototype.find with Date
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithDate0210();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1200
     * @tc.desc   Verify Array.prototype.find with RegExp
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithRegex0211();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1300
     * @tc.desc   Verify Array.prototype.find with Boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeFindComprehensive1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithBoolean0212();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1400
     * @tc.desc   Verify Array.prototype.find with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNull0213();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1500
     * @tc.desc   Verify Array.prototype.find with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithUndefined0214();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1600
     * @tc.desc   Verify Array.prototype.find with String
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeFindComprehensive1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithString0215();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1700
     * @tc.desc   Verify Array.prototype.find with mixed types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithMixedTypes0216();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1800
     * @tc.desc   Verify Array.prototype.find with complex condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithComplexCondition0217();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_1900
     * @tc.desc   Verify Array.prototype.find with index parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithIndexParameter0218();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2000
     * @tc.desc   Verify Array.prototype.find with array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithArrayParameter0219();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2100
     * @tc.desc   Verify Array.prototype.find with early return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithEarlyReturn0220();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2200
     * @tc.desc   Verify Array.prototype.find with no match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeFindComprehensive2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNoMatch0221();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2300
     * @tc.desc   Verify Array.prototype.find with array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithArrayLike0222();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2400
     * @tc.desc   Verify Array.prototype.find with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithTypedArray0223();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2500
     * @tc.desc   Verify Array.prototype.find with arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithArguments0224();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2600
     * @tc.desc   Verify Array.prototype.find with modified array during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayPrototypeFindComprehensive2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithModifiedArray0225();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2700
     * @tc.desc   Verify Array.prototype.find with deleted elements during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayPrototypeFindComprehensive2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithDeletedElements0226();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2800
     * @tc.desc   Verify Array.prototype.find with thrown error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayPrototypeFindComprehensive2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithThrownError0227();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_2900
     * @tc.desc   Verify Array.prototype.find with async function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithAsyncFunction0228();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3000
     * @tc.desc   Verify Array.prototype.find with generator function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithGeneratorFunction0229();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3100
     * @tc.desc   Verify Array.prototype.find with non-function predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNonFunctionPredicate0230();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3200
     * @tc.desc   Verify Array.prototype.find with null predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNullPredicate0231();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3300
     * @tc.desc   Verify Array.prototype.find with undefined predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithUndefinedPredicate0232();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3400
     * @tc.desc   Verify Array.prototype.find with object predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithObjectPredicate0233();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3500
     * @tc.desc   Verify Array.prototype.find with number predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithNumberPredicate0234();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3600
     * @tc.desc   Verify Array.prototype.find with string predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithStringPredicate0235();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3700
     * @tc.desc   Verify Array.prototype.find with boolean predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithBooleanPredicate0236();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3800
     * @tc.desc   Verify Array.prototype.find with BigInt predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithBigIntPredicate0237();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_3900
     * @tc.desc   Verify Array.prototype.find with Symbol predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithSymbolPredicate0238();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4000
     * @tc.desc   Verify Array.prototype.find with Date predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithDatePredicate0239();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4100
     * @tc.desc   Verify Array.prototype.find with RegExp predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithRegexPredicate0240();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4200
     * @tc.desc   Verify Array.prototype.find with Array predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithArrayPredicate0241();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4300
     * @tc.desc   Verify Array.prototype.find with Set predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithSetPredicate0242();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4400
     * @tc.desc   Verify Array.prototype.find with Map predicate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithMapPredicate0243();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4500
     * @tc.desc   Verify Array.prototype.find with thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArg0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4600
     * @tc.desc   Verify Array.prototype.find with thisArg and complex context
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgWithContext0101();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4700
     * @tc.desc   Verify Array.prototype.find with thisArg and arrow function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      () => {
        let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgArrowFunction0102();
        expect(result).assertEqual(true);
      });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4800
     * @tc.desc   Verify Array.prototype.find with thisArg as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindThisArgUndefined0103();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_4900
     * @tc.desc   Verify Array.prototype.find with WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithWeakSet0104();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5000
     * @tc.desc   Verify Array.prototype.find with WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithWeakMap0105();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5100
     * @tc.desc   Verify Array.prototype.find with Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithError0106();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5200
     * @tc.desc   Verify Array.prototype.find with Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithPromise0107();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5300
     * @tc.desc   Verify Array.prototype.find with AsyncGenerator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithAsyncGenerator0108();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5400
     * @tc.desc   Verify Array.prototype.find with Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithProxy0109();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5500
     * @tc.desc   Verify Array.prototype.find with Reflect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithReflect0110();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5600
     * @tc.desc   Verify Array.prototype.find with Math
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithMath0111();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5700
     * @tc.desc   Verify Array.prototype.find with JSON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithJSON0112();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5800
     * @tc.desc   Verify Array.prototype.find with console
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithconsole0113();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_5900
     * @tc.desc   Verify Array.prototype.find with global
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWithglobal0114();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6000
     * @tc.desc   Verify Array.prototype.find with thisArg as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgNull0115();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6100
     * @tc.desc   Verify Array.prototype.find with thisArg as number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgNumber0116();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6200
     * @tc.desc   Verify Array.prototype.find with thisArg as string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgString0117();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6300
     * @tc.desc   Verify Array.prototype.find with thisArg as boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgBoolean0118();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6400
     * @tc.desc   Verify Array.prototype.find with thisArg as BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgBigInt0119();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6500
     * @tc.desc   Verify Array.prototype.find with thisArg as Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgSymbol0120();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6600
     * @tc.desc   Verify Array.prototype.find with thisArg as Date
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgDate0121();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6700
     * @tc.desc   Verify Array.prototype.find with thisArg as RegExp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgRegExp0122();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6800
     * @tc.desc   Verify Array.prototype.find with thisArg as Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgArray0123();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_6900
     * @tc.desc   Verify Array.prototype.find with thisArg as Function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgFunction0124();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7000
     * @tc.desc   Verify Array.prototype.find with thisArg as Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgSet0125();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7100
     * @tc.desc   Verify Array.prototype.find with thisArg as Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgMap0126();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7200
     * @tc.desc   Verify Array.prototype.find with thisArg as Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgError0127();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7300
     * @tc.desc   Verify Array.prototype.find with thisArg as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgPromise0128();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7400
     * @tc.desc   Verify Array.prototype.find with thisArg as Generator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgGenerator0129();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeFindComprehensive7500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7500
     * @tc.desc   Verify Array.prototype.find with thisArg as Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindMissing.builtinsArrayFindWiththisArgProxy0130();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive7600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7600
     * @tc.desc     Modify array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyDuringIteration0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive7700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7700
     * @tc.desc     Remove elements during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindRemoveDuringIteration0201();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive7800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7800
     * @tc.desc     Clear array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7800', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindClearDuringIteration0202();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive7900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_7900
     * @tc.desc     Callback function throws exception
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive7900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindCallbackException0203();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8000
     * @tc.desc     No callback function provided
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindNoCallback0204();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8100
     * @tc.desc     Non-function callback provided
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8100', TestType.FUNCTION|Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindNonFunctionCallback0205();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8200
     * @tc.desc     Modify array multiple times during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyMultipleTimes0206();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8300
     * @tc.desc     Modify array at end during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyAtEnd0207();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8400
     * @tc.desc     Modify array with negative indices during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithNegativeIndices0208();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8500
     * @tc.desc     Modify large array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithLargeArray0209();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8600
     * @tc.desc     Modify sparse array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithSparseArray0210();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8700
     * @tc.desc     Modify array with undefined during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithUndefined0211();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8800
     * @tc.desc     Modify array with null during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithNull0212();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive8900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_8900
     * @tc.desc     Modify array with boolean during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive8900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithBoolean0213();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9000
     * @tc.desc     Modify array with string during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9000', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithString0214();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9100
     * @tc.desc     Modify array with object during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9100', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithObject0215();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9200
     * @tc.desc     Modify array with function during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9200', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithFunction0216();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9300
     * @tc.desc     Modify array with symbol during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9300', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithSymbol0217();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9400
     * @tc.desc     Modify array with bigint during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9400', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithBigInt0218();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9500
     * @tc.desc     Modify array with NaN during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9500', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithNaN0219();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9600
     * @tc.desc     Modify array with infinity during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9600', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithInfinity0220();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9700
     * @tc.desc     Modify array with nested array during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9700', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithNestedArray0221();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9800
     * @tc.desc     Modify array with date during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9800', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithDate0222();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFindComprehensive9900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FIND_COMPREHENSIVE_9900
     * @tc.desc     Modify array with regexp during find iteration
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFindComprehensive9900', TestType.FUNCTION| Size.SMALLTEST| Level.LEVEL1, () => {
      let result: boolean = ArrayPrototypeFindModifyException.builtinsArrayFindModifyWithRegExp0223();
      expect(result).assertEqual(true);
    });

  });
}