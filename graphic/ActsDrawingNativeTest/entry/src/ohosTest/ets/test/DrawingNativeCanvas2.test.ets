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


export default function DrawingNativeCanvas2Test() {
  describe('DrawingNativeCanvas2Test', () => {
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
     * @tc.name   testCanvasSkewNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0100
     * @tc.desc   test for testCanvasSkewNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSkewNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSkew(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0200
     * @tc.desc   test for testCanvasSkewNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSkewNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0300
     * @tc.desc   test for testCanvasSkewMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSkewMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0400
     * @tc.desc   test for testCanvasSkewInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSkewInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSkewMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0500
     * @tc.desc   test for testCanvasSkewMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSkewMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetWidthHeight_0100
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetWidthtestCanvasGetHeightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetWidthHeight_0200
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthtestCanvasGetHeightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSkew_0600
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthtestCanvasGetHeightMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSkew(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetWidthHeight_0300
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthtestCanvasGetHeightInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetWidthHeight_0400
     * @tc.desc   test for testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetWidthtestCanvasGetHeightMultipleCallsBoudary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetWidthHeight(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0100
     * @tc.desc   test for testCanvasGetLocalClipBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetLocalClipBoundsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0200
     * @tc.desc   test for testCanvasGetLocalClipBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0300
     * @tc.desc   test for testCanvasGetLocalClipBoundsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0400
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0500
     * @tc.desc   test for testCanvasGetLocalClipBoundsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetLocalClipBoundsMultipleCallsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetLocalClipBounds_0600
     * @tc.desc   test for testCanvasGetLocalClipBoundsMultipleCallsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetLocalClipBoundsMultipleCallsBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetLocalClipBounds(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ConcatMatrix/GetTotalMatrix related test cases
    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasConcatMatrix_0100
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasConcatMatrixtestCanvasGetTotalMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasConcatMatrix_0200
     * @tc.desc   test for testCanvasConcatMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetTotalMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasConcatMatrix_0300
     * @tc.desc   test for testCanvasGetTotalMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetTotalMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasConcatMatrix_0400
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixtestCanvasGetTotalMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasConcatMatrix_0500
     * @tc.desc   test for testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasConcatMatrixtestCanvasGetTotalMatrixInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasConcatMatrix(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawShadow_0100
     * @tc.desc   test for testCanvasDrawShadowNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawShadowNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawShadow_0200
     * @tc.desc   test for testCanvasDrawShadowNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawShadow_0300
     * @tc.desc   test for testCanvasDrawShadowAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawShadow_0400
     * @tc.desc   test for testCanvasDrawShadowMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawShadowInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawShadow_0500
     * @tc.desc   test for testCanvasDrawShadowInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawShadowInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawShadow(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 Clear related test cases
    /**
     * @tc.name   testCanvasClearNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0100
     * @tc.desc   test for testCanvasClearNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClearNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClear(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0200
     * @tc.desc   test for testCanvasClearNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0300
     * @tc.desc   test for testCanvasClearAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0400
     * @tc.desc   test for testCanvasClearMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0500
     * @tc.desc   test for testCanvasClearInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClearMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClear_0600
     * @tc.desc   test for testCanvasClearMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClearMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClear(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 SetMatrix related test cases
    /**
     * @tc.name   testCanvasSetMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSetMatrix_0100
     * @tc.desc   test for testCanvasSetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSetMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSetMatrix_0200
     * @tc.desc   test for testCanvasSetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSetMatrix_0300
     * @tc.desc   test for testCanvasSetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSetMatrixInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSetMatrix_0400
     * @tc.desc   test for testCanvasSetMatrixInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSetMatrixInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSetMatrix(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ResetMatrix related test cases
    /**
     * @tc.name   testCanvasResetMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetMatrix_0100
     * @tc.desc   test for testCanvasResetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasResetMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetMatrix_0200
     * @tc.desc   test for testCanvasResetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetMatrix_0300
     * @tc.desc   test for testCanvasResetMatrixMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetMatrix(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectWithSrcNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawImageRect_0100
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawImageRectWithSrcNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectWithSrcNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawImageRect_0200
     * @tc.desc   test for testCanvasDrawImageRectWithSrcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectWithSrcNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawImageRect_0300
     * @tc.desc   test for testCanvasDrawImageRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawImageRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawImageRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawImageRect_0400
     * @tc.desc   test for testCanvasDrawImageRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawImageRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawImageRect(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawVertices related test cases
    /**
     * @tc.name   testCanvasDrawVerticesNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawVertices_0100
     * @tc.desc   test for testCanvasDrawVerticesNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawVerticesNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawVertices_0200
     * @tc.desc   test for testCanvasDrawVerticesNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawVertices_0300
     * @tc.desc   test for testCanvasDrawVerticesAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawVerticesMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawVertices_0400
     * @tc.desc   test for testCanvasDrawVerticesMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawVerticesMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawVertices(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixels related test cases
    /**
     * @tc.name   testCanvasReadPixelsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0100
     * @tc.desc   test for testCanvasReadPixelsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasReadPixelsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0200
     * @tc.desc   test for testCanvasReadPixelsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsMismatch
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0300
     * @tc.desc   test for testCanvasReadPixelsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsMismatch', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0400
     * @tc.desc   test for testCanvasReadPixelsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0500
     * @tc.desc   test for testCanvasReadPixelsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixels_0600
     * @tc.desc   test for testCanvasReadPixelsBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasReadPixelsBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixels(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ReadPixelsToBitmap related test cases
    /**
     * @tc.name   testCanvasReadPixelsToBitmapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixelsToBitmap_0100
     * @tc.desc   test for testCanvasReadPixelsToBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasReadPixelsToBitmapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixelsToBitmap_0200
     * @tc.desc   test for testCanvasReadPixelsToBitmapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsToBitmapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixelsToBitmap_0300
     * @tc.desc   test for testCanvasReadPixelsToBitmapAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsToBitmapAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasReadPixelsToBitmapMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasReadPixelsToBitmap_0400
     * @tc.desc   test for testCanvasReadPixelsToBitmapMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasReadPixelsToBitmapMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasReadPixelsToBitmap(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawSingleCharacter related test cases
    /**
     * @tc.name   testCanvasDrawSingleCharacter
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleCharacter_0100
     * @tc.desc   test for testCanvasDrawSingleCharacter.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawSingleCharacter', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleCharacterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleCharacter_0200
     * @tc.desc   test for testCanvasDrawSingleCharacterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawSingleCharacterNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleCharacterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleCharacter_0300
     * @tc.desc   test for testCanvasDrawSingleCharacterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawSingleCharacterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleCharacter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawPoint related test cases
    /**
     * @tc.name   testCanvasDrawPointNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoint_0100
     * @tc.desc   test for testCanvasDrawPointNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoint_0200
     * @tc.desc   test for testCanvasDrawPointNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoint_0300
     * @tc.desc   test for testCanvasDrawPointMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoint(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 DrawColor related test cases
    /**
     * @tc.name   testCanvasDrawColorNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawColor_0100
     * @tc.desc   test for testCanvasDrawColorNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawColorNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawColor_0200
     * @tc.desc   test for testCanvasDrawColorNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawColor_0300
     * @tc.desc   test for testCanvasDrawColorMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawColorMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawColor_0400
     * @tc.desc   test for testCanvasDrawColorMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawColorMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawColor(3);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 IsClipEmpty related test cases
    /**
     * @tc.name   testCanvasIsClipEmptyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsClipEmpty_0100
     * @tc.desc   test for testCanvasIsClipEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasIsClipEmptyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsClipEmptyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsClipEmpty_0200
     * @tc.desc   test for testCanvasIsClipEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasIsClipEmptyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsClipEmptyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsClipEmpty_0300
     * @tc.desc   test for testCanvasIsClipEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasIsClipEmptyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsClipEmpty(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 GetImageInfo related test cases
    /**
     * @tc.name   testCanvasGetImageInfoNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetImageInfo_0100
     * @tc.desc   test for testCanvasGetImageInfoNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasGetImageInfoNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetImageInfoNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetImageInfo_0200
     * @tc.desc   test for testCanvasGetImageInfoNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetImageInfoNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetImageInfoMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasGetImageInfo_0300
     * @tc.desc   test for testCanvasGetImageInfoMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetImageInfoMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasGetImageInfo(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part4 ClipRegion related test cases
    /**
     * @tc.name   testCanvasClipRegionNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRegion_0100
     * @tc.desc   test for testCanvasClipRegionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipRegionNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRegion_0200
     * @tc.desc   test for testCanvasClipRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRegionNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRegionMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRegion_0300
     * @tc.desc   test for testCanvasClipRegionMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRegionMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRegion(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectPath related test cases
    /**
     * @tc.name   testCanvasQuickRejectPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectPath_0100
     * @tc.desc   test for testCanvasQuickRejectPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasQuickRejectPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectPath_0200
     * @tc.desc   test for testCanvasQuickRejectPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasQuickRejectPathNormal', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectPathCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectPath_0300
     * @tc.desc   test for testCanvasQuickRejectPathCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasQuickRejectPathCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectPath(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 QuickRejectRect related test cases
    /**
     * @tc.name   testCanvasQuickRejectRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectRect_0100
     * @tc.desc   test for testCanvasQuickRejectRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasQuickRejectRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectRect_0200
     * @tc.desc   test for testCanvasQuickRejectRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasQuickRejectRectNormal', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasQuickRejectRectCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasQuickRejectRect_0300
     * @tc.desc   test for testCanvasQuickRejectRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasQuickRejectRectCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasQuickRejectRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawArcWithCenter related test cases
    /**
     * @tc.name   testCanvasDrawArcWithCenterNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArcWithCenter_0100
     * @tc.desc   test for testCanvasDrawArcWithCenterNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcWithCenterNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcWithCenterNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArcWithCenter_0200
     * @tc.desc   test for testCanvasDrawArcWithCenterNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawArcWithCenterNormal', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcWithCenterCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArcWithCenter_0300
     * @tc.desc   test for testCanvasDrawArcWithCenterCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawArcWithCenterCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawArcWithCenter(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawNestedRoundRect related test cases
    /**
     * @tc.name   testCanvasDrawNestedRoundRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawNestedRoundRect_0100
     * @tc.desc   test for testCanvasDrawNestedRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawNestedRoundRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawNestedRoundRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawNestedRoundRect_0200
     * @tc.desc   test for testCanvasDrawNestedRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawNestedRoundRectNormal', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawNestedRoundRectCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawNestedRoundRect_0300
     * @tc.desc   test for testCanvasDrawNestedRoundRectCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawNestedRoundRectCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawNestedRoundRect(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapNine related test cases
    /**
     * @tc.name   testCanvasDrawPixelMapNineNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapNine_0100
     * @tc.desc   test for testCanvasDrawPixelMapNineNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapNineNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapNineNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapNine_0200
     * @tc.desc   test for testCanvasDrawPixelMapNineNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testCanvasDrawPixelMapNineNormal', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapNineCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapNine_0300
     * @tc.desc   test for testCanvasDrawPixelMapNineCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawPixelMapNineCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapNine(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 CreateWithPixelMap related test cases
    /**
     * @tc.name   testCanvasCreateWithPixelMapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasCreateWithPixelMap_0100
     * @tc.desc   test for testCanvasCreateWithPixelMapNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasCreateWithPixelMapNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasCreateWithPixelMapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasCreateWithPixelMap_0200
     * @tc.desc   test for testCanvasCreateWithPixelMapNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasCreateWithPixelMapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasCreateWithPixelMapMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasCreateWithPixelMap_0300
     * @tc.desc   test for testCanvasCreateWithPixelMapMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasCreateWithPixelMapMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasCreateWithPixelMap(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapRectConstraint related test cases
    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRectConstraint_0100
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawPixelMapRectConstraintNormal', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRectConstraint_0200
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectConstraintNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRectConstraint_0300
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectConstraintAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectConstraintMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRectConstraint_0400
     * @tc.desc   test for testCanvasDrawPixelMapRectConstraintMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectConstraintMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRectConstraint(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleChaWithFeatures_0100
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawSingleChaWithFeaturesNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesAbNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleChaWithFeatures_0200
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesAbNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawSingleChaWithFeaturesAbNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawSingleChaWithFeaturesCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawSingleChaWithFeatures_0300
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasDrawSingleChaWithFeaturesCalls', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0100
     * @tc.desc   test for testCanvasDrawPixelMapMeshNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPixelMapMeshNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull01
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0200
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshNull01', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull02
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0300
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshNull02', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull03
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0400
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshNull03', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshNull04
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0500
     * @tc.desc   test for testCanvasDrawPixelMapMeshNull04
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshNull04', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshBindAndUnbind
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0600
     * @tc.desc   test for testCanvasDrawPixelMapMeshBindAndUnbind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshBindAndUnbind', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal01
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0700
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal01
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshAbnormal01', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal02
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0800
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal02
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshAbnormal02', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal03
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_0900
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal03
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshAbnormal03', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshAbnormal04
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_1000
     * @tc.desc   test for testCanvasDrawPixelMapMeshAbnormal04
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshAbnormal04', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapMesh_1100
     * @tc.desc   test for testCanvasDrawPixelMapMeshMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapMeshMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetClipNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetClip_0100
     * @tc.desc   test for testCanvasResetClipNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetClip(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetClipNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetClip_0200
     * @tc.desc   test for testCanvasResetClipNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetClip(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasResetClipMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasResetClip_0300
     * @tc.desc   test for testCanvasResetClipMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasResetClipMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasResetClip(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawGlyphsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawGlyphs_0100
     * @tc.desc   test for testCanvasDrawGlyphsNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawGlyphsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawGlyphs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawGlyphsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawGlyphs_0200
     * @tc.desc   test for testCanvasDrawGlyphsNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawGlyphsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawGlyphs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawGlyphsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawGlyphs_0300
     * @tc.desc   test for testCanvasDrawGlyphsAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawGlyphsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawGlyphs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawGlyphsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawGlyphs_0400
     * @tc.desc   test for testCanvasDrawGlyphsMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawGlyphsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawGlyphs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsOpaqueNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsOpaque_0100
     * @tc.desc   test for testCanvasIsOpaqueNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasIsOpaqueNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsOpaque(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsOpaqueNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsOpaque_0200
     * @tc.desc   test for testCanvasIsOpaqueNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasIsOpaqueNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsOpaque(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasIsOpaqueMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasIsOpaque_0300
     * @tc.desc   test for testCanvasIsOpaqueMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasIsOpaqueMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasIsOpaque(2);
      expect(result).assertEqual(0);
    })
  })
}