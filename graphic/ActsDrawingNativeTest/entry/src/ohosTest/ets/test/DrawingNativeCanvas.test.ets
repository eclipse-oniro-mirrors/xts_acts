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


export default function DrawingNativeCanvasTest() {
  describe('DrawingNativeCanvasTest', () => {
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
     * @tc.name   testCanvasDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDestroy_0100
     * @tc.desc   test for testCanvasDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDestroyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDestroy_0200
     * @tc.desc   test for testCanvasDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDestroyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDestroy(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasBindNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasBind_0100
     * @tc.desc   test for testCanvasBindNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasBindNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasBind(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasBindNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasBind_0200
     * @tc.desc   test for testCanvasBindNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasBindNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasBind(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasBindDestroyBitmap
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasBind_0300
     * @tc.desc   test for testCanvasBindNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasBindDestroyBitmap', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasBind(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasBindMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasBind_0400
     * @tc.desc   test for testCanvasBindNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasBindMultipleCalls', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasBind(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasBindBoundaryMultipleCallsBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasBind_0500
     * @tc.desc   test for testCanvasBindBoundaryl.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasBindBoundaryMultipleCallsBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasBind(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachPenDetachPenNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0100
     * @tc.desc   test for testCanvasAttachPenDetachPenNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasAttachPenDetachPenNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasAttach(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachPenDetachPenNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0200
     * @tc.desc   test for testCanvasAttachPenDetachPenNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachPenDetachPenNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachPenDetachPenMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0300
     * @tc.desc   test for testCanvasAttachPenDetachPenMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachPenDetachPenMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachPenOnly
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0400
     * @tc.desc   test for testCanvasAttachPenOnly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachPenOnly', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDetachPenOnly
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDetach_0100
     * @tc.desc   test for testCanvasDetachPenOnly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDetachPenOnly', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDetach(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachPenDetachPenBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0500
     * @tc.desc   test for testCanvasAttachPenDetachPenBounday.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasAttachPenDetachPenBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasAttach(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachBrushDetachBrushNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0600
     * @tc.desc   test for testCanvasAttachBrushDetachBrushNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachBrushDetachBrushNormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachBrushDetachBrushNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0700
     * @tc.desc   test for testCanvasAttachBrushDetachBrushNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachBrushDetachBrushNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachBrushDetachBrushMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0800
     * @tc.desc   test for testCanvasAttachBrushDetachBrushMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachBrushDetachBrushMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachBrushOnly
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_0900
     * @tc.desc   test for testCanvasAttachPenOnly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachBrushOnly', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDetachBrushOnly
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDetach_0200
     * @tc.desc   test for testCanvasDetachBrushOnly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDetachBrushOnly', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDetach(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasAttachBrushDetachBrushBoudary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasAttach_1000
     * @tc.desc   test for testCanvasAttachBrushDetachBrushBoudary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasAttachBrushDetachBrushBoudary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasAttach(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSave_0100
     * @tc.desc   test for testCanvasSaveNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSave(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSavetestCanvasGetSaveCountNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSave_0200
     * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSavetestCanvasGetSaveCountNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSave(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSavetestCanvasGetSaveCountMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSave_0300
     * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSavetestCanvasGetSaveCountMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSave(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSavetestCanvasGetSaveCountInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSave_0400
     * @tc.desc   test for testCanvasSavetestCanvasGetSaveCountInputDestroyed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSavetestCanvasGetSaveCountInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSave(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasGetSaveCountWhenNoSave
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSave_0500
     * @tc.desc   test for testCanvasGetSaveCountWhenNoSave
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasGetSaveCountWhenNoSave', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSave(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveLayerNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSaveLayer_0100
     * @tc.desc   test for testCanvasSaveLayerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasSaveLayerNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasSaveLayer(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveLayerNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSaveLayer_0200
     * @tc.desc   test for testCanvasSaveLayerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSaveLayerNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSaveLayer(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveLayerAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSaveLayer_0300
     * @tc.desc   test for testCanvasSaveLayerAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSaveLayerAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSaveLayer(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveLayerRestore
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSaveLayer_0400
     * @tc.desc   test for testCanvasSaveLayerRestore.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasSaveLayerRestore', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingCanvasSaveLayer(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasSaveLayerMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasSaveLayer_0500
     * @tc.desc   test for testCanvasSaveLayerMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasSaveLayerMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasSaveLayer(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0100
     * @tc.desc   test for testCanvasRestoreNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasRestoreNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasRestore(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0200
     * @tc.desc   test for testCanvasRestoreNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestore(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0300
     * @tc.desc   test for testCanvasRestoreMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestore(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreBeforeSave
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0400
     * @tc.desc   test for testCanvasRestoreBeforeSave.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreBeforeSave', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestore(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0500
     * @tc.desc   test for testCanvasRestoreInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestore(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreExceededSaveSavelayerTimes
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestore_0600
     * @tc.desc   test for testCanvasRestoreExceededSaveSavelayerTimes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreExceededSaveSavelayerTimes', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestore(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0100
     * @tc.desc   test for testCanvasRestoreToCountNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasRestoreToCountNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0200
     * @tc.desc   test for testCanvasRestoreToCountNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0300
     * @tc.desc   test for testCanvasRestoreToCountAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0400
     * @tc.desc   test for testCanvasRestoreToCountMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountExceeded
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0500
     * @tc.desc   test for testCanvasRestoreToCountExceeded.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountExceeded', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRestoreToCountInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRestoreToCount_0600
     * @tc.desc   test for testCanvasRestoreToCountInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRestoreToCountInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRestoreToCount(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawLineNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawLine_0100
     * @tc.desc   test for testCanvasDrawLineNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawLineNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawLine(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawLineNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawLine_0200
     * @tc.desc   test for testCanvasDrawLineNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawLine(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawLineAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawLine_0300
     * @tc.desc   test for testCanvasDrawLineAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawLine(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawLineMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawLine_0400
     * @tc.desc   test for testCanvasDrawLineMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawLine(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawLineInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawLine_0500
     * @tc.desc   test for testCanvasDrawLineInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawLineInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawLine(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPath_0100
     * @tc.desc   test for testCanvasDrawPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPathNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPath_0200
     * @tc.desc   test for testCanvasDrawPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPathInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPath_0300
     * @tc.desc   test for testCanvasDrawPathInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPathInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPath(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0100
     * @tc.desc   test for testCanvasDrawPixelMapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPixelMapRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0200
     * @tc.desc   test for testCanvasDrawPixelMapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0300
     * @tc.desc   test for testCanvasDrawPixelMapRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0400
     * @tc.desc   test for testCanvasDrawPixelMapRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRect4KBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0500
     * @tc.desc   test for testCanvasDrawPixelMapRect4KBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRect4KBoundary', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0600
     * @tc.desc   test for testCanvasDrawPixelMapRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPixelMapRect4ByteAlignment
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPixelMapRect_0700
     * @tc.desc   test for Canvas Draw PixelMap Rect 4ByteAlignment.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPixelMapRect4ByteAlignment', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapRect(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBackgroundNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBackground_0100
     * @tc.desc   test for testCanvasDrawBackgroundNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBackgroundNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBackgroundNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBackground_0200
     * @tc.desc   test for testCanvasDrawBackgroundNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBackgroundNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBackgroundInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBackground_0300
     * @tc.desc   test for testCanvasDrawBackgroundInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBackgroundInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBackgroundMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBackground_0400
     * @tc.desc   test for testCanvasDrawBackgroundMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBackgroundMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBackground(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRegionNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRegion_0100
     * @tc.desc   test for testCanvasDrawRegionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRegionNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRegionNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRegion_0200
     * @tc.desc   test for testCanvasDrawRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRegionNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRegionInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRegion_0300
     * @tc.desc   test for testCanvasDrawRegionInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRegionInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRegion(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0100
     * @tc.desc   test for testCanvasDrawPointsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawPointsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0200
     * @tc.desc   test for testCanvasDrawPointsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0300
     * @tc.desc   test for testCanvasDrawPointsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsMismatch
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0400
     * @tc.desc   test for testCanvasDrawPointsMismatch.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsMismatch', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0500
     * @tc.desc   test for testCanvasDrawPointsMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawPointsInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawPoints_0600
     * @tc.desc   test for testCanvasDrawPointsInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawPointsInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPoints(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0100
     * @tc.desc   test for testCanvasDrawBitmapNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBitmapNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0200
     * @tc.desc   test for testCanvasDrawBitmapNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0300
     * @tc.desc   test for testCanvasDrawBitmapAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0400
     * @tc.desc   test for testCanvasDrawBitmapMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0500
     * @tc.desc   test for testCanvasDrawBitmapInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmap_0600
     * @tc.desc   test for testCanvasDrawBitmapBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBitmapBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmap(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawBitmapRect related test cases
    /**
     * @tc.name   testCanvasDrawBitmapRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0100
     * @tc.desc   test for testCanvasDrawBitmapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBitmapRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0200
     * @tc.desc   test for testCanvasDrawBitmapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0300
     * @tc.desc   test for testCanvasDrawBitmapRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0400
     * @tc.desc   test for testCanvasDrawBitmapRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0500
     * @tc.desc   test for testCanvasDrawBitmapRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawBitmapRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawBitmapRectBoundary
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawBitmapRect_0600
     * @tc.desc   test for testCanvasDrawBitmapRectBoundary.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawBitmapRectBoundary', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawBitmapRect(5);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawRect related test cases
    /**
     * @tc.name   testCanvasDrawRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRect_0100
     * @tc.desc   test for testCanvasDrawRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRect_0200
     * @tc.desc   test for testCanvasDrawRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRect_0300
     * @tc.desc   test for testCanvasDrawRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRect_0400
     * @tc.desc   test for testCanvasDrawRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRect_0500
     * @tc.desc   test for testCanvasDrawRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part2 DrawCircle related test cases
    /**
     * @tc.name   testCanvasDrawCircleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawCircle_0100
     * @tc.desc   test for testCanvasDrawCircleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawCircleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawCircleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawCircle_0200
     * @tc.desc   test for testCanvasDrawCircleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawCircleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawCircle_0300
     * @tc.desc   test for testCanvasDrawCircleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawCircleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawCircle_0400
     * @tc.desc   test for testCanvasDrawCircleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawCircleInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawCircle_0500
     * @tc.desc   test for testCanvasDrawCircleInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawCircleInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawCircle(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawOval related test cases
    /**
     * @tc.name   testCanvasDrawOvalNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawOval_0100
     * @tc.desc   test for testCanvasDrawOvalNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawOvalNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawOvalNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawOval_0200
     * @tc.desc   test for testCanvasDrawOvalNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawOvalAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawOval_0300
     * @tc.desc   test for testCanvasDrawOvalAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawOvalMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawOval_0400
     * @tc.desc   test for testCanvasDrawOvalMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawOvalInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawOval_0500
     * @tc.desc   test for testCanvasDrawOvalInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawOvalInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawOval(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArc_0100
     * @tc.desc   test for testCanvasDrawArcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawArcNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArc_0200
     * @tc.desc   test for testCanvasDrawArcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArc_0300
     * @tc.desc   test for testCanvasDrawArcAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArc_0400
     * @tc.desc   test for testCanvasDrawArcMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawArcInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawArc_0500
     * @tc.desc   test for testCanvasDrawArcInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawArcInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawArc(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRoundRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRoundRect_0100
     * @tc.desc   test for testCanvasDrawRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawRoundRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRoundRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRoundRect_0200
     * @tc.desc   test for testCanvasDrawRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRoundRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRoundRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRoundRect_0300
     * @tc.desc   test for testCanvasDrawRoundRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRoundRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRoundRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRoundRect_0400
     * @tc.desc   test for testCanvasDrawRoundRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRoundRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawRoundRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawRoundRect_0500
     * @tc.desc   test for testCanvasDrawRoundRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawRoundRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRoundRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 DrawTextBlob related test cases
    /**
     * @tc.name   testCanvasDrawTextBlobNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawTextBlob_0100
     * @tc.desc   test for testCanvasDrawTextBlobNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasDrawTextBlobNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawTextBlobNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawTextBlob_0200
     * @tc.desc   test for testCanvasDrawTextBlobNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawTextBlobNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawTextBlobAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawTextBlob_0300
     * @tc.desc   test for testCanvasDrawTextBlobAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawTextBlobAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawTextBlobMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawTextBlob_0400
     * @tc.desc   test for testCanvasDrawTextBlobMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawTextBlobMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasDrawTextBlobInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasDrawTextBlob_0500
     * @tc.desc   test for testCanvasDrawTextBlobInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasDrawTextBlobInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawTextBlob(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 ClipRect related test cases
    /**
     * @tc.name   testCanvasClipRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRect_0100
     * @tc.desc   test for testCanvasClipRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRect_0200
     * @tc.desc   test for testCanvasClipRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRect_0300
     * @tc.desc   test for testCanvasClipRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRect_0400
     * @tc.desc   test for testCanvasClipRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRect_0500
     * @tc.desc   test for testCanvasClipRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRect(4);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 ClipRoundRect related test cases
    /**
     * @tc.name   testCanvasClipRoundRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRoundRect_0100
     * @tc.desc   test for testCanvasClipRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipRoundRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRoundRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRoundRect_0200
     * @tc.desc   test for testCanvasClipRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRoundRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRoundRectAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRoundRect_0300
     * @tc.desc   test for testCanvasClipRoundRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRoundRectAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRoundRectMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRoundRect_0400
     * @tc.desc   test for testCanvasClipRoundRectMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRoundRectMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipRoundRectInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipRoundRect_0500
     * @tc.desc   test for testCanvasClipRoundRectInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipRoundRectInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipRoundRect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipPathNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipPath_0100
     * @tc.desc   test for testCanvasClipPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasClipPathNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipPathNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipPath_0200
     * @tc.desc   test for testCanvasClipPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipPathNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasClipPathInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasClipPath_0300
     * @tc.desc   test for testCanvasClipPathInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasClipPathInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasClipPath(2);
      expect(result).assertEqual(0);
    })

    // Canvas Part3 Rotate related test cases
    /**
     * @tc.name   testCanvasRotateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0100
     * @tc.desc   test for testCanvasRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasRotateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasRotate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRotateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0200
     * @tc.desc   test for testCanvasRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRotateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRotateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0300
     * @tc.desc   test for testCanvasRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRotateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRotateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0400
     * @tc.desc   test for testCanvasRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRotateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRotateInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0500
     * @tc.desc   test for testCanvasRotateInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRotateInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasRotateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasRotate_0600
     * @tc.desc   test for testCanvasRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasRotateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasRotate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0100
     * @tc.desc   test for testCanvasTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasTranslateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0200
     * @tc.desc   test for testCanvasTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasTranslateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0300
     * @tc.desc   test for testCanvasTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasTranslateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0400
     * @tc.desc   test for testCanvasTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasTranslateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0500
     * @tc.desc   test for testCanvasTranslateInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasTranslateInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasTranslateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasTranslate_0600
     * @tc.desc   test for testCanvasTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasTranslateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasTranslate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0100
     * @tc.desc   test for testCanvasScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testCanvasScaleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasScale(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0200
     * @tc.desc   test for testCanvasScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasScaleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0300
     * @tc.desc   test for testCanvasScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasScaleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0400
     * @tc.desc   test for testCanvasScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasScaleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleInputDestroyed
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0500
     * @tc.desc   test for testCanvasScaleInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasScaleInputDestroyed', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testCanvasScaleMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingCanvasScale_0600
     * @tc.desc   test for testCanvasScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testCanvasScaleMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasScale(5);
      expect(result).assertEqual(0);
    })
  })
}