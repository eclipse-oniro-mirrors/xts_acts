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


export default function ActsNewDrawingNativeTestPart3() {
  describe('ActsNewDrawingNativeTestPart3', () => {
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
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18000
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18100
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_18100', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawPixelMapRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4300
     * @tc.desc   test for TestCanvasDrawPixelMapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4400
     * @tc.desc   test for TestCanvasDrawPixelMapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4500
     * @tc.desc   test for TestCanvasDrawPixelMapRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4600
     * @tc.desc   test for TestCanvasDrawPixelMapRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4800
     * @tc.desc   test for TestCanvasDrawPixelMapRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4BYTEALIGNMENT
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4BYTEALIGNMENT
     * @tc.desc   test for TestCanvasDrawPixelMapRect4ByteAlignment.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4BYTEALIGNMENT', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(6);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawBackground related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4900
     * @tc.desc   test for TestCanvasDrawBackgroundNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_4900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5000
     * @tc.desc   test for TestCanvasDrawBackgroundNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5100
     * @tc.desc   test for TestCanvasDrawBackgroundInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5200
     * @tc.desc   test for TestCanvasDrawBackgroundMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawRegion related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5300
     * @tc.desc   test for TestCanvasDrawRegionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5400
     * @tc.desc   test for TestCanvasDrawRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5500
     * @tc.desc   test for TestCanvasDrawRegionInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawPoints related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5600
     * @tc.desc   test for TestCanvasDrawPointsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5700
     * @tc.desc   test for TestCanvasDrawPointsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5800
     * @tc.desc   test for TestCanvasDrawPointsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5900
     * @tc.desc   test for TestCanvasDrawPointsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_5900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6000
     * @tc.desc   test for TestCanvasDrawPointsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6100
     * @tc.desc   test for TestCanvasDrawPointsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawBitmap related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6200
     * @tc.desc   test for TestCanvasDrawBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6300
     * @tc.desc   test for TestCanvasDrawBitmapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6400
     * @tc.desc   test for TestCanvasDrawBitmapAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6500
     * @tc.desc   test for TestCanvasDrawBitmapMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6600
     * @tc.desc   test for TestCanvasDrawBitmapInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6700
     * @tc.desc   test for TestCanvasDrawBitmapBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawBitmapRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6800
     * @tc.desc   test for TestCanvasDrawBitmapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6900
     * @tc.desc   test for TestCanvasDrawBitmapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_6900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7000
     * @tc.desc   test for TestCanvasDrawBitmapRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7100
     * @tc.desc   test for TestCanvasDrawBitmapRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7200
     * @tc.desc   test for TestCanvasDrawBitmapRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7300
     * @tc.desc   test for TestCanvasDrawBitmapRectBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7400
     * @tc.desc   test for TestCanvasDrawRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7500
     * @tc.desc   test for TestCanvasDrawRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7600
     * @tc.desc   test for TestCanvasDrawRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7700
     * @tc.desc   test for TestCanvasDrawRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7800
     * @tc.desc   test for TestCanvasDrawRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawCircle related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7900
     * @tc.desc   test for TestCanvasDrawCircleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_7900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8000
     * @tc.desc   test for TestCanvasDrawCircleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8100
     * @tc.desc   test for TestCanvasDrawCircleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8200
     * @tc.desc   test for TestCanvasDrawCircleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8300
     * @tc.desc   test for TestCanvasDrawCircleInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawOval related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8400
     * @tc.desc   test for TestCanvasDrawOvalNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8500
     * @tc.desc   test for TestCanvasDrawOvalNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8600
     * @tc.desc   test for TestCanvasDrawOvalAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8700
     * @tc.desc   test for TestCanvasDrawOvalMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8800
     * @tc.desc   test for TestCanvasDrawOvalInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawArc related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8900
     * @tc.desc   test for TestCanvasDrawArcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_8900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9000
     * @tc.desc   test for TestCanvasDrawArcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9100
     * @tc.desc   test for TestCanvasDrawArcAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9200
     * @tc.desc   test for TestCanvasDrawArcMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9300
     * @tc.desc   test for TestCanvasDrawArcInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawRoundRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9400
     * @tc.desc   test for TestCanvasDrawRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9500
     * @tc.desc   test for TestCanvasDrawRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9600
     * @tc.desc   test for TestCanvasDrawRoundRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9700
     * @tc.desc   test for TestCanvasDrawRoundRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9800
     * @tc.desc   test for TestCanvasDrawRoundRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawTextBlob related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9900
     * @tc.desc   test for TestCanvasDrawTextBlobNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_9900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10000
     * @tc.desc   test for TestCanvasDrawTextBlobNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10100
     * @tc.desc   test for TestCanvasDrawTextBlobAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10200
     * @tc.desc   test for TestCanvasDrawTextBlobMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10300
     * @tc.desc   test for TestCanvasDrawTextBlobInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 ClipRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10400
     * @tc.desc   test for TestCanvasClipRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10500
     * @tc.desc   test for TestCanvasClipRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10600
     * @tc.desc   test for TestCanvasClipRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10700
     * @tc.desc   test for TestCanvasClipRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10800
     * @tc.desc   test for TestCanvasClipRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 ClipRoundRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10900
     * @tc.desc   test for TestCanvasClipRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_10900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11000
     * @tc.desc   test for TestCanvasClipRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11100
     * @tc.desc   test for TestCanvasClipRoundRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11200
     * @tc.desc   test for TestCanvasClipRoundRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11300
     * @tc.desc   test for TestCanvasClipRoundRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 ClipPath related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18200
     * @tc.desc   test for TestCanvasClipPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18300
     * @tc.desc   test for TestCanvasClipPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18400
     * @tc.desc   test for TestCanvasClipPathInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 Rotate related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18500
     * @tc.desc   test for TestCanvasRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasRotate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18600
     * @tc.desc   test for TestCanvasRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18700
     * @tc.desc   test for TestCanvasRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18800
     * @tc.desc   test for TestCanvasRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18900
     * @tc.desc   test for TestCanvasRotateInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_18900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19000
     * @tc.desc   test for TestCanvasRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 Translate related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19100
     * @tc.desc   test for TestCanvasTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19200
     * @tc.desc   test for TestCanvasTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19300
     * @tc.desc   test for TestCanvasTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19400
     * @tc.desc   test for TestCanvasTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19500
     * @tc.desc   test for TestCanvasTranslateInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19600
     * @tc.desc   test for TestCanvasTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 Scale related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19700
     * @tc.desc   test for TestCanvasScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasScale(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19800
     * @tc.desc   test for TestCanvasScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19900
     * @tc.desc   test for TestCanvasScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_19900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20000
     * @tc.desc   test for TestCanvasScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20100
     * @tc.desc   test for TestCanvasScaleInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20200
     * @tc.desc   test for TestCanvasScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 Skew related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11400
     * @tc.desc   test for TestCanvasSkewNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSkew(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11500
     * @tc.desc   test for TestCanvasSkewNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11600
     * @tc.desc   test for TestCanvasSkewMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11700
     * @tc.desc   test for TestCanvasSkewInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11800
     * @tc.desc   test for TestCanvasSkewMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 GetWidth/GetHeight related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11900
     * @tc.desc   test for TestCanvasGetWidthtestCanvasGetHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_11900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12000
     * @tc.desc   test for TestCanvasGetWidthtestCanvasGetHeightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12100
     * @tc.desc   test for TestCanvasGetWidthtestCanvasGetHeightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12200
     * @tc.desc   test for TestCanvasGetWidthtestCanvasGetHeightInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12300
     * @tc.desc   test for TestCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 GetLocalClipBounds related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12400
     * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12500
     * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12600
     * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12700
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12800
     * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12900
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_12900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ConcatMatrix/GetTotalMatrix related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13000
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13100
     * @tc.desc   test for testCanvasConcatMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13200
     * @tc.desc   test for testCanvasGetTotalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13300
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13400
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawShadow related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13500
     * @tc.desc   test for testCanvasDrawShadowNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13600
     * @tc.desc   test for testCanvasDrawShadowNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13700
     * @tc.desc   test for testCanvasDrawShadowAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13800
     * @tc.desc   test for testCanvasDrawShadowMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13900
     * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_13900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 Clear related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14000
     * @tc.desc   test for testCanvasClearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14100
     * @tc.desc   test for testCanvasClearNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14200
     * @tc.desc   test for testCanvasClearAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14300
     * @tc.desc   test for testCanvasClearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14400
     * @tc.desc   test for testCanvasClearInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14500
     * @tc.desc   test for testCanvasClearMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 SetMatrix related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14600
     * @tc.desc   test for testCanvasSetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14700
     * @tc.desc   test for testCanvasSetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14800
     * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14900
     * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_14900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ResetMatrix related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15000
     * @tc.desc   test for testCanvasResetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15100
     * @tc.desc   test for testCanvasResetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15200
     * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(2);
      expect(result).assertEqual(0);
    })

  })
}