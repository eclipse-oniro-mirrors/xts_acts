/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativeShaderEffectTest() {
  describe('DrawingNativeShaderEffectTest', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
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
     * @tc.name   testShaderEffectCreateColorShaderNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0100
     * @tc.desc   test for testShaderEffectCreateColorShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateColorShaderNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateColorShaderNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0200
     * @tc.desc   test for testShaderEffectCreateColorShaderNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateColorShaderNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateColorShaderAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0300
     * @tc.desc   test for testShaderEffectCreateColorShaderAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateColorShaderAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateColorShaderMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0400
     * @tc.desc   test for testShaderEffectCreateColorShaderMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateColorShaderMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateColorShaderMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0500
     * @tc.desc   test for testShaderEffectCreateColorShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateColorShaderMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0600
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradientWithLocalMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0700
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradientWithLocalMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0800
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_0900
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradientWithLocalMatrixMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1000
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradienNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1100
     * @tc.desc   test for testShaderEffectCreateLinearGradienNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateLinearGradienNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradienNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1200
     * @tc.desc   test for testShaderEffectCreateLinearGradienNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradienNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradienAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1300
     * @tc.desc   test for testShaderEffectCreateLinearGradienAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradienAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradienMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1400
     * @tc.desc   test for testShaderEffectCreateLinearGradienMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradienMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateLinearGradienMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1500
     * @tc.desc   test for testShaderEffectCreateLinearGradienMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateLinearGradienMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1600
     * @tc.desc   test for testShaderEffectCreateRadialGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1700
     * @tc.desc   test for testShaderEffectCreateRadialGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1800
     * @tc.desc   test for testShaderEffectCreateRadialGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_1900
     * @tc.desc   test for testShaderEffectCreateRadialGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2000
     * @tc.desc   test for testShaderEffectCreateRadialGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2100
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateRadialGradientWithLocalMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2200
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientWithLocalMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2300
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2400
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientWithLocalMatrixMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2500
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2600
     * @tc.desc   test for testShaderEffectCreateSweepGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2700
     * @tc.desc   test for testShaderEffectCreateSweepGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2800
     * @tc.desc   test for testShaderEffectCreateSweepGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_2900
     * @tc.desc   test for testShaderEffectCreateSweepGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateGradient_3000
     * @tc.desc   test for testShaderEffectCreateSweepGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(29);
      expect(result).assertEqual(0);
    })

    // ShaderEffect Create Special test cases (18 cases)
    /**
     * @tc.name   testShaderEffectCreateImageShaderNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0100
     * @tc.desc   test for testShaderEffectCreateImageShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateImageShaderNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateImageShaderNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0200
     * @tc.desc   test for testShaderEffectCreateImageShaderNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateImageShaderNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateImageShaderMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0300
     * @tc.desc   test for testShaderEffectCreateImageShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateImageShaderMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateTwoPointConicalGradientNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0400
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateTwoPointConicalGradientNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateTwoPointConicalGradientNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0500
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateTwoPointConicalGradientNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateTwoPointConicalGradientAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0600
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateTwoPointConicalGradientAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateTwoPointConicalGradientMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0700
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateTwoPointConicalGradientMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateTwoPointConicalGradientMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0800
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateTwoPointConicalGradientMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectDestroy_0100
     * @tc.desc   test for testShaderEffectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectDestroy_0200
     * @tc.desc   test for testShaderEffectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_0900
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateSweepGradientWithLocalMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1000
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientWithLocalMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1100
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1200
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateComposeEnumTraversal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1300
     * @tc.desc   test for testShaderEffectCreateComposeEnumTraversal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreateComposeEnumTraversal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateComposeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1400
     * @tc.desc   test for testShaderEffectCreateComposeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateComposeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreateComposeMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1500
     * @tc.desc   test for testShaderEffectCreateComposeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreateComposeMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreatePixelMapShaderNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1600
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testShaderEffectCreatePixelMapShaderNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreatePixelMapShaderNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1700
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreatePixelMapShaderNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testShaderEffectCreatePixelMapShaderMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingShaderEffectCreateSpecial_1800
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testShaderEffectCreatePixelMapShaderMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(17);
      expect(result).assertEqual(0);
    })
  })
}