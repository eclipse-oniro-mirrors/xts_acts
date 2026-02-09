/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

import ubsan from 'libentry.so'
import Utils from './Utils'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from "@ohos/hypium";

export default function abilityTest() {

  describe('ActsThirdPartyUBSanTest', () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(1000)
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(1000)
    })

    /**
     * @tc.name   testAlignment
     * @tc.number SUB_THIRDPARTY_UBSAN_ALIGNMENT
     * @tc.desc   test alignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAlignment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = ubsan.misAlign();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testBool
     * @tc.number SUB_THIRDPARTY_UBSAN_BOOL
     * @tc.desc   test bool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.undefinedBool();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testNull
     * @tc.number SUB_THIRDPARTY_UBSAN_NULL
     * @tc.desc   test null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.nullSanitize(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testBounds
     * @tc.number SUB_THIRDPARTY_UBSAN_BOUNDS
     * @tc.desc   test bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.bounds(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testUBSanDiv0
     * @tc.number SUB_THIRDPARTY_UBSAN_DIVIDEBYZERO
     * @tc.desc   test integerDivBy0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUBSanDiv0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.integerDivBy0(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testPointerOverflow
     * @tc.number SUB_THIRDPARTY_UBSAN_POINTEROVERFLOW
     * @tc.desc   test PointerOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPointerOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.pointerOverflow(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testEnum
     * @tc.number SUB_THIRDPARTY_UBSAN_ENUM
     * @tc.desc   test enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.enumSan(42);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testFloatCastOverflow
     * @tc.number SUB_THIRDPARTY_UBSAN_FLOATCASTOVERFLOW
     * @tc.desc   test floatCastOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFloatCastOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.floatCastOverflow();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testVlaBound
     * @tc.number SUB_THIRDPARTY_UBSAN_VLABOUND
     * @tc.desc   test VlaBound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVlaBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.vlaBound(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testSignedIntegerOverflow
     * @tc.number SUB_THIRDPARTY_UBSAN_SIGNED_INTEGER_OVERFLOW
     * @tc.desc   test SignedIntegerOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSignedIntegerOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.signedIntegerOverflow(1073741824);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testVptr
     * @tc.number SUB_THIRDPARTY_UBSAN_VPTR
     * @tc.desc   test Vptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.vptrCheck();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testNonnullAttribute
     * @tc.number SUB_THIRDPARTY_NONNULLATTRIBUTE
     * @tc.desc   test nonnullAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNonnullAttribute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.nonnullAttribute(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testReturnNonnullAttribute
     * @tc.number SUB_THIRDPARTY_RETURNNONNULLATTRIBUTE
     * @tc.desc   test returnNonnullAttribute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReturnNonnullAttribute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.returnNonnullAttribute(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testShiftBase
     * @tc.number SUB_THIRDPARTY_UBSAN_SHIFT_BASE
     * @tc.desc   test ShiftBase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShiftBase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftBase(32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testShiftBaseNegative
     * @tc.number SUB_THIRDPARTY_UBSAN_SHIFT_BASE_NEGATIVE
     * @tc.desc   test ShiftBaseNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShiftBaseNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftBaseNegative(-2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testShiftExponent
     * @tc.number SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT
     * @tc.desc   test ShiftExponent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShiftExponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponent(32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testUnreachable
     * @tc.number SUB_THIRDPARTY_UBSAN_UNREACHABLE
     * @tc.desc   test Unreachable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.unreachable(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testShiftExponentNegative
     * @tc.number SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT
     * @tc.desc   test ShiftExponentNegative
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShiftExponentNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponentNegative(-2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testShiftExponentBound
     * @tc.number SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT_BOUND
     * @tc.desc   test ShiftExponentBound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testShiftExponentBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponentBound(32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   testNoReturn
     * @tc.number SUB_THIRDPARTY_UBSAN_NO_RETURN
     * @tc.desc   test NoReturn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNoReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.noReturn(1);
      expect(result).assertEqual(1);
    });
  })
}