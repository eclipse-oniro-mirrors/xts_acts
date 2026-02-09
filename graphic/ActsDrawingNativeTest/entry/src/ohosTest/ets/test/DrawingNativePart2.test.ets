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


export default function ActsNewDrawingNativeTestPart2() {
  describe('ActsNewDrawingNativeTestPart2', () => {
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


    // Path Relative related test cases (20 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03100
     * @tc.desc   test for TestPathRMoveToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03200
     * @tc.desc   test for TestPathRMoveToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03300
     * @tc.desc   test for TestPathRMoveToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03400
     * @tc.desc   test for TestPathRMoveToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03500
     * @tc.desc   test for TestPathRLineToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03600
     * @tc.desc   test for TestPathRLineToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03700
     * @tc.desc   test for TestPathRLineToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03800
     * @tc.desc   test for TestPathRLineToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03900
     * @tc.desc   test for TestPathRQuadToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04000
     * @tc.desc   test for TestPathRQuadToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04100
     * @tc.desc   test for TestPathRQuadToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04200
     * @tc.desc   test for TestPathRQuadToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04300
     * @tc.desc   test for TestPathRConicToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04400
     * @tc.desc   test for TestPathRConicToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04500
     * @tc.desc   test for TestPathRConicToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04600
     * @tc.desc   test for TestPathRConicToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04700
     * @tc.desc   test for TestPathRCubicToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathRelative(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04800
     * @tc.desc   test for TestPathRCubicToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04900
     * @tc.desc   test for TestPathRCubicToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_04900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05000
     * @tc.desc   test for TestPathRCubicToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathRelative(19);
      expect(result).assertEqual(0);
    })

    // Path Add Shape related test cases (14 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05100
     * @tc.desc   test for TestPathAddRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05200
     * @tc.desc   test for TestPathAddRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05300
     * @tc.desc   test for TestPathAddRectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05400
     * @tc.desc   test for TestPathAddRectMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05500
     * @tc.desc   test for TestPathAddRectWithInitialCornerNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05600
     * @tc.desc   test for TestPathAddRectWithInitialCornerNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05700
     * @tc.desc   test for TestPathAddRectWithInitialCornerAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05800
     * @tc.desc   test for TestPathAddRectWithInitialCornerMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05900
     * @tc.desc   test for TestPathAddRoundRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_05900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06000
     * @tc.desc   test for TestPathAddRoundRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06100
     * @tc.desc   test for TestPathAddOvalWithInitialPointNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathAddShape(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06200
     * @tc.desc   test for TestPathAddOvalWithInitialPointNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06300
     * @tc.desc   test for TestPathAddOvalWithInitialPointAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06400
     * @tc.desc   test for TestPathAddOvalWithInitialPointMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_06400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathAddShape(13);
      expect(result).assertEqual(0);
    })

    // Path Part2 Add related test cases (25 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10100
     * @tc.desc   test for TestPathAddArcNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10200
     * @tc.desc   test for TestPathAddArcNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10300
     * @tc.desc   test for TestPathAddArcAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10400
     * @tc.desc   test for TestPathAddArcMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10500
     * @tc.desc   test for TestPathAddPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10600
     * @tc.desc   test for TestPathAddPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10700
     * @tc.desc   test for TestPathAddPathWithMatrixAndModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10800
     * @tc.desc   test for TestPathAddPathWithMatrixAndModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10900
     * @tc.desc   test for TestPathAddPathWithModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_10900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11000
     * @tc.desc   test for TestPathAddPathWithModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11100
     * @tc.desc   test for TestPathAddPathWithOffsetAndModeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11200
     * @tc.desc   test for TestPathAddPathWithOffsetAndModeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11300
     * @tc.desc   test for TestPathAddPathWithOffsetAndModeAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11400
     * @tc.desc   test for TestPathAddPathWithOffsetAndModeMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11500
     * @tc.desc   test for TestPathAddOvalNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11600
     * @tc.desc   test for TestPathAddOvalNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11700
     * @tc.desc   test for TestPathAddPolygonNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11800
     * @tc.desc   test for TestPathAddPolygonNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11900
     * @tc.desc   test for TestPathAddPolygonNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_11900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12100
     * @tc.desc   test for TestPathAddPolygonAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12200
     * @tc.desc   test for TestPathAddPolygonMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12300
     * @tc.desc   test for TestPathAddCircleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Add(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12400
     * @tc.desc   test for TestPathAddCircleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12500
     * @tc.desc   test for TestPathAddCircleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12600
     * @tc.desc   test for TestPathAddCircleMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Add(24);
      expect(result).assertEqual(0);
    })

    // Path Part2 Transform related test cases (11 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12700
     * @tc.desc   test for TestPathBuildFromSvgStringNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12800
     * @tc.desc   test for TestPathBuildFromSvgStringNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12900
     * @tc.desc   test for TestPathContainsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_12900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13100
     * @tc.desc   test for TestPathContainsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13200
     * @tc.desc   test for TestPathContainsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13300
     * @tc.desc   test for TestPathContainsMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13400
     * @tc.desc   test for TestPathTransformNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13500
     * @tc.desc   test for TestPathTransformNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13600
     * @tc.desc   test for TestPathTransformWithPerspectiveClipNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13700
     * @tc.desc   test for TestPathTransformWithPerspectiveClipNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13800
     * @tc.desc   test for TestPathTransformWithPerspectiveClipNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2Transform(10);
      expect(result).assertEqual(0);
    })

    // Path Part2 Get/Set related test cases (17 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13900
     * @tc.desc   test for TestPathSetFillTypeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_13900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14100
     * @tc.desc   test for TestPathSetFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14200
     * @tc.desc   test for TestPathSetFillTypeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14300
     * @tc.desc   test for TestPathGetLengthNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14400
     * @tc.desc   test for TestPathGetLengthNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14500
     * @tc.desc   test for TestPathGetLengthNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14600
     * @tc.desc   test for TestPathGetBoundsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14700
     * @tc.desc   test for TestPathGetBoundsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14800
     * @tc.desc   test for TestPathCloseNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14900
     * @tc.desc   test for TestPathCloseNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_14900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15100
     * @tc.desc   test for TestPathOffsetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15200
     * @tc.desc   test for TestPathOffsetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15300
     * @tc.desc   test for TestPathOffsetAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_15300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_020000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_020000
     * @tc.desc   test for TestPathOffsetMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_020000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20100
     * @tc.desc   test for TestPathResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20200
     * @tc.desc   test for TestPathResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20300
     * @tc.desc   test for TestPathResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart2GetSet(16);
      expect(result).assertEqual(0);
    })

    // Path Part3 Query related test cases (12 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20400
     * @tc.desc   test for TestPathIsClosedNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20500
     * @tc.desc   test for TestPathIsClosedNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20600
     * @tc.desc   test for TestPathIsClosedNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22600
     * @tc.desc   test for TestPathIsEmptyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22700
     * @tc.desc   test for TestPathIsEmptyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22800
     * @tc.desc   test for TestPathIsEmptyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22900
     * @tc.desc   test for TestPathIsRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23000
     * @tc.desc   test for TestPathIsRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23100
     * @tc.desc   test for TestPathIsRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23400
     * @tc.desc   test for TestPathGetFillTypeNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Query(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23500
     * @tc.desc   test for TestPathGetFillTypeNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23600
     * @tc.desc   test for TestPathGetFillTypeMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Query(11);
      expect(result).assertEqual(0);
    })

    // Path Part3 Transform related test cases (16 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20700
     * @tc.desc   test for TestPathGetPositionTangentNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20800
     * @tc.desc   test for TestPathGetPositionTangentNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20900
     * @tc.desc   test for TestPathGetPositionTangentNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_20900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21000
     * @tc.desc   test for TestPathGetPositionTangentAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21100
     * @tc.desc   test for TestPathGetPositionTangentMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21200
     * @tc.desc   test for TestPathOpNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21300
     * @tc.desc   test for TestPathOpNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21400
     * @tc.desc   test for TestPathGetMatrixNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21500
     * @tc.desc   test for TestPathGetMatrixNormal2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21600
     * @tc.desc   test for TestPathGetMatrixNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21700
     * @tc.desc   test for TestPathGetMatrixAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21800
     * @tc.desc   test for TestPathGetMatrixMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21900
     * @tc.desc   test for TestPathGetSegmentNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_21900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22000
     * @tc.desc   test for TestPathGetSegmentNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22100
     * @tc.desc   test for TestPathGetSegmentAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22200
     * @tc.desc   test for TestPathGetSegmentMultiplies.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Transform(15);
      expect(result).assertEqual(0);
    })

    // Path Part3 Advanced related test cases (14 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22300
     * @tc.desc   test for TestPathSetPathNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22400
     * @tc.desc   test for TestPathSetPathNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22500
     * @tc.desc   test for TestPathSetPathMulptiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_22500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23700
     * @tc.desc   test for TestPathApproximateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23800
     * @tc.desc   test for TestPathApproximateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23900
     * @tc.desc   test for TestPathApproximateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_23900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24000
     * @tc.desc   test for TestPathApproximateMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24100
     * @tc.desc   test for TestPathInterpolateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24200
     * @tc.desc   test for TestPathInterpolateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24300
     * @tc.desc   test for TestPathInterpolateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24400
     * @tc.desc   test for TestPathInterpolateMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24500
     * @tc.desc   test for TestPathIsInterpolateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24600
     * @tc.desc   test for TestPathIsInterpolateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24700
     * @tc.desc   test for TestPathIsInterpolateMultiCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_24700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(13);
      expect(result).assertEqual(0);
    })


  })
}