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
     * @tc.number     : SUB_THIRDPARTY_UBSAN_ALIGNMENT
     * @tc.name       : testAlignment
     * @tc.desc       : test alignment
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAlignment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number = ubsan.misAlign();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_BOOL
     * @tc.name       : testBool
     * @tc.desc       : test bool
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBool', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.undefinedBool();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_NULL
     * @tc.name       : testNull
     * @tc.desc       : test null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.nullSanitize(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_BOUNDS
     * @tc.name       : testBounds
     * @tc.desc       : test bounds
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.bounds(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_DIVIDEBYZERO
     * @tc.name       : testUBSanDiv0
     * @tc.desc       : test integerDivBy0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUBSanDiv0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.integerDivBy0(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_POINTEROVERFLOW
     * @tc.name       : testPointerOverflow
     * @tc.desc       : test PointerOverflow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testPointerOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.pointerOverflow(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_ENUM
     * @tc.name       : testEnum
     * @tc.desc       : test enum
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.enumSan(42);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_FLOATCASTOVERFLOW
     * @tc.name       : testFloatCastOverflow
     * @tc.desc       : test floatCastOverflow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testFloatCastOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.floatCastOverflow();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_VLABOUND
     * @tc.name       : testVlaBound
     * @tc.desc       : test VlaBound
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testVlaBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.vlaBound(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SIGNED_INTEGER_OVERFLOW
     * @tc.name       : testSignedIntegerOverflow
     * @tc.desc       : test SignedIntegerOverflow
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testSignedIntegerOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.signedIntegerOverflow(1073741824);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_VPTR
     * @tc.name       : testVptr
     * @tc.desc       : test Vptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testVptr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.vptrCheck();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_NONNULLATTRIBUTE
     * @tc.name       : testNonnullAttribute
     * @tc.desc       : test nonnullAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNonnullAttribute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.nonnullAttribute(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_RETURNNONNULLATTRIBUTE
     * @tc.name       : testReturnNonnullAttribute
     * @tc.desc       : test returnNonnullAttribute
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testReturnNonnullAttribute', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.returnNonnullAttribute(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_BASE
     * @tc.name       : testShiftBase
     * @tc.desc       : test ShiftBase
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testShiftBase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftBase(32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_BASE_NEGATIVE
     * @tc.name       : testShiftBaseNegative
     * @tc.desc       : test ShiftBaseNegative
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testShiftBaseNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftBaseNegative(-2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT
     * @tc.name       : testShiftExponent
     * @tc.desc       : test ShiftExponent
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testShiftExponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponent(32);
      expect(result).assertEqual(1);
    });

      /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_UNREACHABLE
     * @tc.name       : testUnreachable
     * @tc.desc       : test Unreachable
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUnreachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.unreachable(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT
     * @tc.name       : testShiftExponentNegative
     * @tc.desc       : test ShiftExponentNegative
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testShiftExponentNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponentNegative(-2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_SHIFT_EXPONENT_BOUND
     * @tc.name       : testShiftExponentBound
     * @tc.desc       : test ShiftExponentBound
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testShiftExponentBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.shiftExponentBound(32);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_UBSAN_NO_RETURN
     * @tc.name       : testNoReturn
     * @tc.desc       : test NoReturn
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testNoReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result: number = ubsan.noReturn(1);
      expect(result).assertEqual(1);
    });
  })
}