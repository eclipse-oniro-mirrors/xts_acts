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


export default function ActsNewDrawingNativeTestPart4() {
  describe('ActsNewDrawingNativeTestPart4', () => {
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

    // Canvas Part4 DrawImageRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15300
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15400
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15500
     * @tc.desc   test for testCanvasDrawImageRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15600
     * @tc.desc   test for testCanvasDrawImageRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawVertices related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21400
     * @tc.desc   test for testCanvasDrawVerticesNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21500
     * @tc.desc   test for testCanvasDrawVerticesNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21600
     * @tc.desc   test for testCanvasDrawVerticesAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21700
     * @tc.desc   test for testCanvasDrawVerticesMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixels related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21800
     * @tc.desc   test for testCanvasReadPixelsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21900
     * @tc.desc   test for testCanvasReadPixelsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22000
     * @tc.desc   test for testCanvasReadPixelsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22100
     * @tc.desc   test for testCanvasReadPixelsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22200
     * @tc.desc   test for testCanvasReadPixelsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22300
     * @tc.desc   test for testCanvasReadPixelsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixelsToBitmap related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22400
     * @tc.desc   test for testCanvasReadPixelsToBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22500
     * @tc.desc   test for testCanvasReadPixelsToBitmapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22600
     * @tc.desc   test for testCanvasReadPixelsToBitmapAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22700
     * @tc.desc   test for testCanvasReadPixelsToBitmapMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawSingleCharacter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22800
     * @tc.desc   test for testCanvasDrawSingleCharacter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22800', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22900
     * @tc.desc   test for testCanvasDrawSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_22900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23000
     * @tc.desc   test for testCanvasDrawSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawPoint related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23100
     * @tc.desc   test for testCanvasDrawPointNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23200
     * @tc.desc   test for testCanvasDrawPointNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23300
     * @tc.desc   test for testCanvasDrawPointMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawColor related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23400
     * @tc.desc   test for testCanvasDrawColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23500
     * @tc.desc   test for testCanvasDrawColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23600
     * @tc.desc   test for testCanvasDrawColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23700
     * @tc.desc   test for testCanvasDrawColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 IsClipEmpty related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23800
     * @tc.desc   test for testCanvasIsClipEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23900
     * @tc.desc   test for testCanvasIsClipEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_23900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24000
     * @tc.desc   test for testCanvasIsClipEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 GetImageInfo related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24100
     * @tc.desc   test for testCanvasGetImageInfoNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24200
     * @tc.desc   test for testCanvasGetImageInfoNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24300
     * @tc.desc   test for testCanvasGetImageInfoMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ClipRegion related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24400
     * @tc.desc   test for testCanvasClipRegionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24500
     * @tc.desc   test for testCanvasClipRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24600
     * @tc.desc   test for testCanvasClipRegionMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_24600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectPath related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15700
     * @tc.desc   test for TestCanvasQuickRejectPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15800
     * @tc.desc   test for TestCanvasQuickRejectPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15800', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15900
     * @tc.desc   test for TestCanvasQuickRejectPathCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_15900', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16000
     * @tc.desc   test for TestCanvasQuickRejectRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16100
     * @tc.desc   test for TestCanvasQuickRejectRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16100', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16200
     * @tc.desc   test for TestCanvasQuickRejectRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16200', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawArcWithCenter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16300
     * @tc.desc   test for TestCanvasDrawArcWithCenterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16400
     * @tc.desc   test for TestCanvasDrawArcWithCenterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16400', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16500
     * @tc.desc   test for TestCanvasDrawArcWithCenterCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16500', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawNestedRoundRect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16600
     * @tc.desc   test for TestCanvasDrawNestedRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16700
     * @tc.desc   test for TestCanvasDrawNestedRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16700', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16800
     * @tc.desc   test for TestCanvasDrawNestedRoundRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16800', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapNine related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16900
     * @tc.desc   test for TestCanvasDrawPixelMapNineNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_16900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17000
     * @tc.desc   test for TestCanvasDrawPixelMapNineNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17000', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17100
     * @tc.desc   test for TestCanvasDrawPixelMapNineCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17100', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 CreateWithPixelMap related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17200
     * @tc.desc   test for TestCanvasCreateWithPixelMapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17200', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17300
     * @tc.desc   test for TestCanvasCreateWithPixelMapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17400
     * @tc.desc   test for TestCanvasCreateWithPixelMapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapRectConstraint related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17500
     * @tc.desc   test for TestCanvasDrawPixelMapRectConstraintNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17500', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17600
     * @tc.desc   test for TestCanvasDrawPixelMapRectConstraintNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17700
     * @tc.desc   test for TestCanvasDrawPixelMapRectConstraintAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17800
     * @tc.desc   test for TestCanvasDrawPixelMapRectConstraintMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_17800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(3);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateBlendMode related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0100
     * @tc.desc   test for TestColorFilterCreateBlendModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0200
     * @tc.desc   test for TestColorFilterCreateBlendModeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0300
     * @tc.desc   test for TestColorFilterCreateBlendModeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0400
     * @tc.desc   test for TestColorFilterCreateBlendModeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0500
     * @tc.desc   test for TestColorFilterCreateBlendModeMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateBlendMode(4);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateCompose related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0600
     * @tc.desc   test for TestColorFilterCreateComposeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0700
     * @tc.desc   test for TestColorFilterCreateComposeNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0800
     * @tc.desc   test for TestColorFilterCreateComposeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateCompose(2);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateMatrix related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0900
     * @tc.desc   test for TestColorFilterCreateMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_0900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1000
     * @tc.desc   test for TestColorFilterCreateMatrixNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1100
     * @tc.desc   test for TestColorFilterCreateMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1200
     * @tc.desc   test for TestColorFilterCreateMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateMatrix(3);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLinearToSrgbGamma related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1300
     * @tc.desc   test for TestColorFilterCreateLinearToSrgbGammaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLinearToSrgbGamma(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1400
     * @tc.desc   test for TestColorFilterCreateLinearToSrgbGammaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLinearToSrgbGamma(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateSrgbGammaToLinear related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1500
     * @tc.desc   test for TestColorFilterCreateSrgbGammaToLinearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateSrgbGammaToLinear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1600
     * @tc.desc   test for TestColorFilterCreateSrgbGammaToLinearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateSrgbGammaToLinear(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLuma related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1700
     * @tc.desc   test for TestColorFilterCreateLumaNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLuma(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1800
     * @tc.desc   test for TestColorFilterCreateLumaMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLuma(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1900
     * @tc.desc   test for TestColorFilterDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_1900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2000
     * @tc.desc   test for TestColorFilterDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterDestroy(1);
      expect(result).assertEqual(0);
    })

    // ColorFilter CreateLighting related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2100
     * @tc.desc   test for TestColorFilterCreateLightingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2200
     * @tc.desc   test for TestColorFilterCreateLightingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2300
     * @tc.desc   test for TestColorFilterCreateLightingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2400
     * @tc.desc   test for TestColorFilterCreateLightingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_FILTER_2400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorFilterCreateLighting(3);
      expect(result).assertEqual(0);
    })

    // ColorSpace CreateSrgb related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100
     * @tc.desc   test for TestColorSpaceCreateSrgbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgb(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0100
     * @tc.desc   test for TestColorSpaceCreateSrgbMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgb(1);
      expect(result).assertEqual(0);
    })

    // ColorSpace Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101
     * @tc.desc   test for TestColorSpaceDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_COLOR_SPACE_0101', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceDestroy(0);
      expect(result).assertEqual(0);
    })

    // ColorSpace CreateSrgbLinear related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0200
     * @tc.desc   test for TestColorSpaceCreateSrgbLinearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgbLinear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0300
     * @tc.desc   test for TestColorSpaceCreateSrgbLinearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_SPACE_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSpaceCreateSrgbLinear(1);
      expect(result).assertEqual(0);
    })

    // Color SetArgb related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0100
     * @tc.desc   test for TestColorSetArgbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingColorSetArgb(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0200
     * @tc.desc   test for TestColorSetArgbNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0300
     * @tc.desc   test for TestColorSetArgbMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0400
     * @tc.desc   test for TestColorSetArgbAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0500
     * @tc.desc   test for TestColorSetArgbMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_COLOR_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingColorSetArgb(4);
      expect(result).assertEqual(0);
    })

    // Filter Create/Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0100
     * @tc.desc   test for TestFilterCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0200
     * @tc.desc   test for TestFilterCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0300
     * @tc.desc   test for TestFilterCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    // Filter SetImageFilter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0400
     * @tc.desc   test for TestFilterSetImageFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0500
     * @tc.desc   test for TestFilterSetImageFilterNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0600
     * @tc.desc   test for TestFilterSetImageFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetImageFilter(2);
      expect(result).assertEqual(0);
    })

    // Filter SetMaskFilter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0700
     * @tc.desc   test for TestFilterSetMaskFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0800
     * @tc.desc   test for TestFilterSetMaskFilterNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0900
     * @tc.desc   test for TestFilterSetMaskFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetMaskFilter(2);
      expect(result).assertEqual(0);
    })

    // Filter SetColorFilter related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1000
     * @tc.desc   test for TestFilterSetColorFilterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1100
     * @tc.desc   test for TestFilterSetColorFilterNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1200
     * @tc.desc   test for TestFilterSetColorFilterMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FILTER_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFilterSetColorFilter(2);
      expect(result).assertEqual(0);
    })

    // Font Create/Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0100
     * @tc.desc   test for TestFontCreateDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0200
     * @tc.desc   test for TestFontCreateDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0300
     * @tc.desc   test for TestFontCreateDestroyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontCreateDestroy(2);
      expect(result).assertEqual(0);
    })

    // Font SetBaselineSnap related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0400
     * @tc.desc   test for TestFontSetBaselineSnapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0500
     * @tc.desc   test for TestFontSetBaselineSnapNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0600
     * @tc.desc   test for TestFontSetBaselineSnapMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0700
     * @tc.desc   test for TestFontIsBaselineSnapWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0700', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetBaselineSnap(3);
      expect(result).assertEqual(0);
    })

    // Font SetSubpixel related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0800
     * @tc.desc   test for TestFontSetSubpixelNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0900
     * @tc.desc   test for TestFontSetSubpixelNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1000
     * @tc.desc   test for TestFontSetSubpixelMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1100
     * @tc.desc   test for TestFontIsSubpixelWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1100', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingFontSetSubpixel(3);
      expect(result).assertEqual(0);
    })

    // Font SetForceAutoHinting related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1200
     * @tc.desc   test for TestFontSetForceAutoHintingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1300
     * @tc.desc   test for TestFontSetForceAutoHintingNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1400
     * @tc.desc   test for TestFontSetForceAutoHintingMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1500
     * @tc.desc   test for TestFontIsForceAutoHintingWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetForceAutoHinting(3);
      expect(result).assertEqual(0);
    })

    // Font SetTypeface related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1600
     * @tc.desc   test for TestFontSetTypefaceNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1700
     * @tc.desc   test for TestFontSetTypefaceNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1800
     * @tc.desc   test for TestFontSetTypefaceMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1900
     * @tc.desc   test for TestFontGetTypefaceWhenNoSet.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_1900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingFontSetTypeface(3);
      expect(result).assertEqual(0);
    })

  })
}
