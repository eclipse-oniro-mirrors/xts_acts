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


export default function DrawingNativePenTest() {
  describe('DrawingNativePenTest', () => {
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
     * @tc.name   testPenCreateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0100
     * @tc.desc   Test for testPenCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenCreateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0200
     * @tc.desc   Test for testPenCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0300
     * @tc.desc   Test for testPenCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenCopyInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0400
     * @tc.desc   Test for testPenCopyInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenCopyInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0500
     * @tc.desc   Test for testPenDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCreateDestroy_0600
     * @tc.desc   Test for testPenDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCreateDestroy(5);
      expect(result).assertEqual(0);
    })

    // Pen AntiAlias related test cases (4 cases)
    /**
     * @tc.name   testPenIsAntiAliasNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAntiAlias_0100
     * @tc.desc   Test for testPenIsAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenIsAntiAliasNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenIsAntiAliasNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAntiAlias_0200
     * @tc.desc   Test for testPenIsAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenIsAntiAliasNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAntiAliasNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAntiAlias_0300
     * @tc.desc   Test for testPenSetAntiAliasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAntiAliasNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAntiAliasNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAntiAlias_0400
     * @tc.desc   Test for testPenSetAntiAliasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAntiAliasNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAntiAlias(3);
      expect(result).assertEqual(0);
    })

    // Pen Color related test cases (6 cases)
    /**
     * @tc.name   testPenGetColorNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0100
     * @tc.desc   Test for testPenGetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetColorNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetColorNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0200
     * @tc.desc   Test for testPenGetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetColorNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColorNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0300
     * @tc.desc   Test for testPenSetColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetColorNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColorNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0400
     * @tc.desc   Test for testPenSetColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColorAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0500
     * @tc.desc   Test for testPenSetColorAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColorMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenColor_0600
     * @tc.desc   Test for testPenSetColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColorMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenColor(5);
      expect(result).assertEqual(0);
    })

    // Pen Alpha related test cases (6 cases)
    /**
     * @tc.name   testPenGetAlphaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0100
     * @tc.desc   Test for testPenGetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetAlphaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAlpha(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetAlphaNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0200
     * @tc.desc   Test for testPenGetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetAlphaNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAlphaNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0300
     * @tc.desc   Test for testPenSetAlphaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetAlphaNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenAlpha(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAlphaNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0400
     * @tc.desc   Test for testPenSetAlphaNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAlphaNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAlphaAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0500
     * @tc.desc   Test for testPenSetAlphaAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAlphaAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetAlphaMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenAlpha_0600
     * @tc.desc   Test for testPenSetAlphaMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetAlphaMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenAlpha(5);
      expect(result).assertEqual(0);
    })

    // Pen Width related test cases (8 cases)
    /**
     * @tc.name   testPenGetWidthNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0100
     * @tc.desc   Test for testPenGetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetWidthNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetWidthNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0200
     * @tc.desc   Test for testPenGetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetWidthNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetWidthBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0300
     * @tc.desc   Test for testPenGetWidthBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetWidthBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetWidthNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0400
     * @tc.desc   Test for testPenSetWidthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetWidthNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenWidth(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetWidthNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0500
     * @tc.desc   Test for testPenSetWidthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetWidthNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetWidthAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0600
     * @tc.desc   Test for testPenSetWidthAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetWidthAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetWidthMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0700
     * @tc.desc   Test for testPenSetWidthMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetWidthMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetWidthMultipleCallsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenWidth_0800
     * @tc.desc   Test for testPenSetWidthMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetWidthMultipleCallsBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenWidth(7);
      expect(result).assertEqual(0);
    })

    // Pen MiterLimit related test cases (6 cases)
    /**
     * @tc.name   testPenGetMiterLimitNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0100
     * @tc.desc   Test for testPenGetMiterLimitNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetMiterLimitNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetMiterLimitNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0200
     * @tc.desc   Test for testPenGetMiterLimitNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetMiterLimitNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetMiterLimitNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0300
     * @tc.desc   Test for testPenSetMiterLimitNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetMiterLimitNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetMiterLimitNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0400
     * @tc.desc   Test for testPenSetMiterLimitNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMiterLimitNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetMiterLimitAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0500
     * @tc.desc   Test for testPenSetMiterLimitAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMiterLimitAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetMiterLimitMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenMiterLimit_0600
     * @tc.desc   Test for testPenSetMiterLimitMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetMiterLimitMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenMiterLimit(5);
      expect(result).assertEqual(0);
    })

    // Pen Cap related test cases (5 cases)
    /**
     * @tc.name   testPenGetCapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCap_0100
     * @tc.desc   Test for testPenGetCapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetCapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetCapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCap_0200
     * @tc.desc   Test for testPenGetCapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetCapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetCapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCap_0300
     * @tc.desc   Test for testPenSetCapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetCapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenCap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetCapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCap_0400
     * @tc.desc   Test for testPenSetCapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetCapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetCapMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenCap_0500
     * @tc.desc   Test for testPenSetCapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetCapMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenCap(4);
      expect(result).assertEqual(0);
    })

    // Pen Join related test cases (5 cases)
    /**
     * @tc.name   testPenGetJoinNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenJoin_0100
     * @tc.desc   Test for testPenGetJoinNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetJoinNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenJoin(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetJoinNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenJoin_0200
     * @tc.desc   Test for testPenGetJoinNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetJoinNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetJoinNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenJoin_0300
     * @tc.desc   test for testPenSetJoinNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetJoinNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenJoin(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetJoinNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenJoin_0400
     * @tc.desc   test for testPenSetJoinNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetJoinNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetJoinMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenJoin_0500
     * @tc.desc   test for testPenSetJoinMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetJoinMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenJoin(4);
      expect(result).assertEqual(0);
    })

    // Pen Effects related test cases (6 cases)
    /**
     * @tc.name   testPenSetShaderEffectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0100
     * @tc.desc   test for testPenSetShaderEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetShaderEffectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetShaderEffectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0200
     * @tc.desc   test for testPenSetShaderEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetShaderEffectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetShadowLayerNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0300
     * @tc.desc   test for testPenSetShadowLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetShadowLayerNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetShadowLayerNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0400
     * @tc.desc   test for testPenSetShadowLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetShadowLayerNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetPathEffectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0500
     * @tc.desc   test for testPenSetPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetPathEffectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenEffects(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetPathEffectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenEffects_0600
     * @tc.desc   test for testPenSetPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetPathEffectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenEffects(5);
      expect(result).assertEqual(0);
    })

    // Pen Filter related test cases (4 cases)
    /**
     * @tc.name   testPenSetFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenFilter_0100
     * @tc.desc   test for testPenSetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetFilterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenFilter_0200
     * @tc.desc   test for testPenSetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetFilterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetFilterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenFilter_0300
     * @tc.desc   test for testPenGetFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetFilterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenFilter(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetFilterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenFilter_0400
     * @tc.desc   test for testPenGetFilterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetFilterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenFilter(3);
      expect(result).assertEqual(0);
    })

    // Pen BlendMode related test cases (2 cases)
    /**
     * @tc.name   testPenSetBlendModeNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenBlendMode_0100
     * @tc.desc   test for testPenSetBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenSetBlendModeNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetBlendModeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenBlendMode_0200
     * @tc.desc   test for testPenSetBlendModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetBlendModeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenBlendMode(1);
      expect(result).assertEqual(0);
    })

    // Pen GetFillPath related test cases (2 cases)
    /**
     * @tc.name   testPenGetFillPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFillPath_0100
     * @tc.desc   test for testPenGetFillPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenGetFillPathNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenGetFillPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetFillPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFillPath_0200
     * @tc.desc   test for testPenGetFillPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetFillPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFillPath(1);
      expect(result).assertEqual(0);
    })

    // Pen Reset related test cases (3 cases)
    /**
     * @tc.name   testPenResetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenReset_0100
     * @tc.desc   test for testPenResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPenResetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPenReset(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenResetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenReset_0200
     * @tc.desc   test for testPenResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenResetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenReset(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenResetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenReset_0300
     * @tc.desc   test for testPenResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenResetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenReset(2);
      expect(result).assertEqual(0);
    })

    // Pen GetFloat related test cases (8 cases)
    /**
     * @tc.name   testPenGetAlphaFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0100
     * @tc.desc   test for testPenGetAlphaFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetAlphaFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetAlphaFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0200
     * @tc.desc   test for testPenGetAlphaFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetAlphaFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetRedFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0300
     * @tc.desc   test for testPenGetRedFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetRedFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetRedFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0400
     * @tc.desc   test for testPenGetRedFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetRedFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetGreenFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0500
     * @tc.desc   test for testPenGetGreenFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetGreenFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetGreenFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0600
     * @tc.desc   test for testPenGetGreenFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetGreenFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetBlueFloatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0700
     * @tc.desc   test for testPenGetBlueFloatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testPenGetBlueFloatNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenGetFloat(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenGetBlueFloatAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenGetFloat_0800
     * @tc.desc   test for testPenGetBlueFloatAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenGetBlueFloatAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenGetFloat(7);
      expect(result).assertEqual(0);
    })

    // Pen SetColor4f related test cases (2 cases)
    /**
     * @tc.name   testPenSetColor4fNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenSetColor4f_0100
     * @tc.desc   test for testPenSetColor4fNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testPenSetColor4fNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingPenSetColor4f(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColor4fNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenSetColor4f_0200
     * @tc.desc   test for testPenSetColor4fNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColor4fNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenSetColor4f(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPenSetColor4fAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPenSetColor4f_0300
     * @tc.desc   test for testPenSetColor4fAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPenSetColor4fAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPenSetColor4f(2);
      expect(result).assertEqual(0);
    })
  })
}