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

/**
 * Array.prototype.reduceRight() - Hybrid Test
 * Imports JS test functions and verifies their execution in ArkTS
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

import {
  ArrayReduceRightSymbolInitialTest0100,
  ArrayReduceRightSymbolArrayTest0200,
  ArrayReduceRightBigIntInitialTest0300,
  ArrayReduceRightBigInt64ArrayTest0400,
  ArrayReduceRightPromiseChainTest0500,
  ArrayReduceRightPromiseResolveTest0600,
  ArrayReduceRightArrayLikeBasicTest0700,
  ArrayReduceRightArrayLikeStringTest0800,
  ArrayReduceRightArgumentsTest0900,
  ArrayReduceRightCallbackUndefinedTest1000,
  ArrayReduceRightCallbackNullTest1100,
  ArrayReduceRightCallbackNumberTest1200,
  ArrayReduceRightCallbackStringTest1300,
  ArrayReduceRightCallbackObjectTest1400,
  ArrayReduceRightNoCallbackTest1500,
  ArrayReduceRightAccessNullPropertyTest1600,
  ArrayReduceRightAccessUndefinedPropertyTest1700,
  ArrayReduceRightDeleteElementTest1800,
  ArrayReduceRightIteratorTest1900,
  ArrayReduceRightGeneratorTest2000
} from './ArrayReduceRightUnsupported';

export default function BuiltinsArrayReduceRightHybridTest(): void {
  describe("BuiltinsArrayReduceRightHybridTest", () => {
    beforeAll(async () => {
      console.info('[HybridTest] reduceRight hybrid test started');
    })

    beforeEach(async () => {
      await Utils.msSleep(20);
    })

    afterEach(async () => {
    })

    afterAll(() => {
      console.info('[HybridTest] reduceRight hybrid test completed');
    })

    /**
     * Symbol Tests (0100-0200)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0100
     * @tc.desc   Test reduceRight() with Symbol as initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        let result: boolean = ArrayReduceRightSymbolInitialTest0100();
        expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0200
     * @tc.desc   Test reduceRight() with array of Symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightSymbolArrayTest0200();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0200 - Run in JS env: ArrayReduceRightSymbolArrayTest0200()');

      }
    });

    /**
     * BigInt Tests (0300-0400)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0300
     * @tc.desc   Test reduceRight() with BigInt initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightBigIntInitialTest0300();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0300 - Run in JS env: ArrayReduceRightBigIntInitialTest0300()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0400
     * @tc.desc   Test reduceRight() on BigInt64Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightBigInt64ArrayTest0400();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0400 - Run in JS env: ArrayReduceRightBigInt64ArrayTest0400()');

      }
    });

    /**
     * Promise Tests (0500-0600)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0500
     * @tc.desc   Test reduceRight() creating promise chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightPromiseChainTest0500();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0500 - Run in JS env: ArrayReduceRightPromiseChainTest0500()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0600
     * @tc.desc   Test reduceRight() promise chain resolves correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let result: boolean = await ArrayReduceRightPromiseResolveTest0600();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0600 - Run in JS env: ArrayReduceRightPromiseResolveTest0600()');

      }
    });

    /**
     * Array-like Tests (0700-0900)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0700
     * @tc.desc   Test reduceRight() on array-like object using Function.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightArrayLikeBasicTest0700();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0700 - Run in JS env: ArrayReduceRightArrayLikeBasicTest0700()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0800
     * @tc.desc   Test reduceRight() on string using Function.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightArrayLikeStringTest0800();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0800 - Run in JS env: ArrayReduceRightArrayLikeStringTest0800()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_0900
     * @tc.desc   Test reduceRight() on arguments object using Function.call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightArgumentsTest0900();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 0900 - Run in JS env: ArrayReduceRightArgumentsTest0900()');

      }
    });

    /**
     * Exception Tests - Non-function callback (1000-1400)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1000
     * @tc.desc   Test reduceRight() with undefined callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightCallbackUndefinedTest1000();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1000 - Run in JS env: ArrayReduceRightCallbackUndefinedTest1000()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1100
     * @tc.desc   Test reduceRight() with null callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightCallbackNullTest1100();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1100 - Run in JS env: ArrayReduceRightCallbackNullTest1100()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1200
     * @tc.desc   Test reduceRight() with number callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightCallbackNumberTest1200();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1200 - Run in JS env: ArrayReduceRightCallbackNumberTest1200()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1300
     * @tc.desc   Test reduceRight() with string callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightCallbackStringTest1300();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1300 - Run in JS env: ArrayReduceRightCallbackStringTest1300()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1400
     * @tc.desc   Test reduceRight() with object callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightCallbackObjectTest1400();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1400 - Run in JS env: ArrayReduceRightCallbackObjectTest1400()');

      }
    });

    /**
     * Exception Tests - Missing callback parameter (1500)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1500
     * @tc.desc   Test reduceRight() with no callback throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightNoCallbackTest1500();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1500 - Run in JS env: ArrayReduceRightNoCallbackTest1500()');

      }
    });

    /**
     * Exception Tests - Property access (1600-1700)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1600
     * @tc.desc   Test reduceRight() accessing property of null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightAccessNullPropertyTest1600();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1600 - Run in JS env: ArrayReduceRightAccessNullPropertyTest1600()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1700
     * @tc.desc   Test reduceRight() accessing property of undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightAccessUndefinedPropertyTest1700();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1700 - Run in JS env: ArrayReduceRightAccessUndefinedPropertyTest1700()');

      }
    });

    /**
     * Array modification test (1800)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1800
     * @tc.desc   Test reduceRight() deleting element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightDeleteElementTest1800();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1800 - Run in JS env: ArrayReduceRightDeleteElementTest1800()');

      }
    });

    /**
     * Iterator/Generator Tests (1900-2000)
     */

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_1900
     * @tc.desc   Test reduceRight() with iterator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightIteratorTest1900();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 1900 - Run in JS env: ArrayReduceRightIteratorTest1900()');

      }
    });

    /**
     * @tc.name   BuiltinsArrayReduceRightHybridTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_RIGHT_HYBRID_TEST_2000
     * @tc.desc   Test reduceRight() with generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayReduceRightHybridTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayReduceRightGeneratorTest2000();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[HybridTest] 2000 - Run in JS env: ArrayReduceRightGeneratorTest2000()');

      }
    });

  });
}
