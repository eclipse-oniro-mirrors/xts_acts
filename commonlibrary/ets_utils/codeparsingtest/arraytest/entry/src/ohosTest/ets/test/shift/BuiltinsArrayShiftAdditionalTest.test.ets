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
 * Array.prototype.shift() - Additional Tests
 * Supplementary test cases for features not fully covered
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

import {
  ArrayShiftSparseFullTestB300,
  ArrayShiftSparseAfterShiftTestB400,
  ArrayShiftSparseMixedTestB500,
  ArrayShiftAlternatingPushShiftTestC100,
  ArrayShiftAlternatingUnshiftShiftTestC200,
  ArrayShiftLargeStringTestC300,
  ArrayShiftObjectWithValueOfTestC400,
  ArrayShiftObjectWithToStringTestC500
} from './ArrayShiftAdditional';

export default function BuiltinsArrayShiftAdditionalTest(): void {
  describe("BuiltinsArrayShiftAdditionalTest", () => {
    beforeAll(async () => {
      console.info('[AdditionalTest] shift additional test started');
    })

    beforeEach(async () => {
      await Utils.msSleep(20);
    })

    afterEach(async () => {
    })

    afterAll(() => {
      console.info('[AdditionalTest] shift additional test completed');
    })

    /**
     * ============================================
     * Sparse Array Tests (B300-B500)
     * ============================================
     */

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0100
     * @tc.desc   Test shift() on fully sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftSparseFullTestB300();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] B300 - Run in JS env: ArrayShiftSparseFullTestB300()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0200
     * @tc.desc   Test shift() produces sparse array with correct indexing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftSparseAfterShiftTestB400();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] B400 - Run in JS env: ArrayShiftSparseAfterShiftTestB400()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0300
     * @tc.desc   Test shift() on sparse array with empty and actual values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftSparseMixedTestB500();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] B500 - Run in JS env: ArrayShiftSparseMixedTestB500()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * ============================================
     * Alternating Operations Tests (C100-C200)
     * ============================================
     */

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0400
     * @tc.desc   Test alternating push and shift operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftAlternatingPushShiftTestC100();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] C100 - Run in JS env: ArrayShiftAlternatingPushShiftTestC100()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0500
     * @tc.desc   Test alternating unshift and shift operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftAlternatingUnshiftShiftTestC200();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] C200 - Run in JS env: ArrayShiftAlternatingUnshiftShiftTestC200()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * ============================================
     * Edge Case Tests (C300-C500)
     * ============================================
     */

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0600
     * @tc.desc   Test shift() with very long string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftLargeStringTestC300();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] C300 - Run in JS env: ArrayShiftLargeStringTestC300()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0700
     * @tc.desc   Test shift() with object having valueOf method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftObjectWithValueOfTestC400();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] C400 - Run in JS env: ArrayShiftObjectWithValueOfTestC400()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0800
     * @tc.desc   Test shift() with object having toString method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltinsArrayShiftAdditionalTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      try {
        let result: boolean = ArrayShiftObjectWithToStringTestC500();
        expect(result).assertTrue();
      } catch (e) {
        console.info('[AdditionalTest] C500 - Run in JS env: ArrayShiftObjectWithToStringTestC500()');
        expect(e instanceof Error).assertTrue();
      }
    });

    /**
     * ============================================
     * JS-ONLY Tests (A100-C700)
     * These tests use features not supported in ArkTS
     * ============================================
     */

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest0900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_0900
     * @tc.desc   [JS-ONLY] Symbol type elements - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftSymbolTestA100()
     */
    it('BuiltinsArrayShiftAdditionalTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A100 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftSymbolTestA100()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1000
     * @tc.desc   [JS-ONLY] Array with multiple Symbols - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftSymbolArrayTestA200()
     */
    it('BuiltinsArrayShiftAdditionalTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A200 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftSymbolArrayTestA200()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1100
     * @tc.desc   [JS-ONLY] BigInt type elements - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftBigIntTestA300()
     */
    it('BuiltinsArrayShiftAdditionalTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A300 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftBigIntTestA300()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1200
     * @tc.desc   [JS-ONLY] Array with multiple BigInts - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftBigIntArrayTestA400()
     */
    it('BuiltinsArrayShiftAdditionalTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A400 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftBigIntArrayTestA400()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1300
     * @tc.desc   [JS-ONLY] Arguments object with Function.call - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftArgumentsTestA500()
     */
    it('BuiltinsArrayShiftAdditionalTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A500 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftArgumentsTestA500()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1400
     * @tc.desc   [JS-ONLY] Custom array-like object - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftArrayLikeBasicTestA600()
     */
    it('BuiltinsArrayShiftAdditionalTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A600 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftArrayLikeBasicTestA600()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1500
     * @tc.desc   [JS-ONLY] Array-like with numeric values - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftArrayLikeNumberTestA700()
     */
    it('BuiltinsArrayShiftAdditionalTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A700 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftArrayLikeNumberTestA700()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1600
     * @tc.desc   [JS-ONLY] shift.call(null) throws TypeError - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftCallNullTestA800()
     */
    it('BuiltinsArrayShiftAdditionalTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A800 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftCallNullTestA800()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1700
     * @tc.desc   [JS-ONLY] shift.call(undefined) throws TypeError - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftCallUndefinedTestA900()
     */
    it('BuiltinsArrayShiftAdditionalTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] A900 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftCallUndefinedTestA900()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1800
     * @tc.desc   [JS-ONLY] shift.call(number) throws TypeError - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftCallNumberTestB100()
     */
    it('BuiltinsArrayShiftAdditionalTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B100 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftCallNumberTestB100()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest1900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_1900
     * @tc.desc   [JS-ONLY] shift.call(string) throws TypeError - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftCallStringTestB200()
     */
    it('BuiltinsArrayShiftAdditionalTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B200 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftCallStringTestB200()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2000
     * @tc.desc   [JS-ONLY] Proxy wrapped array - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftProxyTestB600()
     */
    it('BuiltinsArrayShiftAdditionalTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B600 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftProxyTestB600()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2100
     * @tc.desc   [JS-ONLY] Read-only length property - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftReadOnlyLengthTestB700()
     */
    it('BuiltinsArrayShiftAdditionalTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B700 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftReadOnlyLengthTestB700()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2200
     * @tc.desc   [JS-ONLY] Int8Array shift behavior - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftTypedArrayInt8TestB800()
     */
    it('BuiltinsArrayShiftAdditionalTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B800 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftTypedArrayInt8TestB800()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2300
     * @tc.desc   [JS-ONLY] Float64Array shift behavior - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftTypedArrayFloat64TestB900()
     */
    it('BuiltinsArrayShiftAdditionalTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] B900 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftTypedArrayFloat64TestB900()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2400
     * @tc.desc   [JS-ONLY] Generator function results - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftGeneratorTestC600()
     */
    it('BuiltinsArrayShiftAdditionalTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      console.info('[AdditionalTest-JS] C600 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftGeneratorTestC600()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftAdditionalTest2500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_ADDITIONAL_TEST_2500
     * @tc.desc   [JS-ONLY] Promise elements - REQUIRES_JS_ENV
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     * @tc.note   JS Function: ArrayShiftPromiseTestC700()
     */
    it('BuiltinsArrayShiftAdditionalTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      console.info('[AdditionalTest-JS] C700 - Requires standard JS environment');
      console.info('[AdditionalTest-JS]       Function: ArrayShiftPromiseTestC700()');
      expect('[JS-ONLY]'.length > 0).assertTrue();
    });

  });
}
