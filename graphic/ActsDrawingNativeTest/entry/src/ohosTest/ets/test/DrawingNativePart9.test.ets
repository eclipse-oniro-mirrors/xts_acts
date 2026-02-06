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


export default function ActsNewDrawingNativeTestPart9() {
  describe('ActsNewDrawingNativeTestPart9', () => {
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
    // RoundRect related test cases (19 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0100
     * @tc.desc   test for TestRoundRectCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0200
     * @tc.desc   test for TestRoundRectCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0300
     * @tc.desc   test for TestRoundRectCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0400
     * @tc.desc   test for TestRoundRectCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0500
     * @tc.desc   test for TestRoundRectCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0600
     * @tc.desc   test for TestRoundRectSetGetCornerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0700
     * @tc.desc   test for TestRoundRectSetGetCornerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0800
     * @tc.desc   test for TestRoundRectSetGetCornerAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0900
     * @tc.desc   test for TestRoundRectSetGetCornerMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1000
     * @tc.desc   test for TestRoundRectSetGetCornerMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1100
     * @tc.desc   test for TestRoundRectGetCornerWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1100', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingRoundRect(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1200
     * @tc.desc   test for TestRoundRectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1300
     * @tc.desc   test for TestRoundRectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1400
     * @tc.desc   test for TestRoundRectOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1500
     * @tc.desc   test for TestRoundRectOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1600
     * @tc.desc   test for TestRoundRectOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1700
     * @tc.desc   test for TestRoundRectCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRoundRect(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1800
     * @tc.desc   test for TestRoundRectCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1900
     * @tc.desc   test for TestRoundRectCopyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_ROUND_RECT_1900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRoundRect(18);
      expect(result).assertEqual(0);
    })

    // SamplingOptions related test cases (6 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0100
     * @tc.desc   test for TestSamplingOptionsCreateDestroyDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSamplingOptions(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0200
     * @tc.desc   test for TestSamplingOptionsCreateDestroyDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0300
     * @tc.desc   test for TestSamplingOptionsCreateDestroyDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0400
     * @tc.desc   test for TestSamplingOptionsCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSamplingOptions(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0500
     * @tc.desc   test for TestSamplingOptionsCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0600
     * @tc.desc   test for TestSamplingOptionsCopyMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SAMPLING_OPTIONS_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSamplingOptions(5);
      expect(result).assertEqual(0);
    })

    // ShadowLayer related test cases (7 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0100
     * @tc.desc   test for testShadowLayerCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShadowLayer(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0200
     * @tc.desc   test for testShadowLayerCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0300
     * @tc.desc   test for testShadowLayerCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0400
     * @tc.desc   test for testShadowLayerCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0500
     * @tc.desc   test for testShadowLayerCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0600
     * @tc.desc   test for testShadowLayerDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShadowLayer(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0700
     * @tc.desc   test for testShadowLayerDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_LAYER_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShadowLayer(6);
      expect(result).assertEqual(0);
    })

    // ShaderEffect Create Gradient test cases (30 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0100
     * @tc.desc   test for testShaderEffectCreateColorShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0200
     * @tc.desc   test for testShaderEffectCreateColorShaderNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0300
     * @tc.desc   test for testShaderEffectCreateColorShaderAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0400
     * @tc.desc   test for testShaderEffectCreateColorShaderMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0500
     * @tc.desc   test for testShaderEffectCreateColorShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0600
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0700
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0800
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0900
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01000
     * @tc.desc   test for testShaderEffectCreateLinearGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01100
     * @tc.desc   test for testShaderEffectCreateLinearGradienNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01200
     * @tc.desc   test for testShaderEffectCreateLinearGradienNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01300
     * @tc.desc   test for testShaderEffectCreateLinearGradienAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01400
     * @tc.desc   test for testShaderEffectCreateLinearGradienMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01500
     * @tc.desc   test for testShaderEffectCreateLinearGradienMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01600
     * @tc.desc   test for testShaderEffectCreateRadialGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01700
     * @tc.desc   test for testShaderEffectCreateRadialGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01800
     * @tc.desc   test for testShaderEffectCreateRadialGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01900
     * @tc.desc   test for testShaderEffectCreateRadialGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_01900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02000
     * @tc.desc   test for testShaderEffectCreateRadialGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02100
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02200
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02300
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02400
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02500
     * @tc.desc   test for testShaderEffectCreateRadialGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02600
     * @tc.desc   test for testShaderEffectCreateSweepGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02700
     * @tc.desc   test for testShaderEffectCreateSweepGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02800
     * @tc.desc   test for testShaderEffectCreateSweepGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02900
     * @tc.desc   test for testShaderEffectCreateSweepGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_02900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03000
     * @tc.desc   test for testShaderEffectCreateSweepGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateGradient(29);
      expect(result).assertEqual(0);
    })

    // ShaderEffect Create Special test cases (18 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03100
     * @tc.desc   test for testShaderEffectCreateImageShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03200
     * @tc.desc   test for testShaderEffectCreateImageShaderNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03300
     * @tc.desc   test for testShaderEffectCreateImageShaderMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03400
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03500
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03600
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03700
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03800
     * @tc.desc   test for testShaderEffectCreateTwoPointConicalGradientMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04100
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04200
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04300
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04400
     * @tc.desc   test for testShaderEffectCreateSweepGradientWithLocalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04500
     * @tc.desc   test for testShaderEffectCreateComposeEnumTraversal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04600
     * @tc.desc   test for testShaderEffectCreateComposeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04700
     * @tc.desc   test for testShaderEffectCreateComposeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04800
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04900
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_05000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_05000
     * @tc.desc   test for testShaderEffectCreatePixelMapShaderMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_05000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectCreateSpecial(17);
      expect(result).assertEqual(0);
    })

    // ShaderEffect Destroy test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03900
     * @tc.desc   test for testShaderEffectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_03900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingShaderEffectDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04000
     * @tc.desc   test for testShaderEffectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SHADOW_EFFECT_04000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingShaderEffectDestroy(1);
      expect(result).assertEqual(0);
    })

    // RenderSurface related test cases (16 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0100
     * @tc.desc   test for testRenderSurfaceCreateFromGpuContextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0200
     * @tc.desc   test for testRenderSurfaceCreateFromGpuContextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0300
     * @tc.desc   test for testRenderSurfaceCreateFromGpuContextBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0400
     * @tc.desc   test for testRenderSurfaceDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0500
     * @tc.desc   test for testRenderSurfaceDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0600
     * @tc.desc   test for testRenderSurfaceGetCanvasNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0700
     * @tc.desc   test for testRenderSurfaceGetCanvasNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0800
     * @tc.desc   test for testRenderSurfaceGetCanvasBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0900
     * @tc.desc   test for testRenderSurfaceCreateOnScreenNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01000
     * @tc.desc   test for testRenderSurfaceCreateOnScreenNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01100
     * @tc.desc   test for testRenderSurfaceCreateOnScreenMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01200
     * @tc.desc   test for testRenderSurfaceFlushNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingSurface(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01300
     * @tc.desc   test for testRenderSurfaceFlushNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01400
     * @tc.desc   test for testRenderSurfaceFlushAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01500
     * @tc.desc   test for testRenderSurfaceFlushMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_01500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_1600
     * @tc.desc   test for testRenderSurfaceFlushTiming.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RENDERSURFACE_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingSurface(15);
      expect(result).assertEqual(0);
    })

    // TextBlobBuilder related test cases (9 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_03000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_03000
     * @tc.desc   test for TestTextBlobBuilderCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_03000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0100
     * @tc.desc   test for TestTextBlobBuilderCreateDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0200
     * @tc.desc   test for TestTextBlobBuilderCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02200
     * @tc.desc   test for TestTextBlobBuilderAllocRunPosNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02300
     * @tc.desc   test for TestTextBlobBuilderAllocRunPosNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02400
     * @tc.desc   test for TestTextBlobBuilderAllocRunPosMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02500
     * @tc.desc   test for TestTextBlobBuilderMakeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02600
     * @tc.desc   test for TestTextBlobBuilderMakeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02700
     * @tc.desc   test for TestTextBlobBuilderMakeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobBuilder(8);
      expect(result).assertEqual(0);
    })

    // TextBlob Create related test cases (12 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0300
     * @tc.desc   test for TestTextBlobCreateFromTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0400
     * @tc.desc   test for TestTextBlobCreateFromTextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0500
     * @tc.desc   test for TestTextBlobCreateFromTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0600
     * @tc.desc   test for TestTextBlobCreateFromTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0700
     * @tc.desc   test for TestTextBlobCreateFromPosTextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0800
     * @tc.desc   test for TestTextBlobCreateFromPosTextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0900
     * @tc.desc   test for TestTextBlobCreateFromPosTextMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01000
     * @tc.desc   test for TestTextBlobCreateFromPosTextAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01100
     * @tc.desc   test for TestTextBlobCreateFromStringNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01200
     * @tc.desc   test for TestTextBlobCreateFromStringNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01300
     * @tc.desc   test for TestTextBlobCreateFromStringMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01400
     * @tc.desc   test for TestTextBlobCreateFromStringAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobCreate(11);
      expect(result).assertEqual(0);
    })

    // TextBlob Other operations related test cases (9 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01500
     * @tc.desc   test for TestTextBlobGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01600
     * @tc.desc   test for TestTextBlobGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01700
     * @tc.desc   test for TestTextBlobGetBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01800
     * @tc.desc   test for TestTextBlobGetBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01900
     * @tc.desc   test for TestTextBlobUniqueIDNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02000
     * @tc.desc   test for TestTextBlobUniqueIDNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02100
     * @tc.desc   test for TestTextBlobUniqueIDMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02800
     * @tc.desc   test for TestTextBlobDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTextBlobOther(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02900
     * @tc.desc   test for TestTextBlobDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TEXTBLOB_02900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTextBlobOther(8);
      expect(result).assertEqual(0);
    })

    // Typeface Create related test cases (15 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0100
     * @tc.desc   test for TestTypefaceCreateDefaultNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0200
     * @tc.desc   test for TestTypefaceCreateDefaultNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0300
     * @tc.desc   test for TestTypefaceCreateFromFileNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0400
     * @tc.desc   test for TestTypefaceCreateFromFileNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0500
     * @tc.desc   test for TestTypefaceCreateFromStreamNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0600
     * @tc.desc   test for TestTypefaceCreateFromStreamNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0700
     * @tc.desc   test for TestTypefaceCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0800
     * @tc.desc   test for TestTypefaceCreateDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0900
     * @tc.desc   test for TestTypefaceCreateFromFileWithArugumentsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01000
     * @tc.desc   test for TestTypefaceCreateFromFileWithArugumentsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01100
     * @tc.desc   test for TestTypefaceCreateFromFileWithArugumentsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01200
     * @tc.desc   test for TestTypefaceCreateFromFileWithArugumentsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01300
     * @tc.desc   test for TestTypefaceCreateFromCurrentNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01400
     * @tc.desc   test for TestTypefaceCreateFromCurrentNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01500
     * @tc.desc   test for TestTypefaceCreateFromCurrentMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceCreate(14);
      expect(result).assertEqual(0);
    })
  })
}
