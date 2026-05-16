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


export default function ActsNewDrawingNativeTestPart10() {
  describe('ActsNewDrawingNativeTestPart10', () => {
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

    // Lattice related test cases
    /**
     * @tc.name   SUB_Drawing_Lattice_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0100
     * @tc.desc   test for TestLatticeCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Lattice_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingLattice(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0101
     * @tc.desc   test for TestLatticeCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Lattice_0002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0102
     * @tc.desc   test for TestLatticeCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Lattice_0003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0103
     * @tc.desc   test for TestLatticeCreateEnumTraversal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Lattice_0004', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0104
     * @tc.desc   test for TestLatticeCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Lattice_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0200
     * @tc.desc   test for TestLatticeDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_Lattice_0006', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingLattice(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_Lattice_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_Lattice_0201
     * @tc.desc   test for TestLatticeDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_Lattice_0007', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingLattice(6);
      expect(result).assertEqual(0);
    })

    // Path Iterator related test cases
    /**
     * @tc.name   SUB_Drawing_PathIterator_0001
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATORITERATOR_0100
     * @tc.desc   test for testPathIteratorCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0001', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0002
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0101
     * @tc.desc   test for testPathIteratorCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathIterator_0002', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0003
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0102
     * @tc.desc   test for testPathIteratorCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathIterator_0003', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0004
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0200
     * @tc.desc   test for testPathIteratorDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0004', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0005
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0201
     * @tc.desc   test for testPathIteratorDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathIterator_0005', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0006
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0300
     * @tc.desc   test for testPathIteratorHasNextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0006', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0007
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0301
     * @tc.desc   test for testPathIteratorHasNextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathIterator_0007', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0008
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0400
     * @tc.desc   test for testPathIteratorNextNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0008', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0009
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0401
     * @tc.desc   test for testPathIteratorNextNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Drawing_PathIterator_0009', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathIterator(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0010
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0500
     * @tc.desc   test for testPathIteratorPeekNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0010', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Drawing_PathIterator_0011
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATHITERATOR_0501
     * @tc.desc   test for testPathIteratorPeekNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Drawing_PathIterator_0011', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathIterator(10);
      expect(result).assertEqual(0);
    })

    // Canvas Part5 DrawPixelMapMesh related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20300
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20400
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull01.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20500
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull02.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20600
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull03.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20700
     * @tc.desc   test for TestCanvasDrawPixelMapMeshNull04.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20800
     * @tc.desc   test for TestCanvasDrawPixelMapMeshBindAndUnbind.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20900
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal01.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_20900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21000
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal02.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21100
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal03.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21200
     * @tc.desc   test for TestCanvasDrawPixelMapMeshAbnormal04.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21300
     * @tc.desc   test for TestCanvasDrawPixelMapMeshMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_CANVAS_21300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawPixelMapMesh(10);
      expect(result).assertEqual(0);
    })

    // Path Part4 InverseFillType related test cases (8 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_4900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_4900
     * @tc.desc   test for TestPathIsInverseFillTypeNormalOne.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_4900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5000
     * @tc.desc   test for TestPathIsInverseFillTypeNormalTwo.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5100
     * @tc.desc   test for TestPathIsInverseFillTypeNormalThree.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5200
     * @tc.desc   test for TestPathIsInverseFillTypeNormalFour.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5300
     * @tc.desc   test for TestPathIsInverseFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5400
     * @tc.desc   test for TestPathToggleInverseFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5500
     * @tc.desc   test for TestPathIsInverseFillTypeCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5600
     * @tc.desc   test for TestPathToggleInverseFillTypeCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_5600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(7);
      expect(result).assertEqual(0);
    })
  //
  //   // Rect Part2 Inset/Contains/SetEmpty/IsEmpty/Offset/OffsetTo/Sort/Union related test cases (27 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3900
     * @tc.desc   test for TestRectInsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_3900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4000
     * @tc.desc   test for TestRectInsetAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4100
     * @tc.desc   test for TestRectInsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4200
     * @tc.desc   test for TestRectInsetCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4300
     * @tc.desc   test for TestRectContainsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4400
     * @tc.desc   test for TestRectContainsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4500
     * @tc.desc   test for TestRectContainsCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4600
     * @tc.desc   test for TestRectSetEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4700
     * @tc.desc   test for TestRectSetEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4800
     * @tc.desc   test for TestRectSetEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4900
     * @tc.desc   test for TestRectIsEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_4900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5000
     * @tc.desc   test for TestRectIsEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5100
     * @tc.desc   test for TestRectIsEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5200
     * @tc.desc   test for TestRectOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5300
     * @tc.desc   test for TestRectOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5400
     * @tc.desc   test for TestRectOffsetAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5500
     * @tc.desc   test for TestRectOffsetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5600
     * @tc.desc   test for TestRectOffsetToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5700
     * @tc.desc   test for TestRectOffsetToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5800
     * @tc.desc   test for TestRectOffsetToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5900
     * @tc.desc   test for TestRectOffsetToMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_5900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6000
     * @tc.desc   test for TestRectSortNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6100
     * @tc.desc   test for TestRectSortNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6200
     * @tc.desc   test for TestRectSortMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6300
     * @tc.desc   test for TestRectUnionNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6400
     * @tc.desc   test for TestRectUnionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6500
     * @tc.desc   test for TestRectUnionMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECT_6500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRectPart2OtherOperations(26);
      expect(result).assertEqual(0);
    })
  //
  //   // Region Part2 Empty/GetBoundary/GetBounds/IsComplex/IsEmpty/IsRect related test cases (18 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2400
     * @tc.desc   test for testRegionEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2500
     * @tc.desc   test for testRegionEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2600
     * @tc.desc   test for testRegionEmptyCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2700
     * @tc.desc   test for testRegionGetBoundaryNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2800
     * @tc.desc   test for testRegionGetBoundaryNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2900
     * @tc.desc   test for testRegionGetBoundaryMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3000
     * @tc.desc   test for testRegionGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3100
     * @tc.desc   test for testRegionGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3200
     * @tc.desc   test for testRegionGetBoundsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3300
     * @tc.desc   test for testRegionIsComplexNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3400
     * @tc.desc   test for testRegionIsComplexNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3500
     * @tc.desc   test for testRegionIsComplexMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3600
     * @tc.desc   test for testRegionIsEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3700
     * @tc.desc   test for testRegionIsEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3800
     * @tc.desc   test for testRegionIsEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3900
     * @tc.desc   test for testRegionIsRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_3900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4000
     * @tc.desc   test for testRegionIsRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4100
     * @tc.desc   test for testRegionIsRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionPart2QueryOperations(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600
     * @tc.desc   test for TestTypefaceIsBoldNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700
     * @tc.desc   test for TestTypefaceIsBoldNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800
     * @tc.desc   test for TestTypefaceIsBoldMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900
     * @tc.desc   test for TestTypefaceIsItalicNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000
     * @tc.desc   test for TestTypefaceIsItalicNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100
     * @tc.desc   test for TestTypefaceIsItalicMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_TYPEFACE_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingTypefaceIsBoldItalic(5);
      expect(result).assertEqual(0);
    })

  // // Matrix Part3 related test cases
  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100
   * @tc.desc   test for TestMatrixPerConcatNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10100', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(0);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10200
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10200
   * @tc.desc   test for TestMatrixPerConcatNull1.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10200', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(1);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300
   * @tc.desc   test for TestMatrixPerConcatNull2.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10300', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(2);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400
   * @tc.desc   test for TestMatrixPerConcatCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10400', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(3);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500
   * @tc.desc   test for TestMatrixIsAffineNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10500', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(4);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600
   * @tc.desc   test for TestMatrixIsAffineNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10600', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(5);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700
   * @tc.desc   test for TestMatrixIsAffineMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10700', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(6);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800
   * @tc.desc   test for TestMatrixPreSkewNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10800', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(7);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900
   * @tc.desc   test for TestMatrixPreSkewNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_10900', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(8);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000
   * @tc.desc   test for TestMatrixPreSkewMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11000', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(9);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100
   * @tc.desc   test for TestMatrixRectStaysRectNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11100', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(10);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200
   * @tc.desc   test for TestMatrixRectStaysRectNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11200', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(11);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300
   * @tc.desc   test for TestMatrixRectStaysRectMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11300', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(12);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400
   * @tc.desc   test for TestMatrixSetSinCosNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11400', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingMatrixPart3(13);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500
   * @tc.desc   test for TestMatrixSetSinCosNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11500', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(14);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600
   * @tc.desc   test for TestMatrixSetSinCosMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MATRIX_11600', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingMatrixPart3(15);
    expect(result).assertEqual(0);
  })
  // // Region Basic Operations related test cases
  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5000
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5000
   * @tc.desc   test for testRegionTranslateNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5000', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(8);
    expect(result).assertEqual(0);
  })
  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5100
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5100
   * @tc.desc   test for testRegionTranslateNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5100', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(9);
    expect(result).assertEqual(0);
  })
  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5200
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5200
   * @tc.desc   test for testRegionTranslateMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_5200', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(10);
    expect(result).assertEqual(0);
  })
  // Region Advanced Operations related test cases
  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4200
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4200
   * @tc.desc   test for testRegionQuickContainsNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4200', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(0);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4300
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4300
   * @tc.desc   test for testRegionQuickContainsNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4300', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(1);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4400
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4400
   * @tc.desc   test for testRegionQuickContainsAbnormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4400', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(2);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4500
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4500
   * @tc.desc   test for testRegionQuickContainsMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4500', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(3);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4600
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4600
   * @tc.desc   test for testRegionQuickRejectNormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4600', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(4);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4700
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4700
   * @tc.desc   test for testRegionQuickRejectNull.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4700', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(5);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4800
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4800
   * @tc.desc   test for testRegionQuickRejectAbnormal.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL0
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4800', Level.LEVEL0, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(6);
    expect(result).assertEqual(0);
  })

  /**
   * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4900
   * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4900
   * @tc.desc   test for testRegionQuickRejectMultipleCalls.
   * @tc.type   FUNCTION
   * @tc.size   SMALLTEST
   * @tc.level  LEVEL3
   */
  it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_4900', Level.LEVEL3, () => {
    const result = libDrawingNative.DrawingRegionAdvancedOperations(7);
    expect(result).assertEqual(0);
  })
  })
}
